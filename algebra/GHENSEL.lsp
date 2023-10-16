
(SDEFUN |GHENSEL;reduceCoef| ((|c| RP) (|p| RP) ($ RP))
        (COND ((SPADCALL |p| (QREFELT $ 9)) |c|)
              ((|domainEqual| (QREFELT $ 6) (|Integer|))
               (SPADCALL |c| |p| (QREFELT $ 11)))
              ('T (SPADCALL |c| |p| (QREFELT $ 12))))) 

(SDEFUN |GHENSEL;reduction;TPRPTP;2| ((|u| TP) (|p| RP) ($ TP))
        (SPROG NIL
               (COND ((SPADCALL |p| (QREFELT $ 9)) |u|)
                     ((|domainEqual| (QREFELT $ 6) (|Integer|))
                      (SPADCALL
                       (CONS #'|GHENSEL;reduction;TPRPTP;2!0| (VECTOR $ |p|))
                       |u| (QREFELT $ 14)))
                     ('T
                      (SPADCALL
                       (CONS #'|GHENSEL;reduction;TPRPTP;2!1| (VECTOR $ |p|))
                       |u| (QREFELT $ 14)))))) 

(SDEFUN |GHENSEL;reduction;TPRPTP;2!1| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 12)))))) 

(SDEFUN |GHENSEL;reduction;TPRPTP;2!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 11)))))) 

(SDEFUN |GHENSEL;merge| ((|p| RP) (|q| RP) ($ |Union| RP "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 16)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 17) (QREFELT $ 16))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 17) (QREFELT $ 16))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |GHENSEL;modInverse| ((|c| RP) (|p| RP) ($ RP))
        (SPROG ((#1=#:G131 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 19)
                                    (QREFELT $ 23)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |GHENSEL;exactquo| ((|u| TP) (|v| TP) (|p| RP) ($ |Union| TP "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| TP) (|:| |remainder| TP)))
          (|invlcv| (RP)))
         (SEQ
          (LETT |invlcv|
                (|GHENSEL;modInverse| (SPADCALL |v| (QREFELT $ 24)) |p| $))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 25)) |p|
                                    (QREFELT $ 15))
                          (QREFELT $ 27)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 15))
                       (|spadConstant| $ 18) (QREFELT $ 28))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 25)) |p|
                             (QREFELT $ 15))))))))) 

(SDEFUN |GHENSEL;mQuo| ((|poly| TP) (|n| RP) ($ TP))
        (SPROG NIL
               (SPADCALL (CONS #'|GHENSEL;mQuo!0| (VECTOR $ |n|)) |poly|
                         (QREFELT $ 14)))) 

(SDEFUN |GHENSEL;mQuo!0| ((|x| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |n| (QREFELT $ 30)))))) 

(SDEFUN |GHENSEL;GenExEuclid|
        ((|fl| |List| FP) (|cl| |List| FP) (|rhs| FP) ($ |List| FP))
        (SPROG
         ((#1=#:G159 NIL) (|clp| NIL) (#2=#:G160 NIL) (|flp| NIL)
          (#3=#:G158 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL)
           (SEQ (LETT |flp| NIL) (LETT #2# |fl|) (LETT |clp| NIL)
                (LETT #1# |cl|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |clp| (CAR #1#)) NIL) (ATOM #2#)
                      (PROGN (LETT |flp| (CAR #2#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SPADCALL (SPADCALL |clp| |rhs| (QREFELT $ 31)) |flp|
                                   (QREFELT $ 32))
                         #3#))))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |GHENSEL;genFact|
        ((|fln| |List| TP) (|factlist| |List| (|List| TP))
         ($ |List| (|List| TP)))
        (SPROG
         ((|auxfl| (|List| (|List| TP))) (#1=#:G231 NIL)
          (#2=#:G230 #3=(|NonNegativeInteger|)) (#4=#:G232 #3#) (#5=#:G246 NIL)
          (|f| NIL) (#6=#:G245 NIL) (|term| NIL) (|dp| #3#) (#7=#:G244 NIL)
          (#8=#:G243 NIL) (#9=#:G242 NIL) (|poly| NIL)
          (|maxd| (|NonNegativeInteger|)) (#10=#:G202 NIL) (#11=#:G201 #3#)
          (#12=#:G203 #3#) (#13=#:G241 NIL) (#14=#:G240 NIL) (|pol| NIL)
          (#15=#:G239 NIL))
         (SEQ
          (COND
           ((SPADCALL |factlist| NIL (QREFELT $ 34))
            (PROGN
             (LETT #15# NIL)
             (SEQ (LETT |pol| NIL) (LETT #14# |fln|) G190
                  (COND
                   ((OR (ATOM #14#) (PROGN (LETT |pol| (CAR #14#)) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #15# (CONS (LIST |pol|) #15#))))
                  (LETT #14# (CDR #14#)) (GO G190) G191
                  (EXIT (NREVERSE #15#)))))
           (#16='T
            (SEQ
             (LETT |maxd|
                   (QUOTIENT2
                    (PROGN
                     (LETT #10# NIL)
                     (SEQ (LETT |f| NIL) (LETT #13# |fln|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |f| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #12# (SPADCALL |f| (QREFELT $ 36)))
                             (COND (#10# (LETT #11# (+ #11# #12#)))
                                   ('T
                                    (PROGN
                                     (LETT #11# #12#)
                                     (LETT #10# 'T)))))))
                          (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
                     (COND (#10# #11#) (#16# 0)))
                    2))
             (LETT |auxfl| NIL)
             (SEQ (LETT |poly| NIL) (LETT #9# |fln|) G190
                  (COND
                   ((OR (ATOM #9#) (PROGN (LETT |poly| (CAR #9#)) NIL)
                        (NULL (SPADCALL |factlist| NIL (QREFELT $ 37))))
                    (GO G191)))
                  (SEQ
                   (LETT |factlist|
                         (PROGN
                          (LETT #8# NIL)
                          (SEQ (LETT |term| NIL) (LETT #7# |factlist|) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |term| (CAR #7#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL |poly| |term| (QREFELT $ 39)))
                                   (LETT #8# (CONS |term| #8#))))))
                               (LETT #7# (CDR #7#)) (GO G190) G191
                               (EXIT (NREVERSE #8#)))))
                   (LETT |dp| (SPADCALL |poly| (QREFELT $ 36)))
                   (EXIT
                    (SEQ (LETT |term| NIL) (LETT #6# |factlist|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |term| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL
                              (+
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |f| NIL) (LETT #5# |term|) G190
                                     (COND
                                      ((OR (ATOM #5#)
                                           (PROGN (LETT |f| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #4#
                                              (SPADCALL |f| (QREFELT $ 36)))
                                        (COND (#1# (LETT #2# (+ #2# #4#)))
                                              ('T
                                               (PROGN
                                                (LETT #2# #4#)
                                                (LETT #1# 'T)))))))
                                     (LETT #5# (CDR #5#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#1# #2#) ('T 0)))
                               |dp|)
                              |maxd| (QREFELT $ 40))
                             "next term")
                            ('T
                             (LETT |auxfl|
                                   (CONS (CONS |poly| |term|) |auxfl|))))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))
                  (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
             (EXIT |auxfl|))))))) 

(SDEFUN |GHENSEL;HenselLift1|
        ((|poly| TP) (|fln| |List| TP) (|fl1| |List| FP) (|cl1| |List| FP)
         (|prime| RP) (|Modulus| RP) (|cinv| RP) ($ |List| TP))
        (SPROG
         ((#1=#:G256 NIL) (|flp| NIL) (#2=#:G257 NIL) (|vlp| NIL)
          (#3=#:G255 NIL) (|vl| (|List| FP)) (|lcinv| (FP)) (|rhs| (FP))
          (#4=#:G248 NIL) (#5=#:G247 (TP)) (#6=#:G249 (TP)) (#7=#:G254 NIL)
          (#8=#:G104 NIL) (|lcp| (RP)))
         (SEQ (LETT |lcp| (SPADCALL |poly| (QREFELT $ 24)))
              (LETT |rhs|
                    (SPADCALL
                     (|GHENSEL;mQuo|
                      (SPADCALL |poly|
                                (SPADCALL |lcp|
                                          (PROGN
                                           (LETT #4# NIL)
                                           (SEQ (LETT #8# NIL) (LETT #7# |fln|)
                                                G190
                                                (COND
                                                 ((OR (ATOM #7#)
                                                      (PROGN
                                                       (LETT #8# (CAR #7#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #6# #8#)
                                                   (COND
                                                    (#4#
                                                     (LETT #5#
                                                           (SPADCALL #5# #6#
                                                                     (QREFELT $
                                                                              41))))
                                                    ('T
                                                     (PROGN
                                                      (LETT #5# #6#)
                                                      (LETT #4# 'T)))))))
                                                (LETT #7# (CDR #7#)) (GO G190)
                                                G191 (EXIT NIL))
                                           (COND (#4# #5#)
                                                 (#9='T
                                                  (|spadConstant| $ 20))))
                                          (QREFELT $ 25))
                                (QREFELT $ 42))
                      |Modulus| $)
                     |prime| (QREFELT $ 43)))
              (EXIT
               (COND ((SPADCALL |rhs| (QREFELT $ 44)) |fln|)
                     (#9#
                      (SEQ
                       (LETT |lcinv|
                             (SPADCALL (SPADCALL |cinv| (QREFELT $ 45)) |prime|
                                       (QREFELT $ 43)))
                       (LETT |vl|
                             (|GHENSEL;GenExEuclid| |fl1| |cl1|
                              (SPADCALL |lcinv| |rhs| (QREFELT $ 31)) $))
                       (EXIT
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |vlp| NIL) (LETT #2# |vl|) (LETT |flp| NIL)
                              (LETT #1# |fln|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |flp| (CAR #1#)) NIL)
                                    (ATOM #2#)
                                    (PROGN (LETT |vlp| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |flp|
                                                 (SPADCALL |Modulus|
                                                           (SPADCALL |vlp|
                                                                     (QREFELT $
                                                                              46))
                                                           (QREFELT $ 25))
                                                 (QREFELT $ 47))
                                       #3#))))
                              (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                              (GO G190) G191 (EXIT (NREVERSE #3#)))))))))))) 

(SDEFUN |GHENSEL;HenselLift;TPLRPPiR;10|
        ((|poly| TP) (|tl1| |List| TP) (|prime| RP) (|bound| |PositiveInteger|)
         ($ |Record| (|:| |plist| (|List| TP)) (|:| |modulo| RP)))
        (SPROG
         ((|fln| (|List| TP)) (|Modulus| (RP)) (#1=#:G291 NIL) (|err| (TP))
          (#2=#:G282 NIL) (#3=#:G281 (TP)) (#4=#:G283 (TP)) (#5=#:G296 NIL)
          (#6=#:G105 NIL) (|nfln| (|List| TP)) (|lcinv| (RP)) (#7=#:G295 NIL)
          (|ffl1| NIL) (#8=#:G294 NIL) (|cl1| (|List| FP)) (#9=#:G263 NIL)
          (|fl1| (|List| FP)) (#10=#:G293 NIL) (|ttl| NIL) (#11=#:G292 NIL)
          (|constp| (TP)))
         (SEQ (LETT |constp| (|spadConstant| $ 18))
              (COND
               ((EQL (SPADCALL (|SPADfirst| |tl1|) (QREFELT $ 36)) 0)
                (SEQ (LETT |constp| (|SPADfirst| |tl1|))
                     (EXIT (LETT |tl1| (CDR |tl1|))))))
              (LETT |fl1|
                    (PROGN
                     (LETT #11# NIL)
                     (SEQ (LETT |ttl| NIL) (LETT #10# |tl1|) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |ttl| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS (SPADCALL |ttl| |prime| (QREFELT $ 43))
                                        #11#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #11#)))))
              (LETT |cl1|
                    (PROG2
                        (LETT #9#
                              (SPADCALL |fl1| (|spadConstant| $ 48)
                                        (QREFELT $ 51)))
                        (QCDR #9#)
                      (|check_union2| (QEQCAR #9# 0) (|List| (QREFELT $ 29))
                                      (|Union| (|List| (QREFELT $ 29))
                                               "failed")
                                      #9#)))
              (LETT |Modulus| |prime|)
              (LETT |fln|
                    (PROGN
                     (LETT #8# NIL)
                     (SEQ (LETT |ffl1| NIL) (LETT #7# |fl1|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |ffl1| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |ffl1| (QREFELT $ 46))
                                        #8#))))
                          (LETT #7# (CDR #7#)) (GO G190) G191
                          (EXIT (NREVERSE #8#)))))
              (LETT |lcinv|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |poly| (QREFELT $ 24))
                                  (QREFELT $ 45))
                        |prime| (QREFELT $ 43))
                       (QREFELT $ 52))
                      (QREFELT $ 46))
                     (QREFELT $ 53)))
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL (< (SPADCALL |Modulus| (QREFELT $ 54)) |bound|))
                       (GO G191)))
                     (SEQ
                      (LETT |nfln|
                            (|GHENSEL;HenselLift1| |poly| |fln| |fl1| |cl1|
                             |prime| |Modulus| |lcinv| $))
                      (COND
                       ((SPADCALL |fln| |nfln| (QREFELT $ 55))
                        (COND
                         ((SPADCALL
                           (LETT |err|
                                 (SPADCALL |poly|
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT #6# NIL)
                                                 (LETT #5# |fln|) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT #6# (CAR #5#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #4# #6#)
                                                    (COND
                                                     (#2#
                                                      (LETT #3#
                                                            (SPADCALL #3# #4#
                                                                      (QREFELT
                                                                       $ 41))))
                                                     ('T
                                                      (PROGN
                                                       (LETT #3# #4#)
                                                       (LETT #2# 'T)))))))
                                                 (LETT #5# (CDR #5#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (COND (#2# #3#)
                                                  ('T (|spadConstant| $ 20))))
                                           (QREFELT $ 42)))
                           (QREFELT $ 56))
                          (EXIT
                           (PROGN (LETT #1# |$NoValue|) (GO #12=#:G286)))))))
                      (LETT |fln| |nfln|)
                      (EXIT
                       (LETT |Modulus|
                             (SPADCALL |prime| |Modulus| (QREFELT $ 57)))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #12# (EXIT #1#))
              (COND
               ((SPADCALL |constp| (|spadConstant| $ 18) (QREFELT $ 28))
                (LETT |fln| (CONS |constp| |fln|))))
              (EXIT (CONS |fln| |Modulus|))))) 

(SDEFUN |GHENSEL;completeHensel;TPLRPPiL;11|
        ((|m| TP) (|tl1| |List| TP) (|prime| RP) (|bound| |PositiveInteger|)
         ($ |List| TP))
        (SPROG
         ((|finallist| (|List| TP)) (|factlist| (|List| #1=(|List| TP)))
          (|fln| #2=(|List| TP)) (#3=#:G325 NIL) (|term| NIL) (#4=#:G324 NIL)
          (|auxfl| (|List| #1#)) (#5=#:G323 NIL) (#6=#:G322 NIL)
          (|aux| (|List| TP)) (#7=#:G321 NIL) (|poly| (TP))
          (|dfn| #8=(|NonNegativeInteger|)) (|mm| (TP)) (|lcm1| (RP))
          (|poly1| (TP)) (|u| (|Union| TP "failed")) (|pol| (TP))
          (#9=#:G302 NIL) (#10=#:G301 (TP)) (#11=#:G303 (TP)) (#12=#:G320 NIL)
          (|tc| (RP)) (#13=#:G299 NIL) (#14=#:G298 (RP)) (#15=#:G300 (RP))
          (#16=#:G319 NIL) (|auxl| (|List| TP)) (|nm| #8#) (|Modulus| (RP))
          (|hlift| (|Record| (|:| |plist| #2#) (|:| |modulo| RP))))
         (SEQ
          (LETT |hlift| (SPADCALL |m| |tl1| |prime| |bound| (QREFELT $ 60)))
          (LETT |Modulus| (QCDR |hlift|)) (LETT |fln| (QCAR |hlift|))
          (LETT |nm| (SPADCALL |m| (QREFELT $ 36))) (LETT |factlist| NIL)
          (LETT |dfn| |nm|) (LETT |lcm1| (SPADCALL |m| (QREFELT $ 24)))
          (LETT |mm| (SPADCALL |lcm1| |m| (QREFELT $ 25)))
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |dfn| 0 (QREFELT $ 40))
                    (SPADCALL
                     (LETT |factlist| (|GHENSEL;genFact| |fln| |factlist| $))
                     NIL (QREFELT $ 37)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ (LETT |auxfl| NIL)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |factlist| NIL (QREFELT $ 37)))
                           (GO G191)))
                         (SEQ (LETT |auxl| (|SPADfirst| |factlist|))
                              (LETT |factlist| (CDR |factlist|))
                              (LETT |tc|
                                    (|GHENSEL;reduceCoef|
                                     (SPADCALL |lcm1|
                                               (PROGN
                                                (LETT #13# NIL)
                                                (SEQ (LETT |poly| NIL)
                                                     (LETT #16# |auxl|) G190
                                                     (COND
                                                      ((OR (ATOM #16#)
                                                           (PROGN
                                                            (LETT |poly|
                                                                  (CAR #16#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #15#
                                                              (SPADCALL |poly|
                                                                        0
                                                                        (QREFELT
                                                                         $
                                                                         61)))
                                                        (COND
                                                         (#13#
                                                          (LETT #14#
                                                                (SPADCALL #14#
                                                                          #15#
                                                                          (QREFELT
                                                                           $
                                                                           57))))
                                                         ('T
                                                          (PROGN
                                                           (LETT #14# #15#)
                                                           (LETT #13# 'T)))))))
                                                     (LETT #16# (CDR #16#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (COND (#13# #14#)
                                                      ('T
                                                       (|spadConstant| $ 19))))
                                               (QREFELT $ 57))
                                     |Modulus| $))
                              (EXIT
                               (COND
                                ((QEQCAR
                                  (SPADCALL (SPADCALL |mm| 0 (QREFELT $ 61))
                                            |tc| (QREFELT $ 63))
                                  1)
                                 (LETT |auxfl| (CONS |auxl| |auxfl|)))
                                ('T
                                 (SEQ
                                  (LETT |pol|
                                        (PROGN
                                         (LETT #9# NIL)
                                         (SEQ (LETT |poly| NIL)
                                              (LETT #12# |auxl|) G190
                                              (COND
                                               ((OR (ATOM #12#)
                                                    (PROGN
                                                     (LETT |poly| (CAR #12#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #11# |poly|)
                                                 (COND
                                                  (#9#
                                                   (LETT #10#
                                                         (SPADCALL #10# #11#
                                                                   (QREFELT $
                                                                            41))))
                                                  ('T
                                                   (PROGN
                                                    (LETT #10# #11#)
                                                    (LETT #9# 'T)))))))
                                              (LETT #12# (CDR #12#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (COND (#9# #10#)
                                               ('T (|spadConstant| $ 20)))))
                                  (LETT |poly|
                                        (SPADCALL
                                         (SPADCALL |lcm1| |pol| (QREFELT $ 25))
                                         |Modulus| (QREFELT $ 15)))
                                  (LETT |u|
                                        (SPADCALL |mm| |poly| (QREFELT $ 64)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 1)
                                     (LETT |auxfl| (CONS |auxl| |auxfl|)))
                                    ('T
                                     (SEQ
                                      (LETT |poly1|
                                            (SPADCALL |poly| (QREFELT $ 65)))
                                      (LETT |m|
                                            (|GHENSEL;mQuo| (QCDR |u|)
                                             (SPADCALL |poly1| (QREFELT $ 24))
                                             $))
                                      (LETT |lcm1|
                                            (SPADCALL |m| (QREFELT $ 24)))
                                      (LETT |mm|
                                            (SPADCALL |lcm1| |m|
                                                      (QREFELT $ 25)))
                                      (LETT |finallist|
                                            (CONS |poly1| |finallist|))
                                      (LETT |dfn|
                                            (SPADCALL |m| (QREFELT $ 36)))
                                      (LETT |aux| NIL)
                                      (SEQ (LETT |poly| NIL) (LETT #7# |fln|)
                                           G190
                                           (COND
                                            ((OR (ATOM #7#)
                                                 (PROGN
                                                  (LETT |poly| (CAR #7#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |poly| |auxl|
                                                          (QREFELT $ 39)))
                                               (LETT |aux|
                                                     (CONS |poly| |aux|)))
                                              ('T
                                               (SEQ
                                                (LETT |auxfl|
                                                      (PROGN
                                                       (LETT #6# NIL)
                                                       (SEQ (LETT |term| NIL)
                                                            (LETT #5# |auxfl|)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #5#)
                                                                  (PROGN
                                                                   (LETT |term|
                                                                         (CAR
                                                                          #5#))
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 (SPADCALL
                                                                  |poly| |term|
                                                                  (QREFELT $
                                                                           39)))
                                                                (LETT #6#
                                                                      (CONS
                                                                       |term|
                                                                       #6#))))))
                                                            (LETT #5#
                                                                  (CDR #5#))
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #6#)))))
                                                (EXIT
                                                 (LETT |factlist|
                                                       (PROGN
                                                        (LETT #4# NIL)
                                                        (SEQ (LETT |term| NIL)
                                                             (LETT #3#
                                                                   |factlist|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #3#)
                                                                   (PROGN
                                                                    (LETT
                                                                     |term|
                                                                     (CAR #3#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (COND
                                                                ((NULL
                                                                  (SPADCALL
                                                                   |poly|
                                                                   |term|
                                                                   (QREFELT $
                                                                            39)))
                                                                 (LETT #4#
                                                                       (CONS
                                                                        |term|
                                                                        #4#))))))
                                                             (LETT #3#
                                                                   (CDR #3#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #4#)))))))))))
                                           (LETT #7# (CDR #7#)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT (LETT |fln| |aux|)))))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |factlist| |auxfl|)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |dfn| 0 (QREFELT $ 40))
            (LETT |finallist| (CONS |m| |finallist|))))
          (EXIT |finallist|)))) 

(DECLAIM (NOTINLINE |GeneralHenselPackage;|)) 

(DEFUN |GeneralHenselPackage| (&REST #1=#:G326)
  (SPROG NIL
         (PROG (#2=#:G327)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralHenselPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralHenselPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralHenselPackage|)))))))))) 

(DEFUN |GeneralHenselPackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GeneralHenselPackage| DV$1 DV$2))
          (LETT $ (GETREFV 67))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GeneralHenselPackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 29
                    (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 15)
                                            (CONS (|function| |GHENSEL;merge|)
                                                  $)
                                            (CONS
                                             (|function| |GHENSEL;exactquo|)
                                             $)))
          $))) 

(MAKEPROP '|GeneralHenselPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|Integer|) (5 . |symmetricRemainder|) (11 . |rem|)
              (|Mapping| 6 6) (17 . |map|) |GHENSEL;reduction;TPRPTP;2|
              (23 . =) (29 . |Zero|) (33 . |Zero|) (37 . |One|) (41 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 21 '"failed")
              (45 . |extendedEuclidean|) (52 . |leadingCoefficient|) (57 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (63 . |monicDivide|) (69 . ~=) 'FP (75 . |quo|) (81 . *)
              (87 . |rem|) (|List| 38) (93 . =) (|NonNegativeInteger|)
              (99 . |degree|) (104 . ~=) (|List| 7) (110 . |member?|) (116 . >)
              (122 . *) (128 . -) (134 . |reduce|) (140 . |zero?|)
              (145 . |coerce|) (150 . |coerce|) (155 . +) (161 . |One|)
              (|Union| 50 '"failed") (|List| $) (165 . |multiEuclidean|)
              (171 . |inv|) (176 . |retract|) (181 . |euclideanSize|) (186 . =)
              (192 . |zero?|) (197 . *)
              (|Record| (|:| |plist| 38) (|:| |modulo| 6)) (|PositiveInteger|)
              |GHENSEL;HenselLift;TPLRPPiR;10| (203 . |coefficient|)
              (|Union| $ '"failed") (209 . |exquo|) (215 . |exquo|)
              (221 . |primitivePart|) |GHENSEL;completeHensel;TPLRPPiL;11|)
           '#(|reduction| 226 |completeHensel| 232 |HenselLift| 240) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|HenselLift|
                                 ((|Record| (|:| |plist| (|List| |#2|))
                                            (|:| |modulo| |#1|))
                                  |#2| (|List| |#2|) |#1| (|PositiveInteger|)))
                                T)
                              '((|completeHensel|
                                 ((|List| |#2|) |#2| (|List| |#2|) |#1|
                                  (|PositiveInteger|)))
                                T)
                              '((|reduction| (|#2| |#2| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(1 6 8 0 9 2 10 0 0 0 11 2 6 0 0 0
                                              12 2 7 0 13 0 14 2 6 8 0 0 16 0 6
                                              0 17 0 7 0 18 0 6 0 19 0 7 0 20 3
                                              6 22 0 0 0 23 1 7 6 0 24 2 7 0 6
                                              0 25 2 7 26 0 0 27 2 7 8 0 0 28 2
                                              6 0 0 0 30 2 29 0 0 0 31 2 29 0 0
                                              0 32 2 33 8 0 0 34 1 7 35 0 36 2
                                              33 8 0 0 37 2 38 8 7 0 39 2 35 8
                                              0 0 40 2 7 0 0 0 41 2 7 0 0 0 42
                                              2 29 0 7 6 43 1 29 8 0 44 1 7 0 6
                                              45 1 29 7 0 46 2 7 0 0 0 47 0 29
                                              0 48 2 29 49 50 0 51 1 29 0 0 52
                                              1 7 6 0 53 1 6 35 0 54 2 38 8 0 0
                                              55 1 7 8 0 56 2 6 0 0 0 57 2 7 6
                                              0 35 61 2 6 62 0 0 63 2 7 62 0 0
                                              64 1 7 0 0 65 2 0 7 7 6 15 4 0 38
                                              7 38 6 59 66 4 0 58 7 38 6 59
                                              60)))))
           '|lookupComplete|)) 
