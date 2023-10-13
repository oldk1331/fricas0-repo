
(/VERSIONCHECK 2) 

(DEFUN |INTTR;logprmderiv| (|f| |derivation| $)
  (SPADCALL (SPADCALL |f| |derivation| (QREFELT $ 12)) |f| (QREFELT $ 13))) 

(DEFUN |INTTR;UP2UP2| (|p| $) (SPADCALL (ELT $ 14) |p| (QREFELT $ 18))) 

(DEFUN |INTTR;UP2UPR| (|p| $)
  (SPADCALL (CONS #'|INTTR;UP2UPR!0| $) |p| (QREFELT $ 23))) 

(DEFUN |INTTR;UP2UPR!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 14)) (QREFELT $ 19))) 

(DEFUN |INTTR;UP22UPR| (|p| $) (SPADCALL (ELT $ 19) |p| (QREFELT $ 26))) 

(DEFUN |INTTR;kappa| (|p| |derivation| $)
  (PROG (|ans|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 27) . #1=(|INTTR;kappa|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 27) (QREFELT $ 30)))
                 (GO G191)))
               (SEQ
                (LETT |ans|
                      (SPADCALL |ans|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                            (QREFELT $ 14))
                                  |derivation|)
                                 (SPADCALL (|spadConstant| $ 32)
                                           (SPADCALL |p| (QREFELT $ 35))
                                           (QREFELT $ 36))
                                 (QREFELT $ 37))
                                (QREFELT $ 38))
                      . #1#)
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 39)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |INTTR;monomialIntegrate;FMR;6| (|f| |derivation| $)
  (PROG (|u| |p| |dlog| |logs| #1=#:G205 |term| #2=#:G204 |rec| |respoly|
         |resultvec| |x| |iden| |inum| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40))
        (VECTOR (|spadConstant| $ 42) (|spadConstant| $ 9)
                (|spadConstant| $ 27)))
       (#3='T
        (SEQ
         (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
               . #4=(|INTTR;monomialIntegrate;FMR;6|))
         (EXIT
          (COND
           ((SPADCALL
             (LETT |inum| (SPADCALL (QVELT |r| 1) (QREFELT $ 46)) . #4#)
             (QREFELT $ 47))
            (VECTOR (SPADCALL (QVELT |r| 0) (QREFELT $ 48)) (QVELT |r| 2)
                    (QVELT |r| 3)))
           (#3#
            (SEQ (LETT |iden| (SPADCALL (QVELT |r| 1) (QREFELT $ 49)) . #4#)
                 (LETT |x| (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       . #4#)
                 (LETT |resultvec|
                       (SPADCALL
                        (SPADCALL (|INTTR;UP2UP2| |inum| $)
                                  (SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                            (|INTTR;UP2UP2|
                                             (SPADCALL |iden| |derivation|) $)
                                            (QREFELT $ 51))
                                  (QREFELT $ 52))
                        (|INTTR;UP2UP2| |iden| $) (QREFELT $ 55))
                       . #4#)
                 (LETT |respoly|
                       (SPADCALL
                        (SPADCALL (QAREF1 |resultvec| 0) (QREFELT $ 56))
                        (QREFELT $ 57))
                       . #4#)
                 (LETT |rec|
                       (SPADCALL |respoly|
                                 (CONS #'|INTTR;monomialIntegrate;FMR;6!0|
                                       (VECTOR $ |derivation|))
                                 (QREFELT $ 60))
                       . #4#)
                 (LETT |logs|
                       (PROGN
                        (LETT #2# NIL . #4#)
                        (SEQ (LETT |term| NIL . #4#)
                             (LETT #1# (SPADCALL (QCDR |rec|) (QREFELT $ 64))
                                   . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |term| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (VECTOR (|spadConstant| $ 66)
                                              (|INTTR;UP2UPR| (QCAR |term|) $)
                                              (|INTTR;UP22UPR|
                                               (SPADCALL
                                                (SPADCALL
                                                 (QAREF1 |resultvec|
                                                         (QCDR |term|))
                                                 (QCAR |term|) (QREFELT $ 67))
                                                (QREFELT $ 69))
                                               $))
                                      #2#)
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #4#)
                 (LETT |dlog|
                       (COND
                        ((SPADCALL (SPADCALL |x| |derivation|)
                                   (|spadConstant| $ 33) (QREFELT $ 70))
                         (QVELT |r| 1))
                        (#3#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 9) |logs| NIL
                                    (QREFELT $ 75))
                          (CONS #'|INTTR;monomialIntegrate;FMR;6!1|
                                (VECTOR $ |derivation|))
                          (QREFELT $ 77))))
                       . #4#)
                 (LETT |u|
                       (SPADCALL
                        (LETT |p|
                              (SPADCALL (QVELT |r| 1) |dlog| (QREFELT $ 78))
                              . #4#)
                        (QREFELT $ 80))
                       . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (VECTOR (SPADCALL (QVELT |r| 0) |logs| NIL (QREFELT $ 75))
                            (QVELT |r| 2)
                            (SPADCALL (QVELT |r| 3) (QCDR |u|)
                                      (QREFELT $ 38))))
                   (#3#
                    (VECTOR
                     (SPADCALL (QVELT |r| 0) |logs|
                               (LIST (CONS |p| (QREFELT $ 10))) (QREFELT $ 75))
                     (QVELT |r| 2) (QVELT |r| 3)))))))))))))))) 

(DEFUN |INTTR;monomialIntegrate;FMR;6!1| (|x1| $$)
  (PROG (|derivation| $)
    (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;monomialIntegrate;FMR;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(DEFUN |INTTR;monomialIntegrate;FMR;6!0| (|x1| $$)
  (PROG (|derivation| $)
    (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;monomialIntegrate;FMR;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTTR;kappa| |x1| |derivation| $))))) 

(DEFUN |INTTR;monomialIntPoly;UPMR;7| (|p| |derivation| $)
  (PROG (|ans| |term| #1=#:G207 |n| |l| |d| |dt|)
    (RETURN
     (SEQ
      (LETT |d|
            (SPADCALL
             (LETT |dt|
                   (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                             |derivation|)
                   . #2=(|INTTR;monomialIntPoly;UPMR;7|))
             (QREFELT $ 35))
            . #2#)
      (EXIT
       (COND
        ((< |d| 2)
         (|error| "monomIntPoly: monomial must have degree 2 or more"))
        ('T
         (SEQ (LETT |l| (SPADCALL |dt| (QREFELT $ 31)) . #2#)
              (LETT |ans| (|spadConstant| $ 27) . #2#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |n| (- (+ 1 (SPADCALL |p| (QREFELT $ 35))) |d|)
                             . #2#)
                       0 (QREFELT $ 85)))
                     (GO G191)))
                   (SEQ
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (LETT |term|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 31))
                                            (SPADCALL |n| |l| (QREFELT $ 86))
                                            (QREFELT $ 87))
                                           (PROG1 (LETT #1# |n| . #2#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#))
                                           (QREFELT $ 36))
                                          . #2#)
                                    (QREFELT $ 38))
                          . #2#)
                    (EXIT
                     (LETT |p|
                           (SPADCALL |p| (SPADCALL |term| |derivation|)
                                     (QREFELT $ 88))
                           . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |ans| |p|)))))))))) 

(DEFUN |INTTR;expintegratepoly| (|p| FRDE $)
  (PROG (|notelm| |coef0| |missing| |answr| |ans1| |a| |n|)
    (RETURN
     (SEQ (LETT |coef0| (|spadConstant| $ 28) . #1=(|INTTR;expintegratepoly|))
          (LETT |notelm| (LETT |answr| (|spadConstant| $ 92) . #1#) . #1#)
          (SEQ G190
               (COND
                ((NULL (SPADCALL |p| (|spadConstant| $ 92) (QREFELT $ 93)))
                 (GO G191)))
               (SEQ
                (LETT |ans1|
                      (SPADCALL (LETT |n| (SPADCALL |p| (QREFELT $ 94)) . #1#)
                                (LETT |a| (SPADCALL |p| (QREFELT $ 95)) . #1#)
                                FRDE)
                      . #1#)
                (LETT |answr|
                      (SPADCALL |answr|
                                (SPADCALL (QVELT |ans1| 0) |n| (QREFELT $ 96))
                                (QREFELT $ 97))
                      . #1#)
                (COND
                 ((NOT (QVELT |ans1| 2))
                  (SEQ
                   (LETT |missing|
                         (SPADCALL |a| (QVELT |ans1| 1) (QREFELT $ 98)) . #1#)
                   (EXIT
                    (COND ((ZEROP |n|) (LETT |coef0| |missing| . #1#))
                          ('T
                           (LETT |notelm|
                                 (SPADCALL |notelm|
                                           (SPADCALL |missing| |n|
                                                     (QREFELT $ 96))
                                           (QREFELT $ 97))
                                 . #1#)))))))
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 99)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |notelm| (QREFELT $ 100))
             (CONS 0 (CONS |answr| |coef0|)))
            ('T
             (CONS 1
                   (CONS |answr|
                         (SPADCALL |notelm| (SPADCALL |coef0| 0 (QREFELT $ 96))
                                   (QREFELT $ 97))))))))))) 

(DEFUN |INTTR;tanintegratespecial| (|f| |derivation| FRDE $)
  (PROG (#1=#:G239 |u| |c0| |ans| |term| |l| #2=#:G240 |b| |a| |r| |n| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (LETT |ans| (|spadConstant| $ 9) . #3=(|INTTR;tanintegratespecial|))
          (LETT |p|
                (SPADCALL (SPADCALL (|spadConstant| $ 32) 2 (QREFELT $ 36))
                          (|spadConstant| $ 33) (QREFELT $ 38))
                . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL
                   (LETT |n|
                         (QUOTIENT2
                          (SPADCALL (SPADCALL |f| (QREFELT $ 49))
                                    (QREFELT $ 35))
                          2)
                         . #3#)
                   0 (QREFELT $ 101)))
                 (GO G191)))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 46)) |p|
                                (QREFELT $ 102))
                      . #3#)
                (LETT |a| (SPADCALL |r| 1 (QREFELT $ 103)) . #3#)
                (LETT |b| (SPADCALL |r| 0 (QREFELT $ 103)) . #3#)
                (LETT |u| (SPADCALL |n| |a| |b| FRDE) . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (PROGN (LETT #2# (CONS 1 (CONS |ans| |f|)) . #3#) (GO #2#)))
                  ('T
                   (SEQ (LETT |l| (QCDR |u|) . #3#)
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|SPADfirst| |l|) 1 (QREFELT $ 36))
                                (SPADCALL (SPADCALL |l| (QREFELT $ 105))
                                          (QREFELT $ 14))
                                (QREFELT $ 38))
                               (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 106))
                              . #3#)
                        (LETT |ans| (SPADCALL |ans| |term| (QREFELT $ 107))
                              . #3#)
                        (EXIT
                         (LETT |f|
                               (SPADCALL |f| (SPADCALL |term| |derivation|)
                                         (QREFELT $ 78))
                               . #3#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL
             (LETT |c0|
                   (SPADCALL (SPADCALL |f| (QREFELT $ 108)) (QREFELT $ 109))
                   . #3#)
             (QREFELT $ 110))
            (EXIT (CONS 0 (CONS |ans| |c0|))))
           ('T
            (SEQ (LETT |u| (SPADCALL 0 |c0| (|spadConstant| $ 28) FRDE) . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #1# (CONS 0 (CONS |ans| |c0|)) . #3#)
                     (GO #1#))))))))
          (EXIT
           (CONS 0
                 (CONS
                  (SPADCALL |ans|
                            (SPADCALL
                             (SPADCALL (|SPADfirst| (QCDR |u|)) (QREFELT $ 14))
                             (QREFELT $ 19))
                            (QREFELT $ 107))
                  (|spadConstant| $ 28))))))
        #1# (EXIT #1#)))
      #2# (EXIT #2#))))) 

(DEFUN |INTTR;expextintfrac| (|f| |derivation| |g| $)
  (PROG (|c| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40))
        (CONS 0 (CONS (|spadConstant| $ 9) (|spadConstant| $ 9))))
       ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
            (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 35)))
        (|error| "Not a proper fraction"))
       ((SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 49))
                   (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                   (QREFELT $ 111))
         0 (QREFELT $ 101))
        (|error| "Not integral at t = 0"))
       (#1='T
        (SEQ
         (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
               . #2=(|INTTR;expextintfrac|))
         (EXIT
          (COND
           ((SPADCALL |g| (QREFELT $ 40))
            (COND
             ((SPADCALL (QVELT |r| 1) (|spadConstant| $ 9) (QREFELT $ 112))
              (CONS 1 "failed"))
             (#1# (CONS 0 (CONS (QVELT |r| 0) (|spadConstant| $ 9))))))
           ((>= (SPADCALL (SPADCALL |g| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |g| (QREFELT $ 49)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           ((SPADCALL
             (SPADCALL (SPADCALL |g| (QREFELT $ 49))
                       (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 111))
             0 (QREFELT $ 101))
            (|error| "Not integral at t = 0"))
           ((SPADCALL
             (SPADCALL
              (LETT |c| (SPADCALL (QVELT |r| 1) |g| (QREFELT $ 13)) . #2#)
              |derivation| (QREFELT $ 12))
             (|spadConstant| $ 9) (QREFELT $ 112))
            (CONS 1 "failed"))
           (#1# (CONS 0 (CONS (QVELT |r| 0) |c|)))))))))))) 

(DEFUN |INTTR;limitedLogs| (|f| |logderiv| |lu| $)
  (PROG (#1=#:G283 |ans| |c0| |c| OK #2=#:G292 |pp| #3=#:G293 |j| #4=#:G291 |i|
         |m| #5=#:G289 #6=#:G290 #7=#:G288 |cols| |rows| #8=#:G287 |u|
         #9=#:G286 |l1| |v| #10=#:G285 #11=#:G284 |den| |num| |u0|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |f| (QREFELT $ 40)) (CONS 0 NIL))
             ((NULL |lu|) (CONS 1 "failed"))
             ((NULL (CDR |lu|))
              (COND
               ((SPADCALL
                 (SPADCALL
                  (LETT |c0|
                        (SPADCALL |f|
                                  (SPADCALL
                                   (LETT |u0| (|SPADfirst| |lu|)
                                         . #12=(|INTTR;limitedLogs|))
                                   |logderiv|)
                                  (QREFELT $ 13))
                        . #12#)
                  |logderiv|)
                 (|spadConstant| $ 9) (QREFELT $ 112))
                (CONS 1 "failed"))
               (#13='T (CONS 0 (LIST (CONS |c0| |u0|))))))
             (#13#
              (SEQ (LETT |num| (SPADCALL |f| (QREFELT $ 46)) . #12#)
                   (LETT |den| (SPADCALL |f| (QREFELT $ 49)) . #12#)
                   (LETT |l1|
                         (PROGN
                          (LETT #11# NIL . #12#)
                          (SEQ (LETT |u| NIL . #12#) (LETT #10# |lu| . #12#)
                               G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |u| (CAR #10#) . #12#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL
                                     (LETT |v|
                                           (SPADCALL |den|
                                                     (SPADCALL |u| |logderiv|)
                                                     (QREFELT $ 113))
                                           . #12#)
                                     (QREFELT $ 49))
                                    (|spadConstant| $ 33) (QREFELT $ 70))
                                   (LETT #11#
                                         (CONS
                                          (CONS |u|
                                                (SPADCALL |v| (QREFELT $ 46)))
                                          #11#)
                                         . #12#)))))
                               (LETT #10# (CDR #10#) . #12#) (GO G190) G191
                               (EXIT (NREVERSE #11#))))
                         . #12#)
                   (LETT |rows|
                         (MAX (SPADCALL |den| (QREFELT $ 35))
                              (+ 1
                                 (SPADCALL (ELT $ 114)
                                           (PROGN
                                            (LETT #9# NIL . #12#)
                                            (SEQ (LETT |u| NIL . #12#)
                                                 (LETT #8# |l1| . #12#) G190
                                                 (COND
                                                  ((OR (ATOM #8#)
                                                       (PROGN
                                                        (LETT |u| (CAR #8#)
                                                              . #12#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #9#
                                                         (CONS
                                                          (SPADCALL (QCDR |u|)
                                                                    (QREFELT $
                                                                             35))
                                                          #9#)
                                                         . #12#)))
                                                 (LETT #8# (CDR #8#) . #12#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #9#))))
                                           0 (QREFELT $ 117))))
                         . #12#)
                   (LETT |m|
                         (SPADCALL |rows|
                                   (LETT |cols| (+ 1 (LENGTH |l1|)) . #12#)
                                   (QREFELT $ 119))
                         . #12#)
                   (SEQ (LETT |i| 0 . #12#) (LETT #7# (- |rows| 1) . #12#) G190
                        (COND ((|greater_SI| |i| #7#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |j| 1 . #12#)
                              (LETT #6# (- (SPADCALL |m| (QREFELT $ 120)) 1)
                                    . #12#)
                              (LETT |pp| NIL . #12#) (LETT #5# |l1| . #12#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |pp| (CAR #5#) . #12#) NIL)
                                    (|greater_SI| |j| #6#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF2O |m| (+ |i| 1) |j|
                                            (SPADCALL (QCDR |pp|) |i|
                                                      (QREFELT $ 103))
                                            1 1)))
                              (LETT #5#
                                    (PROG1 (CDR #5#)
                                      (LETT |j| (|inc_SI| |j|) . #12#))
                                    . #12#)
                              (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (QSETAREF2O |m| (+ |i| 1)
                                      (SPADCALL |m| (QREFELT $ 120))
                                      (SPADCALL |num| |i| (QREFELT $ 103)) 1
                                      1)))
                        (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |m| (SPADCALL |m| (QREFELT $ 121)) . #12#)
                   (LETT |ans| NIL . #12#)
                   (SEQ (LETT |i| 1 . #12#)
                        (LETT #4# (SPADCALL |m| (QREFELT $ 122)) . #12#) G190
                        (COND ((|greater_SI| |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (QAREF2O |m| |i| (SPADCALL |m| (QREFELT $ 120)) 1
                                      1)
                             (|spadConstant| $ 28) (QREFELT $ 123))
                            (SEQ (LETT OK 'NIL . #12#)
                                 (SEQ (LETT |j| 1 . #12#)
                                      (LETT #3#
                                            (- (SPADCALL |m| (QREFELT $ 120))
                                               1)
                                            . #12#)
                                      (LETT |pp| NIL . #12#)
                                      (LETT #2# |l1| . #12#) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |pp| (CAR #2#) . #12#)
                                             NIL)
                                            (|greater_SI| |j| #3#)
                                            (NULL (COND (OK 'NIL) ('T 'T))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL (QAREF2O |m| |i| |j| 1 1)
                                                    (|spadConstant| $ 28)
                                                    (QREFELT $ 123))
                                          (SEQ (LETT OK 'T . #12#)
                                               (LETT |c|
                                                     (SPADCALL
                                                      (QAREF2O |m| |i|
                                                               (SPADCALL |m|
                                                                         (QREFELT
                                                                          $
                                                                          120))
                                                               1 1)
                                                      (QAREF2O |m| |i| |j| 1 1)
                                                      (QREFELT $ 87))
                                                     . #12#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL
                                                   (SPADCALL
                                                    (LETT |c0|
                                                          (SPADCALL
                                                           (SPADCALL |c|
                                                                     (QREFELT $
                                                                              14))
                                                           (QREFELT $ 19))
                                                          . #12#)
                                                    |logderiv|)
                                                   (|spadConstant| $ 9)
                                                   (QREFELT $ 112))
                                                  (PROGN
                                                   (LETT #1# (CONS 1 "failed")
                                                         . #12#)
                                                   (GO #1#)))
                                                 ('T
                                                  (LETT |ans|
                                                        (CONS
                                                         (CONS |c0|
                                                               (QCAR |pp|))
                                                         |ans|)
                                                        . #12#)))))))))
                                      (LETT #2#
                                            (PROG1 (CDR #2#)
                                              (LETT |j| (|inc_SI| |j|) . #12#))
                                            . #12#)
                                      (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((NULL OK)
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed") . #12#)
                                     (GO #1#))))))))))
                        (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT (CONS 0 |ans|))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTTR;primintfldpoly;UPMFU;12| (|p| |extendedint| |t'| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (|INTTR;primintegratepoly| |p| |extendedint| |t'| $)
            |INTTR;primintfldpoly;UPMFU;12|)
      (EXIT
       (COND
        ((OR (QEQCAR |u| 1)
             (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                       (QREFELT $ 123)))
         (CONS 1 "failed"))
        ('T (CONS 0 (QCAR (QCDR |u|)))))))))) 

(DEFUN |INTTR;expintfldpoly;LpMU;13| (|p| FRDE $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (|INTTR;expintegratepoly| |p| FRDE $)
            |INTTR;expintfldpoly;LpMU;13|)
      (EXIT
       (COND
        ((OR (QEQCAR |u| 1)
             (SPADCALL (QCDR (QCDR |u|)) (|spadConstant| $ 28)
                       (QREFELT $ 123)))
         (CONS 1 "failed"))
        ('T (CONS 0 (QCAR (QCDR |u|)))))))))) 

(DEFUN |INTTR;primlimitedint;FMMLU;14| (|f| |derivation| |extendedint| |lu| $)
  (PROG (|u2| |u1| |qr|)
    (RETURN
     (SEQ
      (LETT |qr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 46))
                      (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 133))
            . #1=(|INTTR;primlimitedint;FMMLU;14|))
      (LETT |u1|
            (SPADCALL
             (SPADCALL (QCDR |qr|) (SPADCALL |f| (QREFELT $ 49))
                       (QREFELT $ 106))
             |derivation| |lu| (QREFELT $ 138))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |u2|
                     (|INTTR;primintegratepoly| (QCAR |qr|) |extendedint|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|)
                       (QREFELT $ 109))
                      $)
                     . #1#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (CONS
                              (CONS
                               (SPADCALL (QCAR (QCDR |u1|))
                                         (SPADCALL (QCAR (QCDR |u2|))
                                                   (QREFELT $ 19))
                                         (QREFELT $ 107))
                               (QCDR (QCDR |u1|)))
                              (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTTR;explimitedint;FMMLU;15| (|f| |derivation| FRDE |lu| $)
  (PROG (|u2| |ea| |u11| |u1| |qr|)
    (RETURN
     (SEQ
      (LETT |qr| (SPADCALL |f| (QREFELT $ 143))
            . #1=(|INTTR;explimitedint;FMMLU;15|))
      (LETT |u1| (|INTTR;explimintfrac| (QCDR |qr|) |derivation| |lu| $) . #1#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |u11| (QCAR (QCDR |u1|)) . #1#)
                   (LETT |ea| (QCDR (QCDR |u1|)) . #1#)
                   (LETT |u2|
                         (|INTTR;expintegratepoly|
                          (SPADCALL (QCAR |qr|) (SPADCALL |ea| (QREFELT $ 144))
                                    (QREFELT $ 145))
                          FRDE $)
                         . #1#)
                   (EXIT
                    (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (CONS
                                  (CONS
                                   (SPADCALL (QCAR |u11|)
                                             (SPADCALL (QCAR (QCDR |u2|))
                                                       (QREFELT $ 146))
                                             (QREFELT $ 107))
                                   (QCDR |u11|))
                                  (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTTR;primlimintfrac;FMLU;16| (|f| |derivation| |lu| $)
  (PROG (|u| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40)) (CONS 0 (CONS (|spadConstant| $ 9) NIL)))
       ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
            (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 35)))
        (|error| "Not a proper fraction"))
       (#1='T
        (SEQ
         (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
               . #2=(|INTTR;primlimintfrac;FMLU;16|))
         (EXIT
          (COND
           ((SPADCALL (QVELT |r| 1) (QREFELT $ 40))
            (CONS 0 (CONS (QVELT |r| 0) NIL)))
           (#1#
            (SEQ
             (LETT |u|
                   (|INTTR;limitedLogs| (QVELT |r| 1)
                    (CONS #'|INTTR;primlimintfrac;FMLU;16!0|
                          (VECTOR $ |derivation|))
                    |lu| $)
                   . #2#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#1# (CONS 0 (CONS (QVELT |r| 0) (QCDR |u|))))))))))))))))) 

(DEFUN |INTTR;primlimintfrac;FMLU;16!0| (|x1| $$)
  (PROG (|derivation| $)
    (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;primlimintfrac;FMLU;16|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTTR;logprmderiv| |x1| |derivation| $))))) 

(DEFUN |INTTR;explimintfrac| (|f| |derivation| |lu| $)
  (PROG (|ea| #1=#:G412 #2=#:G411 #3=#:G413 #4=#:G421 |v| |u| |uu| |eta'| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40))
        (CONS 0 (CONS (CONS (|spadConstant| $ 9) NIL) (|spadConstant| $ 28))))
       ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
            (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 35)))
        (|error| "Not a proper fraction"))
       ((SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT $ 49))
                   (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                   (QREFELT $ 111))
         0 (QREFELT $ 148))
        (|error| "Not integral at t = 0"))
       (#5='T
        (SEQ
         (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
               . #6=(|INTTR;explimintfrac|))
         (EXIT
          (COND
           ((SPADCALL (QVELT |r| 1) (QREFELT $ 40))
            (CONS 0 (CONS (CONS (QVELT |r| 0) NIL) (|spadConstant| $ 28))))
           (#5#
            (SEQ
             (LETT |eta'|
                   (SPADCALL
                    (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                              |derivation|)
                    1 (QREFELT $ 103))
                   . #6#)
             (LETT |uu|
                   (|INTTR;limitedLogs| (QVELT |r| 1)
                    (CONS #'|INTTR;explimintfrac!0|
                          (VECTOR $ |eta'| |derivation|))
                    |lu| $)
                   . #6#)
             (EXIT
              (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                    (#5#
                     (SEQ (LETT |u| (QCDR |uu|) . #6#)
                          (LETT |ea|
                                (SPADCALL |eta'|
                                          (PROGN
                                           (LETT #1# NIL . #6#)
                                           (SEQ (LETT |v| NIL . #6#)
                                                (LETT #4# |u| . #6#) G190
                                                (COND
                                                 ((OR (ATOM #4#)
                                                      (PROGN
                                                       (LETT |v| (CAR #4#)
                                                             . #6#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #3#
                                                         (SPADCALL
                                                          (-
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QCDR |v|)
                                                             (QREFELT $ 46))
                                                            (QREFELT $ 35))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QCDR |v|)
                                                             (QREFELT $ 49))
                                                            (QREFELT $ 35)))
                                                          (SPADCALL
                                                           (SPADCALL (QCAR |v|)
                                                                     (QREFELT $
                                                                              108))
                                                           (QREFELT $ 109))
                                                          (QREFELT $ 86))
                                                         . #6#)
                                                   (COND
                                                    (#1#
                                                     (LETT #2#
                                                           (SPADCALL #2# #3#
                                                                     (QREFELT $
                                                                              149))
                                                           . #6#))
                                                    ('T
                                                     (PROGN
                                                      (LETT #2# #3# . #6#)
                                                      (LETT #1# 'T . #6#)))))))
                                                (LETT #4# (CDR #4#) . #6#)
                                                (GO G190) G191 (EXIT NIL))
                                           (COND (#1# #2#)
                                                 (#5# (|spadConstant| $ 28))))
                                          (QREFELT $ 150))
                                . #6#)
                          (EXIT
                           (CONS 0
                                 (CONS (CONS (QVELT |r| 0) |u|)
                                       |ea|)))))))))))))))))) 

(DEFUN |INTTR;explimintfrac!0| (|x1| $$)
  (PROG (|derivation| |eta'| $)
    (LETT |derivation| (QREFELT $$ 2) . #1=(|INTTR;explimintfrac|))
    (LETT |eta'| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTTR;logexpderiv| |x1| |derivation| |eta'| $))))) 

(DEFUN |INTTR;logexpderiv| (|f| |derivation| |eta'| $)
  (SPADCALL
   (SPADCALL (SPADCALL |f| |derivation| (QREFELT $ 12)) |f| (QREFELT $ 13))
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (- (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
         (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 35)))
      |eta'| (QREFELT $ 86))
     (QREFELT $ 14))
    (QREFELT $ 19))
   (QREFELT $ 78))) 

(DEFUN |INTTR;notelementary| (|rec| $)
  (SPADCALL (QVELT |rec| 0)
            (SPADCALL
             (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 19))
                       (QVELT |rec| 1) (QREFELT $ 107))
             (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                       (QREFELT $ 19))
             (QREFELT $ 151))
            (QREFELT $ 152))) 

(DEFUN |INTTR;primintegrate;FMMR;20| (|f| |derivation| |extendedint| $)
  (PROG (|u2| |i1| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 82))
            . #1=(|INTTR;primintegrate;FMMR;20|))
      (COND
       ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 153)))
        (EXIT (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
      (LETT |u2|
            (|INTTR;primintegratepoly| (QVELT |rec| 2) |extendedint|
             (SPADCALL
              (SPADCALL (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|)
              (QREFELT $ 109))
             $)
            . #1#)
      (EXIT
       (COND
        ((QEQCAR |u2| 1)
         (CONS
          (SPADCALL
           (SPADCALL |i1|
                     (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                               (QREFELT $ 48))
                     (QREFELT $ 152))
           (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 19))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                      (QREFELT $ 19))
                     (QREFELT $ 151))
           (QREFELT $ 152))
          (|spadConstant| $ 28)))
        ('T
         (CONS
          (SPADCALL |i1|
                    (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 19))
                              (QREFELT $ 48))
                    (QREFELT $ 152))
          (QCDR (QCDR |u2|)))))))))) 

(DEFUN |INTTR;expintegrate;FMMR;21| (|f| |derivation| FRDE $)
  (PROG (|u2| |special| #1=#:G448 |i1| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 82))
            . #2=(|INTTR;expintegrate;FMMR;21|))
      (COND
       ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #2#) (QREFELT $ 153)))
        (EXIT (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
      (LETT |special|
            (SPADCALL (SPADCALL (QVELT |rec| 2) (QREFELT $ 156))
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 46))
                                  (QREFELT $ 156))
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 49))
                                  (QREFELT $ 156))
                                 (QREFELT $ 158))
                                . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|LaurentPolynomial| (QREFELT $ 6)
                                                            (QREFELT $ 7))
                                       #1#))
                      (QREFELT $ 97))
            . #2#)
      (LETT |u2| (|INTTR;expintegratepoly| |special| FRDE $) . #2#)
      (EXIT
       (COND
        ((QEQCAR |u2| 1)
         (CONS
          (SPADCALL
           (SPADCALL |i1|
                     (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 146))
                               (QREFELT $ 48))
                     (QREFELT $ 152))
           (SPADCALL (SPADCALL (QCDR (QCDR |u2|)) (QREFELT $ 146))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                      (QREFELT $ 19))
                     (QREFELT $ 151))
           (QREFELT $ 152))
          (|spadConstant| $ 28)))
        ('T
         (CONS
          (SPADCALL |i1|
                    (SPADCALL (SPADCALL (QCAR (QCDR |u2|)) (QREFELT $ 146))
                              (QREFELT $ 48))
                    (QREFELT $ 152))
          (QCDR (QCDR |u2|)))))))))) 

(DEFUN |INTTR;tanintegrate;FMMR;22| (|f| |derivation| FRDE $)
  (PROG (|u| |c0| |logs| |c| |t| |r| |i1| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL |f| |derivation| (QREFELT $ 82))
            . #1=(|INTTR;tanintegrate;FMMR;22|))
      (COND
       ((NULL (SPADCALL (LETT |i1| (QVELT |rec| 0) . #1#) (QREFELT $ 153)))
        (EXIT (CONS (|INTTR;notelementary| |rec| $) (|spadConstant| $ 28)))))
      (LETT |r| (SPADCALL (QVELT |rec| 2) |derivation| (QREFELT $ 90)) . #1#)
      (LETT |t| (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36)) . #1#)
      (LETT |c|
            (SPADCALL (SPADCALL (QCDR |r|) 1 (QREFELT $ 103))
                      (SPADCALL (SPADCALL |t| |derivation|) (QREFELT $ 31))
                      (QREFELT $ 87))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (SPADCALL |c| (QREFELT $ 14)) |derivation|)
                   (|spadConstant| $ 27) (QREFELT $ 30))
         (CONS
          (SPADCALL |i1|
                    (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19)) NIL
                              (LIST
                               (CONS
                                (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 19))
                                          (QVELT |rec| 1) (QREFELT $ 107))
                                (QREFELT $ 10)))
                              (QREFELT $ 75))
                    (QREFELT $ 152))
          (|spadConstant| $ 28)))
        (#2='T
         (SEQ
          (LETT |logs|
                (COND ((SPADCALL |c| (QREFELT $ 110)) NIL)
                      (#2#
                       (LIST
                        (VECTOR (|spadConstant| $ 66)
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 83) 1
                                           (QREFELT $ 160))
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |c| (SPADCALL 2 (QREFELT $ 161))
                                              (QREFELT $ 87))
                                    (QREFELT $ 14))
                                   (QREFELT $ 19))
                                  (QREFELT $ 162))
                                 (QREFELT $ 163))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 33)
                                            (SPADCALL |t| 2 (QREFELT $ 165))
                                            (QREFELT $ 38))
                                  (QREFELT $ 19))
                                 (QREFELT $ 162))))))
                . #1#)
          (LETT |c0| (SPADCALL (QCDR |r|) 0 (QREFELT $ 103)) . #1#)
          (LETT |u|
                (|INTTR;tanintegratespecial| (QVELT |rec| 1)
                 (CONS #'|INTTR;tanintegrate;FMMR;22!0|
                       (VECTOR $ |derivation|))
                 FRDE $)
                . #1#)
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (CONS
              (SPADCALL |i1|
                        (SPADCALL
                         (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19))
                                   (QCAR (QCDR |u|)) (QREFELT $ 107))
                         |logs| (LIST (CONS (QCDR (QCDR |u|)) (QREFELT $ 10)))
                         (QREFELT $ 75))
                        (QREFELT $ 152))
              |c0|))
            (#2#
             (CONS
              (SPADCALL |i1|
                        (SPADCALL
                         (SPADCALL (SPADCALL (QCAR |r|) (QREFELT $ 19))
                                   (QCAR (QCDR |u|)) (QREFELT $ 107))
                         |logs| NIL (QREFELT $ 75))
                        (QREFELT $ 152))
              (SPADCALL (QCDR (QCDR |u|)) |c0| (QREFELT $ 149)))))))))))))) 

(DEFUN |INTTR;tanintegrate;FMMR;22!0| (|x1| $$)
  (PROG (|derivation| $)
    (LETT |derivation| (QREFELT $$ 1) . #1=(|INTTR;tanintegrate;FMMR;22|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |derivation| (QREFELT $ 12)))))) 

(DEFUN |INTTR;primextendedint;FMMFU;23| (|f| |derivation| |extendedint| |g| $)
  (PROG (|u2| |u3| |u1| |gqr| |fqr|)
    (RETURN
     (SEQ
      (LETT |fqr|
            (SPADCALL (SPADCALL |f| (QREFELT $ 46))
                      (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 133))
            . #1=(|INTTR;primextendedint;FMMFU;23|))
      (LETT |gqr|
            (SPADCALL (SPADCALL |g| (QREFELT $ 46))
                      (SPADCALL |g| (QREFELT $ 49)) (QREFELT $ 133))
            . #1#)
      (LETT |u1|
            (SPADCALL
             (SPADCALL (QCDR |fqr|) (SPADCALL |f| (QREFELT $ 49))
                       (QREFELT $ 106))
             |derivation|
             (SPADCALL (QCDR |gqr|) (SPADCALL |g| (QREFELT $ 49))
                       (QREFELT $ 106))
             (QREFELT $ 171))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 2 "failed"))
             ((SPADCALL (QCDR |gqr|) (QREFELT $ 47))
              (SEQ
               (LETT |u3|
                     (|INTTR;primintegratepoly| (QCAR |fqr|) |extendedint|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|)
                       (QREFELT $ 109))
                      $)
                     . #1#)
               (EXIT
                (COND
                 ((QEQCAR |u3| 1)
                  (COND
                   ((SPADCALL (SPADCALL (QCAR |gqr|) (QREFELT $ 35)) 0
                              (QREFELT $ 148))
                    (|error| "Sorry - cannot handle that integrand yet"))
                   (#2='T (CONS 2 "failed"))))
                 (#2#
                  (CONS 0
                        (CONS
                         (SPADCALL (QCAR (QCDR |u1|))
                                   (SPADCALL (QCAR (QCDR |u3|)) (QREFELT $ 19))
                                   (QREFELT $ 107))
                         (QCDR (QCDR |u3|)))))))))
             (#2#
              (SEQ
               (LETT |u2|
                     (SPADCALL
                      (SPADCALL (QCAR |fqr|)
                                (SPADCALL
                                 (SPADCALL (QCDR (QCDR |u1|)) (QREFELT $ 108))
                                 (QCAR |gqr|) (QREFELT $ 37))
                                (QREFELT $ 88))
                      |extendedint|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32) 1 (QREFELT $ 36))
                        |derivation|)
                       (QREFELT $ 109))
                      (QREFELT $ 127))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 2 "failed"))
                      (#2#
                       (CONS 1
                             (CONS
                              (SPADCALL (SPADCALL (QCDR |u2|) (QREFELT $ 19))
                                        (QCAR (QCDR |u1|)) (QREFELT $ 107))
                              (QCDR (QCDR |u1|))))))))))))))) 

(DEFUN |INTTR;expextendedint;FMMFU;24| (|f| |derivation| FRDE |g| $)
  (PROG (|u2| |u3| |u1| |qg| |qf|)
    (RETURN
     (SEQ
      (LETT |qf| (SPADCALL |f| (QREFELT $ 143))
            . #1=(|INTTR;expextendedint;FMMFU;24|))
      (LETT |qg| (SPADCALL |g| (QREFELT $ 143)) . #1#)
      (LETT |u1| (|INTTR;expextintfrac| (QCDR |qf|) |derivation| (QCDR |qg|) $)
            . #1#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 2 "failed"))
             ((SPADCALL (QCDR |qg|) (QREFELT $ 40))
              (SEQ
               (LETT |u3| (|INTTR;expintegratepoly| (QCAR |qf|) FRDE $) . #1#)
               (EXIT
                (COND
                 ((QEQCAR |u3| 1)
                  (COND
                   ((QEQCAR (SPADCALL (QCAR |qg|) (QREFELT $ 176)) 1)
                    (|error| "Sorry - cannot handle that integrand yet"))
                   (#2='T (CONS 2 "failed"))))
                 (#2#
                  (CONS 0
                        (CONS
                         (SPADCALL (QCAR (QCDR |u1|))
                                   (SPADCALL (QCAR (QCDR |u3|))
                                             (QREFELT $ 146))
                                   (QREFELT $ 107))
                         (QCDR (QCDR |u3|)))))))))
             (#2#
              (SEQ
               (LETT |u2|
                     (SPADCALL
                      (SPADCALL (QCAR |qf|)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QCDR (QCDR |u1|)) (QREFELT $ 108))
                                  (QREFELT $ 156))
                                 (QCAR |qg|) (QREFELT $ 177))
                                (QREFELT $ 145))
                      FRDE (QREFELT $ 131))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 2 "failed"))
                      (#2#
                       (CONS 1
                             (CONS
                              (SPADCALL (SPADCALL (QCDR |u2|) (QREFELT $ 146))
                                        (QCAR (QCDR |u1|)) (QREFELT $ 107))
                              (QCDR (QCDR |u1|))))))))))))))) 

(DEFUN |INTTR;primintegratepoly| (|p| |extendedint| |t'| $)
  (PROG (|ans1| |rp| |ans| #1=#:G567 #2=#:G573 |d|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |p| (QREFELT $ 47))
         (CONS 0 (CONS (|spadConstant| $ 27) (|spadConstant| $ 28))))
        (#3='T
         (SEQ
          (LETT |ans| (|spadConstant| $ 27) . #4=(|INTTR;primintegratepoly|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |d| (SPADCALL |p| (QREFELT $ 35)) . #4#) 0
                            (QREFELT $ 148)))
                 (GO G191)))
               (SEQ
                (LETT |ans1|
                      (SPADCALL (SPADCALL |p| (QREFELT $ 31)) |extendedint|)
                      . #4#)
                (EXIT
                 (COND
                  ((QEQCAR |ans1| 1)
                   (PROGN (LETT #2# (CONS 1 (CONS |ans| |p|)) . #4#) (GO #2#)))
                  ('T
                   (SEQ
                    (LETT |p|
                          (SPADCALL (SPADCALL |p| (QREFELT $ 39))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |d| |t'| (QREFELT $ 179))
                                      (QCAR (QCDR |ans1|)) (QREFELT $ 150))
                                     (PROG1 (LETT #1# (- |d| 1) . #4#)
                                       (|check_subtype| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        #1#))
                                     (QREFELT $ 36))
                                    (QREFELT $ 88))
                          . #4#)
                    (EXIT
                     (LETT |ans|
                           (SPADCALL
                            (SPADCALL |ans|
                                      (SPADCALL (QCAR (QCDR |ans1|)) |d|
                                                (QREFELT $ 36))
                                      (QREFELT $ 38))
                            (SPADCALL
                             (SPADCALL (QCDR (QCDR |ans1|))
                                       (SPADCALL (+ |d| 1) (QREFELT $ 161))
                                       (QREFELT $ 87))
                             (+ |d| 1) (QREFELT $ 36))
                            (QREFELT $ 38))
                           . #4#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |ans1|
                (SPADCALL (LETT |rp| (SPADCALL |p| (QREFELT $ 109)) . #4#)
                          |extendedint|)
                . #4#)
          (EXIT
           (COND ((QEQCAR |ans1| 1) (CONS 0 (CONS |ans| |rp|)))
                 (#3#
                  (CONS 0
                        (CONS
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |ans1|)) 1 (QREFELT $ 36))
                           (SPADCALL (QCAR (QCDR |ans1|)) (QREFELT $ 14))
                           (QREFELT $ 38))
                          |ans| (QREFELT $ 38))
                         (|spadConstant| $ 28))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTTR;primextintfrac;FMFU;26| (|f| |derivation| |g| $)
  (PROG (|c| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (QREFELT $ 40))
        (CONS 0 (CONS (|spadConstant| $ 9) (|spadConstant| $ 9))))
       ((>= (SPADCALL (SPADCALL |f| (QREFELT $ 46)) (QREFELT $ 35))
            (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 35)))
        (|error| "Not a proper fraction"))
       (#1='T
        (SEQ
         (LETT |r| (SPADCALL |f| |derivation| (QREFELT $ 45))
               . #2=(|INTTR;primextintfrac;FMFU;26|))
         (EXIT
          (COND
           ((SPADCALL |g| (QREFELT $ 40))
            (COND
             ((SPADCALL (QVELT |r| 1) (|spadConstant| $ 9) (QREFELT $ 112))
              (CONS 1 "failed"))
             (#1# (CONS 0 (CONS (QVELT |r| 0) (|spadConstant| $ 9))))))
           ((>= (SPADCALL (SPADCALL |g| (QREFELT $ 46)) (QREFELT $ 35))
                (SPADCALL (SPADCALL |g| (QREFELT $ 49)) (QREFELT $ 35)))
            (|error| "Not a proper fraction"))
           ((SPADCALL
             (SPADCALL
              (LETT |c| (SPADCALL (QVELT |r| 1) |g| (QREFELT $ 13)) . #2#)
              |derivation| (QREFELT $ 12))
             (|spadConstant| $ 9) (QREFELT $ 112))
            (CONS 1 "failed"))
           (#1# (CONS 0 (CONS (QVELT |r| 0) |c|)))))))))))) 

(DEFUN |TranscendentalIntegration| (&REST #1=#:G588)
  (PROG ()
    (RETURN
     (PROG (#2=#:G589)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|TranscendentalIntegration|)
                                           '|domainEqualList|)
                . #3=(|TranscendentalIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |TranscendentalIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|TranscendentalIntegration|))))))))))) 

(DEFUN |TranscendentalIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|TranscendentalIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|TranscendentalIntegration| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 180) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|TranscendentalIntegration|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (|spadConstant| $ 9))
      $)))) 

(MAKEPROP '|TranscendentalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Fraction| 7) (0 . |Zero|) '|dummy| (|Mapping| 7 7)
              (4 . |differentiate|) (10 . /) (16 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 15) (21 . |map|)
              (27 . |coerce|) (|SparseUnivariatePolynomial| 8) (|Mapping| 8 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 8 20) (32 . |map|)
              (|Mapping| 8 7) (|SparseUnivariatePolynomialFunctions2| 7 8)
              (38 . |map|) (44 . |Zero|) (48 . |Zero|) (|Boolean|) (52 . ~=)
              (58 . |leadingCoefficient|) (63 . |One|) (67 . |One|)
              (|NonNegativeInteger|) (71 . |degree|) (76 . |monomial|) (82 . *)
              (88 . +) (94 . |reductum|) (99 . |zero?|) (|IntegrationResult| 8)
              (104 . |Zero|)
              (|Record| (|:| |answer| 8) (|:| |logpart| 8) (|:| |specpart| 8)
                        (|:| |polypart| 7))
              (|TranscendentalHermiteIntegration| 6 7)
              (108 . |HermiteIntegrate|) (114 . |numer|) (119 . |zero?|)
              (124 . |coerce|) (129 . |denom|) (134 . |coerce|) (139 . *)
              (145 . -) (|PrimitiveArray| 15) (|SubResultantPackage| 7 15)
              (151 . |subresultantVector|) (157 . |leadingCoefficient|)
              (162 . |primitivePart|)
              (|Record| (|:| |normal| 63) (|:| |special| 63))
              (|MonomialExtensionTools| 6 7) (167 . |splitSquarefree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 84)) (|List| 61)
              (|Factored| 7) (173 . |factors|) (|Fraction| 84) (178 . |One|)
              (182 . |primitivePart|)
              (|CommuteUnivariatePolynomialCategory| 6 7 15) (188 . |swap|)
              (193 . =)
              (|Record| (|:| |scalar| 65) (|:| |coeff| 20) (|:| |logand| 20))
              (|List| 71) (|Record| (|:| |integrand| 8) (|:| |intvar| 8))
              (|List| 73) (199 . |mkAnswer|) (|Mapping| 8 8)
              (206 . |differentiate|) (212 . -) (|Union| 7 '"failed")
              (218 . |retractIfCan|)
              (|Record| (|:| |ir| 41) (|:| |specpart| 8) (|:| |polypart| 7))
              |INTTR;monomialIntegrate;FMR;6| (223 . |One|) (|Integer|)
              (227 . >) (233 . *) (239 . /) (245 . -)
              (|Record| (|:| |answer| 7) (|:| |polypart| 7))
              |INTTR;monomialIntPoly;UPMR;7| (|LaurentPolynomial| 6 7)
              (251 . |Zero|) (255 . ~=) (261 . |degree|)
              (266 . |leadingCoefficient|) (271 . |monomial|) (277 . +)
              (283 . -) (289 . |reductum|) (294 . |zero?|) (299 . ~=)
              (305 . |rem|) (311 . |coefficient|) (|List| 6) (317 . |second|)
              (322 . /) (328 . +) (334 . |retract|) (339 . |retract|)
              (344 . |zero?|) (349 . |order|) (355 . ~=) (361 . *)
              (367 . |max|) (|Mapping| 34 34 34) (|List| 34) (373 . |reduce|)
              (|Matrix| 6) (380 . |zero|) (386 . |maxColIndex|)
              (391 . |rowEchelon|) (396 . |maxRowIndex|) (401 . ~=)
              (|Record| (|:| |ratpart| 6) (|:| |coeff| 6))
              (|Union| 124 '"failed") (|Mapping| 125 6)
              |INTTR;primintfldpoly;UPMFU;12| (|Union| 91 '"failed")
              (|Record| (|:| |ans| 6) (|:| |right| 6) (|:| |sol?| 29))
              (|Mapping| 129 84 6) |INTTR;expintfldpoly;LpMU;13|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (407 . |divide|) (|Record| (|:| |coeff| 8) (|:| |logand| 8))
              (|Record| (|:| |mainpart| 8) (|:| |limitedlogs| (|List| 134)))
              (|Union| 135 '"failed") (|List| 8) |INTTR;primlimintfrac;FMLU;16|
              (|Record| (|:| |answer| 135) (|:| |a0| 6))
              (|Union| 139 '"failed") |INTTR;primlimitedint;FMMLU;14|
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 8))
              (413 . |separate|) (418 . |coerce|) (423 . -) (429 . |convert|)
              |INTTR;explimitedint;FMMLU;15| (434 . >) (440 . +) (446 . *)
              (452 . |integral|) (458 . +) (464 . |elem?|)
              (|Record| (|:| |answer| 41) (|:| |a0| 6))
              |INTTR;primintegrate;FMMR;20| (469 . |coerce|)
              (|Union| $ '"failed") (474 . |exquo|)
              |INTTR;expintegrate;FMMR;21| (480 . |monomial|) (486 . |coerce|)
              (491 . |coerce|) (496 . -) (|PositiveInteger|) (502 . ^)
              (|Union| 104 '"failed") (|Mapping| 166 84 6 6)
              |INTTR;tanintegrate;FMMR;22|
              (|Record| (|:| |ratpart| 8) (|:| |coeff| 8))
              (|Union| 169 '"failed") |INTTR;primextintfrac;FMFU;26|
              (|Record| (|:| |answer| 8) (|:| |a0| 6))
              (|Union| 172 169 '"failed") |INTTR;primextendedint;FMMFU;23|
              (|Union| 6 '"failed") (508 . |retractIfCan|) (513 . *)
              |INTTR;expextendedint;FMMFU;24| (519 . *))
           '#(|tanintegrate| 525 |primlimitedint| 532 |primlimintfrac| 540
              |primintfldpoly| 547 |primintegrate| 554 |primextintfrac| 561
              |primextendedint| 568 |monomialIntegrate| 576 |monomialIntPoly|
              582 |explimitedint| 588 |expintfldpoly| 596 |expintegrate| 602
              |expextendedint| 609)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 179
                                                 '(0 8 0 9 2 8 0 0 11 12 2 8 0
                                                   0 0 13 1 7 0 6 14 2 17 15 16
                                                   7 18 1 8 0 7 19 2 22 20 21 7
                                                   23 2 25 20 24 15 26 0 7 0 27
                                                   0 6 0 28 2 7 29 0 0 30 1 7 6
                                                   0 31 0 6 0 32 0 7 0 33 1 7
                                                   34 0 35 2 7 0 6 34 36 2 7 0
                                                   0 0 37 2 7 0 0 0 38 1 7 0 0
                                                   39 1 8 29 0 40 0 41 0 42 2
                                                   44 43 8 11 45 1 8 7 0 46 1 7
                                                   29 0 47 1 41 0 8 48 1 8 7 0
                                                   49 1 15 0 7 50 2 15 0 0 0 51
                                                   2 15 0 0 0 52 2 54 53 15 15
                                                   55 1 15 7 0 56 1 7 0 0 57 2
                                                   59 58 7 11 60 1 63 62 0 64 0
                                                   65 0 66 2 54 15 15 7 67 1 68
                                                   15 15 69 2 7 29 0 0 70 3 41
                                                   0 8 72 74 75 2 41 8 0 76 77
                                                   2 8 0 0 0 78 1 8 79 0 80 0 8
                                                   0 83 2 84 29 0 0 85 2 6 0 84
                                                   0 86 2 6 0 0 0 87 2 7 0 0 0
                                                   88 0 91 0 92 2 91 29 0 0 93
                                                   1 91 84 0 94 1 91 6 0 95 2
                                                   91 0 6 84 96 2 91 0 0 0 97 2
                                                   6 0 0 0 98 1 91 0 0 99 1 91
                                                   29 0 100 2 34 29 0 0 101 2 7
                                                   0 0 0 102 2 7 6 0 34 103 1
                                                   104 6 0 105 2 8 0 7 7 106 2
                                                   8 0 0 0 107 1 8 7 0 108 1 7
                                                   6 0 109 1 6 29 0 110 2 7 34
                                                   0 0 111 2 8 29 0 0 112 2 8 0
                                                   7 0 113 2 34 0 0 0 114 3 116
                                                   34 115 0 34 117 2 118 0 34
                                                   34 119 1 118 84 0 120 1 118
                                                   0 0 121 1 118 84 0 122 2 6
                                                   29 0 0 123 2 7 132 0 0 133 1
                                                   91 142 8 143 1 91 0 6 144 2
                                                   91 0 0 0 145 1 91 8 0 146 2
                                                   34 29 0 0 148 2 6 0 0 0 149
                                                   2 6 0 0 0 150 2 41 0 8 8 151
                                                   2 41 0 0 0 152 1 41 29 0 153
                                                   1 91 0 7 156 2 91 157 0 0
                                                   158 2 20 0 8 34 160 1 6 0 84
                                                   161 1 20 0 8 162 2 20 0 0 0
                                                   163 2 7 0 0 164 165 1 91 175
                                                   0 176 2 91 0 0 0 177 2 6 0
                                                   34 0 179 3 0 154 8 11 167
                                                   168 4 0 140 8 11 126 137 141
                                                   3 0 136 8 11 137 138 3 0 79
                                                   7 126 6 127 3 0 154 8 11 126
                                                   155 3 0 170 8 11 8 171 4 0
                                                   173 8 11 126 8 174 2 0 81 8
                                                   11 82 2 0 89 7 11 90 4 0 140
                                                   8 11 130 137 147 2 0 128 91
                                                   130 131 3 0 154 8 11 130 159
                                                   4 0 173 8 11 130 8 178)))))
           '|lookupComplete|)) 
