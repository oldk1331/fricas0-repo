
(/VERSIONCHECK 2) 

(DEFUN |GHENSEL;reduceCoef| (|c| |p| $)
  (COND ((SPADCALL |p| (QREFELT $ 9)) |c|)
        ((|domainEqual| (QREFELT $ 6) (|Integer|))
         (SPADCALL |c| |p| (QREFELT $ 11)))
        ('T (SPADCALL |c| |p| (QREFELT $ 12))))) 

(DEFUN |GHENSEL;reduction;TPRPTP;2| (|u| |p| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 9)) |u|)
           ((|domainEqual| (QREFELT $ 6) (|Integer|))
            (SPADCALL (CONS #'|GHENSEL;reduction;TPRPTP;2!0| (VECTOR $ |p|))
                      |u| (QREFELT $ 14)))
           ('T
            (SPADCALL (CONS #'|GHENSEL;reduction;TPRPTP;2!1| (VECTOR $ |p|))
                      |u| (QREFELT $ 14))))))) 

(DEFUN |GHENSEL;reduction;TPRPTP;2!1| (|x| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|GHENSEL;reduction;TPRPTP;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 12)))))) 

(DEFUN |GHENSEL;reduction;TPRPTP;2!0| (|x| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|GHENSEL;reduction;TPRPTP;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 11)))))) 

(DEFUN |GHENSEL;merge| (|p| |q| $)
  (COND ((SPADCALL |p| |q| (QREFELT $ 16)) (CONS 0 |p|))
        ((SPADCALL |p| (|spadConstant| $ 17) (QREFELT $ 16)) (CONS 0 |q|))
        ((SPADCALL |q| (|spadConstant| $ 17) (QREFELT $ 16)) (CONS 0 |p|))
        ('T (CONS 1 "failed")))) 

(DEFUN |GHENSEL;modInverse| (|c| |p| $)
  (PROG (#1=#:G152)
    (RETURN
     (QCAR
      (PROG2
          (LETT #1# (SPADCALL |c| |p| (|spadConstant| $ 19) (QREFELT $ 23))
                |GHENSEL;modInverse|)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0)
                       (|Record| (|:| |coef1| (QREFELT $ 6))
                                 (|:| |coef2| (QREFELT $ 6)))
                       #1#)))))) 

(DEFUN |GHENSEL;exactquo| (|u| |v| |p| $)
  (PROG (|r| |invlcv|)
    (RETURN
     (SEQ
      (LETT |invlcv| (|GHENSEL;modInverse| (SPADCALL |v| (QREFELT $ 24)) |p| $)
            . #1=(|GHENSEL;exactquo|))
      (LETT |r|
            (SPADCALL |u|
                      (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 25)) |p|
                                (QREFELT $ 15))
                      (QREFELT $ 27))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 15))
                   (|spadConstant| $ 18) (QREFELT $ 28))
         (CONS 1 "failed"))
        ('T
         (CONS 0
               (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 25)) |p|
                         (QREFELT $ 15)))))))))) 

(DEFUN |GHENSEL;mQuo| (|poly| |n| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|GHENSEL;mQuo!0| (VECTOR $ |n|)) |poly|
               (QREFELT $ 14))))) 

(DEFUN |GHENSEL;mQuo!0| (|x| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|GHENSEL;mQuo|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |n| (QREFELT $ 30)))))) 

(DEFUN |GHENSEL;GenExEuclid| (|fl| |cl| |rhs| $)
  (PROG (#1=#:G180 |clp| #2=#:G181 |flp| #3=#:G179)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|GHENSEL;GenExEuclid|))
       (SEQ (LETT |flp| NIL . #4#) (LETT #2# |fl| . #4#) (LETT |clp| NIL . #4#)
            (LETT #1# |cl| . #4#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |clp| (CAR #1#) . #4#) NIL)
                  (ATOM #2#) (PROGN (LETT |flp| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (SPADCALL (SPADCALL |clp| |rhs| (QREFELT $ 31)) |flp|
                               (QREFELT $ 32))
                     #3#)
                    . #4#)))
            (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
            (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DEFUN |GHENSEL;genFact| (|fln| |factlist| $)
  (PROG (|auxfl| #1=#:G252 #2=#:G251 #3=#:G253 #4=#:G267 |f| #5=#:G266 |term|
         |dp| #6=#:G265 #7=#:G264 #8=#:G263 |poly| |maxd| #9=#:G223 #10=#:G222
         #11=#:G224 #12=#:G262 #13=#:G261 |pol| #14=#:G260)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |factlist| NIL (QREFELT $ 34))
        (PROGN
         (LETT #14# NIL . #15=(|GHENSEL;genFact|))
         (SEQ (LETT |pol| NIL . #15#) (LETT #13# |fln| . #15#) G190
              (COND
               ((OR (ATOM #13#) (PROGN (LETT |pol| (CAR #13#) . #15#) NIL))
                (GO G191)))
              (SEQ (EXIT (LETT #14# (CONS (LIST |pol|) #14#) . #15#)))
              (LETT #13# (CDR #13#) . #15#) (GO G190) G191
              (EXIT (NREVERSE #14#)))))
       (#16='T
        (SEQ
         (LETT |maxd|
               (QUOTIENT2
                (PROGN
                 (LETT #9# NIL . #15#)
                 (SEQ (LETT |f| NIL . #15#) (LETT #12# |fln| . #15#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |f| (CAR #12#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #11# (SPADCALL |f| (QREFELT $ 36)) . #15#)
                         (COND (#9# (LETT #10# (+ #10# #11#) . #15#))
                               ('T
                                (PROGN
                                 (LETT #10# #11# . #15#)
                                 (LETT #9# 'T . #15#)))))))
                      (LETT #12# (CDR #12#) . #15#) (GO G190) G191 (EXIT NIL))
                 (COND (#9# #10#) (#16# 0)))
                2)
               . #15#)
         (LETT |auxfl| NIL . #15#)
         (SEQ (LETT |poly| NIL . #15#) (LETT #8# |fln| . #15#) G190
              (COND
               ((OR (ATOM #8#) (PROGN (LETT |poly| (CAR #8#) . #15#) NIL)
                    (NULL (SPADCALL |factlist| NIL (QREFELT $ 37))))
                (GO G191)))
              (SEQ
               (LETT |factlist|
                     (PROGN
                      (LETT #7# NIL . #15#)
                      (SEQ (LETT |term| NIL . #15#)
                           (LETT #6# |factlist| . #15#) G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |term| (CAR #6#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((COND
                                ((SPADCALL |poly| |term| (QREFELT $ 39)) 'NIL)
                                ('T 'T))
                               (LETT #7# (CONS |term| #7#) . #15#)))))
                           (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                           (EXIT (NREVERSE #7#))))
                     . #15#)
               (LETT |dp| (SPADCALL |poly| (QREFELT $ 36)) . #15#)
               (EXIT
                (SEQ (LETT |term| NIL . #15#) (LETT #5# |factlist| . #15#) G190
                     (COND
                      ((OR (ATOM #5#)
                           (PROGN (LETT |term| (CAR #5#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (+
                           (PROGN
                            (LETT #1# NIL . #15#)
                            (SEQ (LETT |f| NIL . #15#) (LETT #4# |term| . #15#)
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |f| (CAR #4#) . #15#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3# (SPADCALL |f| (QREFELT $ 36))
                                          . #15#)
                                    (COND (#1# (LETT #2# (+ #2# #3#) . #15#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #15#)
                                            (LETT #1# 'T . #15#)))))))
                                 (LETT #4# (CDR #4#) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) ('T 0)))
                           |dp|)
                          |maxd| (QREFELT $ 40))
                         "next term")
                        ('T
                         (LETT |auxfl| (CONS (CONS |poly| |term|) |auxfl|)
                               . #15#)))))
                     (LETT #5# (CDR #5#) . #15#) (GO G190) G191 (EXIT NIL))))
              (LETT #8# (CDR #8#) . #15#) (GO G190) G191 (EXIT NIL))
         (EXIT |auxfl|)))))))) 

(DEFUN |GHENSEL;HenselLift1|
       (|poly| |fln| |fl1| |cl1| |prime| |Modulus| |cinv| $)
  (PROG (#1=#:G277 |flp| #2=#:G278 |vlp| #3=#:G276 |vl| |lcinv| |rhs| #4=#:G269
         #5=#:G268 #6=#:G270 #7=#:G275 #8=#:G125 |lcp|)
    (RETURN
     (SEQ
      (LETT |lcp| (SPADCALL |poly| (QREFELT $ 24))
            . #9=(|GHENSEL;HenselLift1|))
      (LETT |rhs|
            (SPADCALL
             (|GHENSEL;mQuo|
              (SPADCALL |poly|
                        (SPADCALL |lcp|
                                  (PROGN
                                   (LETT #4# NIL . #9#)
                                   (SEQ (LETT #8# NIL . #9#)
                                        (LETT #7# |fln| . #9#) G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT #8# (CAR #7#) . #9#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #6# #8# . #9#)
                                           (COND
                                            (#4#
                                             (LETT #5#
                                                   (SPADCALL #5# #6#
                                                             (QREFELT $ 41))
                                                   . #9#))
                                            ('T
                                             (PROGN
                                              (LETT #5# #6# . #9#)
                                              (LETT #4# 'T . #9#)))))))
                                        (LETT #7# (CDR #7#) . #9#) (GO G190)
                                        G191 (EXIT NIL))
                                   (COND (#4# #5#)
                                         (#10='T (|spadConstant| $ 20))))
                                  (QREFELT $ 25))
                        (QREFELT $ 42))
              |Modulus| $)
             |prime| (QREFELT $ 43))
            . #9#)
      (EXIT
       (COND ((SPADCALL |rhs| (QREFELT $ 44)) |fln|)
             (#10#
              (SEQ
               (LETT |lcinv|
                     (SPADCALL (SPADCALL |cinv| (QREFELT $ 45)) |prime|
                               (QREFELT $ 43))
                     . #9#)
               (LETT |vl|
                     (|GHENSEL;GenExEuclid| |fl1| |cl1|
                      (SPADCALL |lcinv| |rhs| (QREFELT $ 31)) $)
                     . #9#)
               (EXIT
                (PROGN
                 (LETT #3# NIL . #9#)
                 (SEQ (LETT |vlp| NIL . #9#) (LETT #2# |vl| . #9#)
                      (LETT |flp| NIL . #9#) (LETT #1# |fln| . #9#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |flp| (CAR #1#) . #9#) NIL)
                            (ATOM #2#)
                            (PROGN (LETT |vlp| (CAR #2#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL |flp|
                                         (SPADCALL |Modulus|
                                                   (SPADCALL |vlp|
                                                             (QREFELT $ 46))
                                                   (QREFELT $ 25))
                                         (QREFELT $ 47))
                               #3#)
                              . #9#)))
                      (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT (NREVERSE #3#))))))))))))) 

(DEFUN |GHENSEL;HenselLift;TPLRPPiR;10| (|poly| |tl1| |prime| |bound| $)
  (PROG (|fln| |Modulus| #1=#:G307 |err| #2=#:G303 #3=#:G302 #4=#:G304
         #5=#:G316 #6=#:G126 |nfln| |lcinv| #7=#:G315 |ffl1| #8=#:G314 |cl1|
         #9=#:G284 |fl1| #10=#:G313 |ttl| #11=#:G312 |constp|)
    (RETURN
     (SEQ
      (LETT |constp| (|spadConstant| $ 18)
            . #12=(|GHENSEL;HenselLift;TPLRPPiR;10|))
      (COND
       ((EQL (SPADCALL (|SPADfirst| |tl1|) (QREFELT $ 36)) 0)
        (SEQ (LETT |constp| (|SPADfirst| |tl1|) . #12#)
             (EXIT (LETT |tl1| (CDR |tl1|) . #12#)))))
      (LETT |fl1|
            (PROGN
             (LETT #11# NIL . #12#)
             (SEQ (LETT |ttl| NIL . #12#) (LETT #10# |tl1| . #12#) G190
                  (COND
                   ((OR (ATOM #10#) (PROGN (LETT |ttl| (CAR #10#) . #12#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #11#
                          (CONS (SPADCALL |ttl| |prime| (QREFELT $ 43)) #11#)
                          . #12#)))
                  (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                  (EXIT (NREVERSE #11#))))
            . #12#)
      (LETT |cl1|
            (PROG2
                (LETT #9# (SPADCALL |fl1| (|spadConstant| $ 48) (QREFELT $ 51))
                      . #12#)
                (QCDR #9#)
              (|check_union| (QEQCAR #9# 0) (|List| (QREFELT $ 29)) #9#))
            . #12#)
      (LETT |Modulus| |prime| . #12#)
      (LETT |fln|
            (PROGN
             (LETT #8# NIL . #12#)
             (SEQ (LETT |ffl1| NIL . #12#) (LETT #7# |fl1| . #12#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |ffl1| (CAR #7#) . #12#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #8# (CONS (SPADCALL |ffl1| (QREFELT $ 46)) #8#)
                          . #12#)))
                  (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #12#)
      (LETT |lcinv|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |poly| (QREFELT $ 24)) (QREFELT $ 45))
                |prime| (QREFELT $ 43))
               (QREFELT $ 52))
              (QREFELT $ 46))
             (QREFELT $ 53))
            . #12#)
      (SEQ
       (EXIT
        (SEQ G190
             (COND
              ((NULL (< (SPADCALL |Modulus| (QREFELT $ 54)) |bound|))
               (GO G191)))
             (SEQ
              (LETT |nfln|
                    (|GHENSEL;HenselLift1| |poly| |fln| |fl1| |cl1| |prime|
                     |Modulus| |lcinv| $)
                    . #12#)
              (COND
               ((SPADCALL |fln| |nfln| (QREFELT $ 55))
                (COND
                 ((SPADCALL
                   (LETT |err|
                         (SPADCALL |poly|
                                   (PROGN
                                    (LETT #2# NIL . #12#)
                                    (SEQ (LETT #6# NIL . #12#)
                                         (LETT #5# |fln| . #12#) G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT #6# (CAR #5#) . #12#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #4# #6# . #12#)
                                            (COND
                                             (#2#
                                              (LETT #3#
                                                    (SPADCALL #3# #4#
                                                              (QREFELT $ 41))
                                                    . #12#))
                                             ('T
                                              (PROGN
                                               (LETT #3# #4# . #12#)
                                               (LETT #2# 'T . #12#)))))))
                                         (LETT #5# (CDR #5#) . #12#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#2# #3#)
                                          ('T (|spadConstant| $ 20))))
                                   (QREFELT $ 42))
                         . #12#)
                   (QREFELT $ 56))
                  (EXIT (PROGN (LETT #1# |$NoValue| . #12#) (GO #1#)))))))
              (LETT |fln| |nfln| . #12#)
              (EXIT
               (LETT |Modulus| (SPADCALL |prime| |Modulus| (QREFELT $ 57))
                     . #12#)))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (COND
       ((SPADCALL |constp| (|spadConstant| $ 18) (QREFELT $ 28))
        (LETT |fln| (CONS |constp| |fln|) . #12#)))
      (EXIT (CONS |fln| |Modulus|)))))) 

(DEFUN |GHENSEL;completeHensel;TPLRPPiL;11| (|m| |tl1| |prime| |bound| $)
  (PROG (|finallist| |factlist| |fln| #1=#:G345 |term| #2=#:G344 |auxfl|
         #3=#:G343 #4=#:G342 |aux| #5=#:G341 |poly| |dfn| |mm| |lcm1| |poly1|
         |u| |pol| #6=#:G322 #7=#:G321 #8=#:G323 #9=#:G340 |tc| #10=#:G319
         #11=#:G318 #12=#:G320 #13=#:G339 |auxl| |nm| |Modulus| |hlift|)
    (RETURN
     (SEQ
      (LETT |hlift| (SPADCALL |m| |tl1| |prime| |bound| (QREFELT $ 60))
            . #14=(|GHENSEL;completeHensel;TPLRPPiL;11|))
      (LETT |Modulus| (QCDR |hlift|) . #14#) (LETT |fln| (QCAR |hlift|) . #14#)
      (LETT |nm| (SPADCALL |m| (QREFELT $ 36)) . #14#)
      (LETT |factlist| NIL . #14#) (LETT |dfn| |nm| . #14#)
      (LETT |lcm1| (SPADCALL |m| (QREFELT $ 24)) . #14#)
      (LETT |mm| (SPADCALL |lcm1| |m| (QREFELT $ 25)) . #14#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |dfn| 0 (QREFELT $ 40))
                (SPADCALL
                 (LETT |factlist| (|GHENSEL;genFact| |fln| |factlist| $)
                       . #14#)
                 NIL (QREFELT $ 37)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (LETT |auxfl| NIL . #14#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |factlist| NIL (QREFELT $ 37)))
                       (GO G191)))
                     (SEQ (LETT |auxl| (|SPADfirst| |factlist|) . #14#)
                          (LETT |factlist| (CDR |factlist|) . #14#)
                          (LETT |tc|
                                (|GHENSEL;reduceCoef|
                                 (SPADCALL |lcm1|
                                           (PROGN
                                            (LETT #10# NIL . #14#)
                                            (SEQ (LETT |poly| NIL . #14#)
                                                 (LETT #13# |auxl| . #14#) G190
                                                 (COND
                                                  ((OR (ATOM #13#)
                                                       (PROGN
                                                        (LETT |poly| (CAR #13#)
                                                              . #14#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #12#
                                                          (SPADCALL |poly| 0
                                                                    (QREFELT $
                                                                             61))
                                                          . #14#)
                                                    (COND
                                                     (#10#
                                                      (LETT #11#
                                                            (SPADCALL #11# #12#
                                                                      (QREFELT
                                                                       $ 57))
                                                            . #14#))
                                                     ('T
                                                      (PROGN
                                                       (LETT #11# #12# . #14#)
                                                       (LETT #10# 'T
                                                             . #14#)))))))
                                                 (LETT #13# (CDR #13#) . #14#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (COND (#10# #11#)
                                                  ('T (|spadConstant| $ 19))))
                                           (QREFELT $ 57))
                                 |Modulus| $)
                                . #14#)
                          (EXIT
                           (COND
                            ((QEQCAR
                              (SPADCALL (SPADCALL |mm| 0 (QREFELT $ 61)) |tc|
                                        (QREFELT $ 63))
                              1)
                             (LETT |auxfl| (CONS |auxl| |auxfl|) . #14#))
                            ('T
                             (SEQ
                              (LETT |pol|
                                    (PROGN
                                     (LETT #6# NIL . #14#)
                                     (SEQ (LETT |poly| NIL . #14#)
                                          (LETT #9# |auxl| . #14#) G190
                                          (COND
                                           ((OR (ATOM #9#)
                                                (PROGN
                                                 (LETT |poly| (CAR #9#) . #14#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #8# |poly| . #14#)
                                             (COND
                                              (#6#
                                               (LETT #7#
                                                     (SPADCALL #7# #8#
                                                               (QREFELT $ 41))
                                                     . #14#))
                                              ('T
                                               (PROGN
                                                (LETT #7# #8# . #14#)
                                                (LETT #6# 'T . #14#)))))))
                                          (LETT #9# (CDR #9#) . #14#) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND (#6# #7#)
                                           ('T (|spadConstant| $ 20))))
                                    . #14#)
                              (LETT |poly|
                                    (SPADCALL
                                     (SPADCALL |lcm1| |pol| (QREFELT $ 25))
                                     |Modulus| (QREFELT $ 15))
                                    . #14#)
                              (LETT |u| (SPADCALL |mm| |poly| (QREFELT $ 64))
                                    . #14#)
                              (EXIT
                               (COND
                                ((QEQCAR |u| 1)
                                 (LETT |auxfl| (CONS |auxl| |auxfl|) . #14#))
                                ('T
                                 (SEQ
                                  (LETT |poly1|
                                        (SPADCALL |poly| (QREFELT $ 65))
                                        . #14#)
                                  (LETT |m|
                                        (|GHENSEL;mQuo| (QCDR |u|)
                                         (SPADCALL |poly1| (QREFELT $ 24)) $)
                                        . #14#)
                                  (LETT |lcm1| (SPADCALL |m| (QREFELT $ 24))
                                        . #14#)
                                  (LETT |mm|
                                        (SPADCALL |lcm1| |m| (QREFELT $ 25))
                                        . #14#)
                                  (LETT |finallist| (CONS |poly1| |finallist|)
                                        . #14#)
                                  (LETT |dfn| (SPADCALL |m| (QREFELT $ 36))
                                        . #14#)
                                  (LETT |aux| NIL . #14#)
                                  (SEQ (LETT |poly| NIL . #14#)
                                       (LETT #5# |fln| . #14#) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN
                                              (LETT |poly| (CAR #5#) . #14#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |poly| |auxl|
                                                      (QREFELT $ 39)))
                                           (LETT |aux| (CONS |poly| |aux|)
                                                 . #14#))
                                          ('T
                                           (SEQ
                                            (LETT |auxfl|
                                                  (PROGN
                                                   (LETT #4# NIL . #14#)
                                                   (SEQ
                                                    (LETT |term| NIL . #14#)
                                                    (LETT #3# |auxfl| . #14#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #3#)
                                                          (PROGN
                                                           (LETT |term|
                                                                 (CAR #3#)
                                                                 . #14#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((COND
                                                         ((SPADCALL |poly|
                                                                    |term|
                                                                    (QREFELT $
                                                                             39))
                                                          'NIL)
                                                         ('T 'T))
                                                        (LETT #4#
                                                              (CONS |term| #4#)
                                                              . #14#)))))
                                                    (LETT #3# (CDR #3#) . #14#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #4#))))
                                                  . #14#)
                                            (EXIT
                                             (LETT |factlist|
                                                   (PROGN
                                                    (LETT #2# NIL . #14#)
                                                    (SEQ
                                                     (LETT |term| NIL . #14#)
                                                     (LETT #1# |factlist|
                                                           . #14#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |term|
                                                                  (CAR #1#)
                                                                  . #14#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (COND
                                                        ((COND
                                                          ((SPADCALL |poly|
                                                                     |term|
                                                                     (QREFELT $
                                                                              39))
                                                           'NIL)
                                                          ('T 'T))
                                                         (LETT #2#
                                                               (CONS |term|
                                                                     #2#)
                                                               . #14#)))))
                                                     (LETT #1# (CDR #1#)
                                                           . #14#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #2#))))
                                                   . #14#)))))))
                                       (LETT #5# (CDR #5#) . #14#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (LETT |fln| |aux| . #14#)))))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |factlist| |auxfl| . #14#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL |dfn| 0 (QREFELT $ 40))
        (LETT |finallist| (CONS |m| |finallist|) . #14#)))
      (EXIT |finallist|))))) 

(DEFUN |GeneralHenselPackage| (&REST #1=#:G346)
  (PROG ()
    (RETURN
     (PROG (#2=#:G347)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralHenselPackage|)
                                           '|domainEqualList|)
                . #3=(|GeneralHenselPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |GeneralHenselPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|GeneralHenselPackage|))))))))))) 

(DEFUN |GeneralHenselPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GeneralHenselPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|GeneralHenselPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GeneralHenselPackage| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 29
                (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 15)
                                        (CONS (|function| |GHENSEL;merge|) $)
                                        (CONS (|function| |GHENSEL;exactquo|)
                                              $)))
      $)))) 

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
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 6 8 0 9 2 10 0 0 0 11 2 6
                                                   0 0 0 12 2 7 0 13 0 14 2 6 8
                                                   0 0 16 0 6 0 17 0 7 0 18 0 6
                                                   0 19 0 7 0 20 3 6 22 0 0 0
                                                   23 1 7 6 0 24 2 7 0 6 0 25 2
                                                   7 26 0 0 27 2 7 8 0 0 28 2 6
                                                   0 0 0 30 2 29 0 0 0 31 2 29
                                                   0 0 0 32 2 33 8 0 0 34 1 7
                                                   35 0 36 2 33 8 0 0 37 2 38 8
                                                   7 0 39 2 35 8 0 0 40 2 7 0 0
                                                   0 41 2 7 0 0 0 42 2 29 0 7 6
                                                   43 1 29 8 0 44 1 7 0 6 45 1
                                                   29 7 0 46 2 7 0 0 0 47 0 29
                                                   0 48 2 29 49 50 0 51 1 29 0
                                                   0 52 1 7 6 0 53 1 6 35 0 54
                                                   2 38 8 0 0 55 1 7 8 0 56 2 6
                                                   0 0 0 57 2 7 6 0 35 61 2 6
                                                   62 0 0 63 2 7 62 0 0 64 1 7
                                                   0 0 65 2 0 7 7 6 15 4 0 38 7
                                                   38 6 59 66 4 0 58 7 38 6 59
                                                   60)))))
           '|lookupComplete|)) 
