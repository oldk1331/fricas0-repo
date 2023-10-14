
(SDEFUN |MAGCD;algebraicGcd1a|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|mu| MD) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Union| MPT "failed"))
        (SPROG ((|yu| (MPT)) (|xu| (MPT)) (#1=#:G140 NIL) (|w1| (MPT)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |xu| (SPADCALL |x| |vx| |lvz| |mu| (QREFELT $ 12))
                        . #2=(|MAGCD;algebraicGcd1a|))
                  (LETT |yu| (SPADCALL |y| |vx| |lvz| |mu| (QREFELT $ 12))
                        . #2#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (LETT |w1| (SPADCALL |xu| |yu| |mu| (QREFELT $ 13))
                               . #2#)
                         (EXIT
                          (COND
                           ((SPADCALL |w1| (QREFELT $ 15))
                            (PROGN
                             (LETT #1# (SPADCALL |yu| |mu| (QREFELT $ 17))
                                   . #2#)
                             (GO #1#)))
                           ('T
                            (SEQ (LETT |xu| |yu| . #2#)
                                 (EXIT (LETT |yu| |w1| . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))
                #1# (EXIT #1#)))) 

(SDEFUN |MAGCD;eval1a|
        ((|pol| |Polynomial| (|Integer|)) (|pt| |Integer|)
         (|pss| |Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
          (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
          (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|))
          (|:| |eval1coeffbuf| #1=(|U32Vector|))
          (|:| |eval1expbuf| #2=(|SortedExponentVector|))
          (|:| |svx| (|Symbol|)) (|:| |svz| (|List| (|Symbol|)))
          (|:| |offsetdata| (|Vector| (|Integer|)))
          (|:| |prime| #3=(|Integer|)))
         ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (|pk| #4=(|SingleInteger|)) (|ptk| (|Integer|))
          (|ki| #5=(|SingleInteger|)) (|j| NIL) (|i| #4#)
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|ns| #5#) (|n| (|NonNegativeInteger|)) (|exps| #2#)
          (|nexps| (|SortedExponentVector|)) (|coeffs| #1#)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (#6=#:G157 NIL) (|t0| NIL)
          (|polu|
           #7=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#8=#:G156 NIL)
          (|polr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|)) (|:| |ts| #7#))))
          (|p| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 12) . #9=(|MAGCD;eval1a|))
                (LETT |polr| |pol| . #9#)
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0)
                   (PROGN (LETT #8# (QCDR |polr|) . #9#) (GO #8#)))
                  ('T
                   (SEQ (LETT |polu| (QCDR (QCDR |polr|)) . #9#)
                        (LETT |i| 0 . #9#)
                        (LETT |coeffs| (QVELT |pss| 7) . #9#)
                        (LETT |exps| (QVELT |pss| 8) . #9#)
                        (LETT |n| (QV_LEN_U32 |coeffs|) . #9#)
                        (LETT |ns| |n| . #9#)
                        (SEQ (LETT |t0| NIL . #9#) (LETT #6# |polu| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |t0| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((NULL (|less_SI| |i| |ns|))
                                (SEQ
                                 (LETT |nn| (SPADCALL 2 |n| (QREFELT $ 20))
                                       . #9#)
                                 (LETT |ncoeffs| (GETREFV_U32 |nn| 0) . #9#)
                                 (SPADCALL |ncoeffs| |coeffs| |n|
                                           (QREFELT $ 25))
                                 (LETT |coeffs| |ncoeffs| . #9#)
                                 (QSETVELT |pss| 7 |coeffs|)
                                 (LETT |nexps| (GETREFV_U32 |nn| 0) . #9#)
                                 (SPADCALL |nexps| |exps| |n| (QREFELT $ 25))
                                 (LETT |exps| |nexps| . #9#)
                                 (QSETVELT |pss| 8 |exps|)
                                 (LETT |n| |nn| . #9#)
                                 (EXIT (LETT |ns| |n| . #9#)))))
                              (LETT |t1| (QCDR |t0|) . #9#)
                              (SETELT_U32 |exps| |i| (QCAR |t0|))
                              (COND
                               ((QEQCAR |t1| 0)
                                (SETELT_U32 |coeffs| |i| (QCDR |t1|)))
                               ('T
                                (|error| "More than one variable in eval1a")))
                              (EXIT (LETT |i| (|add_SI| |i| 1) . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |res| 0 . #9#) (LETT |ptk| 1 . #9#)
                        (LETT |pk| 0 . #9#)
                        (SEQ (LETT |j| (|sub_SI| |i| 1) . #9#) G190
                             (COND ((< |j| 0) (GO G191)))
                             (SEQ (LETT |ki| (ELT_U32 |exps| |j|) . #9#)
                                  (SEQ G190
                                       (COND
                                        ((NULL (|less_SI| |pk| |ki|))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ptk| (QSMULMOD32 |ptk| |pt| |p|)
                                              . #9#)
                                        (EXIT
                                         (LETT |pk| (|add_SI| |pk| 1) . #9#)))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |res|
                                         (QSMULADDMOD64-32 |ptk|
                                                           (ELT_U32 |coeffs|
                                                                    |j|)
                                                           |res| |p|)
                                         . #9#)))
                             (LETT |j| (+ |j| -1) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|)))))))
          #8# (EXIT #8#)))) 

(SDEFUN |MAGCD;eval1|
        ((|pol| |Polynomial| (|Integer|)) (|vv| |Symbol|) (|pt| |Integer|)
         (|pss| |Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
          (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
          (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)) (|:| |svx| (|Symbol|))
          (|:| |svz| (|List| (|Symbol|)))
          (|:| |offsetdata| (|Vector| (|Integer|))) (|:| |prime| (|Integer|)))
         ($ . #1=(|Polynomial| (|Integer|))))
        (SPROG
         ((|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|c1| #1#)
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#2=#:G175 NIL) (|t0| NIL)
          (|xu|
           #3=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#4=#:G174 NIL) (|vx| #5=(|Symbol|))
          (|polr|
           (|Union| (|Integer|) (|Record| (|:| |v| #5#) (|:| |ts| #3#)))))
         (SEQ
          (EXIT
           (SEQ (LETT |polr| |pol| . #6=(|MAGCD;eval1|))
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0) (PROGN (LETT #4# |pol| . #6#) (GO #4#)))
                  (#7='T
                   (SEQ (LETT |vx| (QCAR (QCDR |polr|)) . #6#)
                        (EXIT
                         (COND
                          ((EQUAL |vx| |vv|)
                           (PROGN
                            (LETT #4#
                                  (SPADCALL (|MAGCD;eval1a| |pol| |pt| |pss| $)
                                            (QREFELT $ 26))
                                  . #6#)
                            (GO #4#)))
                          (#7#
                           (SEQ (LETT |xu| (QCDR (QCDR |polr|)) . #6#)
                                (LETT |yu| NIL . #6#)
                                (SEQ (LETT |t0| NIL . #6#)
                                     (LETT #2# |xu| . #6#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |t0| (CAR #2#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|) . #6#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |t1| 0)
                                             (LETT |yu|
                                                   (CONS
                                                    (CONS (QCAR |t0|)
                                                          (QCDR |t0|))
                                                    |yu|)
                                                   . #6#))
                                            ('T
                                             (SEQ
                                              (LETT |c1|
                                                    (|MAGCD;eval1| (QCDR |t0|)
                                                     |vv| |pt| |pss| $)
                                                    . #6#)
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
                                                        (CONS (QCAR |t0|) |c1|)
                                                        |yu|)
                                                       . #6#)))))))))
                                     (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |xr|
                                      (COND
                                       ((SPADCALL |yu| NIL (QREFELT $ 31))
                                        (CONS 0 0))
                                       (#7#
                                        (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                                      . #6#)
                                (EXIT (SETF |xr| |xr|))))))))))))
          #4# (EXIT #4#)))) 

(SDEFUN |MAGCD;compare_coeff1|
        ((|nv| |Integer|) (|exps| |SortedExponentVector|)
         (|nexps| |SortedExponentVector|) ($ |Integer|))
        (SPROG
         ((#1=#:G176 NIL) (#2=#:G180 NIL) (#3=#:G181 NIL) (|i| NIL)
          (|nn| #4=(|Integer|)) (|ne| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ne| (- (QV_LEN_U32 |exps|) |nv|)
                  . #5=(|MAGCD;compare_coeff1|))
            (LETT |nn| (- (QV_LEN_U32 |nexps|) |nv|) . #5#)
            (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |nv| 1) . #5#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((< (ELT_U32 |nexps| (+ |nn| |i|))
                        (ELT_U32 |exps| (+ |ne| |i|)))
                     (PROGN (LETT #2# -1 . #5#) (GO #2#)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (ELT_U32 |nexps| (+ |nn| |i|))
                                   (ELT_U32 |exps| (+ |ne| |i|))
                                   (QREFELT $ 32))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 1 . #5#) (GO #2#)) . #5#)
                          (GO #1#)))))
                      #1# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #2# (EXIT #2#)))) 

(SDEFUN |MAGCD;algebraicGcd1|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|)))
         (|pss| |Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
          (|:| |degg| (|Integer|)) (|:| |sizem| #1=(|Integer|))
          (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|))
          (|:| |svx| #2=(|Symbol|)) (|:| |svz| #3=(|List| (|Symbol|)))
          (|:| |offsetdata| #4=(|Vector| (|Integer|)))
          (|:| |prime| #5=(|Integer|)))
         ($ |Union|
          (|Record| (|:| |nvars| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)))
          "failed"))
        (SPROG
         ((|offsets| #4#) (|nsize| (|NonNegativeInteger|)) (|msize| #1#)
          (|dg| (|Integer|)) (|res1| (MPT)) (|pres| (|Union| MPT "failed"))
          (|mu| (MD)) (|mdp| (|Union| MD "failed")) (|lvz| #3#) (|vx| #2#)
          (|p| #5#))
         (SEQ (LETT |p| (QVELT |pss| 12) . #6=(|MAGCD;algebraicGcd1|))
              (LETT |vx| (QVELT |pss| 9) . #6#)
              (LETT |lvz| (QVELT |pss| 10) . #6#)
              (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT $ 35)) . #6#)
              (EXIT
               (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                     (#7='T
                      (SEQ (LETT |mu| (QCDR |mdp|) . #6#)
                           (LETT |pres|
                                 (|MAGCD;algebraicGcd1a| |x| |y| |mu| |vx|
                                  |lvz| $)
                                 . #6#)
                           (EXIT
                            (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                                  (#7#
                                   (SEQ (LETT |res1| (QCDR |pres|) . #6#)
                                        (LETT |dg|
                                              (SPADCALL |res1| (QREFELT $ 36))
                                              . #6#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |dg| (QVELT |pss| 2)
                                                     (QREFELT $ 32))
                                           (CONS 1 "failed"))
                                          (#7#
                                           (SEQ
                                            (LETT |msize| (QVELT |pss| 3)
                                                  . #6#)
                                            (COND
                                             ((< |dg| (QVELT |pss| 2))
                                              (SEQ (QSETVELT |pss| 2 |dg|)
                                                   (LETT |nsize|
                                                         (* (+ |dg| 1) |msize|)
                                                         . #6#)
                                                   (QSETVELT |pss| 5
                                                             (SPADCALL |dg|
                                                                       |msize|
                                                                       |mu|
                                                                       (QREFELT
                                                                        $ 38)))
                                                   (EXIT
                                                    (QSETVELT |pss| 6
                                                              (GETREFV_U32
                                                               |nsize| 0))))))
                                            (SPADCALL |res1| (QVELT |pss| 6)
                                                      |dg| |mu| (QREFELT $ 39))
                                            (LETT |offsets| (QVELT |pss| 11)
                                                  . #6#)
                                            (EXIT
                                             (CONS 0
                                                   (VECTOR 1 |offsets|
                                                           (QVELT |pss| 5)
                                                           (QVELT |pss|
                                                                  6))))))))))))))))))) 

(SDEFUN |MAGCD;algebraicGcd2|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|))
          (|:| |svx| #4=(|Symbol|)) (|:| |svz| (|List| (|Symbol|)))
          (|:| |offsetdata| #5=(|Vector| (|Integer|)))
          (|:| |prime| #6=(|Integer|)))
         ($
          . #7=(|Union|
                (|Record| (|:| |nvars| (|Integer|))
                          (|:| |offsetdata| (|Vector| (|Integer|)))
                          (|:| |expdata| (|SortedExponentVector|))
                          (|:| |coeffdata| (|U32Vector|)))
                "failed")))
        (SPROG
         ((#8=#:G232 NIL)
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|good_cnt| (|Integer|)) (|coeffs| (|U32Vector|)) (|i| (|Integer|))
          (|jl| (|Integer|)) (|ndl| #9=(|List| (|Integer|))) (#10=#:G238 NIL)
          (|j| NIL) (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #9#) (|dl| (|List| (|List| (|Integer|))))
          (|bad_cnt| (|Integer|)) (|cc| (|Integer|)) (|dg| #3#)
          (|nexps| (|SortedExponentVector|))
          (|gtf|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (#11=#:G209 NIL) (|gtfp| #7#) (#12=#:G204 NIL) (|lcbad| (|Boolean|))
          (#13=#:G235 NIL) (|m| NIL) (#14=#:G236 NIL) (|deg| NIL)
          (#15=#:G237 NIL) (|z| NIL)
          (|lmt| (|List| #16=(|Polynomial| (|Integer|)))) (#17=#:G234 NIL)
          (#18=#:G233 NIL) (|yt| #16#) (|xt| #16#) (|lt| (|List| (|Integer|)))
          (|t| (|Integer|)) (|nbv| #19=(|NonNegativeInteger|))
          (|nlv| (|List| (|Symbol|))) (|vt| (|Symbol|)) (|dy| #2#) (|dx| #1#)
          (|prev_coeff1| (|Polynomial| (|Integer|))) (|offsets| #5#) (|vx| #4#)
          (|p| #6#) (|nv| #19#))
         (SEQ
          (EXIT
           (SEQ (LETT |nv| (LENGTH |lv|) . #20=(|MAGCD;algebraicGcd2|))
                (EXIT
                 (COND
                  ((EQL |nv| 0) (|MAGCD;algebraicGcd1| |x| |y| |lm| |pss| $))
                  ('T
                   (SEQ (LETT |p| (QVELT |pss| 12) . #20#)
                        (LETT |vx| (QVELT |pss| 9) . #20#)
                        (LETT |offsets| (QVELT |pss| 11) . #20#)
                        (LETT |lt| NIL . #20#)
                        (LETT |exps| (GETREFV_U32 0 0) . #20#)
                        (LETT |prev_coeff1| (|spadConstant| $ 27) . #20#)
                        (LETT |dx| (QVELT |pss| 0) . #20#)
                        (LETT |dy| (QVELT |pss| 1) . #20#)
                        (LETT |dg| (QVELT |pss| 2) . #20#)
                        (LETT |vt| (|SPADfirst| |lv|) . #20#)
                        (LETT |nlv| (CDR |lv|) . #20#)
                        (LETT |nbv| (LENGTH (QVELT |pss| 10)) . #20#)
                        (LETT |good_cnt| 0 . #20#) (LETT |bad_cnt| 0 . #20#)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ (LETT |t| (RANDOM |p|) . #20#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| |lt| (QREFELT $ 41))
                                      "iterate")
                                     ('T
                                      (SEQ (LETT |lt| (CONS |t| |lt|) . #20#)
                                           (LETT |xt|
                                                 (|MAGCD;eval1| |x| |vt| |t|
                                                  |pss| $)
                                                 . #20#)
                                           (LETT |yt|
                                                 (|MAGCD;eval1| |y| |vt| |t|
                                                  |pss| $)
                                                 . #20#)
                                           (LETT |lmt|
                                                 (PROGN
                                                  (LETT #18# NIL . #20#)
                                                  (SEQ (LETT |m| NIL . #20#)
                                                       (LETT #17# |lm| . #20#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #17#)
                                                             (PROGN
                                                              (LETT |m|
                                                                    (CAR #17#)
                                                                    . #20#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #18#
                                                               (CONS
                                                                (|MAGCD;eval1|
                                                                 |m| |vt| |t|
                                                                 |pss| $)
                                                                #18#)
                                                               . #20#)))
                                                       (LETT #17# (CDR #17#)
                                                             . #20#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #18#))))
                                                 . #20#)
                                           (LETT |lcbad| 'NIL . #20#)
                                           (SEQ (LETT |z| NIL . #20#)
                                                (LETT #15# (QVELT |pss| 10)
                                                      . #20#)
                                                (LETT |deg| NIL . #20#)
                                                (LETT #14# (QVELT |pss| 4)
                                                      . #20#)
                                                (LETT |m| NIL . #20#)
                                                (LETT #13# |lmt| . #20#) G190
                                                (COND
                                                 ((OR (ATOM #13#)
                                                      (PROGN
                                                       (LETT |m| (CAR #13#)
                                                             . #20#)
                                                       NIL)
                                                      (ATOM #14#)
                                                      (PROGN
                                                       (LETT |deg| (CAR #14#)
                                                             . #20#)
                                                       NIL)
                                                      (ATOM #15#)
                                                      (PROGN
                                                       (LETT |z| (CAR #15#)
                                                             . #20#)
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
                                                          . #20#)))))
                                                (LETT #13#
                                                      (PROG1 (CDR #13#)
                                                        (LETT #14#
                                                              (PROG1 (CDR #14#)
                                                                (LETT #15#
                                                                      (CDR
                                                                       #15#)
                                                                      . #20#))
                                                              . #20#))
                                                      . #20#)
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
                                                       (+ |bad_cnt| 1) . #20#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 32))
                                                    (PROGN
                                                     (LETT #12#
                                                           (PROGN
                                                            (LETT #8#
                                                                  (CONS 1
                                                                        #21="failed")
                                                                  . #20#)
                                                            (GO #8#))
                                                           . #20#)
                                                     (GO #12#)))))))
                                               #12# (EXIT #12#))))
                                            ((<
                                              (SPADCALL |yt| |vx|
                                                        (QREFELT $ 42))
                                              |dy|)
                                             (EXIT
                                              (SEQ
                                               (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                     . #20#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |bad_cnt|
                                                            (+ |good_cnt| 2)
                                                            (QREFELT $ 32))
                                                  (PROGN
                                                   (LETT #8# (CONS 1 #21#)
                                                         . #20#)
                                                   (GO #8#)))))))))
                                           (LETT |gtfp|
                                                 (|MAGCD;algebraicGcd2| |xt|
                                                  |yt| |lmt| |nlv| |pss| $)
                                                 . #20#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |gtfp| 1)
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1) . #20#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 32))
                                                    (PROGN
                                                     (LETT #11#
                                                           (PROGN
                                                            (LETT #8#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #20#)
                                                            (GO #8#))
                                                           . #20#)
                                                     (GO #11#)))))))
                                               #11# (EXIT #11#)))
                                             ('T
                                              (SEQ
                                               (LETT |gtf| (QCDR |gtfp|)
                                                     . #20#)
                                               (LETT |nexps| (QVELT |gtf| 2)
                                                     . #20#)
                                               (LETT |coeffs| (QVELT |gtf| 3)
                                                     . #20#)
                                               (COND
                                                ((OR (< (QVELT |pss| 2) |dg|)
                                                     (SPADCALL |exps|
                                                               (QREFELT $ 45)))
                                                 (SEQ
                                                  (LETT |exps| |nexps| . #20#)
                                                  (LETT |rstate|
                                                        (SPADCALL
                                                         (QV_LEN_U32 |coeffs|)
                                                         (QVELT |pss| 12)
                                                         (QREFELT $ 44))
                                                        . #20#)
                                                  (LETT |bad_cnt| 0 . #20#)
                                                  (EXIT
                                                   (LETT |good_cnt| 0
                                                         . #20#)))))
                                               (COND
                                                ((< (QVELT |pss| 2) |dg|)
                                                 (LETT |dg| (QVELT |pss| 2)
                                                       . #20#)))
                                               (LETT |cc|
                                                     (|MAGCD;compare_coeff1|
                                                      (+ |nv| |nbv|) |exps|
                                                      |nexps| $)
                                                     . #20#)
                                               (EXIT
                                                (COND
                                                 ((< |cc| 0)
                                                  (SEQ
                                                   (LETT |bad_cnt|
                                                         (+ |bad_cnt| 1)
                                                         . #20#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |bad_cnt|
                                                                (+ |good_cnt|
                                                                   2)
                                                                (QREFELT $ 32))
                                                      (PROGN
                                                       (LETT #8#
                                                             (CONS 1 "failed")
                                                             . #20#)
                                                       (GO #8#)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |dl|
                                                         (SPADCALL
                                                          (+ |nv| |nbv|)
                                                          |offsets| |exps|
                                                          |offsets| |nexps|
                                                          (QREFELT $ 49))
                                                         . #20#)
                                                   (LETT |odl|
                                                         (SPADCALL |dl| 1
                                                                   (QREFELT $
                                                                            50))
                                                         . #20#)
                                                   (LETT |ndl|
                                                         (SPADCALL |dl| 2
                                                                   (QREFELT $
                                                                            50))
                                                         . #20#)
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
                                                            . #20#)
                                                      (LETT |exps| (QCDR |oer|)
                                                            . #20#)
                                                      (LETT |ncc|
                                                            (QUOTIENT2
                                                             (QV_LEN_U32
                                                              |exps|)
                                                             (+ |nv| |nbv|))
                                                            . #20#)
                                                      (LETT |rstate|
                                                            (SPADCALL |ncc| |p|
                                                                      (QREFELT
                                                                       $ 44))
                                                            . #20#)
                                                      (EXIT
                                                       (LETT |good_cnt| 0
                                                             . #20#)))))
                                                   (COND
                                                    ((SPADCALL |ndl| NIL
                                                               (QREFELT $ 51))
                                                     (SEQ
                                                      (LETT |n0|
                                                            (QV_LEN_U32
                                                             |coeffs|)
                                                            . #20#)
                                                      (LETT |nn| (LENGTH |ndl|)
                                                            . #20#)
                                                      (LETT |n1| (+ |n0| |nn|)
                                                            . #20#)
                                                      (LETT |ncoeffs|
                                                            (GETREFV_U32 |n1|
                                                                         0)
                                                            . #20#)
                                                      (LETT |i| 0 . #20#)
                                                      (LETT |jl|
                                                            (|SPADfirst| |ndl|)
                                                            . #20#)
                                                      (SEQ (LETT |j| 0 . #20#)
                                                           (LETT #10#
                                                                 (- |n1| 1)
                                                                 . #20#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |j|
                                                                           #10#)
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
                                                                      . #20#)
                                                                (EXIT
                                                                 (LETT |jl|
                                                                       (COND
                                                                        ((NULL
                                                                          |ndl|)
                                                                         |n1|)
                                                                        ('T
                                                                         (|SPADfirst|
                                                                          |ndl|)))
                                                                       . #20#))))
                                                              ('T
                                                               (SEQ
                                                                (SETELT_U32
                                                                 |ncoeffs| |j|
                                                                 (ELT_U32
                                                                  |coeffs|
                                                                  |i|))
                                                                (EXIT
                                                                 (LETT |i|
                                                                       (+ |i|
                                                                          1)
                                                                       . #20#)))))))
                                                           (LETT |j|
                                                                 (|inc_SI| |j|)
                                                                 . #20#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                      (EXIT
                                                       (LETT |coeffs| |ncoeffs|
                                                             . #20#)))))
                                                   (SPADCALL |coeffs| |t|
                                                             |rstate|
                                                             (QREFELT $ 54))
                                                   (LETT |good_cnt|
                                                         (+ |good_cnt| 1)
                                                         . #20#)
                                                   (LETT |pp|
                                                         (SPADCALL |rstate|
                                                                   (+ |nv|
                                                                      |nbv|)
                                                                   |offsets|
                                                                   |offsets|
                                                                   |exps|
                                                                   (QREFELT $
                                                                            57))
                                                         . #20#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |pp| 1)
                                                      "iterate")
                                                     ('T
                                                      (PROGN
                                                       (LETT #8#
                                                             (CONS 0
                                                                   (QCDR |pp|))
                                                             . #20#)
                                                       (GO
                                                        #8#))))))))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #8# (EXIT #8#)))) 

(SDEFUN |MAGCD;trialDivision2|
        ((|x| |Polynomial| (|Integer|)) (|g| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|vx| |Symbol|)
         (|lvz| |List| (|Symbol|)) ($ |Boolean|))
        (SPROG ((#1=#:G242 NIL) (|m| NIL) (#2=#:G241 NIL))
               (SEQ
                (SPADCALL |x| |g|
                          (PROGN
                           (LETT #2# NIL . #3=(|MAGCD;trialDivision2|))
                           (SEQ (LETT |m| NIL . #3#) (LETT #1# |lm| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |m| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #2# (CONS |m| #2#) . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (LIST |vx|) |lvz| (QREFELT $ 64))))) 

(SDEFUN |MAGCD;reconstruct3|
        ((|lv| |List| (|Symbol|)) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         (|exps| |SortedExponentVector|) (|pp| |PrimitiveArray| (|Integer|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|pres| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|nlv| (|List| (|Symbol|))))
         (SEQ
          (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT $ 65))
                . #1=(|MAGCD;reconstruct3|))
          (LETT |pres|
                (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1)
                          (QREFELT $ 69))
                . #1#)
          (EXIT (SPADCALL |pres| |vx| (QREFELT $ 71)))))) 

(SDEFUN |MAGCD;algebraicGcd3a|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|))
          (|:| |svx| #4=(|Symbol|)) (|:| |svz| #5=(|List| (|Symbol|)))
          (|:| |offsetdata| #6=(|Vector| (|Integer|)))
          (|:| |prime| (|Integer|)))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((#7=#:G278 NIL) (|res| (|Polynomial| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|coeffs| (|U32Vector|)) (|i| (|Integer|)) (|jl| (|Integer|))
          (|ndl| #8=(|List| (|Integer|))) (#9=#:G284 NIL) (|j| NIL)
          (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|)) (#10=#:G258 NIL)
          (|ncc| (|Integer|)) (|exps| (|SortedExponentVector|)) (|offsets| #6#)
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #8#) (|dl| (|List| (|List| (|Integer|)))) (|dg| #3#)
          (|nexps| (|SortedExponentVector|))
          (|gtp|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|gtpp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|lcbad| (|Boolean|)) (#11=#:G281 NIL) (|m| NIL) (#12=#:G282 NIL)
          (|deg| NIL) (#13=#:G283 NIL) (|z| NIL)
          (|lmp| (|List| #14=(|Polynomial| (|Integer|)))) (#15=#:G280 NIL)
          (#16=#:G279 NIL) (|yp| #14#) (|xp| #14#) (|lp| (|List| (|Integer|)))
          (|p| (|Integer|)) (|nv| (|NonNegativeInteger|)) (|nbv| (|Integer|))
          (|lvz| #5#) (|vx| #4#) (|dy| #2#) (|dx| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #17=(|MAGCD;algebraicGcd3a|))
                (LETT |dx| (QVELT |pss| 0) . #17#)
                (LETT |dy| (QVELT |pss| 1) . #17#)
                (LETT |dg| (QVELT |pss| 2) . #17#)
                (LETT |vx| (QVELT |pss| 9) . #17#)
                (LETT |lvz| (QVELT |pss| 10) . #17#)
                (LETT |nbv| (+ (LENGTH |lvz|) 1) . #17#)
                (LETT |nv| (LENGTH |lv|) . #17#)
                (LETT |offsets| (QVELT |pss| 11) . #17#)
                (LETT |exps| (GETREFV_U32 0 0) . #17#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL (+ (RANDOM 1000000) 500000)
                                       (QREFELT $ 73))
                             . #17#)
                       (EXIT
                        (COND ((SPADCALL |p| |lp| (QREFELT $ 41)) 0)
                              ('T
                               (SEQ (LETT |lp| (CONS |p| |lp|) . #17#)
                                    (QSETVELT |pss| 12 |p|)
                                    (LETT |xp|
                                          (SPADCALL |x| |p| (QREFELT $ 74))
                                          . #17#)
                                    (LETT |yp|
                                          (SPADCALL |y| |p| (QREFELT $ 74))
                                          . #17#)
                                    (COND
                                     ((< (SPADCALL |xp| |vx| (QREFELT $ 42))
                                         |dx|)
                                      (COND
                                       ((< (SPADCALL |yp| |vx| (QREFELT $ 42))
                                           |dy|)
                                        (EXIT "iterate")))))
                                    (LETT |lmp|
                                          (PROGN
                                           (LETT #16# NIL . #17#)
                                           (SEQ (LETT |m| NIL . #17#)
                                                (LETT #15# |lm| . #17#) G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |m| (CAR #15#)
                                                             . #17#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (SPADCALL |m| |p|
                                                                   (QREFELT $
                                                                            74))
                                                         #16#)
                                                        . #17#)))
                                                (LETT #15# (CDR #15#) . #17#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#))))
                                          . #17#)
                                    (LETT |lcbad| 'NIL . #17#)
                                    (SEQ (LETT |z| NIL . #17#)
                                         (LETT #13# |lvz| . #17#)
                                         (LETT |deg| NIL . #17#)
                                         (LETT #12# (QVELT |pss| 4) . #17#)
                                         (LETT |m| NIL . #17#)
                                         (LETT #11# |lm| . #17#) G190
                                         (COND
                                          ((OR (ATOM #11#)
                                               (PROGN
                                                (LETT |m| (CAR #11#) . #17#)
                                                NIL)
                                               (ATOM #12#)
                                               (PROGN
                                                (LETT |deg| (CAR #12#) . #17#)
                                                NIL)
                                               (ATOM #13#)
                                               (PROGN
                                                (LETT |z| (CAR #13#) . #17#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((<
                                              (SPADCALL |m| |z| (QREFELT $ 42))
                                              |deg|)
                                             (LETT |lcbad| 'T . #17#)))))
                                         (LETT #11#
                                               (PROG1 (CDR #11#)
                                                 (LETT #12#
                                                       (PROG1 (CDR #12#)
                                                         (LETT #13# (CDR #13#)
                                                               . #17#))
                                                       . #17#))
                                               . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND (|lcbad| "iterate")
                                           ('T
                                            (SEQ
                                             (LETT |gtpp|
                                                   (|MAGCD;algebraicGcd2| |xp|
                                                    |yp| |lmp| |lv| |pss| $)
                                                   . #17#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |gtpp| 1) "iterate")
                                               ('T
                                                (SEQ
                                                 (LETT |gtp| (QCDR |gtpp|)
                                                       . #17#)
                                                 (LETT |nexps| (QVELT |gtp| 2)
                                                       . #17#)
                                                 (LETT |coeffs| (QVELT |gtp| 3)
                                                       . #17#)
                                                 (COND
                                                  ((OR (< (QVELT |pss| 2) |dg|)
                                                       (SPADCALL |exps|
                                                                 (QREFELT $
                                                                          45)))
                                                   (SEQ
                                                    (LETT |exps| |nexps|
                                                          . #17#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (QV_LEN_U32
                                                             |coeffs|)
                                                            (QREFELT $ 76))
                                                           . #17#)))))
                                                 (COND
                                                  ((< (QVELT |pss| 2) |dg|)
                                                   (LETT |dg| (QVELT |pss| 2)
                                                         . #17#)))
                                                 (LETT |dl|
                                                       (SPADCALL (+ |nv| |nbv|)
                                                                 |offsets|
                                                                 |exps|
                                                                 |offsets|
                                                                 |nexps|
                                                                 (QREFELT $
                                                                          49))
                                                       . #17#)
                                                 (LETT |odl|
                                                       (SPADCALL |dl| 1
                                                                 (QREFELT $
                                                                          50))
                                                       . #17#)
                                                 (LETT |ndl|
                                                       (SPADCALL |dl| 2
                                                                 (QREFELT $
                                                                          50))
                                                       . #17#)
                                                 (COND
                                                  ((SPADCALL |odl| NIL
                                                             (QREFELT $ 51))
                                                   (SEQ
                                                    (LETT |oer|
                                                          (SPADCALL
                                                           (+ |nv| |nbv|) |odl|
                                                           |ndl| |offsets|
                                                           |exps| |offsets|
                                                           |nexps|
                                                           (QREFELT $ 53))
                                                          . #17#)
                                                    (LETT |offsets|
                                                          (QCAR |oer|) . #17#)
                                                    (LETT |exps| (QCDR |oer|)
                                                          . #17#)
                                                    (LETT |ncc|
                                                          (QUOTIENT2
                                                           (QV_LEN_U32 |exps|)
                                                           (+ |nv| |nbv|))
                                                          . #17#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #10#
                                                                      |ncc|
                                                                      . #17#)
                                                              (|check_subtype|
                                                               (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               #10#))
                                                            (QREFELT $ 76))
                                                           . #17#)))))
                                                 (COND
                                                  ((SPADCALL |ndl| NIL
                                                             (QREFELT $ 51))
                                                   (SEQ
                                                    (LETT |n0|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #17#)
                                                    (LETT |nn| (LENGTH |ndl|)
                                                          . #17#)
                                                    (LETT |n1| (+ |n0| |nn|)
                                                          . #17#)
                                                    (LETT |ncoeffs|
                                                          (GETREFV_U32 |n1| 0)
                                                          . #17#)
                                                    (LETT |i| 0 . #17#)
                                                    (LETT |jl|
                                                          (|SPADfirst| |ndl|)
                                                          . #17#)
                                                    (SEQ (LETT |j| 0 . #17#)
                                                         (LETT #9# (- |n1| 1)
                                                               . #17#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |j|
                                                                         #9#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (COND
                                                            ((EQL |j| |jl|)
                                                             (SEQ
                                                              (SETELT_U32
                                                               |ncoeffs| |j| 0)
                                                              (LETT |ndl|
                                                                    (CDR |ndl|)
                                                                    . #17#)
                                                              (EXIT
                                                               (LETT |jl|
                                                                     (COND
                                                                      ((NULL
                                                                        |ndl|)
                                                                       |n1|)
                                                                      ('T
                                                                       (|SPADfirst|
                                                                        |ndl|)))
                                                                     . #17#))))
                                                            ('T
                                                             (SEQ
                                                              (SETELT_U32
                                                               |ncoeffs| |j|
                                                               (ELT_U32
                                                                |coeffs| |i|))
                                                              (EXIT
                                                               (LETT |i|
                                                                     (+ |i| 1)
                                                                     . #17#)))))))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #17#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (LETT |coeffs| |ncoeffs|
                                                           . #17#)))))
                                                 (SPADCALL |coeffs| |p|
                                                           |rstate|
                                                           (QREFELT $ 77))
                                                 (LETT |pp|
                                                       (SPADCALL |rstate|
                                                                 |offsets|
                                                                 (QREFELT $
                                                                          79))
                                                       . #17#)
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
                                                           . #17#)
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
                                                           (LETT #7# |res|
                                                                 . #17#)
                                                           (GO
                                                            #7#))))))))))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #7#)))) 

(SDEFUN |MAGCD;algebraicGcd;2PLLSLP;10|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|sval| (|List| (|Polynomial| (|Integer|)))) (#1=#:G307 NIL)
          (|v| NIL) (#2=#:G306 NIL) (|ress| (|Polynomial| (|Integer|)))
          (|pss|
           (|Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
                     (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
                     (|:| |sldeg| (|List| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))
                     (|:| |eval1coeffbuf| (|U32Vector|))
                     (|:| |eval1expbuf| (|SortedExponentVector|))
                     (|:| |svx| (|Symbol|)) (|:| |svz| (|List| (|Symbol|)))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |prime| (|Integer|))))
          (|msize| (|Integer|)) (|ldeg| (|List| (|Integer|))) (#3=#:G304 NIL)
          (|m| NIL) (#4=#:G305 NIL) (|vz| NIL) (#5=#:G303 NIL)
          (|nlm| (|List| #6=(|Polynomial| (|Integer|)))) (#7=#:G302 NIL)
          (#8=#:G301 NIL) (|ny| #6#) (|nx| #6#)
          (|tval| (|List| (|Polynomial| (|Integer|)))) (#9=#:G300 NIL)
          (#10=#:G299 NIL) (|sv| (|List| (|Symbol|)))
          (|tv| (|List| (|Symbol|))) (|tvz| (|List| (|Symbol|)))
          (|tvx| (|Symbol|)) (|tv0| (|List| (|Symbol|)))
          (|na| #11=(|NonNegativeInteger|)) (|n| #11#))
         (SEQ (LETT |n| (LENGTH |lv|) . #12=(|MAGCD;algebraicGcd;2PLLSLP;10|))
              (LETT |na| (LENGTH |lvz|) . #12#)
              (EXIT
               (COND
                ((SPADCALL |n| 30 (QREFELT $ 80))
                 (|error| "Too many variables"))
                ('T
                 (SEQ
                  (LETT |tv0| (SPADCALL (QREFELT $ 60) |n| (QREFELT $ 81))
                        . #12#)
                  (LETT |tvx| (|SPADfirst| (QREFELT $ 58)) . #12#)
                  (LETT |tvz|
                        (REVERSE (SPADCALL (QREFELT $ 59) |na| (QREFELT $ 81)))
                        . #12#)
                  (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT $ 65)) . #12#)
                  (LETT |tv| (CONS |tvx| |tv|) . #12#)
                  (LETT |sv| (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT $ 65)))
                        . #12#)
                  (LETT |tval|
                        (PROGN
                         (LETT #10# NIL . #12#)
                         (SEQ (LETT |v| NIL . #12#) (LETT #9# |tv| . #12#) G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |v| (CAR #9#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #10#
                                      (CONS
                                       (SPADCALL (|spadConstant| $ 82) |v| 1
                                                 (QREFELT $ 83))
                                       #10#)
                                      . #12#)))
                              (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #10#))))
                        . #12#)
                  (LETT |nx| (SPADCALL |x| |sv| |tval| (QREFELT $ 85)) . #12#)
                  (LETT |ny| (SPADCALL |y| |sv| |tval| (QREFELT $ 85)) . #12#)
                  (LETT |nlm|
                        (PROGN
                         (LETT #8# NIL . #12#)
                         (SEQ (LETT |m| NIL . #12#) (LETT #7# |lm| . #12#) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |m| (CAR #7#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (SPADCALL |m| |sv| |tval|
                                                 (QREFELT $ 85))
                                       #8#)
                                      . #12#)))
                              (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #12#)
                  (LETT |ldeg|
                        (PROGN
                         (LETT #5# NIL . #12#)
                         (SEQ (LETT |vz| NIL . #12#) (LETT #4# |lvz| . #12#)
                              (LETT |m| NIL . #12#) (LETT #3# |lm| . #12#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |m| (CAR #3#) . #12#) NIL)
                                    (ATOM #4#)
                                    (PROGN (LETT |vz| (CAR #4#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #5#
                                      (CONS (SPADCALL |m| |vz| (QREFELT $ 42))
                                            #5#)
                                      . #12#)))
                              (LETT #3#
                                    (PROG1 (CDR #3#)
                                      (LETT #4# (CDR #4#) . #12#))
                                    . #12#)
                              (GO G190) G191 (EXIT (NREVERSE #5#))))
                        . #12#)
                  (LETT |msize| (SPADCALL (ELT $ 87) |ldeg| 1 (QREFELT $ 89))
                        . #12#)
                  (LETT |pss|
                        (VECTOR (SPADCALL |nx| |tvx| (QREFELT $ 42))
                                (SPADCALL |ny| |tvx| (QREFELT $ 42)) 0 |msize|
                                |ldeg| (GETREFV_U32 0 0) (GETREFV_U32 0 0)
                                (GETREFV_U32 10 0) (GETREFV_U32 10 0) |tvx|
                                |tvz| (VECTOR 0) 0)
                        . #12#)
                  (QSETVELT |pss| 2
                            (+ (MIN (QVELT |pss| 0) (QVELT |pss| 1)) 1))
                  (LETT |ress|
                        (|MAGCD;algebraicGcd3a| |nx| |ny| |nlm| |tv0| |pss| $)
                        . #12#)
                  (LETT |sval|
                        (PROGN
                         (LETT #2# NIL . #12#)
                         (SEQ (LETT |v| NIL . #12#) (LETT #1# |sv| . #12#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |v| (CAR #1#) . #12#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL (|spadConstant| $ 82) |v| 1
                                                 (QREFELT $ 83))
                                       #2#)
                                      . #12#)))
                              (LETT #1# (CDR #1#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #12#)
                  (EXIT (SPADCALL |ress| |tv| |sval| (QREFELT $ 85)))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcd;|)) 

(DEFUN |ModularAlgebraicGcd| (&REST #1=#:G308)
  (SPROG NIL
         (PROG (#2=#:G309)
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
                  (HREM |$ConstructorCache| '|ModularAlgebraicGcd|)))))))))) 

(DEFUN |ModularAlgebraicGcd;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
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
                    '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0|
                      |v1| |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1|
                      |w2| |w3| |w4| |w5| |w6| |w7| |w8| |w9|))
          (QSETREFV $ 59
                    '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0|
                      |q1| |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1|
                      |r2| |r3| |r4| |r5| |r6| |r7| |r8| |r9|))
          (QSETREFV $ 60
                    '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0|
                      |b1| |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1|
                      |c2| |c3| |c4| |c5| |c6| |c7| |c8| |c9|))
          $))) 

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
