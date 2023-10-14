
(SDEFUN |MAGCD;algebraicGcd1a|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|mu| MD) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Union| MPT "failed"))
        (SPROG ((|yu| (MPT)) (|xu| (MPT)) (#1=#:G142 NIL) (|w1| (MPT)))
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
                             (GO #3=#:G141)))
                           ('T
                            (SEQ (LETT |xu| |yu| . #2#)
                                 (EXIT (LETT |yu| |w1| . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |MAGCD;compare_coeff1|
        ((|nv| |Integer|) (|exps| |SortedExponentVector|)
         (|nexps| |SortedExponentVector|) ($ |Integer|))
        (SPROG
         ((#1=#:G148 NIL) (#2=#:G149 NIL) (#3=#:G150 NIL) (|i| NIL)
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
                     (PROGN (LETT #2# -1 . #5#) (GO #6=#:G147)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (ELT_U32 |nexps| (+ |nn| |i|))
                                   (ELT_U32 |exps| (+ |ne| |i|))
                                   (QREFELT $ 19))
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 1 . #5#) (GO #6#)) . #5#)
                          (GO #7=#:G143)))))
                      #7# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #6# (EXIT #2#)))) 

(SDEFUN |MAGCD;algebraicGcd1|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|)))
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
         (SEQ
          (LETT |p| (QVELT (QVELT |pss| 10) 0) . #6=(|MAGCD;algebraicGcd1|))
          (LETT |vx| (QVELT |pss| 7) . #6#) (LETT |lvz| (QVELT |pss| 8) . #6#)
          (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT $ 22)) . #6#)
          (EXIT
           (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                 (#7='T
                  (SEQ (LETT |mu| (QCDR |mdp|) . #6#)
                       (LETT |pres|
                             (|MAGCD;algebraicGcd1a| |x| |y| |mu| |vx| |lvz| $)
                             . #6#)
                       (EXIT
                        (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                              (#7#
                               (SEQ (LETT |res1| (QCDR |pres|) . #6#)
                                    (LETT |dg| (SPADCALL |res1| (QREFELT $ 23))
                                          . #6#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |dg| (QVELT |pss| 2)
                                                 (QREFELT $ 19))
                                       (CONS 1 "failed"))
                                      (#7#
                                       (SEQ
                                        (LETT |msize| (QVELT |pss| 3) . #6#)
                                        (COND
                                         ((< |dg| (QVELT |pss| 2))
                                          (SEQ (QSETVELT |pss| 2 |dg|)
                                               (LETT |nsize|
                                                     (* (+ |dg| 1) |msize|)
                                                     . #6#)
                                               (QSETVELT |pss| 5
                                                         (SPADCALL |dg| |msize|
                                                                   |mu|
                                                                   (QREFELT $
                                                                            25)))
                                               (EXIT
                                                (QSETVELT |pss| 6
                                                          (GETREFV_U32 |nsize|
                                                                       0))))))
                                        (SPADCALL |res1| (QVELT |pss| 6) |dg|
                                                  |mu| (QREFELT $ 28))
                                        (LETT |offsets| (QVELT |pss| 9) . #6#)
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
         ((#9=#:G207 NIL)
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|good_cnt| (|Integer|)) (|coeffs| (|U32Vector|)) (|i| (|Integer|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G213 NIL)
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
          (#12=#:G204 NIL) (|gtfp| #8#) (#13=#:G205 NIL) (|lcbad| (|Boolean|))
          (#14=#:G210 NIL) (|m| NIL) (#15=#:G211 NIL) (|deg| NIL)
          (#16=#:G212 NIL) (|z| NIL)
          (|lmt| (|List| #17=(|Polynomial| (|Integer|)))) (#18=#:G209 NIL)
          (#19=#:G208 NIL) (|yt| #17#) (|xt| #17#) (|lt| (|List| (|Integer|)))
          (|t| (|Integer|)) (|nbv| #20=(|NonNegativeInteger|))
          (|nlv| (|List| (|Symbol|))) (|vt| (|Symbol|)) (|dy| #2#) (|dx| #1#)
          (|prev_coeff1| (|Polynomial| (|Integer|))) (|offsets| #5#) (|vx| #4#)
          (|p| #7#) (|pss1| #6#) (|nv| #20#))
         (SEQ
          (EXIT
           (SEQ (LETT |nv| (LENGTH |lv|) . #21=(|MAGCD;algebraicGcd2|))
                (EXIT
                 (COND
                  ((EQL |nv| 0) (|MAGCD;algebraicGcd1| |x| |y| |lm| |pss| $))
                  ('T
                   (SEQ (LETT |pss1| (QVELT |pss| 10) . #21#)
                        (LETT |p| (QVELT |pss1| 0) . #21#)
                        (LETT |vx| (QVELT |pss| 7) . #21#)
                        (LETT |offsets| (QVELT |pss| 9) . #21#)
                        (LETT |lt| NIL . #21#)
                        (LETT |exps| (GETREFV_U32 0 0) . #21#)
                        (LETT |prev_coeff1| (|spadConstant| $ 29) . #21#)
                        (LETT |dx| (QVELT |pss| 0) . #21#)
                        (LETT |dy| (QVELT |pss| 1) . #21#)
                        (LETT |dg| (QVELT |pss| 2) . #21#)
                        (LETT |vt| (|SPADfirst| |lv|) . #21#)
                        (LETT |nlv| (CDR |lv|) . #21#)
                        (LETT |nbv| (LENGTH (QVELT |pss| 8)) . #21#)
                        (LETT |good_cnt| 0 . #21#) (LETT |bad_cnt| 0 . #21#)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ (LETT |t| (RANDOM |p|) . #21#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |t| |lt| (QREFELT $ 31))
                                      "iterate")
                                     ('T
                                      (SEQ (LETT |lt| (CONS |t| |lt|) . #21#)
                                           (LETT |xt|
                                                 (SPADCALL |x| |vt| |t| |pss1|
                                                           (QREFELT $ 34))
                                                 . #21#)
                                           (LETT |yt|
                                                 (SPADCALL |y| |vt| |t| |pss1|
                                                           (QREFELT $ 34))
                                                 . #21#)
                                           (LETT |lmt|
                                                 (PROGN
                                                  (LETT #19# NIL . #21#)
                                                  (SEQ (LETT |m| NIL . #21#)
                                                       (LETT #18# |lm| . #21#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #18#)
                                                             (PROGN
                                                              (LETT |m|
                                                                    (CAR #18#)
                                                                    . #21#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #19#
                                                               (CONS
                                                                (SPADCALL |m|
                                                                          |vt|
                                                                          |t|
                                                                          |pss1|
                                                                          (QREFELT
                                                                           $
                                                                           34))
                                                                #19#)
                                                               . #21#)))
                                                       (LETT #18# (CDR #18#)
                                                             . #21#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #19#))))
                                                 . #21#)
                                           (LETT |lcbad| 'NIL . #21#)
                                           (SEQ (LETT |z| NIL . #21#)
                                                (LETT #16# (QVELT |pss| 8)
                                                      . #21#)
                                                (LETT |deg| NIL . #21#)
                                                (LETT #15# (QVELT |pss| 4)
                                                      . #21#)
                                                (LETT |m| NIL . #21#)
                                                (LETT #14# |lmt| . #21#) G190
                                                (COND
                                                 ((OR (ATOM #14#)
                                                      (PROGN
                                                       (LETT |m| (CAR #14#)
                                                             . #21#)
                                                       NIL)
                                                      (ATOM #15#)
                                                      (PROGN
                                                       (LETT |deg| (CAR #15#)
                                                             . #21#)
                                                       NIL)
                                                      (ATOM #16#)
                                                      (PROGN
                                                       (LETT |z| (CAR #16#)
                                                             . #21#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (COND
                                                   ((<
                                                     (SPADCALL |m| |z|
                                                               (QREFELT $ 36))
                                                     |deg|)
                                                    (LETT |lcbad| 'T
                                                          . #21#)))))
                                                (LETT #14#
                                                      (PROG1 (CDR #14#)
                                                        (LETT #15#
                                                              (PROG1 (CDR #15#)
                                                                (LETT #16#
                                                                      (CDR
                                                                       #16#)
                                                                      . #21#))
                                                              . #21#))
                                                      . #21#)
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
                                                       (+ |bad_cnt| 1) . #21#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 19))
                                                    (PROGN
                                                     (LETT #13#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        #22="failed")
                                                                  . #21#)
                                                            (GO #23=#:G203))
                                                           . #21#)
                                                     (GO #24=#:G175)))))))
                                               #24# (EXIT #13#))))
                                            ((<
                                              (SPADCALL |yt| |vx|
                                                        (QREFELT $ 36))
                                              |dy|)
                                             (EXIT
                                              (SEQ
                                               (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                     . #21#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |bad_cnt|
                                                            (+ |good_cnt| 2)
                                                            (QREFELT $ 19))
                                                  (PROGN
                                                   (LETT #9# (CONS 1 #22#)
                                                         . #21#)
                                                   (GO #23#)))))))))
                                           (LETT |gtfp|
                                                 (|MAGCD;algebraicGcd2| |xt|
                                                  |yt| |lmt| |nlv| |pss| $)
                                                 . #21#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |gtfp| 1)
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1) . #21#)
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |bad_cnt|
                                                              (+ |good_cnt| 2)
                                                              (QREFELT $ 19))
                                                    (PROGN
                                                     (LETT #12#
                                                           (PROGN
                                                            (LETT #9#
                                                                  (CONS 1
                                                                        "failed")
                                                                  . #21#)
                                                            (GO #23#))
                                                           . #21#)
                                                     (GO #25=#:G180)))))))
                                               #25# (EXIT #12#)))
                                             ('T
                                              (SEQ
                                               (LETT |gtf| (QCDR |gtfp|)
                                                     . #21#)
                                               (LETT |nexps| (QVELT |gtf| 2)
                                                     . #21#)
                                               (LETT |coeffs| (QVELT |gtf| 3)
                                                     . #21#)
                                               (COND
                                                ((OR (< (QVELT |pss| 2) |dg|)
                                                     (SPADCALL |exps|
                                                               (QREFELT $ 39)))
                                                 (SEQ
                                                  (LETT |exps| |nexps| . #21#)
                                                  (LETT |rstate|
                                                        (SPADCALL
                                                         (QV_LEN_U32 |coeffs|)
                                                         (QVELT |pss1| 0)
                                                         (QREFELT $ 38))
                                                        . #21#)
                                                  (LETT |bad_cnt| 0 . #21#)
                                                  (EXIT
                                                   (LETT |good_cnt| 0
                                                         . #21#)))))
                                               (COND
                                                ((< (QVELT |pss| 2) |dg|)
                                                 (LETT |dg| (QVELT |pss| 2)
                                                       . #21#)))
                                               (LETT |cc|
                                                     (|MAGCD;compare_coeff1|
                                                      (+ |nv| |nbv|) |exps|
                                                      |nexps| $)
                                                     . #21#)
                                               (EXIT
                                                (COND
                                                 ((< |cc| 0)
                                                  (SEQ
                                                   (LETT |bad_cnt|
                                                         (+ |bad_cnt| 1)
                                                         . #21#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |bad_cnt|
                                                                (+ |good_cnt|
                                                                   2)
                                                                (QREFELT $ 19))
                                                      (PROGN
                                                       (LETT #9#
                                                             (CONS 1 "failed")
                                                             . #21#)
                                                       (GO #23#)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |dl|
                                                         (SPADCALL
                                                          (+ |nv| |nbv|)
                                                          |offsets| |exps|
                                                          |offsets| |nexps|
                                                          (QREFELT $ 43))
                                                         . #21#)
                                                   (LETT |odl|
                                                         (SPADCALL |dl| 1
                                                                   (QREFELT $
                                                                            44))
                                                         . #21#)
                                                   (LETT |ndl|
                                                         (SPADCALL |dl| 2
                                                                   (QREFELT $
                                                                            44))
                                                         . #21#)
                                                   (COND
                                                    ((SPADCALL |odl| NIL
                                                               (QREFELT $ 45))
                                                     (SEQ
                                                      (LETT |oer|
                                                            (SPADCALL
                                                             (+ |nv| |nbv|)
                                                             |odl| |ndl|
                                                             |offsets| |exps|
                                                             |offsets| |nexps|
                                                             (QREFELT $ 47))
                                                            . #21#)
                                                      (LETT |exps| (QCDR |oer|)
                                                            . #21#)
                                                      (LETT |ncc|
                                                            (QUOTIENT2
                                                             (QV_LEN_U32
                                                              |exps|)
                                                             (+ |nv| |nbv|))
                                                            . #21#)
                                                      (LETT |rstate|
                                                            (SPADCALL |ncc| |p|
                                                                      (QREFELT
                                                                       $ 38))
                                                            . #21#)
                                                      (EXIT
                                                       (LETT |good_cnt| 0
                                                             . #21#)))))
                                                   (COND
                                                    ((SPADCALL |ndl| NIL
                                                               (QREFELT $ 45))
                                                     (SEQ
                                                      (LETT |n0|
                                                            (QV_LEN_U32
                                                             |coeffs|)
                                                            . #21#)
                                                      (LETT |nn| (LENGTH |ndl|)
                                                            . #21#)
                                                      (LETT |n1| (+ |n0| |nn|)
                                                            . #21#)
                                                      (LETT |ncoeffs|
                                                            (GETREFV_U32 |n1|
                                                                         0)
                                                            . #21#)
                                                      (LETT |i| 0 . #21#)
                                                      (LETT |jl|
                                                            (|SPADfirst| |ndl|)
                                                            . #21#)
                                                      (SEQ (LETT |j| 0 . #21#)
                                                           (LETT #11#
                                                                 (- |n1| 1)
                                                                 . #21#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |j|
                                                                           #11#)
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
                                                                      . #21#)
                                                                (EXIT
                                                                 (LETT |jl|
                                                                       (COND
                                                                        ((NULL
                                                                          |ndl|)
                                                                         |n1|)
                                                                        ('T
                                                                         (|SPADfirst|
                                                                          |ndl|)))
                                                                       . #21#))))
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
                                                                       . #21#)))))))
                                                           (LETT |j|
                                                                 (|inc_SI| |j|)
                                                                 . #21#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                      (EXIT
                                                       (LETT |coeffs| |ncoeffs|
                                                             . #21#)))))
                                                   (SPADCALL |coeffs| |t|
                                                             |rstate|
                                                             (QREFELT $ 48))
                                                   (LETT |good_cnt|
                                                         (+ |good_cnt| 1)
                                                         . #21#)
                                                   (LETT |pp|
                                                         (SPADCALL |rstate|
                                                                   (+ |nv|
                                                                      |nbv|)
                                                                   |offsets|
                                                                   |offsets|
                                                                   |exps|
                                                                   (QREFELT $
                                                                            51))
                                                         . #21#)
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |pp| 1)
                                                      "iterate")
                                                     ('T
                                                      (PROGN
                                                       (LETT #9#
                                                             (CONS 0
                                                                   (QCDR |pp|))
                                                             . #21#)
                                                       (GO
                                                        #23#))))))))))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #23# (EXIT #9#)))) 

(SDEFUN |MAGCD;trialDivision2|
        ((|x| |Polynomial| (|Integer|)) (|g| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|vx| |Symbol|)
         (|lvz| |List| (|Symbol|)) ($ |Boolean|))
        (SPROG ((#1=#:G217 NIL) (|m| NIL) (#2=#:G216 NIL))
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
                          (LIST |vx|) |lvz| (QREFELT $ 58))))) 

(SDEFUN |MAGCD;reconstruct3|
        ((|lv| |List| (|Symbol|)) (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         (|exps| |SortedExponentVector|) (|pp| |PrimitiveArray| (|Integer|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|pres| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|nlv| (|List| (|Symbol|))))
         (SEQ
          (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT $ 59))
                . #1=(|MAGCD;reconstruct3|))
          (LETT |pres|
                (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1)
                          (QREFELT $ 63))
                . #1#)
          (EXIT (SPADCALL |pres| |vx| (QREFELT $ 65)))))) 

(SDEFUN |MAGCD;algebraicGcd3a|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
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
          (|deg| NIL) (#14=#:G260 NIL) (|z| NIL)
          (|lmp| (|List| #15=(|Polynomial| (|Integer|)))) (#16=#:G257 NIL)
          (#17=#:G256 NIL) (|yp| #15#) (|xp| #15#) (|lp| (|List| (|Integer|)))
          (|p| (|Integer|)) (|nv| (|NonNegativeInteger|)) (|nbv| (|Integer|))
          (|lvz| #5#) (|pss1| #7#) (|vx| #4#) (|dy| #2#) (|dx| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #18=(|MAGCD;algebraicGcd3a|))
                (LETT |dx| (QVELT |pss| 0) . #18#)
                (LETT |dy| (QVELT |pss| 1) . #18#)
                (LETT |dg| (QVELT |pss| 2) . #18#)
                (LETT |vx| (QVELT |pss| 7) . #18#)
                (LETT |pss1| (QVELT |pss| 10) . #18#)
                (LETT |lvz| (QVELT |pss| 8) . #18#)
                (LETT |nbv| (+ (LENGTH |lvz|) 1) . #18#)
                (LETT |nv| (LENGTH |lv|) . #18#)
                (LETT |offsets| (QVELT |pss| 9) . #18#)
                (LETT |exps| (GETREFV_U32 0 0) . #18#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL (+ (RANDOM 1000000) 500000)
                                       (QREFELT $ 67))
                             . #18#)
                       (EXIT
                        (COND ((SPADCALL |p| |lp| (QREFELT $ 31)) 0)
                              ('T
                               (SEQ (LETT |lp| (CONS |p| |lp|) . #18#)
                                    (QSETVELT |pss1| 0 |p|)
                                    (LETT |xp|
                                          (SPADCALL |x| |p| (QREFELT $ 68))
                                          . #18#)
                                    (LETT |yp|
                                          (SPADCALL |y| |p| (QREFELT $ 68))
                                          . #18#)
                                    (COND
                                     ((< (SPADCALL |xp| |vx| (QREFELT $ 36))
                                         |dx|)
                                      (COND
                                       ((< (SPADCALL |yp| |vx| (QREFELT $ 36))
                                           |dy|)
                                        (EXIT "iterate")))))
                                    (LETT |lmp|
                                          (PROGN
                                           (LETT #17# NIL . #18#)
                                           (SEQ (LETT |m| NIL . #18#)
                                                (LETT #16# |lm| . #18#) G190
                                                (COND
                                                 ((OR (ATOM #16#)
                                                      (PROGN
                                                       (LETT |m| (CAR #16#)
                                                             . #18#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #17#
                                                        (CONS
                                                         (SPADCALL |m| |p|
                                                                   (QREFELT $
                                                                            68))
                                                         #17#)
                                                        . #18#)))
                                                (LETT #16# (CDR #16#) . #18#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #17#))))
                                          . #18#)
                                    (LETT |lcbad| 'NIL . #18#)
                                    (SEQ (LETT |z| NIL . #18#)
                                         (LETT #14# |lvz| . #18#)
                                         (LETT |deg| NIL . #18#)
                                         (LETT #13# (QVELT |pss| 4) . #18#)
                                         (LETT |m| NIL . #18#)
                                         (LETT #12# |lm| . #18#) G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |m| (CAR #12#) . #18#)
                                                NIL)
                                               (ATOM #13#)
                                               (PROGN
                                                (LETT |deg| (CAR #13#) . #18#)
                                                NIL)
                                               (ATOM #14#)
                                               (PROGN
                                                (LETT |z| (CAR #14#) . #18#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((<
                                              (SPADCALL |m| |z| (QREFELT $ 36))
                                              |deg|)
                                             (LETT |lcbad| 'T . #18#)))))
                                         (LETT #12#
                                               (PROG1 (CDR #12#)
                                                 (LETT #13#
                                                       (PROG1 (CDR #13#)
                                                         (LETT #14# (CDR #14#)
                                                               . #18#))
                                                       . #18#))
                                               . #18#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND (|lcbad| "iterate")
                                           ('T
                                            (SEQ
                                             (LETT |gtpp|
                                                   (|MAGCD;algebraicGcd2| |xp|
                                                    |yp| |lmp| |lv| |pss| $)
                                                   . #18#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |gtpp| 1) "iterate")
                                               ('T
                                                (SEQ
                                                 (LETT |gtp| (QCDR |gtpp|)
                                                       . #18#)
                                                 (LETT |nexps| (QVELT |gtp| 2)
                                                       . #18#)
                                                 (LETT |coeffs| (QVELT |gtp| 3)
                                                       . #18#)
                                                 (COND
                                                  ((OR (< (QVELT |pss| 2) |dg|)
                                                       (SPADCALL |exps|
                                                                 (QREFELT $
                                                                          39)))
                                                   (SEQ
                                                    (LETT |exps| |nexps|
                                                          . #18#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (QV_LEN_U32
                                                             |coeffs|)
                                                            (QREFELT $ 70))
                                                           . #18#)))))
                                                 (COND
                                                  ((< (QVELT |pss| 2) |dg|)
                                                   (LETT |dg| (QVELT |pss| 2)
                                                         . #18#)))
                                                 (LETT |dl|
                                                       (SPADCALL (+ |nv| |nbv|)
                                                                 |offsets|
                                                                 |exps|
                                                                 |offsets|
                                                                 |nexps|
                                                                 (QREFELT $
                                                                          43))
                                                       . #18#)
                                                 (LETT |odl|
                                                       (SPADCALL |dl| 1
                                                                 (QREFELT $
                                                                          44))
                                                       . #18#)
                                                 (LETT |ndl|
                                                       (SPADCALL |dl| 2
                                                                 (QREFELT $
                                                                          44))
                                                       . #18#)
                                                 (COND
                                                  ((SPADCALL |odl| NIL
                                                             (QREFELT $ 45))
                                                   (SEQ
                                                    (LETT |oer|
                                                          (SPADCALL
                                                           (+ |nv| |nbv|) |odl|
                                                           |ndl| |offsets|
                                                           |exps| |offsets|
                                                           |nexps|
                                                           (QREFELT $ 47))
                                                          . #18#)
                                                    (LETT |offsets|
                                                          (QCAR |oer|) . #18#)
                                                    (LETT |exps| (QCDR |oer|)
                                                          . #18#)
                                                    (LETT |ncc|
                                                          (QUOTIENT2
                                                           (QV_LEN_U32 |exps|)
                                                           (+ |nv| |nbv|))
                                                          . #18#)
                                                    (EXIT
                                                     (LETT |rstate|
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #11#
                                                                      |ncc|
                                                                      . #18#)
                                                              (|check_subtype2|
                                                               (>= #11# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #11#))
                                                            (QREFELT $ 70))
                                                           . #18#)))))
                                                 (COND
                                                  ((SPADCALL |ndl| NIL
                                                             (QREFELT $ 45))
                                                   (SEQ
                                                    (LETT |n0|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #18#)
                                                    (LETT |nn| (LENGTH |ndl|)
                                                          . #18#)
                                                    (LETT |n1| (+ |n0| |nn|)
                                                          . #18#)
                                                    (LETT |ncoeffs|
                                                          (GETREFV_U32 |n1| 0)
                                                          . #18#)
                                                    (LETT |i| 0 . #18#)
                                                    (LETT |jl|
                                                          (|SPADfirst| |ndl|)
                                                          . #18#)
                                                    (SEQ (LETT |j| 0 . #18#)
                                                         (LETT #10# (- |n1| 1)
                                                               . #18#)
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
                                                               |ncoeffs| |j| 0)
                                                              (LETT |ndl|
                                                                    (CDR |ndl|)
                                                                    . #18#)
                                                              (EXIT
                                                               (LETT |jl|
                                                                     (COND
                                                                      ((NULL
                                                                        |ndl|)
                                                                       |n1|)
                                                                      ('T
                                                                       (|SPADfirst|
                                                                        |ndl|)))
                                                                     . #18#))))
                                                            ('T
                                                             (SEQ
                                                              (SETELT_U32
                                                               |ncoeffs| |j|
                                                               (ELT_U32
                                                                |coeffs| |i|))
                                                              (EXIT
                                                               (LETT |i|
                                                                     (+ |i| 1)
                                                                     . #18#)))))))
                                                         (LETT |j|
                                                               (|inc_SI| |j|)
                                                               . #18#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (LETT |coeffs| |ncoeffs|
                                                           . #18#)))))
                                                 (SPADCALL |coeffs| |p|
                                                           |rstate|
                                                           (QREFELT $ 71))
                                                 (LETT |pp|
                                                       (SPADCALL |rstate|
                                                                 |offsets|
                                                                 (QREFELT $
                                                                          73))
                                                       . #18#)
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
                                                           . #18#)
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
                                                           (LETT #8# |res|
                                                                 . #18#)
                                                           (GO
                                                            #19=#:G254))))))))))))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #19# (EXIT #8#)))) 

(SDEFUN |MAGCD;algebraicGcd;2PLLSLP;8|
        ((|x| |Polynomial| (|Integer|)) (|y| |Polynomial| (|Integer|))
         (|lm| |List| (|Polynomial| (|Integer|))) (|lv| |List| (|Symbol|))
         (|vx| |Symbol|) (|lvz| |List| (|Symbol|))
         ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|sval| (|List| (|Polynomial| (|Integer|)))) (#1=#:G287 NIL)
          (|v| NIL) (#2=#:G286 NIL) (|ress| (|Polynomial| (|Integer|)))
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
          (|msize| (|Integer|)) (|ldeg| (|List| (|Integer|))) (#3=#:G284 NIL)
          (|m| NIL) (#4=#:G285 NIL) (|vz| NIL) (#5=#:G283 NIL)
          (|nlm| (|List| #6=(|Polynomial| (|Integer|)))) (#7=#:G282 NIL)
          (#8=#:G281 NIL) (|ny| #6#) (|nx| #6#)
          (|tval| (|List| (|Polynomial| (|Integer|)))) (#9=#:G280 NIL)
          (#10=#:G279 NIL) (|sv| (|List| (|Symbol|)))
          (|tv| (|List| (|Symbol|))) (|tvz| (|List| (|Symbol|)))
          (|tvx| (|Symbol|)) (|tv0| (|List| (|Symbol|)))
          (|na| #11=(|NonNegativeInteger|)) (|n| #11#))
         (SEQ (LETT |n| (LENGTH |lv|) . #12=(|MAGCD;algebraicGcd;2PLLSLP;8|))
              (LETT |na| (LENGTH |lvz|) . #12#)
              (EXIT
               (COND
                ((SPADCALL |n| 30 (QREFELT $ 74))
                 (|error| "Too many variables"))
                ('T
                 (SEQ
                  (LETT |tv0| (SPADCALL (QREFELT $ 54) |n| (QREFELT $ 75))
                        . #12#)
                  (LETT |tvx| (|SPADfirst| (QREFELT $ 52)) . #12#)
                  (LETT |tvz|
                        (REVERSE (SPADCALL (QREFELT $ 53) |na| (QREFELT $ 75)))
                        . #12#)
                  (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT $ 59)) . #12#)
                  (LETT |tv| (CONS |tvx| |tv|) . #12#)
                  (LETT |sv| (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT $ 59)))
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
                                       (SPADCALL (|spadConstant| $ 76) |v| 1
                                                 (QREFELT $ 77))
                                       #10#)
                                      . #12#)))
                              (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #10#))))
                        . #12#)
                  (LETT |nx| (SPADCALL |x| |sv| |tval| (QREFELT $ 79)) . #12#)
                  (LETT |ny| (SPADCALL |y| |sv| |tval| (QREFELT $ 79)) . #12#)
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
                                                 (QREFELT $ 79))
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
                                      (CONS (SPADCALL |m| |vz| (QREFELT $ 36))
                                            #5#)
                                      . #12#)))
                              (LETT #3#
                                    (PROG1 (CDR #3#)
                                      (LETT #4# (CDR #4#) . #12#))
                                    . #12#)
                              (GO G190) G191 (EXIT (NREVERSE #5#))))
                        . #12#)
                  (LETT |msize| (SPADCALL (ELT $ 81) |ldeg| 1 (QREFELT $ 83))
                        . #12#)
                  (LETT |pss|
                        (VECTOR (SPADCALL |nx| |tvx| (QREFELT $ 36))
                                (SPADCALL |ny| |tvx| (QREFELT $ 36)) 0 |msize|
                                |ldeg| (GETREFV_U32 0 0) (GETREFV_U32 0 0)
                                |tvx| |tvz| (VECTOR 0)
                                (VECTOR 0 (GETREFV_U32 10 0)
                                        (GETREFV_U32 10 0)))
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
                                       (SPADCALL (|spadConstant| $ 76) |v| 1
                                                 (QREFELT $ 77))
                                       #2#)
                                      . #12#)))
                              (LETT #1# (CDR #1#) . #12#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #12#)
                  (EXIT (SPADCALL |ress| |tv| |sval| (QREFELT $ 79)))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcd;|)) 

(DEFUN |ModularAlgebraicGcd| (&REST #1=#:G288)
  (SPROG NIL
         (PROG (#2=#:G289)
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
          (LETT $ (GETREFV 85) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 52
                    '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0|
                      |v1| |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1|
                      |w2| |w3| |w4| |w5| |w6| |w7| |w8| |w9|))
          (QSETREFV $ 53
                    '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0|
                      |q1| |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1|
                      |r2| |r3| |r4| |r5| |r6| |r7| |r8| |r9|))
          (QSETREFV $ 54
                    '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0|
                      |b1| |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1|
                      |c2| |c3| |c4| |c5| |c6| |c7| |c8| |c9|))
          $))) 

(MAKEPROP '|ModularAlgebraicGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Polynomial| 18) (|Symbol|) (|List| 10)
              (0 . |MPtoMPT|) (8 . |pseudoRem|) (|Boolean|) (15 . |zero?|)
              (|Union| 6 '#1="failed") (20 . |canonicalIfCan|) (|Integer|)
              (26 . >) (|Union| 7 '#1#) (|List| 9) (32 . |pack_modulus|)
              (39 . |degree|) (|SortedExponentVector|) (44 . |pack_exps|)
              (|Void|) (|U32Vector|) (51 . |repack1|) (59 . |Zero|) (|List| 18)
              (63 . |member?|)
              (|Record| (|:| |prime| 18) (|:| |eval1coeffbuf| 27)
                        (|:| |eval1expbuf| 24))
              (|PolynomialEvaluationUtilities|) (69 . |eval1|)
              (|NonNegativeInteger|) (77 . |degree|)
              (|VectorModularReconstructor|) (83 . |empty|) (89 . |empty?|)
              (|List| 30) (|Vector| 18) (|InnerModularHermitePade|)
              (94 . |merge_exponents|) (103 . |elt|) (109 . ~=)
              (|Record| (|:| |offsetdata| 41) (|:| |expdata| 24))
              (115 . |merge2|) (126 . |chinese_update|)
              (|Record| (|:| |nvars| 18) (|:| |offsetdata| 41)
                        (|:| |expdata| 24) (|:| |coeffdata| 27))
              (|Union| 49 '"failed") (133 . |reconstruct|) '|base_vars|
              '|alg_vars| '|param_vars| (|SparseMultivariatePolynomial| 18 10)
              (|List| 55) (|PrimGCD|) (142 . |alg_trial_division|)
              (151 . |concat|) (|SparseUnivariatePolynomial| 9)
              (|PrimitiveArray| 18) (|ModularHermitePade|)
              (157 . |unpack_poly|) (|SparseUnivariatePolynomial| $)
              (166 . |multivariate|) (|IntegerPrimesPackage| 18)
              (172 . |nextPrime|) (177 . |modpreduction|)
              (|VectorIntegerReconstructor|) (183 . |empty|)
              (188 . |chinese_update|) (|Union| 61 '"failed")
              (195 . |reconstruct|) (201 . >) (207 . |first|) (213 . |One|)
              (217 . |monomial|) (|List| $) (224 . |eval|) (231 . *) (237 . *)
              (|Mapping| 18 18 18) (243 . |reduce|)
              |MAGCD;algebraicGcd;2PLLSLP;8|)
           '#(|algebraicGcd| 250) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 84
                                                 '(4 8 6 9 10 11 7 12 3 8 6 6 6
                                                   7 13 1 8 14 6 15 2 8 16 6 7
                                                   17 2 18 14 0 0 19 3 8 20 21
                                                   11 18 22 1 8 18 6 23 3 8 24
                                                   18 18 7 25 4 8 26 6 27 18 7
                                                   28 0 9 0 29 2 30 14 18 0 31
                                                   4 33 9 9 10 18 32 34 2 9 35
                                                   0 10 36 2 37 0 18 18 38 1 24
                                                   14 0 39 5 42 40 18 41 24 41
                                                   24 43 2 40 30 0 18 44 2 30
                                                   14 0 0 45 7 42 46 18 30 30
                                                   41 24 41 24 47 3 37 26 27 18
                                                   0 48 5 37 50 0 18 41 41 24
                                                   51 5 57 14 55 55 56 11 11 58
                                                   2 11 0 0 0 59 5 62 60 11 24
                                                   61 18 18 63 2 9 0 64 10 65 1
                                                   66 18 18 67 2 33 9 9 18 68 1
                                                   69 0 18 70 3 69 26 27 18 0
                                                   71 2 69 72 0 41 73 2 35 14 0
                                                   0 74 2 11 0 0 35 75 0 9 0 76
                                                   3 9 0 0 10 35 77 3 9 0 0 11
                                                   78 79 2 9 0 0 0 80 2 18 0 18
                                                   0 81 3 30 18 82 0 18 83 6 0
                                                   9 9 9 21 11 10 11 84)))))
           '|lookupComplete|)) 
