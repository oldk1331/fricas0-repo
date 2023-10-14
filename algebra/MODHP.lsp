
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
         ((|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #1=(|MODHP;VSUPI_to_VPA;VIV;2|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #1#)
              (SEQ (LETT |i| 1 . #1#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 16)) |p| $)
                               (QREFELT $ 19))))
                   (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
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
         ((|i| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |vps|) . #1=(|MODHP;VSUPPI_to_VPA;VLLIV;4|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #1#)
              (SEQ (LETT |i| 1 . #1#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT $ 32)) |vars|
                                |pts| |p| $)
                               (QREFELT $ 19))))
                   (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;LLFI_to_LPA;L2IU;5|
        ((|llfi| |List| (|List| (|Fraction| (|Integer|)))) (|n| |Integer|)
         (|prime| |Integer|) ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| NIL) (|dms| (|SingleInteger|))
          (#1=#:G169 NIL) (|dm| #2=(|Integer|)) (|nm| #2#) (#3=#:G171 NIL)
          (|j| NIL) (#4=#:G172 NIL) (|el| NIL) (|pa| (|U32Vector|))
          (|nn| (|Integer|)) (#5=#:G170 NIL) (|lfi| NIL))
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
                                (GO #7=#:G168)))
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
         ((|resl| (|List| (|U32Vector|))) (|nlc| NIL) (|dms| (|SingleInteger|))
          (#1=#:G183 NIL) (|dm| #2=(|Integer|)) (|nm| #2#) (#3=#:G185 NIL)
          (|j| NIL) (#4=#:G186 NIL) (|el| NIL) (|pa| (|U32Vector|))
          (#5=#:G184 NIL) (|lfi| NIL))
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
                                    (GO #7=#:G182)))
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
         ((#1=#:G203 NIL) (|vpp| (|Union| (|U32Vector|) "failed")) (|i| NIL)
          (#2=#:G204 NIL) (|p| NIL) (|vpa| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |lpi|) . #3=(|MODHP;LPPFtoVPA|))
                (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #3#)
                (SEQ (LETT |p| NIL . #3#) (LETT #2# |lpi| . #3#)
                     (LETT |i| 1 . #3#) G190
                     (COND
                      ((OR (|greater_SI| |i| |m|) (ATOM #2#)
                           (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |vpp| 1)
                         (PROGN
                          (LETT #1# (CONS 1 "failed") . #3#)
                          (GO #4=#:G202)))
                        ('T
                         (SPADCALL |vpa| |i| (QCDR |vpp|) (QREFELT $ 19))))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                           . #3#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |vpa|))))
          #4# (EXIT #1#)))) 

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
         ((|i| NIL) (|res| (|U32Vector|)) (|gvp| (|Vector| (|U32Vector|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (QVSIZE |nres|) . #1=(|MODHP;check_sol1a;VLM3IUv;10|))
              (LETT |gvp| (SPADCALL |gv0| |p| |qval| |gen|) . #1#)
              (LETT |res| (GETREFV_U32 |sigma| 0) . #1#)
              (SEQ (LETT |i| 1 . #1#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |gvp| |i| (QREFELT $ 54))
                               (SPADCALL |nres| |i| (QREFELT $ 54)) |res|
                               (- |sigma| 1) |p| (QREFELT $ 58))))
                   (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
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
         ((#4=#:G301 NIL) (|l| NIL) (#5=#:G305 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#6=#:G276 NIL) (|ii| (|Integer|)) (#7=#:G299 NIL)
          (|sol_ok| #8=(|Boolean|)) (|sol_okp| (|Union| #1# #2# #3#))
          (|k| (|Integer|)) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (|mm| (|Integer|)) (|j| (|Integer|))
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#9=#:G263 NIL) (|ppr| (|PrimitiveArray| (|Integer|)))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (|empty_offsets| #8#) (|offsets| (|Vector| (|Integer|)))
          (#10=#:G255 NIL) (|cp| (|U32Vector|)) (|rv| #11=(|U32Vector|))
          (#12=#:G245 NIL) (|rstate| (|VectorIntegerReconstructor|))
          (|oldciv| #13=(|Vector| (|Integer|)))
          (|oldva| #14=(|Vector| (|Integer|))) (|nsols| (|Integer|))
          (#15=#:G300 NIL) (|is_bad| #16=(|Boolean|)) (|all_bad| (|Boolean|))
          (|civ| #13#) (|va| #14#)
          (|bm| #17=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #17#) (|:| |defects| #14#)
                      (|:| |cinds| #13#))
            "no_solution"))
          (|gv2| (|Vector| (|U32Vector|))) (|gv0| (|List| (|U32Vector|)))
          (|gv0p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|psi| (|SingleInteger|)) (|nprimes| (|Integer|)) (|ok| #16#)
          (|lp| (|List| (|Integer|))) (|prime| (|Integer|))
          (|maxd| (|Integer|)) (|vi| (|Vector| (|List| (|Integer|))))
          (|pts| (|U32Vector|)) (#18=#:G298 NIL) (#19=#:G304 NIL) (|pts0| #11#)
          (|ve| (|Vector| (|Integer|))) (#20=#:G303 NIL) (|d| NIL)
          (#21=#:G302 NIL) (|degs_sum| (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #22=(|MODHP;HP_solve_I;LLSNniMMU;11|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #22#)
                (LETT |degs_sum|
                      (+ (SPADCALL (ELT $ 62) |degs| (QREFELT $ 64)) |m|)
                      . #22#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #21# NIL . #22#)
                        (SEQ (LETT |d| NIL . #22#) (LETT #20# |degs| . #22#)
                             G190
                             (COND
                              ((OR (ATOM #20#)
                                   (PROGN (LETT |d| (CAR #20#) . #22#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #21# (CONS |d| #21#) . #22#)))
                             (LETT #20# (CDR #20#) . #22#) (GO G190) G191
                             (EXIT (NREVERSE #21#))))
                       (QREFELT $ 66))
                      . #22#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            ('T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #18#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #22#)
                                         (SEQ (LETT |i| 0 . #22#)
                                              (LETT #19# (- |sigma| 1) . #22#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #19#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #22#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #22#)
                                  (GO #23=#:G222)))))
                              #23# (EXIT #18#))))
                      . #22#)
                (LETT |vi| (MAKEARR1 |m| NIL) . #22#) (LETT |nsols| -1 . #22#)
                (LETT |maxd| -1 . #22#) (LETT |nprimes| 0 . #22#)
                (LETT |nsols| (+ |m| 1) . #22#)
                (LETT |empty_offsets| 'T . #22#)
                (SEQ G190 NIL
                     (SEQ (LETT |ok| 'NIL . #22#)
                          (SEQ (LETT |k| 1 . #22#) G190
                               (COND
                                ((OR (|greater_SI| |k| 100)
                                     (NULL (COND (|ok| 'NIL) ('T 'T))))
                                 (GO G191)))
                               (SEQ
                                (LETT |prime|
                                      (SPADCALL (+ (RANDOM 2000000) 2000000)
                                                (QREFELT $ 69))
                                      . #22#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |prime| |lp| (QREFELT $ 70))
                                   "iterate")
                                  ('T
                                   (SEQ (LETT |lp| (CONS |prime| |lp|) . #22#)
                                        (EXIT (LETT |ok| 'T . #22#)))))))
                               (LETT |k| (|inc_SI| |k|) . #22#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|ok|
                             (SEQ (LETT |nprimes| (+ |nprimes| 1) . #22#)
                                  (LETT |psi| (SPADCALL |prime| (QREFELT $ 71))
                                        . #22#)
                                  (LETT |gv0p|
                                        (SPADCALL |list| 0 |psi|
                                                  (QREFELT $ 43))
                                        . #22#)
                                  (EXIT
                                   (COND ((QEQCAR |gv0p| 1) "iterate")
                                         ('T
                                          (SEQ
                                           (LETT |gv0| (QCDR |gv0p|) . #22#)
                                           (LETT |gv2|
                                                 (SPADCALL |gv0| |prime| 1
                                                           |gen|)
                                                 . #22#)
                                           (LETT |blr|
                                                 (SPADCALL |gv2| |ve| |sigma|
                                                           |pts| |prime| |kind|
                                                           (QREFELT $ 75))
                                                 . #22#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |blr| 1)
                                              (PROGN
                                               (LETT #4# (CONS 1 'NIL) . #22#)
                                               (GO #24=#:G297)))
                                             ('T
                                              (SEQ
                                               (LETT |rblr| (QCDR |blr|)
                                                     . #22#)
                                               (LETT |bm| (QVELT |rblr| 0)
                                                     . #22#)
                                               (LETT |va| (QVELT |rblr| 1)
                                                     . #22#)
                                               (LETT |civ| (QVELT |rblr| 2)
                                                     . #22#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QVSIZE |va|)
                                                            |nsols|
                                                            (QREFELT $ 36))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |is_bad| 'NIL . #22#)
                                                   (LETT |all_bad|
                                                         (< (QVSIZE |va|)
                                                            |nsols|)
                                                         . #22#)
                                                   (COND
                                                    ((EQL (QVSIZE |va|)
                                                          |nsols|)
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ (LETT |i| 1 . #22#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |i|
                                                                            |nsols|)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (COND
                                                               ((<
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            76))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           76)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #22#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #15#
                                                                         |$NoValue|
                                                                         . #22#)
                                                                   (GO
                                                                    #25=#:G242)))))
                                                               ((SPADCALL
                                                                 (SPADCALL |va|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            76))
                                                                 (SPADCALL
                                                                  |oldva| |i|
                                                                  (QREFELT $
                                                                           76))
                                                                 (QREFELT $
                                                                          36))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #22#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #15#
                                                                         |$NoValue|
                                                                         . #22#)
                                                                   (GO
                                                                    #25#)))))
                                                               ((<
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           76))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           76)))
                                                                (SEQ
                                                                 (LETT
                                                                  |all_bad| 'T
                                                                  . #22#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #15#
                                                                         |$NoValue|
                                                                         . #22#)
                                                                   (GO
                                                                    #25#)))))
                                                               ((SPADCALL
                                                                 (SPADCALL
                                                                  |civ| |i|
                                                                  (QREFELT $
                                                                           76))
                                                                 (SPADCALL
                                                                  |oldciv| |i|
                                                                  (QREFELT $
                                                                           76))
                                                                 (QREFELT $
                                                                          36))
                                                                (SEQ
                                                                 (LETT |is_bad|
                                                                       'T
                                                                       . #22#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #15#
                                                                         |$NoValue|
                                                                         . #22#)
                                                                   (GO
                                                                    #25#))))))))
                                                            (LETT |i|
                                                                  (|inc_SI|
                                                                   |i|)
                                                                  . #22#)
                                                            (GO G190) G191
                                                            (EXIT NIL)))
                                                      #25# (EXIT #15#))))
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
                                                                     . #22#)
                                                               (LETT |oldva|
                                                                     |va|
                                                                     . #22#)
                                                               (LETT |oldciv|
                                                                     |civ|
                                                                     . #22#)
                                                               (LETT |rstate|
                                                                     (SPADCALL
                                                                      (*
                                                                       |nsols|
                                                                       |degs_sum|)
                                                                      (QREFELT
                                                                       $ 78))
                                                                     . #22#)
                                                               (LETT |rv|
                                                                     (GETREFV_U32
                                                                      (SPADCALL
                                                                       (PROG1
                                                                           (LETT
                                                                            #12#
                                                                            |nsols|
                                                                            . #22#)
                                                                         (|check_subtype|
                                                                          (>
                                                                           #12#
                                                                           0)
                                                                          '(|PositiveInteger|)
                                                                          #12#))
                                                                       |degs_sum|
                                                                       (QREFELT
                                                                        $ 80))
                                                                      0)
                                                                     . #22#)
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'T . #22#)))))
                                                            (LETT |k| 0 . #22#)
                                                            (COND
                                                             ((EQL
                                                               (SPADCALL
                                                                |nprimes| 100
                                                                (QREFELT $ 13))
                                                               0)
                                                              (SEQ
                                                               (SPADCALL
                                                                "number of primes"
                                                                (QREFELT $ 83))
                                                               (EXIT
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |nprimes|
                                                                  (QREFELT $
                                                                           84))
                                                                 (QREFELT $
                                                                          83))))))
                                                            (SEQ
                                                             (LETT |i| 1
                                                                   . #22#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |i| |nsols|)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |j| 1
                                                                      . #22#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |j| |m|)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       . #22#)
                                                                 (LETT |cp|
                                                                       (SPADCALL
                                                                        |bm|
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         $ 86))
                                                                       . #22#)
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |l| 0
                                                                         . #22#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |l| |mm|)
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
                                                                           . #22#)))
                                                                   (LETT |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #22#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT
                                                                    NIL))))
                                                                (LETT |j|
                                                                      (|inc_SI|
                                                                       |j|)
                                                                      . #22#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))
                                                             (LETT |i|
                                                                   (|inc_SI|
                                                                    |i|)
                                                                   . #22#)
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (SPADCALL |rv|
                                                                      |prime|
                                                                      |rstate|
                                                                      (QREFELT
                                                                       $ 87))
                                                            (COND
                                                             (|empty_offsets|
                                                              (SEQ
                                                               (LETT |offsets|
                                                                     (MAKEARR1
                                                                      (PROG1
                                                                          (LETT
                                                                           #10#
                                                                           |nsols|
                                                                           . #22#)
                                                                        (|check_subtype|
                                                                         (>=
                                                                          #10#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         #10#))
                                                                      0)
                                                                     . #22#)
                                                               (LETT |j| 0
                                                                     . #22#)
                                                               (SEQ
                                                                (LETT |i| 1
                                                                      . #22#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |i| |nsols|)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (SPADCALL
                                                                  |offsets| |i|
                                                                  |j|
                                                                  (QREFELT $
                                                                           88))
                                                                 (EXIT
                                                                  (LETT |j|
                                                                        (+ |j|
                                                                           |degs_sum|)
                                                                        . #22#)))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|)
                                                                      . #22#)
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'NIL
                                                                 . #22#)))))
                                                            (LETT |pp|
                                                                  (SPADCALL
                                                                   |rstate|
                                                                   |offsets|
                                                                   (QREFELT $
                                                                            90))
                                                                  . #22#)
                                                            (EXIT
                                                             (COND
                                                              ((QEQCAR |pp| 1)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |ppr|
                                                                      (QCDR
                                                                       |pp|)
                                                                      . #22#)
                                                                (LETT |k| 0
                                                                      . #22#)
                                                                (LETT |resv|
                                                                      (MAKEARR1
                                                                       (PROG1
                                                                           (LETT
                                                                            #9#
                                                                            |nsols|
                                                                            . #22#)
                                                                         (|check_subtype|
                                                                          (>=
                                                                           #9#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          #9#))
                                                                       (MAKE-ARRAY
                                                                        0))
                                                                      . #22#)
                                                                (LETT |ii| 1
                                                                      . #22#)
                                                                (LETT |sol_ok|
                                                                      'T
                                                                      . #22#)
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |i| 1
                                                                         . #22#)
                                                                   G190
                                                                   (COND
                                                                    ((|greater_SI|
                                                                      |i|
                                                                      |nsols|)
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (LETT
                                                                     |resvi|
                                                                     (MAKEARR1
                                                                      |m|
                                                                      (|spadConstant|
                                                                       $ 91))
                                                                     . #22#)
                                                                    (SEQ
                                                                     (LETT |j|
                                                                           1
                                                                           . #22#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |j|
                                                                        |m|)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |mm|
                                                                       (SPADCALL
                                                                        |ve|
                                                                        |j|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       . #22#)
                                                                      (LETT |s|
                                                                            (|spadConstant|
                                                                             $
                                                                             91)
                                                                            . #22#)
                                                                      (SEQ
                                                                       (LETT
                                                                        |l| 0
                                                                        . #22#)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |l|
                                                                          |mm|)
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
                                                                            92))
                                                                          (QREFELT
                                                                           $
                                                                           93))
                                                                         . #22#)
                                                                        (EXIT
                                                                         (LETT
                                                                          |k|
                                                                          (+
                                                                           |k|
                                                                           1)
                                                                          . #22#)))
                                                                       (LETT
                                                                        |l|
                                                                        (|inc_SI|
                                                                         |l|)
                                                                        . #22#)
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
                                                                         94))))
                                                                     (LETT |j|
                                                                           (|inc_SI|
                                                                            |j|)
                                                                           . #22#)
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
                                                                        $ 96))
                                                                      |check|)
                                                                     . #22#)
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
                                                                         . #22#)
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #7#
                                                                           |$NoValue|
                                                                           . #22#)
                                                                          (GO
                                                                           #26=#:G275)))))
                                                                      ('T
                                                                       (SEQ
                                                                        (SPADCALL
                                                                         |resv|
                                                                         |ii|
                                                                         |resvi|
                                                                         (QREFELT
                                                                          $
                                                                          98))
                                                                        (EXIT
                                                                         (LETT
                                                                          |ii|
                                                                          (+
                                                                           |ii|
                                                                           1)
                                                                          . #22#)))))))
                                                                   (LETT |i|
                                                                         (|inc_SI|
                                                                          |i|)
                                                                         . #22#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL)))
                                                                 #26#
                                                                 (EXIT #7#))
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
                                                                           #6#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #22#)
                                                                        (|check_subtype|
                                                                         (>=
                                                                          #6#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         #6#))
                                                                      (|spadConstant|
                                                                       $ 91))
                                                                     . #22#)
                                                                    (SEQ
                                                                     (LETT |i|
                                                                           1
                                                                           . #22#)
                                                                     (LETT #5#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #22#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |i|
                                                                        #5#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (EXIT
                                                                       (SEQ
                                                                        (LETT
                                                                         |l| 1
                                                                         . #22#)
                                                                        G190
                                                                        (COND
                                                                         ((|greater_SI|
                                                                           |l|
                                                                           |m|)
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
                                                                              99))
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             16))
                                                                           (QREFELT
                                                                            $
                                                                            101))))
                                                                        (LETT
                                                                         |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #22#)
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))))
                                                                     (LETT |i|
                                                                           (|inc_SI|
                                                                            |i|)
                                                                           . #22#)
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
                                                                            . #22#)
                                                                      (GO
                                                                       #24#)))))))))))))))))))))))))))))
                            ('T (|error| "Run out of primes")))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #4# (CONS 1 'T) . #22#) (GO #24#)))))
          #24# (EXIT #4#)))) 

(SDEFUN |MODHP;get_variables2|
        ((|llpi| |List| (|List| (|Fraction| (|Polynomial| (|Integer|)))))
         ($ |List| (|Symbol|)))
        (SPROG
         ((|res| (|List| (|Symbol|))) (#1=#:G312 NIL) (|p| NIL) (#2=#:G311 NIL)
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
                                            (QREFELT $ 106))
                                           (QREFELT $ 107))
                                 . #3#)
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT $ 46))
                                             (QREFELT $ 106))
                                            (QREFELT $ 107))
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
          (#1=#:G324 NIL) (|i| (|Integer|)) (|term| (|Polynomial| (|Integer|)))
          (|term1| (|Polynomial| (|Integer|))) (#2=#:G318 NIL) (|k| NIL)
          (#3=#:G327 NIL) (|var| NIL) (|j| (|Integer|)) (#4=#:G314 NIL)
          (|jj| (|Integer|)) (|i0| NIL) (|nn| (|NonNegativeInteger|))
          (|nvars| (|NonNegativeInteger|)))
         (SEQ
          (LETT |res| (|spadConstant| $ 108)
                . #5=(|MODHP;unpack_poly;LSevPa2ISup;13|))
          (LETT |nvars| (LENGTH |vars|) . #5#) (LETT |nn| (+ |nvars| 1) . #5#)
          (LETT |vars| (REVERSE |vars|) . #5#) (LETT |j| -1 . #5#)
          (LETT |i| (* |lo| |nn|) . #5#)
          (SEQ (LETT |i0| |lo| . #5#) G190 (COND ((> |i0| |hi|) (GO G191)))
               (SEQ (LETT |jj| (ELT_U32 |exps| |i|) . #5#)
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
                                                           (LETT #4# |j| . #5#)
                                                         (|check_subtype|
                                                          (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                                       (QREFELT $ 109))
                                             (QREFELT $ 110))
                                   . #5#)))
                           (LETT |j| |jj| . #5#)
                           (EXIT (LETT |term| (|spadConstant| $ 111) . #5#)))))
                        (LETT |term1|
                              (SPADCALL (QAREF1 |coeffs| |i0|) (QREFELT $ 112))
                              . #5#)
                        (SEQ (LETT |var| NIL . #5#) (LETT #3# |vars| . #5#)
                             (LETT |k| 1 . #5#) G190
                             (COND
                              ((OR (|greater_SI| |k| |nvars|) (ATOM #3#)
                                   (PROGN (LETT |var| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |term1|
                                     (SPADCALL |term1|
                                               (SPADCALL (|spadConstant| $ 113)
                                                         |var|
                                                         (PROG1
                                                             (LETT #2#
                                                                   (ELT_U32
                                                                    |exps|
                                                                    (+ |i|
                                                                       |k|))
                                                                   . #5#)
                                                           (|check_subtype|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                                         (QREFELT $ 114))
                                               (QREFELT $ 115))
                                     . #5#)))
                             (LETT |k|
                                   (PROG1 (|inc_SI| |k|)
                                     (LETT #3# (CDR #3#) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |term| (SPADCALL |term1| |term| (QREFELT $ 116))
                              . #5#)
                        (EXIT (LETT |i| (+ |i| |nn|) . #5#)))))))
               (LETT |i0| (+ |i0| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (COND
           ((>= |j| 0)
            (LETT |res|
                  (SPADCALL |res|
                            (SPADCALL |term|
                                      (PROG1 (LETT #1# |j| . #5#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))
                                      (QREFELT $ 109))
                            (QREFELT $ 110))
                  . #5#)))
          (EXIT |res|)))) 

(SDEFUN |MODHP;intpoly_to_PFPI|
        ((|p| |SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))
         ($ |SparseUnivariatePolynomial|
          (|Fraction| (|Polynomial| (|Integer|)))))
        (SPADCALL (ELT $ 120) |p| (QREFELT $ 124))) 

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
                      (COND ((SPADCALL |p| (QREFELT $ 125)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 126)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 127)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 128)) . #1#)
                        (LETT |iq| (SPADCALL |q| (QREFELT $ 129)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |iq| |m| (QREFELT $ 130))
                                         |res| (QREFELT $ 131))
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
         (SEQ (LETT |res| (|spadConstant| $ 108) . #1=(|MODHP;PI_to_PPI|))
              (SEQ G190
                   (COND
                    ((NULL (COND ((SPADCALL |p| (QREFELT $ 10)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 8)) . #1#)
                        (LETT |q| (SPADCALL |p| (QREFELT $ 12)) . #1#)
                        (LETT |p| (SPADCALL |p| (QREFELT $ 14)) . #1#)
                        (LETT |mq| (SPADCALL |q| (QREFELT $ 112)) . #1#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |mq| |m| (QREFELT $ 109))
                                         |res| (QREFELT $ 110))
                               . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;LPI_to_LPPI|
        ((|lp| |List| (|SparseUnivariatePolynomial| (|Integer|)))
         ($ |List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG ((#1=#:G342 NIL) (|p| NIL) (#2=#:G341 NIL))
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
         ((|j| NIL) (|i| NIL)
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|resi| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#1=#:G366 NIL)
          (|pres|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (|nlist| (|List| (|List| (|Fraction| (|Integer|))))) (#2=#:G370 NIL)
          (|q| NIL) (#3=#:G369 NIL) (#4=#:G368 NIL) (|li| NIL) (#5=#:G367 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |kind| '|qshiftHP|)
             (PROGN
              (LETT #1# (CONS 1 'T) . #6=(|MODHP;trivial_poly_solve|))
              (GO #7=#:G365)))
            (#8='T
             (SEQ
              (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP| . #6#)))
              (LETT |nlist|
                    (PROGN
                     (LETT #5# NIL . #6#)
                     (SEQ (LETT |li| NIL . #6#) (LETT #4# |list| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |li| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (PROGN
                                    (LETT #3# NIL . #6#)
                                    (SEQ (LETT |q| NIL . #6#)
                                         (LETT #2# |li| . #6#) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |q| (CAR #2#) . #6#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (SPADCALL |q|
                                                            (QREFELT $ 129))
                                                  #3#)
                                                 . #6#)))
                                         (LETT #2# (CDR #2#) . #6#) (GO G190)
                                         G191 (EXIT (NREVERSE #3#))))
                                   #5#)
                                  . #6#)))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    . #6#)
              (LETT |pres|
                    (SPADCALL |nlist| |degs| |kind| |sigma| |gen|
                              (CONS #'|MODHP;trivial_poly_solve!0|
                                    (VECTOR |check| $))
                              (QREFELT $ 105))
                    . #6#)
              (EXIT
               (COND
                ((QEQCAR |pres| 1)
                 (PROGN (LETT #1# (CONS 1 (QCDR |pres|)) . #6#) (GO #7#)))
                (#8#
                 (SEQ (LETT |resi| (QCDR |pres|) . #6#)
                      (LETT |nr| (ANROWS |resi|) . #6#)
                      (LETT |nc| (ANCOLS |resi|) . #6#)
                      (LETT |res|
                            (MAKE_MATRIX1 |nr| |nc| (|spadConstant| $ 108))
                            . #6#)
                      (SEQ (LETT |i| 1 . #6#) G190
                           (COND ((|greater_SI| |i| |nr|) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 1 . #6#) G190
                                  (COND ((|greater_SI| |j| |nc|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |res| |i| |j|
                                              (|MODHP;PI_to_PPI|
                                               (SPADCALL |resi| |i| |j|
                                                         (QREFELT $ 133))
                                               $)
                                              (QREFELT $ 135))))
                                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS 0 |res|))))))))))
          #7# (EXIT #1#)))) 

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
                        (COND ((SPADCALL |qvar| |vars| (QREFELT $ 136)) |vars|)
                              ('T (CONS |qvar| |vars|)))
                        . #1#)))
                (EXIT (REVERSE (SPADCALL |vars| (QREFELT $ 137))))))) 

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
         ((#2=#:G435 NIL) (|l| NIL) (#3=#:G441 NIL) (|i| NIL)
          (|mress|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (#4=#:G418 NIL) (|ii| (|Integer|)) (#5=#:G434 NIL) (|ok| (|Boolean|))
          (|sol_okp| #1#) (|hi| (|Integer|)) (|ohi| #6=(|Integer|))
          (|kk| (|Integer|)) (|lo| #6#) (|j| NIL)
          (|resvi|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|resv|
           (|Vector|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))))
          (|nsols| (|NonNegativeInteger|)) (|cc| (|NonNegativeInteger|))
          (|coeffs| #7=(|PrimitiveArray| (|Integer|)))
          (|exps| #8=(|SortedExponentVector|)) (|oc| (|NonNegativeInteger|))
          (|offsets| #9=(|Vector| (|Integer|)))
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
                      (|:| |rowlen| (|Integer|)) (|:| |offsetdata| #9#)
                      (|:| |expdata| #8#) (|:| |coeffdata| #7#))
            "no_solution"))
          (|gv0|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (#10=#:G440 NIL) (|li| NIL) (#11=#:G439 NIL)
          (|vars| (|List| (|Symbol|))) (|pts| (|U32Vector|)) (#12=#:G433 NIL)
          (#13=#:G438 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#14=#:G437 NIL) (|d| NIL) (#15=#:G436 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #16=(|MODHP;HP_solve_P;LL2SNniMMU;20|))
                (LETT |m| (LENGTH |degs|) . #16#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #15# NIL . #16#)
                        (SEQ (LETT |d| NIL . #16#) (LETT #14# |degs| . #16#)
                             G190
                             (COND
                              ((OR (ATOM #14#)
                                   (PROGN (LETT |d| (CAR #14#) . #16#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #15# (CONS |d| #15#) . #16#)))
                             (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                             (EXIT (NREVERSE #15#))))
                       (QREFELT $ 66))
                      . #16#)
                (LETT |pts|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |kind| '|diffHP|)
                              (EQUAL |kind| '|qdiffHP|))
                          (GETREFV_U32 0 0))
                         ((OR (EQUAL |kind| '|shiftHP|)
                              (EQUAL |kind| '|qmixed|))
                          (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0) . #16#)
                               (SEQ (LETT |i| 0 . #16#)
                                    (LETT #13# (- |sigma| 1) . #16#) G190
                                    (COND ((|greater_SI| |i| #13#) (GO G191)))
                                    (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                    (LETT |i| (|inc_SI| |i|) . #16#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT |pts0|)))
                         ('T
                          (COND
                           ((EQUAL |kind| '|qshiftHP|)
                            (PROGN
                             (LETT #12# (GETREFV_U32 |sigma| 0) . #16#)
                             (GO #17=#:G388)))))))
                       #17# (EXIT #12#))
                      . #16#)
                (LETT |vars| (|MODHP;get_variables2| |list| $) . #16#)
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|)
                      (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
                  (LETT |vars|
                        (COND ((SPADCALL |qvar| |vars| (QREFELT $ 136)) |vars|)
                              (#18='T (CONS |qvar| |vars|)))
                        . #16#)))
                (EXIT
                 (COND
                  ((NULL |vars|)
                   (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma|
                    |gen| |check| $))
                  (#18#
                   (SEQ
                    (LETT |gv0|
                          (PROGN
                           (LETT #11# NIL . #16#)
                           (SEQ (LETT |li| NIL . #16#)
                                (LETT #10# |list| . #16#) G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN
                                       (LETT |li| (CAR #10#) . #16#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11#
                                        (CONS (SPADCALL |li| (QREFELT $ 142))
                                              #11#)
                                        . #16#)))
                                (LETT #10# (CDR #10#) . #16#) (GO G190) G191
                                (EXIT (NREVERSE #11#))))
                          . #16#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (LETT |pp|
                                 (SPADCALL |vars| |gv0| |ve| |sigma| |pts|
                                           |kind| |qvar| |gen| (QREFELT $ 146))
                                 . #16#)
                           (EXIT
                            (COND
                             ((QEQCAR |pp| 1)
                              (PROGN
                               (LETT #2# (CONS 1 'NIL) . #16#)
                               (GO #19=#:G432)))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pp|) . #16#)
                                   (LETT |offsets| (QVELT |ppr| 3) . #16#)
                                   (LETT |oc| (QVSIZE |offsets|) . #16#)
                                   (LETT |exps| (QVELT |ppr| 4) . #16#)
                                   (LETT |coeffs| (QVELT |ppr| 5) . #16#)
                                   (LETT |cc| (QVSIZE |coeffs|) . #16#)
                                   (LETT |nsols|
                                         (QUOTIENT2 (QVSIZE |offsets|) |m|)
                                         . #16#)
                                   (LETT |ok| 'T . #16#) (LETT |kk| 1 . #16#)
                                   (LETT |ohi|
                                         (SPADCALL |offsets| 1 (QREFELT $ 76))
                                         . #16#)
                                   (LETT |resv|
                                         (MAKEARR1 |nsols| (MAKE-ARRAY 0))
                                         . #16#)
                                   (LETT |ii| 1 . #16#)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1 . #16#) G190
                                          (COND
                                           ((|greater_SI| |i| |nsols|)
                                            (GO G191)))
                                          (SEQ
                                           (LETT |resvi|
                                                 (MAKEARR1 |m|
                                                           (|spadConstant| $
                                                                           108))
                                                 . #16#)
                                           (SEQ (LETT |j| 1 . #16#) G190
                                                (COND
                                                 ((|greater_SI| |j| |m|)
                                                  (GO G191)))
                                                (SEQ (LETT |lo| |ohi| . #16#)
                                                     (LETT |ohi|
                                                           (SEQ
                                                            (LETT |kk|
                                                                  (+ |kk| 1)
                                                                  . #16#)
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         |oc|
                                                                         (QREFELT
                                                                          $
                                                                          149))
                                                               (SPADCALL
                                                                |offsets| |kk|
                                                                (QREFELT $
                                                                         76)))
                                                              ('T |cc|))))
                                                           . #16#)
                                                     (LETT |hi| (- |ohi| 1)
                                                           . #16#)
                                                     (EXIT
                                                      (SPADCALL |resvi| |j|
                                                                (SPADCALL
                                                                 |vars| |exps|
                                                                 |coeffs| |lo|
                                                                 |hi|
                                                                 (QREFELT $
                                                                          119))
                                                                (QREFELT $
                                                                         150))))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #16#)
                                                (GO G190) G191 (EXIT NIL))
                                           (LETT |sol_okp|
                                                 (SPADCALL
                                                  (SPADCALL |resvi|
                                                            (QREFELT $ 152))
                                                  |check|)
                                                 . #16#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |sol_okp| 1) "iterate")
                                             ((QEQCAR |sol_okp| 2)
                                              (SEQ (LETT |ok| 'NIL . #16#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #5# |$NoValue|
                                                           . #16#)
                                                     (GO #20=#:G417)))))
                                             ('T
                                              (SEQ
                                               (SPADCALL |resv| |ii| |resvi|
                                                         (QREFELT $ 154))
                                               (EXIT
                                                (LETT |ii| (+ |ii| 1)
                                                      . #16#)))))))
                                          (LETT |i| (|inc_SI| |i|) . #16#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #20# (EXIT #5#))
                                   (EXIT
                                    (COND
                                     (|ok|
                                      (SEQ
                                       (LETT |mress|
                                             (MAKE_MATRIX1 |m|
                                                           (PROG1
                                                               (LETT #4#
                                                                     (- |ii| 1)
                                                                     . #16#)
                                                             (|check_subtype|
                                                              (>= #4# 0)
                                                              '(|NonNegativeInteger|)
                                                              #4#))
                                                           (|spadConstant| $
                                                                           108))
                                             . #16#)
                                       (SEQ (LETT |i| 1 . #16#)
                                            (LETT #3# (- |ii| 1) . #16#) G190
                                            (COND
                                             ((|greater_SI| |i| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |l| 1 . #16#) G190
                                                   (COND
                                                    ((|greater_SI| |l| |m|)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SPADCALL |mress| |l| |i|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |resv| |i|
                                                                 (QREFELT $
                                                                          155))
                                                                |l|
                                                                (QREFELT $ 32))
                                                               (QREFELT $
                                                                        135))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #16#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|) . #16#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #2# (CONS 0 |mress|) . #16#)
                                         (GO #19#)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL
                                        "check_sol_poly rejected solution"
                                        (QREFELT $ 83))
                                       (SPADCALL
                                        (SPADCALL |resvi| (QREFELT $ 156))
                                        (QREFELT $ 83))
                                       (EXIT (|error| "giving up")))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #19# (EXIT #2#)))) 

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
         ((#3=#:G474 NIL) (|l| NIL) (#4=#:G480 NIL) (|i| NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (#5=#:G467 NIL) (|ii| (|Integer|)) (|sol_okp| #2#)
          (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (|bmij| (|U32Vector|)) (|mm| (|Integer|)) (|j| NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (|nsols| (|NonNegativeInteger|)) (|va| #6=(|Vector| (|Integer|)))
          (|bm| #7=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #7#) (|:| |defects| #6#)
                      (|:| |cinds| (|Vector| (|Integer|))))
            "no_solution"))
          (|gv| #1#) (|gv0| (|List| (|U32Vector|))) (#8=#:G479 NIL) (|li| NIL)
          (#9=#:G478 NIL) (|pts| (|U32Vector|)) (#10=#:G473 NIL)
          (#11=#:G477 NIL) (|pts0| (|U32Vector|)) (|ve| (|Vector| (|Integer|)))
          (#12=#:G476 NIL) (|d| NIL) (#13=#:G475 NIL)
          (|m| (|NonNegativeInteger|)) (|lp| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #14=(|MODHP;HP_solve_M;LLSINniMMU;21|))
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|) . #14#)
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #13# NIL . #14#)
                        (SEQ (LETT |d| NIL . #14#) (LETT #12# |degs| . #14#)
                             G190
                             (COND
                              ((OR (ATOM #12#)
                                   (PROGN (LETT |d| (CAR #12#) . #14#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #13# (CONS |d| #13#) . #14#)))
                             (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                             (EXIT (NREVERSE #13#))))
                       (QREFELT $ 66))
                      . #14#)
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            (#15='T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #10#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                               . #14#)
                                         (SEQ (LETT |i| 0 . #14#)
                                              (LETT #11# (- |sigma| 1) . #14#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #11#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|) . #14#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|))
                                        . #14#)
                                  (GO #16=#:G450)))))
                              #16# (EXIT #10#))))
                      . #14#)
                (LETT |gv0|
                      (PROGN
                       (LETT #9# NIL . #14#)
                       (SEQ (LETT |li| NIL . #14#) (LETT #8# |list| . #14#)
                            G190
                            (COND
                             ((OR (ATOM #8#)
                                  (PROGN (LETT |li| (CAR #8#) . #14#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS (SPADCALL |li| (QREFELT $ 160)) #9#)
                                    . #14#)))
                            (LETT #8# (CDR #8#) . #14#) (GO G190) G191
                            (EXIT (NREVERSE #9#))))
                      . #14#)
                (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|) . #14#)
                (LETT |blr|
                      (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                                (QREFELT $ 75))
                      . #14#)
                (EXIT
                 (COND
                  ((QEQCAR |blr| 1)
                   (PROGN (LETT #3# (CONS 1 'NIL) . #14#) (GO #17=#:G472)))
                  (#15#
                   (SEQ (LETT |rblr| (QCDR |blr|) . #14#)
                        (LETT |bm| (QVELT |rblr| 0) . #14#)
                        (LETT |va| (QVELT |rblr| 1) . #14#)
                        (LETT |nsols| (QVSIZE |va|) . #14#)
                        (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)) . #14#)
                        (LETT |ii| 1 . #14#)
                        (SEQ (LETT |i| 1 . #14#) G190
                             (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                             (SEQ
                              (LETT |resvi|
                                    (MAKEARR1 |m| (|spadConstant| $ 91))
                                    . #14#)
                              (SEQ (LETT |j| 1 . #14#) G190
                                   (COND ((|greater_SI| |j| |m|) (GO G191)))
                                   (SEQ
                                    (LETT |mm|
                                          (SPADCALL |ve| |j| (QREFELT $ 76))
                                          . #14#)
                                    (LETT |bmij|
                                          (SPADCALL |bm| |i| |j|
                                                    (QREFELT $ 86))
                                          . #14#)
                                    (LETT |s| (|spadConstant| $ 91) . #14#)
                                    (SEQ (LETT |l| 0 . #14#) G190
                                         (COND
                                          ((|greater_SI| |l| |mm|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL |s|
                                                           (SPADCALL
                                                            (ELT_U32 |bmij|
                                                                     |l|)
                                                            |l| (QREFELT $ 92))
                                                           (QREFELT $ 93))
                                                 . #14#)))
                                         (LETT |l| (|inc_SI| |l|) . #14#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (SPADCALL |resvi| |j| |s|
                                               (QREFELT $ 94))))
                                   (LETT |j| (|inc_SI| |j|) . #14#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |sol_okp|
                                    (SPADCALL (SPADCALL |resvi| (QREFELT $ 96))
                                              |check|)
                                    . #14#)
                              (EXIT
                               (COND ((QEQCAR |sol_okp| 1) "iterate")
                                     ((QEQCAR |sol_okp| 2)
                                      (|error|
                                       "HP_solve_M: check should never return no_solution for finite fields"))
                                     ('T
                                      (SEQ
                                       (SPADCALL |resv| |ii| |resvi|
                                                 (QREFELT $ 98))
                                       (EXIT
                                        (LETT |ii| (+ |ii| 1) . #14#)))))))
                             (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |mress|
                              (MAKE_MATRIX1 |m|
                                            (PROG1 (LETT #5# (- |ii| 1) . #14#)
                                              (|check_subtype| (>= #5# 0)
                                                               '(|NonNegativeInteger|)
                                                               #5#))
                                            (|spadConstant| $ 91))
                              . #14#)
                        (SEQ (LETT |i| 1 . #14#) (LETT #4# (- |ii| 1) . #14#)
                             G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| 1 . #14#) G190
                                    (COND ((|greater_SI| |l| |m|) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |mress| |l| |i|
                                                (SPADCALL
                                                 (SPADCALL |resv| |i|
                                                           (QREFELT $ 99))
                                                 |l| (QREFELT $ 16))
                                                (QREFELT $ 101))))
                                    (LETT |l| (|inc_SI| |l|) . #14#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (PROGN
                          (LETT #3# (CONS 0 |mress|) . #14#)
                          (GO #17#)))))))))
          #17# (EXIT #3#)))) 

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
         (PROG (#1=#:G498)
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
          (LETT $ (GETREFV 171) . #1#)
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
              (26 . |elt|) (|U32Vector|) (|Vector| 17) (32 . |setelt|)
              |MODHP;VSUPI_to_VPA;VIV;2| (|SparseUnivariatePolynomial| 24)
              (39 . |degree|) (44 . |zero?|) (|Polynomial| 11)
              (49 . |leadingCoefficient|) (|List| 74) (|List| 11)
              (|InnerModularHermitePade|) (54 . |modpeval|) (62 . |reductum|)
              (|Vector| 21) (67 . |elt|) |MODHP;VSUPPI_to_VPA;VLLIV;4|
              (|Fraction| 11) (73 . |Zero|) (77 . >) (83 . |numer|)
              (88 . |denom|) (|SingleInteger|) (93 . |invmod|)
              (|Union| 59 '"failed") (|List| (|List| 34))
              |MODHP;LLFI_to_LPA;L2IU;5| (|Fraction| 24) (99 . |numer|)
              (104 . |denom|) (|List| 140) |MODHP;LLFPI_to_LPA;LILLIU;6|
              (109 . |coerce|) (|SparseUnivariatePolynomial| 34)
              (|Mapping| 34 11) (|SparseUnivariatePolynomialFunctions2| 11 34)
              (114 . |map|) (120 . |elt|) (126 . |One|) (|Void|)
              (|U32VectorPolynomialOperations|) (130 . |truncated_mul_add|)
              (|List| 17) (|Mapping| 18 59 11 11)
              |MODHP;check_sol1a;VLM3IUv;10| (139 . +) (|Mapping| 11 11 11)
              (145 . |reduce|) (|Vector| 11) (151 . |vector|) (156 . |Zero|)
              (|IntegerPrimesPackage| 11) (160 . |nextPrime|) (165 . |member?|)
              (171 . |coerce|)
              (|Record| (|:| |basis| 85) (|:| |defects| 65) (|:| |cinds| 65))
              (|Union| 72 '"no_solution") (|Symbol|) (176 . |do_modular_solve|)
              (186 . |elt|) (|VectorIntegerReconstructor|) (192 . |empty|)
              (|PositiveInteger|) (197 . *) (|OutputForm|) (|PrintPackage|)
              (203 . |print|) (208 . |coerce|) (|TwoDimensionalArray| 17)
              (213 . |elt|) (220 . |chinese_update|) (227 . |setelt|)
              (|Union| 118 '"failed") (234 . |reconstruct|) (240 . |Zero|)
              (244 . |monomial|) (250 . +) (256 . |setelt|) (|List| 7)
              (263 . |entries|) (|Vector| 15) (268 . |setelt|) (275 . |elt|)
              (|Matrix| 7) (281 . |setelt|) (|Union| 100 9)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 103 95)
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
              (|Matrix| 21) (407 . |setelt|) (415 . |member?|) (421 . |sort|)
              |MODHP;get_variables;L2SL;19| (426 . |One|) (|List| 44)
              (|PrimitiveArray| 44) (430 . |construct|)
              (|Record| (|:| |defects| 65) (|:| |cinds| 65) (|:| |rowlen| 11)
                        (|:| |offsetdata| 65) (|:| |expdata| 117)
                        (|:| |coeffdata| 118))
              (|Union| 143 '"no_solution") (|List| 141)
              (435 . |do_poly_integer|) (447 . |One|) (451 . |One|) (455 . <=)
              (461 . |setelt|) (|List| 21) (468 . |entries|) (|Vector| 31)
              (473 . |setelt|) (480 . |elt|) (486 . |coerce|) (|Union| 134 9)
              (|Mapping| 103 151) |MODHP;HP_solve_P;LL2SNniMMU;20|
              (491 . |construct|) (|List| 27) |MODHP;HP_solve_M;LLSINniMMU;21|
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))) 9)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 103
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              |MODHP;HP_solve_A;LLSNniMMU;22|
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               9)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 103
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
                             (|makeByteWordVec2| 170
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
                                                   11 0 70 1 39 0 11 71 6 28 73
                                                   18 65 6 17 11 74 75 2 65 11
                                                   0 11 76 1 77 0 11 78 2 6 0
                                                   79 0 80 1 82 56 81 83 1 11
                                                   81 0 84 3 85 17 0 11 11 86 3
                                                   77 56 17 11 0 87 3 65 11 0
                                                   11 11 88 2 77 89 0 65 90 0 7
                                                   0 91 2 7 0 11 6 92 2 7 0 0 0
                                                   93 3 15 7 0 11 7 94 1 15 95
                                                   0 96 3 97 15 0 11 15 98 2 97
                                                   15 0 11 99 4 100 7 0 11 11 7
                                                   101 1 24 26 0 106 2 26 0 0 0
                                                   107 0 21 0 108 2 21 0 24 6
                                                   109 2 21 0 0 0 110 0 24 0
                                                   111 1 24 0 11 112 0 24 0 113
                                                   3 24 0 0 74 6 114 2 24 0 0 0
                                                   115 2 24 0 0 0 116 1 44 0 24
                                                   120 2 123 121 122 21 124 1
                                                   121 9 0 125 1 121 6 0 126 1
                                                   121 44 0 127 1 121 0 0 128 1
                                                   44 34 0 129 2 50 0 34 6 130
                                                   2 50 0 0 0 131 0 121 0 132 3
                                                   100 7 0 11 11 133 4 134 21 0
                                                   11 11 21 135 2 26 9 74 0 136
                                                   1 26 0 0 137 0 121 0 139 1
                                                   141 0 140 142 8 28 144 26
                                                   145 65 6 17 74 74 60 146 0
                                                   21 0 147 0 44 0 148 2 11 9 0
                                                   0 149 3 31 21 0 11 21 150 1
                                                   31 151 0 152 3 153 31 0 11
                                                   31 154 2 153 31 0 11 155 1
                                                   31 81 0 156 1 17 0 27 160 5
                                                   0 21 26 117 118 11 11 119 3
                                                   0 26 47 74 74 138 6 0 17 18
                                                   59 60 11 11 11 61 4 0 18 31
                                                   26 27 11 33 2 0 18 15 11 20
                                                   5 0 41 47 11 26 27 11 48 3 0
                                                   41 42 11 11 43 7 0 167 168
                                                   27 74 74 6 60 169 170 7 0
                                                   157 47 27 74 74 6 60 158 159
                                                   7 0 102 161 27 74 11 6 60
                                                   104 162 6 0 102 42 27 74 6
                                                   60 104 105 6 0 163 164 27 74
                                                   6 60 165 166)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularHermitePade| 'NILADIC T) 
