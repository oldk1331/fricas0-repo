
(/VERSIONCHECK 2) 

(DEFUN |INNMFACT;convertPUP| (|lfg| $)
  (PROG (#1=#:G164 |lff| #2=#:G163)
    (RETURN
     (SEQ
      (CONS (QCAR |lfg|)
            (PROGN
             (LETT #2# NIL . #3=(|INNMFACT;convertPUP|))
             (SEQ (LETT |lff| NIL . #3#) (LETT #1# (QCDR |lfg|) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |lff| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (CONS (SPADCALL (QCAR |lff|) (QREFELT $ 18))
                                 (QCDR |lff|))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(DEFUN |INNMFACT;supFactor| (|um| |ufactor| $)
  (PROG (#1=#:G206 |lcfacs| #2=#:G201 #3=#:G200 #4=#:G202 #5=#:G204 #6=#:G223
         |f| |factorlist| |auxfl| #7=#:G222 |lfp| #8=#:G221 |lf| |ldeg|
         #9=#:G190 #10=#:G189 #11=#:G191 #12=#:G220 |fc| #13=#:G219 |xx|
         #14=#:G218 |coefs| #15=#:G217 |lff| #16=#:G216 |lcont| |lfg| |ffexp|
         |ffactor| #17=#:G215 |fact| |sqqfact| |flead| |sqfacs| |uum|
         #18=#:G211 #19=#:G177 |f1| |mdeg| #20=#:G214 |ff| #21=#:G213 |lfact|
         |umv| |lvar| #22=#:G168 #23=#:G167 #24=#:G169 #25=#:G212 |cf|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |um| (QREFELT $ 20))
         (|INNMFACT;convertPUP|
          (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 21)) |ufactor| $) $))
        (#26='T
         (SEQ
          (LETT |lvar|
                (PROGN
                 (LETT #22# NIL . #27=(|INNMFACT;supFactor|))
                 (SEQ (LETT |cf| NIL . #27#)
                      (LETT #25# (SPADCALL |um| (QREFELT $ 23)) . #27#) G190
                      (COND
                       ((OR (ATOM #25#)
                            (PROGN (LETT |cf| (CAR #25#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #24# (SPADCALL |cf| (QREFELT $ 25)) . #27#)
                         (COND
                          (#22#
                           (LETT #23# (SPADCALL #23# #24# (QREFELT $ 26))
                                 . #27#))
                          ('T
                           (PROGN
                            (LETT #23# #24# . #27#)
                            (LETT #22# 'T . #27#)))))))
                      (LETT #25# (CDR #25#) . #27#) (GO G190) G191 (EXIT NIL))
                 (COND (#22# #23#) (#26# (|IdentityError| '|setUnion|))))
                . #27#)
          (EXIT
           (COND
            ((NULL |lvar|)
             (SEQ (LETT |umv| (SPADCALL (ELT $ 27) |um| (QREFELT $ 31)) . #27#)
                  (LETT |lfact| (SPADCALL |umv| |ufactor|) . #27#)
                  (EXIT
                   (CONS
                    (SPADCALL (SPADCALL |lfact| (QREFELT $ 33)) (QREFELT $ 34))
                    (PROGN
                     (LETT #21# NIL . #27#)
                     (SEQ (LETT |ff| NIL . #27#)
                          (LETT #20# (SPADCALL |lfact| (QREFELT $ 37)) . #27#)
                          G190
                          (COND
                           ((OR (ATOM #20#)
                                (PROGN (LETT |ff| (CAR #20#) . #27#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #21#
                                  (CONS
                                   (CONS
                                    (SPADCALL (ELT $ 38) (QCAR |ff|)
                                              (QREFELT $ 41))
                                    (QCDR |ff|))
                                   #21#)
                                  . #27#)))
                          (LETT #20# (CDR #20#) . #27#) (GO G190) G191
                          (EXIT (NREVERSE #21#))))))))
            (#26#
             (SEQ (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #27#)
                  (LETT |factorlist| NIL . #27#)
                  (LETT |mdeg| (SPADCALL |um| (QREFELT $ 45)) . #27#)
                  (COND
                   ((SPADCALL |mdeg| 0 (QREFELT $ 46))
                    (SEQ
                     (LETT |f1|
                           (SPADCALL (|spadConstant| $ 48) |mdeg|
                                     (QREFELT $ 49))
                           . #27#)
                     (LETT |um|
                           (PROG2
                               (LETT #19# (SPADCALL |um| |f1| (QREFELT $ 51))
                                     . #27#)
                               (QCDR #19#)
                             (|check_union| (QEQCAR #19# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 9))
                                            #19#))
                           . #27#)
                     (LETT |factorlist|
                           (CONS
                            (CONS
                             (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))
                             |mdeg|)
                            |factorlist|)
                           . #27#)
                     (EXIT
                      (COND
                       ((EQL (SPADCALL |um| (QREFELT $ 52)) 0)
                        (PROGN
                         (LETT #18#
                               (SEQ
                                (LETT |lfg|
                                      (|INNMFACT;convertPUP|
                                       (|INNMFACT;mFactor|
                                        (SPADCALL |um| (QREFELT $ 21))
                                        |ufactor| $)
                                       $)
                                      . #27#)
                                (EXIT
                                 (CONS (QCAR |lfg|)
                                       (APPEND |factorlist| (QCDR |lfg|)))))
                               . #27#)
                         (GO #18#))))))))
                  (LETT |uum| (SPADCALL |um| (QREFELT $ 54)) . #27#)
                  (LETT |um| (QVELT |uum| 1) . #27#)
                  (LETT |sqfacs| (SPADCALL |um| (QREFELT $ 57)) . #27#)
                  (LETT |lcont|
                        (SPADCALL
                         (SPADCALL (QVELT |uum| 0)
                                   (SPADCALL |sqfacs| (QREFELT $ 58))
                                   (QREFELT $ 59))
                         (QREFELT $ 21))
                        . #27#)
                  (LETT |flead|
                        (|INNMFACT;convertPUP|
                         (|INNMFACT;mFactor| |lcont| |ufactor| $) $)
                        . #27#)
                  (LETT |factorlist| (APPEND (QCDR |flead|) |factorlist|)
                        . #27#)
                  (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 62)) . #27#)
                  (SEQ (LETT |fact| NIL . #27#) (LETT #17# |sqqfact| . #27#)
                       G190
                       (COND
                        ((OR (ATOM #17#)
                             (PROGN (LETT |fact| (CAR #17#) . #27#) NIL))
                         (GO G191)))
                       (SEQ (LETT |ffactor| (QCAR |fact|) . #27#)
                            (LETT |ffexp| (QCDR |fact|) . #27#)
                            (EXIT
                             (COND
                              ((ZEROP (SPADCALL |ffactor| (QREFELT $ 52)))
                               (SEQ
                                (LETT |lfg|
                                      (|INNMFACT;mFactor|
                                       (SPADCALL |ffactor| (QREFELT $ 21))
                                       |ufactor| $)
                                      . #27#)
                                (LETT |lcont|
                                      (SPADCALL (QCAR |lfg|) |lcont|
                                                (QREFELT $ 63))
                                      . #27#)
                                (EXIT
                                 (LETT |factorlist|
                                       (APPEND |factorlist|
                                               (PROGN
                                                (LETT #16# NIL . #27#)
                                                (SEQ (LETT |lff| NIL . #27#)
                                                     (LETT #15# (QCDR |lfg|)
                                                           . #27#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #15#)
                                                           (PROGN
                                                            (LETT |lff|
                                                                  (CAR #15#)
                                                                  . #27#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #16#
                                                             (CONS
                                                              (CONS
                                                               (SPADCALL
                                                                (QCAR |lff|)
                                                                (QREFELT $ 18))
                                                               (* (QCDR |lff|)
                                                                  |ffexp|))
                                                              #16#)
                                                             . #27#)))
                                                     (LETT #15# (CDR #15#)
                                                           . #27#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #16#)))))
                                       . #27#))))
                              ('T
                               (SEQ
                                (LETT |coefs|
                                      (SPADCALL |ffactor| (QREFELT $ 23))
                                      . #27#)
                                (LETT |ldeg|
                                      (PROGN
                                       (LETT #14# NIL . #27#)
                                       (SEQ (LETT |xx| NIL . #27#)
                                            (LETT #13# |lvar| . #27#) G190
                                            (COND
                                             ((OR (ATOM #13#)
                                                  (PROGN
                                                   (LETT |xx| (CAR #13#)
                                                         . #27#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #14#
                                                    (CONS
                                                     (PROGN
                                                      (LETT #9# NIL . #27#)
                                                      (SEQ
                                                       (LETT |fc| NIL . #27#)
                                                       (LETT #12# |coefs|
                                                             . #27#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #12#)
                                                             (PROGN
                                                              (LETT |fc|
                                                                    (CAR #12#)
                                                                    . #27#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #11#
                                                                (SPADCALL |fc|
                                                                          |xx|
                                                                          (QREFELT
                                                                           $
                                                                           64))
                                                                . #27#)
                                                          (COND
                                                           (#9#
                                                            (LETT #10#
                                                                  (MAX #10#
                                                                       #11#)
                                                                  . #27#))
                                                           ('T
                                                            (PROGN
                                                             (LETT #10# #11#
                                                                   . #27#)
                                                             (LETT #9# 'T
                                                                   . #27#)))))))
                                                       (LETT #12# (CDR #12#)
                                                             . #27#)
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                      (COND (#9# #10#)
                                                            ('T
                                                             (|IdentityError|
                                                              '|max|))))
                                                     #14#)
                                                    . #27#)))
                                            (LETT #13# (CDR #13#) . #27#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #14#))))
                                      . #27#)
                                (LETT |lf|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |ffactor| (QREFELT $ 65))
                                         (QREFELT $ 66))
                                        (|INNMFACT;mfconst| |ffactor| |lvar|
                                         |ldeg| |ufactor| $))
                                       ('T
                                        (|INNMFACT;mfpol| |ffactor| |lvar|
                                         |ldeg| |ufactor| $)))
                                      . #27#)
                                (LETT |auxfl|
                                      (PROGN
                                       (LETT #8# NIL . #27#)
                                       (SEQ (LETT |lfp| NIL . #27#)
                                            (LETT #7# |lf| . #27#) G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |lfp| (CAR #7#)
                                                         . #27#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #8#
                                                    (CONS (CONS |lfp| |ffexp|)
                                                          #8#)
                                                    . #27#)))
                                            (LETT #7# (CDR #7#) . #27#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #8#))))
                                      . #27#)
                                (EXIT
                                 (LETT |factorlist|
                                       (APPEND |factorlist| |auxfl|)
                                       . #27#)))))))
                       (LETT #17# (CDR #17#) . #27#) (GO G190) G191 (EXIT NIL))
                  (LETT |lcfacs|
                        (PROGN
                         (LETT #2# NIL . #27#)
                         (SEQ (LETT |f| NIL . #27#)
                              (LETT #6# |factorlist| . #27#) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |f| (CAR #6#) . #27#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (QCAR |f|) (QREFELT $ 65))
                                         (QREFELT $ 67))
                                        (PROG1 (LETT #5# (QCDR |f|) . #27#)
                                          (|check_subtype| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           #5#))
                                        (QREFELT $ 68))
                                       . #27#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 69))
                                         . #27#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #27#)
                                    (LETT #2# 'T . #27#)))))))
                              (LETT #6# (CDR #6#) . #27#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#26# (|spadConstant| $ 47))))
                        . #27#)
                  (EXIT
                   (CONS
                    (PROG2
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL (SPADCALL |um| (QREFELT $ 65))
                                         (QREFELT $ 67))
                               |lcfacs| (QREFELT $ 70))
                              . #27#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
                    |factorlist|))))))))))
      #18# (EXIT #18#))))) 

(DEFUN |INNMFACT;factor;SupMF;3| (|um| |ufactor| $)
  (PROG (#1=#:G227 #2=#:G226 #3=#:G228 #4=#:G232 |u| |flist|)
    (RETURN
     (SEQ
      (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| $)
            . #5=(|INNMFACT;factor;SupMF;3|))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38)) (QREFELT $ 18))
        (PROGN
         (LETT #1# NIL . #5#)
         (SEQ (LETT |u| NIL . #5#) (LETT #4# (QCDR |flist|) . #5#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT $ 71))
                       . #5#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 72)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
              (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) ('T (|spadConstant| $ 73))))
        (QREFELT $ 74))))))) 

(DEFUN |INNMFACT;checkzero| (|u| |um| $)
  (COND
   ((SPADCALL |u| (|spadConstant| $ 77) (QREFELT $ 78))
    (SPADCALL |um| (|spadConstant| $ 79) (QREFELT $ 80)))
   ((SPADCALL |um| (|spadConstant| $ 79) (QREFELT $ 80)) 'NIL)
   (#1='T
    (COND
     ((EQL (SPADCALL |u| (QREFELT $ 52)) (SPADCALL |um| (QREFELT $ 81)))
      (|INNMFACT;checkzero| (SPADCALL |u| (QREFELT $ 82))
       (SPADCALL |um| (QREFELT $ 83)) $))
     (#1# 'NIL))))) 

(DEFUN |INNMFACT;varChoose| (|m| |lvar| |ldeg| $)
  (PROG (|x| |i| |k| #1=#:G237 #2=#:G236 #3=#:G238 #4=#:G242 |d|)
    (RETURN
     (SEQ
      (LETT |k|
            (PROGN
             (LETT #1# NIL . #5=(|INNMFACT;varChoose|))
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
        ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 64)))
         (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT $ 85)) |lvar|
                 |ldeg|))
        (#6#
         (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT $ 87)) . #5#)
              (LETT |x| (SPADCALL |lvar| |i| (QREFELT $ 88)) . #5#)
              (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT $ 89)))
                    . #5#)
              (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT $ 90)))
                    . #5#)
              (EXIT
               (VECTOR (SPADCALL |m| |x| (QREFELT $ 85)) |lvar| |ldeg|)))))))))) 

(DEFUN |INNMFACT;localNorm| (|lum| $)
  (PROG (#1=#:G247 #2=#:G246 #3=#:G248 #4=#:G250 #5=#:G249 #6=#:G251 |cc|
         #7=#:G255 |i| #8=#:G254 |ff| #9=#:G244 #10=#:G243 #11=#:G245
         #12=#:G253)
    (RETURN
     (SEQ
      (COND
       ((|domainEqual| (QREFELT $ 8) (|AlgebraicNumber|))
        (PROGN
         (LETT #9# NIL . #13=(|INNMFACT;localNorm|))
         (SEQ (LETT |ff| NIL . #13#) (LETT #12# |lum| . #13#) G190
              (COND
               ((OR (ATOM #12#) (PROGN (LETT |ff| (CAR #12#) . #13#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #11# (SPADCALL |ff| (QREFELT $ 91)) . #13#)
                 (COND (#9# (LETT #10# (MAX #10# #11#) . #13#))
                       ('T
                        (PROGN
                         (LETT #10# #11# . #13#)
                         (LETT #9# 'T . #13#)))))))
              (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
         (COND (#9# #10#) (#14='T (|IdentityError| '|max|)))))
       (#14#
        (PROGN
         (LETT #1# NIL . #13#)
         (SEQ (LETT |ff| NIL . #13#) (LETT #8# |lum| . #13#) G190
              (COND
               ((OR (ATOM #8#) (PROGN (LETT |ff| (CAR #8#) . #13#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (PROGN
                        (LETT #4# NIL . #13#)
                        (SEQ (LETT |i| 0 . #13#)
                             (LETT #7# (SPADCALL |ff| (QREFELT $ 81)) . #13#)
                             G190 (COND ((|greater_SI| |i| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |cc| (SPADCALL |ff| |i| (QREFELT $ 92))
                                        . #13#)
                                  (|spadConstant| $ 43) (QREFELT $ 93))
                                 (PROGN
                                  (LETT #6# (SPADCALL |cc| (QREFELT $ 94))
                                        . #13#)
                                  (COND (#4# (LETT #5# (+ #5# #6#) . #13#))
                                        ('T
                                         (PROGN
                                          (LETT #5# #6# . #13#)
                                          (LETT #4# 'T . #13#)))))))))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#4# #5#) ('T 0)))
                       . #13#)
                 (COND (#1# (LETT #2# (MAX #2# #3#) . #13#))
                       ('T
                        (PROGN (LETT #2# #3# . #13#) (LETT #1# 'T . #13#)))))))
              (LETT #8# (CDR #8#) . #13#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#14# (|IdentityError| '|max|)))))))))) 

(DEFUN |INNMFACT;intChoose| (|um| |lvar| |clc| |plist| |ltry| |ufactor| $)
  (PROG (|nfatt| |int| |leadcomp| |lffc| |unifact| #1=#:G314 |uf| #2=#:G313
         |leadtest| #3=#:G312 #4=#:G311 #5=#:G296 #6=#:G310 #7=#:G309 #8=#:G308
         #9=#:G307 #10=#:G306 |ff| #11=#:G305 #12=#:G304 #13=#:G303 |nf|
         |lffc1| |lunivf| |luniv| |range| |newm| #14=#:G271 #15=#:G265
         #16=#:G264 #17=#:G266 #18=#:G302 |epl| |leadcomp1| #19=#:G301 |pol|
         #20=#:G300 |lval| |i| #21=#:G299 #22=#:G298 |newunifact| |testp|
         |ctf1| |nvar1| |degum|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |degum| (SPADCALL |um| (QREFELT $ 52))
              . #23=(|INNMFACT;intChoose|))
        (LETT |nvar1| (LENGTH |lvar|) . #23#) (LETT |range| 5 . #23#)
        (LETT |ctf1| (|spadConstant| $ 47) . #23#)
        (LETT |testp| (COND ((NULL |plist|) 'NIL) ('T 'T)) . #23#)
        (LETT |leadcomp| (LETT |leadcomp1| NIL . #23#) . #23#)
        (LETT |nfatt| (+ |degum| 1) . #23#)
        (LETT |lffc| (|spadConstant| $ 47) . #23#) (LETT |lffc1| |lffc| . #23#)
        (LETT |newunifact| NIL . #23#) (LETT |leadtest| 'T . #23#)
        (LETT |int| NIL . #23#)
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
                      (LETT #22# (CONS 1 "failed") . #23#)
                      (GO #22#)))))))
                (LETT |lval|
                      (PROGN
                       (LETT #21# NIL . #23#)
                       (SEQ (LETT |i| 1 . #23#) G190
                            (COND ((|greater_SI| |i| |nvar1|) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #21#
                                    (CONS (SPADCALL |range| (QREFELT $ 96))
                                          #21#)
                                    . #23#)))
                            (LETT |i| (|inc_SI| |i|) . #23#) (GO G190) G191
                            (EXIT (NREVERSE #21#))))
                      . #23#)
                (EXIT
                 (COND
                  ((SPADCALL |lval| |ltry| (QREFELT $ 99))
                   (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100)) . #23#))
                  ('T
                   (SEQ (LETT |ltry| (CONS |lval| |ltry|) . #23#)
                        (LETT |leadcomp1|
                              (PROGN
                               (LETT #20# NIL . #23#)
                               (SEQ (LETT |pol| NIL . #23#)
                                    (LETT #19# |plist| . #23#) G190
                                    (COND
                                     ((OR (ATOM #19#)
                                          (PROGN
                                           (LETT |pol| (CAR #19#) . #23#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #20#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |pol| |lvar| |lval|
                                                        (QREFELT $ 101))
                                              (QREFELT $ 102))
                                             #20#)
                                            . #23#)))
                                    (LETT #19# (CDR #19#) . #23#) (GO G190)
                                    G191 (EXIT (NREVERSE #20#))))
                              . #23#)
                        (COND
                         (|testp|
                          (COND
                           ((PROGN
                             (LETT #15# NIL . #23#)
                             (SEQ (LETT |epl| NIL . #23#)
                                  (LETT #18# |leadcomp1| . #23#) G190
                                  (COND
                                   ((OR (ATOM #18#)
                                        (PROGN
                                         (LETT |epl| (CAR #18#) . #23#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #17#
                                           (SPADCALL |epl| (QREFELT $ 103))
                                           . #23#)
                                     (COND
                                      (#15#
                                       (LETT #16# (COND (#16# 'T) ('T #17#))
                                             . #23#))
                                      ('T
                                       (PROGN
                                        (LETT #16# #17# . #23#)
                                        (LETT #15# 'T . #23#)))))))
                                  (LETT #18# (CDR #18#) . #23#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#15# #16#) ('T 'NIL)))
                            (EXIT
                             (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100))
                                   . #23#))))))
                        (LETT |newm|
                              (SPADCALL |um| |lvar| |lval| (QREFELT $ 104))
                              . #23#)
                        (COND
                         ((OR
                           (SPADCALL |degum| (SPADCALL |newm| (QREFELT $ 81))
                                     (QREFELT $ 105))
                           (SPADCALL (SPADCALL |newm| (QREFELT $ 106)) 0
                                     (QREFELT $ 105)))
                          (EXIT
                           (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100))
                                 . #23#))))
                        (LETT |lffc1| (SPADCALL |newm| (QREFELT $ 107)) . #23#)
                        (LETT |newm|
                              (PROG2
                                  (LETT #14#
                                        (SPADCALL |newm| |lffc1|
                                                  (QREFELT $ 108))
                                        . #23#)
                                  (QCDR #14#)
                                (|check_union| (QEQCAR #14# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 8))
                                               #14#))
                              . #23#)
                        (COND
                         (|testp|
                          (COND
                           (|leadtest|
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL |lffc1| |clc| (QREFELT $ 69))
                                (LENGTH |plist|) |leadcomp1| (QREFELT $ 110)))
                              (EXIT
                               (LETT |range|
                                     (SPADCALL 2 |range| (QREFELT $ 100))
                                     . #23#))))))))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (LIST |newm| (SPADCALL |newm| (QREFELT $ 111)))
                              (QREFELT $ 113))
                             (QREFELT $ 81))
                            0 (QREFELT $ 105))
                           (LETT |range| (SPADCALL 2 |range| (QREFELT $ 100))
                                 . #23#))
                          ('T
                           (SEQ
                            (LETT |luniv| (SPADCALL |newm| |ufactor|) . #23#)
                            (LETT |lunivf| (SPADCALL |luniv| (QREFELT $ 37))
                                  . #23#)
                            (LETT |lffc1|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |luniv| (QREFELT $ 33))
                                             (QREFELT $ 34))
                                   |lffc1| (QREFELT $ 69))
                                  . #23#)
                            (LETT |nf| (LENGTH |lunivf|) . #23#)
                            (COND
                             ((OR (EQL |nf| 0)
                                  (SPADCALL |nf| |nfatt| (QREFELT $ 46)))
                              (EXIT "next values")))
                            (COND
                             ((EQL |nf| 1)
                              (SEQ (LETT |unifact| (LIST |newm|) . #23#)
                                   (EXIT
                                    (PROGN
                                     (LETT #5# |$NoValue| . #23#)
                                     (GO #5#))))))
                            (EXIT
                             (COND
                              ((EQL |nfatt| |nf|)
                               (SEQ
                                (COND
                                 (|leadtest|
                                  (SEQ
                                   (LETT |unifact|
                                         (PROGN
                                          (LETT #13# NIL . #23#)
                                          (SEQ (LETT |uf| NIL . #23#)
                                               (LETT #12# |lunivf| . #23#) G190
                                               (COND
                                                ((OR (ATOM #12#)
                                                     (PROGN
                                                      (LETT |uf| (CAR #12#)
                                                            . #23#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #13#
                                                       (CONS (QCAR |uf|) #13#)
                                                       . #23#)))
                                               (LETT #12# (CDR #12#) . #23#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #13#))))
                                         . #23#)
                                   (LETT |int| |lval| . #23#)
                                   (LETT |lffc| |lffc1| . #23#)
                                   (EXIT
                                    (COND
                                     (|testp|
                                      (LETT |leadcomp| |leadcomp1| . #23#))))))
                                 ((SPADCALL (|INNMFACT;localNorm| |unifact| $)
                                            (|INNMFACT;localNorm|
                                             (PROGN
                                              (LETT #11# NIL . #23#)
                                              (SEQ (LETT |ff| NIL . #23#)
                                                   (LETT #10# |lunivf| . #23#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #10#)
                                                         (PROGN
                                                          (LETT |ff| (CAR #10#)
                                                                . #23#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #11#
                                                           (CONS (QCAR |ff|)
                                                                 #11#)
                                                           . #23#)))
                                                   (LETT #10# (CDR #10#)
                                                         . #23#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #11#))))
                                             $)
                                            (QREFELT $ 114))
                                  (COND
                                   (|testp|
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |lffc1| |clc| (QREFELT $ 69))
                                       (LENGTH |plist|) |leadcomp1|
                                       (QREFELT $ 110))
                                      (SEQ
                                       (LETT |unifact|
                                             (PROGN
                                              (LETT #9# NIL . #23#)
                                              (SEQ (LETT |uf| NIL . #23#)
                                                   (LETT #8# |lunivf| . #23#)
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #8#)
                                                         (PROGN
                                                          (LETT |uf| (CAR #8#)
                                                                . #23#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #9#
                                                           (CONS (QCAR |uf|)
                                                                 #9#)
                                                           . #23#)))
                                                   (LETT #8# (CDR #8#) . #23#)
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #9#))))
                                             . #23#)
                                       (LETT |int| |lval| . #23#)
                                       (LETT |lffc| |lffc1| . #23#)
                                       (EXIT
                                        (COND
                                         (|testp|
                                          (LETT |leadcomp| |leadcomp1|
                                                . #23#))))))))
                                   ('T
                                    (SEQ
                                     (LETT |unifact|
                                           (PROGN
                                            (LETT #7# NIL . #23#)
                                            (SEQ (LETT |uf| NIL . #23#)
                                                 (LETT #6# |lunivf| . #23#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #6#)
                                                       (PROGN
                                                        (LETT |uf| (CAR #6#)
                                                              . #23#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #7#
                                                         (CONS (QCAR |uf|) #7#)
                                                         . #23#)))
                                                 (LETT #6# (CDR #6#) . #23#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #7#))))
                                           . #23#)
                                     (LETT |int| |lval| . #23#)
                                     (LETT |lffc| |lffc1| . #23#)
                                     (EXIT
                                      (COND
                                       (|testp|
                                        (LETT |leadcomp| |leadcomp1|
                                              . #23#)))))))))
                                (EXIT
                                 (PROGN
                                  (LETT #5# |$NoValue| . #23#)
                                  (GO #5#)))))
                              ((SPADCALL |nfatt| |degum| (QREFELT $ 46))
                               (SEQ
                                (LETT |unifact|
                                      (PROGN
                                       (LETT #4# NIL . #23#)
                                       (SEQ (LETT |uf| NIL . #23#)
                                            (LETT #3# |lunivf| . #23#) G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |uf| (CAR #3#) . #23#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4# (CONS (QCAR |uf|) #4#)
                                                    . #23#)))
                                            (LETT #3# (CDR #3#) . #23#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      . #23#)
                                (LETT |lffc| |lffc1| . #23#)
                                (COND
                                 (|testp|
                                  (LETT |leadcomp| |leadcomp1| . #23#)))
                                (LETT |int| |lval| . #23#)
                                (LETT |leadtest| 'NIL . #23#)
                                (EXIT (LETT |nfatt| |nf| . #23#))))
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
                                           (QREFELT $ 110))
                                          'NIL)
                                         ('T 'T))
                                        . #23#))
                                 ('T (LETT |leadtest| 'NIL . #23#)))
                                (COND
                                 ((NULL |leadtest|)
                                  (SEQ
                                   (LETT |unifact|
                                         (PROGN
                                          (LETT #2# NIL . #23#)
                                          (SEQ (LETT |uf| NIL . #23#)
                                               (LETT #1# |lunivf| . #23#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |uf| (CAR #1#)
                                                            . #23#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS (QCAR |uf|) #2#)
                                                       . #23#)))
                                               (LETT #1# (CDR #1#) . #23#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         . #23#)
                                   (LETT |lffc| |lffc1| . #23#)
                                   (COND
                                    (|testp|
                                     (LETT |leadcomp| |leadcomp1| . #23#)))
                                   (EXIT (LETT |int| |lval| . #23#)))))
                                (EXIT (LETT |nfatt| |nf| . #23#)))))))))))))))
               NIL (GO G190) G191 (EXIT NIL)))
         #5# (EXIT #5#))
        (EXIT
         (CONS 0 (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|)))))
      #22# (EXIT #22#))))) 

(DEFUN |INNMFACT;simplify| (|m| |lvar| |lmdeg| |ufactor| $)
  (PROG (|flead| #1=#:G321 |factorlist| |pol1| |i| #2=#:G327 |x|)
    (RETURN
     (SEQ (LETT |factorlist| NIL . #3=(|INNMFACT;simplify|))
          (LETT |pol1| (|spadConstant| $ 48) . #3#)
          (SEQ (LETT |x| NIL . #3#) (LETT #2# |lvar| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |i|
                      (SPADCALL |lmdeg| (SPADCALL |x| |lvar| (QREFELT $ 115))
                                (QREFELT $ 116))
                      . #3#)
                (EXIT
                 (COND ((EQL |i| 0) "next value")
                       ('T
                        (SEQ
                         (LETT |pol1|
                               (SPADCALL |pol1|
                                         (SPADCALL (|spadConstant| $ 48) |x|
                                                   |i| (QREFELT $ 117))
                                         (QREFELT $ 118))
                               . #3#)
                         (EXIT
                          (LETT |factorlist|
                                (CONS (CONS (SPADCALL |x| (QREFELT $ 119)) |i|)
                                      |factorlist|)
                                . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |m|
                (PROG2 (LETT #1# (SPADCALL |m| |pol1| (QREFELT $ 120)) . #3#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |m| (QREFELT $ 66))
             (CONS (SPADCALL |m| (QREFELT $ 102)) |factorlist|))
            ('T
             (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| $) . #3#)
                  (PROGN
                   (RPLACD |flead| (APPEND |factorlist| (QCDR |flead|)))
                   (QCDR |flead|))
                  (EXIT |flead|))))))))) 

(DEFUN |INNMFACT;intfact| (|um| |lvar| |ldeg| |tleadpol| |ltry| |ufactor| $)
  (PROG (|factfin| #1=#:G524 |ff| #2=#:G523 |ffin| |umd| #3=#:G506 |unifact|
         #4=#:G522 |unif| #5=#:G521 |dd| |lpol| |dist| #6=#:G518 |distf|
         |leadval| |lval| |nfact| |vfchoo| #7=#:G258 |check| |leadpol|
         #8=#:G520 #9=#:G519 |polcase|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |polcase| (COND ((NULL (QCDR |tleadpol|)) 'NIL) (#10='T 'T))
              . #11=(|INNMFACT;intfact|))
        (LETT |vfchoo|
              (COND
               (|polcase|
                (SEQ
                 (LETT |leadpol|
                       (PROGN
                        (LETT #9# NIL . #11#)
                        (SEQ (LETT |ff| NIL . #11#)
                             (LETT #8# (QCDR |tleadpol|) . #11#) G190
                             (COND
                              ((OR (ATOM #8#)
                                   (PROGN (LETT |ff| (CAR #8#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #9# (CONS (QCAR |ff|) #9#) . #11#)))
                             (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
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
                           (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor|
                            $)
                           . #11#)
                     (GO #6#)))
                   (#10# (QCDR |check|))))))
               (#10#
                (PROG2
                    (LETT #7#
                          (|INNMFACT;intChoose| |um| |lvar|
                           (|spadConstant| $ 47) NIL NIL |ufactor| $)
                          . #11#)
                    (QCDR #7#)
                  (|check_union| (QEQCAR #7# 0)
                                 (|Record|
                                  (|:| |inval| (|List| (|List| (QREFELT $ 8))))
                                  (|:| |unvfact|
                                       (|List|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 8))))
                                  (|:| |lu| (QREFELT $ 8))
                                  (|:| |complead| (|List| (QREFELT $ 8))))
                                 #7#))))
              . #11#)
        (LETT |unifact| (QVELT |vfchoo| 1) . #11#)
        (LETT |nfact| (LENGTH |unifact|) . #11#)
        (EXIT
         (COND ((EQL |nfact| 1) (LIST |um|))
               (#10#
                (SEQ (LETT |ltry| (QVELT |vfchoo| 0) . #11#)
                     (LETT |lval| (|SPADfirst| |ltry|) . #11#)
                     (LETT |dd| (QVELT |vfchoo| 2) . #11#)
                     (LETT |leadval| NIL . #11#) (LETT |lpol| NIL . #11#)
                     (COND
                      (|polcase|
                       (SEQ (LETT |leadval| (QVELT |vfchoo| 3) . #11#)
                            (LETT |distf|
                                  (SPADCALL (QVELT |vfchoo| 2) |unifact|
                                            |tleadpol| |leadval| |lvar| |lval|
                                            (QREFELT $ 126))
                                  . #11#)
                            (EXIT
                             (COND
                              ((QEQCAR |distf| 1)
                               (PROGN
                                (LETT #6#
                                      (|INNMFACT;intfact| |um| |lvar| |ldeg|
                                       |tleadpol| |ltry| |ufactor| $)
                                      . #11#)
                                (GO #6#)))
                              (#10#
                               (SEQ (LETT |dist| (QCDR |distf|) . #11#)
                                    (LETT |lpol| (QVELT |dist| 0) . #11#)
                                    (LETT |dd| (QVELT |dist| 1) . #11#)
                                    (EXIT
                                     (LETT |unifact| (QVELT |dist| 2)
                                           . #11#)))))))))
                     (COND
                      ((SPADCALL |dd| (|spadConstant| $ 47) (QREFELT $ 93))
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
                                                       (QREFELT $ 127))
                                             #5#)
                                            . #11#)))
                                    (LETT #4# (CDR #4#) . #11#) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              . #11#)
                        (EXIT
                         (LETT |umd|
                               (SPADCALL
                                (SPADCALL
                                 (QVELT (SPADCALL |dd| (QREFELT $ 128)) 0)
                                 (SPADCALL
                                  (SPADCALL |dd|
                                            (PROG1
                                                (LETT #3# (- |nfact| 1) . #11#)
                                              (|check_subtype| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               #3#))
                                            (QREFELT $ 68))
                                  (QREFELT $ 38))
                                 (QREFELT $ 63))
                                |um| (QREFELT $ 129))
                               . #11#))))
                      (#10# (LETT |umd| |um| . #11#)))
                     (LETT |ffin|
                           (SPADCALL |umd| |lvar| |unifact| |lval| |lpol|
                                     |ldeg| (QREFELT $ 16) (QREFELT $ 132))
                           . #11#)
                     (EXIT
                      (COND
                       ((QEQCAR |ffin| 1)
                        (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol|
                         |ltry| |ufactor| $))
                       (#10#
                        (SEQ (LETT |factfin| (QCDR |ffin|) . #11#)
                             (COND
                              ((SPADCALL |dd| (|spadConstant| $ 47)
                                         (QREFELT $ 93))
                               (LETT |factfin|
                                     (PROGN
                                      (LETT #2# NIL . #11#)
                                      (SEQ (LETT |ff| NIL . #11#)
                                           (LETT #1# |factfin| . #11#) G190
                                           (COND
                                            ((OR (ATOM #1#)
                                                 (PROGN
                                                  (LETT |ff| (CAR #1#) . #11#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #2#
                                                   (CONS
                                                    (SPADCALL |ff|
                                                              (QREFELT $ 133))
                                                    #2#)
                                                   . #11#)))
                                           (LETT #1# (CDR #1#) . #11#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #2#))))
                                     . #11#)))
                             (EXIT |factfin|)))))))))))
      #6# (EXIT #6#))))) 

(DEFUN |INNMFACT;mfconst| (|um| |lvar| |ldeg| |ufactor| $)
  (PROG (#1=#:G536 |uf| #2=#:G535 |lum| |factfin|)
    (RETURN
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
                      ((OR (ATOM #1#) (PROGN (LETT |uf| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (ELT $ 38) (QCAR |uf|) (QREFELT $ 41))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))
            ('T
             (|INNMFACT;intfact| |um| |lvar| |ldeg|
              (CONS (|spadConstant| $ 43) NIL) NIL |ufactor| $)))))))) 

(DEFUN |INNMFACT;monicize| (|um| |c| $)
  (PROG (|ans| |prod| #1=#:G539 |n| |lc| |i| #2=#:G537)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |um| (QREFELT $ 52)) . #3=(|INNMFACT;monicize|))
          (LETT |ans| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                . #3#)
          (LETT |n|
                (PROG1 (LETT #2# (- |n| 1) . #3#)
                  (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                . #3#)
          (LETT |prod| (|spadConstant| $ 48) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT $ 82)) . #3#)
                            (|spadConstant| $ 77) (QREFELT $ 134)))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |um| (QREFELT $ 52)) . #3#)
                    (LETT |lc| (SPADCALL |um| (QREFELT $ 65)) . #3#)
                    (LETT |prod|
                          (SPADCALL |prod|
                                    (SPADCALL |c|
                                              (PROG1
                                                  (LETT #1#
                                                        (- |n|
                                                           (LETT |n| |i|
                                                                 . #3#))
                                                        . #3#)
                                                (|check_subtype| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                              (QREFELT $ 135))
                                    (QREFELT $ 118))
                          . #3#)
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL
                                      (SPADCALL |prod| |lc| (QREFELT $ 118))
                                      |i| (QREFELT $ 49))
                                     (QREFELT $ 136))
                           . #3#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |INNMFACT;unmonicize| (|m| |c| $)
  (SPADCALL (SPADCALL |m| (SPADCALL |c| 1 (QREFELT $ 49)) (QREFELT $ 137))
            (QREFELT $ 133))) 

(DEFUN |INNMFACT;monicMfpol| (|um| |lvar| |ldeg| |ufactor| $)
  (PROG (|nldeg| |monpol| |l|)
    (RETURN
     (SEQ
      (LETT |l| (SPADCALL |um| (QREFELT $ 65)) . #1=(|INNMFACT;monicMfpol|))
      (LETT |monpol| (|INNMFACT;monicize| |um| |l| $) . #1#)
      (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT $ 138)) . #1#)
      (EXIT
       (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR $ |l|))
                 (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor| $)
                 (QREFELT $ 141))))))) 

(DEFUN |INNMFACT;monicMfpol!0| (|z1| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|INNMFACT;monicMfpol|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INNMFACT;unmonicize| |z1| |l| $))))) 

(DEFUN |INNMFACT;mfpol| (|um| |lvar| |ldeg| |ufactor| $)
  (PROG (|tleadpol|)
    (RETURN
     (SEQ
      (COND
       ((|HasCategory| (QREFELT $ 8) '(|Field|))
        (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| $))
       ('T
        (SEQ
         (LETT |tleadpol|
               (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT $ 65)) |ufactor| $)
               |INNMFACT;mfpol|)
         (EXIT
          (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL |ufactor|
           $))))))))) 

(DEFUN |INNMFACT;mFactor| (|m| |ufactor| $)
  (PROG (#1=#:G602 |lcfacs| #2=#:G597 #3=#:G596 #4=#:G598 #5=#:G600 #6=#:G614
         |f| |factorlist| |auxfl| #7=#:G613 |lfp| #8=#:G612 |lf| |um| |ldeg|
         #9=#:G611 |lcterm| |ffactor| #10=#:G579 |pc| |lvar| |x| |varch|
         #11=#:G610 #12=#:G567 |lcont| |ffexp| #13=#:G609 |fact| |sqqfact|
         |flead| |sqfacs| #14=#:G556 #15=#:G555 #16=#:G557 #17=#:G608 |n|
         |lmdeg|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (QREFELT $ 66))
        (CONS (SPADCALL |m| (QREFELT $ 102)) NIL))
       (#18='T
        (SEQ
         (LETT |lvar| (SPADCALL |m| (QREFELT $ 25)) . #19=(|INNMFACT;mFactor|))
         (LETT |flead| (CONS (|spadConstant| $ 43) NIL) . #19#)
         (LETT |factorlist| NIL . #19#)
         (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT $ 142)) . #19#)
         (EXIT
          (COND
           ((PROGN
             (LETT #14# NIL . #19#)
             (SEQ (LETT |n| NIL . #19#) (LETT #17# |lmdeg| . #19#) G190
                  (COND
                   ((OR (ATOM #17#) (PROGN (LETT |n| (CAR #17#) . #19#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #16# (SPADCALL |n| 0 (QREFELT $ 46)) . #19#)
                     (COND (#14# (LETT #15# (COND (#15# 'T) ('T #16#)) . #19#))
                           ('T
                            (PROGN
                             (LETT #15# #16# . #19#)
                             (LETT #14# 'T . #19#)))))))
                  (LETT #17# (CDR #17#) . #19#) (GO G190) G191 (EXIT NIL))
             (COND (#14# #15#) (#18# 'NIL)))
            (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| $))
           (#18#
            (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT $ 144)) . #19#)
                 (LETT |lcont| (SPADCALL |sqfacs| (QREFELT $ 146)) . #19#)
                 (COND
                  ((SPADCALL |lcont| (QREFELT $ 66))
                   (PROGN
                    (RPLACA |flead| (SPADCALL |lcont| (QREFELT $ 102)))
                    (QCAR |flead|)))
                  (#18#
                   (LETT |flead| (|INNMFACT;mFactor| |lcont| |ufactor| $)
                         . #19#)))
                 (LETT |factorlist| (QCDR |flead|) . #19#)
                 (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT $ 149)) . #19#)
                 (SEQ (LETT |fact| NIL . #19#) (LETT #13# |sqqfact| . #19#)
                      G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |fact| (CAR #13#) . #19#) NIL))
                        (GO G191)))
                      (SEQ (LETT |ffactor| (QCAR |fact|) . #19#)
                           (LETT |ffexp| (QCDR |fact|) . #19#)
                           (LETT |lvar| (SPADCALL |ffactor| (QREFELT $ 25))
                                 . #19#)
                           (LETT |x| (|SPADfirst| |lvar|) . #19#)
                           (LETT |ldeg|
                                 (SPADCALL |ffactor| |lvar| (QREFELT $ 150))
                                 . #19#)
                           (EXIT
                            (COND
                             ((SPADCALL 1 |ldeg| (QREFELT $ 155))
                              (SEQ
                               (LETT |x|
                                     (SPADCALL |lvar|
                                               (SPADCALL 1 |ldeg|
                                                         (QREFELT $ 87))
                                               (QREFELT $ 88))
                                     . #19#)
                               (LETT |lcont|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |ffactor| |x| (QREFELT $ 85))
                                       (QREFELT $ 23))
                                      (QREFELT $ 156))
                                     . #19#)
                               (LETT |ffactor|
                                     (PROG2
                                         (LETT #12#
                                               (SPADCALL |ffactor| |lcont|
                                                         (QREFELT $ 120))
                                               . #19#)
                                         (QCDR #12#)
                                       (|check_union| (QEQCAR #12# 0)
                                                      (QREFELT $ 9) #12#))
                                     . #19#)
                               (LETT |factorlist|
                                     (CONS (CONS |ffactor| |ffexp|)
                                           |factorlist|)
                                     . #19#)
                               (EXIT
                                (SEQ (LETT |lcterm| NIL . #19#)
                                     (LETT #11#
                                           (QCDR
                                            (|INNMFACT;mFactor| |lcont|
                                             |ufactor| $))
                                           . #19#)
                                     G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN
                                            (LETT |lcterm| (CAR #11#) . #19#)
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
                                             . #19#)))
                                     (LETT #11# (CDR #11#) . #19#) (GO G190)
                                     G191 (EXIT NIL)))))
                             ('T
                              (SEQ
                               (LETT |varch|
                                     (|INNMFACT;varChoose| |ffactor| |lvar|
                                      |ldeg| $)
                                     . #19#)
                               (LETT |um| (QVELT |varch| 0) . #19#)
                               (LETT |x| (|SPADfirst| |lvar|) . #19#)
                               (LETT |ldeg| (CDR |ldeg|) . #19#)
                               (LETT |lvar| (CDR |lvar|) . #19#)
                               (COND
                                ((SPADCALL (|SPADfirst| (QVELT |varch| 1)) |x|
                                           (QREFELT $ 157))
                                 (SEQ (LETT |lvar| (QVELT |varch| 1) . #19#)
                                      (LETT |x| (|SPADfirst| |lvar|) . #19#)
                                      (EXIT
                                       (LETT |lvar| (CDR |lvar|) . #19#)))))
                               (LETT |pc|
                                     (SPADCALL (SPADCALL |um| (QREFELT $ 23))
                                               (QREFELT $ 156))
                                     . #19#)
                               (COND
                                ((SPADCALL |pc| (|spadConstant| $ 48)
                                           (QREFELT $ 158))
                                 (SEQ
                                  (LETT |um|
                                        (PROG2
                                            (LETT #10#
                                                  (SPADCALL |um| |pc|
                                                            (QREFELT $ 159))
                                                  . #19#)
                                            (QCDR #10#)
                                          (|check_union| (QEQCAR #10# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT $ 9))
                                                         #10#))
                                        . #19#)
                                  (LETT |ffactor|
                                        (SPADCALL |um| |x| (QREFELT $ 160))
                                        . #19#)
                                  (EXIT
                                   (SEQ (LETT |lcterm| NIL . #19#)
                                        (LETT #9#
                                              (QCDR
                                               (|INNMFACT;mFactor| |pc|
                                                |ufactor| $))
                                              . #19#)
                                        G190
                                        (COND
                                         ((OR (ATOM #9#)
                                              (PROGN
                                               (LETT |lcterm| (CAR #9#) . #19#)
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
                                                . #19#)))
                                        (LETT #9# (CDR #9#) . #19#) (GO G190)
                                        G191 (EXIT NIL))))))
                               (LETT |ldeg|
                                     (SPADCALL |ffactor| |lvar|
                                               (QREFELT $ 150))
                                     . #19#)
                               (LETT |um| (SPADCALL |um| (QREFELT $ 161))
                                     . #19#)
                               (COND
                                ((SPADCALL (SPADCALL |um| (QREFELT $ 65))
                                           (QREFELT $ 66))
                                 (LETT |lf|
                                       (|INNMFACT;mfconst| |um| |lvar| |ldeg|
                                        |ufactor| $)
                                       . #19#))
                                ('T
                                 (LETT |lf|
                                       (|INNMFACT;mfpol| |um| |lvar| |ldeg|
                                        |ufactor| $)
                                       . #19#)))
                               (LETT |auxfl|
                                     (PROGN
                                      (LETT #8# NIL . #19#)
                                      (SEQ (LETT |lfp| NIL . #19#)
                                           (LETT #7# |lf| . #19#) G190
                                           (COND
                                            ((OR (ATOM #7#)
                                                 (PROGN
                                                  (LETT |lfp| (CAR #7#) . #19#)
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
                                                                         160))
                                                      (QREFELT $ 162))
                                                     |ffexp|)
                                                    #8#)
                                                   . #19#)))
                                           (LETT #7# (CDR #7#) . #19#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #8#))))
                                     . #19#)
                               (EXIT
                                (LETT |factorlist|
                                      (APPEND |factorlist| |auxfl|)
                                      . #19#)))))))
                      (LETT #13# (CDR #13#) . #19#) (GO G190) G191 (EXIT NIL))
                 (LETT |lcfacs|
                       (PROGN
                        (LETT #2# NIL . #19#)
                        (SEQ (LETT |f| NIL . #19#)
                             (LETT #6# |factorlist| . #19#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |f| (CAR #6#) . #19#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #4#
                                      (SPADCALL
                                       (SPADCALL (QCAR |f|) (QREFELT $ 67))
                                       (PROG1 (LETT #5# (QCDR |f|) . #19#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 68))
                                      . #19#)
                                (COND
                                 (#2#
                                  (LETT #3# (SPADCALL #3# #4# (QREFELT $ 69))
                                        . #19#))
                                 ('T
                                  (PROGN
                                   (LETT #3# #4# . #19#)
                                   (LETT #2# 'T . #19#)))))))
                             (LETT #6# (CDR #6#) . #19#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#2# #3#) (#18# (|spadConstant| $ 47))))
                       . #19#)
                 (EXIT
                  (CONS
                   (PROG2
                       (LETT #1#
                             (SPADCALL (SPADCALL |m| (QREFELT $ 67)) |lcfacs|
                                       (QREFELT $ 70))
                             . #19#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
                   |factorlist|))))))))))))) 

(DEFUN |INNMFACT;factor;PMF;16| (|m| |ufactor| $)
  (PROG (#1=#:G618 #2=#:G617 #3=#:G619 #4=#:G622 |u| |flist|)
    (RETURN
     (SEQ
      (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| $)
            . #5=(|INNMFACT;factor;PMF;16|))
      (EXIT
       (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 38))
                 (PROGN
                  (LETT #1# NIL . #5#)
                  (SEQ (LETT |u| NIL . #5#) (LETT #4# (QCDR |flist|) . #5#)
                       G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (SPADCALL (QCAR |u|) (QCDR |u|)
                                          (QREFELT $ 163))
                                . #5#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 164))
                                  . #5#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #5#)
                             (LETT #1# 'T . #5#)))))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T (|spadConstant| $ 154))))
                 (QREFELT $ 165))))))) 

(DEFUN |InnerMultFact| (&REST #1=#:G623)
  (PROG ()
    (RETURN
     (PROG (#2=#:G624)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|InnerMultFact|))))))))))) 

(DEFUN |InnerMultFact;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerMultFact|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|InnerMultFact| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 167) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerMultFact|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 16
                (SPADCALL (SPADCALL (EXPT 2 26) (QREFELT $ 14))
                          (QREFELT $ 15)))
      $)))) 

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
              (176 . |leadingCoefficient|) (181 . ^) (187 . *) (193 . |exquo|)
              (199 . |primeFactor|) (205 . *) (211 . |One|) (215 . *)
              (|Mapping| 32 28) |INNMFACT;factor;SupMF;3| (221 . |Zero|)
              (225 . =) (231 . |Zero|) (235 . =) (241 . |degree|)
              (246 . |reductum|) (251 . |reductum|)
              (|SparseUnivariatePolynomial| $) (256 . |univariate|) (|List| 44)
              (262 . |position|) (268 . |elt|) (274 . |delete|)
              (280 . |delete|) (286 . |numberOfMonomials|)
              (291 . |coefficient|) (297 . ~=) (303 . |euclideanSize|)
              (|FactoringUtilities| 7 6 8 9) (308 . |ran|) (|List| 8)
              (|List| 97) (313 . |member?|) (319 . *) (325 . |eval|)
              (332 . |retract|) (337 . |unit?|) (342 . |completeEval|)
              (349 . ~=) (355 . |minimumDegree|) (360 . |content|)
              (365 . |exquo|) (|LeadingCoefDetermination| 6 7 8 9)
              (371 . |polCase|) (378 . |differentiate|) (|List| $)
              (383 . |gcd|) (388 . >) (394 . |position|) (400 . |elt|)
              (406 . |monomial|) (413 . *) (419 . |coerce|) (424 . |exquo|)
              (|Record| (|:| |polfac| 22) (|:| |correct| 8)
                        (|:| |corrfact| 123))
              (|Union| 121 '"failed") (|List| 28)
              (|Record| (|:| |irr| 9) (|:| |pow| 12))
              (|Record| (|:| |contp| 8) (|:| |factors| (|List| 124)))
              (430 . |distFact|) (440 . *) (446 . |unitNormal|) (451 . *)
              (|Union| 140 '"failed") (|MultivariateLifting| 7 6 8 9)
              (457 . |lifting|) (468 . |primitivePart|) (473 . ~=) (479 . ^)
              (485 . +) (491 . |elt|) (497 . |degree|) (|Mapping| 17 17)
              (|List| 17) (503 . |map|) (509 . |minimumDegree|) (|Factored| $)
              (515 . |squareFree|) (|Factored| 9) (520 . |unit|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 12)) (|List| 147)
              (525 . |factors|) (530 . |degree|) (536 . |One|) (540 . |One|)
              (544 . |One|) (548 . |One|) (552 . |member?|) (558 . |gcd|)
              (563 . ~=) (569 . ~=) (575 . |exquo|) (581 . |multivariate|)
              (587 . |unitCanonical|) (592 . |unitCanonical|)
              (597 . |primeFactor|) (603 . *) (609 . *)
              |INNMFACT;factor;PMF;16|)
           '#(|factor| 615) 'NIL
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
                                                   0 44 68 2 8 0 0 0 69 2 8 50
                                                   0 0 70 2 55 0 17 12 71 2 55
                                                   0 0 0 72 0 55 0 73 2 55 0 17
                                                   0 74 0 17 0 77 2 17 19 0 0
                                                   78 0 28 0 79 2 28 19 0 0 80
                                                   1 28 44 0 81 1 17 0 0 82 1
                                                   28 0 0 83 2 9 84 0 6 85 2 86
                                                   12 44 0 87 2 24 6 0 12 88 2
                                                   86 0 0 12 89 2 24 0 0 12 90
                                                   1 28 44 0 91 2 28 8 0 44 92
                                                   2 8 19 0 0 93 1 8 44 0 94 1
                                                   95 8 12 96 2 98 19 97 0 99 2
                                                   44 0 10 0 100 3 9 0 0 24 97
                                                   101 1 9 8 0 102 1 8 19 0 103
                                                   3 95 28 17 24 97 104 2 44 19
                                                   0 0 105 1 28 44 0 106 1 28 8
                                                   0 107 2 28 50 0 8 108 3 109
                                                   19 8 44 97 110 1 28 0 0 111
                                                   1 28 0 112 113 2 12 19 0 0
                                                   114 2 24 12 6 0 115 2 86 44
                                                   0 12 116 3 9 0 0 6 44 117 2
                                                   9 0 0 0 118 1 9 0 6 119 2 9
                                                   50 0 0 120 6 109 122 8 123
                                                   125 97 24 97 126 2 28 0 8 0
                                                   127 1 8 53 0 128 2 17 0 9 0
                                                   129 7 131 130 17 24 123 97
                                                   22 86 8 132 1 17 0 0 133 2
                                                   17 19 0 0 134 2 9 0 0 44 135
                                                   2 17 0 0 0 136 2 17 0 0 0
                                                   137 2 95 86 17 24 138 2 140
                                                   0 139 0 141 2 9 86 0 24 142
                                                   1 9 143 0 144 1 145 9 0 146
                                                   1 145 148 0 149 2 9 86 0 24
                                                   150 0 17 0 151 0 28 0 152 0
                                                   32 0 153 0 145 0 154 2 86 19
                                                   44 0 155 1 9 0 112 156 2 6
                                                   19 0 0 157 2 9 19 0 0 158 2
                                                   17 50 0 9 159 2 9 0 84 6 160
                                                   1 17 0 0 161 1 9 0 0 162 2
                                                   145 0 9 12 163 2 145 0 0 0
                                                   164 2 145 0 9 0 165 2 0 55
                                                   17 75 76 2 0 145 9 75
                                                   166)))))
           '|lookupComplete|)) 
