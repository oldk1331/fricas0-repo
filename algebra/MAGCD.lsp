
(/VERSIONCHECK 2) 

(DEFUN |MAGCD;algebraicGcd1a| (|x| |y| |mu| |vx| |lvz| $)
  (PROG (|yu| |xu| #1=#:G163 |w1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xu| (SPADCALL |x| |vx| |lvz| |mu| (QREFELT $ 12))
              . #2=(|MAGCD;algebraicGcd1a|))
        (LETT |yu| (SPADCALL |y| |vx| |lvz| |mu| (QREFELT $ 12)) . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |w1| (SPADCALL |xu| |yu| |mu| (QREFELT $ 13)) . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL |w1| (QREFELT $ 15))
                      (PROGN
                       (LETT #1# (SPADCALL |yu| |mu| (QREFELT $ 17)) . #2#)
                       (GO #1#)))
                     ('T
                      (SEQ (LETT |xu| |yu| . #2#)
                           (EXIT (LETT |yu| |w1| . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |MAGCD;eval1a| (|pol| |pt| |pss| $)
  (PROG (|res| |pk| |ptk| |ki| |j| |i| |t1| |ns| |n| |exps| |nexps| |coeffs|
         |ncoeffs| |nn| #1=#:G180 |t0| |polu| #2=#:G179 |polr| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p| (QVELT |pss| 12) . #3=(|MAGCD;eval1a|))
            (LETT |polr| |pol| . #3#)
            (EXIT
             (COND
              ((QEQCAR |polr| 0)
               (PROGN (LETT #2# (QCDR |polr|) . #3#) (GO #2#)))
              ('T
               (SEQ (LETT |polu| (QCDR (QCDR |polr|)) . #3#) (LETT |i| 0 . #3#)
                    (LETT |coeffs| (QVELT |pss| 7) . #3#)
                    (LETT |exps| (QVELT |pss| 8) . #3#)
                    (LETT |n| (QV_LEN_U32 |coeffs|) . #3#)
                    (LETT |ns| |n| . #3#)
                    (SEQ (LETT |t0| NIL . #3#) (LETT #1# |polu| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t0| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((NULL (|less_SI| |i| |ns|))
                            (SEQ
                             (LETT |nn| (SPADCALL 2 |n| (QREFELT $ 20)) . #3#)
                             (LETT |ncoeffs| (GETREFV_U32 |nn| 0) . #3#)
                             (SPADCALL |ncoeffs| |coeffs| |n| (QREFELT $ 25))
                             (LETT |coeffs| |ncoeffs| . #3#)
                             (QSETVELT |pss| 7 |coeffs|)
                             (LETT |nexps| (GETREFV_U32 |nn| 0) . #3#)
                             (SPADCALL |nexps| |exps| |n| (QREFELT $ 25))
                             (LETT |exps| |nexps| . #3#)
                             (QSETVELT |pss| 8 |exps|) (LETT |n| |nn| . #3#)
                             (EXIT (LETT |ns| |n| . #3#)))))
                          (LETT |t1| (QCDR |t0|) . #3#)
                          (SETELT_U32 |exps| |i| (QCAR |t0|))
                          (COND
                           ((QEQCAR |t1| 0)
                            (SETELT_U32 |coeffs| |i| (QCDR |t1|)))
                           ('T (|error| "More than one variable in eval1a")))
                          (EXIT (LETT |i| (|add_SI| |i| 1) . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (LETT |res| 0 . #3#) (LETT |ptk| 1 . #3#)
                    (LETT |pk| 0 . #3#)
                    (SEQ (LETT |j| (|sub_SI| |i| 1) . #3#) G190
                         (COND ((< |j| 0) (GO G191)))
                         (SEQ (LETT |ki| (ELT_U32 |exps| |j|) . #3#)
                              (SEQ G190
                                   (COND
                                    ((NULL (|less_SI| |pk| |ki|)) (GO G191)))
                                   (SEQ
                                    (LETT |ptk| (QSMULMOD32 |ptk| |pt| |p|)
                                          . #3#)
                                    (EXIT (LETT |pk| (|add_SI| |pk| 1) . #3#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (LETT |res|
                                     (QSMULADDMOD64-32 |ptk|
                                                       (ELT_U32 |coeffs| |j|)
                                                       |res| |p|)
                                     . #3#)))
                         (LETT |j| (+ |j| -1) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))))))
      #2# (EXIT #2#))))) 

(DEFUN |MAGCD;eval1| (|pol| |vv| |pt| |pss| $)
  (PROG (|xr| |yu| |c1| |t1| #1=#:G198 |t0| |xu| #2=#:G197 |vx| |polr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |polr| |pol| . #3=(|MAGCD;eval1|))
            (EXIT
             (COND ((QEQCAR |polr| 0) (PROGN (LETT #2# |pol| . #3#) (GO #2#)))
                   (#4='T
                    (SEQ (LETT |vx| (QCAR (QCDR |polr|)) . #3#)
                         (EXIT
                          (COND
                           ((EQUAL |vx| |vv|)
                            (PROGN
                             (LETT #2#
                                   (SPADCALL
                                    (|MAGCD;eval1a| |pol| |pt| |pss| $)
                                    (QREFELT $ 26))
                                   . #3#)
                             (GO #2#)))
                           (#4#
                            (SEQ (LETT |xu| (QCDR (QCDR |polr|)) . #3#)
                                 (LETT |yu| NIL . #3#)
                                 (SEQ (LETT |t0| NIL . #3#)
                                      (LETT #1# |xu| . #3#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |t0| (CAR #1#) . #3#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |t1| (QCDR |t0|) . #3#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |t1| 0)
                                              (LETT |yu|
                                                    (CONS
                                                     (CONS (QCAR |t0|)
                                                           (QCDR |t0|))
                                                     |yu|)
                                                    . #3#))
                                             ('T
                                              (SEQ
                                               (LETT |c1|
                                                     (|MAGCD;eval1| (QCDR |t0|)
                                                      |vv| |pt| |pss| $)
                                                     . #3#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |c1|
                                                            (|spadConstant| $
                                                                            27)
                                                            (QREFELT $ 28))
                                                  0)
                                                 ('T
                                                  (LETT |yu|
                                                        (CONS
                                                         (CONS (QCAR |t0|)
                                                               |c1|)
                                                         |yu|)
                                                        . #3#)))))))))
                                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |xr|
                                       (COND
                                        ((SPADCALL |yu| NIL (QREFELT $ 31))
                                         (CONS 0 0))
                                        (#4#
                                         (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                                       . #3#)
                                 (EXIT (SETF |xr| |xr|))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |MAGCD;compare_coeff1| (|nv| |exps| |nexps| $)
  (PROG (#1=#:G199 #2=#:G203 #3=#:G204 |i| |nn| |ne|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ne| (- (QUOTIENT2 (QV_LEN_U32 |exps|) |nv|) 1)
              . #4=(|MAGCD;compare_coeff1|))
        (LETT |nn| (- (QUOTIENT2 (QV_LEN_U32 |nexps|) |nv|) 1) . #4#)
        (SEQ (LETT |i| 0 . #4#) (LETT #3# (- |nv| 1) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((< (ELT_U32 |nexps| (+ |nn| |i|))
                    (ELT_U32 |exps| (+ |ne| |i|)))
                 (PROGN (LETT #2# -1 . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (ELT_U32 |nexps| (+ |nn| |i|))
                               (ELT_U32 |exps| (+ |ne| |i|)) (QREFELT $ 32))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 1 . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #2# (EXIT #2#))))) 

(DEFUN |MAGCD;algebraicGcd1| (|x| |y| |lm| |pss| $)
  (PROG (|offsets| |nsize| |msize| |dg| |res1| |pres| |mu| |mdp| |lvz| |vx|
         |p|)
    (RETURN
     (SEQ (LETT |p| (QVELT |pss| 12) . #1=(|MAGCD;algebraicGcd1|))
          (LETT |vx| (QVELT |pss| 9) . #1#) (LETT |lvz| (QVELT |pss| 10) . #1#)
          (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT $ 35)) . #1#)
          (EXIT
           (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |mu| (QCDR |mdp|) . #1#)
                       (LETT |pres|
                             (|MAGCD;algebraicGcd1a| |x| |y| |mu| |vx| |lvz| $)
                             . #1#)
                       (EXIT
                        (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                              (#2#
                               (SEQ (LETT |res1| (QCDR |pres|) . #1#)
                                    (LETT |dg| (SPADCALL |res1| (QREFELT $ 36))
                                          . #1#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |dg| (QVELT |pss| 2)
                                                 (QREFELT $ 32))
                                       (CONS 1 "failed"))
                                      (#2#
                                       (SEQ
                                        (LETT |msize| (QVELT |pss| 3) . #1#)
                                        (COND
                                         ((< |dg| (QVELT |pss| 2))
                                          (SEQ (QSETVELT |pss| 2 |dg|)
                                               (LETT |nsize|
                                                     (* (+ |dg| 1) |msize|)
                                                     . #1#)
                                               (QSETVELT |pss| 5
                                                         (SPADCALL |dg| |msize|
                                                                   |mu|
                                                                   (QREFELT $
                                                                            38)))
                                               (EXIT
                                                (QSETVELT |pss| 6
                                                          (GETREFV_U32 |nsize|
                                                                       0))))))
                                        (SPADCALL |res1| (QVELT |pss| 6) |dg|
                                                  |mu| (QREFELT $ 39))
                                        (LETT |offsets| (QVELT |pss| 11) . #1#)
                                        (EXIT
                                         (CONS 0
                                               (VECTOR 1 |offsets|
                                                       (QVELT |pss| 5)
                                                       (QVELT |pss|
                                                              6)))))))))))))))))))) 

(DEFUN |MAGCD;algebraicGcd2| (|x| |y| |lm| |lv| |pss| $)
  (PROG (#1=#:G255 |pp| |coeffs| |i| |jl| |ndl| #2=#:G261 |j| |ncoeffs| |n1|
         |nn| |n0| |rstate| |ncc| |exps| |oer| |odl| |dl| |cc| |good_cnt|
         |bad_cnt| |dg| |nexps| |gtf| #3=#:G232 |gtfp| #4=#:G227 |lcbad|
         #5=#:G258 |m| #6=#:G259 |deg| #7=#:G260 |z| |lmt| #8=#:G257 #9=#:G256
         |yt| |xt| |lt| |t| |nbv| |nlv| |vt| |dy| |dx| |prev_coeff1| |offsets|
         |vx| |p| |nv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nv| (LENGTH |lv|) . #10=(|MAGCD;algebraicGcd2|))
            (EXIT
             (COND ((EQL |nv| 0) (|MAGCD;algebraicGcd1| |x| |y| |lm| |pss| $))
                   ('T
                    (SEQ (LETT |p| (QVELT |pss| 12) . #10#)
                         (LETT |vx| (QVELT |pss| 9) . #10#)
                         (LETT |offsets| (QVELT |pss| 11) . #10#)
                         (LETT |lt| NIL . #10#)
                         (LETT |exps| (GETREFV_U32 0 0) . #10#)
                         (LETT |prev_coeff1| (|spadConstant| $ 27) . #10#)
                         (LETT |dx| (QVELT |pss| 0) . #10#)
                         (LETT |dy| (QVELT |pss| 1) . #10#)
                         (LETT |dg| (QVELT |pss| 2) . #10#)
                         (LETT |vt| (|SPADfirst| |lv|) . #10#)
                         (LETT |nlv| (CDR |lv|) . #10#)
                         (LETT |nbv| (LENGTH (QVELT |pss| 10)) . #10#)
                         (LETT |good_cnt| 0 . #10#) (LETT |bad_cnt| 0 . #10#)
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ (LETT |t| (RANDOM |p|) . #10#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |t| |lt| (QREFELT $ 41)) 0)
                                      ('T
                                       (SEQ (LETT |lt| (CONS |t| |lt|) . #10#)
                                            (LETT |xt|
                                                  (|MAGCD;eval1| |x| |vt| |t|
                                                   |pss| $)
                                                  . #10#)
                                            (LETT |yt|
                                                  (|MAGCD;eval1| |y| |vt| |t|
                                                   |pss| $)
                                                  . #10#)
                                            (LETT |lmt|
                                                  (PROGN
                                                   (LETT #9# NIL . #10#)
                                                   (SEQ (LETT |m| NIL . #10#)
                                                        (LETT #8# |lm| . #10#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #8#)
                                                              (PROGN
                                                               (LETT |m|
                                                                     (CAR #8#)
                                                                     . #10#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #9#
                                                                (CONS
                                                                 (|MAGCD;eval1|
                                                                  |m| |vt| |t|
                                                                  |pss| $)
                                                                 #9#)
                                                                . #10#)))
                                                        (LETT #8# (CDR #8#)
                                                              . #10#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #9#))))
                                                  . #10#)
                                            (LETT |lcbad| 'NIL . #10#)
                                            (SEQ (LETT |z| NIL . #10#)
                                                 (LETT #7# (QVELT |pss| 10)
                                                       . #10#)
                                                 (LETT |deg| NIL . #10#)
                                                 (LETT #6# (QVELT |pss| 4)
                                                       . #10#)
                                                 (LETT |m| NIL . #10#)
                                                 (LETT #5# |lmt| . #10#) G190
                                                 (COND
                                                  ((OR (ATOM #5#)
                                                       (PROGN
                                                        (LETT |m| (CAR #5#)
                                                              . #10#)
                                                        NIL)
                                                       (ATOM #6#)
                                                       (PROGN
                                                        (LETT |deg| (CAR #6#)
                                                              . #10#)
                                                        NIL)
                                                       (ATOM #7#)
                                                       (PROGN
                                                        (LETT |z| (CAR #7#)
                                                              . #10#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((<
                                                      (SPADCALL |m| |z|
                                                                (QREFELT $ 42))
                                                      |deg|)
                                                     (LETT |lcbad| 'T
                                                           . #10#)))))
                                                 (LETT #5#
                                                       (PROG1 (CDR #5#)
                                                         (LETT #6#
                                                               (PROG1 (CDR #6#)
                                                                 (LETT #7#
                                                                       (CDR
                                                                        #7#)
                                                                       . #10#))
                                                               . #10#))
                                                       . #10#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (COND
                                             ((OR |lcbad|
                                                  (<
                                                   (SPADCALL |xt| |vx|
                                                             (QREFELT $ 42))
                                                   |dx|))
                                              (EXIT
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |bad_cnt|
                                                        (+ |bad_cnt| 1) . #10#)
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |bad_cnt|
                                                               (+ |good_cnt| 2)
                                                               (QREFELT $ 32))
                                                     (PROGN
                                                      (LETT #4#
                                                            (PROGN
                                                             (LETT #1#
                                                                   (CONS 1
                                                                         #11="failed")
                                                                   . #10#)
                                                             (GO #1#))
                                                            . #10#)
                                                      (GO #4#)))))))
                                                #4# (EXIT #4#))))
                                             ((<
                                               (SPADCALL |yt| |vx|
                                                         (QREFELT $ 42))
                                               |dy|)
                                              (EXIT
                                               (SEQ
                                                (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                      . #10#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |bad_cnt|
                                                             (+ |good_cnt| 2)
                                                             (QREFELT $ 32))
                                                   (PROGN
                                                    (LETT #1# (CONS 1 #11#)
                                                          . #10#)
                                                    (GO #1#)))))))))
                                            (LETT |gtfp|
                                                  (|MAGCD;algebraicGcd2| |xt|
                                                   |yt| |lmt| |nlv| |pss| $)
                                                  . #10#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |gtfp| 1)
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |bad_cnt|
                                                        (+ |bad_cnt| 1) . #10#)
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |bad_cnt|
                                                               (+ |good_cnt| 2)
                                                               (QREFELT $ 32))
                                                     (PROGN
                                                      (LETT #3#
                                                            (PROGN
                                                             (LETT #1#
                                                                   (CONS 1
                                                                         "failed")
                                                                   . #10#)
                                                             (GO #1#))
                                                            . #10#)
                                                      (GO #3#)))))))
                                                #3# (EXIT #3#)))
                                              ('T
                                               (SEQ
                                                (LETT |gtf| (QCDR |gtfp|)
                                                      . #10#)
                                                (LETT |nexps| (QVELT |gtf| 2)
                                                      . #10#)
                                                (LETT |coeffs| (QVELT |gtf| 3)
                                                      . #10#)
                                                (COND
                                                 ((OR (< (QVELT |pss| 2) |dg|)
                                                      (SPADCALL |exps|
                                                                (QREFELT $
                                                                         45)))
                                                  (SEQ
                                                   (LETT |exps| |nexps| . #10#)
                                                   (EXIT
                                                    (LETT |rstate|
                                                          (SPADCALL
                                                           (QV_LEN_U32
                                                            |coeffs|)
                                                           (QVELT |pss| 12)
                                                           (QREFELT $ 44))
                                                          . #10#)))))
                                                (COND
                                                 ((< (QVELT |pss| 2) |dg|)
                                                  (SEQ
                                                   (LETT |dg| (QVELT |pss| 2)
                                                         . #10#)
                                                   (LETT |bad_cnt| 0 . #10#)
                                                   (EXIT
                                                    (LETT |good_cnt| 1
                                                          . #10#)))))
                                                (LETT |cc|
                                                      (|MAGCD;compare_coeff1|
                                                       (+ |nv| |nbv|) |exps|
                                                       |nexps| $)
                                                      . #10#)
                                                (EXIT
                                                 (COND ((< |cc| 0) "iterate")
                                                       ('T
                                                        (SEQ
                                                         (LETT |dl|
                                                               (SPADCALL
                                                                (+ |nv| |nbv|)
                                                                |offsets|
                                                                |exps|
                                                                |offsets|
                                                                |nexps|
                                                                (QREFELT $ 49))
                                                               . #10#)
                                                         (LETT |odl|
                                                               (SPADCALL |dl| 1
                                                                         (QREFELT
                                                                          $
                                                                          50))
                                                               . #10#)
                                                         (LETT |ndl|
                                                               (SPADCALL |dl| 2
                                                                         (QREFELT
                                                                          $
                                                                          50))
                                                               . #10#)
                                                         (COND
                                                          ((SPADCALL |odl| NIL
                                                                     (QREFELT $
                                                                              51))
                                                           (SEQ
                                                            (LETT |oer|
                                                                  (SPADCALL
                                                                   (+ |nv|
                                                                      |nbv|)
                                                                   |odl| |ndl|
                                                                   |offsets|
                                                                   |exps|
                                                                   |offsets|
                                                                   |nexps|
                                                                   (QREFELT $
                                                                            53))
                                                                  . #10#)
                                                            (LETT |exps|
                                                                  (QCDR |oer|)
                                                                  . #10#)
                                                            (LETT |ncc|
                                                                  (QUOTIENT2
                                                                   (QV_LEN_U32
                                                                    |exps|)
                                                                   (+ |nv|
                                                                      |nbv|))
                                                                  . #10#)
                                                            (EXIT
                                                             (LETT |rstate|
                                                                   (SPADCALL
                                                                    |ncc| |p|
                                                                    (QREFELT $
                                                                             44))
                                                                   . #10#)))))
                                                         (COND
                                                          ((SPADCALL |ndl| NIL
                                                                     (QREFELT $
                                                                              51))
                                                           (SEQ
                                                            (LETT |n0|
                                                                  (QV_LEN_U32
                                                                   |coeffs|)
                                                                  . #10#)
                                                            (LETT |nn|
                                                                  (LENGTH
                                                                   |ndl|)
                                                                  . #10#)
                                                            (LETT |n1|
                                                                  (+ |n0| |nn|)
                                                                  . #10#)
                                                            (LETT |ncoeffs|
                                                                  (GETREFV_U32
                                                                   |n1| 0)
                                                                  . #10#)
                                                            (LETT |i| 0 . #10#)
                                                            (LETT |jl|
                                                                  (|SPADfirst|
                                                                   |ndl|)
                                                                  . #10#)
                                                            (SEQ
                                                             (LETT |j| 0
                                                                   . #10#)
                                                             (LETT #2#
                                                                   (- |n1| 1)
                                                                   . #10#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |j| #2#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (COND
                                                                ((EQL |j| |jl|)
                                                                 (SEQ
                                                                  (SETELT_U32
                                                                   |ncoeffs|
                                                                   |j| 0)
                                                                  (LETT |ndl|
                                                                        (CDR
                                                                         |ndl|)
                                                                        . #10#)
                                                                  (EXIT
                                                                   (LETT |jl|
                                                                         (COND
                                                                          ((NULL
                                                                            |ndl|)
                                                                           |n1|)
                                                                          ('T
                                                                           (|SPADfirst|
                                                                            |ndl|)))
                                                                         . #10#))))
                                                                ('T
                                                                 (SEQ
                                                                  (SETELT_U32
                                                                   |ncoeffs|
                                                                   |j|
                                                                   (ELT_U32
                                                                    |coeffs|
                                                                    |i|))
                                                                  (EXIT
                                                                   (LETT |i|
                                                                         (+ |i|
                                                                            1)
                                                                         . #10#)))))))
                                                             (LETT |j|
                                                                   (|inc_SI|
                                                                    |j|)
                                                                   . #10#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (EXIT
                                                             (LETT |coeffs|
                                                                   |ncoeffs|
                                                                   . #10#)))))
                                                         (SPADCALL |coeffs| |t|
                                                                   |rstate|
                                                                   (QREFELT $
                                                                            54))
                                                         (LETT |pp|
                                                               (SPADCALL
                                                                |rstate|
                                                                (+ |nv| |nbv|)
                                                                |offsets|
                                                                |offsets|
                                                                |exps|
                                                                (QREFELT $ 57))
                                                               . #10#)
                                                         (EXIT
                                                          (COND
                                                           ((QEQCAR |pp| 1)
                                                            "iterate")
                                                           ('T
                                                            (PROGN
                                                             (LETT #1#
                                                                   (CONS 0
                                                                         (QCDR
                                                                          |pp|))
                                                                   . #10#)
                                                             (GO
                                                              #1#))))))))))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MAGCD;trialDivision2| (|x| |g| |lm| |vx| |lvz| $)
  (PROG (#1=#:G265 |m| #2=#:G264)
    (RETURN
     (SEQ
      (SPADCALL |x| |g|
                (PROGN
                 (LETT #2# NIL . #3=(|MAGCD;trialDivision2|))
                 (SEQ (LETT |m| NIL . #3#) (LETT #1# |lm| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |m| #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (LIST |vx|) |lvz| (QREFELT $ 64)))))) 

(DEFUN |MAGCD;reconstruct3| (|lv| |vx| |lvz| |exps| |pp| $)
  (PROG (|pres| |nlv|)
    (RETURN
     (SEQ
      (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT $ 65))
            . #1=(|MAGCD;reconstruct3|))
      (LETT |pres|
            (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1) (QREFELT $ 69))
            . #1#)
      (EXIT (SPADCALL |pres| |vx| (QREFELT $ 71))))))) 

(DEFUN |MAGCD;algebraicGcd3a| (|x| |y| |lm| |lv| |pss| $)
  (PROG (#1=#:G301 |res| |pp| |coeffs| |i| |jl| |ndl| #2=#:G307 |j| |ncoeffs|
         |n1| |nn| |n0| |rstate| #3=#:G281 |ncc| |exps| |offsets| |oer| |odl|
         |dl| |dg| |nexps| |gtp| |gtpp| |lcbad| #4=#:G304 |m| #5=#:G305 |deg|
         #6=#:G306 |z| |lmp| #7=#:G303 #8=#:G302 |yp| |xp| |lp| |p| |nv| |nbv|
         |lvz| |vx| |dy| |dx|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lp| NIL . #9=(|MAGCD;algebraicGcd3a|))
            (LETT |dx| (QVELT |pss| 0) . #9#) (LETT |dy| (QVELT |pss| 1) . #9#)
            (LETT |dg| (QVELT |pss| 2) . #9#) (LETT |vx| (QVELT |pss| 9) . #9#)
            (LETT |lvz| (QVELT |pss| 10) . #9#)
            (LETT |nbv| (+ (LENGTH |lvz|) 1) . #9#)
            (LETT |nv| (LENGTH |lv|) . #9#)
            (LETT |offsets| (QVELT |pss| 11) . #9#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (LETT |p|
                         (SPADCALL (+ (RANDOM 1000000) 500000) (QREFELT $ 73))
                         . #9#)
                   (EXIT
                    (COND ((SPADCALL |p| |lp| (QREFELT $ 41)) 0)
                          ('T
                           (SEQ (LETT |lp| (CONS |p| |lp|) . #9#)
                                (QSETVELT |pss| 12 |p|)
                                (LETT |xp| (SPADCALL |x| |p| (QREFELT $ 74))
                                      . #9#)
                                (LETT |yp| (SPADCALL |y| |p| (QREFELT $ 74))
                                      . #9#)
                                (COND
                                 ((< (SPADCALL |xp| |vx| (QREFELT $ 42)) |dx|)
                                  (COND
                                   ((< (SPADCALL |yp| |vx| (QREFELT $ 42))
                                       |dy|)
                                    (EXIT "iterate")))))
                                (LETT |lmp|
                                      (PROGN
                                       (LETT #8# NIL . #9#)
                                       (SEQ (LETT |m| NIL . #9#)
                                            (LETT #7# |lm| . #9#) G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |m| (CAR #7#) . #9#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #8#
                                                    (CONS
                                                     (SPADCALL |m| |p|
                                                               (QREFELT $ 74))
                                                     #8#)
                                                    . #9#)))
                                            (LETT #7# (CDR #7#) . #9#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #8#))))
                                      . #9#)
                                (LETT |lcbad| 'NIL . #9#)
                                (SEQ (LETT |z| NIL . #9#)
                                     (LETT #6# |lvz| . #9#)
                                     (LETT |deg| NIL . #9#)
                                     (LETT #5# (QVELT |pss| 4) . #9#)
                                     (LETT |m| NIL . #9#) (LETT #4# |lm| . #9#)
                                     G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT |m| (CAR #4#) . #9#)
                                            NIL)
                                           (ATOM #5#)
                                           (PROGN
                                            (LETT |deg| (CAR #5#) . #9#)
                                            NIL)
                                           (ATOM #6#)
                                           (PROGN
                                            (LETT |z| (CAR #6#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((< (SPADCALL |m| |z| (QREFELT $ 42))
                                            |deg|)
                                         (LETT |lcbad| 'T . #9#)))))
                                     (LETT #4#
                                           (PROG1 (CDR #4#)
                                             (LETT #5#
                                                   (PROG1 (CDR #5#)
                                                     (LETT #6# (CDR #6#)
                                                           . #9#))
                                                   . #9#))
                                           . #9#)
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND (|lcbad| "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |gtpp|
                                               (|MAGCD;algebraicGcd2| |xp| |yp|
                                                |lmp| |lv| |pss| $)
                                               . #9#)
                                         (EXIT
                                          (COND ((QEQCAR |gtpp| 1) "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |gtp| (QCDR |gtpp|)
                                                        . #9#)
                                                  (LETT |nexps| (QVELT |gtp| 2)
                                                        . #9#)
                                                  (LETT |coeffs|
                                                        (QVELT |gtp| 3) . #9#)
                                                  (COND
                                                   ((OR
                                                     (< (QVELT |pss| 2) |dg|)
                                                     (SPADCALL |exps|
                                                               (QREFELT $ 45)))
                                                    (SEQ
                                                     (LETT |exps| |nexps|
                                                           . #9#)
                                                     (EXIT
                                                      (LETT |rstate|
                                                            (SPADCALL
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             (QREFELT $ 76))
                                                            . #9#)))))
                                                  (COND
                                                   ((< (QVELT |pss| 2) |dg|)
                                                    (LETT |dg| (QVELT |pss| 2)
                                                          . #9#)))
                                                  (LETT |dl|
                                                        (SPADCALL
                                                         (+ |nv| |nbv|)
                                                         |offsets| |exps|
                                                         |offsets| |nexps|
                                                         (QREFELT $ 49))
                                                        . #9#)
                                                  (LETT |odl|
                                                        (SPADCALL |dl| 1
                                                                  (QREFELT $
                                                                           50))
                                                        . #9#)
                                                  (LETT |ndl|
                                                        (SPADCALL |dl| 2
                                                                  (QREFELT $
                                                                           50))
                                                        . #9#)
                                                  (COND
                                                   ((SPADCALL |odl| NIL
                                                              (QREFELT $ 51))
                                                    (SEQ
                                                     (LETT |oer|
                                                           (SPADCALL
                                                            (+ |nv| |nbv|)
                                                            |odl| |ndl|
                                                            |offsets| |exps|
                                                            |offsets| |nexps|
                                                            (QREFELT $ 53))
                                                           . #9#)
                                                     (LETT |offsets|
                                                           (QCAR |oer|) . #9#)
                                                     (LETT |exps| (QCDR |oer|)
                                                           . #9#)
                                                     (LETT |ncc|
                                                           (QUOTIENT2
                                                            (QV_LEN_U32 |exps|)
                                                            (+ |nv| |nbv|))
                                                           . #9#)
                                                     (EXIT
                                                      (LETT |rstate|
                                                            (SPADCALL
                                                             (PROG1
                                                                 (LETT #3#
                                                                       |ncc|
                                                                       . #9#)
                                                               (|check_subtype|
                                                                (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                #3#))
                                                             (QREFELT $ 76))
                                                            . #9#)))))
                                                  (COND
                                                   ((SPADCALL |ndl| NIL
                                                              (QREFELT $ 51))
                                                    (SEQ
                                                     (LETT |n0|
                                                           (QV_LEN_U32
                                                            |coeffs|)
                                                           . #9#)
                                                     (LETT |nn| (LENGTH |ndl|)
                                                           . #9#)
                                                     (LETT |n1| (+ |n0| |nn|)
                                                           . #9#)
                                                     (LETT |ncoeffs|
                                                           (GETREFV_U32 |n1| 0)
                                                           . #9#)
                                                     (LETT |i| 0 . #9#)
                                                     (LETT |jl|
                                                           (|SPADfirst| |ndl|)
                                                           . #9#)
                                                     (SEQ (LETT |j| 0 . #9#)
                                                          (LETT #2# (- |n1| 1)
                                                                . #9#)
                                                          G190
                                                          (COND
                                                           ((|greater_SI| |j|
                                                                          #2#)
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (COND
                                                             ((EQL |j| |jl|)
                                                              (SEQ
                                                               (SETELT_U32
                                                                |ncoeffs| |j|
                                                                0)
                                                               (LETT |ndl|
                                                                     (CDR
                                                                      |ndl|)
                                                                     . #9#)
                                                               (EXIT
                                                                (LETT |jl|
                                                                      (COND
                                                                       ((NULL
                                                                         |ndl|)
                                                                        |n1|)
                                                                       ('T
                                                                        (|SPADfirst|
                                                                         |ndl|)))
                                                                      . #9#))))
                                                             ('T
                                                              (SEQ
                                                               (SETELT_U32
                                                                |ncoeffs| |j|
                                                                (ELT_U32
                                                                 |coeffs| |i|))
                                                               (EXIT
                                                                (LETT |i|
                                                                      (+ |i| 1)
                                                                      . #9#)))))))
                                                          (LETT |j|
                                                                (|inc_SI| |j|)
                                                                . #9#)
                                                          (GO G190) G191
                                                          (EXIT NIL))
                                                     (EXIT
                                                      (LETT |coeffs| |ncoeffs|
                                                            . #9#)))))
                                                  (SPADCALL |coeffs| |p|
                                                            |rstate|
                                                            (QREFELT $ 77))
                                                  (LETT |pp|
                                                        (SPADCALL |rstate|
                                                                  |offsets|
                                                                  (QREFELT $
                                                                           79))
                                                        . #9#)
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |pp| 1) "iterate")
                                                    ('T
                                                     (SEQ
                                                      (LETT |res|
                                                            (|MAGCD;reconstruct3|
                                                             |lv| |vx| |lvz|
                                                             |exps| (QCDR |pp|)
                                                             $)
                                                            . #9#)
                                                      (EXIT
                                                       (COND
                                                        ((|MAGCD;trialDivision2|
                                                          |x| |res| |lm| |vx|
                                                          |lvz| $)
                                                         (COND
                                                          ((|MAGCD;trialDivision2|
                                                            |y| |res| |lm| |vx|
                                                            |lvz| $)
                                                           (PROGN
                                                            (LETT #1# |res|
                                                                  . #9#)
                                                            (GO
                                                             #1#))))))))))))))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |MAGCD;algebraicGcd;2PLLSLP;10| (|x| |y| |lm| |lv| |vx| |lvz| $)
  (PROG (|sval| #1=#:G330 |v| #2=#:G329 |ress| |pss| |msize| |ldeg| #3=#:G327
         |m| #4=#:G328 |vz| #5=#:G326 |nlm| #6=#:G325 #7=#:G324 |ny| |nx|
         |tval| #8=#:G323 #9=#:G322 |sv| |tv| |tvz| |tvx| |tv0| |na| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |lv|) . #10=(|MAGCD;algebraicGcd;2PLLSLP;10|))
          (LETT |na| (LENGTH |lvz|) . #10#)
          (EXIT
           (COND
            ((SPADCALL |n| 30 (QREFELT $ 80)) (|error| "Too many variables"))
            ('T
             (SEQ
              (LETT |tv0| (SPADCALL (QREFELT $ 60) |n| (QREFELT $ 81)) . #10#)
              (LETT |tvx| (|SPADfirst| (QREFELT $ 58)) . #10#)
              (LETT |tvz|
                    (REVERSE (SPADCALL (QREFELT $ 59) |na| (QREFELT $ 81)))
                    . #10#)
              (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT $ 65)) . #10#)
              (LETT |tv| (CONS |tvx| |tv|) . #10#)
              (LETT |sv| (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT $ 65)))
                    . #10#)
              (LETT |tval|
                    (PROGN
                     (LETT #9# NIL . #10#)
                     (SEQ (LETT |v| NIL . #10#) (LETT #8# |tv| . #10#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |v| (CAR #8#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 82) |v| 1
                                             (QREFELT $ 83))
                                   #9#)
                                  . #10#)))
                          (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #10#)
              (LETT |nx| (SPADCALL |x| |sv| |tval| (QREFELT $ 85)) . #10#)
              (LETT |ny| (SPADCALL |y| |sv| |tval| (QREFELT $ 85)) . #10#)
              (LETT |nlm|
                    (PROGN
                     (LETT #7# NIL . #10#)
                     (SEQ (LETT |m| NIL . #10#) (LETT #6# |lm| . #10#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |m| (CAR #6#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL |m| |sv| |tval| (QREFELT $ 85))
                                   #7#)
                                  . #10#)))
                          (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #10#)
              (LETT |ldeg|
                    (PROGN
                     (LETT #5# NIL . #10#)
                     (SEQ (LETT |vz| NIL . #10#) (LETT #4# |lvz| . #10#)
                          (LETT |m| NIL . #10#) (LETT #3# |lm| . #10#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |m| (CAR #3#) . #10#) NIL)
                                (ATOM #4#)
                                (PROGN (LETT |vz| (CAR #4#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS (SPADCALL |m| |vz| (QREFELT $ 42)) #5#)
                                  . #10#)))
                          (LETT #3#
                                (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #10#))
                                . #10#)
                          (GO G190) G191 (EXIT (NREVERSE #5#))))
                    . #10#)
              (LETT |msize| (SPADCALL (ELT $ 87) |ldeg| 1 (QREFELT $ 89))
                    . #10#)
              (LETT |pss|
                    (VECTOR (SPADCALL |nx| |tvx| (QREFELT $ 42))
                            (SPADCALL |ny| |tvx| (QREFELT $ 42)) 0 |msize|
                            |ldeg| (GETREFV_U32 0 0) (GETREFV_U32 0 0)
                            (GETREFV_U32 10 0) (GETREFV_U32 10 0) |tvx| |tvz|
                            (VECTOR 0) 0)
                    . #10#)
              (QSETVELT |pss| 2 (+ (MIN (QVELT |pss| 0) (QVELT |pss| 1)) 1))
              (LETT |ress|
                    (|MAGCD;algebraicGcd3a| |nx| |ny| |nlm| |tv0| |pss| $)
                    . #10#)
              (LETT |sval|
                    (PROGN
                     (LETT #2# NIL . #10#)
                     (SEQ (LETT |v| NIL . #10#) (LETT #1# |sv| . #10#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |v| (CAR #1#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 82) |v| 1
                                             (QREFELT $ 83))
                                   #2#)
                                  . #10#)))
                          (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #10#)
              (EXIT (SPADCALL |ress| |tv| |sval| (QREFELT $ 85))))))))))) 

(DEFUN |ModularAlgebraicGcd| (&REST #1=#:G331)
  (PROG ()
    (RETURN
     (PROG (#2=#:G332)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ModularAlgebraicGcd|)
                                           '|domainEqualList|)
                . #3=(|ModularAlgebraicGcd|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ModularAlgebraicGcd;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ModularAlgebraicGcd|))))))))))) 

(DEFUN |ModularAlgebraicGcd;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ModularAlgebraicGcd|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ModularAlgebraicGcd| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 91) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 58
                '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0| |v1|
                  |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1| |w2| |w3|
                  |w4| |w5| |w6| |w7| |w8| |w9|))
      (QSETREFV $ 59
                '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0| |q1|
                  |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1| |r2| |r3|
                  |r4| |r5| |r6| |r7| |r8| |r9|))
      (QSETREFV $ 60
                '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0| |b1|
                  |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1| |c2| |c3|
                  |c4| |c5| |c6| |c7| |c8| |c9|))
      $)))) 

(MAKEPROP '|ModularAlgebraicGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Polynomial| 23) (|Symbol|) (|List| 10)
              (0 . |MPtoMPT|) (8 . |pseudoRem|) (|Boolean|) (15 . |zero?|)
              (|Union| 6 '#1="failed") (20 . |canonicalIfCan|)
              (|PositiveInteger|) (|NonNegativeInteger|) (26 . *) (|Void|)
              (|U32Vector|) (|Integer|) (|U32VectorPolynomialOperations|)
              (32 . |copy_first|) (39 . |coerce|) (44 . |Zero|) (48 . =)
              (|Record| (|:| |k| 19) (|:| |c| 9)) (|List| 29) (54 . =) (60 . >)
              (|Union| 7 '#1#) (|List| 9) (66 . |pack_modulus|) (73 . |degree|)
              (|SortedExponentVector|) (78 . |pack_exps|) (85 . |repack1|)
              (|List| 23) (93 . |member?|) (99 . |degree|)
              (|VectorModularReconstructor|) (105 . |empty|) (111 . |empty?|)
              (|List| 40) (|Vector| 23) (|InnerModularHermitePade|)
              (116 . |merge_exponents|) (125 . |elt|) (131 . ~=)
              (|Record| (|:| |offsetdata| 47) (|:| |expdata| 37))
              (137 . |merge2|) (148 . |chinese_update|)
              (|Record| (|:| |nvars| 23) (|:| |offsetdata| 47)
                        (|:| |expdata| 37) (|:| |coeffdata| 22))
              (|Union| 55 '"failed") (155 . |reconstruct|) '|base_vars|
              '|alg_vars| '|param_vars| (|SparseMultivariatePolynomial| 23 10)
              (|List| 61) (|PrimGCD|) (164 . |alg_trial_division|)
              (173 . |concat|) (|SparseUnivariatePolynomial| 9)
              (|PrimitiveArray| 23) (|ModularHermitePade|)
              (179 . |unpack_poly|) (|SparseUnivariatePolynomial| $)
              (188 . |multivariate|) (|IntegerPrimesPackage| 23)
              (194 . |nextPrime|) (199 . |modpreduction|)
              (|VectorIntegerReconstructor|) (205 . |empty|)
              (210 . |chinese_update|) (|Union| 67 '"failed")
              (217 . |reconstruct|) (223 . >) (229 . |first|) (235 . |One|)
              (239 . |monomial|) (|List| $) (246 . |eval|) (253 . *) (259 . *)
              (|Mapping| 23 23 23) (265 . |reduce|)
              |MAGCD;algebraicGcd;2PLLSLP;10|)
           '#(|algebraicGcd| 272) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 90
                                                 '(4 8 6 9 10 11 7 12 3 8 6 6 6
                                                   7 13 1 8 14 6 15 2 8 16 6 7
                                                   17 2 19 0 18 0 20 3 24 21 22
                                                   22 23 25 1 9 0 23 26 0 9 0
                                                   27 2 9 14 0 0 28 2 30 14 0 0
                                                   31 2 23 14 0 0 32 3 8 33 34
                                                   11 23 35 1 8 23 6 36 3 8 37
                                                   23 23 7 38 4 8 21 6 22 23 7
                                                   39 2 40 14 23 0 41 2 9 19 0
                                                   10 42 2 43 0 23 23 44 1 37
                                                   14 0 45 5 48 46 23 47 37 47
                                                   37 49 2 46 40 0 23 50 2 40
                                                   14 0 0 51 7 48 52 23 40 40
                                                   47 37 47 37 53 3 43 21 22 23
                                                   0 54 5 43 56 0 23 47 47 37
                                                   57 5 63 14 61 61 62 11 11 64
                                                   2 11 0 0 0 65 5 68 66 11 37
                                                   67 23 23 69 2 9 0 70 10 71 1
                                                   72 23 23 73 2 48 9 9 23 74 1
                                                   75 0 23 76 3 75 21 22 23 0
                                                   77 2 75 78 0 47 79 2 19 14 0
                                                   0 80 2 11 0 0 19 81 0 9 0 82
                                                   3 9 0 0 10 19 83 3 9 0 0 11
                                                   84 85 2 9 0 0 0 86 2 23 0 23
                                                   0 87 3 40 23 88 0 23 89 6 0
                                                   9 9 9 34 11 10 11 90)))))
           '|lookupComplete|)) 
