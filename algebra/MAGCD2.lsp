
(SDEFUN |MAGCD2;algebraicGcd1a|
        ((|x| MP) (|y| MP) (|mu| MD) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Union| MPT "failed"))
        (SPROG
         ((|yu| (MPT)) (|xu| (MPT)) (#1=#:G145 NIL) (|w1| (MPT))
          (|yuu| #2=(|Union| MPT "failed")) (|xuu| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |xuu| (SPADCALL |x| |vx| |lvz| |mu| (QREFELT $ 15)))
                (EXIT
                 (COND ((QEQCAR |xuu| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ (LETT |xu| (QCDR |xuu|))
                             (LETT |yuu|
                                   (SPADCALL |y| |vx| |lvz| |mu|
                                             (QREFELT $ 15)))
                             (EXIT
                              (COND ((QEQCAR |yuu| 1) (CONS 1 "failed"))
                                    (#3#
                                     (SEQ (LETT |yu| (QCDR |yuu|))
                                          (EXIT
                                           (SEQ G190 NIL
                                                (SEQ
                                                 (LETT |w1|
                                                       (SPADCALL |xu| |yu| |mu|
                                                                 (QREFELT $
                                                                          16)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |w1|
                                                              (QREFELT $ 18))
                                                    (PROGN
                                                     (LETT #1#
                                                           (SPADCALL |yu| |mu|
                                                                     (QREFELT $
                                                                              19)))
                                                     (GO #4=#:G144)))
                                                   ('T
                                                    (SEQ (LETT |xu| |yu|)
                                                         (EXIT
                                                          (LETT |yu|
                                                                |w1|)))))))
                                                NIL (GO G190) G191
                                                (EXIT NIL)))))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |MAGCD2;compare_coeff1|
        ((|nv| |Integer|) (|exps| |SortedExponentVector|)
         (|nexps| |SortedExponentVector|) ($ |Integer|))
        (SPROG
         ((#1=#:G151 NIL) (#2=#:G152 NIL) (#3=#:G153 NIL) (|i| NIL)
          (|nn| #4=(|Integer|)) (|ne| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |ne| (- (QV_LEN_U32 |exps|) |nv|))
                (LETT |nn| (- (QV_LEN_U32 |nexps|) |nv|))
                (SEQ (LETT |i| 0) (LETT #3# (- |nv| 1)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((< (ELT_U32 |nexps| (+ |nn| |i|))
                            (ELT_U32 |exps| (+ |ne| |i|)))
                         (PROGN (LETT #2# -1) (GO #5=#:G150)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (ELT_U32 |nexps| (+ |nn| |i|))
                                       (ELT_U32 |exps| (+ |ne| |i|))
                                       (QREFELT $ 21))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 1) (GO #5#)))
                              (GO #6=#:G146)))))
                          #6# (EXIT #1#))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #5# (EXIT #2#)))) 

(SDEFUN |MAGCD2;algebraicGcd1|
        ((|x| MP) (|y| MP) (|lm| |List| MP)
         (|pss| |Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
          (|:| |degg| (|Integer|)) (|:| |sizem| #1=(|Integer|))
          (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #2=(|Symbol|))
          (|:| |svz| #3=(|List| (|Symbol|)))
          (|:| |offsetdata| #4=(|Vector| (|Integer|)))
          (|:| |pss1|
               (|Record| (|:| |prime| #5=(|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
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
         (SEQ (LETT |p| (QVELT (QVELT |pss| 10) 0)) (LETT |vx| (QVELT |pss| 7))
              (LETT |lvz| (QVELT |pss| 8))
              (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT $ 24)))
              (EXIT
               (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                     (#6='T
                      (SEQ (LETT |mu| (QCDR |mdp|))
                           (LETT |pres|
                                 (|MAGCD2;algebraicGcd1a| |x| |y| |mu| |vx|
                                  |lvz| $))
                           (EXIT
                            (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                                  (#6#
                                   (SEQ (LETT |res1| (QCDR |pres|))
                                        (LETT |dg|
                                              (SPADCALL |res1| (QREFELT $ 25)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |dg| (QVELT |pss| 2)
                                                     (QREFELT $ 21))
                                           (CONS 1 "failed"))
                                          (#6#
                                           (SEQ (LETT |msize| (QVELT |pss| 3))
                                                (COND
                                                 ((< |dg| (QVELT |pss| 2))
                                                  (SEQ (QSETVELT |pss| 2 |dg|)
                                                       (LETT |nsize|
                                                             (* (+ |dg| 1)
                                                                |msize|))
                                                       (QSETVELT |pss| 5
                                                                 (SPADCALL |dg|
                                                                           |msize|
                                                                           |mu|
                                                                           (QREFELT
                                                                            $
                                                                            27)))
                                                       (EXIT
                                                        (QSETVELT |pss| 6
                                                                  (GETREFV_U32
                                                                   |nsize|
                                                                   0))))))
                                                (SPADCALL |res1|
                                                          (QVELT |pss| 6) |dg|
                                                          |mu| (QREFELT $ 30))
                                                (LETT |offsets|
                                                      (QVELT |pss| 9))
                                                (EXIT
                                                 (CONS 0
                                                       (VECTOR 1 |offsets|
                                                               (QVELT |pss| 5)
                                                               (QVELT |pss|
                                                                      6))))))))))))))))))) 

(SDEFUN |MAGCD2;algebraicGcd2|
        ((|x| MP) (|y| MP) (|lm| |List| MP) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
          (|:| |svz| (|List| (|Symbol|)))
          (|:| |offsetdata| #5=(|Vector| (|Integer|)))
          (|:| |pss1|
               #6=(|Record| (|:| |prime| #7=(|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($
          . #8=(|Union|
                (|Record| (|:| |nvars| (|Integer|))
                          (|:| |offsetdata| (|Vector| (|Integer|)))
                          (|:| |expdata| (|SortedExponentVector|))
                          (|:| |coeffdata| (|U32Vector|)))
                "failed")))
        (SPROG
         ((#9=#:G211 NIL)
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|good_cnt| (|Integer|)) (|coeffs| (|U32Vector|)) (|i| (|Integer|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G217 NIL)
          (|j| NIL) (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #10#) (|dl| (|List| (|List| (|Integer|))))
          (|bad_cnt| (|Integer|)) (|cc| (|Integer|)) (|dg| #3#)
          (|nexps| (|SortedExponentVector|))
          (|gtf|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (#12=#:G208 NIL) (|gtfp| #8#) (#13=#:G209 NIL) (|lcbad| (|Boolean|))
          (#14=#:G214 NIL) (|m| NIL) (#15=#:G215 NIL) (|deg| NIL)
          (#16=#:G216 NIL) (|z| NIL) (|lmt| (|List| MP)) (#17=#:G213 NIL)
          (#18=#:G212 NIL) (|yt| (MP)) (|xt| (MP)) (|lt| (|List| (|Integer|)))
          (|t| (|Integer|)) (|nbv| #19=(|NonNegativeInteger|))
          (|nlv| (|List| (|Symbol|))) (|vt| (|Symbol|)) (|dy| #2#) (|dx| #1#)
          (|offsets| #5#) (|vx| #4#) (|p| #7#) (|pss1| #6#) (|nv| #19#))
         (SEQ
          (EXIT
           (SEQ (LETT |nv| (LENGTH |lv|))
                (EXIT
                 (COND
                  ((EQL |nv| 0) (|MAGCD2;algebraicGcd1| |x| |y| |lm| |pss| $))
                  ('T
                   (SEQ (LETT |pss1| (QVELT |pss| 10))
                        (LETT |p| (QVELT |pss1| 0)) (LETT |vx| (QVELT |pss| 7))
                        (LETT |offsets| (QVELT |pss| 9)) (LETT |lt| NIL)
                        (LETT |exps| (GETREFV_U32 0 0))
                        (LETT |dx| (QVELT |pss| 0)) (LETT |dy| (QVELT |pss| 1))
                        (LETT |dg| (QVELT |pss| 2))
                        (LETT |vt| (|SPADfirst| |lv|)) (LETT |nlv| (CDR |lv|))
                        (LETT |nbv| (LENGTH (QVELT |pss| 8)))
                        (LETT |good_cnt| 0) (LETT |bad_cnt| 0)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ (LETT |t| (RANDOM |p|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| |lt| (QREFELT $ 32))
                                      "iterate")
                                     ('T
                                      (SEQ (LETT |lt| (CONS |t| |lt|))
                                           (LETT |xt|
                                                 (SPADCALL |x| |vt| |t| |pss1|
                                                           (QREFELT $ 34)))
                                           (LETT |yt|
                                                 (SPADCALL |y| |vt| |t| |pss1|
                                                           (QREFELT $ 34)))
                                           (LETT |lmt|
                                                 (PROGN
                                                  (LETT #18# NIL)
                                                  (SEQ (LETT |m| NIL)
                                                       (LETT #17# |lm|) G190
                                                       (COND
                                                        ((OR (ATOM #17#)
                                                             (PROGN
                                                              (LETT |m|
                                                                    (CAR #17#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #18#
                                                               (CONS
                                                                (SPADCALL |m|
                                                                          |vt|
                                                                          |t|
                                                                          |pss1|
                                                                          (QREFELT
                                                                           $
                                                                           34))
                                                                #18#))))
                                                       (LETT #17# (CDR #17#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #18#)))))
                                           (LETT |lcbad| NIL)
                                           (SEQ (LETT |z| NIL)
                                                (LETT #16# (QVELT |pss| 8))
                                                (LETT |deg| NIL)
                                                (LETT #15# (QVELT |pss| 4))
                                                (LETT |m| NIL)
                                                (LETT #14# |lmt|) G190
                                                (COND
                                                 ((OR (ATOM #14#)
                                                      (PROGN
                                                       (LETT |m| (CAR #14#))
                                                       NIL)
                                                      (ATOM #15#)
                                                      (PROGN
                                                       (LETT |deg| (CAR #15#))
                                                       NIL)
                                                      (ATOM #16#)
                                                      (PROGN
                                                       (LETT |z| (CAR #16#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((<
                                                     (SPADCALL |m| |z|
                                                               (QREFELT $ 36))
                                                     |deg|)
                                                    (LETT |lcbad| 'T)))))
                                                (LETT #14#
                                                      (PROG1 (CDR #14#)
                                                        (LETT #15#
                                                              (PROG1 (CDR #15#)
                                                                (LETT #16#
                                                                      (CDR
                                                                       #16#))))))
                                                (GO G190) G191 (EXIT NIL))
                                           (COND
                                            ((OR |lcbad|
                                                 (<
                                                  (SPADCALL |xt| |vx|
                                                            (QREFELT $ 36))
                                                  |dx|))
                                             (EXIT
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 21))
                                                    (PROGN
                                                     (LETT #13#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        #20="failed"))
                                                            (GO #21=#:G207)))
                                                     (GO #22=#:G178)))))))
                                               #22# (EXIT #13#))))
                                            ((<
                                              (SPADCALL |yt| |vx|
                                                        (QREFELT $ 36))
                                              |dy|)
                                             (EXIT
                                              (SEQ
                                               (LETT |bad_cnt| (+ |bad_cnt| 1))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |bad_cnt|
                                                            (+ |good_cnt| 2)
                                                            (QREFELT $ 21))
                                                  (PROGN
                                                   (LETT #9# (CONS 1 #20#))
                                                   (GO #21#)))))))))
                                           (LETT |gtfp|
                                                 (|MAGCD2;algebraicGcd2| |xt|
                                                  |yt| |lmt| |nlv| |pss| $))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |gtfp| 1)
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 21))
                                                    (PROGN
                                                     (LETT #12#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        "failed"))
                                                            (GO #21#)))
                                                     (GO #23=#:G183)))))))
                                               #23# (EXIT #12#)))
                                             ('T
                                              (SEQ (LETT |gtf| (QCDR |gtfp|))
                                                   (LETT |nexps|
                                                         (QVELT |gtf| 2))
                                                   (LETT |coeffs|
                                                         (QVELT |gtf| 3))
                                                   (EXIT
                                                    (COND
                                                     ((EQL (QVELT |pss| 2) 0)
                                                      (PROGN
                                                       (LETT #9#
                                                             (CONS 0
                                                                   (VECTOR
                                                                    (+
                                                                     (+ |nv|
                                                                        |nbv|)
                                                                     1)
                                                                    (MAKEARR1 1
                                                                              0)
                                                                    (GETREFV_U32
                                                                     (+
                                                                      (+ |nv|
                                                                         |nbv|)
                                                                      1)
                                                                     0)
                                                                    (GETREFV_U32
                                                                     1 1))))
                                                       (GO #21#)))
                                                     ('T
                                                      (SEQ
                                                       (COND
                                                        ((OR
                                                          (< (QVELT |pss| 2)
                                                             |dg|)
                                                          (SPADCALL |exps|
                                                                    (QREFELT $
                                                                             39)))
                                                         (SEQ
                                                          (LETT |exps| |nexps|)
                                                          (LETT |rstate|
                                                                (SPADCALL
                                                                 (QV_LEN_U32
                                                                  |coeffs|)
                                                                 (QVELT |pss1|
                                                                        0)
                                                                 (QREFELT $
                                                                          38)))
                                                          (LETT |bad_cnt| 0)
                                                          (EXIT
                                                           (LETT |good_cnt|
                                                                 0)))))
                                                       (COND
                                                        ((< (QVELT |pss| 2)
                                                            |dg|)
                                                         (LETT |dg|
                                                               (QVELT |pss|
                                                                      2))))
                                                       (LETT |cc|
                                                             (|MAGCD2;compare_coeff1|
                                                              (+ |nv| |nbv|)
                                                              |exps| |nexps|
                                                              $))
                                                       (EXIT
                                                        (COND
                                                         ((< |cc| 0)
                                                          (SEQ
                                                           (LETT |bad_cnt|
                                                                 (+ |bad_cnt|
                                                                    1))
                                                           (EXIT
                                                            (COND
                                                             ((SPADCALL
                                                               |bad_cnt|
                                                               (+ |good_cnt| 2)
                                                               (QREFELT $ 21))
                                                              (PROGN
                                                               (LETT #9#
                                                                     (CONS 1
                                                                           "failed"))
                                                               (GO #21#)))))))
                                                         ('T
                                                          (SEQ
                                                           (LETT |dl|
                                                                 (SPADCALL
                                                                  (+ |nv|
                                                                     |nbv|)
                                                                  |offsets|
                                                                  |exps|
                                                                  |offsets|
                                                                  |nexps|
                                                                  (QREFELT $
                                                                           43)))
                                                           (LETT |odl|
                                                                 (SPADCALL |dl|
                                                                           1
                                                                           (QREFELT
                                                                            $
                                                                            44)))
                                                           (LETT |ndl|
                                                                 (SPADCALL |dl|
                                                                           2
                                                                           (QREFELT
                                                                            $
                                                                            44)))
                                                           (COND
                                                            ((SPADCALL |odl|
                                                                       NIL
                                                                       (QREFELT
                                                                        $ 45))
                                                             (SEQ
                                                              (LETT |oer|
                                                                    (SPADCALL
                                                                     (+ |nv|
                                                                        |nbv|)
                                                                     |odl|
                                                                     |ndl|
                                                                     |offsets|
                                                                     |exps|
                                                                     |offsets|
                                                                     |nexps|
                                                                     (QREFELT $
                                                                              47)))
                                                              (LETT |exps|
                                                                    (QCDR
                                                                     |oer|))
                                                              (LETT |ncc|
                                                                    (QUOTIENT2
                                                                     (QV_LEN_U32
                                                                      |exps|)
                                                                     (+ |nv|
                                                                        |nbv|)))
                                                              (LETT |rstate|
                                                                    (SPADCALL
                                                                     |ncc| |p|
                                                                     (QREFELT $
                                                                              38)))
                                                              (EXIT
                                                               (LETT |good_cnt|
                                                                     0)))))
                                                           (COND
                                                            ((SPADCALL |ndl|
                                                                       NIL
                                                                       (QREFELT
                                                                        $ 45))
                                                             (SEQ
                                                              (LETT |n0|
                                                                    (QV_LEN_U32
                                                                     |coeffs|))
                                                              (LETT |nn|
                                                                    (LENGTH
                                                                     |ndl|))
                                                              (LETT |n1|
                                                                    (+ |n0|
                                                                       |nn|))
                                                              (LETT |ncoeffs|
                                                                    (GETREFV_U32
                                                                     |n1| 0))
                                                              (LETT |i| 0)
                                                              (LETT |jl|
                                                                    (|SPADfirst|
                                                                     |ndl|))
                                                              (SEQ (LETT |j| 0)
                                                                   (LETT #11#
                                                                         (-
                                                                          |n1|
                                                                          1))
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |j| #11#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (COND
                                                                      ((EQL |j|
                                                                            |jl|)
                                                                       (SEQ
                                                                        (SETELT_U32
                                                                         |ncoeffs|
                                                                         |j| 0)
                                                                        (LETT
                                                                         |ndl|
                                                                         (CDR
                                                                          |ndl|))
                                                                        (EXIT
                                                                         (LETT
                                                                          |jl|
                                                                          (COND
                                                                           ((NULL
                                                                             |ndl|)
                                                                            |n1|)
                                                                           ('T
                                                                            (|SPADfirst|
                                                                             |ndl|)))))))
                                                                      ('T
                                                                       (SEQ
                                                                        (SETELT_U32
                                                                         |ncoeffs|
                                                                         |j|
                                                                         (ELT_U32
                                                                          |coeffs|
                                                                          |i|))
                                                                        (EXIT
                                                                         (LETT
                                                                          |i|
                                                                          (+
                                                                           |i|
                                                                           1))))))))
                                                                   (LETT |j|
                                                                         (|inc_SI|
                                                                          |j|))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              (EXIT
                                                               (LETT |coeffs|
                                                                     |ncoeffs|)))))
                                                           (SPADCALL |coeffs|
                                                                     |t|
                                                                     |rstate|
                                                                     (QREFELT $
                                                                              48))
                                                           (LETT |good_cnt|
                                                                 (+ |good_cnt|
                                                                    1))
                                                           (LETT |pp|
                                                                 (SPADCALL
                                                                  |rstate|
                                                                  (+ |nv|
                                                                     |nbv|)
                                                                  |offsets|
                                                                  |offsets|
                                                                  |exps|
                                                                  (QREFELT $
                                                                           51)))
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |pp| 1)
                                                              "iterate")
                                                             ('T
                                                              (PROGN
                                                               (LETT #9#
                                                                     (CONS 0
                                                                           (QCDR
                                                                            |pp|)))
                                                               (GO
                                                                #21#))))))))))))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #21# (EXIT #9#)))) 

(SDEFUN |MAGCD2;reconstruct3|
        ((|lv| |List| (|Symbol|)) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         (|exps| |SortedExponentVector|) (|pp| |PrimitiveArray| (|Integer|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|pres| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|nlv| (|List| (|Symbol|))))
         (SEQ (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT $ 55)))
              (LETT |pres|
                    (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1)
                              (QREFELT $ 61)))
              (EXIT (SPADCALL |pres| |vx| (QREFELT $ 63)))))) 

(SDEFUN |MAGCD2;algebraicGcd3a|
        ((|x| MP) (|y| MP) (|lm| |List| MP) (|lv| |List| (|Symbol|))
         (|pss| |Record| (|:| |degx| #1=(|Integer|))
          (|:| |degy| #2=(|Integer|)) (|:| |degg| #3=(|Integer|))
          (|:| |sizem| (|Integer|)) (|:| |sldeg| (|List| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))
          (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
          (|:| |svz| #5=(|List| (|Symbol|)))
          (|:| |offsetdata| #6=(|Vector| (|Integer|)))
          (|:| |pss1|
               #7=(|Record| (|:| |prime| (|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((#8=#:G255 NIL) (|res| (|Polynomial| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|coeffs| (|U32Vector|)) (|i| (|Integer|)) (|jl| (|Integer|))
          (|ndl| #9=(|List| (|Integer|))) (#10=#:G261 NIL) (|j| NIL)
          (|ncoeffs| (|U32Vector|)) (|n1| (|NonNegativeInteger|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|)) (#11=#:G234 NIL)
          (|ncc| (|Integer|)) (|exps| (|SortedExponentVector|)) (|offsets| #6#)
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #9#) (|dl| (|List| (|List| (|Integer|)))) (|dg| #3#)
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
          (|lcbad| (|Boolean|)) (#12=#:G258 NIL) (|m| NIL) (#13=#:G259 NIL)
          (|deg| NIL) (#14=#:G260 NIL) (|z| NIL) (|lmp| (|List| MP))
          (#15=#:G257 NIL) (#16=#:G256 NIL) (|yp| (MP)) (|xp| (MP))
          (|lp| (|List| (|Integer|))) (|p| (|Integer|))
          (|nv| (|NonNegativeInteger|)) (|nbv| (|Integer|)) (|lvz| #5#)
          (|pss1| #7#) (|vx| #4#) (|dy| #2#) (|dx| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL) (LETT |dx| (QVELT |pss| 0))
                (LETT |dy| (QVELT |pss| 1)) (LETT |dg| (QVELT |pss| 2))
                (LETT |vx| (QVELT |pss| 7)) (LETT |pss1| (QVELT |pss| 10))
                (LETT |lvz| (QVELT |pss| 8)) (LETT |nbv| (+ (LENGTH |lvz|) 1))
                (LETT |nv| (LENGTH |lv|)) (LETT |offsets| (QVELT |pss| 9))
                (LETT |exps| (GETREFV_U32 0 0))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL (+ (RANDOM 1000000) 500000)
                                       (QREFELT $ 65)))
                       (EXIT
                        (COND ((SPADCALL |p| |lp| (QREFELT $ 32)) 0)
                              ('T
                               (SEQ (LETT |lp| (CONS |p| |lp|))
                                    (QSETVELT |pss1| 0 |p|)
                                    (LETT |xp|
                                          (SPADCALL |x| |p| (QREFELT $ 66)))
                                    (LETT |yp|
                                          (SPADCALL |y| |p| (QREFELT $ 66)))
                                    (COND
                                     ((< (SPADCALL |xp| |vx| (QREFELT $ 36))
                                         |dx|)
                                      (COND
                                       ((< (SPADCALL |yp| |vx| (QREFELT $ 36))
                                           |dy|)
                                        (EXIT "iterate")))))
                                    (LETT |lmp|
                                          (PROGN
                                           (LETT #16# NIL)
                                           (SEQ (LETT |m| NIL) (LETT #15# |lm|)
                                                G190
                                                (COND
                                                 ((OR (ATOM #15#)
                                                      (PROGN
                                                       (LETT |m| (CAR #15#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #16#
                                                        (CONS
                                                         (SPADCALL |m| |p|
                                                                   (QREFELT $
                                                                            66))
                                                         #16#))))
                                                (LETT #15# (CDR #15#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #16#)))))
                                    (LETT |lcbad| NIL)
                                    (SEQ (LETT |z| NIL) (LETT #14# |lvz|)
                                         (LETT |deg| NIL)
                                         (LETT #13# (QVELT |pss| 4))
                                         (LETT |m| NIL) (LETT #12# |lmp|) G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |m| (CAR #12#))
                                                NIL)
                                               (ATOM #13#)
                                               (PROGN
                                                (LETT |deg| (CAR #13#))
                                                NIL)
                                               (ATOM #14#)
                                               (PROGN
                                                (LETT |z| (CAR #14#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((<
                                              (SPADCALL |m| |z| (QREFELT $ 36))
                                              |deg|)
                                             (LETT |lcbad| 'T)))))
                                         (LETT #12#
                                               (PROG1 (CDR #12#)
                                                 (LETT #13#
                                                       (PROG1 (CDR #13#)
                                                         (LETT #14#
                                                               (CDR #14#))))))
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND (|lcbad| "iterate")
                                           ('T
                                            (SEQ
                                             (LETT |gtpp|
                                                   (|MAGCD2;algebraicGcd2| |xp|
                                                    |yp| |lmp| |lv| |pss| $))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |gtpp| 1) "iterate")
                                               ('T
                                                (SEQ (LETT |gtp| (QCDR |gtpp|))
                                                     (LETT |nexps|
                                                           (QVELT |gtp| 2))
                                                     (LETT |coeffs|
                                                           (QVELT |gtp| 3))
                                                     (COND
                                                      ((OR
                                                        (< (QVELT |pss| 2)
                                                           |dg|)
                                                        (SPADCALL |exps|
                                                                  (QREFELT $
                                                                           39)))
                                                       (SEQ
                                                        (LETT |exps| |nexps|)
                                                        (EXIT
                                                         (LETT |rstate|
                                                               (SPADCALL
                                                                (QV_LEN_U32
                                                                 |coeffs|)
                                                                (QREFELT $
                                                                         68)))))))
                                                     (COND
                                                      ((< (QVELT |pss| 2) |dg|)
                                                       (LETT |dg|
                                                             (QVELT |pss| 2))))
                                                     (LETT |dl|
                                                           (SPADCALL
                                                            (+ |nv| |nbv|)
                                                            |offsets| |exps|
                                                            |offsets| |nexps|
                                                            (QREFELT $ 43)))
                                                     (LETT |odl|
                                                           (SPADCALL |dl| 1
                                                                     (QREFELT $
                                                                              44)))
                                                     (LETT |ndl|
                                                           (SPADCALL |dl| 2
                                                                     (QREFELT $
                                                                              44)))
                                                     (COND
                                                      ((SPADCALL |odl| NIL
                                                                 (QREFELT $
                                                                          45))
                                                       (SEQ
                                                        (LETT |oer|
                                                              (SPADCALL
                                                               (+ |nv| |nbv|)
                                                               |odl| |ndl|
                                                               |offsets| |exps|
                                                               |offsets|
                                                               |nexps|
                                                               (QREFELT $ 47)))
                                                        (LETT |offsets|
                                                              (QCAR |oer|))
                                                        (LETT |exps|
                                                              (QCDR |oer|))
                                                        (LETT |ncc|
                                                              (QUOTIENT2
                                                               (QV_LEN_U32
                                                                |exps|)
                                                               (+ |nv| |nbv|)))
                                                        (EXIT
                                                         (LETT |rstate|
                                                               (SPADCALL
                                                                (PROG1
                                                                    (LETT #11#
                                                                          |ncc|)
                                                                  (|check_subtype2|
                                                                   (>= #11# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #11#))
                                                                (QREFELT $
                                                                         68)))))))
                                                     (COND
                                                      ((SPADCALL |ndl| NIL
                                                                 (QREFELT $
                                                                          45))
                                                       (SEQ
                                                        (LETT |n0|
                                                              (QV_LEN_U32
                                                               |coeffs|))
                                                        (LETT |nn|
                                                              (LENGTH |ndl|))
                                                        (LETT |n1|
                                                              (+ |n0| |nn|))
                                                        (LETT |ncoeffs|
                                                              (GETREFV_U32 |n1|
                                                                           0))
                                                        (LETT |i| 0)
                                                        (LETT |jl|
                                                              (|SPADfirst|
                                                               |ndl|))
                                                        (SEQ (LETT |j| 0)
                                                             (LETT #10#
                                                                   (- |n1| 1))
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |j| #10#)
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
                                                                         |ndl|))
                                                                  (EXIT
                                                                   (LETT |jl|
                                                                         (COND
                                                                          ((NULL
                                                                            |ndl|)
                                                                           |n1|)
                                                                          ('T
                                                                           (|SPADfirst|
                                                                            |ndl|)))))))
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
                                                                            1))))))))
                                                             (LETT |j|
                                                                   (|inc_SI|
                                                                    |j|))
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                        (EXIT
                                                         (LETT |coeffs|
                                                               |ncoeffs|)))))
                                                     (SPADCALL |coeffs| |p|
                                                               |rstate|
                                                               (QREFELT $ 69))
                                                     (LETT |pp|
                                                           (SPADCALL |rstate|
                                                                     |offsets|
                                                                     (QREFELT $
                                                                              71)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |pp| 1)
                                                        "iterate")
                                                       ('T
                                                        (SEQ
                                                         (LETT |res|
                                                               (|MAGCD2;reconstruct3|
                                                                |lv| |vx| |lvz|
                                                                |exps|
                                                                (QCDR |pp|) $))
                                                         (EXIT
                                                          (COND
                                                           ((SPADCALL |x| |res|
                                                                      |lm| |vx|
                                                                      |lvz|
                                                                      (QREFELT
                                                                       $ 72))
                                                            (COND
                                                             ((SPADCALL |y|
                                                                        |res|
                                                                        |lm|
                                                                        |vx|
                                                                        |lvz|
                                                                        (QREFELT
                                                                         $ 72))
                                                              (PROGN
                                                               (LETT #8# |res|)
                                                               (GO
                                                                #17=#:G254))))))))))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #17# (EXIT #8#)))) 

(SDEFUN |MAGCD2;algebraicGcd;2PTLLSLP;7|
        ((|x| PT) (|y| PT) (|lm| |List| PT) (|lv| |List| (|Symbol|))
         (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|sval| (|List| (|Polynomial| (|Integer|)))) (#1=#:G286 NIL)
          (|v| NIL) (#2=#:G285 NIL) (|ress| (|Polynomial| (|Integer|)))
          (|pss|
           (|Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
                     (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
                     (|:| |sldeg| (|List| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|)) (|:| |svx| (|Symbol|))
                     (|:| |svz| (|List| (|Symbol|)))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |pss1|
                          (|Record| (|:| |prime| (|Integer|))
                                    (|:| |eval1coeffbuf| (|U32Vector|))
                                    (|:| |eval1expbuf|
                                         (|SortedExponentVector|))))))
          (|msize| (|Integer|)) (|ldeg| (|List| (|Integer|))) (#3=#:G283 NIL)
          (|m| NIL) (#4=#:G284 NIL) (|vz| NIL) (#5=#:G282 NIL)
          (|nlm| (|List| MP)) (#6=#:G281 NIL) (#7=#:G280 NIL) (|ny| (MP))
          (|nx| (MP)) (|sv| (|List| (|Symbol|))) (|tv| (|List| (|Symbol|)))
          (|tvz| (|List| (|Symbol|))) (|tvx| (|Symbol|))
          (|tv0| (|List| (|Symbol|))) (|na| #8=(|NonNegativeInteger|))
          (|n| #8#))
         (SEQ (LETT |n| (LENGTH |lv|)) (LETT |na| (LENGTH |lvz|))
              (EXIT
               (COND
                ((SPADCALL |n| 30 (QREFELT $ 73))
                 (|error| "Too many variables"))
                ('T
                 (SEQ (LETT |tv0| (SPADCALL (QREFELT $ 54) |n| (QREFELT $ 74)))
                      (LETT |tvx| (|SPADfirst| (QREFELT $ 52)))
                      (LETT |tvz|
                            (REVERSE
                             (SPADCALL (QREFELT $ 53) |na| (QREFELT $ 74))))
                      (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT $ 55)))
                      (LETT |tv| (CONS |tvx| |tv|))
                      (LETT |sv|
                            (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT $ 55))))
                      (LETT |nx| (SPADCALL |x| |sv| |tv| (QREFELT $ 75)))
                      (LETT |ny| (SPADCALL |y| |sv| |tv| (QREFELT $ 75)))
                      (LETT |nlm|
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |m| NIL) (LETT #6# |lm|) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |m| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL |m| |sv| |tv|
                                                     (QREFELT $ 75))
                                           #7#))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT (NREVERSE #7#)))))
                      (LETT |ldeg|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |vz| NIL) (LETT #4# |lvz|)
                                  (LETT |m| NIL) (LETT #3# |lm|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |m| (CAR #3#)) NIL)
                                        (ATOM #4#)
                                        (PROGN (LETT |vz| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS
                                           (SPADCALL |m| |vz| (QREFELT $ 76))
                                           #5#))))
                                  (LETT #3#
                                        (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                                  (GO G190) G191 (EXIT (NREVERSE #5#)))))
                      (LETT |msize|
                            (SPADCALL (ELT $ 77) |ldeg| 1 (QREFELT $ 79)))
                      (LETT |pss|
                            (VECTOR (SPADCALL |nx| |tvx| (QREFELT $ 36))
                                    (SPADCALL |ny| |tvx| (QREFELT $ 36)) 0
                                    |msize| |ldeg| (GETREFV_U32 0 0)
                                    (GETREFV_U32 0 0) |tvx| |tvz| (VECTOR 0)
                                    (VECTOR 0 (GETREFV_U32 10 0)
                                            (GETREFV_U32 10 0))))
                      (QSETVELT |pss| 2
                                (+ (MIN (QVELT |pss| 0) (QVELT |pss| 1)) 1))
                      (LETT |ress|
                            (|MAGCD2;algebraicGcd3a| |nx| |ny| |nlm| |tv0|
                             |pss| $))
                      (LETT |sval|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |v| NIL) (LETT #1# |sv|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |v| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL (|spadConstant| $ 80) |v|
                                                     1 (QREFELT $ 81))
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#)))))
                      (EXIT (SPADCALL |ress| |tv| |sval| (QREFELT $ 83)))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcd2;|)) 

(DEFUN |ModularAlgebraicGcd2| (&REST #1=#:G287)
  (SPROG NIL
         (PROG (#2=#:G288)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularAlgebraicGcd2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModularAlgebraicGcd2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModularAlgebraicGcd2|)))))))))) 

(DEFUN |ModularAlgebraicGcd2;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$6 NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT DV$6 (|devaluate| |#6|))
    (LETT |dv$| (LIST '|ModularAlgebraicGcd2| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6))
    (LETT $ (GETREFV 86))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (QSETREFV $ 11 |#6|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 52
              '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0| |v1|
                |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1| |w2| |w3|
                |w4| |w5| |w6| |w7| |w8| |w9|))
    (QSETREFV $ 53
              '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0| |q1|
                |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1| |r2| |r3|
                |r4| |r5| |r6| |r7| |r8| |r9|))
    (QSETREFV $ 54
              '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0| |b1|
                |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1| |c2| |c3|
                |c4| |c5| |c6| |c7| |c8| |c9|))
    $))) 

(MAKEPROP '|ModularAlgebraicGcd2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Union| 8 '#1="failed") (|Symbol|) (|List| 13) (0 . |MPtoMPT|)
              (8 . |pseudoRem|) (|Boolean|) (15 . |zero?|)
              (20 . |canonicalIfCan|) (|Integer|) (26 . >) (|Union| 9 '#1#)
              (|List| 7) (32 . |pack_modulus|) (39 . |degree|)
              (|SortedExponentVector|) (44 . |pack_exps|) (|Void|)
              (|U32Vector|) (51 . |repack1|) (|List| 20) (59 . |member?|)
              (|Record| (|:| |prime| 20) (|:| |eval1coeffbuf| 29)
                        (|:| |eval1expbuf| 26))
              (65 . |eval1|) (|NonNegativeInteger|) (73 . |degree|)
              (|VectorModularReconstructor|) (79 . |empty|) (85 . |empty?|)
              (|List| 31) (|Vector| 20) (|InnerModularHermitePade|)
              (90 . |merge_exponents|) (99 . |elt|) (105 . ~=)
              (|Record| (|:| |offsetdata| 41) (|:| |expdata| 26))
              (111 . |merge2|) (122 . |chinese_update|)
              (|Record| (|:| |nvars| 20) (|:| |offsetdata| 41)
                        (|:| |expdata| 26) (|:| |coeffdata| 29))
              (|Union| 49 '"failed") (129 . |reconstruct|) '|base_vars|
              '|alg_vars| '|param_vars| (138 . |concat|) (|Polynomial| 20)
              (144 . |Zero|) (|SparseUnivariatePolynomial| 56)
              (|PrimitiveArray| 20) (|ModularHermitePade|)
              (148 . |unpack_poly|) (|SparseUnivariatePolynomial| $)
              (157 . |multivariate|) (|IntegerPrimesPackage| 20)
              (163 . |nextPrime|) (168 . |modpreduction|)
              (|VectorIntegerReconstructor|) (174 . |empty|)
              (179 . |chinese_update|) (|Union| 59 '"failed")
              (186 . |reconstruct|) (192 . |trial_division|) (201 . >)
              (207 . |first|) (213 . |subst_vars|) (220 . |ldegree|) (226 . *)
              (|Mapping| 20 20 20) (232 . |reduce|) (239 . |One|)
              (243 . |monomial|) (|List| $) (250 . |eval|) (|List| 6)
              |MAGCD2;algebraicGcd;2PTLLSLP;7|)
           '#(|algebraicGcd| 257) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algebraicGcd|
                                 ((|Polynomial| (|Integer|)) |#1| |#1|
                                  (|List| |#1|) (|List| (|Symbol|)) (|Symbol|)
                                  (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 85
                                            '(4 11 12 7 13 14 9 15 3 11 8 8 8 9
                                              16 1 11 17 8 18 2 11 12 8 9 19 2
                                              20 17 0 0 21 3 11 22 23 14 20 24
                                              1 11 20 8 25 3 11 26 20 20 9 27 4
                                              11 28 8 29 20 9 30 2 31 17 20 0
                                              32 4 10 7 7 13 20 33 34 2 10 35 7
                                              13 36 2 37 0 20 20 38 1 26 17 0
                                              39 5 42 40 20 41 26 41 26 43 2 40
                                              31 0 20 44 2 31 17 0 0 45 7 42 46
                                              20 31 31 41 26 41 26 47 3 37 28
                                              29 20 0 48 5 37 50 0 20 41 41 26
                                              51 2 14 0 0 0 55 0 56 0 57 5 60
                                              58 14 26 59 20 20 61 2 56 0 62 13
                                              63 1 64 20 20 65 2 10 7 7 20 66 1
                                              67 0 20 68 3 67 28 29 20 0 69 2
                                              67 70 0 41 71 5 10 17 7 56 23 13
                                              14 72 2 35 17 0 0 73 2 14 0 0 35
                                              74 3 10 7 6 14 14 75 2 10 35 6 13
                                              76 2 20 0 0 0 77 3 31 20 78 0 20
                                              79 0 56 0 80 3 56 0 0 13 35 81 3
                                              56 0 0 14 82 83 6 0 56 6 6 84 14
                                              13 14 85)))))
           '|lookupComplete|)) 
