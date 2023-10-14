
(/VERSIONCHECK 2) 

(DEFUN |PRIGCD3;lcx0;SmpLR;1| (|p| |xvars| $)
  (PROG (#1=#:G145 |pr| |t0| |vx| |xr|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |xvars|) (CONS |p| (|spadConstant| $ 7)))
             (#2='T
              (SEQ (LETT |xr| |p| . #3=(|PRIGCD3;lcx0;SmpLR;1|))
                   (EXIT
                    (COND ((QEQCAR |xr| 0) (CONS |p| (|spadConstant| $ 7)))
                          (#2#
                           (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #3#)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND ((NULL |xvars|) 'NIL) ('T 'T)))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((EQUAL |vx| (|SPADfirst| |xvars|))
                                         (SEQ
                                          (LETT |t0|
                                                (|SPADfirst|
                                                 (QCDR (QCDR |xr|)))
                                                . #3#)
                                          (LETT |pr|
                                                (SPADCALL (QCDR |t0|)
                                                          (CDR |xvars|)
                                                          (QREFELT $ 10))
                                                . #3#)
                                          (EXIT
                                           (PROGN
                                            (LETT #1#
                                                  (CONS (QCAR |pr|)
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (|spadConstant| $ 7)
                                                          |vx| (QCAR |t0|)
                                                          (QREFELT $ 13))
                                                         (QCDR |pr|)
                                                         (QREFELT $ 14)))
                                                  . #3#)
                                            (GO #1#)))))
                                        ('T
                                         (LETT |xvars| (CDR |xvars|) . #3#)))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT (CONS |p| (|spadConstant| $ 7)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRIGCD3;lcz;SmpSR;2| (|p| |z| $)
  (PROG (|xr| |yu| |zdeg| |pr| #1=#:G162 |t0| |xu| |vx|)
    (RETURN
     (SEQ (LETT |xr| |p| . #2=(|PRIGCD3;lcz;SmpSR;2|))
          (EXIT
           (COND ((QEQCAR |xr| 0) (CONS |p| 0))
                 (#3='T
                  (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #2#)
                       (LETT |xu| (QCDR (QCDR |xr|)) . #2#)
                       (EXIT
                        (COND
                         ((EQUAL |vx| |z|)
                          (SEQ (LETT |t0| (|SPADfirst| |xu|) . #2#)
                               (EXIT (CONS (QCDR |t0|) (QCAR |t0|)))))
                         (#3#
                          (SEQ (LETT |zdeg| 0 . #2#) (LETT |yu| NIL . #2#)
                               (SEQ (LETT |t0| NIL . #2#) (LETT #1# |xu| . #2#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |t0| (CAR #1#) . #2#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |pr|
                                           (SPADCALL (QCDR |t0|) |z|
                                                     (QREFELT $ 17))
                                           . #2#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |zdeg| (QCDR |pr|)
                                                  (QREFELT $ 20))
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (COND
                                          ((< |zdeg| (QCDR |pr|))
                                           (SEQ (LETT |yu| NIL . #2#)
                                                (EXIT
                                                 (LETT |zdeg| (QCDR |pr|)
                                                       . #2#)))))
                                         (EXIT
                                          (LETT |yu|
                                                (CONS
                                                 (CONS (QCAR |t0|) (QCAR |pr|))
                                                 |yu|)
                                                . #2#)))))))
                                    (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |xr| (CONS 1 (CONS |vx| (REVERSE |yu|)))
                                     . #2#)
                               (EXIT (CONS |xr| |zdeg|)))))))))))))) 

(DEFUN |PRIGCD3;coeffs0;SmpL2L;3| (|p| |xvars| |acc| $)
  (PROG (#1=#:G175 #2=#:G176 |t0| |lp| |vx| |xr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |xr| |p| . #3=(|PRIGCD3;coeffs0;SmpL2L;3|))
            (EXIT
             (COND ((QEQCAR |xr| 0) (CONS |p| |acc|))
                   ('T
                    (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #3#)
                         (SEQ G190
                              (COND
                               ((NULL (COND ((NULL |xvars|) 'NIL) ('T 'T)))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQUAL |vx| (|SPADfirst| |xvars|))
                                  (SEQ (LETT |lp| (QCDR (QCDR |xr|)) . #3#)
                                       (SEQ (LETT |t0| NIL . #3#)
                                            (LETT #2# |lp| . #3#) G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |t0| (CAR #2#) . #3#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |acc|
                                                    (SPADCALL (QCDR |t0|)
                                                              (CDR |xvars|)
                                                              |acc|
                                                              (QREFELT $ 22))
                                                    . #3#)))
                                            (LETT #2# (CDR #2#) . #3#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #1# |acc| . #3#)
                                         (GO #1#)))))
                                 ('T (LETT |xvars| (CDR |xvars|) . #3#)))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT (CONS |p| |acc|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRIGCD3;coeffs1;SmpLL;4| (|p| |xvars| $)
  (SPADCALL |p| |xvars| NIL (QREFELT $ 22))) 

(DEFUN |PRIGCD3;alg_reduce0;2SmpLSSmp;5| (|p| |m| |xvars| |z| $)
  (PROG (#1=#:G191 |mlc1| #2=#:G180 |alc| |g| #3=#:G196 |degp| |plcr| |mlc|
         |degm| |mlcr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mlcr| (SPADCALL |m| |z| (QREFELT $ 17))
              . #4=(|PRIGCD3;alg_reduce0;2SmpLSSmp;5|))
        (LETT |degm| (QCDR |mlcr|) . #4#) (LETT |mlc| (QCAR |mlcr|) . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |plcr| (SPADCALL |p| |z| (QREFELT $ 17)) . #4#)
                   (LETT |degp| (QCDR |plcr|) . #4#)
                   (EXIT
                    (COND
                     ((< |degp| |degm|) (PROGN (LETT #3# |p| . #4#) (GO #3#)))
                     ('T
                      (SEQ (LETT |alc| (QCAR |plcr|) . #4#)
                           (LETT |g|
                                 (SPADCALL
                                  (CONS |mlc|
                                        (SPADCALL |alc| |xvars|
                                                  (QREFELT $ 23)))
                                  (QREFELT $ 25))
                                 . #4#)
                           (LETT |alc|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |alc| |g| (QREFELT $ 27))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 0)
                                                  (|SparseMultivariatePolynomial|
                                                   (|Integer|) (|Symbol|))
                                                  #2#))
                                 . #4#)
                           (LETT |mlc1|
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL |mlc| |g| (QREFELT $ 27))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 0)
                                                  (|SparseMultivariatePolynomial|
                                                   (|Integer|) (|Symbol|))
                                                  #2#))
                                 . #4#)
                           (EXIT
                            (LETT |p|
                                  (SPADCALL
                                   (SPADCALL |mlc1| |p| (QREFELT $ 14))
                                   (SPADCALL
                                    (SPADCALL |alc|
                                              (SPADCALL (|spadConstant| $ 7)
                                                        |z|
                                                        (PROG1
                                                            (LETT #1#
                                                                  (- |degp|
                                                                     |degm|)
                                                                  . #4#)
                                                          (|check_subtype|
                                                           (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                                        (QREFELT $ 13))
                                              (QREFELT $ 14))
                                    |m| (QREFELT $ 14))
                                   (QREFELT $ 28))
                                  . #4#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #3# (EXIT #3#))))) 

(DEFUN |PRIGCD3;alg_reduce;SmpL2LSmp;6| (|p| |lm| |xvars| |zvars| $)
  (PROG (#1=#:G200 |m| #2=#:G201 |z|)
    (RETURN
     (SEQ
      (SEQ (LETT |z| NIL . #3=(|PRIGCD3;alg_reduce;SmpL2LSmp;6|))
           (LETT #2# |zvars| . #3#) (LETT |m| NIL . #3#) (LETT #1# |lm| . #3#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |z| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |p| (SPADCALL |p| |m| |xvars| |z| (QREFELT $ 29)) . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |p|))))) 

(DEFUN |PRIGCD3;alg_trial_division;2SmpL2LB;7| (|a| |b| |lm| |xvars| |zvars| $)
  (PROG (|s| #1=#:G204 |alc| |g| #2=#:G210 |mquo| |alm| |alcr| |blm| |blc|
         |blcr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |blcr| (SPADCALL |b| |xvars| (QREFELT $ 10))
              . #3=(|PRIGCD3;alg_trial_division;2SmpL2LB;7|))
        (LETT |blc| (QCAR |blcr|) . #3#) (LETT |blm| (QCDR |blcr|) . #3#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |a| (|spadConstant| $ 15) (QREFELT $ 31))
                  (PROGN (LETT #2# 'T . #3#) (GO #2#)))
                 ('T
                  (SEQ
                   (LETT |alcr| (SPADCALL |a| |xvars| (QREFELT $ 10)) . #3#)
                   (LETT |alc| (QCAR |alcr|) . #3#)
                   (LETT |alm| (QCDR |alcr|) . #3#)
                   (LETT |mquo| (SPADCALL |alm| |blm| (QREFELT $ 27)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |mquo| 1) (PROGN (LETT #2# 'NIL . #3#) (GO #2#)))
                     ('T
                      (SEQ
                       (LETT |g|
                             (SPADCALL
                              (CONS |blc|
                                    (SPADCALL |alc| |zvars| (QREFELT $ 23)))
                              (QREFELT $ 25))
                             . #3#)
                       (LETT |alc|
                             (PROG2
                                 (LETT #1# (SPADCALL |alc| |g| (QREFELT $ 27))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|SparseMultivariatePolynomial|
                                               (|Integer|) (|Symbol|))
                                              #1#))
                             . #3#)
                       (LETT |s|
                             (PROG2
                                 (LETT #1# (SPADCALL |blc| |g| (QREFELT $ 27))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|SparseMultivariatePolynomial|
                                               (|Integer|) (|Symbol|))
                                              #1#))
                             . #3#)
                       (EXIT
                        (LETT |a|
                              (SPADCALL
                               (SPADCALL (SPADCALL |s| |a| (QREFELT $ 14))
                                         (SPADCALL
                                          (SPADCALL |alc| (QCDR |mquo|)
                                                    (QREFELT $ 14))
                                          |b| (QREFELT $ 14))
                                         (QREFELT $ 28))
                               |lm| |xvars| |zvars| (QREFELT $ 30))
                              . #3#)))))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PrimGCD| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G212)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|PrimGCD|) . #2=(|PrimGCD|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|PrimGCD|
                         (LIST (CONS NIL (CONS 1 (|PrimGCD;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|PrimGCD|))))))))))) 

(DEFUN |PrimGCD;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|PrimGCD|) . #1=(|PrimGCD|))
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PrimGCD| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PrimGCD| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 19 11)
              (0 . |One|) (|Record| (|:| |lcx0lc| 6) (|:| |lcx0m| 6))
              (|List| 11) |PRIGCD3;lcx0;SmpLR;1| (|Symbol|)
              (|NonNegativeInteger|) (4 . |monomial|) (11 . *) (17 . |Zero|)
              (|Record| (|:| |lczlc| 6) (|:| |k| 19)) |PRIGCD3;lcz;SmpSR;2|
              (|Boolean|) (|Integer|) (21 . >) (|List| 6)
              |PRIGCD3;coeffs0;SmpL2L;3| |PRIGCD3;coeffs1;SmpLL;4| (|List| $)
              (27 . |gcd|) (|Union| $ '"failed") (32 . |exquo|) (38 . -)
              |PRIGCD3;alg_reduce0;2SmpLSSmp;5|
              |PRIGCD3;alg_reduce;SmpL2LSmp;6| (44 . =)
              |PRIGCD3;alg_trial_division;2SmpL2LB;7|)
           '#(|lcz| 50 |lcx0| 56 |coeffs1| 62 |coeffs0| 68 |alg_trial_division|
              75 |alg_reduce0| 84 |alg_reduce| 92)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 32
                                                 '(0 6 0 7 3 6 0 0 11 12 13 2 6
                                                   0 0 0 14 0 6 0 15 2 19 18 0
                                                   0 20 1 6 0 24 25 2 6 26 0 0
                                                   27 2 6 0 0 0 28 2 6 18 0 0
                                                   31 2 0 16 6 11 17 2 0 8 6 9
                                                   10 2 0 21 6 9 23 3 0 21 6 9
                                                   21 22 5 0 18 6 6 21 9 9 32 4
                                                   0 6 6 6 9 11 29 4 0 6 6 21 9
                                                   9 30)))))
           '|lookupComplete|)) 

(MAKEPROP '|PrimGCD| 'NILADIC T) 
