
(DEFUN |FRAC;coerce;S$;1| (|d| $) (CONS |d| (|spadConstant| $ 9))) 

(DEFUN |FRAC;zero?;$B;2| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 12))) 

(DEFUN |FRAC;retract;$S;3| (|x| $)
  (COND ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
        ('T (|error| "Denominator not equal to 1")))) 

(DEFUN |FRAC;retractIfCan;$U;4| (|x| $)
  (COND
   ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
    (CONS 0 (QCAR |x|)))
   ('T (CONS 1 "failed")))) 

(DEFUN |FRAC;retract;$S;5| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))
            |FRAC;retract;$S;5|)
      (EXIT
       (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
             ('T (QCDR |a|)))))))) 

(DEFUN |FRAC;retractIfCan;$U;6| (|x| $)
  (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))) 

(DEFUN |FRAC;retract;$S;7| (|x| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))
            |FRAC;retract;$S;7|)
      (EXIT
       (COND ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
             ('T (QCDR |a|)))))))) 

(DEFUN |FRAC;retractIfCan;$U;8| (|x| $)
  (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 19))) 

(DEFUN |FRAC;wholePart;$S;9| (|x| $)
  (COND ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
        ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 20))))) 

(DEFUN |FRAC;floor;$S;10| (|x| $)
  (COND ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
        ((SPADCALL |x| (|spadConstant| $ 22) (QREFELT $ 24))
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 26))
                   (QREFELT $ 27)))
        ('T (SPADCALL |x| (QREFELT $ 21))))) 

(DEFUN |FRAC;ceiling;$S;11| (|x| $)
  (COND ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCAR |x|))
        ((SPADCALL |x| (|spadConstant| $ 22) (QREFELT $ 24))
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 28))
                   (QREFELT $ 27)))
        ('T
         (SPADCALL (|spadConstant| $ 9) (SPADCALL |x| (QREFELT $ 21))
                   (QREFELT $ 29))))) 

(DEFUN |FRAC;writeOMFrac| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 32))
       (SPADCALL |dev| "nums1" "rational" (QREFELT $ 34))
       (SPADCALL |dev| (QCAR |x|) 'NIL (QREFELT $ 35))
       (SPADCALL |dev| (QCDR |x|) 'NIL (QREFELT $ 35))
       (EXIT (SPADCALL |dev| (QREFELT $ 36))))) 

(DEFUN |FRAC;OMwrite;$S;13| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|FRAC;OMwrite;$S;13|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 38)) (QREFELT $ 39))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 40)) (|FRAC;writeOMFrac| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 41)) (SPADCALL |dev| (QREFELT $ 42))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |FRAC;OMwrite;$BS;14| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|FRAC;OMwrite;$BS;14|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 38)) (QREFELT $ 39))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 40))))
          (|FRAC;writeOMFrac| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 41))))
          (SPADCALL |dev| (QREFELT $ 42))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |FRAC;OMwrite;Omd$V;15| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 40)) (|FRAC;writeOMFrac| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 41))))) 

(DEFUN |FRAC;OMwrite;Omd$BV;16| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 40))))
       (|FRAC;writeOMFrac| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 41))))))) 

(DEFUN |FRAC;normalize| (|x| $)
  (PROG (|uca|)
    (RETURN
     (SEQ
      (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (|spadConstant| $ 22))
            ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) |x|)
            (#1='T
             (SEQ
              (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT $ 48))
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
                                     (QREFELT $ 49)))
                   (QCAR |x|))
                  (EXIT |x|)))))))))))) 

(DEFUN |FRAC;recip;$U;18| (|x| $)
  (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
        ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) $))))) 

(DEFUN |FRAC;cancelGcd| (|x| $)
  (PROG (|xd| |xn| |d|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)) (QCDR |x|))
       (#1='T
        (SEQ
         (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT $ 51))
               . #2=(|FRAC;cancelGcd|))
         (LETT |xn| (SPADCALL (QCAR |x|) |d| (QREFELT $ 19)) . #2#)
         (EXIT
          (COND
           ((QEQCAR |xn| 1)
            (|error| "gcd not gcd in QF cancelGcd (numerator)"))
           (#1#
            (SEQ (LETT |xd| (SPADCALL (QCDR |x|) |d| (QREFELT $ 19)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |xd| 1)
                    (|error| "gcd not gcd in QF cancelGcd (denominator)"))
                   (#1#
                    (SEQ (PROGN (RPLACA |x| (QCDR |xn|)) (QCAR |x|))
                         (PROGN (RPLACD |x| (QCDR |xd|)) (QCDR |x|))
                         (EXIT |d|)))))))))))))))) 

(DEFUN |FRAC;/;2S$;20| (|nn| |dd| $)
  (PROG (|z|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
            ('T
             (SEQ
              (|FRAC;cancelGcd| (LETT |z| (CONS |nn| |dd|) |FRAC;/;2S$;20|) $)
              (EXIT (|FRAC;normalize| |z| $))))))))) 

(DEFUN |FRAC;+;3$;21| (|x| |y| $)
  (PROG (|g| |d| |z|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
            ((SPADCALL |x| (QREFELT $ 13)) |y|)
            ('T
             (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)) . #1=(|FRAC;+;3$;21|))
                  (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                  (LETT |g|
                        (CONS
                         (SPADCALL
                          (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 49))
                          (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 49))
                          (QREFELT $ 29))
                         |d|)
                        . #1#)
                  (|FRAC;cancelGcd| |g| $)
                  (PROGN
                   (RPLACD |g|
                           (SPADCALL
                            (SPADCALL (QCDR |g|) (QCAR |z|) (QREFELT $ 49))
                            (QCDR |z|) (QREFELT $ 49)))
                   (QCDR |g|))
                  (EXIT (|FRAC;normalize| |g| $))))))))) 

(DEFUN |FRAC;-;3$;22| (|x| |y| $)
  (PROG (|g| |d| |z|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |y| (QREFELT $ 13)) |x|)
            ('T
             (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)) . #1=(|FRAC;-;3$;22|))
                  (LETT |d| (|FRAC;cancelGcd| |z| $) . #1#)
                  (LETT |g|
                        (CONS
                         (SPADCALL
                          (SPADCALL (QCDR |z|) (QCAR |x|) (QREFELT $ 49))
                          (SPADCALL (QCAR |z|) (QCAR |y|) (QREFELT $ 49))
                          (QREFELT $ 54))
                         |d|)
                        . #1#)
                  (|FRAC;cancelGcd| |g| $)
                  (PROGN
                   (RPLACD |g|
                           (SPADCALL
                            (SPADCALL (QCDR |g|) (QCAR |z|) (QREFELT $ 49))
                            (QCDR |z|) (QREFELT $ 49)))
                   (QCDR |g|))
                  (EXIT (|FRAC;normalize| |g| $))))))))) 

(DEFUN |FRAC;*;3$;23| (|x| |y| $)
  (PROG (|#G36| |#G35|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |y| (QREFELT $ 13)))
        (|spadConstant| $ 22))
       ('T
        (COND ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 56)) |y|)
              ((SPADCALL |y| (|spadConstant| $ 8) (QREFELT $ 56)) |x|)
              ('T
               (SEQ
                (PROGN
                 (LETT |#G35| (CONS (QCAR |x|) (QCDR |y|))
                       . #1=(|FRAC;*;3$;23|))
                 (LETT |#G36| (CONS (QCAR |y|) (QCDR |x|)) . #1#)
                 (LETT |x| |#G35| . #1#)
                 (LETT |y| |#G36| . #1#))
                (|FRAC;cancelGcd| |x| $) (|FRAC;cancelGcd| |y| $)
                (EXIT
                 (|FRAC;normalize|
                  (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 49))
                        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 49)))
                  $))))))))))) 

(DEFUN |FRAC;*;I2$;24| (|n| |x| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (LETT |y| (CONS (SPADCALL |n| (QREFELT $ 59)) (QCDR |x|))
            |FRAC;*;I2$;24|)
      (|FRAC;cancelGcd| |y| $)
      (EXIT
       (|FRAC;normalize|
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 49)) (QCDR |y|))
        $)))))) 

(DEFUN |FRAC;*;S2$;25| (|nn| |x| $)
  (PROG (|y|)
    (RETURN
     (SEQ (LETT |y| (CONS |nn| (QCDR |x|)) |FRAC;*;S2$;25|)
          (|FRAC;cancelGcd| |y| $)
          (EXIT
           (|FRAC;normalize|
            (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 49)) (QCDR |y|))
            $)))))) 

(DEFUN |FRAC;differentiate;$M$;26| (|x| |deriv| $)
  (PROG (|d| |#G44| |#G43| |y|)
    (RETURN
     (SEQ
      (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|))
            . #1=(|FRAC;differentiate;$M$;26|))
      (LETT |d| (|FRAC;cancelGcd| |y| $) . #1#)
      (PROGN
       (RPLACA |y|
               (SPADCALL
                (SPADCALL (SPADCALL (QCAR |x|) |deriv|) (QCDR |y|)
                          (QREFELT $ 49))
                (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 49))
                (QREFELT $ 54)))
       (QCAR |y|))
      (PROGN
       (LETT |#G43| (QCDR |y|) . #1#)
       (LETT |#G44| |d| . #1#)
       (LETT |d| |#G43| . #1#)
       (PROGN (RPLACD |y| |#G44|) (QCDR |y|)))
      (|FRAC;cancelGcd| |y| $)
      (PROGN
       (RPLACD |y|
               (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT $ 49)) |d|
                         (QREFELT $ 49)))
       (QCDR |y|))
      (EXIT (|FRAC;normalize| |y| $)))))) 

(DEFUN |FRAC;=;2$B;27| (|x| |y| $)
  (COND
   ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 14))
    (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 14)))
   ('T 'NIL))) 

(DEFUN |FRAC;one?;$B;28| (|x| $)
  (COND
   ((SPADCALL (QCAR |x|) (|spadConstant| $ 9) (QREFELT $ 14))
    (SPADCALL (QCDR |x|) (|spadConstant| $ 9) (QREFELT $ 14)))
   ('T 'NIL))) 

(DEFUN |FRAC;/;2S$;29| (|nn| |dd| $)
  (COND ((SPADCALL |dd| (QREFELT $ 12)) (|error| "division by zero"))
        ('T (CONS |nn| |dd|)))) 

(DEFUN |FRAC;recip;$U;30| (|x| $)
  (COND ((SPADCALL (QCAR |x|) (QREFELT $ 12)) (CONS 1 "failed"))
        ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(DEFUN |FRAC;retract;$F;31| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 66))) 

(DEFUN |FRAC;retractIfCan;$U;32| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 17)) |FRAC;retractIfCan;$U;32|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |u|) (QREFELT $ 69))))))))) 

(DEFUN |FRAC;retract;$F;33| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 71)) (QREFELT $ 72))
            (SPADCALL (SPADCALL |x| (QREFELT $ 73)) (QREFELT $ 72))
            (QREFELT $ 74))) 

(DEFUN |FRAC;retractIfCan;$U;34| (|x| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 71)) (QREFELT $ 76))
            . #1=(|FRAC;retractIfCan;$U;34|))
      (EXIT
       (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |d|
                     (SPADCALL (SPADCALL |x| (QREFELT $ 73)) (QREFELT $ 76))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |n|) (QCDR |d|)
                                       (QREFELT $ 74)))))))))))))) 

(DEFUN |FRAC;gcdPolynomial;3Sup;35| (|pp| |qq| $)
  (PROG (|lc| |g| |qqD| |denqq| #1=#:G771 #2=#:G770 #3=#:G772 #4=#:G781 |u|
         |ppD| |denpp| #5=#:G767 #6=#:G766 #7=#:G768 #8=#:G780)
    (RETURN
     (SEQ
      (COND ((SPADCALL |pp| (QREFELT $ 78)) |qq|)
            ((SPADCALL |qq| (QREFELT $ 78)) |pp|)
            ((OR (ZEROP (SPADCALL |pp| (QREFELT $ 80)))
                 (ZEROP (SPADCALL |qq| (QREFELT $ 80))))
             (|spadConstant| $ 81))
            ('T
             (SEQ
              (LETT |denpp|
                    (PROGN
                     (LETT #5# NIL . #9=(|FRAC;gcdPolynomial;3Sup;35|))
                     (SEQ (LETT |u| NIL . #9#)
                          (LETT #8# (SPADCALL |pp| (QREFELT $ 83)) . #9#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |u| (CAR #8#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #7# (SPADCALL |u| (QREFELT $ 73)) . #9#)
                             (COND
                              (#5#
                               (LETT #6# (SPADCALL #6# #7# (QREFELT $ 84))
                                     . #9#))
                              ('T
                               (PROGN
                                (LETT #6# #7# . #9#)
                                (LETT #5# 'T . #9#)))))))
                          (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #6#) (#10='T (|spadConstant| $ 9))))
                    . #9#)
              (LETT |ppD|
                    (SPADCALL
                     (CONS #'|FRAC;gcdPolynomial;3Sup;35!0| (VECTOR $ |denpp|))
                     |pp| (QREFELT $ 89))
                    . #9#)
              (LETT |denqq|
                    (PROGN
                     (LETT #1# NIL . #9#)
                     (SEQ (LETT |u| NIL . #9#)
                          (LETT #4# (SPADCALL |qq| (QREFELT $ 83)) . #9#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |u| (CAR #4#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL |u| (QREFELT $ 73)) . #9#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 84))
                                     . #9#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #9#)
                                (LETT #1# 'T . #9#)))))))
                          (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#10# (|spadConstant| $ 9))))
                    . #9#)
              (LETT |qqD|
                    (SPADCALL
                     (CONS #'|FRAC;gcdPolynomial;3Sup;35!1| (VECTOR $ |denqq|))
                     |qq| (QREFELT $ 89))
                    . #9#)
              (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT $ 91)) . #9#)
              (EXIT
               (COND
                ((ZEROP (SPADCALL |g| (QREFELT $ 92))) (|spadConstant| $ 81))
                (#10#
                 (SEQ (LETT |lc| (SPADCALL |g| (QREFELT $ 93)) . #9#)
                      (EXIT
                       (COND
                        ((SPADCALL |lc| (|spadConstant| $ 9) (QREFELT $ 14))
                         (SPADCALL (ELT $ 10) |g| (QREFELT $ 96)))
                        (#10#
                         (SPADCALL
                          (CONS #'|FRAC;gcdPolynomial;3Sup;35!2|
                                (VECTOR $ |lc|))
                          |g| (QREFELT $ 96)))))))))))))))) 

(DEFUN |FRAC;gcdPolynomial;3Sup;35!2| (|x| $$)
  (PROG (|lc| $)
    (LETT |lc| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;35|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT $ 52)))))) 

(DEFUN |FRAC;gcdPolynomial;3Sup;35!1| (|x| $$)
  (PROG (|denqq| $)
    (LETT |denqq| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;35|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| |denqq| (QREFELT $ 85)) (QREFELT $ 15)))))) 

(DEFUN |FRAC;gcdPolynomial;3Sup;35!0| (|x| $$)
  (PROG (|denpp| $)
    (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;gcdPolynomial;3Sup;35|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 85)) (QREFELT $ 15)))))) 

(DEFUN |FRAC;charthRoot;$U;36| (|x| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (QCAR |x|) (QREFELT $ 98))
            . #1=(|FRAC;charthRoot;$U;36|))
      (EXIT
       (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ (LETT |d| (SPADCALL (QCDR |x|) (QREFELT $ 98)) . #1#)
                   (EXIT
                    (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                          (#2#
                           (CONS 0
                                 (SPADCALL (QCDR |n|) (QCDR |d|)
                                           (QREFELT $ 52)))))))))))))) 

(DEFUN |FRAC;charthRoot;$U;37| (|x| $)
  (PROG (|ans| #1=#:G805)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL
             (SPADCALL (QCAR |x|)
                       (SPADCALL (QCDR |x|)
                                 (PROG1
                                     (LETT #1# (- (SPADCALL (QREFELT $ 100)) 1)
                                           . #2=(|FRAC;charthRoot;$U;37|))
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 (QREFELT $ 101))
                       (QREFELT $ 49))
             (QREFELT $ 98))
            . #2#)
      (EXIT
       (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
             ('T
              (CONS 0 (SPADCALL (QCDR |ans|) (QCDR |x|) (QREFELT $ 52)))))))))) 

(DEFUN |FRAC;charthRoot;$U;38| (|x| $)
  (PROG (|ans| #1=#:G824)
    (RETURN
     (SEQ
      (LETT |ans|
            (SPADCALL
             (SPADCALL (QCAR |x|)
                       (SPADCALL (QCDR |x|)
                                 (PROG1
                                     (LETT #1# (- (SPADCALL (QREFELT $ 100)) 1)
                                           . #2=(|FRAC;charthRoot;$U;38|))
                                   (|check_subtype| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                 (QREFELT $ 101))
                       (QREFELT $ 49))
             (QREFELT $ 98))
            . #2#)
      (EXIT
       (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
             ('T
              (CONS 0 (SPADCALL (QCDR |ans|) (QCDR |x|) (QREFELT $ 52)))))))))) 

(DEFUN |FRAC;clear| (|l| $)
  (PROG (#1=#:G834 #2=#:G841 |x| #3=#:G840 |d| #4=#:G831 #5=#:G830 #6=#:G832
         #7=#:G839)
    (RETURN
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
                      (#4# (LETT #5# (SPADCALL #5# #6# (QREFELT $ 84)) . #8#))
                      ('T (PROGN (LETT #5# #6# . #8#) (LETT #4# 'T . #8#)))))))
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
                                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                 #1#))
                                (QREFELT $ 49))
                      #3#)
                     . #8#)))
             (LETT #2# (CDR #2#) . #8#) (GO G190) G191
             (EXIT (NREVERSE #3#))))))))) 

(DEFUN |FRAC;conditionP;MU;40| (|mat| $)
  (PROG (#1=#:G859 #2=#:G861 |i| #3=#:G860 |ansDD| |ansD| |matD| #4=#:G858 |l|
         #5=#:G857)
    (RETURN
     (SEQ
      (LETT |matD|
            (SPADCALL
             (PROGN
              (LETT #5# NIL . #6=(|FRAC;conditionP;MU;40|))
              (SEQ (LETT |l| NIL . #6#)
                   (LETT #4# (SPADCALL |mat| (QREFELT $ 104)) . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT #5# (CONS (|FRAC;clear| |l| $) #5#) . #6#)))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                   (EXIT (NREVERSE #5#))))
             (QREFELT $ 107))
            . #6#)
      (LETT |ansD| (SPADCALL |matD| (QREFELT $ 110)) . #6#)
      (EXIT
       (COND ((QEQCAR |ansD| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ansDD| (QCDR |ansD|) . #6#)
                   (EXIT
                    (CONS 0
                          (PROGN
                           (LETT #3# (GETREFV #7=(QVSIZE |ansDD|)) . #6#)
                           (SEQ (LETT |i| 1 . #6#) (LETT #2# #7# . #6#)
                                (LETT #1# 0 . #6#) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #3# #1#
                                          (SPADCALL
                                           (SPADCALL |ansDD| |i|
                                                     (QREFELT $ 112))
                                           (QREFELT $ 10)))))
                                (LETT #1#
                                      (PROG1 (|inc_SI| #1#)
                                        (LETT |i| (|inc_SI| |i|) . #6#))
                                      . #6#)
                                (GO G190) G191 (EXIT NIL))
                           #3#))))))))))) 

(DEFUN |FRAC;factorPolynomial;SupF;41| (|pp| $)
  (PROG (|lfact| |den1| |lc| #1=#:G884 |w| #2=#:G883 |ff| |ppD| |denpp|
         #3=#:G863 #4=#:G862 #5=#:G864 #6=#:G882 |u|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |pp| (QREFELT $ 78)) (|spadConstant| $ 115))
            (#7='T
             (SEQ
              (LETT |denpp|
                    (PROGN
                     (LETT #3# NIL . #8=(|FRAC;factorPolynomial;SupF;41|))
                     (SEQ (LETT |u| NIL . #8#)
                          (LETT #6# (SPADCALL |pp| (QREFELT $ 83)) . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |u| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5# (SPADCALL |u| (QREFELT $ 73)) . #8#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 84))
                                     . #8#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #8#)
                                (LETT #3# 'T . #8#)))))))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#7# (|spadConstant| $ 9))))
                    . #8#)
              (LETT |ppD|
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;41!0|
                           (VECTOR $ |denpp|))
                     |pp| (QREFELT $ 89))
                    . #8#)
              (LETT |ff| (SPADCALL |ppD| (QREFELT $ 117)) . #8#)
              (LETT |den1| (SPADCALL |denpp| (QREFELT $ 10)) . #8#)
              (LETT |lfact|
                    (PROGN
                     (LETT #2# NIL . #8#)
                     (SEQ (LETT |w| NIL . #8#)
                          (LETT #1# (SPADCALL |ff| (QREFELT $ 122)) . #8#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |w| (CAR #1#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL (QVELT |w| 1)
                                                        (QREFELT $ 93))
                                              (|spadConstant| $ 9)
                                              (QREFELT $ 14))
                                             (SPADCALL (ELT $ 10) (QVELT |w| 1)
                                                       (QREFELT $ 96)))
                                            ('T
                                             (SEQ
                                              (LETT |lc|
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |w| 1)
                                                               (QREFELT $ 93))
                                                     (QREFELT $ 10))
                                                    . #8#)
                                              (LETT |den1|
                                                    (SPADCALL |den1|
                                                              (SPADCALL |lc|
                                                                        (QVELT
                                                                         |w| 2)
                                                                        (QREFELT
                                                                         $
                                                                         123))
                                                              (QREFELT $ 124))
                                                    . #8#)
                                              (EXIT
                                               (SPADCALL
                                                (CONS
                                                 #'|FRAC;factorPolynomial;SupF;41!1|
                                                 (VECTOR |lc| $))
                                                (QVELT |w| 1)
                                                (QREFELT $ 96))))))
                                           (QVELT |w| 2))
                                   #2#)
                                  . #8#)))
                          (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #8#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (CONS #'|FRAC;factorPolynomial;SupF;41!2| (VECTOR |den1| $))
                 (SPADCALL |ff| (QREFELT $ 125)) (QREFELT $ 96))
                |lfact| (QREFELT $ 128)))))))))) 

(DEFUN |FRAC;factorPolynomial;SupF;41!2| (|x| $$)
  (PROG ($ |den1|)
    (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;41|))
    (LETT |den1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 124)))))) 

(DEFUN |FRAC;factorPolynomial;SupF;41!1| (|x| $$)
  (PROG ($ |lc|)
    (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;41|))
    (LETT |lc| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 124)))))) 

(DEFUN |FRAC;factorPolynomial;SupF;41!0| (|x| $$)
  (PROG (|denpp| $)
    (LETT |denpp| (QREFELT $$ 1) . #1=(|FRAC;factorPolynomial;SupF;41|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 85)) (QREFELT $ 15)))))) 

(DEFUN |FRAC;factorSquareFreePolynomial;SupF;42| (|pp| $)
  (PROG (|lfact| |den1| |lc| #1=#:G909 |w| #2=#:G908 |ff| |ppD| |denpp|
         #3=#:G889 #4=#:G888 #5=#:G890 #6=#:G907 |u| |lcpp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |pp| (QREFELT $ 78)) (|spadConstant| $ 115))
            ((EQL (SPADCALL |pp| (QREFELT $ 80)) 0)
             (SPADCALL |pp| NIL (QREFELT $ 128)))
            (#7='T
             (SEQ
              (LETT |lcpp| (SPADCALL |pp| (QREFELT $ 130))
                    . #8=(|FRAC;factorSquareFreePolynomial;SupF;42|))
              (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT $ 131)) . #8#)
              (LETT |denpp|
                    (PROGN
                     (LETT #3# NIL . #8#)
                     (SEQ (LETT |u| NIL . #8#)
                          (LETT #6# (SPADCALL |pp| (QREFELT $ 83)) . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |u| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5# (SPADCALL |u| (QREFELT $ 73)) . #8#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 84))
                                     . #8#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #8#)
                                (LETT #3# 'T . #8#)))))))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#7# (|spadConstant| $ 9))))
                    . #8#)
              (LETT |ppD|
                    (SPADCALL
                     (CONS #'|FRAC;factorSquareFreePolynomial;SupF;42!0|
                           (VECTOR $ |denpp|))
                     |pp| (QREFELT $ 89))
                    . #8#)
              (LETT |ff| (SPADCALL |ppD| (QREFELT $ 132)) . #8#)
              (LETT |den1|
                    (SPADCALL (SPADCALL |denpp| (QREFELT $ 10)) |lcpp|
                              (QREFELT $ 124))
                    . #8#)
              (LETT |lfact|
                    (PROGN
                     (LETT #2# NIL . #8#)
                     (SEQ (LETT |w| NIL . #8#)
                          (LETT #1# (SPADCALL |ff| (QREFELT $ 122)) . #8#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |w| (CAR #1#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL (QVELT |w| 1)
                                                        (QREFELT $ 93))
                                              (|spadConstant| $ 9)
                                              (QREFELT $ 14))
                                             (SPADCALL (ELT $ 10) (QVELT |w| 1)
                                                       (QREFELT $ 96)))
                                            ('T
                                             (SEQ
                                              (LETT |lc|
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |w| 1)
                                                               (QREFELT $ 93))
                                                     (QREFELT $ 10))
                                                    . #8#)
                                              (LETT |den1|
                                                    (SPADCALL |den1|
                                                              (SPADCALL |lc|
                                                                        (QVELT
                                                                         |w| 2)
                                                                        (QREFELT
                                                                         $
                                                                         123))
                                                              (QREFELT $ 124))
                                                    . #8#)
                                              (EXIT
                                               (SPADCALL
                                                (CONS
                                                 #'|FRAC;factorSquareFreePolynomial;SupF;42!1|
                                                 (VECTOR |lc| $))
                                                (QVELT |w| 1)
                                                (QREFELT $ 96))))))
                                           (QVELT |w| 2))
                                   #2#)
                                  . #8#)))
                          (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #8#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (CONS #'|FRAC;factorSquareFreePolynomial;SupF;42!2|
                       (VECTOR |den1| $))
                 (SPADCALL |ff| (QREFELT $ 125)) (QREFELT $ 96))
                |lfact| (QREFELT $ 128)))))))))) 

(DEFUN |FRAC;factorSquareFreePolynomial;SupF;42!2| (|x| $$)
  (PROG ($ |den1|)
    (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorSquareFreePolynomial;SupF;42|))
    (LETT |den1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |den1| (QREFELT $ 124)))))) 

(DEFUN |FRAC;factorSquareFreePolynomial;SupF;42!1| (|x| $$)
  (PROG ($ |lc|)
    (LETT $ (QREFELT $$ 1) . #1=(|FRAC;factorSquareFreePolynomial;SupF;42|))
    (LETT |lc| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| (QREFELT $ 10)) |lc| (QREFELT $ 124)))))) 

(DEFUN |FRAC;factorSquareFreePolynomial;SupF;42!0| (|x| $$)
  (PROG (|denpp| $)
    (LETT |denpp| (QREFELT $$ 1)
          . #1=(|FRAC;factorSquareFreePolynomial;SupF;42|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| |denpp| (QREFELT $ 85)) (QREFELT $ 15)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction| (#1=#:G934)
  (PROG ()
    (RETURN
     (PROG (#2=#:G935)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Fraction|))))))))))) 

(DEFUN |Fraction;| (|#1|)
  (PROG (|pv$| #1=#:G929 #2=#:G930 #3=#:G931 #4=#:G933 #5=#:G932 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|Fraction|))
      (LETT |dv$| (LIST '|Fraction| DV$1) . #6#)
      (LETT $ (GETREFV 167) . #6#)
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
                                          (|HasCategory| |#1|
                                                         '(|RealConstant|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedIntegralDomain|))
                                          (|HasCategory| |#1| '(|OrderedSet|))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|OrderedIntegralDomain|))
                                           (|HasCategory| |#1|
                                                          '(|OrderedSet|)))
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
                                                               (|devaluate|
                                                                |#1|)
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
                     (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;6|)
                           $))))))
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
            (QSETREFV $ 43 (CONS (|dispatchFunction| |FRAC;OMwrite;$S;13|) $))
            (QSETREFV $ 44 (CONS (|dispatchFunction| |FRAC;OMwrite;$BS;14|) $))
            (QSETREFV $ 45
                      (CONS (|dispatchFunction| |FRAC;OMwrite;Omd$V;15|) $))
            (QSETREFV $ 46
                      (CONS (|dispatchFunction| |FRAC;OMwrite;Omd$BV;16|)
                            $))))))))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (PROGN
         (QSETREFV $ 50 (CONS (|dispatchFunction| |FRAC;recip;$U;18|) $))
         (QSETREFV $ 52 (CONS (|dispatchFunction| |FRAC;/;2S$;20|) $))
         (QSETREFV $ 53 (CONS (|dispatchFunction| |FRAC;+;3$;21|) $))
         (QSETREFV $ 55 (CONS (|dispatchFunction| |FRAC;-;3$;22|) $))
         (QSETREFV $ 57 (CONS (|dispatchFunction| |FRAC;*;3$;23|) $))
         (QSETREFV $ 60 (CONS (|dispatchFunction| |FRAC;*;I2$;24|) $))
         (QSETREFV $ 61 (CONS (|dispatchFunction| |FRAC;*;S2$;25|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |FRAC;differentiate;$M$;26|) $))
         (COND
          ((|HasCategory| |#1| '(|canonicalUnitNormal|))
           (PROGN
            (QSETREFV $ 56 (CONS (|dispatchFunction| |FRAC;=;2$B;27|) $))
            (QSETREFV $ 64
                      (CONS (|dispatchFunction| |FRAC;one?;$B;28|) $)))))))
       ('T
        (PROGN
         (QSETREFV $ 52 (CONS (|dispatchFunction| |FRAC;/;2S$;29|) $))
         (QSETREFV $ 50 (CONS (|dispatchFunction| |FRAC;recip;$U;30|) $)))))
      (COND
       ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
        (PROGN
         (QSETREFV $ 67 (CONS (|dispatchFunction| |FRAC;retract;$F;31|) $))
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;32|) $))))
       ((|testBitVector| |pv$| 31)
        (PROGN
         (QSETREFV $ 67 (CONS (|dispatchFunction| |FRAC;retract;$F;33|) $))
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;$U;34|) $)))))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (QSETREFV $ 97
                  (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;35|) $))))
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
                (QSETREFV $ 99
                          (CONS (|dispatchFunction| |FRAC;charthRoot;$U;36|)
                                $)))
               ('T
                (QSETREFV $ 99
                          (CONS (|dispatchFunction| |FRAC;charthRoot;$U;37|)
                                $)))))
             ('T
              (QSETREFV $ 99
                        (CONS (|dispatchFunction| |FRAC;charthRoot;$U;38|)
                              $))))
            NIL
            NIL
            (QSETREFV $ 113
                      (CONS (|dispatchFunction| |FRAC;conditionP;MU;40|) $)))))
         (QSETREFV $ 129
                   (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;41|)
                         $))
         (QSETREFV $ 133
                   (CONS
                    (|dispatchFunction|
                     |FRAC;factorSquareFreePolynomial;SupF;42|)
                    $)))))
      $)))) 

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
              (98 . |OMwrite|) (105 . |OMputEndApp|) (|OpenMathEncoding|)
              (110 . |OMencodingXML|) (114 . |OMopenString|)
              (120 . |OMputObject|) (125 . |OMputEndObject|) (130 . |OMclose|)
              (135 . |OMwrite|) (140 . |OMwrite|) (146 . |OMwrite|)
              (152 . |OMwrite|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (159 . |unitNormal|) (164 . *) (170 . |recip|) (175 . |gcd|)
              (181 . /) (187 . +) (193 . -) (199 . -) (205 . =) (211 . *)
              (|Integer|) (217 . |coerce|) (222 . *) (228 . *) (|Mapping| 6 6)
              (234 . |differentiate|) (240 . |one?|) (|Fraction| 58)
              (245 . |retract|) (250 . |retract|) (|Union| 65 '#1="failed")
              (255 . |retractIfCan|) (260 . |retractIfCan|) (265 . |numer|)
              (270 . |retract|) (275 . |denom|) (280 . /) (|Union| 58 '#1#)
              (286 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (291 . |zero?|) (|NonNegativeInteger|) (296 . |degree|)
              (301 . |One|) (|List| $$) (305 . |coefficients|) (310 . |lcm|)
              (316 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 77 6 86)
              (322 . |map|) (|SparseUnivariatePolynomial| $)
              (328 . |gcdPolynomial|) (334 . |degree|)
              (339 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 86 $$ 77)
              (344 . |map|) (350 . |gcdPolynomial|) (356 . |charthRoot|)
              (361 . |charthRoot|) (366 . |characteristic|) (370 . ^)
              (|List| 82) (|Matrix| $$) (376 . |listOfLists|) (|List| 139)
              (|Matrix| 6) (381 . |matrix|) (|Union| 144 '#2="failed")
              (|Matrix| $) (386 . |conditionP|) (|Vector| 6) (391 . |elt|)
              (397 . |conditionP|) (|Factored| 77) (402 . |Zero|)
              (|Factored| 90) (406 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 118) (|:| |fctr| 86) (|:| |xpnt| 58))
              (|List| 119) (|Factored| 86) (411 . |factorList|) (416 . ^)
              (422 . /) (428 . |unit|)
              (|Record| (|:| |flg| 118) (|:| |fctr| 77) (|:| |xpnt| 58))
              (|List| 126) (433 . |makeFR|) (439 . |factorPolynomial|)
              (444 . |leadingCoefficient|) (449 . /)
              (455 . |factorSquareFreePolynomial|)
              (460 . |factorSquareFreePolynomial|) (|InputForm|)
              (|Pattern| 150) (|Pattern| 58) (|List| 138) (|Equation| 6)
              (|List| 6) (|Symbol|) (|List| 140) (|Matrix| 58)
              (|Record| (|:| |mat| 142) (|:| |vec| (|Vector| 58))) (|Vector| $)
              (|List| 79) (|PatternMatchResult| 150 $)
              (|PatternMatchResult| 58 $) (|Union| 149 '#2#) (|List| 90)
              (|Float|) (|DoubleFloat|) (|Union| 140 '#1#)
              (|Record| (|:| |mat| 106) (|:| |vec| 111)) (|Factored| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 155 '#3="failed") (|Union| 158 '#3#) (|List| $)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 158) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 465 |zero?| 471 |wholePart| 476 |unitNormal| 481
              |unitCanonical| 486 |unit?| 491 |subtractIfCan| 496
              |squareFreePolynomial| 502 |squareFreePart| 507 |squareFree| 512
              |solveLinearPolynomialEquation| 517 |smaller?| 523 |sizeLess?|
              529 |sign| 535 |sample| 540 |retractIfCan| 544 |retract| 564
              |rem| 584 |reducedSystem| 590 |recip| 612 |random| 617 |quo| 621
              |principalIdeal| 627 |prime?| 632 |positive?| 637 |patternMatch|
              642 |opposite?| 656 |one?| 662 |numerator| 667 |numer| 672
              |nextItem| 677 |negative?| 682 |multiEuclidean| 687 |min| 693
              |max| 699 |map| 705 |lcmCoef| 711 |lcm| 717 |latex| 728 |inv| 733
              |init| 738 |hashUpdate!| 742 |hash| 748 |gcdPolynomial| 753 |gcd|
              759 |fractionPart| 770 |floor| 775 |factorSquareFreePolynomial|
              780 |factorPolynomial| 785 |factor| 790 |extendedEuclidean| 795
              |exquo| 808 |expressIdealMember| 814 |eval| 820 |euclideanSize|
              860 |elt| 865 |divide| 871 |differentiate| 877 |denominator| 927
              |denom| 932 |convert| 937 |conditionP| 962 |coerce| 967
              |charthRoot| 997 |characteristic| 1002 |ceiling| 1006
              |associates?| 1011 |annihilate?| 1017 |abs| 1023 ^ 1028 |Zero|
              1046 |One| 1050 |OMwrite| 1054 D 1078 >= 1128 > 1134 = 1140 <=
              1146 < 1152 / 1158 - 1170 + 1181 * 1187)
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
                |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 6)
                 (|DifferentialExtension| 6) (|Algebra| 6) (|Algebra| 65)
                 (|LeftOreRing|) (|Algebra| $$) (|OrderedRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 6) (|Module| 65)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 140) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 58) (|BiModule| 6 6)
                 (|BiModule| 65 65) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedAbelianGroup|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 65) (|LeftModule| 65) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 6)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|PatternMatchable| 150)
                 (|PatternMatchable| 58) (|Patternable| 6) (|SetCategory|)
                 (|RealConstant|) (|Evalable| 6) (|Type|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 166) (|RetractableTo| 140)
                 (|ConvertibleTo| 134) (|ConvertibleTo| 151)
                 (|ConvertibleTo| 150) (|PartialOrder|) (|RetractableTo| 65)
                 (|RetractableTo| 58) (|InnerEvalable| 140 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 135)
                 (|ConvertibleTo| 136) (|Canonical|) (|OpenMath|))
              (|makeByteWordVec2| 166
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 2 6 11 0 0 14 1
                                    0 6 0 15 1 0 16 0 17 2 6 18 0 0 19 2 6 0 0
                                    0 20 1 0 6 0 21 0 0 0 22 0 6 0 23 2 0 11 0
                                    0 24 1 0 0 0 25 1 0 6 0 26 1 6 0 0 27 1 0 6
                                    0 28 2 6 0 0 0 29 1 31 30 0 32 3 31 30 0 33
                                    33 34 3 6 30 31 0 11 35 1 31 30 0 36 0 37 0
                                    38 2 31 0 33 37 39 1 31 30 0 40 1 31 30 0
                                    41 1 31 30 0 42 1 0 33 0 43 2 0 33 0 11 44
                                    2 0 30 31 0 45 3 0 30 31 0 11 46 1 6 47 0
                                    48 2 6 0 0 0 49 1 0 18 0 50 2 6 0 0 0 51 2
                                    0 0 6 6 52 2 0 0 0 0 53 2 6 0 0 0 54 2 0 0
                                    0 0 55 2 0 11 0 0 56 2 0 0 0 0 57 1 6 0 58
                                    59 2 0 0 58 0 60 2 0 0 6 0 61 2 0 0 0 62 63
                                    1 0 11 0 64 1 6 65 0 66 1 0 65 0 67 1 6 68
                                    0 69 1 0 68 0 70 1 0 6 0 71 1 6 58 0 72 1 0
                                    6 0 73 2 65 0 58 58 74 1 6 75 0 76 1 77 11
                                    0 78 1 77 79 0 80 0 77 0 81 1 77 82 0 83 2
                                    6 0 0 0 84 2 0 0 0 6 85 2 88 86 87 77 89 2
                                    6 90 90 90 91 1 86 79 0 92 1 86 6 0 93 2 95
                                    77 94 86 96 2 0 90 90 90 97 1 6 18 0 98 1 0
                                    18 0 99 0 0 79 100 2 6 0 0 79 101 1 103 102
                                    0 104 1 106 0 105 107 1 6 108 109 110 2 111
                                    6 0 58 112 1 0 108 109 113 0 114 0 115 1 6
                                    116 90 117 1 121 120 0 122 2 0 0 0 58 123 2
                                    0 0 0 0 124 1 121 86 0 125 2 114 0 77 127
                                    128 1 0 116 90 129 1 77 2 0 130 2 77 0 0 2
                                    131 1 6 116 90 132 1 0 116 90 133 2 0 11 0
                                    0 1 1 0 11 0 13 1 21 6 0 21 1 0 47 0 1 1 0
                                    0 0 1 1 0 11 0 1 2 0 18 0 0 1 1 1 116 90 1
                                    1 0 0 0 1 1 0 154 0 1 2 1 148 149 90 1 2 29
                                    11 0 0 1 2 0 11 0 0 1 1 6 58 0 1 0 0 0 1 1
                                    31 75 0 1 1 31 68 0 70 1 2 152 0 1 1 0 16 0
                                    17 1 31 58 0 1 1 31 65 0 67 1 2 140 0 1 1 0
                                    6 0 15 2 0 0 0 0 1 1 18 142 109 1 2 18 143
                                    109 144 1 1 0 106 109 1 2 0 153 109 144 1 1
                                    0 18 0 50 0 22 0 1 2 0 0 0 0 1 1 0 161 158
                                    1 1 0 11 0 1 1 6 11 0 1 3 16 146 0 135 146
                                    1 3 20 147 0 136 147 1 2 0 11 0 0 1 1 0 11
                                    0 64 1 0 0 0 1 1 0 6 0 71 1 9 18 0 1 1 6 11
                                    0 1 2 0 157 158 0 1 2 7 0 0 0 1 2 7 0 0 0 1
                                    2 0 0 62 0 1 2 0 162 0 0 1 2 0 0 0 0 1 1 0
                                    0 158 1 1 0 33 0 1 1 0 0 0 1 0 9 0 1 2 0
                                    165 165 0 1 1 0 164 0 1 2 0 90 90 90 97 2 0
                                    0 0 0 1 1 0 0 158 1 1 21 0 0 1 1 22 6 0 28
                                    1 1 116 90 133 1 1 116 90 129 1 0 154 0 1 3
                                    0 156 0 0 0 1 2 0 159 0 0 1 2 0 18 0 0 1 2
                                    0 157 158 0 1 2 11 0 0 137 1 3 11 0 0 6 6 1
                                    2 11 0 0 138 1 3 11 0 0 139 139 1 3 10 0 0
                                    140 6 1 3 10 0 0 141 139 1 1 0 79 0 1 2 12
                                    0 0 6 1 2 0 160 0 0 1 2 14 0 0 79 1 1 14 0
                                    0 1 3 13 0 0 141 145 1 2 13 0 0 141 1 3 13
                                    0 0 140 79 1 2 13 0 0 140 1 3 0 0 0 62 79 1
                                    2 0 0 0 62 63 1 0 0 0 1 1 0 6 0 73 1 27 134
                                    0 1 1 15 135 0 1 1 19 136 0 1 1 5 150 0 1 1
                                    5 151 0 1 1 33 108 109 113 1 2 0 140 1 1 0
                                    0 6 10 1 0 0 65 1 1 0 0 58 1 1 0 0 0 1 1 0
                                    166 0 1 1 34 18 0 99 0 0 79 100 1 22 6 0 26
                                    2 0 11 0 0 1 2 0 11 0 0 1 1 6 0 0 1 2 0 0 0
                                    58 123 2 0 0 0 79 1 2 0 0 0 163 1 0 0 0 22
                                    0 0 0 8 2 23 33 0 11 44 1 23 33 0 43 3 23
                                    30 31 0 11 46 2 23 30 31 0 45 2 14 0 0 79 1
                                    1 14 0 0 1 3 13 0 0 140 79 1 3 13 0 0 141
                                    145 1 2 13 0 0 141 1 2 13 0 0 140 1 3 0 0 0
                                    62 79 1 2 0 0 0 62 1 2 7 11 0 0 1 2 7 11 0
                                    0 1 2 0 11 0 0 56 2 7 11 0 0 1 2 7 11 0 0
                                    24 2 0 0 6 6 52 2 0 0 0 0 124 1 0 0 0 25 2
                                    0 0 0 0 55 2 0 0 0 0 53 2 0 0 6 0 61 2 0 0
                                    0 6 85 2 0 0 65 0 1 2 0 0 0 65 1 2 0 0 58 0
                                    60 2 0 0 0 0 57 2 0 0 79 0 1 2 0 0 163 0
                                    1)))))
           '|lookupComplete|)) 
