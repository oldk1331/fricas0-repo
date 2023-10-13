
(/VERSIONCHECK 2) 

(DEFUN |IR;-;2$;1| (|u| $) (SPADCALL -1 |u| (QREFELT $ 14))) 

(DEFUN |IR;Zero;$;2| ($)
  (SPADCALL (|spadConstant| $ 17) NIL NIL (QREFELT $ 22))) 

(DEFUN |IR;coerce;F$;3| (|x| $) (SPADCALL |x| NIL NIL (QREFELT $ 22))) 

(PUT '|IR;ratpart;$F;4| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 0))) 

(DEFUN |IR;ratpart;$F;4| (|u| $) (QVELT |u| 0)) 

(PUT '|IR;logpart;$L;5| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 1))) 

(DEFUN |IR;logpart;$L;5| (|u| $) (QVELT |u| 1)) 

(PUT '|IR;notelem;$L;6| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 2))) 

(DEFUN |IR;notelem;$L;6| (|u| $) (QVELT |u| 2)) 

(DEFUN |IR;elem?;$B;7| (|u| $) (NULL (SPADCALL |u| (QREFELT $ 26)))) 

(DEFUN |IR;mkAnswer;FLL$;8| (|x| |l| |n| $)
  (VECTOR |x| |l| (|IR;nesimp| |n| $))) 

(DEFUN |IR;timelog| (|r| |lg| $)
  (VECTOR (SPADCALL |r| (QVELT |lg| 0) (QREFELT $ 30)) (QVELT |lg| 1)
          (QVELT |lg| 2))) 

(DEFUN |IR;integral;2F$;10| (|f| |x| $)
  (COND ((SPADCALL |f| (QREFELT $ 31)) (|spadConstant| $ 16))
        ('T
         (SPADCALL (|spadConstant| $ 17) NIL (LIST (CONS |f| |x|))
                   (QREFELT $ 22))))) 

(DEFUN |IR;timene| (|r| |ne| $)
  (CONS (SPADCALL (|IR;Q2F| |r| $) (QCAR |ne|) (QREFELT $ 33)) (QCDR |ne|))) 

(DEFUN |IR;*;I2$;12| (|n| |u| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 34)) |u| (QREFELT $ 35))) 

(DEFUN |IR;Q2F| (|r| $)
  (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 36)) (QREFELT $ 37))
            (SPADCALL (SPADCALL |r| (QREFELT $ 38)) (QREFELT $ 37))
            (QREFELT $ 39))) 

(DEFUN |IR;neselect| (|l| |x| $)
  (PROG (#1=#:G169 #2=#:G168 #3=#:G170 #4=#:G172 |ne|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|IR;neselect|))
       (SEQ (LETT |ne| NIL . #5#) (LETT #4# |l| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |ne| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (QCDR |ne|) |x| (QREFELT $ 40))
                (PROGN
                 (LETT #3# (QCAR |ne|) . #5#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 41)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 17)))))))) 

(DEFUN |IR;integral;FS$;15| (|f| |x| $)
  (SPADCALL |f| (SPADCALL |x| (QREFELT $ 42)) (QREFELT $ 32))) 

(DEFUN |IR;LOG2O| (|rec| $)
  (PROG (|logandp| |cc| |coeffp| |lg| |lastc|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL (QVELT |rec| 1) (QREFELT $ 46)) 1)
        (SEQ
         (LETT |lastc|
               (SPADCALL
                (SPADCALL (SPADCALL (QVELT |rec| 1) 0 (QREFELT $ 48))
                          (SPADCALL (QVELT |rec| 1) 1 (QREFELT $ 48))
                          (QREFELT $ 39))
                (QREFELT $ 49))
               . #1=(|IR;LOG2O|))
         (LETT |lg| (SPADCALL (QVELT |rec| 2) |lastc| (QREFELT $ 50)) . #1#)
         (LETT |logandp|
               (SPADCALL (SPADCALL '|log| (QREFELT $ 11))
                         (LIST (SPADCALL |lg| (QREFELT $ 51))) (QREFELT $ 53))
               . #1#)
         (LETT |cc|
               (SPADCALL (|IR;Q2F| (QVELT |rec| 0) $) |lastc| (QREFELT $ 33))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL |cc| (|spadConstant| $ 47) (QREFELT $ 40)) |logandp|)
           ((SPADCALL |cc| (SPADCALL (|spadConstant| $ 47) (QREFELT $ 49))
                      (QREFELT $ 40))
            (SPADCALL |logandp| (QREFELT $ 55)))
           (#2='T
            (SPADCALL (SPADCALL |cc| (QREFELT $ 51)) |logandp|
                      (QREFELT $ 56)))))))
       (#2#
        (SEQ
         (LETT |coeffp|
               (SPADCALL
                (SPADCALL (QVELT |rec| 1) (QREFELT $ 12) (QREFELT $ 57))
                (SPADCALL 0 (QREFELT $ 58)) (QREFELT $ 59))
               . #1#)
         (LETT |logandp|
               (SPADCALL (QREFELT $ 12)
                         (SPADCALL (SPADCALL '|log| (QREFELT $ 11))
                                   (LIST
                                    (SPADCALL (QVELT |rec| 2) (QREFELT $ 12)
                                              (QREFELT $ 57)))
                                   (QREFELT $ 53))
                         (QREFELT $ 56))
               . #1#)
         (COND
          ((SPADCALL (LETT |cc| (|IR;Q2F| (QVELT |rec| 0) $) . #1#)
                     (|spadConstant| $ 47) (QREFELT $ 60))
           (LETT |logandp|
                 (SPADCALL (SPADCALL |cc| (QREFELT $ 51)) |logandp|
                           (QREFELT $ 56))
                 . #1#)))
         (EXIT (SPADCALL |logandp| |coeffp| (QREFELT $ 61)))))))))) 

(DEFUN |IR;nesimp| (|l| $)
  (PROG (|u| #1=#:G189 #2=#:G191 |ne| #3=#:G190 |x| #4=#:G188)
    (RETURN
     (SEQ
      (PROGN
       (LETT #4# NIL . #5=(|IR;nesimp|))
       (SEQ (LETT |x| NIL . #5#)
            (LETT #1#
                  (SPADCALL
                   (PROGN
                    (LETT #3# NIL . #5#)
                    (SEQ (LETT |ne| NIL . #5#) (LETT #2# |l| . #5#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |ne| (CAR #2#) . #5#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #3# (CONS (QCDR |ne|) #3#) . #5#)))
                         (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT $ 63))
                  . #5#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |u| (|IR;neselect| |l| |x| $) . #5#)
                          (|spadConstant| $ 17) (QREFELT $ 60))
                (LETT #4# (CONS (CONS |u| |x|) #4#) . #5#)))))
            (LETT #1# (CDR #1#) . #5#) (GO G190) G191
            (EXIT (NREVERSE #4#)))))))) 

(DEFUN |IR;retractIfCan;$U;18| (|u| $)
  (PROG (#1=#:G198 #2=#:G197 #3=#:G199 #4=#:G205 |ne|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |u| (QREFELT $ 25)))
        (CONS 0
              (SPADCALL (SPADCALL |u| (QREFELT $ 24))
                        (PROGN
                         (LETT #1# NIL . #5=(|IR;retractIfCan;$U;18|))
                         (SEQ (LETT |ne| NIL . #5#)
                              (LETT #4# (SPADCALL |u| (QREFELT $ 26)) . #5#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |ne| (CAR #4#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #3#
                                       (SPADCALL (QCAR |ne|)
                                                 (SPADCALL (QCDR |ne|)
                                                           (QREFELT $ 64))
                                                 (QREFELT $ 65))
                                       . #5#)
                                 (COND
                                  (#1#
                                   (LETT #2# (SPADCALL #2# #3# (QREFELT $ 41))
                                         . #5#))
                                  ('T
                                   (PROGN
                                    (LETT #2# #3# . #5#)
                                    (LETT #1# 'T . #5#)))))))
                              (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#1# #2#) (#6='T (|spadConstant| $ 17))))
                        (QREFELT $ 41))))
       (#6# (CONS 1 "failed"))))))) 

(DEFUN |IR;retractIfCan;$U;19| (|u| $)
  (SEQ
   (COND
    ((SPADCALL |u| (QREFELT $ 28))
     (COND
      ((NULL (SPADCALL |u| (QREFELT $ 25)))
       (EXIT (CONS 0 (SPADCALL |u| (QREFELT $ 24))))))))
   (EXIT (CONS 1 "failed")))) 

(DEFUN |IR;retractIfCan;$U;20| (|u| $)
  (SEQ
   (COND
    ((SPADCALL |u| (QREFELT $ 28))
     (COND
      ((NULL (SPADCALL |u| (QREFELT $ 25)))
       (EXIT (CONS 0 (SPADCALL |u| (QREFELT $ 24))))))))
   (EXIT (CONS 1 "failed")))) 

(DEFUN |IR;*;F2$;21| (|r| |u| $)
  (PROG ()
    (RETURN
     (COND
      ((SPADCALL |r| (|spadConstant| $ 68) (QREFELT $ 69))
       (|spadConstant| $ 16))
      ('T
       (SPADCALL
        (SPADCALL (|IR;Q2F| |r| $) (SPADCALL |u| (QREFELT $ 24))
                  (QREFELT $ 33))
        (SPADCALL (CONS #'|IR;*;F2$;21!0| (VECTOR $ |r|))
                  (SPADCALL |u| (QREFELT $ 25)) (QREFELT $ 71))
        (SPADCALL (CONS #'|IR;*;F2$;21!1| (VECTOR $ |r|))
                  (SPADCALL |u| (QREFELT $ 26)) (QREFELT $ 73))
        (QREFELT $ 22))))))) 

(DEFUN |IR;*;F2$;21!1| (|x1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|IR;*;F2$;21|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|IR;timene| |r| |x1| $))))) 

(DEFUN |IR;*;F2$;21!0| (|x1| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|IR;*;F2$;21|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|IR;timelog| |r| |x1| $))))) 

(DEFUN |IR;+;3$;22| (|u| |v| $)
  (SPADCALL
   (SPADCALL (SPADCALL |u| (QREFELT $ 24)) (SPADCALL |v| (QREFELT $ 24))
             (QREFELT $ 41))
   (SPADCALL (SPADCALL |u| (QREFELT $ 25)) (SPADCALL |v| (QREFELT $ 25))
             (QREFELT $ 74))
   (|IR;nesimp|
    (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (SPADCALL |v| (QREFELT $ 26))
              (QREFELT $ 75))
    $)
   (QREFELT $ 22))) 

(DEFUN |IR;differentiate;$SF;23| (|u| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL |u| (CONS #'|IR;differentiate;$SF;23!0| (VECTOR $ |x|))
               (QREFELT $ 79))))) 

(DEFUN |IR;differentiate;$SF;23!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|IR;differentiate;$SF;23|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 77)))))) 

(DEFUN |IR;differentiate;$MF;24| (|u| |derivation| $)
  (PROG (#1=#:G239 #2=#:G238 #3=#:G240 #4=#:G244 |ne| #5=#:G234 #6=#:G233
         #7=#:G235 #8=#:G243 |log|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 24)) |derivation|)
                 (PROGN
                  (LETT #5# NIL . #9=(|IR;differentiate;$MF;24|))
                  (SEQ (LETT |log| NIL . #9#)
                       (LETT #8# (SPADCALL |u| (QREFELT $ 25)) . #9#) G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |log| (CAR #8#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #7# (|IR;pLogDeriv| |log| |derivation| $)
                                . #9#)
                          (COND
                           (#5#
                            (LETT #6# (SPADCALL #6# #7# (QREFELT $ 41)) . #9#))
                           ('T
                            (PROGN
                             (LETT #6# #7# . #9#)
                             (LETT #5# 'T . #9#)))))))
                       (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                  (COND (#5# #6#) (#10='T (|spadConstant| $ 17))))
                 (QREFELT $ 41))
       (PROGN
        (LETT #1# NIL . #9#)
        (SEQ (LETT |ne| NIL . #9#)
             (LETT #4# (SPADCALL |u| (QREFELT $ 26)) . #9#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |ne| (CAR #4#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (|IR;pNeDeriv| |ne| |derivation| $) . #9#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 41)) . #9#))
                      ('T (PROGN (LETT #2# #3# . #9#) (LETT #1# 'T . #9#)))))))
             (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) (#10# (|spadConstant| $ 17))))
       (QREFELT $ 41)))))) 

(DEFUN |IR;pNeDeriv| (|ne| |derivation| $)
  (COND
   ((SPADCALL (SPADCALL (QCDR |ne|) |derivation|) (|spadConstant| $ 47)
              (QREFELT $ 40))
    (QCAR |ne|))
   ((SPADCALL (SPADCALL (QCAR |ne|) |derivation|) (QREFELT $ 31))
    (|spadConstant| $ 17))
   ('T (|error| "pNeDeriv: cannot differentiate not elementary part into F")))) 

(DEFUN |IR;pLogDeriv| (|log| |derivation| $)
  (PROG (|ans| |algans| #1=#:G266 |i| |diflog| #2=#:G258 |numlog| |c| |n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |derivation| (QVELT |log| 1) (QREFELT $ 81))
                  (|spadConstant| $ 82) (QREFELT $ 83))
        (|error| "pLogDeriv: can only handle logs with constant coefficients"))
       (#3='T
        (SEQ
         (LETT |n| (SPADCALL (QVELT |log| 1) (QREFELT $ 46))
               . #4=(|IR;pLogDeriv|))
         (EXIT
          (COND
           ((EQL |n| 1)
            (SEQ
             (LETT |c|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL (QVELT |log| 1) (QREFELT $ 84))
                               (QREFELT $ 85))
                     (SPADCALL (QVELT |log| 1) (QREFELT $ 85)) (QREFELT $ 39))
                    (QREFELT $ 49))
                   . #4#)
             (LETT |ans| (SPADCALL (QVELT |log| 2) |c| (QREFELT $ 50)) . #4#)
             (EXIT
              (SPADCALL
               (SPADCALL
                (SPADCALL (|IR;Q2F| (QVELT |log| 0) $) |c| (QREFELT $ 33))
                (SPADCALL |ans| |derivation|) (QREFELT $ 33))
               |ans| (QREFELT $ 39)))))
           (#3#
            (SEQ
             (LETT |numlog|
                   (SPADCALL |derivation| (QVELT |log| 2) (QREFELT $ 81))
                   . #4#)
             (LETT |diflog|
                   (PROG2
                       (LETT #2#
                             (SPADCALL (QVELT |log| 2) (QVELT |log| 1) |numlog|
                                       (QREFELT $ 88))
                             . #4#)
                       (QCDR #2#)
                     (|check_union| (QEQCAR #2# 0)
                                    (|Record|
                                     (|:| |coef1|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 6)))
                                     (|:| |coef2|
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 6))))
                                    #2#))
                   . #4#)
             (LETT |algans| (QCAR |diflog|) . #4#)
             (LETT |ans| (|spadConstant| $ 17) . #4#)
             (SEQ (LETT |i| 0 . #4#) (LETT #1# (- |n| 1) . #4#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (LETT |algans|
                         (SPADCALL
                          (SPADCALL |algans|
                                    (SPADCALL (|spadConstant| $ 47) 1
                                              (QREFELT $ 89))
                                    (QREFELT $ 90))
                          (QVELT |log| 1) (QREFELT $ 91))
                         . #4#)
                   (EXIT
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (SPADCALL |algans| |i| (QREFELT $ 48))
                                    (QREFELT $ 41))
                          . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SPADCALL (|IR;Q2F| (QVELT |log| 0) $) |ans|
                        (QREFELT $ 33)))))))))))))) 

(DEFUN |IR;coerce;$Of;27| (|u| $)
  (PROG (|l| #1=#:G287 |f| #2=#:G286 #3=#:G285 #4=#:G284 |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |u| (QREFELT $ 67)) . #5=(|IR;coerce;$Of;27|))
          (EXIT
           (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 51)))
                 (#6='T
                  (SEQ
                   (LETT |l|
                         (NREVERSE
                          (PROGN
                           (LETT #4# NIL . #5#)
                           (SEQ (LETT |f| NIL . #5#)
                                (LETT #3# (SPADCALL |u| (QREFELT $ 25)) . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4# (CONS (|IR;LOG2O| |f| $) #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#)))))
                         . #5#)
                   (COND
                    ((SPADCALL (SPADCALL |u| (QREFELT $ 24))
                               (|spadConstant| $ 17) (QREFELT $ 60))
                     (LETT |l|
                           (CONS
                            (SPADCALL (SPADCALL |u| (QREFELT $ 24))
                                      (QREFELT $ 51))
                            |l|)
                           . #5#)))
                   (COND
                    ((NULL (SPADCALL |u| (QREFELT $ 28)))
                     (LETT |l|
                           (SPADCALL
                            (PROGN
                             (LETT #2# NIL . #5#)
                             (SEQ (LETT |f| NIL . #5#)
                                  (LETT #1# (SPADCALL |u| (QREFELT $ 26))
                                        . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |f| (CAR #1#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2# (CONS (|IR;NE2O| |f| $) #2#)
                                          . #5#)))
                                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            |l| (QREFELT $ 93))
                           . #5#)))
                   (EXIT
                    (COND
                     ((NULL |l|)
                      (SPADCALL (|spadConstant| $ 16) (QREFELT $ 94)))
                     (#6# (SPADCALL (ELT $ 95) |l| (QREFELT $ 97))))))))))))) 

(DEFUN |IR;NE2O| (|ne| $)
  (SPADCALL
   (SPADCALL (SPADCALL (QCAR |ne|) (QREFELT $ 51))
             (SPADCALL
              (LIST (SPADCALL '|d| (QREFELT $ 11))
                    (SPADCALL (QCDR |ne|) (QREFELT $ 51)))
              (QREFELT $ 98))
             (QREFELT $ 56))
   (QREFELT $ 99))) 

(DEFUN |IntegrationResult| (#1=#:G294)
  (PROG ()
    (RETURN
     (PROG (#2=#:G295)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IntegrationResult|)
                                           '|domainEqualList|)
                . #3=(|IntegrationResult|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|IntegrationResult;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IntegrationResult|))))))))))) 

(DEFUN |IntegrationResult;| (|#1|)
  (PROG (|pv$| #1=#:G293 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|IntegrationResult|))
      (LETT |dv$| (LIST '|IntegrationResult| DV$1) . #2#)
      (LETT $ (GETREFV 104) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|))
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|Fraction| (|Integer|))
                                                 '(|AbelianMonoid|))
                                                . #2#)
                                          (OR
                                           (|HasCategory|
                                            (|Fraction| (|Integer|))
                                            '(|AbelianGroup|))
                                           #1#)
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Symbol|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|IntegrationResult| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |ratp| |#1|)
                          (|:| |logp|
                               (|List|
                                (|Record|
                                 (|:| |scalar| (|Fraction| (|Integer|)))
                                 (|:| |coeff|
                                      (|SparseUnivariatePolynomial| |#1|))
                                 (|:| |logand|
                                      (|SparseUnivariatePolynomial| |#1|)))))
                          (|:| |nelem|
                               (|List|
                                (|Record| (|:| |integrand| |#1|)
                                          (|:| |intvar| |#1|))))))
      (QSETREFV $ 12 (SPADCALL (SPADCALL (QREFELT $ 9)) (QREFELT $ 11)))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 43 (CONS (|dispatchFunction| |IR;integral;FS$;15|) $))))
      (COND
       ((|HasCategory| |#1| '(|LiouvillianFunctionCategory|))
        (COND
         ((|testBitVector| |pv$| 5)
          (QSETREFV $ 67
                    (CONS (|dispatchFunction| |IR;retractIfCan;$U;18|) $)))
         ('T
          (QSETREFV $ 67
                    (CONS (|dispatchFunction| |IR;retractIfCan;$U;19|) $)))))
       ('T
        (QSETREFV $ 67 (CONS (|dispatchFunction| |IR;retractIfCan;$U;20|) $))))
      (COND
       ((|testBitVector| |pv$| 4)
        (QSETREFV $ 80
                  (CONS (|dispatchFunction| |IR;differentiate;$SF;23|) $))))
      $)))) 

(MAKEPROP '|IntegrationResult| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Symbol|)
              (0 . |new|) (|OutputForm|) (4 . |coerce|) '|alpha| (|Integer|)
              |IR;*;I2$;12| |IR;-;2$;1|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |IR;Zero;$;2|) $))
              (9 . |Zero|)
              (|Record| (|:| |scalar| 29) (|:| |coeff| 45) (|:| |logand| 45))
              (|List| 18) (|Record| (|:| |integrand| 6) (|:| |intvar| 6))
              (|List| 20) |IR;mkAnswer;FLL$;8| |IR;coerce;F$;3|
              |IR;ratpart;$F;4| |IR;logpart;$L;5| |IR;notelem;$L;6| (|Boolean|)
              |IR;elem?;$B;7| (|Fraction| 13) (13 . *) (19 . |zero?|)
              |IR;integral;2F$;10| (24 . *) (30 . |coerce|) |IR;*;F2$;21|
              (35 . |numer|) (40 . |coerce|) (45 . |denom|) (50 . /) (56 . =)
              (62 . +) (68 . |coerce|) (73 . |integral|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 6) (79 . |degree|) (84 . |One|)
              (88 . |coefficient|) (94 . -) (99 . |elt|) (105 . |coerce|)
              (|List| $) (110 . |prefix|) (116 . |One|) (120 . -) (125 . *)
              (131 . |outputForm|) (137 . |coerce|) (142 . =) (148 . ~=)
              (154 . |sum|) (|List| 6) (160 . |removeDuplicates!|)
              (165 . |retract|) (170 . |integral|) (|Union| 6 '"failed")
              (176 . |retractIfCan|) (181 . |Zero|) (185 . =) (|Mapping| 18 18)
              (191 . |map|) (|Mapping| 20 20) (197 . |map|) (203 . |concat|)
              (209 . |concat|) |IR;+;3$;22| (215 . |differentiate|)
              (|Mapping| 6 6) |IR;differentiate;$MF;24| (221 . |differentiate|)
              (227 . |map|) (233 . |Zero|) (237 . ~=) (243 . |reductum|)
              (248 . |leadingCoefficient|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 86 '"failed")
              (253 . |extendedEuclidean|) (260 . |monomial|) (266 . *)
              (272 . |rem|) (|List| 10) (278 . |concat|) |IR;coerce;$Of;27|
              (284 . +) (|Mapping| 10 10 10) (290 . |reduce|) (296 . |hconcat|)
              (301 . |int|) (|Union| $ '"failed") (|PositiveInteger|)
              (|String|) (|SingleInteger|))
           '#(~= 306 |zero?| 312 |subtractIfCan| 317 |sample| 323
              |retractIfCan| 327 |retract| 332 |ratpart| 337 |notelem| 342
              |mkAnswer| 347 |logpart| 354 |latex| 359 |integral| 364 |hash|
              376 |elem?| 381 |differentiate| 386 |coerce| 398 |Zero| 408 = 412
              - 418 + 429 * 435)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 1 1 3 0 0 0 0 0))
                 (CONS
                  '#(|Module&| NIL NIL NIL |AbelianGroup&| NIL |AbelianMonoid&|
                     |AbelianSemiGroup&| |SetCategory&| |RetractableTo&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|Module| 29) (|BiModule| 29 29) (|LeftModule| 29)
                      (|RightModule| 29) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|RetractableTo| 6)
                      (|BasicType|) (|CoercibleTo| 10))
                   (|makeByteWordVec2| 103
                                       '(0 8 0 9 1 8 10 0 11 0 6 0 17 2 29 0 0
                                         0 30 1 6 27 0 31 2 6 0 0 0 33 1 29 0
                                         13 34 1 29 13 0 36 1 6 0 13 37 1 29 13
                                         0 38 2 6 0 0 0 39 2 6 27 0 0 40 2 6 0
                                         0 0 41 1 6 0 8 42 2 0 0 6 8 43 1 45 44
                                         0 46 0 6 0 47 2 45 6 0 44 48 1 6 0 0
                                         49 2 45 6 0 6 50 1 6 10 0 51 2 10 0 0
                                         52 53 0 45 0 54 1 10 0 0 55 2 10 0 0 0
                                         56 2 45 10 0 10 57 1 13 10 0 58 2 10 0
                                         0 0 59 2 6 27 0 0 60 2 10 0 0 0 61 1
                                         62 0 0 63 1 6 8 0 64 2 6 0 0 8 65 1 0
                                         66 0 67 0 29 0 68 2 29 27 0 0 69 2 19
                                         0 70 0 71 2 21 0 72 0 73 2 19 0 0 0 74
                                         2 21 0 0 0 75 2 6 0 0 8 77 2 0 6 0 8
                                         80 2 45 0 78 0 81 0 45 0 82 2 45 27 0
                                         0 83 1 45 0 0 84 1 45 6 0 85 3 45 87 0
                                         0 0 88 2 45 0 6 44 89 2 45 0 0 0 90 2
                                         45 0 0 0 91 2 92 0 0 0 93 2 10 0 0 0
                                         95 2 92 10 96 0 97 1 10 0 52 98 1 10 0
                                         0 99 2 0 27 0 0 1 1 2 27 0 1 2 1 100 0
                                         0 1 0 2 0 1 1 0 66 0 67 1 0 6 0 1 1 0
                                         6 0 24 1 0 21 0 26 3 0 0 6 19 21 22 1
                                         0 19 0 25 1 0 102 0 1 2 5 0 6 8 43 2 0
                                         0 6 6 32 1 0 103 0 1 1 0 27 0 28 2 4 6
                                         0 8 80 2 0 6 0 78 79 1 0 0 6 23 1 0 10
                                         0 94 0 2 0 16 2 0 27 0 0 1 2 1 0 0 0 1
                                         1 1 0 0 15 2 0 0 0 0 76 2 1 0 13 0 14
                                         2 2 0 44 0 1 2 0 0 0 29 1 2 0 0 101 0
                                         1 2 0 0 29 0 35)))))
           '|lookupComplete|)) 
