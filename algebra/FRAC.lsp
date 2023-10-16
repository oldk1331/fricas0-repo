
(SDEFUN |FRAC;coerce;S$;1| ((|d| S) ($ $)) (CONS |d| (|spadConstant| $ 9))) 

(SDEFUN |FRAC;zero?;$B;2| ((|x| $) ($ |Boolean|))
        (SPADCALL (QCAR |x|) (QREFELT $ 12))) 

(SDEFUN |FRAC;factorFraction;$F;3| ((|p| $) ($ |Fraction| (|Factored| S)))
        (SPADCALL (SPADCALL (QCAR |p|) (QREFELT $ 15))
                  (SPADCALL (QCDR |p|) (QREFELT $ 15)) (QREFELT $ 18))) 

(SDEFUN |FRAC;=;2$B;4| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 20))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 20)))
         ('T NIL))) 

(SDEFUN |FRAC;hashUpdate!;Hs$Hs;5| ((|s| . #1=(|HashState|)) (|x| $) ($ . #1#))
        (SEQ
         (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT $ 23))
               |FRAC;hashUpdate!;Hs$Hs;5|)
         (EXIT (SPADCALL |s| (QCDR |x|) (QREFELT $ 23))))) 

(SDEFUN |FRAC;one?;$B;6| ((|x| $) ($ |Boolean|))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| $ 9) (QREFELT $ 20))
          (SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)))
         ('T NIL))) 

(SDEFUN |FRAC;retract;$S;7| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)) (QCAR |x|))
         ('T (|error| "Denominator not equal to 1")))) 

(SDEFUN |FRAC;retractIfCan;$U;8| ((|x| $) ($ |Union| S "failed"))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20))
          (CONS 0 (QCAR |x|)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FRAC;retract;$S;9| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 30))
                      |FRAC;retract;$S;9|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;10| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 30))) 

(SDEFUN |FRAC;retract;$S;11| ((|x| $) ($ S))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ
                (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 30))
                      |FRAC;retract;$S;11|)
                (EXIT
                 (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                       ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;$U;12| ((|x| $) ($ |Union| S "failed"))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 30))) 

(SDEFUN |FRAC;wholePart;$S;13| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)) (QCAR |x|))
         ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 31))))) 

(SDEFUN |FRAC;floor;$S;14| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 33) (QREFELT $ 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 37))
                    (QREFELT $ 38)))
         ('T (SPADCALL |x| (QREFELT $ 32))))) 

(SDEFUN |FRAC;ceiling;$S;15| ((|x| $) ($ S))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| $ 33) (QREFELT $ 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 39))
                    (QREFELT $ 38)))
         ('T
          (SPADCALL (|spadConstant| $ 9) (SPADCALL |x| (QREFELT $ 32))
                    (QREFELT $ 40))))) 

(SDEFUN |FRAC;writeOMFrac| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 43))
             (SPADCALL |dev| "nums1" "rational" (QREFELT $ 45))
             (SPADCALL |dev| (QCAR |x|) NIL (QREFELT $ 46))
             (SPADCALL |dev| (QCDR |x|) NIL (QREFELT $ 46))
             (EXIT (SPADCALL |dev| (QREFELT $ 47))))) 

(SDEFUN |FRAC;OMwrite;Omd$BV;17|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 48))))
             (|FRAC;writeOMFrac| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 49))))))) 

(SDEFUN |FRAC;normalize| ((|x| $) ($ $))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S))))
         (SEQ
          (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (|spadConstant| $ 33))
                ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20)) |x|)
                (#1='T
                 (SEQ
                  (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT $ 52))
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
                                         (QREFELT $ 53)))
                       (QCAR |x|))
                      (EXIT |x|))))))))))) 

(SDEFUN |FRAC;recip;$U;19| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) $))))) 

(SDEFUN |FRAC;cancelGcd| ((|x| $) ($ S))
        (SPROG ((|xd| #1=(|Union| S "failed")) (|xn| #1#) (|d| (S)))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 20))
                  (QCDR |x|))
                 (#2='T
                  (SEQ
                   (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 55))
                         . #3=(|FRAC;cancelGcd|))
                   (LETT |xn| (SPADCALL (QCAR |x|) |d| (QREFELT $ 30)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |xn| 1)
                      (|error| "gcd not gcd in QF cancelGcd (numerator)"))
                     (#2#
                      (SEQ
                       (LETT |xd| (SPADCALL (QCDR |x|) |d| (QREFELT $ 30))
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

(SDEFUN |FRAC;/;2S$;21| ((|nn| S) (|dd| S) ($ $))
        (SPROG ((|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
                 ('T
                  (SEQ
                   (|FRAC;cancelGcd|
                    (LETT |z| (CONS |nn| |dd|) |FRAC;/;2S$;21|) $)
                   (EXIT (|FRAC;normalize| |z| $)))))))) 

(SDEFUN |FRAC;+;3$;22| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ((SPADCALL |x| (QREFELT $ 13)) |y|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;+;3$;22|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 53))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 53))
                                (QREFELT $ 40))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 53))
                                  (QCDR |z|) (QREFELT $ 53)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;-;3$;23| ((|x| $) (|y| $) ($ $))
        (SPROG ((|g| ($)) (|d| (S)) (|z| ($)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
                      ('T
                       (SEQ
                        (LETT |z| (CONS (QCDR |x|) (QCDR |y|))
                              . #1=(|FRAC;-;3$;23|))
                        (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                        (LETT |g|
                              (CONS
                               (SPADCALL
                                (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 53))
                                (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 53))
                                (QREFELT $ 58))
                               |d|)
                              . #1#)
                        (|FRAC;cancelGcd| |g| $)
                        (PROGN
                         (RPLACD |g|
                                 (SPADCALL
                                  (SPADCALL (QCDR |g|) (QCAR |z|)
                                            (QREFELT $ 53))
                                  (QCDR |z|) (QREFELT $ 53)))
                         (QCDR |g|))
                        (EXIT (|FRAC;normalize| |g| $)))))))) 

(SDEFUN |FRAC;*;3$;24| ((|x| $) (|y| $) ($ $))
        (SPROG ((|#G37| ($)) (|#G36| ($)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT $ 13))
                      (SPADCALL |y| (QREFELT $ 13)))
                  (|spadConstant| $ 33))
                 ('T
                  (COND
                   ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 21)) |y|)
                   ((SPADCALL |y| (|spadConstant| $ 8) (QREFELT $ 21)) |x|)
                   ('T
                    (SEQ
                     (PROGN
                      (LETT |#G36| (CONS (QCAR |x|) (QCDR |y|))
                            . #1=(|FRAC;*;3$;24|))
                      (LETT |#G37| (CONS (QCAR |y|) (QCDR |x|)) . #1#)
                      (LETT |x| |#G36| . #1#)
                      (LETT |y| |#G37| . #1#))
                     (|FRAC;cancelGcd| |x| $) (|FRAC;cancelGcd| |y| $)
                     (EXIT
                      (|FRAC;normalize|
                       (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 53))
                             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 53)))
                       $)))))))))) 

(SDEFUN |FRAC;*;I2$;25| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL |n| (QREFELT $ 62)) (QCDR |x|))
                      |FRAC;*;I2$;25|)
                (|FRAC;cancelGcd| |y| $)
                (EXIT
                 (|FRAC;normalize|
                  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 53))
                        (QCDR |y|))
                  $))))) 

(SDEFUN |FRAC;*;S2$;26| ((|nn| S) (|x| $) ($ $))
        (SPROG ((|y| ($)))
               (SEQ (LETT |y| (CONS |nn| (QCDR |x|)) |FRAC;*;S2$;26|)
                    (|FRAC;cancelGcd| |y| $)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 53))
                            (QCDR |y|))
                      $))))) 

(SDEFUN |FRAC;differentiate;$M$;27| ((|x| $) (|deriv| |Mapping| S S) ($ $))
        (SPROG ((|d| (S)) (|#G45| (S)) (|#G44| (S)) (|y| ($)))
               (SEQ
                (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|))
                      . #1=(|FRAC;differentiate;$M$;27|))
                (LETT |d| (|FRAC;cancelGcd| |y| $) . #1#)
                (PROGN
                 (RPLACA |y|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR |x|) |deriv|) (QCDR |y|)
                                    (QREFELT $ 53))
                          (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 53))
                          (QREFELT $ 58)))
                 (QCAR |y|))
                (PROGN
                 (LETT |#G44| (QCDR |y|) . #1#)
                 (LETT |#G45| |d| . #1#)
                 (LETT |d| |#G44| . #1#)
                 (PROGN (RPLACD |y| |#G45|) (QCDR |y|)))
                (|FRAC;cancelGcd| |y| $)
                (PROGN
                 (RPLACD |y|
                         (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT $ 53)) |d|
                                   (QREFELT $ 53)))
                 (QCDR |y|))
                (EXIT (|FRAC;normalize| |y| $))))) 

(SDEFUN |FRAC;/;2S$;28| ((|nn| S) (|dd| S) ($ $))
        (COND ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
              ('T (CONS |nn| |dd|)))) 

(SDEFUN |FRAC;recip;$U;29| ((|x| $) ($ |Union| $ "failed"))
        (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
              ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(SDEFUN |FRAC;retract;$F;30| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 68))) 

(SDEFUN |FRAC;retractIfCan;$U;31|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 28))
                      |FRAC;retractIfCan;$U;31|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 71)))))))) 

(SDEFUN |FRAC;retract;$F;32| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 73)) (QREFELT $ 74))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 75)) (QREFELT $ 74))
                  (QREFELT $ 76))) 

(SDEFUN |FRAC;retractIfCan;$U;33|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Integer|) "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 73)) (QREFELT $ 78))
                      . #2=(|FRAC;retractIfCan;$U;33|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 75))
                                         (QREFELT $ 78))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 76))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) (|qq| . #1#) ($ . #1#))
        (SPROG
         ((|lc| (S)) (|g| (|SparseUnivariatePolynomial| S))
          (|qqD| #2=(|SparseUnivariatePolynomial| S)) (|denqq| (S))
          (#3=#:G787 NIL) (#4=#:G786 (S)) (#5=#:G788 (S)) (#6=#:G797 NIL)
          (|u| NIL) (|ppD| #2#) (|denpp| (S)) (#7=#:G783 NIL) (#8=#:G782 (S))
          (#9=#:G784 (S)) (#10=#:G796 NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 80)) |qq|)
                ((SPADCALL |qq| (QREFELT $ 80)) |pp|)
                ((OR (ZEROP (SPADCALL |pp| (QREFELT $ 82)))
                     (ZEROP (SPADCALL |qq| (QREFELT $ 82))))
                 (|spadConstant| $ 83))
                ('T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #7# NIL . #11=(|FRAC;gcdPolynomial;3Sup;34|))
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #10# (SPADCALL |pp| (QREFELT $ 85)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |u| (CAR #10#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9# (SPADCALL |u| (QREFELT $ 75))
                                       . #11#)
                                 (COND
                                  (#7#
                                   (LETT #8# (SPADCALL #8# #9# (QREFELT $ 86))
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
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 91))
                        . #11#)
                  (LETT |denqq|
                        (PROGN
                         (LETT #3# NIL . #11#)
                         (SEQ (LETT |u| NIL . #11#)
                              (LETT #6# (SPADCALL |qq| (QREFELT $ 85)) . #11#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |u| (CAR #6#) . #11#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |u| (QREFELT $ 75))
                                       . #11#)
                                 (COND
                                  (#3#
                                   (LETT #4# (SPADCALL #4# #5# (QREFELT $ 86))
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
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!1|
                               (VECTOR $ |denqq|))
                         |qq| (QREFELT $ 91))
                        . #11#)
                  (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT $ 93)) . #11#)
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |g| (QREFELT $ 94)))
                     (|spadConstant| $ 83))
                    (#12#
                     (SEQ (LETT |lc| (SPADCALL |g| (QREFELT $ 95)) . #11#)
                          (EXIT
                           (COND
                            ((SPADCALL |lc| (|spadConstant| $ 9)
                                       (QREFELT $ 20))
                             (SPADCALL (ELT $ 10) |g| (QREFELT $ 98)))
                            (#12#
                             (SPADCALL
                              (CONS #'|FRAC;gcdPolynomial;3Sup;34!2|
                                    (VECTOR $ |lc|))
                              |g| (QREFELT $ 98))))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!2| ((|x| NIL) ($$ NIL))
        (PROG (|lc| $)
          (LETT |lc| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;34|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT $ 56)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!1| ((|x| NIL) ($$ NIL))
        (PROG (|denqq| $)
          (LETT |denqq| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;34|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denqq| (QREFELT $ 87)) (QREFELT $ 26)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;34|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 87)) (QREFELT $ 26)))))) 

(SDEFUN |FRAC;charthRoot;$U;35| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|d| #2=(|Union| S #1#)) (|n| #2#))
               (SEQ
                (LETT |n| (SPADCALL (QCAR |x|) (QREFELT $ 100))
                      . #3=(|FRAC;charthRoot;$U;35|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ
                         (LETT |d| (SPADCALL (QCDR |x|) (QREFELT $ 100)) . #3#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#4#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 56))))))))))))) 

(SDEFUN |FRAC;charthRoot;$U;36| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (SPADCALL (SPADCALL (QREFELT $ 102))
                                                     1 (QREFELT $ 103))
                                           (QREFELT $ 104))
                                 (QREFELT $ 53))
                       (QREFELT $ 100))
                      |FRAC;charthRoot;$U;36|)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 56))))))))) 

(SDEFUN |FRAC;charthRoot;$U;37| ((|x| $) ($ |Union| $ #1="failed"))
        (SPROG ((|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (SPADCALL (SPADCALL (QREFELT $ 102))
                                                     1 (QREFELT $ 103))
                                           (QREFELT $ 104))
                                 (QREFELT $ 53))
                       (QREFELT $ 100))
                      |FRAC;charthRoot;$U;37|)
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT $ 56))))))))) 

(SDEFUN |FRAC;clear| ((|l| |List| $) ($ |List| S))
        (SPROG
         ((#1=#:G830 NIL) (#2=#:G837 NIL) (|x| NIL) (#3=#:G836 NIL) (|d| (S))
          (#4=#:G827 NIL) (#5=#:G826 (S)) (#6=#:G828 (S)) (#7=#:G835 NIL))
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
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 86)) . #8#))
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
                                                        (QREFELT $ 30))
                                              . #8#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (QREFELT $ 6)
                                                      (|Union| (QREFELT $ 6)
                                                               "failed")
                                                      #1#))
                                    (QREFELT $ 53))
                          #3#)
                         . #8#)))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |FRAC;conditionP;MU;39|
        ((|mat| |Matrix| . #1=($)) ($ |Union| (|Vector| . #1#) #2="failed"))
        (SPROG
         ((#3=#:G855 NIL) (#4=#:G857 NIL) (|i| NIL) (#5=#:G856 NIL)
          (|ansDD| (|Vector| S)) (|ansD| (|Union| (|Vector| S) #2#))
          (|matD| (|Matrix| S)) (#6=#:G854 NIL) (|l| NIL) (#7=#:G853 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL . #8=(|FRAC;conditionP;MU;39|))
                  (SEQ (LETT |l| NIL . #8#)
                       (LETT #6# (SPADCALL |mat| (QREFELT $ 107)) . #8#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |l| (CAR #6#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #7# (CONS (|FRAC;clear| |l| $) #7#) . #8#)))
                       (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT $ 110))
                . #8#)
          (LETT |ansD| (SPADCALL |matD| (QREFELT $ 113)) . #8#)
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
                                                         (QREFELT $ 115))
                                               (QREFELT $ 10)))))
                                    (LETT #3#
                                          (PROG1 (|inc_SI| #3#)
                                            (LETT |i| (|inc_SI| |i|) . #8#))
                                          . #8#)
                                    (GO G190) G191 (EXIT NIL))
                               #5#)))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G880 NIL) (|w| NIL) (#3=#:G879 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G859 NIL) (#5=#:G858 (S)) (#6=#:G860 (S)) (#7=#:G878 NIL)
          (|u| NIL))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 80)) (|spadConstant| $ 118))
                (#8='T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9=(|FRAC;factorPolynomial;SupF;40|))
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 85)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 75)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 86))
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
                         (CONS #'|FRAC;factorPolynomial;SupF;40!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 91))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 120)) . #9#)
                  (LETT |den1| (SPADCALL |denpp| (QREFELT $ 10)) . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 125)) . #9#)
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
                                                            (QREFELT $ 95))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 20))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 98)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 95))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            126))
                                                                  (QREFELT $
                                                                           127))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorPolynomial;SupF;40!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 98))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;40!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 128)) (QREFELT $ 98))
                    |lfact| (QREFELT $ 131))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;40|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;40|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;40|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 87)) (QREFELT $ 26)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPROG
         ((|lfact|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|SparseUnivariatePolynomial| $))
                      (|:| |xpnt| (|Integer|)))))
          (|den1| ($)) (|lc| ($)) (#2=#:G905 NIL) (|w| NIL) (#3=#:G904 NIL)
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|ppD| (|SparseUnivariatePolynomial| S)) (|denpp| (S))
          (#4=#:G885 NIL) (#5=#:G884 (S)) (#6=#:G886 (S)) (#7=#:G903 NIL)
          (|u| NIL) (|lcpp| ($)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT $ 80)) (|spadConstant| $ 118))
                ((EQL (SPADCALL |pp| (QREFELT $ 82)) 0)
                 (SPADCALL |pp| NIL (QREFELT $ 131)))
                (#8='T
                 (SEQ
                  (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 133))
                        . #9=(|FRAC;factorSquareFreePolynomial;SupF;41|))
                  (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT $ 134)) . #9#)
                  (LETT |denpp|
                        (PROGN
                         (LETT #4# NIL . #9#)
                         (SEQ (LETT |u| NIL . #9#)
                              (LETT #7# (SPADCALL |pp| (QREFELT $ 85)) . #9#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT $ 75)) . #9#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 86))
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
                         (CONS #'|FRAC;factorSquareFreePolynomial;SupF;41!0|
                               (VECTOR $ |denpp|))
                         |pp| (QREFELT $ 91))
                        . #9#)
                  (LETT |ff| (SPADCALL |ppD| (QREFELT $ 135)) . #9#)
                  (LETT |den1|
                        (SPADCALL (SPADCALL |denpp| (QREFELT $ 10)) |lcpp|
                                  (QREFELT $ 127))
                        . #9#)
                  (LETT |lfact|
                        (PROGN
                         (LETT #3# NIL . #9#)
                         (SEQ (LETT |w| NIL . #9#)
                              (LETT #2# (SPADCALL |ff| (QREFELT $ 125)) . #9#)
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
                                                            (QREFELT $ 95))
                                                  (|spadConstant| $ 9)
                                                  (QREFELT $ 20))
                                                 (SPADCALL (ELT $ 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT $ 98)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT $ 95))
                                                         (QREFELT $ 10))
                                                        . #9#)
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT $
                                                                            126))
                                                                  (QREFELT $
                                                                           127))
                                                        . #9#)
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorSquareFreePolynomial;SupF;41!1|
                                                     (VECTOR |lc| $))
                                                    (QVELT |w| 1)
                                                    (QREFELT $ 98))))))
                                               (QVELT |w| 2))
                                       #3#)
                                      . #9#)))
                              (LETT #2# (CDR #2#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #9#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorSquareFreePolynomial;SupF;41!2|
                           (VECTOR |den1| $))
                     (SPADCALL |ff| (QREFELT $ 128)) (QREFELT $ 98))
                    |lfact| (QREFELT $ 131))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!2| ((|x| NIL) ($$ NIL))
        (PROG ($ |den1|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;41|))
          (LETT |den1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!1| ((|x| NIL) ($$ NIL))
        (PROG ($ |lc|)
          (LETT $ (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;41|))
          (LETT |lc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| $)
          (LETT |denpp| (QREFELT $$ 1)
                . #1=(|FRAC;factorSquareFreePolynomial;SupF;41|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 87)) (QREFELT $ 26)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction| (#1=#:G930)
  (SPROG NIL
         (PROG (#2=#:G931)
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
   ((|pv$| NIL) (#1=#:G925 NIL) (#2=#:G926 NIL) (#3=#:G927 NIL) (#4=#:G929 NIL)
    (#5=#:G928 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|Fraction|))
    (LETT |dv$| (LIST '|Fraction| DV$1) . #6#)
    (LETT $ (GETREFV 168) . #6#)
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
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
                                        (OR #1# #4#)
                                        (|HasCategory| |#1|
                                                       '(|UniqueFactorizationDomain|))))
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
     ((|testBitVector| |pv$| 32)
      (QSETREFV $ 19
                (CONS (|dispatchFunction| |FRAC;factorFraction;$F;3|) $))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (PROGN
         (QSETREFV $ 21 (CONS (|dispatchFunction| |FRAC;=;2$B;4|) $))
         (QSETREFV $ 24
                   (CONS (|dispatchFunction| |FRAC;hashUpdate!;Hs$Hs;5|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |FRAC;one?;$B;6|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |FRAC;retract;$S;7|) $))
         (QSETREFV $ 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;8|) $))))
       ('T
        (PROGN
         (QSETREFV $ 26 (CONS (|dispatchFunction| |FRAC;retract;$S;9|) $))
         (QSETREFV $ 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;10|) $))))))
     ('T
      (PROGN
       (QSETREFV $ 26 (CONS (|dispatchFunction| |FRAC;retract;$S;11|) $))
       (QSETREFV $ 28
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;12|) $)))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV $ 32 (CONS (|dispatchFunction| |FRAC;wholePart;$S;13|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 39 (CONS (|dispatchFunction| |FRAC;floor;$S;14|) $))
       (QSETREFV $ 37 (CONS (|dispatchFunction| |FRAC;ceiling;$S;15|) $))
       (COND
        ((|HasCategory| |#1| '(|OpenMath|))
         (PROGN
          (QSETREFV $ 50
                    (CONS (|dispatchFunction| |FRAC;OMwrite;Omd$BV;17|)
                          $))))))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (PROGN
       (QSETREFV $ 54 (CONS (|dispatchFunction| |FRAC;recip;$U;19|) $))
       (QSETREFV $ 56 (CONS (|dispatchFunction| |FRAC;/;2S$;21|) $))
       (QSETREFV $ 57 (CONS (|dispatchFunction| |FRAC;+;3$;22|) $))
       (QSETREFV $ 59 (CONS (|dispatchFunction| |FRAC;-;3$;23|) $))
       (QSETREFV $ 60 (CONS (|dispatchFunction| |FRAC;*;3$;24|) $))
       (QSETREFV $ 63 (CONS (|dispatchFunction| |FRAC;*;I2$;25|) $))
       (QSETREFV $ 64 (CONS (|dispatchFunction| |FRAC;*;S2$;26|) $))
       (QSETREFV $ 66
                 (CONS (|dispatchFunction| |FRAC;differentiate;$M$;27|) $))))
     ('T
      (PROGN
       (QSETREFV $ 56 (CONS (|dispatchFunction| |FRAC;/;2S$;28|) $))
       (QSETREFV $ 54 (CONS (|dispatchFunction| |FRAC;recip;$U;29|) $)))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV $ 69 (CONS (|dispatchFunction| |FRAC;retract;$F;30|) $))
       (QSETREFV $ 72
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;31|) $))))
     ((|testBitVector| |pv$| 30)
      (PROGN
       (QSETREFV $ 69 (CONS (|dispatchFunction| |FRAC;retract;$F;32|) $))
       (QSETREFV $ 72
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;33|) $)))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV $ 99
                (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;34|) $))))
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
              (QSETREFV $ 101
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;35|) $)))
             ('T
              (QSETREFV $ 101
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;36|)
                              $)))))
           ('T
            (QSETREFV $ 101
                      (CONS (|dispatchFunction| |FRAC;charthRoot;$U;37|) $))))
          NIL
          NIL
          (QSETREFV $ 116
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;39|) $)))))
       (QSETREFV $ 132
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;40|) $))
       (QSETREFV $ 136
                 (CONS
                  (|dispatchFunction|
                   |FRAC;factorSquareFreePolynomial;SupF;41|)
                  $)))))
    $))) 

(MAKEPROP '|Fraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|LocalAlgebra| 6 6) (|local| |#1|) '|Rep|
              (0 . |One|) (4 . |One|) |FRAC;coerce;S$;1| (|Boolean|)
              (8 . |zero?|) |FRAC;zero?;$B;2| (|Factored| $) (13 . |factor|)
              (|Factored| 6) (|Fraction| 16) (18 . /) (24 . |factorFraction|)
              (29 . =) (35 . =) (|HashState|) (41 . |hashUpdate!|)
              (47 . |hashUpdate!|) (53 . |one?|) (58 . |retract|)
              (|Union| 6 '"failed") (63 . |retractIfCan|) (|Union| $ '"failed")
              (68 . |exquo|) (74 . |quo|) (80 . |wholePart|) (85 . |Zero|)
              (89 . |Zero|) (93 . <) (99 . -) (104 . |ceiling|) (109 . -)
              (114 . |floor|) (119 . +) (|Void|) (|OpenMathDevice|)
              (125 . |OMputApp|) (|String|) (130 . |OMputSymbol|)
              (137 . |OMwrite|) (144 . |OMputEndApp|) (149 . |OMputObject|)
              (154 . |OMputEndObject|) (159 . |OMwrite|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (166 . |unitNormal|) (171 . *) (177 . |recip|) (182 . |gcd|)
              (188 . /) (194 . +) (200 . -) (206 . -) (212 . *) (|Integer|)
              (218 . |coerce|) (223 . *) (229 . *) (|Mapping| 6 6)
              (235 . |differentiate|) (|Fraction| 61) (241 . |retract|)
              (246 . |retract|) (|Union| 67 '#1="failed")
              (251 . |retractIfCan|) (256 . |retractIfCan|) (261 . |numer|)
              (266 . |retract|) (271 . |denom|) (276 . /) (|Union| 61 '#1#)
              (282 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (287 . |zero?|) (|NonNegativeInteger|) (292 . |degree|)
              (297 . |One|) (|List| $$) (301 . |coefficients|) (306 . |lcm|)
              (312 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 79 6 88)
              (318 . |map|) (|SparseUnivariatePolynomial| $)
              (324 . |gcdPolynomial|) (330 . |degree|)
              (335 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 88 $$ 79)
              (340 . |map|) (346 . |gcdPolynomial|) (352 . |charthRoot|)
              (357 . |charthRoot|) (362 . |characteristic|) (366 . -) (372 . ^)
              (|List| 84) (|Matrix| $$) (378 . |listOfLists|) (|List| 142)
              (|Matrix| 6) (383 . |matrix|) (|Union| 147 '#2="failed")
              (|Matrix| $) (388 . |conditionP|) (|Vector| 6) (393 . |elt|)
              (399 . |conditionP|) (|Factored| 79) (404 . |Zero|)
              (|Factored| 92) (408 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 121) (|:| |fctr| 88) (|:| |xpnt| 61))
              (|List| 122) (|Factored| 88) (413 . |factorList|) (418 . ^)
              (424 . /) (430 . |unit|)
              (|Record| (|:| |flg| 121) (|:| |fctr| 79) (|:| |xpnt| 61))
              (|List| 129) (435 . |makeFR|) (441 . |factorPolynomial|)
              (446 . |leadingCoefficient|) (451 . /)
              (457 . |factorSquareFreePolynomial|)
              (462 . |factorSquareFreePolynomial|) (|InputForm|)
              (|Pattern| 153) (|Pattern| 61) (|List| 141) (|Equation| 6)
              (|List| 6) (|List| 144) (|Symbol|) (|Matrix| 61)
              (|Record| (|:| |mat| 145) (|:| |vec| (|Vector| 61))) (|Vector| $)
              (|List| 81) (|PatternMatchResult| 153 $)
              (|PatternMatchResult| 61 $) (|Union| 152 '#2#) (|List| 92)
              (|Float|) (|DoubleFloat|) (|Union| 144 '#1#)
              (|Record| (|:| |mat| 109) (|:| |vec| 114))
              (|Union| 158 '#3="failed") (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 160 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 158) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|) (|OutputForm|))
           '#(~= 467 |zero?| 473 |wholePart| 478 |unitNormal| 483
              |unitCanonical| 488 |unit?| 493 |subtractIfCan| 498
              |squareFreePolynomial| 504 |squareFreePart| 509 |squareFree| 514
              |solveLinearPolynomialEquation| 519 |smaller?| 525 |sizeLess?|
              531 |sign| 537 |sample| 542 |rightRecip| 546 |rightPower| 551
              |retractIfCan| 563 |retract| 583 |rem| 603 |reducedSystem| 609
              |recip| 631 |quo| 636 |principalIdeal| 642 |prime?| 647
              |positive?| 652 |patternMatch| 657 |opposite?| 671 |one?| 677
              |numerator| 682 |numer| 687 |nextItem| 692 |negative?| 697
              |multiEuclidean| 702 |min| 708 |max| 714 |map| 720 |leftRecip|
              726 |leftPower| 731 |lcmCoef| 743 |lcm| 749 |latex| 760 |inv| 765
              |init| 770 |hashUpdate!| 774 |hash| 780 |gcdPolynomial| 785 |gcd|
              791 |fractionPart| 802 |floor| 807 |factorSquareFreePolynomial|
              812 |factorPolynomial| 817 |factorFraction| 822 |factor| 827
              |extendedEuclidean| 832 |exquo| 845 |expressIdealMember| 851
              |eval| 857 |euclideanSize| 897 |elt| 902 |divide| 908
              |differentiate| 914 |denominator| 964 |denom| 969 |convert| 974
              |conditionP| 999 |commutator| 1004 |coerce| 1010 |charthRoot|
              1040 |characteristic| 1045 |ceiling| 1049 |associator| 1054
              |associates?| 1061 |antiCommutator| 1067 |annihilate?| 1073 |abs|
              1079 ^ 1084 |Zero| 1102 |One| 1106 |OMwrite| 1110 D 1134 >= 1184
              > 1190 = 1196 <= 1202 < 1208 / 1214 - 1226 + 1237 * 1243)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 0 0 1 0 0 0 6 0 0 0 0 0 0 6 0 0 0 0 0 3 4
                                  13 14 15 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0
                                  0 6 0 6 0 0 0 6 0 0 0 0 0 8 0 0 0 29 9 17 25
                                  0 0 0 5 11 0 0 0 0 0 0 0 0 0 2 27 5 5 7 31 31
                                  10 11 12 16 24 18 23))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |FullyLinearlyExplicitOver&| |DifferentialExtension&|
                |DivisionRing&| NIL NIL |OrderedRing&| NIL |Algebra&|
                |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |OrderedSet&| |FullyEvalableOver&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL NIL |SetCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| NIL NIL NIL |PartialOrder&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL |OpenMath&|)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|DifferentialExtension| 6)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|OrderedRing|) (|LinearlyExplicitOver| 6) (|Algebra| 6)
                 (|Algebra| 67) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 144) (|DifferentialRing|)
                 (|LinearlyExplicitOver| 61) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| 6) (|Module| 67) (|Module| $$) (|SemiRng|)
                 (|BiModule| 6 6) (|BiModule| 67 67) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianGroup|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 67)
                 (|LeftModule| 67) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 6)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|FullyEvalableOver| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|PatternMatchable| 153) (|PatternMatchable| 61)
                 (|Patternable| 6) (|CommutativeStar|) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 6) (|Type|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 167) (|RetractableTo| 144)
                 (|ConvertibleTo| 137) (|ConvertibleTo| 154)
                 (|ConvertibleTo| 153) (|PartialOrder|) (|RetractableTo| 67)
                 (|RetractableTo| 61) (|InnerEvalable| 144 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 138)
                 (|ConvertibleTo| 139) (|Canonical|) (|OpenMath|))
              (|makeByteWordVec2| 167
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 1 6 14 0 15 2
                                    17 0 16 16 18 1 0 17 0 19 2 6 11 0 0 20 2 0
                                    11 0 0 21 2 6 22 22 0 23 2 0 22 22 0 24 1 0
                                    11 0 25 1 0 6 0 26 1 0 27 0 28 2 6 29 0 0
                                    30 2 6 0 0 0 31 1 0 6 0 32 0 0 0 33 0 6 0
                                    34 2 0 11 0 0 35 1 0 0 0 36 1 0 6 0 37 1 6
                                    0 0 38 1 0 6 0 39 2 6 0 0 0 40 1 42 41 0 43
                                    3 42 41 0 44 44 45 3 6 41 42 0 11 46 1 42
                                    41 0 47 1 42 41 0 48 1 42 41 0 49 3 0 41 42
                                    0 11 50 1 6 51 0 52 2 6 0 0 0 53 1 0 29 0
                                    54 2 6 0 0 0 55 2 0 0 6 6 56 2 0 0 0 0 57 2
                                    6 0 0 0 58 2 0 0 0 0 59 2 0 0 0 0 60 1 6 0
                                    61 62 2 0 0 61 0 63 2 0 0 6 0 64 2 0 0 0 65
                                    66 1 6 67 0 68 1 0 67 0 69 1 6 70 0 71 1 0
                                    70 0 72 1 0 6 0 73 1 6 61 0 74 1 0 6 0 75 2
                                    67 0 61 61 76 1 6 77 0 78 1 79 11 0 80 1 79
                                    81 0 82 0 79 0 83 1 79 84 0 85 2 6 0 0 0 86
                                    2 0 0 0 6 87 2 90 88 89 79 91 2 6 92 92 92
                                    93 1 88 81 0 94 1 88 6 0 95 2 97 79 96 88
                                    98 2 0 92 92 92 99 1 6 29 0 100 1 0 29 0
                                    101 0 0 81 102 2 81 0 0 0 103 2 6 0 0 81
                                    104 1 106 105 0 107 1 109 0 108 110 1 6 111
                                    112 113 2 114 6 0 61 115 1 0 111 112 116 0
                                    117 0 118 1 6 119 92 120 1 124 123 0 125 2
                                    0 0 0 61 126 2 0 0 0 0 127 1 124 88 0 128 2
                                    117 0 79 130 131 1 0 119 92 132 1 79 2 0
                                    133 2 79 0 0 2 134 1 6 119 92 135 1 0 119
                                    92 136 2 0 11 0 0 1 1 0 11 0 13 1 21 6 0 32
                                    1 0 51 0 1 1 0 0 0 1 1 0 11 0 1 2 0 29 0 0
                                    1 1 1 119 92 1 1 0 0 0 1 1 0 14 0 1 2 1 151
                                    152 92 1 2 28 11 0 0 1 2 0 11 0 0 1 1 6 61
                                    0 1 0 0 0 1 1 0 29 0 1 2 0 0 0 81 1 2 0 0 0
                                    165 1 1 30 77 0 1 1 30 70 0 72 1 2 155 0 1
                                    1 0 27 0 28 1 30 61 0 1 1 30 67 0 69 1 2
                                    144 0 1 1 0 6 0 26 2 0 0 0 0 1 1 15 145 112
                                    1 2 15 146 112 147 1 2 0 156 112 147 1 1 0
                                    109 112 1 1 0 29 0 54 2 0 0 0 0 1 1 0 163
                                    158 1 1 0 11 0 1 1 6 11 0 1 3 17 149 0 138
                                    149 1 3 20 150 0 139 150 1 2 0 11 0 0 1 1 0
                                    11 0 25 1 0 0 0 1 1 0 6 0 73 1 9 29 0 1 1 6
                                    11 0 1 2 0 157 158 0 1 2 7 0 0 0 1 2 7 0 0
                                    0 1 2 0 0 65 0 1 1 0 29 0 1 2 0 0 0 81 1 2
                                    0 0 0 165 1 2 0 164 0 0 1 1 0 0 158 1 2 0 0
                                    0 0 1 1 0 44 0 1 1 0 0 0 1 0 9 0 1 2 0 22
                                    22 0 24 1 0 166 0 1 2 0 92 92 92 99 2 0 0 0
                                    0 1 1 0 0 158 1 1 21 0 0 1 1 22 6 0 39 1 1
                                    119 92 136 1 1 119 92 132 1 32 17 0 19 1 0
                                    14 0 1 2 0 159 0 0 1 3 0 161 0 0 0 1 2 0 29
                                    0 0 1 2 0 157 158 0 1 2 11 0 0 140 1 3 11 0
                                    0 6 6 1 2 11 0 0 141 1 3 11 0 0 142 142 1 3
                                    10 0 0 143 142 1 3 10 0 0 144 6 1 1 0 81 0
                                    1 2 12 0 0 6 1 2 0 162 0 0 1 2 14 0 0 81 1
                                    1 14 0 0 1 3 13 0 0 143 148 1 3 13 0 0 144
                                    81 1 2 13 0 0 144 1 2 13 0 0 143 1 2 0 0 0
                                    65 66 3 0 0 0 65 81 1 1 0 0 0 1 1 0 6 0 75
                                    1 26 137 0 1 1 16 138 0 1 1 19 139 0 1 1 5
                                    153 0 1 1 5 154 0 1 1 33 111 112 116 2 0 0
                                    0 0 1 1 2 0 144 1 1 0 0 6 10 1 0 0 67 1 1 0
                                    0 0 1 1 0 0 61 1 1 0 167 0 1 1 34 29 0 101
                                    0 0 81 102 1 22 6 0 37 3 0 0 0 0 0 1 2 0 11
                                    0 0 1 2 0 0 0 0 1 2 0 11 0 0 1 1 6 0 0 1 2
                                    0 0 0 61 126 2 0 0 0 81 1 2 0 0 0 165 1 0 0
                                    0 33 0 0 0 8 1 23 44 0 1 2 23 41 42 0 1 2
                                    23 44 0 11 1 3 23 41 42 0 11 50 2 14 0 0 81
                                    1 1 14 0 0 1 3 13 0 0 143 148 1 2 13 0 0
                                    143 1 3 13 0 0 144 81 1 2 13 0 0 144 1 2 0
                                    0 0 65 1 3 0 0 0 65 81 1 2 7 11 0 0 1 2 7
                                    11 0 0 1 2 0 11 0 0 21 2 7 11 0 0 1 2 7 11
                                    0 0 35 2 0 0 6 6 56 2 0 0 0 0 127 1 0 0 0
                                    36 2 0 0 0 0 59 2 0 0 0 0 57 2 0 0 6 0 64 2
                                    0 0 0 6 87 2 0 0 0 67 1 2 0 0 67 0 1 2 0 0
                                    81 0 1 2 0 0 61 0 63 2 0 0 0 0 60 2 0 0 165
                                    0 1)))))
           '|lookupComplete|)) 
