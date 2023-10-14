
(/VERSIONCHECK 2) 

(DEFUN |PFBR;hensel| (|pp| |vv| |r| |factors| $)
  (PROG (|n| |totdegree| #1=#:G203 #2=#:G202 #3=#:G204 #4=#:G206 #5=#:G205
         #6=#:G207 #7=#:G225 |u| #8=#:G224 |u1| #9=#:G215 |foundFactors|
         |origFactors| |proddegree| #10=#:G196 #11=#:G195 #12=#:G197 #13=#:G223
         |pp1| #14=#:G221 |a| #15=#:G222 |c| #16=#:G219 #17=#:G220 |b|
         #18=#:G218 |step| |Ecart| #19=#:G185 #20=#:G184 #21=#:G186 #22=#:G217
         #23=#:G127 |pn| |prime| #24=#:G155 #25=#:G154 #26=#:G156 #27=#:G216)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |origFactors| |factors| . #28=(|PFBR;hensel|))
            (LETT |totdegree| 0 . #28#)
            (LETT |proddegree|
                  (PROGN
                   (LETT #24# NIL . #28#)
                   (SEQ (LETT |u| NIL . #28#)
                        (LETT #27# (SPADCALL |pp| (QREFELT $ 12)) . #28#) G190
                        (COND
                         ((OR (ATOM #27#)
                              (PROGN (LETT |u| (CAR #27#) . #28#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #26# (SPADCALL |u| |vv| (QREFELT $ 14))
                                 . #28#)
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
            (LETT |prime|
                  (SPADCALL (SPADCALL |vv| (QREFELT $ 15))
                            (SPADCALL |r| (QREFELT $ 16)) (QREFELT $ 17))
                  . #28#)
            (LETT |foundFactors| NIL . #28#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |totdegree| |proddegree| (QREFELT $ 20)))
                   (GO G191)))
                 (SEQ (LETT |pn| (SPADCALL |prime| |n| (QREFELT $ 22)) . #28#)
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
                                                    (LETT #23# (CAR #22#)
                                                          . #28#)
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
                                                                  (QREFELT $
                                                                           23))
                                                        . #28#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #20# #21# . #28#)
                                                   (LETT #19# 'T . #28#)))))))
                                             (LETT #22# (CDR #22#) . #28#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#19# #20#)
                                              ('T (|spadConstant| $ 24))))
                                       (QREFELT $ 25))
                             |pn| (QREFELT $ 27))
                            . #28#)
                      (EXIT
                       (COND
                        ((QEQCAR |Ecart| 1)
                         (|error| "failed lifting in hensel in PFBR"))
                        ((SPADCALL (QCDR |Ecart|) (QREFELT $ 28))
                         (PROGN
                          (LETT #9#
                                (CONS 0
                                      (LIST (APPEND |foundFactors| |factors|)))
                                . #28#)
                          (GO #9#)))
                        ('T
                         (SEQ
                          (LETT |step|
                                (SPADCALL |origFactors|
                                          (SPADCALL
                                           (CONS #'|PFBR;hensel!0|
                                                 (VECTOR $ |r| |vv|))
                                           (QCDR |Ecart|) (QREFELT $ 31))
                                          (QREFELT $ 35))
                                . #28#)
                          (EXIT
                           (COND
                            ((QEQCAR |step| 1)
                             (PROGN
                              (LETT #9# (CONS 1 "failed") . #28#)
                              (GO #9#)))
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
                                                                       (QREFELT
                                                                        $ 36))
                                                             (QREFELT $ 37))
                                                   #18#)
                                                  . #28#)))
                                          (LETT #16#
                                                (PROG1 (CDR #16#)
                                                  (LETT #17# (CDR #17#)
                                                        . #28#))
                                                . #28#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #18#))))
                                    . #28#)
                              (SEQ (LETT |c| NIL . #28#)
                                   (LETT #15# |origFactors| . #28#)
                                   (LETT |a| NIL . #28#)
                                   (LETT #14# |factors| . #28#) G190
                                   (COND
                                    ((OR (ATOM #14#)
                                         (PROGN
                                          (LETT |a| (CAR #14#) . #28#)
                                          NIL)
                                         (ATOM #15#)
                                         (PROGN
                                          (LETT |c| (CAR #15#) . #28#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |pp1|
                                          (SPADCALL |pp| |a| (QREFELT $ 38))
                                          . #28#)
                                    (EXIT
                                     (COND ((QEQCAR |pp1| 1) "next")
                                           ('T
                                            (SEQ
                                             (LETT |pp| (QCDR |pp1|) . #28#)
                                             (LETT |proddegree|
                                                   (- |proddegree|
                                                      (PROGN
                                                       (LETT #10# NIL . #28#)
                                                       (SEQ
                                                        (LETT |u| NIL . #28#)
                                                        (LETT #13#
                                                              (SPADCALL |a|
                                                                        (QREFELT
                                                                         $ 12))
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
                                                                           |vv|
                                                                           (QREFELT
                                                                            $
                                                                            14))
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
                                                             (QREFELT $ 40))
                                                   . #28#)
                                             (LETT |origFactors|
                                                   (SPADCALL |c| |origFactors|
                                                             (QREFELT $ 40))
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
                                                ((NULL |factors|)
                                                 |foundFactors|)
                                                ('T
                                                 (CONS |pp| |foundFactors|)))))
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
                                                     (LETT |u1| (CAR #8#)
                                                           . #28#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #3#
                                                       (PROGN
                                                        (LETT #4# NIL . #28#)
                                                        (SEQ
                                                         (LETT |u| NIL . #28#)
                                                         (LETT #7#
                                                               (SPADCALL |u1|
                                                                         (QREFELT
                                                                          $
                                                                          12))
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
                                                                            |vv|
                                                                            (QREFELT
                                                                             $
                                                                             14))
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
                                                   (LETT #2# (+ #2# #3#)
                                                         . #28#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #2# #3# . #28#)
                                                    (LETT #1# 'T . #28#)))))))
                                              (LETT #8# (CDR #8#) . #28#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#1# #2#) ('T 0)))
                                        . #28#)
                                  (EXIT
                                   (LETT |n| (+ |n| 1) . #28#)))))))))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
      #9# (EXIT #9#))))) 

(DEFUN |PFBR;hensel!0| (|z1| $$)
  (PROG (|vv| |r| $)
    (LETT |vv| (QREFELT $$ 2) . #1=(|PFBR;hensel|))
    (LETT |r| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z1| |vv| |r| (QREFELT $ 29)))))) 

(DEFUN |PFBR;factorSFBRlcUnitInner| (|lvpp| |pp| |r| $)
  (PROG (#1=#:G253 |u| #2=#:G252 |hen| |factors| #3=#:G251 |uu| #4=#:G250
         |fSame| #5=#:G249 #6=#:G248 |fDown| |ppR|)
    (RETURN
     (SEQ
      (LETT |ppR|
            (SPADCALL
             (CONS #'|PFBR;factorSFBRlcUnitInner!0| (VECTOR |r| $ |lvpp|)) |pp|
             (QREFELT $ 31))
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
                               (QREFELT $ 23))
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
                   (SPADCALL (|spadConstant| $ 24)
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
                            (SPADCALL (|spadConstant| $ 24)
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
      (SPADCALL |z1| (SPADCALL |lvpp| (QREFELT $ 44)) |r| (QREFELT $ 29)))))) 

(DEFUN |PFBR;factorSFBRlcUnit;LSupF;3| (|lvpp| |pp| $)
  (PROG (#1=#:G261 |val| |val1| |tempAns|)
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
  (PROG (#1=#:G265 |val| |tempAns|)
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
  (PROG (#1=#:G288 |w| #2=#:G287 |ans| |ppR| |lpolysR| #3=#:G286 |u| #4=#:G285)
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
  (PROG (#1=#:G298 |ppR| |substns| #2=#:G302 |v| #3=#:G301)
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
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL |ppR| (SPADCALL |ppR| (QREFELT $ 94))
                                 (QREFELT $ 95))
                       (QREFELT $ 96))
                      0 (QREFELT $ 48))
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
  (PROG (|ppR| #1=#:G320 |uu| #2=#:G315 #3=#:G312 #4=#:G311 #5=#:G313 #6=#:G329
         |v| |lpolysR| #7=#:G328 |u| #8=#:G327 #9=#:G306 #10=#:G305 #11=#:G307
         #12=#:G326 |substns| #13=#:G325 #14=#:G324)
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

(DEFUN |PFBR;raise| (|supR| $) (SPADCALL (ELT $ 16) |supR| (QREFELT $ 100))) 

(DEFUN |PFBR;lower| (|pp| $) (SPADCALL (ELT $ 49) |pp| (QREFELT $ 53))) 

(DEFUN |PFBR;SLPEBR| (|lpolys| |lvpolys| |pp| |lvpp| $)
  (PROG (|ansR| |cVS| #1=#:G371 |uu| #2=#:G370 #3=#:G359 |ppR| |lpolysR|
         #4=#:G369 |u| #5=#:G368 #6=#:G367 |pp1| #7=#:G366 |ans| #8=#:G364 |a|
         #9=#:G365 |a1| #10=#:G363 |d| |ans1| #11=#:G362 |m| #12=#:G361
         #13=#:G360 |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (NULL
           (LETT |m| (SPADCALL |lvpp| |lvpolys| (QREFELT $ 101))
                 . #14=(|PFBR;SLPEBR|))))
         (SEQ (LETT |v| (|SPADfirst| |m|) . #14#)
              (LETT |lvpp| (SPADCALL |v| |lvpp| (QREFELT $ 102)) . #14#)
              (LETT |pp1|
                    (SPADCALL
                     (SPADCALL (CONS #'|PFBR;SLPEBR!0| (VECTOR $ |v|)) |pp|
                               (QREFELT $ 107))
                     (QREFELT $ 109))
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
                            (LETT #13# (CONS (|spadConstant| $ 110) #13#)
                                  . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (SEQ (LETT |m| NIL . #14#)
                   (LETT #11# (NREVERSE (SPADCALL |pp1| (QREFELT $ 112)))
                         . #14#)
                   G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |m| (CAR #11#) . #14#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ans1|
                          (|PFBR;SLPEBR| |lpolys| |lvpolys|
                           (SPADCALL |m| (QREFELT $ 113)) |lvpp| $)
                          . #14#)
                    (EXIT
                     (COND
                      ((QEQCAR |ans1| 1)
                       (PROGN (LETT #3# (CONS 1 "failed") . #14#) (GO #3#)))
                      ('T
                       (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 114)) . #14#)
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
                                                             (QREFELT $ 115))
                                                   |a| (QREFELT $ 116))
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
                                     (SPADCALL |pp1| (QREFELT $ 109))
                                     (QREFELT $ 119))
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
            (LETT |ansR| (SPADCALL |lpolysR| |ppR| (QREFELT $ 120)) . #14#)
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
                                    (SPADCALL (ELT $ 16) |uu| (QREFELT $ 100))
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
                  (SPADCALL (QVELT |cVS| 1) (QVELT |cVS| 2) (QREFELT $ 120))
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
    (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 103)))))) 

(DEFUN |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|
       (|lpolys| |pp| $)
  (PROG (|lvpp| #1=#:G382 |z| #2=#:G381 |lvpolys| #3=#:G380 #4=#:G379 #5=#:G378
         |u| #6=#:G377)
    (RETURN
     (SEQ
      (LETT |lvpolys|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #6# NIL
                     . #7=(|PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|))
               (SEQ (LETT |u| NIL . #7#) (LETT #5# |lpolys| . #7#) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #6#
                            (CONS
                             (SPADCALL
                              (PROGN
                               (LETT #4# NIL . #7#)
                               (SEQ (LETT |z| NIL . #7#)
                                    (LETT #3# (SPADCALL |u| (QREFELT $ 12))
                                          . #7#)
                                    G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |z| (CAR #3#) . #7#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |z| (QREFELT $ 121))
                                             #4#)
                                            . #7#)))
                                    (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 122))
                             #6#)
                            . #7#)))
                    (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))
              (QREFELT $ 122))
             (QREFELT $ 123))
            . #7#)
      (LETT |lvpp|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #7#)
               (SEQ (LETT |z| NIL . #7#)
                    (LETT #1# (SPADCALL |pp| (QREFELT $ 12)) . #7#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |z| (QREFELT $ 121)) #2#)
                            . #7#)))
                    (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 122))
             (QREFELT $ 123))
            . #7#)
      (EXIT (|PFBR;SLPEBR| |lpolys| |lvpolys| |pp| |lvpp| $)))))) 

(DEFUN |PFBR;factorByRecursion;SupF;15| (|pp| $)
  (PROG (#1=#:G387 |c| |lv| #2=#:G395 |z| #3=#:G394)
    (RETURN
     (SEQ
      (LETT |lv|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #3# NIL . #4=(|PFBR;factorByRecursion;SupF;15|))
               (SEQ (LETT |z| NIL . #4#)
                    (LETT #2# (SPADCALL |pp| (QREFELT $ 12)) . #4#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #3# (CONS (SPADCALL |z| (QREFELT $ 121)) #3#)
                            . #4#)))
                    (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                    (EXIT (NREVERSE #3#))))
              (QREFELT $ 122))
             (QREFELT $ 123))
            . #4#)
      (EXIT
       (COND
        ((NULL |lv|)
         (SPADCALL (CONS (|function| |PFBR;raise|) $)
                   (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 125))
                   (QREFELT $ 128)))
        (#5='T
         (SEQ (LETT |c| (SPADCALL |pp| (QREFELT $ 129)) . #4#)
              (EXIT
               (COND
                ((SPADCALL |c| (QREFELT $ 130))
                 (SPADCALL (SPADCALL |pp| (QREFELT $ 132)) (ELT $ 133)
                           (QREFELT $ 136)))
                (#5#
                 (SEQ
                  (LETT |pp|
                        (PROG2
                            (LETT #1# (SPADCALL |pp| |c| (QREFELT $ 27)) . #4#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0)
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 9))
                                         #1#))
                        . #4#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |pp| (QREFELT $ 132)) (ELT $ 133)
                              (QREFELT $ 136))
                    (SPADCALL (ELT $ 137) (SPADCALL |c| (QREFELT $ 138))
                              (QREFELT $ 141))
                    (QREFELT $ 142))))))))))))))) 

(DEFUN |PFBR;factorSquareFreeByRecursion;SupF;16| (|pp| $)
  (PROG (#1=#:G435 |w| #2=#:G434 #3=#:G406 |factors| #4=#:G416 |lcppPow| |lc|
         #5=#:G433 #6=#:G432 #7=#:G414 OK |hen| #8=#:G430 |u| #9=#:G431 |v|
         |lvppList| |ppAdjust| #10=#:G429 #11=#:G428 |oldnfact| #12=#:G425
         |nfact| |factorsR| |cVS| |lcpp| |lv| #13=#:G427 |z| #14=#:G426)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lv|
              (SPADCALL
               (SPADCALL
                (PROGN
                 (LETT #14# NIL
                       . #15=(|PFBR;factorSquareFreeByRecursion;SupF;16|))
                 (SEQ (LETT |z| NIL . #15#)
                      (LETT #13# (SPADCALL |pp| (QREFELT $ 12)) . #15#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |z| (CAR #13#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14# (CONS (SPADCALL |z| (QREFELT $ 121)) #14#)
                              . #15#)))
                      (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                (QREFELT $ 122))
               (QREFELT $ 123))
              . #15#)
        (EXIT
         (COND
          ((NULL |lv|)
           (SPADCALL (CONS (|function| |PFBR;raise|) $)
                     (SPADCALL (|PFBR;lower| |pp| $) (QREFELT $ 125))
                     (QREFELT $ 128)))
          ((SPADCALL (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 90)) . #15#)
                     (QREFELT $ 130))
           (SPADCALL |lv| |pp| (QREFELT $ 64)))
          ('T
           (SEQ (LETT |oldnfact| 999999 . #15#)
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (LETT |cVS|
                              (|PFBR;chooseFSQViableSubstitutions| |lv| |pp| $)
                              . #15#)
                        (LETT |factorsR| (SPADCALL (QCDR |cVS|) (QREFELT $ 55))
                              . #15#)
                        (LETT |nfact| (SPADCALL |factorsR| (QREFELT $ 144))
                              . #15#)
                        (EXIT
                         (COND
                          ((EQL |nfact| 1)
                           (PROGN
                            (LETT #12#
                                  (SPADCALL (|spadConstant| $ 24)
                                            (LIST
                                             (VECTOR (CONS 2 "irred") |pp| 1))
                                            (QREFELT $ 69))
                                  . #15#)
                            (GO #12#)))
                          ((SPADCALL |nfact| |oldnfact| (QREFELT $ 48)) "next")
                          ('T
                           (SEQ (LETT |oldnfact| |nfact| . #15#)
                                (LETT |factors|
                                      (PROGN
                                       (LETT #11# NIL . #15#)
                                       (SEQ (LETT |u| NIL . #15#)
                                            (LETT #10#
                                                  (SPADCALL |factorsR|
                                                            (QREFELT $ 61))
                                                  . #15#)
                                            G190
                                            (COND
                                             ((OR (ATOM #10#)
                                                  (PROGN
                                                   (LETT |u| (CAR #10#) . #15#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #11#
                                                    (CONS
                                                     (SPADCALL
                                                      (PROG2
                                                          (LETT #3#
                                                                (SPADCALL
                                                                 |lcpp|
                                                                 (SPADCALL
                                                                  (QVELT |u| 1)
                                                                  (QREFELT $
                                                                           145))
                                                                 (QREFELT $
                                                                          146))
                                                                . #15#)
                                                          (QCDR #3#)
                                                        (|check_union|
                                                         (QEQCAR #3# 0)
                                                         (QREFELT $ 9) #3#))
                                                      (|PFBR;raise|
                                                       (QVELT |u| 1) $)
                                                      (QREFELT $ 147))
                                                     #11#)
                                                    . #15#)))
                                            (LETT #10# (CDR #10#) . #15#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #11#))))
                                      . #15#)
                                (LETT |ppAdjust|
                                      (SPADCALL
                                       (LETT |lcppPow|
                                             (SPADCALL |lcpp|
                                                       (LENGTH (CDR |factors|))
                                                       (QREFELT $ 148))
                                             . #15#)
                                       |pp| (QREFELT $ 147))
                                      . #15#)
                                (LETT |lvppList| |lv| . #15#)
                                (LETT OK 'T . #15#)
                                (SEQ (LETT |v| NIL . #15#)
                                     (LETT #9# (QCAR |cVS|) . #15#)
                                     (LETT |u| NIL . #15#)
                                     (LETT #8# |lvppList| . #15#) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN
                                            (LETT |u| (CAR #8#) . #15#)
                                            NIL)
                                           (ATOM #9#)
                                           (PROGN
                                            (LETT |v| (CAR #9#) . #15#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |hen|
                                            (|PFBR;hensel| |ppAdjust| |u| |v|
                                             |factors| $)
                                            . #15#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |hen| 1)
                                         (SEQ (LETT OK 'NIL . #15#)
                                              (EXIT "leave")))
                                        ('T
                                         (LETT |factors| (QCAR (QCDR |hen|))
                                               . #15#)))))
                                     (LETT #8#
                                           (PROG1 (CDR #8#)
                                             (LETT #9# (CDR #9#) . #15#))
                                           . #15#)
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  (OK
                                   (PROGN
                                    (LETT #7# |$NoValue| . #15#)
                                    (GO #7#))))))))))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #7# (EXIT #7#))
                (LETT |factors|
                      (PROGN
                       (LETT #6# NIL . #15#)
                       (SEQ (LETT |w| NIL . #15#) (LETT #5# |factors| . #15#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |w| (CAR #5#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SEQ
                                      (LETT |lc| (SPADCALL |w| (QREFELT $ 129))
                                            . #15#)
                                      (LETT |lcppPow|
                                            (PROG2
                                                (LETT #3#
                                                      (SPADCALL |lcppPow| |lc|
                                                                (QREFELT $
                                                                         149))
                                                      . #15#)
                                                (QCDR #3#)
                                              (|check_union| (QEQCAR #3# 0)
                                                             (QREFELT $ 9)
                                                             #3#))
                                            . #15#)
                                      (EXIT
                                       (PROG2
                                           (LETT #4#
                                                 (SPADCALL |w| |lc|
                                                           (QREFELT $ 27))
                                                 . #15#)
                                           (QCDR #4#)
                                         (|check_union| (QEQCAR #4# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 9))
                                                        #4#))))
                                     #6#)
                                    . #15#)))
                            (LETT #5# (CDR #5#) . #15#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #15#)
                (COND
                 ((NULL (SPADCALL |lcppPow| (QREFELT $ 130)))
                  (EXIT
                   (|error| "internal error in factorSquareFreeByRecursion"))))
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #3# (SPADCALL |lcppPow| (QREFELT $ 150)) . #15#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
                   (QREFELT $ 137))
                  (PROGN
                   (LETT #2# NIL . #15#)
                   (SEQ (LETT |w| NIL . #15#) (LETT #1# |factors| . #15#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |w| (CAR #1#) . #15#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (VECTOR (CONS 2 "irred") |w| 1) #2#)
                                . #15#)))
                        (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 69)))))))))
      #12# (EXIT #12#))))) 

(DEFUN |PolynomialFactorizationByRecursion| (&REST #1=#:G436)
  (PROG ()
    (RETURN
     (PROG (#2=#:G437)
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
      (LETT $ (GETREFV 151) . #1#)
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
              (|local| |#3|) (|local| |#4|) (|List| 9)
              (|SparseUnivariatePolynomial| 9) (0 . |coefficients|)
              (|NonNegativeInteger|) (5 . |degree|) (11 . |coerce|)
              (16 . |coerce|) (21 . -) (|Boolean|) (|Integer|) (27 . <=)
              (|PositiveInteger|) (33 . ^) (39 . *) (45 . |One|) (49 . -)
              (|Union| $ '"failed") (55 . |exquo|) (61 . |zero?|) (66 . |eval|)
              (|Mapping| 9 9) (73 . |map|) (|Union| 33 '"failed") (|List| 34)
              (|SparseUnivariatePolynomial| $)
              (79 . |solveLinearPolynomialEquation|) (85 . *) (91 . +)
              (97 . |exquo|) (|List| 11) (103 . |remove|) (109 . |One|)
              (113 . |One|) (|List| 8) (117 . |first|) (122 . |degree|)
              (127 . |differentiate|) (132 . |gcd|) (138 . >) (144 . |retract|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 6 50)
              (149 . |map|) (|Factored| 34)
              (155 . |factorSquareFreePolynomial|) (|Factored| 50)
              (160 . |unit|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 58) (|:| |fctr| 50) (|:| |xpnt| 19))
              (|List| 59) (165 . |factorList|) (170 . *) (|Factored| 11)
              (176 . |factorSFBRlcUnit|) (182 . |unit|)
              (|Record| (|:| |flg| 58) (|:| |fctr| 11) (|:| |xpnt| 19))
              (|List| 66) (187 . |factorList|) (192 . |makeFR|) (198 . |init|)
              (202 . |nextItem|) (207 . |randomR|) (211 . |random|)
              (215 . |coerce|) (220 . |univariate|)
              (|SparseUnivariatePolynomial| 50) (|Mapping| 50 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 50 76)
              (225 . |map|) (231 . |solveLinearPolynomialEquation|)
              (237 . |multivariate|) (243 . |multivariate|) (|Mapping| 9 50)
              (|UnivariatePolynomialCategoryFunctions2| 50 76 9 11)
              (249 . |map|) (|Union| 39 '"failed") (255 . |bivariateSLPEBR|)
              (|LinearPolynomialEquationByFractions| 9)
              (262 . |solveLinearPolynomialEquationByFractions|)
              (268 . |leadingCoefficient|) (|List| 6) (273 . |eval|)
              (280 . |zero?|) (285 . |differentiate|) (290 . |gcd|)
              (296 . |degree|) (301 . |Zero|) (|Mapping| 9 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 50 9 11)
              (305 . |map|) (311 . |setDifference|) (317 . |remove|)
              (323 . |univariate|) (|SparseUnivariatePolynomial| 11)
              (|Mapping| 11 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 11 104)
              (329 . |map|) (|CommuteUnivariatePolynomialCategory| 9 11 104)
              (335 . |swap|) (340 . |Zero|) (|List| $) (344 . |monomials|)
              (349 . |leadingCoefficient|) (354 . |degree|) (359 . |monomial|)
              (365 . +) (|Mapping| 9 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 104 9 11)
              (371 . |map|) (377 . |solveLinearPolynomialEquation|)
              (383 . |variables|) (388 . |concat|) (393 . |removeDuplicates!|)
              |PFBR;solveLinearPolynomialEquationByRecursion;LSupU;14|
              (398 . |factorPolynomial|) (|Mapping| 11 50)
              (|FactoredFunctions2| 50 11) (403 . |map|) (409 . |content|)
              (414 . |unit?|) (|Factored| $) (419 . |squareFree|)
              |PFBR;factorSquareFreeByRecursion;SupF;16| (|Mapping| 63 11)
              (|FactoredFunctionUtilities| 11) (424 . |refine|)
              (430 . |coerce|) (435 . |factor|) (|Factored| 9)
              (|FactoredFunctions2| 9 11) (440 . |map|) (446 . |mergeFactors|)
              |PFBR;factorByRecursion;SupF;15| (452 . |numberOfFactors|)
              (457 . |leadingCoefficient|) (462 . |exquo|) (468 . *) (474 . ^)
              (480 . |exquo|) (486 . |recip|))
           '#(|solveLinearPolynomialEquationByRecursion| 491 |randomR| 497
              |factorSquareFreeByRecursion| 501 |factorSFBRlcUnit| 506
              |factorByRecursion| 512 |bivariateSLPEBR| 517)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 150
                                                 '(1 11 10 0 12 2 9 13 0 8 14 1
                                                   9 0 8 15 1 9 0 6 16 2 9 0 0
                                                   0 17 2 19 18 0 0 20 2 9 0 0
                                                   21 22 2 11 0 0 0 23 0 11 0
                                                   24 2 11 0 0 0 25 2 11 26 0 9
                                                   27 1 11 18 0 28 3 9 0 0 8 6
                                                   29 2 11 0 30 0 31 2 9 32 33
                                                   34 35 2 11 0 0 9 36 2 11 0 0
                                                   0 37 2 11 26 0 0 38 2 39 0
                                                   11 0 40 0 6 0 41 0 9 0 42 1
                                                   43 8 0 44 1 11 13 0 45 1 11
                                                   0 0 46 2 11 0 0 0 47 2 13 18
                                                   0 0 48 1 9 6 0 49 2 52 50 51
                                                   11 53 1 6 54 34 55 1 56 50 0
                                                   57 1 56 60 0 61 2 50 0 0 0
                                                   62 2 0 63 43 11 64 1 63 11 0
                                                   65 1 63 67 0 68 2 63 0 11 67
                                                   69 0 6 0 70 1 6 26 0 71 0 0
                                                   6 72 0 6 0 73 1 6 0 19 74 1
                                                   9 50 0 75 2 78 76 77 11 79 2
                                                   50 32 33 34 80 2 9 0 34 8 81
                                                   2 9 0 50 8 82 2 84 11 83 76
                                                   85 3 0 86 39 11 8 87 2 88 86
                                                   39 11 89 1 11 9 0 90 3 9 0 0
                                                   43 91 92 1 9 18 0 93 1 50 0
                                                   0 94 2 50 0 0 0 95 1 50 13 0
                                                   96 0 6 0 97 2 99 11 98 50
                                                   100 2 43 0 0 0 101 2 43 0 8
                                                   0 102 2 9 34 0 8 103 2 106
                                                   104 105 11 107 1 108 104 104
                                                   109 0 104 0 110 1 104 111 0
                                                   112 1 104 11 0 113 1 104 13
                                                   0 114 2 104 0 11 13 115 2
                                                   104 0 0 0 116 2 118 11 117
                                                   104 119 2 6 32 33 34 120 1 9
                                                   43 0 121 1 43 0 111 122 1 43
                                                   0 0 123 1 6 54 34 125 2 127
                                                   63 126 56 128 1 11 9 0 129 1
                                                   9 18 0 130 1 11 131 0 132 2
                                                   135 63 63 134 136 1 11 0 9
                                                   137 1 9 131 0 138 2 140 63
                                                   105 139 141 2 135 63 63 63
                                                   142 1 56 13 0 144 1 50 6 0
                                                   145 2 9 26 0 6 146 2 11 0 9
                                                   0 147 2 9 0 0 13 148 2 9 26
                                                   0 0 149 1 9 26 0 150 2 0 86
                                                   39 11 124 0 0 6 72 1 0 63 11
                                                   133 2 0 63 43 11 64 1 0 63
                                                   11 143 3 0 86 39 11 8
                                                   87)))))
           '|lookupComplete|)) 
