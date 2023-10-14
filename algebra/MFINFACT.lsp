
(/VERSIONCHECK 2) 

(DEFUN |MFINFACT;convertPUP| (|lfg| $)
  (PROG (#1=#:G148 |lff| #2=#:G147)
    (RETURN
     (SEQ
      (CONS (QCAR |lfg|)
            (PROGN
             (LETT #2# NIL . #3=(|MFINFACT;convertPUP|))
             (SEQ (LETT |lff| NIL . #3#) (LETT #1# (QCDR |lfg|) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |lff| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS (SPADCALL (QCAR |lff|) (QREFELT $ 13))
                                 (QCDR |lff|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(DEFUN |MFINFACT;supFactor| (|um| |dx| $)
  (PROG (#1=#:G195 |lcfacs| #2=#:G191 #3=#:G190 #4=#:G192 #5=#:G193 #6=#:G209
         |f| |factorlist| |auxfl| #7=#:G208 |lfp| #8=#:G207 |lf| |ldeg|
         #9=#:G183 #10=#:G182 #11=#:G184 #12=#:G206 |fc| #13=#:G205 |xx|
         #14=#:G204 |coefs| |ffcont| |ffexp| |ffactor| #15=#:G203 |fact|
         |sqqfact| #16=#:G202 |ff| #17=#:G201 |flead| |lcont| |sqfacs| |om|
         #18=#:G199 |lfg| #19=#:G155 |f1| |mdeg| |lvar| #20=#:G151 #21=#:G150
         #22=#:G152 #23=#:G200 |cf|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (SPADCALL |um| (QREFELT $ 15)) 0)
         (|MFINFACT;convertPUP|
          (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 16)) |dx| $) $))
        (#24='T
         (SEQ
          (LETT |lvar|
                (PROGN
                 (LETT #20# NIL . #25=(|MFINFACT;supFactor|))
                 (SEQ (LETT |cf| NIL . #25#)
                      (LETT #23# (SPADCALL |um| (QREFELT $ 18)) . #25#) G190
                      (COND
                       ((OR (ATOM #23#)
                            (PROGN (LETT |cf| (CAR #23#) . #25#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #22# (SPADCALL |cf| (QREFELT $ 20)) . #25#)
                         (COND
                          (#20#
                           (LETT #21# (SPADCALL #21# #22# (QREFELT $ 21))
                                 . #25#))
                          ('T
                           (PROGN
                            (LETT #21# #22# . #25#)
                            (LETT #20# 'T . #25#)))))))
                      (LETT #23# (CDR #23#) . #25#) (GO G190) G191 (EXIT NIL))
                 (COND (#20# #21#) (#24# (|IdentityError| '|setUnion|))))
                . #25#)
          (LETT |flead| (CONS (|spadConstant| $ 25) NIL) . #25#)
          (LETT |factorlist| NIL . #25#)
          (LETT |mdeg| (SPADCALL |um| (QREFELT $ 26)) . #25#)
          (COND
           ((SPADCALL |mdeg| 0 (QREFELT $ 28))
            (SEQ
             (LETT |f1| (SPADCALL (|spadConstant| $ 31) |mdeg| (QREFELT $ 32))
                   . #25#)
             (LETT |um|
                   (PROG2
                       (LETT #19# (SPADCALL |um| |f1| (QREFELT $ 34)) . #25#)
                       (QCDR #19#)
                     (|check_union| (QEQCAR #19# 0)
                                    (|SparseUnivariatePolynomial|
                                     (|SparseMultivariatePolynomial|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 8))
                                      (QREFELT $ 6)))
                                    #19#))
                   . #25#)
             (LETT |factorlist|
                   (CONS
                    (CONS (SPADCALL (|spadConstant| $ 31) 1 (QREFELT $ 32))
                          |mdeg|)
                    |factorlist|)
                   . #25#)
             (EXIT
              (COND
               ((EQL (SPADCALL |um| (QREFELT $ 15)) 0)
                (PROGN
                 (LETT #18#
                       (SEQ
                        (LETT |lfg|
                              (|MFINFACT;convertPUP|
                               (|MFINFACT;mFactor|
                                (SPADCALL |um| (QREFELT $ 16)) |dx| $)
                               $)
                              . #25#)
                        (EXIT
                         (CONS (QCAR |lfg|)
                               (APPEND |factorlist| (QCDR |lfg|)))))
                       . #25#)
                 (GO #18#))))))))
          (LETT |om|
                (SPADCALL
                 (CONS #'|MFINFACT;supFactor!0| (VECTOR $ (QREFELT $ 10))) |um|
                 (QREFELT $ 38))
                . #25#)
          (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 40)) . #25#)
          (LETT |lcont|
                (SPADCALL
                 (CONS #'|MFINFACT;supFactor!1| (VECTOR $ (QREFELT $ 10)))
                 (SPADCALL |sqfacs| (QREFELT $ 42)) (QREFELT $ 45))
                . #25#)
          (COND
           ((SPADCALL |lcont| (QREFELT $ 46))
            (LETT |flead|
                  (|MFINFACT;convertPUP|
                   (|MFINFACT;constantCase| (SPADCALL |lcont| (QREFELT $ 16))
                    NIL $)
                   $)
                  . #25#))
           (#24# (LETT |flead| (|MFINFACT;supFactor| |lcont| |dx| $) . #25#)))
          (LETT |factorlist| (QCDR |flead|) . #25#)
          (LETT |sqqfact|
                (PROGN
                 (LETT #17# NIL . #25#)
                 (SEQ (LETT |ff| NIL . #25#)
                      (LETT #16# (SPADCALL |sqfacs| (QREFELT $ 49)) . #25#)
                      G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |ff| (CAR #16#) . #25#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #17#
                              (CONS
                               (CONS
                                (SPADCALL
                                 (CONS #'|MFINFACT;supFactor!2|
                                       (VECTOR $ (QREFELT $ 10)))
                                 (QCAR |ff|) (QREFELT $ 45))
                                (QCDR |ff|))
                               #17#)
                              . #25#)))
                      (LETT #16# (CDR #16#) . #25#) (GO G190) G191
                      (EXIT (NREVERSE #17#))))
                . #25#)
          (SEQ (LETT |fact| NIL . #25#) (LETT #15# |sqqfact| . #25#) G190
               (COND
                ((OR (ATOM #15#) (PROGN (LETT |fact| (CAR #15#) . #25#) NIL))
                 (GO G191)))
               (SEQ (LETT |ffactor| (QCAR |fact|) . #25#)
                    (LETT |ffexp| (QCDR |fact|) . #25#)
                    (LETT |ffcont| (SPADCALL |ffactor| (QREFELT $ 50)) . #25#)
                    (LETT |coefs| (SPADCALL |ffactor| (QREFELT $ 18)) . #25#)
                    (LETT |ldeg|
                          (PROGN
                           (LETT #14# NIL . #25#)
                           (SEQ (LETT |xx| NIL . #25#)
                                (LETT #13# |lvar| . #25#) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN
                                       (LETT |xx| (CAR #13#) . #25#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #14#
                                        (CONS
                                         (PROGN
                                          (LETT #9# NIL . #25#)
                                          (SEQ (LETT |fc| NIL . #25#)
                                               (LETT #12# |coefs| . #25#) G190
                                               (COND
                                                ((OR (ATOM #12#)
                                                     (PROGN
                                                      (LETT |fc| (CAR #12#)
                                                            . #25#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #11#
                                                        (SPADCALL |fc| |xx|
                                                                  (QREFELT $
                                                                           51))
                                                        . #25#)
                                                  (COND
                                                   (#9#
                                                    (LETT #10# (MAX #10# #11#)
                                                          . #25#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #10# #11# . #25#)
                                                     (LETT #9# 'T . #25#)))))))
                                               (LETT #12# (CDR #12#) . #25#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#9# #10#)
                                                ('T (|IdentityError| '|max|))))
                                         #14#)
                                        . #25#)))
                                (LETT #13# (CDR #13#) . #25#) (GO G190) G191
                                (EXIT (NREVERSE #14#))))
                          . #25#)
                    (COND
                     ((SPADCALL (SPADCALL |ffactor| (QREFELT $ 52))
                                (QREFELT $ 53))
                      (LETT |lf|
                            (|MFINFACT;mfconst| |ffactor| |dx| |lvar| |ldeg| $)
                            . #25#))
                     ('T
                      (LETT |lf|
                            (|MFINFACT;mfpol| |ffactor| |dx| |lvar| |ldeg| $)
                            . #25#)))
                    (LETT |auxfl|
                          (PROGN
                           (LETT #8# NIL . #25#)
                           (SEQ (LETT |lfp| NIL . #25#) (LETT #7# |lf| . #25#)
                                G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN
                                       (LETT |lfp| (CAR #7#) . #25#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #8# (CONS (CONS |lfp| |ffexp|) #8#)
                                        . #25#)))
                                (LETT #7# (CDR #7#) . #25#) (GO G190) G191
                                (EXIT (NREVERSE #8#))))
                          . #25#)
                    (EXIT
                     (LETT |factorlist| (APPEND |factorlist| |auxfl|) . #25#)))
               (LETT #15# (CDR #15#) . #25#) (GO G190) G191 (EXIT NIL))
          (LETT |lcfacs|
                (PROGN
                 (LETT #2# NIL . #25#)
                 (SEQ (LETT |f| NIL . #25#) (LETT #6# |factorlist| . #25#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #25#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (SPADCALL (QCAR |f|) (QREFELT $ 52))
                                          (QREFELT $ 54))
                                (PROG1 (LETT #5# (QCDR |f|) . #25#)
                                  (|check_subtype| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   #5#))
                                (QREFELT $ 55))
                               . #25#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 56)) . #25#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #25#)
                            (LETT #2# 'T . #25#)))))))
                      (LETT #6# (CDR #6#) . #25#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#24# (|spadConstant| $ 57))))
                . #25#)
          (EXIT
           (CONS
            (PROG2
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (SPADCALL |um| (QREFELT $ 52)) (QREFELT $ 54))
                       |lcfacs| (QREFELT $ 58))
                      . #25#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|SparseUnivariatePolynomial| (QREFELT $ 8)) #1#))
            |factorlist|))))))
      #18# (EXIT #18#))))) 

(DEFUN |MFINFACT;supFactor!2| (|p1| $$)
  (PROG (|basicVar| $)
    (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(DEFUN |MFINFACT;supFactor!1| (|p1| $$)
  (PROG (|basicVar| $)
    (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(DEFUN |MFINFACT;supFactor!0| (|p1| $$)
  (PROG (|basicVar| $)
    (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;supFactor|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MFINFACT;pushup| |p1| |basicVar| $))))) 

(DEFUN |MFINFACT;factor;SupF;3| (|um| $)
  (PROG (#1=#:G216 #2=#:G215 #3=#:G217 #4=#:G222 |u| |flist| |cm| |dx|
         #5=#:G211 #6=#:G210 #7=#:G212 #8=#:G221 #9=#:G103 |ld| |lv|)
    (RETURN
     (SEQ
      (LETT |lv| (SPADCALL |um| (QREFELT $ 60))
            . #10=(|MFINFACT;factor;SupF;3|))
      (LETT |ld| (SPADCALL |um| |lv| (QREFELT $ 62)) . #10#)
      (LETT |dx|
            (PROGN
             (LETT #5# NIL . #10#)
             (SEQ (LETT #9# NIL . #10#) (LETT #8# |ld| . #10#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT #9# (CAR #8#) . #10#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #7# #9# . #10#)
                     (COND (#5# (LETT #6# (MIN #6# #7#) . #10#))
                           ('T
                            (PROGN
                             (LETT #6# #7# . #10#)
                             (LETT #5# 'T . #10#)))))))
                  (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL))
             (COND (#5# #6#) (#11='T (|IdentityError| '|min|))))
            . #10#)
      (SETELT $ 10
              (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 64))
                        (QREFELT $ 65)))
      (LETT |cm|
            (SPADCALL
             (CONS #'|MFINFACT;factor;SupF;3!0| (VECTOR $ (QREFELT $ 10))) |um|
             (QREFELT $ 45))
            . #10#)
      (LETT |flist| (|MFINFACT;supFactor| |cm| |dx| $) . #10#)
      (EXIT
       (SPADCALL
        (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) (QREFELT $ 10) $)
                  (QREFELT $ 66))
        (PROGN
         (LETT #1# NIL . #10#)
         (SEQ (LETT |u| NIL . #10#) (LETT #4# (QCDR |flist|) . #10#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #10#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL
                        (SPADCALL
                         (CONS #'|MFINFACT;factor;SupF;3!1|
                               (VECTOR $ (QREFELT $ 10)))
                         (QCAR |u|) (QREFELT $ 38))
                        (QCDR |u|) (QREFELT $ 67))
                       . #10#)
                 (COND
                  (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 68)) . #10#))
                  ('T (PROGN (LETT #2# #3# . #10#) (LETT #1# 'T . #10#)))))))
              (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#11# (|spadConstant| $ 69))))
        (QREFELT $ 70))))))) 

(DEFUN |MFINFACT;factor;SupF;3!1| (|p1| $$)
  (PROG (|basicVar| $)
    (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MFINFACT;pushup| |p1| |basicVar| $))))) 

(DEFUN |MFINFACT;factor;SupF;3!0| (|p1| $$)
  (PROG (|basicVar| $)
    (LETT |basicVar| (QREFELT $$ 1) . #1=(|MFINFACT;factor;SupF;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MFINFACT;pushdown| |p1| |basicVar| $))))) 

(DEFUN |MFINFACT;mFactor| (|m| |dx| $)
  (PROG (|factorlist| |auxfl| #1=#:G271 |lfp| #2=#:G270 |lf| |um| |lcum| |ldeg|
         #3=#:G269 |lcterm| |ffactor| #4=#:G244 |pc| |lvar| |x| |varch|
         #5=#:G268 #6=#:G238 |lcont| #7=#:G267 |lterm| |ffexp| #8=#:G266 |fact|
         |sqqfact| #9=#:G265 |ff| #10=#:G264 |flead| |sqfacs| |om| #11=#:G226
         #12=#:G225 #13=#:G227 #14=#:G263 |n| |lmdeg|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| (QREFELT $ 53)) (|MFINFACT;constantCase| |m| NIL $))
            (#15='T
             (SEQ
              (LETT |lvar| (SPADCALL |m| (QREFELT $ 20))
                    . #16=(|MFINFACT;mFactor|))
              (LETT |flead| (CONS (|spadConstant| $ 57) NIL) . #16#)
              (LETT |factorlist| NIL . #16#)
              (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 72)) . #16#)
              (EXIT
               (COND
                ((PROGN
                  (LETT #11# NIL . #16#)
                  (SEQ (LETT |n| NIL . #16#) (LETT #14# |lmdeg| . #16#) G190
                       (COND
                        ((OR (ATOM #14#)
                             (PROGN (LETT |n| (CAR #14#) . #16#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #13# (SPADCALL |n| 0 (QREFELT $ 28)) . #16#)
                          (COND
                           (#11# (LETT #12# (COND (#12# 'T) ('T #13#)) . #16#))
                           ('T
                            (PROGN
                             (LETT #12# #13# . #16#)
                             (LETT #11# 'T . #16#)))))))
                       (LETT #14# (CDR #14#) . #16#) (GO G190) G191 (EXIT NIL))
                  (COND (#11# #12#) (#15# 'NIL)))
                 (|MFINFACT;simplify| |m| |dx| |lvar| |lmdeg| $))
                (#15#
                 (SEQ
                  (LETT |om| (|MFINFACT;pushup| |m| (QREFELT $ 10) $) . #16#)
                  (LETT |sqfacs| (SPADCALL |om| (QREFELT $ 73)) . #16#)
                  (LETT |lcont|
                        (|MFINFACT;pushdown| (SPADCALL |sqfacs| (QREFELT $ 75))
                         (QREFELT $ 10) $)
                        . #16#)
                  (COND
                   ((SPADCALL |lcont| (QREFELT $ 53))
                    (LETT |flead| (|MFINFACT;constantCase| |lcont| NIL $)
                          . #16#))
                   (#15#
                    (LETT |flead| (|MFINFACT;mFactor| |lcont| |dx| $) . #16#)))
                  (LETT |factorlist| (QCDR |flead|) . #16#)
                  (LETT |sqqfact|
                        (PROGN
                         (LETT #10# NIL . #16#)
                         (SEQ (LETT |ff| NIL . #16#)
                              (LETT #9# (SPADCALL |sqfacs| (QREFELT $ 78))
                                    . #16#)
                              G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |ff| (CAR #9#) . #16#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #10#
                                      (CONS
                                       (CONS
                                        (|MFINFACT;pushdown| (QCAR |ff|)
                                         (QREFELT $ 10) $)
                                        (QCDR |ff|))
                                       #10#)
                                      . #16#)))
                              (LETT #9# (CDR #9#) . #16#) (GO G190) G191
                              (EXIT (NREVERSE #10#))))
                        . #16#)
                  (SEQ (LETT |fact| NIL . #16#) (LETT #8# |sqqfact| . #16#)
                       G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |fact| (CAR #8#) . #16#) NIL))
                         (GO G191)))
                       (SEQ (LETT |ffactor| (QCAR |fact|) . #16#)
                            (LETT |ffexp| (QCDR |fact|) . #16#)
                            (EXIT
                             (COND
                              ((SPADCALL |ffactor| (QREFELT $ 53))
                               (SEQ (LETT |lterm| NIL . #16#)
                                    (LETT #7#
                                          (QCDR
                                           (|MFINFACT;constantCase| |ffactor|
                                            NIL $))
                                          . #16#)
                                    G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |lterm| (CAR #7#) . #16#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS
                                             (CONS (QCAR |lterm|)
                                                   (* (QCDR |lterm|) |ffexp|))
                                             |factorlist|)
                                            . #16#)))
                                    (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                                    (EXIT NIL)))
                              ('T
                               (SEQ
                                (LETT |lvar|
                                      (SPADCALL |ffactor| (QREFELT $ 20))
                                      . #16#)
                                (LETT |x| (SPADCALL |lvar| 1 (QREFELT $ 65))
                                      . #16#)
                                (LETT |ldeg|
                                      (SPADCALL |ffactor| |lvar|
                                                (QREFELT $ 79))
                                      . #16#)
                                (EXIT
                                 (COND
                                  ((SPADCALL 1 |ldeg| (QREFELT $ 82))
                                   (SEQ
                                    (LETT |x|
                                          (SPADCALL |lvar|
                                                    (SPADCALL 1 |ldeg|
                                                              (QREFELT $ 64))
                                                    (QREFELT $ 65))
                                          . #16#)
                                    (LETT |lcont|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |ffactor| |x|
                                                      (QREFELT $ 84))
                                            (QREFELT $ 18))
                                           (QREFELT $ 86))
                                          . #16#)
                                    (LETT |ffactor|
                                          (PROG2
                                              (LETT #6#
                                                    (SPADCALL |ffactor| |lcont|
                                                              (QREFELT $ 87))
                                                    . #16#)
                                              (QCDR #6#)
                                            (|check_union| (QEQCAR #6# 0)
                                                           (|SparseMultivariatePolynomial|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 8))
                                                            (QREFELT $ 6))
                                                           #6#))
                                          . #16#)
                                    (LETT |factorlist|
                                          (CONS (CONS |ffactor| |ffexp|)
                                                |factorlist|)
                                          . #16#)
                                    (EXIT
                                     (SEQ (LETT |lcterm| NIL . #16#)
                                          (LETT #5#
                                                (QCDR
                                                 (|MFINFACT;mFactor| |lcont|
                                                  |dx| $))
                                                . #16#)
                                          G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |lcterm| (CAR #5#)
                                                       . #16#)
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
                                                  . #16#)))
                                          (LETT #5# (CDR #5#) . #16#) (GO G190)
                                          G191 (EXIT NIL)))))
                                  ('T
                                   (SEQ
                                    (LETT |varch|
                                          (|MFINFACT;varChoose| |ffactor|
                                           |lvar| |ldeg| $)
                                          . #16#)
                                    (LETT |um| (QVELT |varch| 0) . #16#)
                                    (LETT |ldeg| (CDR |ldeg|) . #16#)
                                    (LETT |lvar| (CDR |lvar|) . #16#)
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL (QVELT |varch| 1) 1
                                                 (QREFELT $ 65))
                                       |x| (QREFELT $ 88))
                                      (SEQ
                                       (LETT |lvar| (QVELT |varch| 1) . #16#)
                                       (LETT |x|
                                             (SPADCALL |lvar| 1 (QREFELT $ 65))
                                             . #16#)
                                       (LETT |lvar| (CDR |lvar|) . #16#)
                                       (LETT |pc|
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT $ 18))
                                              (QREFELT $ 86))
                                             . #16#)
                                       (COND
                                        ((SPADCALL |pc| (|spadConstant| $ 31)
                                                   (QREFELT $ 89))
                                         (SEQ
                                          (LETT |um|
                                                (PROG2
                                                    (LETT #4#
                                                          (SPADCALL |um| |pc|
                                                                    (QREFELT $
                                                                             90))
                                                          . #16#)
                                                    (QCDR #4#)
                                                  (|check_union| (QEQCAR #4# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (|SparseMultivariatePolynomial|
                                                                   (|SparseUnivariatePolynomial|
                                                                    (QREFELT $
                                                                             8))
                                                                   (QREFELT $
                                                                            6)))
                                                                 #4#))
                                                . #16#)
                                          (LETT |ffactor|
                                                (SPADCALL |um| |x|
                                                          (QREFELT $ 91))
                                                . #16#)
                                          (EXIT
                                           (SEQ (LETT |lcterm| NIL . #16#)
                                                (LETT #3#
                                                      (QCDR
                                                       (|MFINFACT;mFactor| |pc|
                                                        |dx| $))
                                                      . #16#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #3#)
                                                      (PROGN
                                                       (LETT |lcterm| (CAR #3#)
                                                             . #16#)
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
                                                         |factorlist|)
                                                        . #16#)))
                                                (LETT #3# (CDR #3#) . #16#)
                                                (GO G190) G191 (EXIT NIL))))))
                                       (EXIT
                                        (LETT |ldeg|
                                              (SPADCALL |ffactor| |lvar|
                                                        (QREFELT $ 79))
                                              . #16#)))))
                                    (LETT |lcum|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |um| (QREFELT $ 52))
                                            (QREFELT $ 54))
                                           (QREFELT $ 92))
                                          . #16#)
                                    (COND
                                     ((SPADCALL |lcum| (|spadConstant| $ 29)
                                                (QREFELT $ 93))
                                      (SEQ
                                       (LETT |um|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |lcum|
                                                          (QREFELT $ 94))
                                                (QREFELT $ 95))
                                               (QREFELT $ 96))
                                              |um| (QREFELT $ 97))
                                             . #16#)
                                       (EXIT
                                        (PROGN
                                         (RPLACA |flead|
                                                 (SPADCALL
                                                  (SPADCALL |lcum|
                                                            (QREFELT $ 95))
                                                  (QCAR |flead|)
                                                  (QREFELT $ 56)))
                                         (QCAR |flead|))))))
                                    (COND
                                     ((SPADCALL (SPADCALL |um| (QREFELT $ 52))
                                                (QREFELT $ 53))
                                      (LETT |lf|
                                            (|MFINFACT;mfconst| |um| |dx|
                                             |lvar| |ldeg| $)
                                            . #16#))
                                     ('T
                                      (LETT |lf|
                                            (|MFINFACT;mfpol| |um| |dx| |lvar|
                                             |ldeg| $)
                                            . #16#)))
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #2# NIL . #16#)
                                           (SEQ (LETT |lfp| NIL . #16#)
                                                (LETT #1# |lf| . #16#) G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #1#)
                                                             . #16#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #2#
                                                        (CONS
                                                         (CONS
                                                          (SPADCALL |lfp| |x|
                                                                    (QREFELT $
                                                                             91))
                                                          |ffexp|)
                                                         #2#)
                                                        . #16#)))
                                                (LETT #1# (CDR #1#) . #16#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #2#))))
                                          . #16#)
                                    (EXIT
                                     (LETT |factorlist|
                                           (APPEND |factorlist| |auxfl|)
                                           . #16#)))))))))))
                       (LETT #8# (CDR #8#) . #16#) (GO G190) G191 (EXIT NIL))
                  (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                  (EXIT |flead|)))))))))))) 

(DEFUN |MFINFACT;pM| (|lum| $)
  (PROG (#1=#:G290 |p| #2=#:G282 |q| #3=#:G280 |e| #4=#:G277 #5=#:G276
         #6=#:G291 |i| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x| (SPADCALL (|spadConstant| $ 29) 1 (QREFELT $ 98))
              . #7=(|MFINFACT;pM|))
        (SEQ (LETT |i| 1 . #7#) (LETT #6# (SPADCALL (QREFELT $ 99)) . #7#) G190
             (COND ((|greater_SI| |i| #6#) (GO G191)))
             (SEQ
              (EXIT
               (SEQ
                (LETT |p|
                      (SPADCALL |x|
                                (SPADCALL
                                 (SPADCALL
                                  (PROG1 (LETT #5# |i| . #7#)
                                    (|check_subtype| (> #5# 0)
                                                     '(|PositiveInteger|) #5#))
                                  (QREFELT $ 101))
                                 (QREFELT $ 95))
                                (QREFELT $ 102))
                      . #7#)
                (EXIT
                 (COND
                  ((SPADCALL |p| |lum| (QREFELT $ 105))
                   (PROGN
                    (LETT #4# (PROGN (LETT #1# |p| . #7#) (GO #1#)) . #7#)
                    (GO #4#)))))))
              #4# (EXIT #4#))
             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (SEQ (LETT |e| 2 . #7#) G190 NIL
              (SEQ
               (LETT |p|
                     (SPADCALL
                      (PROG1 (LETT #3# |e| . #7#)
                        (|check_subtype| (> #3# 0) '(|PositiveInteger|) #3#))
                      (QREFELT $ 107))
                     . #7#)
               (EXIT
                (COND
                 ((SPADCALL |p| |lum| (QREFELT $ 105))
                  (PROGN (LETT #1# |p| . #7#) (GO #1#)))
                 ('T
                  (SEQ G190
                       (COND
                        ((NULL
                          (SEQ (LETT |q| (SPADCALL |p| (QREFELT $ 109)) . #7#)
                               (EXIT (COND ((QEQCAR |q| 1) 'NIL) ('T 'T)))))
                         (GO G191)))
                       (SEQ
                        (LETT |p|
                              (PROG2 (LETT #2# |q| . #7#)
                                  (QCDR #2#)
                                (|check_union| (QEQCAR #2# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 8))
                                               #2#))
                              . #7#)
                        (EXIT
                         (COND
                          ((SPADCALL |p| |lum| (QREFELT $ 105))
                           (PROGN (LETT #1# |p| . #7#) (GO #1#))))))
                       NIL (GO G190) G191 (EXIT NIL))))))
              (LETT |e| (|inc_SI| |e|) . #7#) (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |MFINFACT;pushdcoef| (|t| $) (SPADCALL (ELT $ 95) |t| (QREFELT $ 112))) 

(DEFUN |MFINFACT;intfact| (|um| |lvar| |ldeg| |tleadpol| |ltry| $)
  (PROG (|factfin| #1=#:G324 |ff| #2=#:G323 |ffin| #3=#:G308 |unifact| |i|
         #4=#:G322 |dd| |lpol| |dist| #5=#:G319 |distf| |leadval| |lval|
         |nfact| |vfchoo| |leadpol| #6=#:G321 #7=#:G320 |polcase|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |polcase| (COND ((NULL (QCDR |tleadpol|)) 'NIL) (#8='T 'T))
              . #9=(|MFINFACT;intfact|))
        (LETT |vfchoo|
              (COND
               (|polcase|
                (SEQ
                 (LETT |leadpol|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |ff| NIL . #9#)
                             (LETT #6# (QCDR |tleadpol|) . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |ff| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #7# (CONS (QCAR |ff|) #7#) . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (EXIT
                  (|MFINFACT;intChoose| |um| |lvar| (QCAR |tleadpol|) |leadpol|
                   |ltry| $))))
               (#8#
                (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| $ 57) NIL NIL
                 $)))
              . #9#)
        (LETT |unifact| (QVELT |vfchoo| 1) . #9#)
        (LETT |nfact| (LENGTH |unifact|) . #9#)
        (EXIT
         (COND ((EQL |nfact| 1) (LIST |um|))
               (#8#
                (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #9#)
                     (LETT |lval| (|SPADfirst| |ltry|) . #9#)
                     (LETT |dd| (QVELT |vfchoo| 2) . #9#)
                     (LETT |lpol| NIL . #9#) (LETT |leadval| NIL . #9#)
                     (COND
                      (|polcase|
                       (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #9#)
                            (LETT |distf|
                                  (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                            |tleadpol| |leadval| |lvar| |lval|
                                            (QREFELT $ 119))
                                  . #9#)
                            (EXIT
                             (COND
                              ((QEQCAR |distf| 1)
                               (PROGN
                                (LETT #5#
                                      (|MFINFACT;intfact| |um| |lvar| |ldeg|
                                       |tleadpol| |ltry| $)
                                      . #9#)
                                (GO #5#)))
                              (#8#
                               (SEQ (LETT |dist| (QCDR |distf|) . #9#)
                                    (LETT |lpol| (QVELT |dist| 0) . #9#)
                                    (LETT |dd| (QVELT |dist| 1) . #9#)
                                    (EXIT
                                     (LETT |unifact| (QVELT |dist| 2)
                                           . #9#)))))))))
                     (COND
                      ((SPADCALL |dd| (|spadConstant| $ 57) (QREFELT $ 120))
                       (SEQ
                        (LETT |unifact|
                              (PROGN
                               (LETT #4# NIL . #9#)
                               (SEQ (LETT |i| 1 . #9#) G190
                                    (COND
                                     ((|greater_SI| |i| |nfact|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |dd|
                                                       (SPADCALL |unifact| |i|
                                                                 (QREFELT $
                                                                          122))
                                                       (QREFELT $ 123))
                                             #4#)
                                            . #9#)))
                                    (LETT |i| (|inc_SI| |i|) . #9#) (GO G190)
                                    G191 (EXIT (NREVERSE #4#))))
                              . #9#)
                        (EXIT
                         (LETT |um|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |dd|
                                           (PROG1
                                               (LETT #3# (- |nfact| 1) . #9#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           (QREFELT $ 55))
                                 (QREFELT $ 96))
                                |um| (QREFELT $ 97))
                               . #9#)))))
                     (LETT |ffin|
                           (SPADCALL |um| |lvar| |unifact| |lval| |lpol| |ldeg|
                                     (|MFINFACT;pM| |unifact| $)
                                     (QREFELT $ 126))
                           . #9#)
                     (EXIT
                      (COND
                       ((QEQCAR |ffin| 1)
                        (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                         |ltry| $))
                       (#8#
                        (SEQ (LETT |factfin| (QCDR |ffin|) . #9#)
                             (COND
                              ((SPADCALL |dd| (|spadConstant| $ 57)
                                         (QREFELT $ 120))
                               (LETT |factfin|
                                     (PROGN
                                      (LETT #2# NIL . #9#)
                                      (SEQ (LETT |ff| NIL . #9#)
                                           (LETT #1# |factfin| . #9#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |ff| (CAR #1#) . #9#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #2#
                                                   (CONS
                                                    (SPADCALL |ff|
                                                              (QREFELT $ 127))
                                                    #2#)
                                                   . #9#)))
                                           (LETT #1# (CDR #1#) . #9#) (GO G190)
                                           G191 (EXIT (NREVERSE #2#))))
                                     . #9#)))
                             (EXIT |factfin|)))))))))))
      #5# (EXIT #5#))))) 

(DEFUN |MFINFACT;pushup| (|f| |x| $)
  (PROG (|rr| |lvf| |cf| |lf|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 53))
        (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT $ 128)) |x| $))
       ('T
        (SEQ (LETT |rr| (|spadConstant| $ 129) . #1=(|MFINFACT;pushup|))
             (SEQ G190
                  (COND
                   ((NULL (SPADCALL |f| (|spadConstant| $ 130) (QREFELT $ 89)))
                    (GO G191)))
                  (SEQ (LETT |lf| (SPADCALL |f| (QREFELT $ 131)) . #1#)
                       (LETT |cf|
                             (|MFINFACT;pushupconst|
                              (SPADCALL |f| (QREFELT $ 54)) |x| $)
                             . #1#)
                       (LETT |lvf| (SPADCALL |lf| (QREFELT $ 20)) . #1#)
                       (LETT |rr|
                             (SPADCALL |rr|
                                       (SPADCALL |cf| |lvf|
                                                 (SPADCALL |lf| |lvf|
                                                           (QREFELT $ 79))
                                                 (QREFELT $ 132))
                                       (QREFELT $ 133))
                             . #1#)
                       (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 134)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |rr|)))))))) 

(DEFUN |MFINFACT;pushdown| (|g| |x| $)
  (PROG (|ug| |rf| |cf|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |g| (QREFELT $ 135))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 136)) (QREFELT $ 95))
                  (QREFELT $ 96)))
       ('T
        (SEQ (LETT |rf| (|spadConstant| $ 130) . #1=(|MFINFACT;pushdown|))
             (LETT |ug| (SPADCALL |g| |x| (QREFELT $ 137)) . #1#)
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL |ug| (|spadConstant| $ 138) (QREFELT $ 139)))
                    (GO G191)))
                  (SEQ
                   (LETT |cf|
                         (SPADCALL (|spadConstant| $ 29)
                                   (SPADCALL |ug| (QREFELT $ 140))
                                   (QREFELT $ 98))
                         . #1#)
                   (LETT |rf|
                         (SPADCALL |rf|
                                   (SPADCALL |cf|
                                             (|MFINFACT;pushdcoef|
                                              (SPADCALL |ug| (QREFELT $ 141))
                                              $)
                                             (QREFELT $ 142))
                                   (QREFELT $ 143))
                         . #1#)
                   (EXIT (LETT |ug| (SPADCALL |ug| (QREFELT $ 144)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |rf|)))))))) 

(DEFUN |MFINFACT;pushupconst| (|r| |x| $)
  (PROG (|rr|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |r| (QREFELT $ 145))
        (SPADCALL (SPADCALL |r| (QREFELT $ 146)) (QREFELT $ 147)))
       ('T
        (SEQ (LETT |rr| (|spadConstant| $ 129) . #1=(|MFINFACT;pushupconst|))
             (SEQ G190
                  (COND
                   ((NULL (SPADCALL |r| (|spadConstant| $ 25) (QREFELT $ 120)))
                    (GO G191)))
                  (SEQ
                   (LETT |rr|
                         (SPADCALL |rr|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |r| (QREFELT $ 92))
                                              (QREFELT $ 147))
                                    |x| (SPADCALL |r| (QREFELT $ 148))
                                    (QREFELT $ 149))
                                   (QREFELT $ 133))
                         . #1#)
                   (EXIT (LETT |r| (SPADCALL |r| (QREFELT $ 150)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |rr|)))))))) 

(DEFUN |MFINFACT;ran| (|k1| $)
  (PROG (#1=#:G341 #2=#:G340 #3=#:G342 |i|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #4=(|MFINFACT;ran|))
       (SEQ (LETT |i| 0 . #4#) G190 (COND ((|greater_SI| |i| |k1|) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL (QREFELT $ 151)) |i| (QREFELT $ 98))
                     . #4#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 102)) . #4#))
                     ('T (PROGN (LETT #2# #3# . #4#) (LETT #1# 'T . #4#)))))))
            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 25)))))))) 

(DEFUN |MFINFACT;varChoose| (|m| |lvar| |ldeg| $)
  (PROG (|x| |i| |k| #1=#:G346 #2=#:G345 #3=#:G347 #4=#:G351 |d|)
    (RETURN
     (SEQ
      (LETT |k|
            (PROGN
             (LETT #1# NIL . #5=(|MFINFACT;varChoose|))
             (SEQ (LETT |d| NIL . #5#) (LETT #4# |ldeg| . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# |d| . #5#)
                     (COND (#1# (LETT #2# (MIN #2# #3#) . #5#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #5#)
                             (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6='T (|IdentityError| '|min|))))
            . #5#)
      (EXIT
       (COND
        ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 51)))
         (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 84)) |lvar|
                 |ldeg|))
        (#6#
         (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 64)) . #5#)
              (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 65)) . #5#)
              (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 152)))
                    . #5#)
              (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 153)))
                    . #5#)
              (EXIT
               (VECTOR (SPADCALL |m| |x| (QREFELT $ 84)) |lvar| |ldeg|)))))))))) 

(DEFUN |MFINFACT;norm| (|lum| $)
  (PROG (#1=#:G353 #2=#:G352 #3=#:G354 #4=#:G356 |lup|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|MFINFACT;norm|))
       (SEQ (LETT |lup| NIL . #5#) (LETT #4# |lum| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |lup| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (SPADCALL |lup| (QREFELT $ 154)) . #5#)
               (COND (#1# (LETT #2# (MAX #2# #3#) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))) 

(DEFUN |MFINFACT;intChoose| (|um| |lvar| |clc| |plist| |ltry| $)
  (PROG (|nfatt| |int| |leadcomp| |lffc| |unifact| #1=#:G437 |uf| #2=#:G436
         |leadtest| #3=#:G435 #4=#:G434 #5=#:G418 #6=#:G433 #7=#:G432 #8=#:G431
         #9=#:G430 #10=#:G429 |ff| #11=#:G428 #12=#:G427 #13=#:G426 |lffc1|
         |nf| |lunivf| |skip| |base_success| |luniv| |base_failure| |nfl| |dx|
         #14=#:G382 #15=#:G381 #16=#:G383 #17=#:G425 |uc| |newm| |lcnm| |range|
         |D2newm| |Dnewm| #18=#:G367 #19=#:G361 #20=#:G360 #21=#:G362
         #22=#:G424 |epl| |leadcomp1| #23=#:G423 |pol| #24=#:G422 |lval| |i|
         #25=#:G421 |newunifact| |testp| |ctf1| |nvar1| |degum|)
    (RETURN
     (SEQ
      (LETT |degum| (SPADCALL |um| (QREFELT $ 15))
            . #26=(|MFINFACT;intChoose|))
      (LETT |nvar1| (LENGTH |lvar|) . #26#) (LETT |range| 0 . #26#)
      (LETT |ctf1| (|spadConstant| $ 57) . #26#)
      (LETT |testp|
            (COND ((SPADCALL |plist| NIL (QREFELT $ 155)) 'NIL) ('T 'T))
            . #26#)
      (LETT |leadcomp| (LETT |leadcomp1| NIL . #26#) . #26#)
      (LETT |nfatt| (+ |degum| 1) . #26#)
      (LETT |lffc| (|spadConstant| $ 57) . #26#) (LETT |lffc1| |lffc| . #26#)
      (LETT |newunifact| NIL . #26#) (LETT |leadtest| 'T . #26#)
      (LETT |int| NIL . #26#) (LETT |base_success| 0 . #26#)
      (LETT |base_failure| 0 . #26#)
      (SEQ
       (EXIT
        (SEQ G190 (COND ((NULL 'T) (GO G191)))
             (SEQ
              (LETT |lval|
                    (PROGN
                     (LETT #25# NIL . #26#)
                     (SEQ (LETT |i| 1 . #26#) G190
                          (COND ((|greater_SI| |i| |nvar1|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #25# (CONS (|MFINFACT;ran| |range| $) #25#)
                                  . #26#)))
                          (LETT |i| (|inc_SI| |i|) . #26#) (GO G190) G191
                          (EXIT (NREVERSE #25#))))
                    . #26#)
              (EXIT
               (COND
                ((SPADCALL |lval| |ltry| (QREFELT $ 157))
                 (LETT |range| (+ 1 |range|) . #26#))
                ('T
                 (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #26#)
                      (LETT |leadcomp1|
                            (PROGN
                             (LETT #24# NIL . #26#)
                             (SEQ (LETT |pol| NIL . #26#)
                                  (LETT #23# |plist| . #26#) G190
                                  (COND
                                   ((OR (ATOM #23#)
                                        (PROGN
                                         (LETT |pol| (CAR #23#) . #26#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #24#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |pol| |lvar| |lval|
                                                      (QREFELT $ 158))
                                            (QREFELT $ 128))
                                           #24#)
                                          . #26#)))
                                  (LETT #23# (CDR #23#) . #26#) (GO G190) G191
                                  (EXIT (NREVERSE #24#))))
                            . #26#)
                      (COND
                       (|testp|
                        (COND
                         ((PROGN
                           (LETT #19# NIL . #26#)
                           (SEQ (LETT |epl| NIL . #26#)
                                (LETT #22# |leadcomp1| . #26#) G190
                                (COND
                                 ((OR (ATOM #22#)
                                      (PROGN
                                       (LETT |epl| (CAR #22#) . #26#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #21# (SPADCALL |epl| (QREFELT $ 159))
                                         . #26#)
                                   (COND
                                    (#19#
                                     (LETT #20# (COND (#20# 'T) ('T #21#))
                                           . #26#))
                                    ('T
                                     (PROGN
                                      (LETT #20# #21# . #26#)
                                      (LETT #19# 'T . #26#)))))))
                                (LETT #22# (CDR #22#) . #26#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#19# #20#) ('T 'NIL)))
                          (EXIT (LETT |range| (+ |range| 1) . #26#))))))
                      (LETT |newm|
                            (SPADCALL |um| |lvar| |lval| (QREFELT $ 161))
                            . #26#)
                      (COND
                       ((OR
                         (SPADCALL |degum| (SPADCALL |newm| (QREFELT $ 154))
                                   (QREFELT $ 162))
                         (SPADCALL (SPADCALL |newm| (QREFELT $ 163)) 0
                                   (QREFELT $ 162)))
                        (EXIT (LETT |range| (+ |range| 1) . #26#))))
                      (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 164)) . #26#)
                      (LETT |newm|
                            (PROG2
                                (LETT #18#
                                      (SPADCALL |newm| |lffc1| (QREFELT $ 165))
                                      . #26#)
                                (QCDR #18#)
                              (|check_union| (QEQCAR #18# 0)
                                             (|SparseUnivariatePolynomial|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 8)))
                                             #18#))
                            . #26#)
                      (COND
                       (|testp|
                        (COND
                         (|leadtest|
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |lffc1| |clc| (QREFELT $ 56))
                                       (LENGTH |plist|) |leadcomp1|
                                       (QREFELT $ 166)))
                            (EXIT (LETT |range| (+ |range| 1) . #26#))))))))
                      (LETT |Dnewm| (SPADCALL |newm| (QREFELT $ 167)) . #26#)
                      (LETT |D2newm|
                            (SPADCALL (ELT $ 169) |newm| (QREFELT $ 172))
                            . #26#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL
                           (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                     (QREFELT $ 173))
                           (QREFELT $ 154))
                          0 (QREFELT $ 162))
                         (LETT |range| (+ |range| 1) . #26#))
                        ('T
                         (SEQ (LETT |lcnm| (|spadConstant| $ 29) . #26#)
                              (COND
                               ((SPADCALL
                                 (LETT |lcnm|
                                       (SPADCALL
                                        (SPADCALL |newm| (QREFELT $ 174))
                                        (QREFELT $ 92))
                                       . #26#)
                                 (|spadConstant| $ 29) (QREFELT $ 93))
                                (LETT |newm|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |lcnm| (QREFELT $ 94))
                                        (QREFELT $ 95))
                                       |newm| (QREFELT $ 123))
                                      . #26#)))
                              (LETT |dx|
                                    (PROGN
                                     (LETT #14# NIL . #26#)
                                     (SEQ (LETT |uc| NIL . #26#)
                                          (LETT #17#
                                                (SPADCALL |newm|
                                                          (QREFELT $ 175))
                                                . #26#)
                                          G190
                                          (COND
                                           ((OR (ATOM #17#)
                                                (PROGN
                                                 (LETT |uc| (CAR #17#) . #26#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #16#
                                                   (SPADCALL |uc|
                                                             (QREFELT $ 148))
                                                   . #26#)
                                             (COND
                                              (#14#
                                               (LETT #15# (MAX #15# #16#)
                                                     . #26#))
                                              ('T
                                               (PROGN
                                                (LETT #15# #16# . #26#)
                                                (LETT #14# 'T . #26#)))))))
                                          (LETT #17# (CDR #17#) . #26#)
                                          (GO G190) G191 (EXIT NIL))
                                     (COND (#14# #15#)
                                           ('T (|IdentityError| '|max|))))
                                    . #26#)
                              (LETT |luniv| (SPADCALL |newm| (QREFELT $ 178))
                                    . #26#)
                              (LETT |nfl| (SPADCALL |luniv| (QREFELT $ 182))
                                    . #26#)
                              (LETT |nf| (LENGTH |nfl|) . #26#)
                              (COND
                               ((OR (EQL |nf| 0)
                                    (SPADCALL |nf| |nfatt| (QREFELT $ 28)))
                                (EXIT "next values")))
                              (COND
                               ((EQL |nf| 1)
                                (COND
                                 ((QEQCAR
                                   (QVELT (SPADCALL |nfl| 1 (QREFELT $ 183)) 0)
                                   0)
                                  (SEQ
                                   (LETT |base_failure| (+ |base_failure| 1)
                                         . #26#)
                                   (LETT |skip|
                                         (< |base_failure|
                                            (+
                                             (SPADCALL 3 |base_success|
                                                       (QREFELT $ 184))
                                             3))
                                         . #26#)
                                   (EXIT
                                    (LETT |luniv|
                                          (COND (|skip| |luniv|)
                                                ('T
                                                 (SPADCALL |newm|
                                                           (QREFELT $ 185))))
                                          . #26#))))
                                 ('T
                                  (SEQ
                                   (LETT |base_success| (+ |base_success| 1)
                                         . #26#)
                                   (EXIT (LETT |skip| 'NIL . #26#))))))
                               ('T
                                (SEQ
                                 (LETT |base_success| (+ |base_success| 1)
                                       . #26#)
                                 (EXIT (LETT |skip| 'NIL . #26#)))))
                              (EXIT
                               (COND (|skip| "iterate")
                                     ('T
                                      (SEQ
                                       (LETT |lunivf|
                                             (SPADCALL |luniv| (QREFELT $ 188))
                                             . #26#)
                                       (LETT |nf| (LENGTH |lunivf|) . #26#)
                                       (COND
                                        ((OR (EQL |nf| 0)
                                             (SPADCALL |nf| |nfatt|
                                                       (QREFELT $ 28)))
                                         (EXIT "next values")))
                                       (COND
                                        ((EQL |nf| 1)
                                         (SEQ
                                          (LETT |unifact| (LIST |newm|) . #26#)
                                          (EXIT
                                           (PROGN
                                            (LETT #5# |$NoValue| . #26#)
                                            (GO #5#))))))
                                       (LETT |lffc1|
                                             (SPADCALL
                                              (SPADCALL |lcnm|
                                                        (SPADCALL
                                                         (SPADCALL |luniv|
                                                                   (QREFELT $
                                                                            189))
                                                         (QREFELT $ 190))
                                                        (QREFELT $ 191))
                                              |lffc1| (QREFELT $ 56))
                                             . #26#)
                                       (EXIT
                                        (COND
                                         ((EQL |nfatt| |nf|)
                                          (SEQ
                                           (COND
                                            (|leadtest|
                                             (SEQ
                                              (LETT |unifact|
                                                    (PROGN
                                                     (LETT #13# NIL . #26#)
                                                     (SEQ
                                                      (LETT |uf| NIL . #26#)
                                                      (LETT #12# |lunivf|
                                                            . #26#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #12#)
                                                            (PROGN
                                                             (LETT |uf|
                                                                   (CAR #12#)
                                                                   . #26#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #13#
                                                              (CONS (QCAR |uf|)
                                                                    #13#)
                                                              . #26#)))
                                                      (LETT #12# (CDR #12#)
                                                            . #26#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #13#))))
                                                    . #26#)
                                              (LETT |int| |lval| . #26#)
                                              (LETT |lffc| |lffc1| . #26#)
                                              (EXIT
                                               (COND
                                                (|testp|
                                                 (LETT |leadcomp| |leadcomp1|
                                                       . #26#))))))
                                            ((SPADCALL
                                              (|MFINFACT;norm| |unifact| $)
                                              (|MFINFACT;norm|
                                               (PROGN
                                                (LETT #11# NIL . #26#)
                                                (SEQ (LETT |ff| NIL . #26#)
                                                     (LETT #10# |lunivf|
                                                           . #26#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #10#)
                                                           (PROGN
                                                            (LETT |ff|
                                                                  (CAR #10#)
                                                                  . #26#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #11#
                                                             (CONS (QCAR |ff|)
                                                                   #11#)
                                                             . #26#)))
                                                     (LETT #10# (CDR #10#)
                                                           . #26#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #11#))))
                                               $)
                                              (QREFELT $ 192))
                                             (COND
                                              (|testp|
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |lffc1| |clc|
                                                            (QREFELT $ 56))
                                                  (LENGTH |plist|) |leadcomp1|
                                                  (QREFELT $ 166))
                                                 (SEQ
                                                  (LETT |unifact|
                                                        (PROGN
                                                         (LETT #9# NIL . #26#)
                                                         (SEQ
                                                          (LETT |uf| NIL
                                                                . #26#)
                                                          (LETT #8# |lunivf|
                                                                . #26#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #8#)
                                                                (PROGN
                                                                 (LETT |uf|
                                                                       (CAR
                                                                        #8#)
                                                                       . #26#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #9#
                                                                  (CONS
                                                                   (QCAR |uf|)
                                                                   #9#)
                                                                  . #26#)))
                                                          (LETT #8# (CDR #8#)
                                                                . #26#)
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #9#))))
                                                        . #26#)
                                                  (LETT |int| |lval| . #26#)
                                                  (LETT |lffc| |lffc1| . #26#)
                                                  (EXIT
                                                   (COND
                                                    (|testp|
                                                     (LETT |leadcomp|
                                                           |leadcomp1|
                                                           . #26#))))))))
                                              ('T
                                               (SEQ
                                                (LETT |unifact|
                                                      (PROGN
                                                       (LETT #7# NIL . #26#)
                                                       (SEQ
                                                        (LETT |uf| NIL . #26#)
                                                        (LETT #6# |lunivf|
                                                              . #26#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #6#)
                                                              (PROGN
                                                               (LETT |uf|
                                                                     (CAR #6#)
                                                                     . #26#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #7#
                                                                (CONS
                                                                 (QCAR |uf|)
                                                                 #7#)
                                                                . #26#)))
                                                        (LETT #6# (CDR #6#)
                                                              . #26#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #7#))))
                                                      . #26#)
                                                (LETT |int| |lval| . #26#)
                                                (LETT |lffc| |lffc1| . #26#)
                                                (EXIT
                                                 (COND
                                                  (|testp|
                                                   (LETT |leadcomp| |leadcomp1|
                                                         . #26#)))))))))
                                           (EXIT
                                            (PROGN
                                             (LETT #5# |$NoValue| . #26#)
                                             (GO #5#)))))
                                         ((SPADCALL |nfatt| |degum|
                                                    (QREFELT $ 28))
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #4# NIL . #26#)
                                                  (SEQ (LETT |uf| NIL . #26#)
                                                       (LETT #3# |lunivf|
                                                             . #26#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #3#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #3#)
                                                                    . #26#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #4#
                                                               (CONS
                                                                (QCAR |uf|)
                                                                #4#)
                                                               . #26#)))
                                                       (LETT #3# (CDR #3#)
                                                             . #26#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #4#))))
                                                 . #26#)
                                           (LETT |lffc| |lffc1| . #26#)
                                           (COND
                                            (|testp|
                                             (LETT |leadcomp| |leadcomp1|
                                                   . #26#)))
                                           (LETT |int| |lval| . #26#)
                                           (LETT |leadtest| 'NIL . #26#)
                                           (EXIT (LETT |nfatt| |nf| . #26#))))
                                         ((SPADCALL |nfatt| |nf|
                                                    (QREFELT $ 28))
                                          (SEQ
                                           (COND
                                            (|testp|
                                             (LETT |leadtest|
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |lffc| |clc|
                                                                (QREFELT $ 56))
                                                      (LENGTH |plist|)
                                                      |leadcomp|
                                                      (QREFELT $ 166))
                                                     'NIL)
                                                    ('T 'T))
                                                   . #26#))
                                            ('T (LETT |leadtest| 'NIL . #26#)))
                                           (COND
                                            ((NULL |leadtest|)
                                             (SEQ
                                              (LETT |unifact|
                                                    (PROGN
                                                     (LETT #2# NIL . #26#)
                                                     (SEQ
                                                      (LETT |uf| NIL . #26#)
                                                      (LETT #1# |lunivf|
                                                            . #26#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |uf|
                                                                   (CAR #1#)
                                                                   . #26#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #2#
                                                              (CONS (QCAR |uf|)
                                                                    #2#)
                                                              . #26#)))
                                                      (LETT #1# (CDR #1#)
                                                            . #26#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #2#))))
                                                    . #26#)
                                              (LETT |lffc| |lffc1| . #26#)
                                              (COND
                                               (|testp|
                                                (LETT |leadcomp| |leadcomp1|
                                                      . #26#)))
                                              (EXIT
                                               (LETT |int| |lval| . #26#)))))
                                           (EXIT
                                            (LETT |nfatt| |nf|
                                                  . #26#)))))))))))))))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (EXIT (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|)))))) 

(DEFUN |MFINFACT;constantCase| (|m| |factorlist| $)
  (PROG (#1=#:G445 |pp| #2=#:G444 |lunm|)
    (RETURN
     (SEQ
      (LETT |lunm|
            (SPADCALL (SPADCALL |m| (QREFELT $ 128)) 'NIL (QREFELT $ 196))
            . #3=(|MFINFACT;constantCase|))
      (EXIT
       (CONS (SPADCALL (QCAR |lunm|) (QREFELT $ 95))
             (APPEND |factorlist|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |pp| NIL . #3#) (LETT #1# (QCDR |lunm|) . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |pp| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS (SPADCALL (QCAR |pp|) (QREFELT $ 96))
                                          (QCDR |pp|))
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |MFINFACT;simplify| (|m| |dm| |lvar| |lmdeg| $)
  (PROG (|flead| #1=#:G451 |factorlist| |pol1| |i| #2=#:G456 |x|)
    (RETURN
     (SEQ (LETT |factorlist| NIL . #3=(|MFINFACT;simplify|))
          (LETT |pol1| (|spadConstant| $ 31) . #3#)
          (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |i|
                      (SPADCALL |lmdeg| (SPADCALL |x| |lvar| (QREFELT $ 197))
                                (QREFELT $ 198))
                      . #3#)
                (EXIT
                 (COND ((EQL |i| 0) "next value")
                       ('T
                        (SEQ
                         (LETT |pol1|
                               (SPADCALL |pol1|
                                         (SPADCALL (|spadConstant| $ 31) |x|
                                                   |i| (QREFELT $ 199))
                                         (QREFELT $ 200))
                               . #3#)
                         (EXIT
                          (LETT |factorlist|
                                (CONS (CONS (SPADCALL |x| (QREFELT $ 201)) |i|)
                                      |factorlist|)
                                . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |m|
                (PROG2 (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 87)) . #3#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| (QREFELT $ 8))
                                  (QREFELT $ 6))
                                 #1#))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |m| (QREFELT $ 53))
             (|MFINFACT;constantCase| |m| |factorlist| $))
            ('T
             (SEQ (LETT |flead| (|MFINFACT;mFactor| |m| |dm| $) . #3#)
                  (PROGN
                   (RPLACD |flead| (APPEND |factorlist| (QCDR |flead|)))
                   (QCDR |flead|))
                  (EXIT |flead|))))))))) 

(DEFUN |MFINFACT;mfconst| (|um| |dm| |lvar| |ldeg| $)
  (PROG (#1=#:G466 |lumf| #2=#:G465 |lum| |um1| |factfin|)
    (RETURN
     (SEQ (LETT |factfin| NIL . #3=(|MFINFACT;mfconst|))
          (EXIT
           (COND
            ((NULL |lvar|)
             (SEQ
              (LETT |um1| (SPADCALL (ELT $ 202) |um| (QREFELT $ 205)) . #3#)
              (LETT |lum| (SPADCALL |um1| (QREFELT $ 185)) . #3#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |lumf| NIL . #3#)
                     (LETT #1# (SPADCALL |lum| (QREFELT $ 188)) . #3#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |lumf| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (ELT $ 96) (QCAR |lumf|)
                                        (QREFELT $ 208))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))
            ('T
             (|MFINFACT;intfact| |um| |lvar| |ldeg|
              (CONS (|spadConstant| $ 25) NIL) NIL $)))))))) 

(DEFUN |MFINFACT;mfpol| (|um| |dm| |lvar| |ldeg| $)
  (PROG (|tleadpol|)
    (RETURN
     (SEQ
      (LETT |tleadpol|
            (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT $ 52)) |dm| $)
            |MFINFACT;mfpol|)
      (EXIT (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL $)))))) 

(DEFUN |MFINFACT;factor;PGF;19| (|m| $)
  (PROG (#1=#:G477 #2=#:G476 #3=#:G478 #4=#:G485 |u| |flist| |cm| |dx|
         #5=#:G473 #6=#:G472 #7=#:G474 #8=#:G484 #9=#:G104 |ld| #10=#:G483 |x|
         #11=#:G482 |lv|)
    (RETURN
     (SEQ
      (LETT |lv| (SPADCALL |m| (QREFELT $ 209))
            . #12=(|MFINFACT;factor;PGF;19|))
      (EXIT
       (COND
        ((SPADCALL |lv| NIL (QREFELT $ 210))
         (SPADCALL |m| NIL (QREFELT $ 213)))
        (#13='T
         (SEQ
          (LETT |ld|
                (PROGN
                 (LETT #11# NIL . #12#)
                 (SEQ (LETT |x| NIL . #12#) (LETT #10# |lv| . #12#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT |x| (CAR #10#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS (SPADCALL |m| |x| (QREFELT $ 214)) #11#)
                              . #12#)))
                      (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                . #12#)
          (LETT |dx|
                (PROGN
                 (LETT #5# NIL . #12#)
                 (SEQ (LETT #9# NIL . #12#) (LETT #8# |ld| . #12#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT #9# (CAR #8#) . #12#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #7# #9# . #12#)
                         (COND (#5# (LETT #6# (MIN #6# #7#) . #12#))
                               ('T
                                (PROGN
                                 (LETT #6# #7# . #12#)
                                 (LETT #5# 'T . #12#)))))))
                      (LETT #8# (CDR #8#) . #12#) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #6#) (#13# (|IdentityError| '|min|))))
                . #12#)
          (SETELT $ 10
                  (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT $ 64))
                            (QREFELT $ 65)))
          (LETT |cm| (|MFINFACT;pushdown| |m| (QREFELT $ 10) $) . #12#)
          (LETT |flist| (|MFINFACT;mFactor| |cm| |dx| $) . #12#)
          (EXIT
           (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) (QREFELT $ 10) $)
                     (PROGN
                      (LETT #1# NIL . #12#)
                      (SEQ (LETT |u| NIL . #12#)
                           (LETT #4# (QCDR |flist|) . #12#) G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |u| (CAR #4#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL
                                     (|MFINFACT;pushup| (QCAR |u|)
                                      (QREFELT $ 10) $)
                                     (QCDR |u|) (QREFELT $ 215))
                                    . #12#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 216))
                                      . #12#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #12#)
                                 (LETT #1# 'T . #12#)))))))
                           (LETT #4# (CDR #4#) . #12#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) (#13# (|spadConstant| $ 81))))
                     (QREFELT $ 217))))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G486)
  (PROG ()
    (RETURN
     (PROG (#2=#:G487)
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
              (HREM |$ConstructorCache| '|MultFiniteFactorize|))))))))))) 

(DEFUN |MultFiniteFactorize;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultFiniteFactorize|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MultFiniteFactorize| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 219) . #1#)
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
      (QSETREFV $ 10 NIL)
      $)))) 

(MAKEPROP '|MultFiniteFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|basicVar|
              (|SparseMultivariatePolynomial| 24 6)
              (|SparseUnivariatePolynomial| 11) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |degree|) (10 . |ground|) (|List| 11)
              (15 . |coefficients|) (|List| 6) (20 . |variables|)
              (25 . |setUnion|) (31 . |Zero|) (35 . |Zero|)
              (|SparseUnivariatePolynomial| 8) (39 . |Zero|)
              (43 . |minimumDegree|) (|Boolean|) (48 . >) (54 . |One|)
              (58 . |One|) (62 . |One|) (66 . |monomial|) (|Union| $ '"failed")
              (72 . |exquo|) (|SparseUnivariatePolynomial| 9) (|Mapping| 9 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 12 9 35)
              (78 . |map|) (|Factored| $) (84 . |squareFree|) (|Factored| 35)
              (89 . |unit|) (|Mapping| 11 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 35 11 12)
              (94 . |map|) (100 . |ground?|)
              (|Record| (|:| |factor| 35) (|:| |exponent| 63)) (|List| 47)
              (105 . |factors|) (110 . |content|) (115 . |degree|)
              (121 . |leadingCoefficient|) (126 . |ground?|)
              (131 . |leadingCoefficient|) (136 . ^) (142 . *) (148 . |One|)
              (152 . |exquo|) (|FactoringUtilities| 7 6 8 9)
              (158 . |variables|) (|List| 14) (163 . |degree|) (|Integer|)
              (169 . |position|) (175 . |elt|) (181 . |coerce|)
              (186 . |primeFactor|) (192 . *) (198 . |One|) (202 . *)
              |MFINFACT;factor;SupF;3| (208 . |minimumDegree|)
              (214 . |squareFree|) (|Factored| 9) (219 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 63)) (|List| 76)
              (224 . |factors|) (229 . |degree|) (235 . |One|) (239 . |One|)
              (243 . |member?|) (|SparseUnivariatePolynomial| $)
              (249 . |univariate|) (|List| $) (255 . |gcd|) (260 . |exquo|)
              (266 . ~=) (272 . ~=) (278 . |exquo|) (284 . |multivariate|)
              (290 . |leadingCoefficient|) (295 . ~=) (301 . |inv|)
              (306 . |coerce|) (311 . |coerce|) (316 . *) (322 . |monomial|)
              (328 . |size|) (|PositiveInteger|) (332 . |index|) (337 . +)
              (|List| 121) (|GenExEuclid| 24 121) (343 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (349 . |createIrreduciblePoly|) (|Union| 24 '"failed")
              (354 . |nextIrreduciblePoly|) (|Mapping| 24 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 24 9 11)
              (359 . |map|)
              (|Record| (|:| |polfac| 17) (|:| |correct| 24)
                        (|:| |corrfact| 103))
              (|Union| 113 '"failed") (|Record| (|:| |irr| 11) (|:| |pow| 63))
              (|Record| (|:| |contp| 24) (|:| |factors| (|List| 115)))
              (|List| 24)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 24 11)
              (365 . |distFact|) (375 . ~=) (|SparseUnivariatePolynomial| 24)
              (381 . |elt|) (387 . *) (|Union| (|List| 12) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 24 11)
              (393 . |lifting|) (404 . |primitivePart|) (409 . |retract|)
              (414 . |Zero|) (418 . |Zero|) (422 . |leadingMonomial|)
              (427 . |monomial|) (434 . +) (440 . |reductum|) (445 . |ground?|)
              (450 . |retract|) (455 . |univariate|) (461 . |Zero|) (465 . ~=)
              (471 . |degree|) (476 . |leadingCoefficient|) (481 . *) (487 . +)
              (493 . |reductum|) (498 . |ground?|) (503 . |retract|)
              (508 . |coerce|) (513 . |degree|) (518 . |monomial|)
              (525 . |reductum|) (530 . |random|) (534 . |delete|)
              (540 . |delete|) (546 . |degree|) (551 . =) (|List| 117)
              (557 . |member?|) (563 . |eval|) (570 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 24 11)
              (575 . |completeEval|) (582 . ~=) (588 . |minimumDegree|)
              (593 . |content|) (598 . |exquo|) (604 . |polCase|)
              (611 . |differentiate|) (616 . |differentiate|)
              (621 . |differentiate|) (626 . |differentiate|) (|Mapping| 24 24)
              (631 . |map|) (637 . |gcd|) (642 . |leadingCoefficient|)
              (647 . |coefficients|) (|Factored| 121) (|TwoFactorize| 8)
              (652 . |tryTwoFactor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 179) (|:| |fctr| 121) (|:| |xpnt| 63))
              (|List| 180) (657 . |factorList|) (662 . |elt|) (668 . *)
              (674 . |generalTwoFactor|)
              (|Record| (|:| |factor| 121) (|:| |exponent| 63)) (|List| 186)
              (679 . |factors|) (684 . |unit|) (689 . |retract|) (694 . *)
              (700 . >) (|Record| (|:| |irr| 24) (|:| |pow| 63))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 193)))
              (|DistinctDegreeFactorize| 8 24) (706 . |distdfact|)
              (712 . |position|) (718 . |elt|) (724 . |monomial|) (731 . *)
              (737 . |coerce|) (742 . |ground|) (|Mapping| 24 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 12 24 121)
              (747 . |map|) (|Mapping| 11 24)
              (|UnivariatePolynomialCategoryFunctions2| 24 121 11 12)
              (753 . |map|) (759 . |variables|) (764 . =)
              (|Record| (|:| |flg| 179) (|:| |fctr| 9) (|:| |xpnt| 63))
              (|List| 211) (770 . |makeFR|) (776 . |degree|)
              (782 . |primeFactor|) (788 . *) (794 . *)
              |MFINFACT;factor;PGF;19|)
           '#(|factor| 800) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 218
                                                 '(1 12 0 11 13 1 12 14 0 15 1
                                                   12 11 0 16 1 12 17 0 18 1 11
                                                   19 0 20 2 19 0 0 0 21 0 7 0
                                                   22 0 8 0 23 0 24 0 25 1 12
                                                   14 0 26 2 14 27 0 0 28 0 8 0
                                                   29 0 9 0 30 0 11 0 31 2 12 0
                                                   11 14 32 2 12 33 0 0 34 2 37
                                                   35 36 12 38 1 35 39 0 40 1
                                                   41 35 0 42 2 44 12 43 35 45
                                                   1 12 27 0 46 1 41 48 0 49 1
                                                   12 11 0 50 2 11 14 0 6 51 1
                                                   12 11 0 52 1 11 27 0 53 1 11
                                                   24 0 54 2 24 0 0 14 55 2 24
                                                   0 0 0 56 0 24 0 57 2 24 33 0
                                                   0 58 1 59 19 35 60 2 59 61
                                                   35 19 62 2 61 63 14 0 64 2
                                                   19 6 0 63 65 1 35 0 9 66 2
                                                   41 0 35 63 67 2 41 0 0 0 68
                                                   0 41 0 69 2 41 0 35 0 70 2
                                                   11 61 0 19 72 1 9 39 0 73 1
                                                   74 9 0 75 1 74 77 0 78 2 11
                                                   61 0 19 79 0 12 0 80 0 74 0
                                                   81 2 61 27 14 0 82 2 11 83 0
                                                   6 84 1 11 0 85 86 2 11 33 0
                                                   0 87 2 6 27 0 0 88 2 11 27 0
                                                   0 89 2 12 33 0 11 90 2 11 0
                                                   83 6 91 1 24 8 0 92 2 8 27 0
                                                   0 93 1 8 0 0 94 1 24 0 8 95
                                                   1 11 0 24 96 2 12 0 11 0 97
                                                   2 24 0 8 14 98 0 8 14 99 1 8
                                                   0 100 101 2 24 0 0 0 102 2
                                                   104 27 24 103 105 1 106 24
                                                   100 107 1 106 108 24 109 2
                                                   111 11 110 9 112 6 118 114
                                                   24 103 116 117 19 117 119 2
                                                   24 27 0 0 120 2 103 121 0 63
                                                   122 2 121 0 24 0 123 7 125
                                                   124 12 19 103 117 17 61 24
                                                   126 1 12 0 0 127 1 11 24 0
                                                   128 0 9 0 129 0 11 0 130 1
                                                   11 0 0 131 3 9 0 0 19 61 132
                                                   2 9 0 0 0 133 1 11 0 0 134 1
                                                   9 27 0 135 1 9 8 0 136 2 9
                                                   83 0 6 137 0 35 0 138 2 35
                                                   27 0 0 139 1 35 14 0 140 1
                                                   35 9 0 141 2 11 0 24 0 142 2
                                                   11 0 0 0 143 1 35 0 0 144 1
                                                   24 27 0 145 1 24 8 0 146 1 9
                                                   0 8 147 1 24 14 0 148 3 9 0
                                                   0 6 14 149 1 24 0 0 150 0 8
                                                   0 151 2 61 0 0 63 152 2 19 0
                                                   0 63 153 1 121 14 0 154 2 17
                                                   27 0 0 155 2 156 27 117 0
                                                   157 3 11 0 0 19 117 158 1 24
                                                   27 0 159 3 160 121 12 19 117
                                                   161 2 14 27 0 0 162 1 121 14
                                                   0 163 1 121 24 0 164 2 121
                                                   33 0 24 165 3 118 27 24 14
                                                   117 166 1 121 0 0 167 1 8 0
                                                   0 168 1 24 0 0 169 1 12 0 0
                                                   170 2 121 0 171 0 172 1 121
                                                   0 85 173 1 121 24 0 174 1
                                                   121 117 0 175 1 177 176 121
                                                   178 1 176 181 0 182 2 181
                                                   180 0 63 183 2 63 0 100 0
                                                   184 1 177 176 121 185 1 176
                                                   187 0 188 1 176 121 0 189 1
                                                   121 24 0 190 2 24 0 8 0 191
                                                   2 63 27 0 0 192 2 195 194 24
                                                   27 196 2 19 63 6 0 197 2 61
                                                   14 0 63 198 3 11 0 0 6 14
                                                   199 2 11 0 0 0 200 1 11 0 6
                                                   201 1 11 24 0 202 2 204 121
                                                   203 12 205 2 207 12 206 121
                                                   208 1 9 19 0 209 2 19 27 0 0
                                                   210 2 74 0 9 212 213 2 9 14
                                                   0 6 214 2 74 0 9 63 215 2 74
                                                   0 0 0 216 2 74 0 9 0 217 1 0
                                                   41 35 71 1 0 74 9 218)))))
           '|lookupComplete|)) 
