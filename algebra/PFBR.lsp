
(/VERSIONCHECK 2) 

(DEFUN |PFBR;hensel| (|pp| |vv| |r| |factors| $)
  (PROG (|n| |totdegree| #1=#:G206 #2=#:G205 #3=#:G207 #4=#:G209 #5=#:G208
         #6=#:G210 #7=#:G230 |u| #8=#:G229 |u1| #9=#:G218 |foundFactors|
         |origFactors| |proddegree| #10=#:G199 #11=#:G198 #12=#:G200 #13=#:G228
         |pp1| #14=#:G226 |a| #15=#:G227 |c| #16=#:G224 #17=#:G225 |b|
         #18=#:G223 |step| |Ecart| #19=#:G188 #20=#:G187 #21=#:G189 #22=#:G222
         #23=#:G127 |pn| |prime| #24=#:G158 #25=#:G157 #26=#:G159 #27=#:G221
         #28=#:G220 |f| #29=#:G219)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |origFactors|
              (PROGN
               (LETT #29# NIL . #30=(|PFBR;hensel|))
               (SEQ (LETT |f| NIL . #30#) (LETT #28# |factors| . #30#) G190
                    (COND
                     ((OR (ATOM #28#) (PROGN (LETT |f| (CAR #28#) . #30#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #29#
                            (CONS
                             (SPADCALL
                              (CONS #'|PFBR;hensel!0| (VECTOR $ |r| |vv|)) |f|
                              (QREFELT $ 13))
                             #29#)
                            . #30#)))
                    (LETT #28# (CDR #28#) . #30#) (GO G190) G191
                    (EXIT (NREVERSE #29#))))
              . #30#)
        (LETT |totdegree| 0 . #30#)
        (LETT |proddegree|
              (PROGN
               (LETT #24# NIL . #30#)
               (SEQ (LETT |u| NIL . #30#)
                    (LETT #27# (SPADCALL |pp| (QREFELT $ 15)) . #30#) G190
                    (COND
                     ((OR (ATOM #27#) (PROGN (LETT |u| (CAR #27#) . #30#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #26# (SPADCALL |u| |vv| (QREFELT $ 17)) . #30#)
                       (COND (#24# (LETT #25# (MAX #25# #26#) . #30#))
                             ('T
                              (PROGN
                               (LETT #25# #26# . #30#)
                               (LETT #24# 'T . #30#)))))))
                    (LETT #27# (CDR #27#) . #30#) (GO G190) G191 (EXIT NIL))
               (COND (#24# #25#) ('T (|IdentityError| '|max|))))
              . #30#)
        (LETT |n| 1 . #30#)
        (LETT |prime|
              (SPADCALL (SPADCALL |vv| (QREFELT $ 18))
                        (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 20))
              . #30#)
        (LETT |foundFactors| NIL . #30#)
        (SEQ G190
             (COND
              ((NULL (SPADCALL |totdegree| |proddegree| (QREFELT $ 23)))
               (GO G191)))
             (SEQ (LETT |pn| (SPADCALL |prime| |n| (QREFELT $ 25)) . #30#)
                  (LETT |Ecart|
                        (SPADCALL
                         (SPADCALL |pp|
                                   (PROGN
                                    (LETT #19# NIL . #30#)
                                    (SEQ (LETT #23# NIL . #30#)
                                         (LETT #22# |factors| . #30#) G190
                                         (COND
                                          ((OR (ATOM #22#)
                                               (PROGN
                                                (LETT #23# (CAR #22#) . #30#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #21# #23# . #30#)
                                            (COND
                                             (#19#
                                              (LETT #20#
                                                    (SPADCALL #20# #21#
                                                              (QREFELT $ 26))
                                                    . #30#))
                                             ('T
                                              (PROGN
                                               (LETT #20# #21# . #30#)
                                               (LETT #19# 'T . #30#)))))))
                                         (LETT #22# (CDR #22#) . #30#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#19# #20#)
                                          ('T (|spadConstant| $ 27))))
                                   (QREFELT $ 28))
                         |pn| (QREFELT $ 30))
                        . #30#)
                  (EXIT
                   (COND
                    ((QEQCAR |Ecart| 1)
                     (|error| "failed lifting in hensel in PFBR"))
                    ((SPADCALL (QCDR |Ecart|) (QREFELT $ 31))
                     (PROGN
                      (LETT #9#
                            (CONS 0 (LIST (APPEND |foundFactors| |factors|)))
                            . #30#)
                      (GO #9#)))
                    ('T
                     (SEQ
                      (LETT |step|
                            (SPADCALL |origFactors|
                                      (SPADCALL
                                       (CONS #'|PFBR;hensel!1|
                                             (VECTOR $ |r| |vv|))
                                       (QCDR |Ecart|) (QREFELT $ 13))
                                      (QREFELT $ 35))
                            . #30#)
                      (EXIT
                       (COND
                        ((QEQCAR |step| 1)
                         (PROGN (LETT #9# (CONS 1 "failed") . #30#) (GO #9#)))
                        ('T
                         (SEQ
                          (LETT |factors|
                                (PROGN
                                 (LETT #18# NIL . #30#)
                                 (SEQ (LETT |b| NIL . #30#)
                                      (LETT #17# (QCDR |step|) . #30#)
                                      (LETT |a| NIL . #30#)
                                      (LETT #16# |factors| . #30#) G190
                                      (COND
                                       ((OR (ATOM #16#)
                                            (PROGN
                                             (LETT |a| (CAR #16#) . #30#)
                                             NIL)
                                            (ATOM #17#)
                                            (PROGN
                                             (LETT |b| (CAR #17#) . #30#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #18#
                                              (CONS
                                               (SPADCALL |a|
                                                         (SPADCALL |b| |pn|
                                                                   (QREFELT $
                                                                            36))
                                                         (QREFELT $ 37))
                                               #18#)
                                              . #30#)))
                                      (LETT #16#
                                            (PROG1 (CDR #16#)
                                              (LETT #17# (CDR #17#) . #30#))
                                            . #30#)
                                      (GO G190) G191 (EXIT (NREVERSE #18#))))
                                . #30#)
                          (SEQ (LETT |c| NIL . #30#)
                               (LETT #15# |origFactors| . #30#)
                               (LETT |a| NIL . #30#)
                               (LETT #14# |factors| . #30#) G190
                               (COND
                                ((OR (ATOM #14#)
                                     (PROGN (LETT |a| (CAR #14#) . #30#) NIL)
                                     (ATOM #15#)
                                     (PROGN (LETT |c| (CAR #15#) . #30#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |pp1| (SPADCALL |pp| |a| (QREFELT $ 38))
                                      . #30#)
                                (EXIT
                                 (COND ((QEQCAR |pp1| 1) "next")
                                       ('T
                                        (SEQ (LETT |pp| (QCDR |pp1|) . #30#)
                                             (LETT |proddegree|
                                                   (- |proddegree|
                                                      (PROGN
                                                       (LETT #10# NIL . #30#)
                                                       (SEQ
                                                        (LETT |u| NIL . #30#)
                                                        (LETT #13#
                                                              (SPADCALL |a|
                                                                        (QREFELT
                                                                         $ 15))
                                                              . #30#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #13#)
                                                              (PROGN
                                                               (LETT |u|
                                                                     (CAR #13#)
                                                                     . #30#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #12#
                                                                 (SPADCALL |u|
                                                                           |vv|
                                                                           (QREFELT
                                                                            $
                                                                            17))
                                                                 . #30#)
                                                           (COND
                                                            (#10#
                                                             (LETT #11#
                                                                   (MAX #11#
                                                                        #12#)
                                                                   . #30#))
                                                            ('T
                                                             (PROGN
                                                              (LETT #11# #12#
                                                                    . #30#)
                                                              (LETT #10# 'T
                                                                    . #30#)))))))
                                                        (LETT #13# (CDR #13#)
                                                              . #30#)
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                       (COND (#10# #11#)
                                                             ('T
                                                              (|IdentityError|
                                                               '|max|)))))
                                                   . #30#)
                                             (LETT |factors|
                                                   (SPADCALL |a| |factors|
                                                             (QREFELT $ 40))
                                                   . #30#)
                                             (LETT |origFactors|
                                                   (SPADCALL |c| |origFactors|
                                                             (QREFELT $ 40))
                                                   . #30#)
                                             (EXIT
                                              (LETT |foundFactors|
                                                    (CONS |a| |foundFactors|)
                                                    . #30#)))))))
                               (LETT #14#
                                     (PROG1 (CDR #14#)
                                       (LETT #15# (CDR #15#) . #30#))
                                     . #30#)
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
                                    . #30#)
                              (GO #9#)))
                            ('T
                             (SEQ
                              (LETT |totdegree|
                                    (PROGN
                                     (LETT #1# NIL . #30#)
                                     (SEQ (LETT |u1| NIL . #30#)
                                          (LETT #8# |factors| . #30#) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |u1| (CAR #8#) . #30#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #3#
                                                   (PROGN
                                                    (LETT #4# NIL . #30#)
                                                    (SEQ (LETT |u| NIL . #30#)
                                                         (LETT #7#
                                                               (SPADCALL |u1|
                                                                         (QREFELT
                                                                          $
                                                                          15))
                                                               . #30#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #7#)
                                                               (PROGN
                                                                (LETT |u|
                                                                      (CAR #7#)
                                                                      . #30#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #6#
                                                                  (SPADCALL |u|
                                                                            |vv|
                                                                            (QREFELT
                                                                             $
                                                                             17))
                                                                  . #30#)
                                                            (COND
                                                             (#4#
                                                              (LETT #5#
                                                                    (MAX #5#
                                                                         #6#)
                                                                    . #30#))
                                                             ('T
                                                              (PROGN
                                                               (LETT #5# #6#
                                                                     . #30#)
                                                               (LETT #4# 'T
                                                                     . #30#)))))))
                                                         (LETT #7# (CDR #7#)
                                                               . #30#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                    (COND (#4# #5#)
                                                          ('T
                                                           (|IdentityError|
                                                            '|max|))))
                                                   . #30#)
                                             (COND
                                              (#1#
                                               (LETT #2# (+ #2# #3#) . #30#))
                                              ('T
                                               (PROGN
                                                (LETT #2# #3# . #30#)
                                                (LETT #1# 'T . #30#)))))))
                                          (LETT #8# (CDR #8#) . #30#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#1# #2#) ('T 0)))
                                    . #30#)
                              (EXIT (LETT |n| (+ |n| 1) . #30#)))))))))))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #9# (EXIT #9#))))) 

(DEFUN |PFBR;hensel!1| (|z1| $$)
  (PROG (|vv| |r| $)
    (LETT |vv| (QREFELT $$ 2) . #1=(|PFBR;hensel|))
    (LETT |r| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |vv| |r| (QREFELT $ 10)))))) 

(DEFUN |PFBR;hensel!0| (|z1| $$)
  (PROG (|vv| |r| $)
    (LETT |vv| (QREFELT $$ 2) . #1=(|PFBR;hensel|))
    (LETT |r| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |vv| |r| (QREFELT $ 10)))))) 

(DEFUN |PFBR;factorSFBRlcUnitInner| (|lvpp| |pp| |r| $)
  (PROG (#1=#:G258 |u| #2=#:G257 |hen| |factors| #3=#:G256 |uu| #4=#:G255
         |fSame| #5=#:G254 #6=#:G253 |fDown| |ppR|)
    (RETURN
     (SEQ
      (LETT |ppR|
            (SPADCALL
             (CONS #'|PFBR;factorSFBRlcUnitInner!0| (VECTOR |r| $ |lvpp|)) |pp|
             (QREFELT $ 13))
            . #7=(|PFBR;factorSFBRlcUnitInner|))
      (EXIT
       (COND
        ((OR (< (SPADCALL |ppR| (QREFELT $ 45)) (SPADCALL |pp| (QREFELT $ 45)))
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
                         (SPADCALL (SPADCALL (ELT $ 49) |ppR| (QREFELT $ 53))
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
                           (LETT #5# (CDR (SPADCALL |fDown| (QREFELT $ 61)))
                                 . #7#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #6#
                                   (CONS (|PFBR;raise| (QVELT |u| 1) $) #6#)
                                   . #7#)))
                           (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                           (EXIT (NREVERSE #6#))))))))
                 (#8='T
                  (SEQ
                   (LETT |fSame| (SPADCALL (CDR |lvpp|) |ppR| (QREFELT $ 64))
                         . #7#)
                   (EXIT
                    (CONS
                     (SPADCALL (SPADCALL |fSame| (QREFELT $ 65))
                               (QVELT
                                (|SPADfirst| (SPADCALL |fSame| (QREFELT $ 68)))
                                1)
                               (QREFELT $ 26))
                     (PROGN
                      (LETT #4# NIL . #7#)
                      (SEQ (LETT |uu| NIL . #7#)
                           (LETT #3# (CDR (SPADCALL |fSame| (QREFELT $ 68)))
                                 . #7#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |uu| (CAR #3#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT (LETT #4# (CONS (QVELT |uu| 1) #4#) . #7#)))
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
                    (|PFBR;hensel| |pp| (|SPADfirst| |lvpp|) |r| |factors| $)
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
                                                   (LETT |u| (CAR #1#) . #7#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (VECTOR (CONS 2 "irred")
                                                             |u| 1)
                                                     #2#)
                                                    . #7#)))
                                            (LETT #1# (CDR #1#) . #7#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #2#))))
                                      (QREFELT $ 69)))))))))))))))))) 

(DEFUN |PFBR;factorSFBRlcUnitInner!0| (|z1| $$)
  (PROG (|lvpp| $ |r|)
    (LETT |lvpp| (QREFELT $$ 2) . #1=(|PFBR;factorSFBRlcUnitInner|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |r| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| (SPADCALL |lvpp| (QREFELT $ 44)) |r| (QREFELT $ 10)))))) 

(DEFUN |PFBR;factorSFBRlcUnit;LSupF;3| (|lvpp| |pp| $)
  (PROG (#1=#:G266 |val| |val1| |tempAns|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |val| (|spadConstant| $ 70)
              . #2=(|PFBR;factorSFBRlcUnit;LSupF;3|))
        (EXIT
         (SEQ G190 (COND ((NULL 'T) (GO G191)))
              (SEQ
               (LETT |tempAns|
                     (|PFBR;factorSFBRlcUnitInner| |lvpp| |pp| |val| $) . #2#)
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
                 ('T (PROGN (LETT #1# (QCDR |tempAns|) . #2#) (GO #1#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PFBR;factorSFBRlcUnit;LSupF;4| (|lvpp| |pp| $)
  (PROG (#1=#:G270 |val| |tempAns|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |val| (SPADCALL (QREFELT $ 72))
              . #2=(|PFBR;factorSFBRlcUnit;LSupF;4|))
        (EXIT
         (SEQ G190 (COND ((NULL 'T) (GO G191)))
              (SEQ
               (LETT |tempAns|
                     (|PFBR;factorSFBRlcUnitInner| |lvpp| |pp| |val| $) . #2#)
               (EXIT
                (COND
                 ((QEQCAR |tempAns| 1)
                  (LETT |val| (SPADCALL (QREFELT $ 72)) . #2#))
                 ('T (PROGN (LETT #1# (QCDR |tempAns|) . #2#) (GO #1#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PFBR;randomR;R;5| ($) (SPADCALL (QREFELT $ 73))) 

(DEFUN |PFBR;randomR;R;6| ($) (SPADCALL (|random|) (QREFELT $ 74))) 

(DEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;7| (|lpolys| |pp| |v| $)
  (PROG (#1=#:G293 |w| #2=#:G292 |ans| |ppR| |lpolysR| #3=#:G291 |u| #4=#:G290)
    (RETURN
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
                          (CONS (SPADCALL (ELT $ 75) |u| (QREFELT $ 79)) #4#)
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
                     (SEQ (LETT |w| NIL . #5#) (LETT #1# (QCDR |ans|) . #5#)
                          G190
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
                          (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;7!0| (|z1| $$)
  (PROG (|v| $)
    (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;bivariateSLPEBR;LSupVarSetU;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 82)))))) 

(DEFUN |PFBR;bivariateSLPEBR;LSupVarSetU;8| (|lpolys| |pp| |v| $)
  (SPADCALL |lpolys| |pp| (QREFELT $ 89))) 

(DEFUN |PFBR;chooseFSQViableSubstitutions| (|lvpp| |pp| $)
  (PROG (#1=#:G305 |ppR| |substns| #2=#:G309 |v| #3=#:G308)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ G190 (COND ((NULL 'T) (GO G191)))
             (SEQ
              (LETT |substns|
                    (PROGN
                     (LETT #3# NIL . #4=(|PFBR;chooseFSQViableSubstitutions|))
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
                    ('T (PROGN (LETT #1# |$NoValue| . #4#) (GO #1#))))))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT (CONS |substns| |ppR|)))))) 

(DEFUN |PFBR;chooseFSQViableSubstitutions!0| (|z1| $$)
  (PROG (|lvpp| |substns| $)
    (LETT |lvpp| (QREFELT $$ 2) . #1=(|PFBR;chooseFSQViableSubstitutions|))
    (LETT |substns| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |z1| |lvpp| |substns| (QREFELT $ 92))
                (QREFELT $ 49)))))) 

(DEFUN |PFBR;chooseSLPEViableSubstitutions| (|lvpolys| |lpolys| |pp| $)
  (PROG (|ppR| #1=#:G327 |uu| #2=#:G322 #3=#:G319 #4=#:G318 #5=#:G320 #6=#:G336
         |v| |lpolysR| #7=#:G335 |u| #8=#:G334 #9=#:G313 #10=#:G312 #11=#:G314
         #12=#:G333 |substns| #13=#:G332 #14=#:G331)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ G190 (COND ((NULL 'T) (GO G191)))
             (SEQ
              (LETT |substns|
                    (PROGN
                     (LETT #14# NIL
                           . #15=(|PFBR;chooseSLPEViableSubstitutions|))
                     (SEQ (LETT |v| NIL . #15#) (LETT #13# |lvpolys| . #15#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |v| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14# (CONS (SPADCALL (QREFELT $ 72)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (EXIT
               (COND
                ((OR
                  (SPADCALL
                   (SPADCALL (SPADCALL |pp| (QREFELT $ 90)) |lvpolys| |substns|
                             (QREFELT $ 92))
                   (QREFELT $ 93))
                  (PROGN
                   (LETT #9# NIL . #15#)
                   (SEQ (LETT |u| NIL . #15#) (LETT #12# |lpolys| . #15#) G190
                        (COND
                         ((OR (ATOM #12#)
                              (PROGN (LETT |u| (CAR #12#) . #15#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #11#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |u| (QREFELT $ 90))
                                            |lvpolys| |substns| (QREFELT $ 92))
                                  (QREFELT $ 93))
                                 . #15#)
                           (COND
                            (#9# (LETT #10# (COND (#10# 'T) ('T #11#)) . #15#))
                            ('T
                             (PROGN
                              (LETT #10# #11# . #15#)
                              (LETT #9# 'T . #15#)))))))
                        (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#9# #10#) ('T 'NIL))))
                 "next")
                ('T
                 (SEQ
                  (LETT |lpolysR|
                        (PROGN
                         (LETT #8# NIL . #15#)
                         (SEQ (LETT |u| NIL . #15#) (LETT #7# |lpolys| . #15#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #15#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (SPADCALL
                                        (CONS
                                         #'|PFBR;chooseSLPEViableSubstitutions!0|
                                         (VECTOR $ |substns| |lvpolys|))
                                        |u| (QREFELT $ 53))
                                       #8#)
                                      . #15#)))
                              (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #15#)
                  (LETT |uu| |lpolysR| . #15#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL (COND ((NULL |uu|) 'NIL) ('T 'T))) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((PROGN
                              (LETT #3# NIL . #15#)
                              (SEQ (LETT |v| NIL . #15#)
                                   (LETT #6# (CDR |uu|) . #15#) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN
                                          (LETT |v| (CAR #6#) . #15#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #5#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|SPADfirst| |uu|) |v|
                                                        (QREFELT $ 95))
                                              (QREFELT $ 96))
                                             0 (QREFELT $ 48))
                                            . #15#)
                                      (COND
                                       (#3#
                                        (LETT #4# (COND (#4# 'T) ('T #5#))
                                              . #15#))
                                       ('T
                                        (PROGN
                                         (LETT #4# #5# . #15#)
                                         (LETT #3# 'T . #15#)))))))
                                   (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                                   (EXIT NIL))
                              (COND (#3# #4#) ('T 'NIL)))
                             (PROGN (LETT #2# |$NoValue| . #15#) (GO #2#)))
                            ('T (LETT |uu| (CDR |uu|) . #15#)))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #2# (EXIT #2#))
                  (COND ((NULL (NULL |uu|)) (EXIT "next")))
                  (EXIT (PROGN (LETT #1# |$NoValue| . #15#) (GO #1#))))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (LETT |ppR|
            (SPADCALL
             (CONS #'|PFBR;chooseSLPEViableSubstitutions!1|
                   (VECTOR $ |substns| |lvpolys|))
             |pp| (QREFELT $ 53))
            . #15#)
      (EXIT (VECTOR |substns| |lpolysR| |ppR|)))))) 

(DEFUN |PFBR;chooseSLPEViableSubstitutions!1| (|z1| $$)
  (PROG (|lvpolys| |substns| $)
    (LETT |lvpolys| (QREFELT $$ 2) . #1=(|PFBR;chooseSLPEViableSubstitutions|))
    (LETT |substns| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 92))
                (QREFELT $ 49)))))) 

(DEFUN |PFBR;chooseSLPEViableSubstitutions!0| (|z1| $$)
  (PROG (|lvpolys| |substns| $)
    (LETT |lvpolys| (QREFELT $$ 2) . #1=(|PFBR;chooseSLPEViableSubstitutions|))
    (LETT |substns| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |z1| |lvpolys| |substns| (QREFELT $ 92))
                (QREFELT $ 49)))))) 

(DEFUN |PFBR;raise| (|supR| $) (SPADCALL (ELT $ 19) |supR| (QREFELT $ 102))) 

(DEFUN |PFBR;lower| (|pp| $) (SPADCALL (ELT $ 49) |pp| (QREFELT $ 53))) 

(DEFUN |PFBR;SLPEBR| (|lpolys| |lvpolys| |pp| |lvpp| $)
  (PROG (|ansR| |cVS| #1=#:G378 |uu| #2=#:G377 #3=#:G366 |ppR| |lpolysR|
         #4=#:G376 |u| #5=#:G375 #6=#:G374 |pp1| #7=#:G373 |ans| #8=#:G371 |a|
         #9=#:G372 |a1| #10=#:G370 |d| |ans1| #11=#:G369 |m| #12=#:G368
         #13=#:G367 |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (NULL
           (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 103))
                 . #14=(|PFBR;SLPEBR|))))
         (SEQ (LETT |v| (|SPADfirst| |m|) . #14#)
              (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 104)) . #14#)
              (LETT |pp1|
                    (SPADCALL
                     (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                               (QREFELT $ 109))
                     (QREFELT $ 111))
                    . #14#)
              (LETT |ans|
                    (PROGN
                     (LETT #13# NIL . #14#)
                     (SEQ (LETT |u| NIL . #14#) (LETT #12# |lpolys| . #14#)
                          G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |u| (CAR #12#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13# (CONS (|spadConstant| $ 112) #13#)
                                  . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (SEQ (LETT |m| NIL . #14#)
                   (LETT #11# (NREVERSE (SPADCALL |pp1| (QREFELT $ 114)))
                         . #14#)
                   G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |m| (CAR #11#) . #14#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ans1|
                          (|PFBR;SLPEBR| |lpolys| |lvpolys|
                           (SPADCALL |m| (QREFELT $ 115)) |lvpp| $)
                          . #14#)
                    (EXIT
                     (COND
                      ((QEQCAR |ans1| 1)
                       (PROGN (LETT #3# (CONS 1 "failed") . #14#) (GO #3#)))
                      ('T
                       (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 116)) . #14#)
                            (EXIT
                             (LETT |ans|
                                   (PROGN
                                    (LETT #10# NIL . #14#)
                                    (SEQ (LETT |a1| NIL . #14#)
                                         (LETT #9# (QCDR |ans1|) . #14#)
                                         (LETT |a| NIL . #14#)
                                         (LETT #8# |ans| . #14#) G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |a| (CAR #8#) . #14#)
                                                NIL)
                                               (ATOM #9#)
                                               (PROGN
                                                (LETT |a1| (CAR #9#) . #14#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #10#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |a1| |d|
                                                             (QREFELT $ 117))
                                                   |a| (QREFELT $ 118))
                                                  #10#)
                                                 . #14#)))
                                         (LETT #8#
                                               (PROG1 (CDR #8#)
                                                 (LETT #9# (CDR #9#) . #14#))
                                               . #14#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #10#))))
                                   . #14#)))))))
                   (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS 0
                     (PROGN
                      (LETT #7# NIL . #14#)
                      (SEQ (LETT |pp1| NIL . #14#) (LETT #6# |ans| . #14#) G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |pp1| (CAR #6#) . #14#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #7#
                                   (CONS
                                    (SPADCALL
                                     (CONS #'|PFBR;SLPEBR!1| (VECTOR $ |v|))
                                     (SPADCALL |pp1| (QREFELT $ 111))
                                     (QREFELT $ 121))
                                    #7#)
                                   . #14#)))
                           (LETT #6# (CDR #6#) . #14#) (GO G190) G191
                           (EXIT (NREVERSE #7#))))))))
        ('T
         (COND
          ((NULL |lvpolys|)
           (SEQ
            (LETT |lpolysR|
                  (PROGN
                   (LETT #5# NIL . #14#)
                   (SEQ (LETT |u| NIL . #14#) (LETT #4# |lpolys| . #14#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |u| (CAR #4#) . #14#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5#
                                (CONS (SPADCALL (ELT $ 49) |u| (QREFELT $ 53))
                                      #5#)
                                . #14#)))
                        (LETT #4# (CDR #4#) . #14#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #14#)
            (LETT |ppR| (SPADCALL (ELT $ 49) |pp| (QREFELT $ 53)) . #14#)
            (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 122)) . #14#)
            (EXIT
             (COND
              ((QEQCAR |ansR| 1)
               (PROGN (LETT #3# (CONS 1 "failed") . #14#) (GO #3#)))
              (#15='T
               (CONS 0
                     (PROGN
                      (LETT #2# NIL . #14#)
                      (SEQ (LETT |uu| NIL . #14#)
                           (LETT #1# (QCDR |ansR|) . #14#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |uu| (CAR #1#) . #14#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (ELT $ 19) |uu| (QREFELT $ 102))
                                    #2#)
                                   . #14#)))
                           (LETT #1# (CDR #1#) . #14#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))))
          (#15#
           (SEQ
            (LETT |cVS|
                  (|PFBR;chooseSLPEViableSubstitutions| |lvpolys| |lpolys| |pp|
                   $)
                  . #14#)
            (LETT |ansR|
                  (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2) (QREFELT $ 122))
                  . #14#)
            (EXIT
             (COND ((QEQCAR |ansR| 1) (CONS 1 "failed"))
                   ((EQL (LENGTH |lvpolys|) 1)
                    (SPADCALL |lpolys| |pp| (|SPADfirst| |lvpolys|)
                              (QREFELT $ 87)))
                   (#15# (SPADCALL |lpolys| |pp| (QREFELT $ 89)))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |PFBR;SLPEBR!1| (|z1| $$)
  (PROG (|v| $)
    (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 81)))))) 

(DEFUN |PFBR;SLPEBR!0| (|z1| $$)
  (PROG (|v| $)
    (LETT |v| (QREFELT $$ 1) . #1=(|PFBR;SLPEBR|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 105)))))) 

(DEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|
       (|lpolys| |pp| $)
  (PROG (|lvpp| #1=#:G392 |z| #2=#:G391 |lvpolys| #3=#:G390 #4=#:G389 #5=#:G388
         |u| #6=#:G387 #7=#:G386 #8=#:G385)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pp| (|spadConstant| $ 124) (QREFELT $ 125))
        (CONS 0
              (PROGN
               (LETT #8# NIL
                     . #9=(|PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|))
               (SEQ (LETT |u| NIL . #9#) (LETT #7# |lpolys| . #9#) G190
                    (COND
                     ((OR (ATOM #7#) (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT (LETT #8# (CONS (|spadConstant| $ 124) #8#) . #9#)))
                    (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                    (EXIT (NREVERSE #8#))))))
       ('T
        (SEQ
         (LETT |lvpolys|
               (SPADCALL
                (SPADCALL
                 (PROGN
                  (LETT #6# NIL . #9#)
                  (SEQ (LETT |u| NIL . #9#) (LETT #5# |lpolys| . #9#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (SPADCALL
                                 (PROGN
                                  (LETT #4# NIL . #9#)
                                  (SEQ (LETT |z| NIL . #9#)
                                       (LETT #3# (SPADCALL |u| (QREFELT $ 15))
                                             . #9#)
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |z| (CAR #3#) . #9#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (SPADCALL |z| (QREFELT $ 126))
                                                #4#)
                                               . #9#)))
                                       (LETT #3# (CDR #3#) . #9#) (GO G190)
                                       G191 (EXIT (NREVERSE #4#))))
                                 (QREFELT $ 127))
                                #6#)
                               . #9#)))
                       (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 (QREFELT $ 127))
                (QREFELT $ 128))
               . #9#)
         (LETT |lvpp|
               (SPADCALL
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #9#)
                  (SEQ (LETT |z| NIL . #9#)
                       (LETT #1# (SPADCALL |pp| (QREFELT $ 15)) . #9#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |z| (QREFELT $ 126)) #2#)
                               . #9#)))
                       (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 127))
                (QREFELT $ 128))
               . #9#)
         (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $))))))))) 

(DEFUN |PFBR;factorByRecursion;SupF;15| (|pp| $)
  (PROG (#1=#:G397 |c| |lv| #2=#:G405 |z| #3=#:G404)
    (RETURN
     (SEQ
      (LETT |lv|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #3# NIL . #4=(|PFBR;factorByRecursion;SupF;15|))
               (SEQ (LETT |z| NIL . #4#)
                    (LETT #2# (SPADCALL |pp| (QREFELT $ 15)) . #4#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
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
                            (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 30)) . #4#)
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
                    (QREFELT $ 147))))))))))))))) 

(DEFUN |PFBR;factorSquareFreeByRecursion;SupF;16| (|pp| $)
  (PROG (#1=#:G455 |w| #2=#:G454 #3=#:G416 |factors| #4=#:G434 |lcppPow| |lc|
         #5=#:G453 #6=#:G452 #7=#:G432 #8=#:G429 OK |hen| #9=#:G451 |f|
         #10=#:G450 |lcpp1| |ppa| |sl| |lvppList| #11=#:G448 |u| #12=#:G449 |v|
         |ppAdjust| #13=#:G447 #14=#:G446 |lcpp0| |oldnfact| #15=#:G443 |nfact|
         |factorsR| |cVS| |lcpp| |lv| #16=#:G445 |z| #17=#:G444)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lv|
              (SPADCALL
               (SPADCALL
                (PROGN
                 (LETT #17# NIL
                       . #18=(|PFBR;factorSquareFreeByRecursion;SupF;16|))
                 (SEQ (LETT |z| NIL . #18#)
                      (LETT #16# (SPADCALL |pp| (QREFELT $ 15)) . #18#) G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |z| (CAR #16#) . #18#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #17# (CONS (SPADCALL |z| (QREFELT $ 126)) #17#)
                              . #18#)))
                      (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                (QREFELT $ 127))
               (QREFELT $ 128))
              . #18#)
        (EXIT
         (COND
          ((NULL |lv|)
           (SPADCALL (CONS (|function| |PFBR;raise|) $)
                     (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 130))
                     (QREFELT $ 133)))
          ((SPADCALL (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 90)) . #18#)
                     (QREFELT $ 135))
           (SPADCALL |lv| |pp| (QREFELT $ 64)))
          ('T
           (SEQ (LETT |oldnfact| 999999 . #18#)
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (LETT |cVS|
                              (|PFBR;chooseFSQViableSubstitutions| |lv| |pp| $)
                              . #18#)
                        (LETT |factorsR| (SPADCALL (QCDR |cVS|) (QREFELT $ 55))
                              . #18#)
                        (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 149))
                              . #18#)
                        (EXIT
                         (COND
                          ((EQL |nfact| 1)
                           (PROGN
                            (LETT #15#
                                  (SPADCALL (|spadConstant| $ 27)
                                            (LIST
                                             (VECTOR (CONS 2 "irred") |pp| 1))
                                            (QREFELT $ 69))
                                  . #18#)
                            (GO #15#)))
                          ((SPADCALL |nfact| |oldnfact| (QREFELT $ 48)) "next")
                          ('T
                           (SEQ (LETT |oldnfact| |nfact| . #18#)
                                (LETT |lcpp0|
                                      (SPADCALL |lcpp| |lv| (QCAR |cVS|)
                                                (QREFELT $ 92))
                                      . #18#)
                                (LETT |factors|
                                      (PROGN
                                       (LETT #14# NIL . #18#)
                                       (SEQ (LETT |u| NIL . #18#)
                                            (LETT #13#
                                                  (SPADCALL |factorsR|
                                                            (QREFELT $ 61))
                                                  . #18#)
                                            G190
                                            (COND
                                             ((OR (ATOM #13#)
                                                  (PROGN
                                                   (LETT |u| (CAR #13#) . #18#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #14#
                                                    (CONS
                                                     (SPADCALL
                                                      (PROG2
                                                          (LETT #3#
                                                                (SPADCALL
                                                                 |lcpp0|
                                                                 (SPADCALL
                                                                  (QVELT |u| 1)
                                                                  (QREFELT $
                                                                           150))
                                                                 (QREFELT $
                                                                          151))
                                                                . #18#)
                                                          (QCDR #3#)
                                                        (|check_union|
                                                         (QEQCAR #3# 0)
                                                         (QREFELT $ 9) #3#))
                                                      (|PFBR;raise|
                                                       (QVELT |u| 1) $)
                                                      (QREFELT $ 152))
                                                     #14#)
                                                    . #18#)))
                                            (LETT #13# (CDR #13#) . #18#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #14#))))
                                      . #18#)
                                (LETT |ppAdjust|
                                      (SPADCALL
                                       (LETT |lcppPow|
                                             (SPADCALL |lcpp|
                                                       (LENGTH (CDR |factors|))
                                                       (QREFELT $ 153))
                                             . #18#)
                                       |pp| (QREFELT $ 152))
                                      . #18#)
                                (LETT |lvppList| |lv| . #18#)
                                (LETT |sl| (QCAR |cVS|) . #18#)
                                (LETT OK 'T . #18#)
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |v| NIL . #18#)
                                       (LETT #12# (QCAR |cVS|) . #18#)
                                       (LETT |u| NIL . #18#)
                                       (LETT #11# |lv| . #18#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |u| (CAR #11#) . #18#)
                                              NIL)
                                             (ATOM #12#)
                                             (PROGN
                                              (LETT |v| (CAR #12#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |lvppList| (CDR |lvppList|)
                                              . #18#)
                                        (LETT |sl| (CDR |sl|) . #18#)
                                        (LETT |ppa|
                                              (SPADCALL
                                               (CONS
                                                #'|PFBR;factorSquareFreeByRecursion;SupF;16!0|
                                                (VECTOR $ |sl| |lvppList|))
                                               |ppAdjust| (QREFELT $ 13))
                                              . #18#)
                                        (LETT |lcpp1|
                                              (SPADCALL |lcpp| |lvppList| |sl|
                                                        (QREFELT $ 92))
                                              . #18#)
                                        (LETT |factors|
                                              (PROGN
                                               (LETT #10# NIL . #18#)
                                               (SEQ (LETT |f| NIL . #18#)
                                                    (LETT #9# |factors| . #18#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #9#)
                                                          (PROGN
                                                           (LETT |f| (CAR #9#)
                                                                 . #18#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #10#
                                                            (CONS
                                                             (SPADCALL
                                                              (SPADCALL |lcpp1|
                                                                        (SPADCALL
                                                                         |f|
                                                                         (QREFELT
                                                                          $
                                                                          45))
                                                                        (QREFELT
                                                                         $
                                                                         154))
                                                              (SPADCALL |f|
                                                                        (QREFELT
                                                                         $
                                                                         155))
                                                              (QREFELT $ 37))
                                                             #10#)
                                                            . #18#)))
                                                    (LETT #9# (CDR #9#) . #18#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #10#))))
                                              . #18#)
                                        (LETT |hen|
                                              (|PFBR;hensel| |ppa| |u| |v|
                                               |factors| $)
                                              . #18#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |hen| 1)
                                           (SEQ (LETT OK 'NIL . #18#)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #8# |$NoValue| . #18#)
                                                  (GO #8#)))))
                                          ('T
                                           (LETT |factors| (QCAR (QCDR |hen|))
                                                 . #18#)))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT #12# (CDR #12#) . #18#))
                                             . #18#)
                                       (GO G190) G191 (EXIT NIL)))
                                 #8# (EXIT #8#))
                                (EXIT
                                 (COND
                                  (OK
                                   (PROGN
                                    (LETT #7# |$NoValue| . #18#)
                                    (GO #7#))))))))))
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
                                      (LETT |lc| (SPADCALL |w| (QREFELT $ 134))
                                            . #18#)
                                      (LETT |lcppPow|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL |lcppPow| |lc|
                                                                (QREFELT $
                                                                         156))
                                                      . #18#)
                                                (QCDR #3#)
                                              (|check_union| (QEQCAR #3# 0)
                                                             (QREFELT $ 9)
                                                             #3#))
                                            . #18#)
                                      (EXIT
                                       (PROG2
                                           (LETT #4#
                                                 (SPADCALL |w| |lc|
                                                           (QREFELT $ 30))
                                                 . #18#)
                                           (QCDR #4#)
                                         (|check_union| (QEQCAR #4# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 9))
                                                        #4#))))
                                     #6#)
                                    . #18#)))
                            (LETT #5# (CDR #5#) . #18#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #18#)
                (COND
                 ((NULL (SPADCALL |lcppPow| (QREFELT $ 135)))
                  (EXIT
                   (|error| "internal error in factorSquareFreeByRecursion"))))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #3# (SPADCALL |lcppPow| (QREFELT $ 157)) . #18#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                   (QREFELT $ 142))
                  (PROGN
                   (LETT #2# NIL . #18#)
                   (SEQ (LETT |w| NIL . #18#) (LETT #1# |factors| . #18#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |w| (CAR #1#) . #18#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (VECTOR (CONS 2 "irred") |w| 1) #2#)
                                . #18#)))
                        (LETT #1# (CDR #1#) . #18#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 69)))))))))
      #15# (EXIT #15#))))) 

(DEFUN |PFBR;factorSquareFreeByRecursion;SupF;16!0| (|z| $$)
  (PROG (|lvppList| |sl| $)
    (LETT |lvppList| (QREFELT $$ 2)
          . #1=(|PFBR;factorSquareFreeByRecursion;SupF;16|))
    (LETT |sl| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z| |lvppList| |sl| (QREFELT $ 92)))))) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G456)
  (PROG ()
    (RETURN
     (PROG (#2=#:G457)
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
                    '|PolynomialFactorizationByRecursion|))))))))))) 

(DEFUN |PolynomialFactorizationByRecursion;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|PolynomialFactorizationByRecursion|))
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
                  (CONS (|dispatchFunction| |PFBR;factorSFBRlcUnit;LSupF;3|)
                        $)))
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
                  (CONS
                   (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;7|)
                   $)))
       ('T
        (QSETREFV $ 87
                  (CONS
                   (|dispatchFunction| |PFBR;bivariateSLPEBR;LSupVarSetU;8|)
                   $))))
      $)))) 

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
