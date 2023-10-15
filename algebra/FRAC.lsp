
(SDEFUN |FRAC;coerce;S$;1| ((|d| S) ($ $)) (CONS |d| (|spadConstant| $ 9))) 

(SDEFUN |FRAC;zero?;$B;2| ((|x| $) ($ |Boolean|))
        (SPADCALL (QCAR |x|) (QREFELT $ 12))) 

(SDEFUN |FRAC;retract;$S;3| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ('T (|error| "Denominator not equal to 1")))) 

(SDEFUN |FRAC;retractIfCan;$U;4| ((|x| $) ($ |Union| S "failed"))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
          (CONS 0 (QCAR |x|)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FRAC;retract;$S;5| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))
                      |FRAC;retract;$S;5|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;6| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))) 

(SDEFUN |FRAC;retract;$S;7| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))
                      |FRAC;retract;$S;7|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;8| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))) 

(SDEFUN |FRAC;wholePart;$S;9| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 20))))) 

(SDEFUN |FRAC;floor;$S;10| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 22) (QREFELT $ 24))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 26))
                    (QREFELT $ 27)))
         ('T (SPADCALL |x| (QREFELT $ 21))))) 

(SDEFUN |FRAC;ceiling;$S;11| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 22) (QREFELT $ 24))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 28))
                    (QREFELT $ 27)))
         ('T
          (SPADCALL (|spadConstant| $ 9) (SPADCALL |x| (QREFELT $ 21))
                    (QREFELT $ 29))))) 

(SDEFUN |FRAC;writeOMFrac| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 32))
             (SPADCALL |dev| "nums1" "rational" (QREFELT $ 34))
             (SPADCALL |dev| (QCAR |x|) NIL (QREFELT $ 35))
             (SPADCALL |dev| (QCDR |x|) NIL (QREFELT $ 35))
             (EXIT (SPADCALL |dev| (QREFELT $ 36))))) 

(SDEFUN |FRAC;OMwrite;Omd$BV;13|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 37))))
             (|FRAC;writeOMFrac| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 38))))))) 

(SDEFUN |FRAC;normalize| ((|x| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S))))
         (SEQ
          (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (|spadConstant| $ 22))
                ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) |x|)
                (#1='T
                 (SEQ
                  (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT $ 41))
                        |FRAC;normalize|)
                  (EXIT
                   (COND
                    ((SPADCALL (PROGN (RPLACD |x| (QVELT |uca| 1)) (QCDR |x|))
                               (QREFELT $ 12))
                     (|error| "division by zero"))
                    (#1#
                     (SEQ
                      (PROGN
                       (RPLACA |x|
                               (SPADCALL (QCAR |x|) (QVELT |uca| 2)
                                         (QREFELT $ 42)))
                       (QCAR |x|))
                      (EXIT |x|))))))))))) 

(SDEFUN |FRAC;recip;$U;15| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) $))))) 

(SDEFUN |FRAC;cancelGcd| ((|x| $) ($ S))
        (SPROG ((|xd| #1=(|Union| S "failed")) (|xn| #1#) (|d| (S)))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
                  (QCDR |x|))
                 (#2='T
                  (SEQ
                   (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 44))
                         . #3=(|FRAC;cancelGcd|))
                   (LETT |xn| (SPADCALL (QCAR |x|) |d| (QREFELT $ 19)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |xn| 1)
                      (|error| "gcd not gcd in QF cancelGcd (numerator)"))
                     (#2#
                      (SEQ
                       (LETT |xd| (SPADCALL (QCDR |x|) |d| (QREFELT $ 19))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |xd| 1)
                          (|error|
                           "gcd not gcd in QF cancelGcd (denominator)"))
                         (#2#
                          (SEQ (PROGN (RPLACA |x| (QCDR |xn|)) (QCAR |x|))
                               (PROGN (RPLACD |x| (QCDR |xd|)) (QCDR |x|))
                               (EXIT |d|))))))))))))))) 

(SDEFUN |FRAC;/;2S$;17| ((|nn| S) (|dd| S) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
                 ('T
                  (SEQ
                   (|FRAC;cancelGcd|
                    (LETT |z| (CONS |nn| |dd|) |FRAC;/;2S$;17|) $)
                   (EXIT (|FRAC;normalize| |z| $)))))))) 

(SDEFUN |FRAC;+;3$;18| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ((SPADCALL |x| (QREFELT $ 13)) |y|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;+;3$;18|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 42))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 42))
                                (QREFELT $ 29))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 42))
                                  (QCDR |z|) (QREFELT $ 42)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;-;3$;19| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;-;3$;19|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 42))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 42))
                                (QREFELT $ 47))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 42))
                                  (QCDR |z|) (QREFELT $ 42)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;*;3$;20| ((|x| $) (|y| $) ($ $))
        (SPROG ((|#G31| ($)) (|#G30| ($)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 13))
                      (SPADCALL |y| (QREFELT $ 13)))
                  (|spadConstant| $ 22))
                 ('T
                  (COND
                   ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 49)) |y|)
                   ((SPADCALL |y| (|spadConstant| $ 8) (QREFELT $ 49)) |x|)
                   ('T
                    (SEQ
                     (PROGN
                      (LETT |#G30| (CONS (QCAR |x|) (QCDR |y|))
                            . #1=(|FRAC;*;3$;20|))
                      (LETT |#G31| (CONS (QCAR |y|) (QCDR |x|)) . #1#)
                      (LETT |x| |#G30| . #1#)
                      (LETT |y| |#G31| . #1#))
                     (|FRAC;cancelGcd| |x| $) (|FRAC;cancelGcd| |y| $)
                     (EXIT
                      (|FRAC;normalize|
                       (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 42))
                             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 42)))
                       $)))))))))) 

(SDEFUN |FRAC;*;I2$;21| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL |n| (QREFELT $ 52)) (QCDR |x|))
                      |FRAC;*;I2$;21|)
                (|FRAC;cancelGcd| |y| $)
                (EXIT
                 (|FRAC;normalize|
                  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 42))
                        (QCDR |y|))
                  $))))) 

(SDEFUN |FRAC;*;S2$;22| ((|nn| S) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| (CONS |nn| (QCDR |x|)) |FRAC;*;S2$;22|)
                    (|FRAC;cancelGcd| |y| $)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 42))
                            (QCDR |y|))
                      $))))) 

(SDEFUN |FRAC;differentiate;$M$;23| ((|x| $) (|deriv| |Mapping| S S) ($ $))
        (SPROG ((|d| (S)) (|#G39| (S)) (|#G38| (S)) (|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|))
                      . #1=(|FRAC;differentiate;$M$;23|))
                (LETT |d| (|FRAC;cancelGcd| |y| $) . #1#)
                (PROGN
                 (RPLACA |y|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR |x|) |deriv|) (QCDR |y|)
                                    (QREFELT $ 42))
                          (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 42))
                          (QREFELT $ 47)))
                 (QCAR |y|))
                (PROGN
                 (LETT |#G38| (QCDR |y|) . #1#)
                 (LETT |#G39| |d| . #1#)
                 (LETT |d| |#G38| . #1#)
                 (PROGN (RPLACD |y| |#G39|) (QCDR |y|)))
                (|FRAC;cancelGcd| |y| $)
                (PROGN
                 (RPLACD |y|
                         (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT $ 42)) |d|
                                   (QREFELT $ 42)))
                 (QCDR |y|))
                (EXIT (|FRAC;normalize| |y| $))))) 

(SDEFUN |FRAC;=;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 14))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |FRAC;one?;$B;25| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
          (SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)))
         ('T NIL))) 

(SDEFUN |FRAC;/;2S$;26| ((|nn| S) (|dd| S) ($ $))
        (COND ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
              ('T (CONS |nn| |dd|)))) 

(SDEFUN |FRAC;recip;$U;27| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(SDEFUN |FRAC;retract;$F;28| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 59))) 

(SDEFUN |FRAC;retractIfCan;$U;29|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 17))
                      |FRAC;retractIfCan;$U;29|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 62)))))))) 

(SDEFUN |FRAC;retract;$F;30| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (QREFELT $ 65))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 66)) (QREFELT $ 65))
                  (QREFELT $ 67))) 

(SDEFUN |FRAC;retractIfCan;$U;31|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Integer|) "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 64)) (QREFELT $ 69))
                      . #2=(|FRAC;retractIfCan;$U;31|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 66))
                                         (QREFELT $ 69))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 67))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;32|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) (|qq| . #1#) ($ . #1#))
        (SPROG
         ((|lc| (S)) (|g| (|SparseUnivariatePolynomial| S))
          (|qqD| #2=(|SparseUnivariatePolynomial| S)) (|denqq| (S))
          (#3=#:G799 NIL) (#4=#:G798 (S)) (#5=#:G800 (S)) (#6=#:G809 NIL)
          (|u| NIL) (|ppD| #2#) (|denpp| (S)) (#7=#:G795 NIL) (#8=#:G794 (S))
          (#9=#:G796 (S)) (#10=#:G808 NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 71)) |qq|)
                ((SPADCALL |qq| (QREFELT $ 71)) |pp|)
                ((OR (ZEROP (SPADCALL |pp| (QREFELT $ 73)))
                     (ZEROP (SPADCALL |qq| (QREFELT $ 73))))
                 (|spadConstant| $ 74))
                ('T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #7# NIL . #11=(|FRAC;gcdPolynomial;3Sup;32|))
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #10# (SPADCALL |pp| (QREFELT $ 76)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |u| (CAR #10#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9# (SPADCALL |u| (QREFELT $ 66))
                                       . #11#)
                                 (COND
                                  (#7#
                                   (LETT #8# (SPADCALL #8# #9# (QREFELT $ 77))
                                         . #11#))
                                  ('T
                                   (PROGN
                                    (LETT #8# #9# . #11#)
                                    (LETT #7# 'T . #11#)))))))
                              (LETT #10# (CDR #10#) . #11#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#7# #8#) (#12='T (|spadConstant| $ 9))))
                        . #11#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;32!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 82))
                        . #11#)
                  (LETT |denqq|
                        (PROGN
                         (LETT #3# NIL . #11#)
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #6# (SPADCALL |qq| (QREFELT $ 76)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |u| (CAR #6#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |u| (QREFELT $ 66))
                                       . #11#)
                                 (COND
                                  (#3#
                                   (LETT #4# (SPADCALL #4# #5# (QREFELT $ 77))
                                         . #11#))
                                  ('T
                                   (PROGN
                                    (LETT #4# #5# . #11#)
                                    (LETT #3# 'T . #11#)))))))
                              (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#3# #4#) (#12# (|spadConstant| $ 9))))
                        . #11#)
                  (LETT |qqD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;32!1|
                               (VECTOR $ |denqq|))
                         |qq| (QREFELT $ 82))
                        . #11#)
                  (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT $ 84)) . #11#)
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |g| (QREFELT $ 85)))
                     (|spadConstant| $ 74))
                    (#12#
                     (SEQ (LETT |lc| (SPADCALL |g| (QREFELT $ 86)) . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL |lc| (|spadConstant| $ 9)
                                       (QREFELT $ 14))
                             (SPADCALL (ELT $ 10) |g| (QREFELT $ 89)))
                            (#12#
                             (SPADCALL
                              (CONS #'|FRAC;gcdPolynomial;3Sup;32!2|
                                    (VECTOR $ |lc|))
                              |g| (QREFELT $ 89))))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;32!2| ((|x| NIL) ($$ NIL))
        (PROG (|lc| $)
          (LETT |lc| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT $ 45)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;32!1| ((|x| NIL) ($$ NIL))
        (PROG (|denqq| $)
          (LETT |denqq| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denqq| (QREFELT $ 78)) (QREFELT $ 15)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;32!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;32|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 78)) (QREFELT $ 15)))))) 

(SDEFUN |FRAC;charthRoot;$U;33| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|d| #2=(|Union| S #1#)) (|n| #2#))
               (SEQ
                (LETT |n| (SPADCALL (QCAR |x|) (QREFELT $ 91))
                      . #3=(|FRAC;charthRoot;$U;33|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ
                         (LETT |d| (SPADCALL (QCDR |x|) (QREFELT $ 91)) . #3#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#4#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 45))))))))))))) 

(SDEFUN |FRAC;charthRoot;$U;34| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G835 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL (QREFELT $ 93))
                                                      1)
                                                     . #3=(|FRAC;charthRoot;$U;34|))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT $ 94))
                                 (QREFELT $ 42))
                       (QREFELT $ 91))
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 45))))))))) 

(SDEFUN |FRAC;charthRoot;$U;35| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)) (#2=#:G856 NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL (QREFELT $ 93))
                                                      1)
                                                     . #3=(|FRAC;charthRoot;$U;35|))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT $ 94))
                                 (QREFELT $ 42))
                       (QREFELT $ 91))
                      . #3#)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 45))))))))) 

(SDEFUN |FRAC;clear| ((|l| |List| $) ($ |List| S))
        (SPROG
         ((#1=#:G866 NIL) (#2=#:G873 NIL) (|x| NIL) (#3=#:G872 NIL) (|d| (S))
          (#4=#:G863 NIL) (#5=#:G862 (S)) (#6=#:G864 (S)) (#7=#:G871 NIL))
         (SEQ
          (LETT |d|
                (PROGN
                 (LETT #4# NIL . #8=(|FRAC;clear|))
                 (SEQ (LETT |x| NIL . #8#) (LETT #7# |l| . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (QCDR |x|) . #8#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 77)) . #8#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #8#)
                            (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|spadConstant| $ 9))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #8#)
            (SEQ (LETT |x| NIL . #8#) (LETT #2# |l| . #8#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (SPADCALL (QCAR |x|)
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |d| (QCDR |x|)
                                                        (QREFELT $ 19))
                                              . #8#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 6)
                                                      (|Union| (QREFELT $ 6)
                                                               "failed")
                                                      #1#))
                                    (QREFELT $ 42))
                          #3#)
                         . #8#)))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |FRAC;conditionP;MU;37|
        ((|mat| |Matrix| . #1=($)) ($ |Union| (|Vector| . #1#) #2="failed"))
        (SPROG
         ((#3=#:G891 NIL) (#4=#:G893 NIL) (|i| NIL) (#5=#:G892 NIL)
          (|ansDD| (|Vector| S)) (|ansD| (|Union| (|Vector| S) #2#))
          (|matD| (|Matrix| S)) (#6=#:G890 NIL) (|l| NIL) (#7=#:G889 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL . #8=(|FRAC;conditionP;MU;37|))
                  (SEQ (LETT |l| NIL . #8#)
                       (LETT #6# (SPADCALL |mat| (QREFELT $ 97)) . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |l| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #7# (CONS (|FRAC;clear| |l| $) #7#) . #8#)))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT $ 100))
                . #8#)
          (LETT |ansD| (SPADCALL |matD| (QREFELT $ 103)) . #8#)
          (EXIT
           (COND ((QEQCAR |ansD| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ansDD| (QCDR |ansD|) . #8#)
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #5# (GETREFV #9=(QVSIZE |ansDD|)) . #8#)
                               (SEQ (LETT |i| 1 . #8#) (LETT #4# #9# . #8#)
                                    (LETT #3# 0 . #8#) G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SETELT #5# #3#
                                              (SPADCALL
                                               (SPADCALL |ansDD| |i|
                                                         (QREFELT $ 105))
                                               (QREFELT $ 10)))))
                                    (LETT #3#
                                          (PROG1 (|inc_SI| #3#)
                                            (LETT |i| (|inc_SI| |i|) . #8#))
                                          . #8#)
                                    (GO G190) G191 (EXIT NIL))
                               #5#)))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;38|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G916 NIL) (|w| NIL) (#3=#:G915 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G895 NIL) (#5=#:G894 (S)) (#6=#:G896 (S)) (#7=#:G914 NIL)
          (|u| NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 71)) (|spadConstant| $ 108))
                (#8='T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9=(|FRAC;factorPolynomial;SupF;38|))
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 76)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 66)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 77))
                                         . #9#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #9#)
                                    (LETT #4# 'T . #9#)))))))
                              (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) (#8# (|spadConstant| $ 9))))
                        . #9#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorPolynomial;SupF;38!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 82))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 110)) . #9#)
                  (LETT |den1| (SPADCALL |denpp| (QREFELT $ 10)) . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 115)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |w| (CAR #2#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT $ 86))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 14))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 89)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 86))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            116))
                                                                  (QREFELT $
                                                                           117))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorPolynomial;SupF;38!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 89))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;38!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 118)) (QREFELT $ 89))
                    |lfact| (QREFELT $ 121))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;38!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;38|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 117)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;38!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;38|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 117)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;38!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;38|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 78)) (QREFELT $ 15)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;39|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G941 NIL) (|w| NIL) (#3=#:G940 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G921 NIL) (#5=#:G920 (S)) (#6=#:G922 (S)) (#7=#:G939 NIL)
          (|u| NIL) (|lcpp| ($)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 71)) (|spadConstant| $ 108))
                ((EQL (SPADCALL |pp| (QREFELT $ 73)) 0)
                 (SPADCALL |pp| NIL (QREFELT $ 121)))
                (#8='T
                 (SEQ
                  (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 123))
                        . #9=(|FRAC;factorSquareFreePolynomial;SupF;39|))
                  (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT $ 124)) . #9#)
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9#)
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 76)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 66)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 77))
                                         . #9#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #9#)
                                    (LETT #4# 'T . #9#)))))))
                              (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) (#8# (|spadConstant| $ 9))))
                        . #9#)
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorSquareFreePolynomial;SupF;39!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 82))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 125)) . #9#)
                  (LETT |den1|
                        (SPADCALL (SPADCALL |denpp| (QREFELT $ 10)) |lcpp|
                                  (QREFELT $ 117))
                        . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 115)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |w| (CAR #2#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT $ 86))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 14))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 89)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 86))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            116))
                                                                  (QREFELT $
                                                                           117))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorSquareFreePolynomial;SupF;39!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 89))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorSquareFreePolynomial;SupF;39!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 118)) (QREFELT $ 89))
                    |lfact| (QREFELT $ 121))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;39!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;39|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 117)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;39!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;39|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 117)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;39!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;39|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 78)) (QREFELT $ 15)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction| (#1=#:G966)
  (SPROG NIL
         (PROG (#2=#:G967)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Fraction|)
                                               '|domainEqualList|)
                    . #3=(|Fraction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Fraction;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Fraction|)))))))))) 

(DEFUN |Fraction;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G961 NIL) (#2=#:G962 NIL) (#3=#:G963 NIL) (#4=#:G965 NIL)
    (#5=#:G964 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Fraction|))
    (LETT |dv$| (LIST '|Fraction| DV$1) . #6#)
    (LETT $ (GETREFV 160) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1|
                                                       '(|OrderedIntegralDomain|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|OrderedIntegralDomain|))
                                         (|HasCategory| |#1| '(|OrderedSet|)))
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (AND
                                         (|HasCategory| |#1| '(|Canonical|))
                                         (|HasCategory| |#1| '(|GcdDomain|))
                                         (|HasCategory| |#1|
                                                        '(|canonicalUnitNormal|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))
                                              . #6#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|IntegerNumberSystem|))
                                               (|HasCategory| |#1|
                                                              '(|OpenMath|)))
                                              . #6#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              . #6#)
                                        (OR #3# #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))
                                              . #6#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|OrderedIntegralDomain|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              . #6#)
                                        (OR #1# #4#)))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|Fraction| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| $ '(|CharacteristicNonZero|))
         (|augmentPredVector| $ 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
              (|HasCategory| $ '(|CharacteristicNonZero|))))
     (|augmentPredVector| $ 8589934592))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7 (|Record| (|:| |num| |#1|) (|:| |den| |#1|)))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |FRAC;retract;$S;3|) $))
         (QSETREFV $ 17
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;4|) $))))
       ('T
        (PROGN
         (QSETREFV $ 15 (CONS (|dispatchFunction| |FRAC;retract;$S;5|) $))
         (QSETREFV $ 17
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;6|) $))))))
     ('T
      (PROGN
       (QSETREFV $ 15 (CONS (|dispatchFunction| |FRAC;retract;$S;7|) $))
       (QSETREFV $ 17
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;8|) $)))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 21 (CONS (|dispatchFunction| |FRAC;wholePart;$S;9|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 28 (CONS (|dispatchFunction| |FRAC;floor;$S;10|) $))
       (QSETREFV $ 26 (CONS (|dispatchFunction| |FRAC;ceiling;$S;11|) $))
       (COND
        ((|HasCategory| |#1| '(|OpenMath|))
         (PROGN
          (QSETREFV $ 39
                    (CONS (|dispatchFunction| |FRAC;OMwrite;Omd$BV;13|)
                          $))))))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (PROGN
       (QSETREFV $ 43 (CONS (|dispatchFunction| |FRAC;recip;$U;15|) $))
       (QSETREFV $ 45 (CONS (|dispatchFunction| |FRAC;/;2S$;17|) $))
       (QSETREFV $ 46 (CONS (|dispatchFunction| |FRAC;+;3$;18|) $))
       (QSETREFV $ 48 (CONS (|dispatchFunction| |FRAC;-;3$;19|) $))
       (QSETREFV $ 50 (CONS (|dispatchFunction| |FRAC;*;3$;20|) $))
       (QSETREFV $ 53 (CONS (|dispatchFunction| |FRAC;*;I2$;21|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |FRAC;*;S2$;22|) $))
       (QSETREFV $ 56
                 (CONS (|dispatchFunction| |FRAC;differentiate;$M$;23|) $))
       (COND
        ((|HasCategory| |#1| '(|canonicalUnitNormal|))
         (PROGN
          (QSETREFV $ 49 (CONS (|dispatchFunction| |FRAC;=;2$B;24|) $))
          (QSETREFV $ 57 (CONS (|dispatchFunction| |FRAC;one?;$B;25|) $)))))))
     ('T
      (PROGN
       (QSETREFV $ 45 (CONS (|dispatchFunction| |FRAC;/;2S$;26|) $))
       (QSETREFV $ 43 (CONS (|dispatchFunction| |FRAC;recip;$U;27|) $)))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV $ 60 (CONS (|dispatchFunction| |FRAC;retract;$F;28|) $))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;29|) $))))
     ((|testBitVector| |pv$| 31)
      (PROGN
       (QSETREFV $ 60 (CONS (|dispatchFunction| |FRAC;retract;$F;30|) $))
       (QSETREFV $ 63
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;31|) $)))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV $ 90
                (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;32|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 3)
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|canonicalUnitNormal|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (QSETREFV $ 92
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;33|) $)))
             ('T
              (QSETREFV $ 92
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;34|)
                              $)))))
           ('T
            (QSETREFV $ 92
                      (CONS (|dispatchFunction| |FRAC;charthRoot;$U;35|) $))))
          NIL
          NIL
          (QSETREFV $ 106
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;37|) $)))))
       (QSETREFV $ 122
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;38|) $))
       (QSETREFV $ 126
                 (CONS
                  (|dispatchFunction|
                   |FRAC;factorSquareFreePolynomial;SupF;39|)
                  $)))))
    $))) 

(MAKEPROP '|Fraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|LocalAlgebra| 6 6) (|local| |#1|) '|Rep|
              (0 . |One|) (4 . |One|) |FRAC;coerce;S$;1| (|Boolean|)
              (8 . |zero?|) |FRAC;zero?;$B;2| (13 . =) (19 . |retract|)
              (|Union| 6 '"failed") (24 . |retractIfCan|) (|Union| $ '"failed")
              (29 . |exquo|) (35 . |quo|) (41 . |wholePart|) (46 . |Zero|)
              (50 . |Zero|) (54 . <) (60 . -) (65 . |ceiling|) (70 . -)
              (75 . |floor|) (80 . +) (|Void|) (|OpenMathDevice|)
              (86 . |OMputApp|) (|String|) (91 . |OMputSymbol|)
              (98 . |OMwrite|) (105 . |OMputEndApp|) (110 . |OMputObject|)
              (115 . |OMputEndObject|) (120 . |OMwrite|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (127 . |unitNormal|) (132 . *) (138 . |recip|) (143 . |gcd|)
              (149 . /) (155 . +) (161 . -) (167 . -) (173 . =) (179 . *)
              (|Integer|) (185 . |coerce|) (190 . *) (196 . *) (|Mapping| 6 6)
              (202 . |differentiate|) (208 . |one?|) (|Fraction| 51)
              (213 . |retract|) (218 . |retract|) (|Union| 58 '#1="failed")
              (223 . |retractIfCan|) (228 . |retractIfCan|) (233 . |numer|)
              (238 . |retract|) (243 . |denom|) (248 . /) (|Union| 51 '#1#)
              (254 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (259 . |zero?|) (|NonNegativeInteger|) (264 . |degree|)
              (269 . |One|) (|List| $$) (273 . |coefficients|) (278 . |lcm|)
              (284 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 70 6 79)
              (290 . |map|) (|SparseUnivariatePolynomial| $)
              (296 . |gcdPolynomial|) (302 . |degree|)
              (307 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 79 $$ 70)
              (312 . |map|) (318 . |gcdPolynomial|) (324 . |charthRoot|)
              (329 . |charthRoot|) (334 . |characteristic|) (338 . ^)
              (|List| 75) (|Matrix| $$) (344 . |listOfLists|) (|List| 132)
              (|Matrix| 6) (349 . |matrix|) (|Union| 136 '#2="failed")
              (|Matrix| $) (354 . |conditionP|) (|Vector| 6) (359 . |elt|)
              (365 . |conditionP|) (|Factored| 70) (370 . |Zero|)
              (|Factored| 83) (374 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 111) (|:| |fctr| 79) (|:| |xpnt| 51))
              (|List| 112) (|Factored| 79) (379 . |factorList|) (384 . ^)
              (390 . /) (396 . |unit|)
              (|Record| (|:| |flg| 111) (|:| |fctr| 70) (|:| |xpnt| 51))
              (|List| 119) (401 . |makeFR|) (407 . |factorPolynomial|)
              (412 . |leadingCoefficient|) (417 . /)
              (423 . |factorSquareFreePolynomial|)
              (428 . |factorSquareFreePolynomial|) (|InputForm|)
              (|Pattern| 143) (|Pattern| 51) (|List| 131) (|Equation| 6)
              (|List| 6) (|Symbol|) (|List| 133)
              (|Record| (|:| |mat| 137) (|:| |vec| (|Vector| 51))) (|Vector| $)
              (|Matrix| 51) (|List| 72) (|PatternMatchResult| 143 $)
              (|PatternMatchResult| 51 $) (|Union| 142 '#2#) (|List| 83)
              (|Float|) (|DoubleFloat|) (|Union| 133 '#1#)
              (|Record| (|:| |mat| 99) (|:| |vec| 104)) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 148 '#3="failed") (|Union| 151 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 151) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 433 |zero?| 439 |wholePart| 444 |unitNormal| 449
              |unitCanonical| 454 |unit?| 459 |subtractIfCan| 464
              |squareFreePolynomial| 470 |squareFreePart| 475 |squareFree| 480
              |solveLinearPolynomialEquation| 485 |smaller?| 491 |sizeLess?|
              497 |sign| 503 |sample| 508 |retractIfCan| 512 |retract| 532
              |rem| 552 |reducedSystem| 558 |recip| 580 |quo| 585
              |principalIdeal| 591 |prime?| 596 |positive?| 601 |patternMatch|
              606 |opposite?| 620 |one?| 626 |numerator| 631 |numer| 636
              |nextItem| 641 |negative?| 646 |multiEuclidean| 651 |min| 657
              |max| 663 |map| 669 |lcmCoef| 675 |lcm| 681 |latex| 692 |inv| 697
              |init| 702 |hashUpdate!| 706 |hash| 712 |gcdPolynomial| 717 |gcd|
              723 |fractionPart| 734 |floor| 739 |factorSquareFreePolynomial|
              744 |factorPolynomial| 749 |factor| 754 |extendedEuclidean| 759
              |exquo| 772 |expressIdealMember| 778 |eval| 784 |euclideanSize|
              824 |elt| 829 |divide| 835 |differentiate| 841 |denominator| 891
              |denom| 896 |convert| 901 |conditionP| 926 |coerce| 931
              |charthRoot| 961 |characteristic| 966 |ceiling| 970 |associates?|
              975 |annihilate?| 981 |abs| 987 ^ 992 |Zero| 1010 |One| 1014
              |OMwrite| 1018 D 1042 >= 1092 > 1098 = 1104 <= 1110 < 1116 / 1122
              - 1134 + 1145 * 1151)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 0 1 0 0 0 6 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0
                                  3 4 13 14 24 0 0 0 0 6 0 0 0 0 0 0 0 6 0 6 0
                                  0 6 0 0 0 0 8 0 0 0 30 9 16 26 0 0 5 11 0 0 0
                                  0 0 0 0 0 0 2 28 5 5 7 32 32 10 11 12 15 25
                                  17 23))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Algebra&| |Algebra&| NIL |Algebra&| |OrderedRing&| NIL
                |Module&| |Module&| NIL |EntireRing&| |Module&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |OrderedSet&| |FullyEvalableOver&| |SemiGroup&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL |OpenMath&|)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6)
                 (|DifferentialExtension| 6) (|Algebra| 6) (|Algebra| 58)
                 (|LeftOreRing|) (|Algebra| $$) (|OrderedRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 6) (|Module| 58)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 133) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 51) (|BiModule| 6 6)
                 (|BiModule| 58 58) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 58) (|LeftModule| 58) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 6)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|PatternMatchable| 143)
                 (|PatternMatchable| 51) (|Patternable| 6) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 6) (|Type|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 159) (|RetractableTo| 133)
                 (|ConvertibleTo| 127) (|ConvertibleTo| 144)
                 (|ConvertibleTo| 143) (|PartialOrder|) (|RetractableTo| 58)
                 (|RetractableTo| 51) (|InnerEvalable| 133 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 128)
                 (|ConvertibleTo| 129) (|Canonical|) (|OpenMath|))
              (|makeByteWordVec2| 159
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 2 6 11 0 0 14 1
                                    0 6 0 15 1 0 16 0 17 2 6 18 0 0 19 2 6 0 0
                                    0 20 1 0 6 0 21 0 0 0 22 0 6 0 23 2 0 11 0
                                    0 24 1 0 0 0 25 1 0 6 0 26 1 6 0 0 27 1 0 6
                                    0 28 2 6 0 0 0 29 1 31 30 0 32 3 31 30 0 33
                                    33 34 3 6 30 31 0 11 35 1 31 30 0 36 1 31
                                    30 0 37 1 31 30 0 38 3 0 30 31 0 11 39 1 6
                                    40 0 41 2 6 0 0 0 42 1 0 18 0 43 2 6 0 0 0
                                    44 2 0 0 6 6 45 2 0 0 0 0 46 2 6 0 0 0 47 2
                                    0 0 0 0 48 2 0 11 0 0 49 2 0 0 0 0 50 1 6 0
                                    51 52 2 0 0 51 0 53 2 0 0 6 0 54 2 0 0 0 55
                                    56 1 0 11 0 57 1 6 58 0 59 1 0 58 0 60 1 6
                                    61 0 62 1 0 61 0 63 1 0 6 0 64 1 6 51 0 65
                                    1 0 6 0 66 2 58 0 51 51 67 1 6 68 0 69 1 70
                                    11 0 71 1 70 72 0 73 0 70 0 74 1 70 75 0 76
                                    2 6 0 0 0 77 2 0 0 0 6 78 2 81 79 80 70 82
                                    2 6 83 83 83 84 1 79 72 0 85 1 79 6 0 86 2
                                    88 70 87 79 89 2 0 83 83 83 90 1 6 18 0 91
                                    1 0 18 0 92 0 0 72 93 2 6 0 0 72 94 1 96 95
                                    0 97 1 99 0 98 100 1 6 101 102 103 2 104 6
                                    0 51 105 1 0 101 102 106 0 107 0 108 1 6
                                    109 83 110 1 114 113 0 115 2 0 0 0 51 116 2
                                    0 0 0 0 117 1 114 79 0 118 2 107 0 70 120
                                    121 1 0 109 83 122 1 70 2 0 123 2 70 0 0 2
                                    124 1 6 109 83 125 1 0 109 83 126 2 0 11 0
                                    0 1 1 0 11 0 13 1 21 6 0 21 1 0 40 0 1 1 0
                                    0 0 1 1 0 11 0 1 2 0 18 0 0 1 1 1 109 83 1
                                    1 0 0 0 1 1 0 147 0 1 2 1 141 142 83 1 2 29
                                    11 0 0 1 2 0 11 0 0 1 1 6 51 0 1 0 0 0 1 1
                                    31 68 0 1 1 31 61 0 63 1 2 145 0 1 1 0 16 0
                                    17 1 31 51 0 1 1 31 58 0 60 1 2 133 0 1 1 0
                                    6 0 15 2 0 0 0 0 1 2 18 135 102 136 1 1 18
                                    137 102 1 2 0 146 102 136 1 1 0 99 102 1 1
                                    0 18 0 43 2 0 0 0 0 1 1 0 154 151 1 1 0 11
                                    0 1 1 6 11 0 1 3 16 139 0 128 139 1 3 20
                                    140 0 129 140 1 2 0 11 0 0 1 1 0 11 0 57 1
                                    0 0 0 1 1 0 6 0 64 1 9 18 0 1 1 6 11 0 1 2
                                    0 150 151 0 1 2 7 0 0 0 1 2 7 0 0 0 1 2 0 0
                                    55 0 1 2 0 155 0 0 1 2 0 0 0 0 1 1 0 0 151
                                    1 1 0 33 0 1 1 0 0 0 1 0 9 0 1 2 0 158 158
                                    0 1 1 0 157 0 1 2 0 83 83 83 90 2 0 0 0 0 1
                                    1 0 0 151 1 1 21 0 0 1 1 22 6 0 28 1 1 109
                                    83 126 1 1 109 83 122 1 0 147 0 1 3 0 149 0
                                    0 0 1 2 0 152 0 0 1 2 0 18 0 0 1 2 0 150
                                    151 0 1 2 11 0 0 130 1 3 11 0 0 6 6 1 2 11
                                    0 0 131 1 3 11 0 0 132 132 1 3 10 0 0 133 6
                                    1 3 10 0 0 134 132 1 1 0 72 0 1 2 12 0 0 6
                                    1 2 0 153 0 0 1 2 14 0 0 72 1 1 14 0 0 1 3
                                    13 0 0 134 138 1 2 13 0 0 134 1 3 13 0 0
                                    133 72 1 2 13 0 0 133 1 2 0 0 0 55 56 3 0 0
                                    0 55 72 1 1 0 0 0 1 1 0 6 0 66 1 27 127 0 1
                                    1 15 128 0 1 1 19 129 0 1 1 5 143 0 1 1 5
                                    144 0 1 1 33 101 102 106 1 2 0 133 1 1 0 0
                                    6 10 1 0 0 58 1 1 0 0 51 1 1 0 0 0 1 1 0
                                    159 0 1 1 34 18 0 92 0 0 72 93 1 22 6 0 26
                                    2 0 11 0 0 1 2 0 11 0 0 1 1 6 0 0 1 2 0 0 0
                                    51 116 2 0 0 0 72 1 2 0 0 0 156 1 0 0 0 22
                                    0 0 0 8 2 23 33 0 11 1 1 23 33 0 1 3 23 30
                                    31 0 11 39 2 23 30 31 0 1 2 14 0 0 72 1 1
                                    14 0 0 1 3 13 0 0 134 138 1 2 13 0 0 134 1
                                    3 13 0 0 133 72 1 2 13 0 0 133 1 2 0 0 0 55
                                    1 3 0 0 0 55 72 1 2 7 11 0 0 1 2 7 11 0 0 1
                                    2 0 11 0 0 49 2 7 11 0 0 1 2 7 11 0 0 24 2
                                    0 0 6 6 45 2 0 0 0 0 117 1 0 0 0 25 2 0 0 0
                                    0 48 2 0 0 0 0 46 2 0 0 6 0 54 2 0 0 0 6 78
                                    2 0 0 58 0 1 2 0 0 0 58 1 2 0 0 51 0 53 2 0
                                    0 0 0 50 2 0 0 72 0 1 2 0 0 156 0 1)))))
           '|lookupComplete|)) 
