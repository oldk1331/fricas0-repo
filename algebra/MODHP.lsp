
(SDEFUN |MODHP;SUPI_to_PA|
        ((|poli| |SparseUnivariatePolynomial| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|nlc| (|Integer|)) (|m| #1=(|NonNegativeInteger|))
          (|pa| (|U32Vector|)) (|n| #1#))
         (SEQ
          (LETT |n| (SPADCALL |poli| (QREFELT $ 8)) . #2=(|MODHP;SUPI_to_PA|))
          (LETT |pa| (GETREFV_U32 (+ |n| 1) 0) . #2#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |poli| (QREFELT $ 10)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 8)) . #2#)
                    (LETT |nlc|
                          (SPADCALL (SPADCALL |poli| (QREFELT $ 12)) |p|
                                    (QREFELT $ 13))
                          . #2#)
                    (SETELT_U32 |pa| |m| |nlc|)
                    (EXIT
                     (LETT |poli| (SPADCALL |poli| (QREFELT $ 14)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |pa|)))) 

(SDEFUN |MODHP;VSUPI_to_VPA;VIV;2|
        ((|vps| |Vector| (|SparseUnivariatePolynomial| (|Integer|)))
         (|p| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G149 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #2=(|MODHP;VSUPI_to_VPA;VIV;2|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 16)) |p| $)
                               (QREFELT $ 19))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;SUPPI_to_PA|
        ((|poli| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|nlc| (|Integer|)) (|m| #1=(|NonNegativeInteger|))
          (|pa| (|U32Vector|)) (|n| #1#))
         (SEQ
          (LETT |n| (SPADCALL |poli| (QREFELT $ 22))
                . #2=(|MODHP;SUPPI_to_PA|))
          (LETT |pa| (GETREFV_U32 (+ |n| 1) 0) . #2#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |poli| (QREFELT $ 23)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 22)) . #2#)
                    (LETT |nlc|
                          (SPADCALL (SPADCALL |poli| (QREFELT $ 25)) |vars|
                                    |pts| |p| (QREFELT $ 29))
                          . #2#)
                    (SETELT_U32 |pa| |m| |nlc|)
                    (EXIT
                     (LETT |poli| (SPADCALL |poli| (QREFELT $ 30)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |pa|)))) 

(SDEFUN |MODHP;VSUPPI_to_VPA;VLLIV;4|
        ((|vps| |Vector|
          (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|)) (|p| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G158 NIL) (|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #2=(|MODHP;VSUPPI_to_VPA;VLLIV;4|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 32)) |vars|
                                |pts| |p| $)
                               (QREFELT $ 19))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;LLFI_to_LPA;L2IU;5|
        ((|llfi| |List| (|List| (|Fraction| (|Integer|)))) (|n| |Integer|)
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G172 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G174 NIL) (|j| NIL) (#4=#:G175 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (|nn| (|Integer|)) (#5=#:G173 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #6=(|MODHP;LLFI_to_LPA;L2IU;5|))
                (SEQ (LETT |lfi| NIL . #6#) (LETT #5# |llfi| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |nn|
                            (COND ((SPADCALL |n| 0 (QREFELT $ 36)) |n|)
                                  ('T (LENGTH |lfi|)))
                            . #6#)
                      (LETT |pa| (GETREFV_U32 |nn| 0) . #6#)
                      (SEQ (LETT |el| NIL . #6#) (LETT #4# |lfi| . #6#)
                           (LETT |j| 0 . #6#) (LETT #3# (- |nn| 1) . #6#) G190
                           (COND
                            ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                 (PROGN (LETT |el| (CAR #4#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 37))
                                            |prime| (QREFELT $ 13))
                                  . #6#)
                            (LETT |dm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 38))
                                            |prime| (QREFELT $ 13))
                                  . #6#)
                            (EXIT
                             (COND
                              ((EQL |dm| 0)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #6#)
                                (GO #7=#:G171)))
                              ('T
                               (SEQ (LETT |dms| |dm| . #6#)
                                    (LETT |nlc|
                                          (QSMULMOD32 |nm|
                                                      (SPADCALL |dms| |prime|
                                                                (QREFELT $ 40))
                                                      |prime|)
                                          . #6#)
                                    (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|)
                                   (LETT #4# (CDR #4#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |pa| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #1#)))) 

(SDEFUN |MODHP;LLFPI_to_LPA;LILLIU;6|
        ((|llfi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|n| |Integer|) (|vars| |List| (|Symbol|)) (|pts| |List| (|Integer|))
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#1=#:G186 NIL) (|dm| #2=(|Integer|))
          (|nm| #2#) (#3=#:G188 NIL) (|j| NIL) (#4=#:G189 NIL) (|el| NIL)
          (|pa| (|U32Vector|)) (#5=#:G187 NIL) (|lfi| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #6=(|MODHP;LLFPI_to_LPA;LILLIU;6|))
                (SEQ (LETT |lfi| NIL . #6#) (LETT #5# |llfi| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |lfi| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ (LETT |pa| (GETREFV_U32 |n| 0) . #6#)
                          (SEQ (LETT |el| NIL . #6#) (LETT #4# |lfi| . #6#)
                               (LETT |j| 0 . #6#) (LETT #3# (- |n| 1) . #6#)
                               G190
                               (COND
                                ((OR (|greater_SI| |j| #3#) (ATOM #4#)
                                     (PROGN (LETT |el| (CAR #4#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |nm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 45))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 29))
                                      . #6#)
                                (LETT |dm|
                                      (SPADCALL (SPADCALL |el| (QREFELT $ 46))
                                                |vars| |pts| |prime|
                                                (QREFELT $ 29))
                                      . #6#)
                                (EXIT
                                 (COND
                                  ((EQL |dm| 0)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #6#)
                                    (GO #7=#:G185)))
                                  ('T
                                   (SEQ (LETT |dms| |dm| . #6#)
                                        (LETT |nlc|
                                              (QSMULMOD32 |nm|
                                                          (SPADCALL |dms|
                                                                    |prime|
                                                                    (QREFELT $
                                                                             40))
                                                          |prime|)
                                              . #6#)
                                        (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                               (LETT |j|
                                     (PROG1 (|inc_SI| |j|)
                                       (LETT #4# (CDR #4#) . #6#))
                                     . #6#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |pa| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #1#)))) 

(SDEFUN |MODHP;PPFtoPA|
        ((|pfi| |SparseUnivariatePolynomial| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|U32Vector|) "failed"))
        (SPROG
         ((|nc| (|Integer|)) (|nlcq| (|Integer|)) (|m| (|NonNegativeInteger|))
          (|prime| (|Integer|)) (|pa| (|U32Vector|)))
         (SEQ (LETT |pa| (GETREFV_U32 |sigma| 0) . #1=(|MODHP;PPFtoPA|))
              (LETT |prime| |psi| . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |pfi| (QREFELT $ 10)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |pfi| (QREFELT $ 8)) . #1#)
                        (COND
                         ((< |m| |sigma|)
                          (SEQ
                           (LETT |nlcq| (SPADCALL |pfi| (QREFELT $ 12)) . #1#)
                           (LETT |nc| (SPADCALL |nlcq| |prime| (QREFELT $ 13))
                                 . #1#)
                           (EXIT (SETELT_U32 |pa| |m| |nc|)))))
                        (EXIT
                         (LETT |pfi| (SPADCALL |pfi| (QREFELT $ 14)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |pa|))))) 

(SDEFUN |MODHP;LPPFtoVPA|
        ((|lpi| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         (|sigma| |NonNegativeInteger|) (|psi| |SingleInteger|)
         ($ |Union| (|Vector| (|U32Vector|)) "failed"))
        (SPROG
         ((#1=#:G206 NIL) (|vpp| (|Union| (|U32Vector|) "failed"))
          (#2=#:G207 NIL) (|i| NIL) (#3=#:G208 NIL) (|p| NIL)
          (|vpa| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |lpi|) . #4=(|MODHP;LPPFtoVPA|))
                (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #4#)
                (SEQ (LETT |p| NIL . #4#) (LETT #3# |lpi| . #4#)
                     (LETT |i| 1 . #4#) (LETT #2# |m| . #4#) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #3#)
                           (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| $) . #4#)
                      (EXIT
                       (COND
                        ((QEQCAR |vpp| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #4#)
                          (GO #5=#:G205)))
                        ('T
                         (SPADCALL |vpa| |i| (QCDR |vpp|) (QREFELT $ 19))))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |vpa|))))
          #5# (EXIT #1#)))) 

(SDEFUN |MODHP;intpoly_to_PFI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 49) |p| (QREFELT $ 53))) 

(SDEFUN |MODHP;check_sol1a;VLM3IUv;10|
        ((|nres| |Vector| (|U32Vector|)) (|gv0| |List| (|U32Vector|))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|sigma| |Integer|) (|qval| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((#1=#:G214 NIL) (|i| NIL) (|res| (|U32Vector|))
          (|gvp| (|Vector| (|U32Vector|))) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |nres|) . #2=(|MODHP;check_sol1a;VLM3IUv;10|))
              (LETT |gvp| (SPADCALL |gv0| |p| |qval| |gen|) . #2#)
              (LETT |res| (GETREFV_U32 |sigma| 0) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |m| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |gvp| |i| (QREFELT $ 54))
                               (SPADCALL |nres| |i| (QREFELT $ 54)) |res|
                               (- |sigma| 1) |p| (QREFELT $ 58))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;HP_solve_I;LLSNniMMU;11|
        ((|list| |List| (|List| (|Fraction| (|Integer|))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
          (|Boolean|)))
        (SPROG
         ((#4=#:G306 NIL) (#5=#:G319 NIL) (|l| NIL) (#6=#:G318 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#7=#:G281 NIL) (|ii| (|Integer|)) (#8=#:G304 NIL)
          (|sol_ok| #9=(|Boolean|)) (|sol_okp| (|Union| #1# #2# #3#))
          (|k| (|Integer|)) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (#10=#:G317 NIL) (|mm| (|Integer|)) (#11=#:G316 NIL)
          (|j| (|Integer|))
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#12=#:G315 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#13=#:G268 NIL) (|ppr| (|PrimitiveArray| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|empty_offsets| #9#) (#14=#:G314 NIL)
          (|offsets| (|Vector| (|Integer|))) (#15=#:G260 NIL) (#16=#:G313 NIL)
          (|cp| (|U32Vector|)) (#17=#:G312 NIL) (#18=#:G311 NIL)
          (|rv| #19=(|U32Vector|)) (#20=#:G250 NIL)
          (|rstate| (|VectorIntegerReconstructor|))
          (|oldciv| #21=(|Vector| (|Integer|)))
          (|oldva| #22=(|Vector| (|Integer|))) (|nsols| (|Integer|))
          (#23=#:G305 NIL) (|is_bad| #24=(|Boolean|)) (|all_bad| (|Boolean|))
          (#25=#:G310 NIL) (|civ| #21#) (|va| #22#)
          (|bm| #26=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #26#) (|:| |defects| #22#)
                      (|:| |cinds| #21#))
            "no_solution"))
          (|gv2| (|Vector| (|U32Vector|))) (|gv0| (|List| (|U32Vector|)))
          (|gv0p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|psi| (|SingleInteger|)) (|nprimes| (|Integer|)) (|ok| #24#)
          (|lp| (|List| (|Integer|))) (|prime| (|Integer|))
          (|maxd| (|Integer|)) (|vi| (|Vector| (|List| (|Integer|))))
          (|pts| (|U32Vector|)) (#27=#:G303 NIL) (#28=#:G309 NIL) (|pts0| #19#)
          (|ve| (|Vector| (|Integer|))) (#29=#:G308 NIL) (|d| NIL)
          (#30=#:G307 NIL) (|degs_sum| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #31=(|MODHP;HP_solve_I;LLSNniMMU;11|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #31#)
                (LETT |degs_sum|
                      (+ (SPADCALL (ELT $ 62) |degs| (QREFELT $ 64)) |m|)
                      . #31#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #30# NIL . #31#)
                        (SEQ (LETT |d| NIL . #31#) (LETT #29# |degs| . #31#)
                             G190
                             (COND
                              ((OR (ATOM #29#)
                                   (PROGN (LETT |d| (CAR #29#) . #31#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #30# (CONS |d| #30#) . #31#)))
                             (LETT #29# (CDR #29#) . #31#) (GO G190) G191
                             (EXIT (NREVERSE #30#))))
                       (QREFELT $ 66))
                      . #31#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            ('T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #27#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #31#)
                                         (SEQ (LETT |i| 0 . #31#)
                                              (LETT #28# (- |sigma| 1) . #31#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #28#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #31#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #31#)
                                  (GO #32=#:G227)))))
                              #32# (EXIT #27#))))
                      . #31#)
                (LETT |vi| (MAKEARR1 |m| NIL) . #31#) (LETT |nsols| -1 . #31#)
                (LETT |maxd| -1 . #31#) (LETT |nprimes| 0 . #31#)
                (LETT |nsols| (+ |m| 1) . #31#)
                (LETT |empty_offsets| 'T . #31#)
                (SEQ G190 NIL
                     (SEQ (LETT |ok| 'NIL . #31#)
                          (SEQ (LETT |k| 1 . #31#) G190
                               (COND
                                ((OR (|greater_SI| |k| 100)
                                     (NULL (COND (|ok| 'NIL) ('T 'T))))
                                 (GO G191)))
                               (SEQ
                                (LETT |prime|
                                      (SPADCALL (+ (RANDOM 2000000) 2000000)
                                                (QREFELT $ 69))
                                      . #31#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |prime| |lp| (QREFELT $ 70))
                                   "iterate")
                                  ('T
                                   (SEQ (LETT |lp| (CONS |prime| |lp|) . #31#)
                                        (EXIT (LETT |ok| 'T . #31#)))))))
                               (LETT |k| (|inc_SI| |k|) . #31#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|ok|
                             (SEQ (LETT |nprimes| (+ |nprimes| 1) . #31#)
                                  (LETT |psi| (SPADCALL |prime| (QREFELT $ 71))
                                        . #31#)
                                  (LETT |gv0p|
                                        (SPADCALL |list| 0 |psi|
                                                  (QREFELT $ 43))
                                        . #31#)
                                  (EXIT
                                   (COND ((QEQCAR |gv0p| 1) "iterate")
                                         ('T
                                          (SEQ
                                           (LETT |gv0| (QCDR |gv0p|) . #31#)
                                           (LETT |gv2|
                                                 (SPADCALL |gv0| |prime| 1
                                                           |gen|)
                                                 . #31#)
                                           (LETT |blr|
                                                 (SPADCALL |gv2| |ve| |sigma|
                                                           |pts| |prime| |kind|
                                                           (QREFELT $ 76))
                                                 . #31#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |blr| 1)
                                              (PROGN
                                               (LETT #4# (CONS 1 'NIL) . #31#)
                                               (GO #33=#:G302)))
                                             ('T
                                              (SEQ
                                               (LETT |rblr| (QCDR |blr|)
                                                     . #31#)
                                               (LETT |bm| (QVELT |rblr| 0)
                                                     . #31#)
                                               (LETT |va| (QVELT |rblr| 1)
                                                     . #31#)
                                               (LETT |civ| (QVELT |rblr| 2)
                                                     . #31#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QVSIZE |va|)
                                                            |nsols|
                                                            (QREFELT $ 36))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |is_bad| 'NIL . #31#)
                                                   (LETT |all_bad|
                                                         (< (QVSIZE |va|)
                                                            |nsols|)
                                                         . #31#)
                                                   (COND
                                                    ((EQL (QVSIZE |va|)
                                                          |nsols|)
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ (LETT |i| 1 . #31#)
                                                            (LETT #25# |nsols|
                                                                  . #31#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |i|
                                                                            #25#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (COND
                                                               ((<
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            77))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           77)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #31#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #31#)
                                                                   (GO
                                                                    #34=#:G247)))))
                                                               ((SPADCALL
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            77))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           77))
                                                                 (QREFELT $
                                                                          36))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #31#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #31#)
                                                                   (GO
                                                                    #34#)))))
                                                               ((<
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           77))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           77)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #31#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #31#)
                                                                   (GO
                                                                    #34#)))))
                                                               ((SPADCALL
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           77))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           77))
                                                                 (QREFELT $
                                                                          36))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #31#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #23#
                                                                         |$NoValue|
                                                                         . #31#)
                                                                   (GO
                                                                    #34#))))))))
                                                            (LETT |i|
                                                                  (|inc_SI|
                                                                   |i|)
                                                                  . #31#)
                                                            (GO G190) G191
                                                            (EXIT NIL)))
                                                      #34# (EXIT #23#))))
                                                   (EXIT
                                                    (COND (|is_bad| "iterate")
                                                          ('T
                                                           (SEQ
                                                            (COND
                                                             (|all_bad|
                                                              (SEQ
                                                               (LETT |nsols|
                                                                     (QVSIZE
                                                                      |va|)
                                                                     . #31#)
                                                               (LETT |oldva|
                                                                     |va|
                                                                     . #31#)
                                                               (LETT |oldciv|
                                                                     |civ|
                                                                     . #31#)
                                                               (LETT |rstate|
                                                                     (SPADCALL
                                                                      (*
                                                                       |nsols|
                                                                       |degs_sum|)
                                                                      (QREFELT
                                                                       $ 79))
                                                                     . #31#)
                                                               (LETT |rv|
                                                                     (GETREFV_U32
                                                                      (SPADCALL
                                                                       (PROG1
                                                                           (LETT
                                                                            #20#
                                                                            |nsols|
                                                                            . #31#)
                                                                         (|check_subtype2|
                                                                          (>
                                                                           #20#
                                                                           0)
                                                                          '(|PositiveInteger|)
                                                                          '(|Integer|)
                                                                          #20#))
                                                                       |degs_sum|
                                                                       (QREFELT
                                                                        $ 81))
                                                                      0)
                                                                     . #31#)
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'T . #31#)))))
                                                            (LETT |k| 0 . #31#)
                                                            (COND
                                                             ((EQL
                                                               (SPADCALL
                                                                |nprimes| 100
                                                                (QREFELT $ 13))
                                                               0)
                                                              (SEQ
                                                               (SPADCALL
                                                                "number of primes"
                                                                (QREFELT $ 84))
                                                               (EXIT
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |nprimes|
                                                                  (QREFELT $
                                                                           85))
                                                                 (QREFELT $
                                                                          84))))))
                                                            (SEQ
                                                             (LETT |i| 1
                                                                   . #31#)
                                                             (LETT #18# |nsols|
                                                                   . #31#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |i| #18#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |j| 1
                                                                      . #31#)
                                                                (LETT #17# |m|
                                                                      . #31#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |j| #17#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 77))
                                                                       . #31#)
                                                                 (LETT |cp|
                                                                       (SPADCALL
                                                                        |bm|
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         $ 87))
                                                                       . #31#)
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |l| 0
                                                                         . #31#)
                                                                   (LETT #16#
                                                                         |mm|
                                                                         . #31#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |l| #16#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (SETELT_U32
                                                                     |rv| |k|
                                                                     (ELT_U32
                                                                      |cp|
                                                                      |l|))
                                                                    (EXIT
                                                                     (LETT |k|
                                                                           (+
                                                                            |k|
                                                                            1)
                                                                           . #31#)))
                                                                   (LETT |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #31#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT
                                                                    NIL))))
                                                                (LETT |j|
                                                                      (|inc_SI|
                                                                       |j|)
                                                                      . #31#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))
                                                             (LETT |i|
                                                                   (|inc_SI|
                                                                    |i|)
                                                                   . #31#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (SPADCALL |rv|
                                                                      |prime|
                                                                      |rstate|
                                                                      (QREFELT
                                                                       $ 88))
                                                            (COND
                                                             (|empty_offsets|
                                                              (SEQ
                                                               (LETT |offsets|
                                                                     (MAKEARR1
                                                                      (PROG1
                                                                          (LETT
                                                                           #15#
                                                                           |nsols|
                                                                           . #31#)
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #15#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #15#))
                                                                      0)
                                                                     . #31#)
                                                               (LETT |j| 0
                                                                     . #31#)
                                                               (SEQ
                                                                (LETT |i| 1
                                                                      . #31#)
                                                                (LETT #14#
                                                                      |nsols|
                                                                      . #31#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |i| #14#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (SPADCALL
                                                                  |offsets| |i|
                                                                  |j|
                                                                  (QREFELT $
                                                                           89))
                                                                 (EXIT
                                                                  (LETT |j|
                                                                        (+ |j|
                                                                           |degs_sum|)
                                                                        . #31#)))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|)
                                                                      . #31#)
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'NIL
                                                                 . #31#)))))
                                                            (LETT |pp|
                                                                  (SPADCALL
                                                                   |rstate|
                                                                   |offsets|
                                                                   (QREFELT $
                                                                            91))
                                                                  . #31#)
                                                            (EXIT
                                                             (COND
                                                              ((QEQCAR |pp| 1)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |ppr|
                                                                      (QCDR
                                                                       |pp|)
                                                                      . #31#)
                                                                (LETT |k| 0
                                                                      . #31#)
                                                                (LETT |resv|
                                                                      (MAKEARR1
                                                                       (PROG1
                                                                           (LETT
                                                                            #13#
                                                                            |nsols|
                                                                            . #31#)
                                                                         (|check_subtype2|
                                                                          (>=
                                                                           #13#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          '(|Integer|)
                                                                          #13#))
                                                                       (MAKE-ARRAY
                                                                        0))
                                                                      . #31#)
                                                                (LETT |ii| 1
                                                                      . #31#)
                                                                (LETT |sol_ok|
                                                                      'T
                                                                      . #31#)
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |i| 1
                                                                         . #31#)
                                                                   (LETT #12#
                                                                         |nsols|
                                                                         . #31#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |i| #12#)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (LETT
                                                                     |resvi|
                                                                     (MAKEARR1
                                                                      |m|
                                                                      (|spadConstant|
                                                                       $ 92))
                                                                     . #31#)
                                                                    (SEQ
                                                                     (LETT |j|
                                                                           1
                                                                           . #31#)
                                                                     (LETT #11#
                                                                           |m|
                                                                           . #31#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |j|
                                                                        #11#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 77))
                                                                       . #31#)
                                                                      (LETT |s|
                                                                            (|spadConstant|
                                                                             $
                                                                             92)
                                                                            . #31#)
                                                                      (SEQ
                                                                       (LETT
                                                                        |l| 0
                                                                        . #31#)
                                                                       (LETT
                                                                        #10#
                                                                        |mm|
                                                                        . #31#)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |l|
                                                                          #10#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (LETT
                                                                         |s|
                                                                         (SPADCALL
                                                                          |s|
                                                                          (SPADCALL
                                                                           (QAREF1
                                                                            |ppr|
                                                                            |k|)
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            93))
                                                                          (QREFELT
                                                                           $
                                                                           94))
                                                                         . #31#)
                                                                        (EXIT
                                                                         (LETT
                                                                          |k|
                                                                          (+
                                                                           |k|
                                                                           1)
                                                                          . #31#)))
                                                                       (LETT
                                                                        |l|
                                                                        (|inc_SI|
                                                                         |l|)
                                                                        . #31#)
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (EXIT
                                                                       (SPADCALL
                                                                        |resvi|
                                                                        |j| |s|
                                                                        (QREFELT
                                                                         $
                                                                         95))))
                                                                     (LETT |j|
                                                                           (|inc_SI|
                                                                            |j|)
                                                                           . #31#)
                                                                     (GO G190)
                                                                     G191
                                                                     (EXIT
                                                                      NIL))
                                                                    (LETT
                                                                     |sol_okp|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |resvi|
                                                                       (QREFELT
                                                                        $ 97))
                                                                      |check|)
                                                                     . #31#)
                                                                    (EXIT
                                                                     (COND
                                                                      ((QEQCAR
                                                                        |sol_okp|
                                                                        1)
                                                                       "iterate")
                                                                      ((QEQCAR
                                                                        |sol_okp|
                                                                        2)
                                                                       (SEQ
                                                                        (LETT
                                                                         |sol_ok|
                                                                         'NIL
                                                                         . #31#)
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #8#
                                                                           |$NoValue|
                                                                           . #31#)
                                                                          (GO
                                                                           #35=#:G280)))))
                                                                      ('T
                                                                       (SEQ
                                                                        (SPADCALL
                                                                         |resv|
                                                                         |ii|
                                                                         |resvi|
                                                                         (QREFELT
                                                                          $
                                                                          99))
                                                                        (EXIT
                                                                         (LETT
                                                                          |ii|
                                                                          (+
                                                                           |ii|
                                                                           1)
                                                                          . #31#)))))))
                                                                   (LETT |i|
                                                                         (|inc_SI|
                                                                          |i|)
                                                                         . #31#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL)))
                                                                 #35#
                                                                 (EXIT #8#))
                                                                (EXIT
                                                                 (COND
                                                                  (|sol_ok|
                                                                   (SEQ
                                                                    (LETT
                                                                     |mress|
                                                                     (MAKE_MATRIX1
                                                                      |m|
                                                                      (PROG1
                                                                          (LETT
                                                                           #7#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #31#)
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #7#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #7#))
                                                                      (|spadConstant|
                                                                       $ 92))
                                                                     . #31#)
                                                                    (SEQ
                                                                     (LETT |i|
                                                                           1
                                                                           . #31#)
                                                                     (LETT #6#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #31#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |i|
                                                                        #6#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (EXIT
                                                                       (SEQ
                                                                        (LETT
                                                                         |l| 1
                                                                         . #31#)
                                                                        (LETT
                                                                         #5#
                                                                         |m|
                                                                         . #31#)
                                                                        G190
                                                                        (COND
                                                                         ((|greater_SI|
                                                                           |l|
                                                                           #5#)
                                                                          (GO
                                                                           G191)))
                                                                        (SEQ
                                                                         (EXIT
                                                                          (SPADCALL
                                                                           |mress|
                                                                           |l|
                                                                           |i|
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |resv|
                                                                             |i|
                                                                             (QREFELT
                                                                              $
                                                                              100))
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             16))
                                                                           (QREFELT
                                                                            $
                                                                            102))))
                                                                        (LETT
                                                                         |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #31#)
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))))
                                                                     (LETT |i|
                                                                           (|inc_SI|
                                                                            |i|)
                                                                           . #31#)
                                                                     (GO G190)
                                                                     G191
                                                                     (EXIT
                                                                      NIL))
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #4#
                                                                            (CONS
                                                                             0
                                                                             |mress|)
                                                                            . #31#)
                                                                      (GO
                                                                       #33#)))))))))))))))))))))))))))))
                            ('T (|error| "Run out of primes")))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #4# (CONS 1 'T) . #31#) (GO #33#)))))
          #33# (EXIT #4#)))) 

(SDEFUN |MODHP;get_variables2|
        ((|llpi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         ($ |List| (|Symbol|)))
        (SPROG
         ((|res| (|List| (|Symbol|))) (#1=#:G326 NIL) (|p| NIL) (#2=#:G325 NIL)
          (|lpi| NIL))
         (SEQ (LETT |res| NIL . #3=(|MODHP;get_variables2|))
              (SEQ (LETT |lpi| NIL . #3#) (LETT #2# |llpi| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |lpi| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# |lpi| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 45))
                                            (QREFELT $ 107))
                                           (QREFELT $ 108))
                                 . #3#)
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 46))
                                             (QREFELT $ 107))
                                            (QREFELT $ 108))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;unpack_poly;LSevPa2ISup;13|
        ((|vars| |List| (|Symbol|)) (|exps| |SortedExponentVector|)
         (|coeffs| |PrimitiveArray| (|Integer|)) (|lo| |Integer|)
         (|hi| |Integer|)
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (#1=#:G338 NIL) (|i| (|Integer|)) (|term| (|Polynomial| (|Integer|)))
          (|term1| (|Polynomial| (|Integer|))) (#2=#:G332 NIL) (#3=#:G342 NIL)
          (|k| NIL) (#4=#:G343 NIL) (|var| NIL) (|j| (|Integer|))
          (#5=#:G328 NIL) (|jj| (|Integer|)) (#6=#:G341 NIL) (|i0| NIL)
          (|nn| (|NonNegativeInteger|)) (|nvars| (|NonNegativeInteger|)))
         (SEQ
          (LETT |res| (|spadConstant| $ 109)
                . #7=(|MODHP;unpack_poly;LSevPa2ISup;13|))
          (LETT |nvars| (LENGTH |vars|) . #7#) (LETT |nn| (+ |nvars| 1) . #7#)
          (LETT |vars| (REVERSE |vars|) . #7#) (LETT |j| -1 . #7#)
          (LETT |i| (* |lo| |nn|) . #7#)
          (SEQ (LETT |i0| |lo| . #7#) (LETT #6# |hi| . #7#) G190
               (COND ((> |i0| #6#) (GO G191)))
               (SEQ (LETT |jj| (ELT_U32 |exps| |i|) . #7#)
                    (EXIT
                     (COND
                      ((< |jj| |j|)
                       (|error|
                        "Internal error: inconsistent exponent vector"))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |jj| |j| (QREFELT $ 36))
                          (SEQ
                           (COND
                            ((>= |j| 0)
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |term|
                                                       (PROG1
                                                           (LETT #5# |j| . #7#)
                                                         (|check_subtype2|
                                                          (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#))
                                                       (QREFELT $ 110))
                                             (QREFELT $ 111))
                                   . #7#)))
                           (LETT |j| |jj| . #7#)
                           (EXIT (LETT |term| (|spadConstant| $ 112) . #7#)))))
                        (LETT |term1|
                              (SPADCALL (QAREF1 |coeffs| |i0|) (QREFELT $ 113))
                              . #7#)
                        (SEQ (LETT |var| NIL . #7#) (LETT #4# |vars| . #7#)
                             (LETT |k| 1 . #7#) (LETT #3# |nvars| . #7#) G190
                             (COND
                              ((OR (|greater_SI| |k| #3#) (ATOM #4#)
                                   (PROGN (LETT |var| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |term1|
                                     (SPADCALL |term1|
                                               (SPADCALL (|spadConstant| $ 114)
                                                         |var|
                                                         (PROG1
                                                             (LETT #2#
                                                                   (ELT_U32
                                                                    |exps|
                                                                    (+ |i|
                                                                       |k|))
                                                                   . #7#)
                                                           (|check_subtype2|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                                         (QREFELT $ 115))
                                               (QREFELT $ 116))
                                     . #7#)))
                             (LETT |k|
                                   (PROG1 (|inc_SI| |k|)
                                     (LETT #4# (CDR #4#) . #7#))
                                   . #7#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |term| (SPADCALL |term1| |term| (QREFELT $ 117))
                              . #7#)
                        (EXIT (LETT |i| (+ |i| |nn|) . #7#)))))))
               (LETT |i0| (+ |i0| 1) . #7#) (GO G190) G191 (EXIT NIL))
          (COND
           ((>= |j| 0)
            (LETT |res|
                  (SPADCALL |res|
                            (SPADCALL |term|
                                      (PROG1 (LETT #1# |j| . #7#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 110))
                            (QREFELT $ 111))
                  . #7#)))
          (EXIT |res|)))) 

(SDEFUN |MODHP;intpoly_to_PFPI|
        ((|p| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (ELT $ 121) |p| (QREFELT $ 125))) 

(SDEFUN |MODHP;PFPI_to_PFI|
        ((|p| |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|))))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|iq| (|Fraction| (|Integer|)))
          (|q| (|Fraction| (|Polynomial| (|Integer|))))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 67) . #1=(|MODHP;PFPI_to_PFI|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |p| (QREFELT $ 126)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 127)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 128)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 129)) . #1#)
                        (LETT |iq| (SPADCALL |q| (QREFELT $ 130)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |iq| |m| (QREFELT $ 131))
                                         |res| (QREFELT $ 132))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;PI_to_PPI|
        ((|p| |SparseUnivariatePolynomial| (|Integer|))
         ($ |SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|mq| (|Polynomial| (|Integer|))) (|q| (|Integer|))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |res| (|spadConstant| $ 109) . #1=(|MODHP;PI_to_PPI|))
              (SEQ G190
                   (COND
                    ((NULL (COND ((SPADCALL |p| (QREFELT $ 10)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 8)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 12)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 14)) . #1#)
                        (LETT |mq| (SPADCALL |q| (QREFELT $ 113)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |mq| |m| (QREFELT $ 110))
                                         |res| (QREFELT $ 111))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;LPI_to_LPPI|
        ((|lp| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         ($ |List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG ((#1=#:G358 NIL) (|p| NIL) (#2=#:G357 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|MODHP;LPI_to_LPPI|))
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|MODHP;PI_to_PPI| |p| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MODHP;trivial_poly_solve|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|Boolean|)))
        (SPROG
         ((#1=#:G388 NIL) (|j| NIL) (#2=#:G387 NIL) (|i| NIL)
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|resi| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#3=#:G382 NIL)
          (|pres|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|nlist| (|List| (|List| (|Fraction| (|Integer|))))) (#4=#:G386 NIL)
          (|q| NIL) (#5=#:G385 NIL) (#6=#:G384 NIL) (|li| NIL) (#7=#:G383 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |kind| '|qshiftHP|)
             (PROGN
              (LETT #3# (CONS 1 'T) . #8=(|MODHP;trivial_poly_solve|))
              (GO #9=#:G381)))
            (#10='T
             (SEQ
              (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP| . #8#)))
              (LETT |nlist|
                    (PROGN
                     (LETT #7# NIL . #8#)
                     (SEQ (LETT |li| NIL . #8#) (LETT #6# |list| . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |li| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (PROGN
                                    (LETT #5# NIL . #8#)
                                    (SEQ (LETT |q| NIL . #8#)
                                         (LETT #4# |li| . #8#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |q| (CAR #4#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (SPADCALL |q|
                                                            (QREFELT $ 130))
                                                  #5#)
                                                 . #8#)))
                                         (LETT #4# (CDR #4#) . #8#) (GO G190)
                                         G191 (EXIT (NREVERSE #5#))))
                                   #7#)
                                  . #8#)))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #8#)
              (LETT |pres|
                    (SPADCALL |nlist| |degs| |kind| |sigma| |gen|
                              (CONS #'|MODHP;trivial_poly_solve!0|
                                    (VECTOR |check| $))
                              (QREFELT $ 106))
                    . #8#)
              (EXIT
               (COND
                ((QEQCAR |pres| 1)
                 (PROGN (LETT #3# (CONS 1 (QCDR |pres|)) . #8#) (GO #9#)))
                (#10#
                 (SEQ (LETT |resi| (QCDR |pres|) . #8#)
                      (LETT |nr| (ANROWS |resi|) . #8#)
                      (LETT |nc| (ANCOLS |resi|) . #8#)
                      (LETT |res|
                            (MAKE_MATRIX1 |nr| |nc| (|spadConstant| $ 109))
                            . #8#)
                      (SEQ (LETT |i| 1 . #8#) (LETT #2# |nr| . #8#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 1 . #8#) (LETT #1# |nc| . #8#) G190
                                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |res| |i| |j|
                                              (|MODHP;PI_to_PPI|
                                               (SPADCALL |resi| |i| |j|
                                                         (QREFELT $ 134))
                                               $)
                                              (QREFELT $ 136))))
                                  (LETT |j| (|inc_SI| |j|) . #8#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS 0 |res|))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |MODHP;trivial_poly_solve!0| ((|x| NIL) ($$ NIL))
        (PROG ($ |check|)
          (LETT $ (QREFELT $$ 1) . #1=(|MODHP;trivial_poly_solve|))
          (LETT |check| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|MODHP;LPI_to_LPPI| |x| $) |check|))))) 

(SDEFUN |MODHP;get_variables;L2SL;19|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|kind| |Symbol|) (|qvar| |Symbol|) ($ |List| (|Symbol|)))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ
                (LETT |vars| (|MODHP;get_variables2| |list| $)
                      . #1=(|MODHP;get_variables;L2SL;19|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|)
                      (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
                  (LETT |vars|
                        (COND ((SPADCALL |qvar| |vars| (QREFELT $ 137)) |vars|)
                              ('T (CONS |qvar| |vars|)))
                        . #1#)))
                (EXIT (REVERSE (SPADCALL |vars| (QREFELT $ 138))))))) 

(SDEFUN |MODHP;HP_solve_P;LL2SNniMMU;20|
        ((|list| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| #1=(|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
          (|Boolean|)))
        (SPROG
         ((#2=#:G453 NIL) (#3=#:G462 NIL) (|l| NIL) (#4=#:G461 NIL) (|i| NIL)
          (|mress|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#5=#:G436 NIL) (|ii| (|Integer|)) (#6=#:G452 NIL) (|ok| (|Boolean|))
          (|sol_okp| #1#) (|hi| (|Integer|)) (|ohi| #7=(|Integer|))
          (|kk| (|Integer|)) (|lo| #7#) (#8=#:G460 NIL) (|j| NIL)
          (|resvi|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#9=#:G459 NIL)
          (|resv|
           (|Vector|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))))
          (|nsols| (|NonNegativeInteger|)) (|cc| (|NonNegativeInteger|))
          (|coeffs| #10=(|PrimitiveArray| (|Integer|)))
          (|exps| #11=(|SortedExponentVector|)) (|oc| (|NonNegativeInteger|))
          (|offsets| #12=(|Vector| (|Integer|)))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|PrimitiveArray| (|Integer|)))))
          (|pp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|)) (|:| |offsetdata| #12#)
                      (|:| |expdata| #11#) (|:| |coeffdata| #10#))
            "no_solution"))
          (|gv0|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (#13=#:G458 NIL) (|li| NIL) (#14=#:G457 NIL)
          (|vars| (|List| (|Symbol|))) (|pts| (|U32Vector|)) (#15=#:G451 NIL)
          (#16=#:G456 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#17=#:G455 NIL) (|d| NIL) (#18=#:G454 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #19=(|MODHP;HP_solve_P;LL2SNniMMU;20|))
                (LETT |m| (LENGTH |degs|) . #19#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #18# NIL . #19#)
                        (SEQ (LETT |d| NIL . #19#) (LETT #17# |degs| . #19#)
                             G190
                             (COND
                              ((OR (ATOM #17#)
                                   (PROGN (LETT |d| (CAR #17#) . #19#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #18# (CONS |d| #18#) . #19#)))
                             (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                             (EXIT (NREVERSE #18#))))
                       (QREFELT $ 66))
                      . #19#)
                (LETT |pts|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |kind| '|diffHP|)
                              (EQUAL |kind| '|qdiffHP|))
                          (GETREFV_U32 0 0))
                         ((OR (EQUAL |kind| '|shiftHP|)
                              (EQUAL |kind| '|qmixed|))
                          (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0) . #19#)
                               (SEQ (LETT |i| 0 . #19#)
                                    (LETT #16# (- |sigma| 1) . #19#) G190
                                    (COND ((|greater_SI| |i| #16#) (GO G191)))
                                    (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                    (LETT |i| (|inc_SI| |i|) . #19#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT |pts0|)))
                         ('T
                          (COND
                           ((EQUAL |kind| '|qshiftHP|)
                            (PROGN
                             (LETT #15# (GETREFV_U32 |sigma| 0) . #19#)
                             (GO #20=#:G406)))))))
                       #20# (EXIT #15#))
                      . #19#)
                (LETT |vars| (|MODHP;get_variables2| |list| $) . #19#)
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|)
                      (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
                  (LETT |vars|
                        (COND ((SPADCALL |qvar| |vars| (QREFELT $ 137)) |vars|)
                              (#21='T (CONS |qvar| |vars|)))
                        . #19#)))
                (EXIT
                 (COND
                  ((NULL |vars|)
                   (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma|
                    |gen| |check| $))
                  (#21#
                   (SEQ
                    (LETT |gv0|
                          (PROGN
                           (LETT #14# NIL . #19#)
                           (SEQ (LETT |li| NIL . #19#)
                                (LETT #13# |list| . #19#) G190
                                (COND
                                 ((OR (ATOM #13#)
                                      (PROGN
                                       (LETT |li| (CAR #13#) . #19#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #14#
                                        (CONS (SPADCALL |li| (QREFELT $ 143))
                                              #14#)
                                        . #19#)))
                                (LETT #13# (CDR #13#) . #19#) (GO G190) G191
                                (EXIT (NREVERSE #14#))))
                          . #19#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (LETT |pp|
                                 (SPADCALL |vars| |gv0| |ve| |sigma| |pts|
                                           |kind| |qvar| |gen| (QREFELT $ 147))
                                 . #19#)
                           (EXIT
                            (COND
                             ((QEQCAR |pp| 1)
                              (PROGN
                               (LETT #2# (CONS 1 'NIL) . #19#)
                               (GO #22=#:G450)))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pp|) . #19#)
                                   (LETT |offsets| (QVELT |ppr| 3) . #19#)
                                   (LETT |oc| (QVSIZE |offsets|) . #19#)
                                   (LETT |exps| (QVELT |ppr| 4) . #19#)
                                   (LETT |coeffs| (QVELT |ppr| 5) . #19#)
                                   (LETT |cc| (QVSIZE |coeffs|) . #19#)
                                   (LETT |nsols|
                                         (QUOTIENT2 (QVSIZE |offsets|) |m|)
                                         . #19#)
                                   (LETT |ok| 'T . #19#) (LETT |kk| 1 . #19#)
                                   (LETT |ohi|
                                         (SPADCALL |offsets| 1 (QREFELT $ 77))
                                         . #19#)
                                   (LETT |resv|
                                         (MAKEARR1 |nsols| (MAKE-ARRAY 0))
                                         . #19#)
                                   (LETT |ii| 1 . #19#)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1 . #19#)
                                          (LETT #9# |nsols| . #19#) G190
                                          (COND
                                           ((|greater_SI| |i| #9#) (GO G191)))
                                          (SEQ
                                           (LETT |resvi|
                                                 (MAKEARR1 |m|
                                                           (|spadConstant| $
                                                                           109))
                                                 . #19#)
                                           (SEQ (LETT |j| 1 . #19#)
                                                (LETT #8# |m| . #19#) G190
                                                (COND
                                                 ((|greater_SI| |j| #8#)
                                                  (GO G191)))
                                                (SEQ (LETT |lo| |ohi| . #19#)
                                                     (LETT |ohi|
                                                           (SEQ
                                                            (LETT |kk|
                                                                  (+ |kk| 1)
                                                                  . #19#)
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         |oc|
                                                                         (QREFELT
                                                                          $
                                                                          150))
                                                               (SPADCALL
                                                                |offsets| |kk|
                                                                (QREFELT $
                                                                         77)))
                                                              ('T |cc|))))
                                                           . #19#)
                                                     (LETT |hi| (- |ohi| 1)
                                                           . #19#)
                                                     (EXIT
                                                      (SPADCALL |resvi| |j|
                                                                (SPADCALL
                                                                 |vars| |exps|
                                                                 |coeffs| |lo|
                                                                 |hi|
                                                                 (QREFELT $
                                                                          120))
                                                                (QREFELT $
                                                                         151))))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #19#)
                                                (GO G190) G191 (EXIT NIL))
                                           (LETT |sol_okp|
                                                 (SPADCALL
                                                  (SPADCALL |resvi|
                                                            (QREFELT $ 153))
                                                  |check|)
                                                 . #19#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |sol_okp| 1) "iterate")
                                             ((QEQCAR |sol_okp| 2)
                                              (SEQ (LETT |ok| 'NIL . #19#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6# |$NoValue|
                                                           . #19#)
                                                     (GO #23=#:G435)))))
                                             ('T
                                              (SEQ
                                               (SPADCALL |resv| |ii| |resvi|
                                                         (QREFELT $ 155))
                                               (EXIT
                                                (LETT |ii| (+ |ii| 1)
                                                      . #19#)))))))
                                          (LETT |i| (|inc_SI| |i|) . #19#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #23# (EXIT #6#))
                                   (EXIT
                                    (COND
                                     (|ok|
                                      (SEQ
                                       (LETT |mress|
                                             (MAKE_MATRIX1 |m|
                                                           (PROG1
                                                               (LETT #5#
                                                                     (- |ii| 1)
                                                                     . #19#)
                                                             (|check_subtype2|
                                                              (>= #5# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #5#))
                                                           (|spadConstant| $
                                                                           109))
                                             . #19#)
                                       (SEQ (LETT |i| 1 . #19#)
                                            (LETT #4# (- |ii| 1) . #19#) G190
                                            (COND
                                             ((|greater_SI| |i| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |l| 1 . #19#)
                                                   (LETT #3# |m| . #19#) G190
                                                   (COND
                                                    ((|greater_SI| |l| #3#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SPADCALL |mress| |l| |i|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |resv| |i|
                                                                 (QREFELT $
                                                                          156))
                                                                |l|
                                                                (QREFELT $ 32))
                                                               (QREFELT $
                                                                        136))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #19#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|) . #19#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 0 |mress|) . #19#)
                                         (GO #22#)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL
                                        "check_sol_poly rejected solution"
                                        (QREFELT $ 84))
                                       (SPADCALL
                                        (SPADCALL |resvi| (QREFELT $ 157))
                                        (QREFELT $ 84))
                                       (EXIT (|error| "giving up")))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #22# (EXIT #2#)))) 

(SDEFUN |MODHP;HP_solve_M;LLSINniMMU;21|
        ((|list| |List| (|List| (|Integer|))) (|degs| |List| (|Integer|))
         (|kind| |Symbol|) (|prime| |Integer|) (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| #1=(|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| #2=(|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
          (|Boolean|)))
        (SPROG
         ((#3=#:G495 NIL) (#4=#:G505 NIL) (|l| NIL) (#5=#:G504 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#6=#:G488 NIL) (|ii| (|Integer|)) (|sol_okp| #2#)
          (|s| (|SparseUnivariatePolynomial| (|Integer|))) (#7=#:G503 NIL)
          (|bmij| (|U32Vector|)) (|mm| (|Integer|)) (#8=#:G502 NIL) (|j| NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (#9=#:G501 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (|nsols| (|NonNegativeInteger|)) (|va| #10=(|Vector| (|Integer|)))
          (|bm| #11=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #11#) (|:| |defects| #10#)
                      (|:| |cinds| (|Vector| (|Integer|))))
            "no_solution"))
          (|gv| #1#) (|gv0| (|List| (|U32Vector|))) (#12=#:G500 NIL) (|li| NIL)
          (#13=#:G499 NIL) (|pts| (|U32Vector|)) (#14=#:G494 NIL)
          (#15=#:G498 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#16=#:G497 NIL) (|d| NIL) (#17=#:G496 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #18=(|MODHP;HP_solve_M;LLSINniMMU;21|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #18#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #17# NIL . #18#)
                        (SEQ (LETT |d| NIL . #18#) (LETT #16# |degs| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN (LETT |d| (CAR #16#) . #18#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #17# (CONS |d| #17#) . #18#)))
                             (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                             (EXIT (NREVERSE #17#))))
                       (QREFELT $ 66))
                      . #18#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            (#19='T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #14#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #18#)
                                         (SEQ (LETT |i| 0 . #18#)
                                              (LETT #15# (- |sigma| 1) . #18#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #15#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #18#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #18#)
                                  (GO #20=#:G471)))))
                              #20# (EXIT #14#))))
                      . #18#)
                (LETT |gv0|
                      (PROGN
                       (LETT #13# NIL . #18#)
                       (SEQ (LETT |li| NIL . #18#) (LETT #12# |list| . #18#)
                            G190
                            (COND
                             ((OR (ATOM #12#)
                                  (PROGN (LETT |li| (CAR #12#) . #18#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |li| (QREFELT $ 161)) #13#)
                                    . #18#)))
                            (LETT #12# (CDR #12#) . #18#) (GO G190) G191
                            (EXIT (NREVERSE #13#))))
                      . #18#)
                (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|) . #18#)
                (LETT |blr|
                      (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                                (QREFELT $ 76))
                      . #18#)
                (EXIT
                 (COND
                  ((QEQCAR |blr| 1)
                   (PROGN (LETT #3# (CONS 1 'NIL) . #18#) (GO #21=#:G493)))
                  (#19#
                   (SEQ (LETT |rblr| (QCDR |blr|) . #18#)
                        (LETT |bm| (QVELT |rblr| 0) . #18#)
                        (LETT |va| (QVELT |rblr| 1) . #18#)
                        (LETT |nsols| (QVSIZE |va|) . #18#)
                        (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)) . #18#)
                        (LETT |ii| 1 . #18#)
                        (SEQ (LETT |i| 1 . #18#) (LETT #9# |nsols| . #18#) G190
                             (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ
                              (LETT |resvi|
                                    (MAKEARR1 |m| (|spadConstant| $ 92))
                                    . #18#)
                              (SEQ (LETT |j| 1 . #18#) (LETT #8# |m| . #18#)
                                   G190
                                   (COND ((|greater_SI| |j| #8#) (GO G191)))
                                   (SEQ
                                    (LETT |mm|
                                          (SPADCALL |ve| |j| (QREFELT $ 77))
                                          . #18#)
                                    (LETT |bmij|
                                          (SPADCALL |bm| |i| |j|
                                                    (QREFELT $ 87))
                                          . #18#)
                                    (LETT |s| (|spadConstant| $ 92) . #18#)
                                    (SEQ (LETT |l| 0 . #18#)
                                         (LETT #7# |mm| . #18#) G190
                                         (COND
                                          ((|greater_SI| |l| #7#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL |s|
                                                           (SPADCALL
                                                            (ELT_U32 |bmij|
                                                                     |l|)
                                                            |l| (QREFELT $ 93))
                                                           (QREFELT $ 94))
                                                 . #18#)))
                                         (LETT |l| (|inc_SI| |l|) . #18#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |resvi| |j| |s|
                                               (QREFELT $ 95))))
                                   (LETT |j| (|inc_SI| |j|) . #18#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |sol_okp|
                                    (SPADCALL (SPADCALL |resvi| (QREFELT $ 97))
                                              |check|)
                                    . #18#)
                              (EXIT
                               (COND ((QEQCAR |sol_okp| 1) "iterate")
                                     ((QEQCAR |sol_okp| 2)
                                      (|error|
                                       "HP_solve_M: check should never return no_solution for finite fields"))
                                     ('T
                                      (SEQ
                                       (SPADCALL |resv| |ii| |resvi|
                                                 (QREFELT $ 99))
                                       (EXIT
                                        (LETT |ii| (+ |ii| 1) . #18#)))))))
                             (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |mress|
                              (MAKE_MATRIX1 |m|
                                            (PROG1 (LETT #6# (- |ii| 1) . #18#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (|spadConstant| $ 92))
                              . #18#)
                        (SEQ (LETT |i| 1 . #18#) (LETT #5# (- |ii| 1) . #18#)
                             G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1 . #18#) (LETT #4# |m| . #18#)
                                    G190
                                    (COND ((|greater_SI| |l| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |mress| |l| |i|
                                                (SPADCALL
                                                 (SPADCALL |resv| |i|
                                                           (QREFELT $ 100))
                                                 |l| (QREFELT $ 16))
                                                (QREFELT $ 102))))
                                    (LETT |l| (|inc_SI| |l|) . #18#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #3# (CONS 0 |mress|) . #18#)
                          (GO #21#)))))))))
          #21# (EXIT #3#)))) 

(SDEFUN |MODHP;HP_solve_A;LLSNniMMU;22|
        ((|list| |List| (|List| (|AlgebraicNumber|)))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
         ($ |Union|
          (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|Boolean|)))
        (CONS 1 'T)) 

(SDEFUN |MODHP;HP_solve_PA;LL2SNniMMU;23|
        ((|list| |List|
          (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
         (|degs| |List| (|Integer|)) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|sigma| |NonNegativeInteger|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         (|check| |Mapping| (|Union| "good" "reject" "no_solution")
          (|List|
           (|SparseUnivariatePolynomial| (|Polynomial| (|AlgebraicNumber|)))))
         ($ |Union|
          (|Matrix|
           (|SparseUnivariatePolynomial| (|Polynomial| (|AlgebraicNumber|))))
          (|Boolean|)))
        (CONS 1 'T)) 

(DECLAIM (NOTINLINE |ModularHermitePade;|)) 

(DEFUN |ModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G523)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularHermitePade|)
                    . #2=(|ModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularHermitePade|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularHermitePade;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularHermitePade|)))))))))) 

(DEFUN |ModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularHermitePade|) . #1=(|ModularHermitePade|))
          (LETT $ (GETREFV 172) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularHermitePade| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 11) (0 . |degree|) (|Boolean|)
              (5 . |zero?|) (|Integer|) (10 . |leadingCoefficient|)
              (15 . |positiveRemainder|) (21 . |reductum|) (|Vector| 7)
              (26 . |elt|) (|U32Vector|) (|Vector| 17) (32 . |setelt!|)
              |MODHP;VSUPI_to_VPA;VIV;2| (|SparseUnivariatePolynomial| 24)
              (39 . |degree|) (44 . |zero?|) (|Polynomial| 11)
              (49 . |leadingCoefficient|) (|List| 74) (|List| 11)
              (|PolynomialEvaluationUtilities|) (54 . |modpeval|)
              (62 . |reductum|) (|Vector| 21) (67 . |elt|)
              |MODHP;VSUPPI_to_VPA;VLLIV;4| (|Fraction| 11) (73 . |Zero|)
              (77 . >) (83 . |numer|) (88 . |denom|) (|SingleInteger|)
              (93 . |invmod|) (|Union| 59 '"failed") (|List| (|List| 34))
              |MODHP;LLFI_to_LPA;L2IU;5| (|Fraction| 24) (99 . |numer|)
              (104 . |denom|) (|List| 141) |MODHP;LLFPI_to_LPA;LILLIU;6|
              (109 . |coerce|) (|SparseUnivariatePolynomial| 34)
              (|Mapping| 34 11) (|SparseUnivariatePolynomialFunctions2| 11 34)
              (114 . |map|) (120 . |elt|) (126 . |One|) (|Void|)
              (|U32VectorPolynomialOperations|) (130 . |truncated_mul_add|)
              (|List| 17) (|Mapping| 18 59 11 11)
              |MODHP;check_sol1a;VLM3IUv;10| (139 . +) (|Mapping| 11 11 11)
              (145 . |reduce|) (|Vector| 11) (151 . |vector|) (156 . |Zero|)
              (|IntegerPrimesPackage| 11) (160 . |nextPrime|) (165 . |member?|)
              (171 . |coerce|)
              (|Record| (|:| |basis| 86) (|:| |defects| 65) (|:| |cinds| 65))
              (|Union| 72 '"no_solution") (|Symbol|)
              (|InnerModularHermitePade|) (176 . |do_modular_solve|)
              (186 . |elt|) (|VectorIntegerReconstructor|) (192 . |empty|)
              (|PositiveInteger|) (197 . *) (|OutputForm|) (|PrintPackage|)
              (203 . |print|) (208 . |coerce|) (|TwoDimensionalArray| 17)
              (213 . |elt|) (220 . |chinese_update|) (227 . |setelt!|)
              (|Union| 119 '"failed") (234 . |reconstruct|) (240 . |Zero|)
              (244 . |monomial|) (250 . +) (256 . |setelt!|) (|List| 7)
              (263 . |entries|) (|Vector| 15) (268 . |setelt!|) (275 . |elt|)
              (|Matrix| 7) (281 . |setelt!|) (|Union| 101 9)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 104 96)
              |MODHP;HP_solve_I;LLSNniMMU;11| (289 . |variables|)
              (294 . |setUnion|) (300 . |Zero|) (304 . |monomial|) (310 . +)
              (316 . |Zero|) (320 . |coerce|) (325 . |One|) (329 . |monomial|)
              (336 . *) (342 . +) (|SortedExponentVector|)
              (|PrimitiveArray| 11) |MODHP;unpack_poly;LSevPa2ISup;13|
              (348 . |coerce|) (|SparseUnivariatePolynomial| 44)
              (|Mapping| 44 24) (|SparseUnivariatePolynomialFunctions2| 24 44)
              (353 . |map|) (359 . |zero?|) (364 . |degree|)
              (369 . |leadingCoefficient|) (374 . |reductum|) (379 . |retract|)
              (384 . |monomial|) (390 . +) (396 . |Zero|) (400 . |elt|)
              (|Matrix| 21) (407 . |setelt!|) (415 . |member?|) (421 . |sort|)
              |MODHP;get_variables;L2SL;19| (426 . |One|) (|List| 44)
              (|PrimitiveArray| 44) (430 . |construct|)
              (|Record| (|:| |defects| 65) (|:| |cinds| 65) (|:| |rowlen| 11)
                        (|:| |offsetdata| 65) (|:| |expdata| 118)
                        (|:| |coeffdata| 119))
              (|Union| 144 '"no_solution") (|List| 142)
              (435 . |do_poly_integer|) (447 . |One|) (451 . |One|) (455 . <=)
              (461 . |setelt!|) (|List| 21) (468 . |entries|) (|Vector| 31)
              (473 . |setelt!|) (480 . |elt|) (486 . |coerce|) (|Union| 135 9)
              (|Mapping| 104 152) |MODHP;HP_solve_P;LL2SNniMMU;20|
              (491 . |construct|) (|List| 27) |MODHP;HP_solve_M;LLSINniMMU;21|
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))) 9)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 104
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              |MODHP;HP_solve_A;LLSNniMMU;22|
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               9)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 104
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              |MODHP;HP_solve_PA;LL2SNniMMU;23|)
           '#(|unpack_poly| 496 |get_variables| 505 |check_sol1a| 512
              |VSUPPI_to_VPA| 522 |VSUPI_to_VPA| 530 |LLFPI_to_LPA| 536
              |LLFI_to_LPA| 545 |HP_solve_PA| 552 |HP_solve_P| 563 |HP_solve_M|
              574 |HP_solve_I| 585 |HP_solve_A| 595)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 171
                                                 '(1 7 6 0 8 1 7 9 0 10 1 7 11
                                                   0 12 2 11 0 0 0 13 1 7 0 0
                                                   14 2 15 7 0 11 16 3 18 17 0
                                                   11 17 19 1 21 6 0 22 1 21 9
                                                   0 23 1 21 24 0 25 4 28 11 24
                                                   26 27 11 29 1 21 0 0 30 2 31
                                                   21 0 11 32 0 34 0 35 2 11 9
                                                   0 0 36 1 34 11 0 37 1 34 11
                                                   0 38 2 39 0 0 0 40 1 44 24 0
                                                   45 1 44 24 0 46 1 34 0 11 49
                                                   2 52 50 51 7 53 2 18 17 0 11
                                                   54 0 50 0 55 5 57 56 17 17
                                                   17 11 11 58 2 11 0 0 0 62 2
                                                   27 11 63 0 64 1 65 0 27 66 0
                                                   50 0 67 1 68 11 11 69 2 27 9
                                                   11 0 70 1 39 0 11 71 6 75 73
                                                   18 65 6 17 11 74 76 2 65 11
                                                   0 11 77 1 78 0 11 79 2 6 0
                                                   80 0 81 1 83 56 82 84 1 11
                                                   82 0 85 3 86 17 0 11 11 87 3
                                                   78 56 17 11 0 88 3 65 11 0
                                                   11 11 89 2 78 90 0 65 91 0 7
                                                   0 92 2 7 0 11 6 93 2 7 0 0 0
                                                   94 3 15 7 0 11 7 95 1 15 96
                                                   0 97 3 98 15 0 11 15 99 2 98
                                                   15 0 11 100 4 101 7 0 11 11
                                                   7 102 1 24 26 0 107 2 26 0 0
                                                   0 108 0 21 0 109 2 21 0 24 6
                                                   110 2 21 0 0 0 111 0 24 0
                                                   112 1 24 0 11 113 0 24 0 114
                                                   3 24 0 0 74 6 115 2 24 0 0 0
                                                   116 2 24 0 0 0 117 1 44 0 24
                                                   121 2 124 122 123 21 125 1
                                                   122 9 0 126 1 122 6 0 127 1
                                                   122 44 0 128 1 122 0 0 129 1
                                                   44 34 0 130 2 50 0 34 6 131
                                                   2 50 0 0 0 132 0 122 0 133 3
                                                   101 7 0 11 11 134 4 135 21 0
                                                   11 11 21 136 2 26 9 74 0 137
                                                   1 26 0 0 138 0 122 0 140 1
                                                   142 0 141 143 8 75 145 26
                                                   146 65 6 17 74 74 60 147 0
                                                   21 0 148 0 44 0 149 2 11 9 0
                                                   0 150 3 31 21 0 11 21 151 1
                                                   31 152 0 153 3 154 31 0 11
                                                   31 155 2 154 31 0 11 156 1
                                                   31 82 0 157 1 17 0 27 161 5
                                                   0 21 26 118 119 11 11 120 3
                                                   0 26 47 74 74 139 6 0 17 18
                                                   59 60 11 11 11 61 4 0 18 31
                                                   26 27 11 33 2 0 18 15 11 20
                                                   5 0 41 47 11 26 27 11 48 3 0
                                                   41 42 11 11 43 7 0 168 169
                                                   27 74 74 6 60 170 171 7 0
                                                   158 47 27 74 74 6 60 159 160
                                                   7 0 103 162 27 74 11 6 60
                                                   105 163 6 0 103 42 27 74 6
                                                   60 105 106 6 0 164 165 27 74
                                                   6 60 166 167)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularHermitePade| 'NILADIC T) 
