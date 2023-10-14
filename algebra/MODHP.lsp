
(/VERSIONCHECK 2) 

(DEFUN |MODHP;SUPI_to_PA| (|poli| |p| $)
  (PROG (|nlc| |m| |pa| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |poli| (QREFELT $ 8)) . #1=(|MODHP;SUPI_to_PA|))
          (LETT |pa| (GETREFV_U32 (+ |n| 1) 0) . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |poli| (QREFELT $ 10)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 8)) . #1#)
                    (LETT |nlc|
                          (SPADCALL (SPADCALL |poli| (QREFELT $ 12)) |p|
                                    (QREFELT $ 13))
                          . #1#)
                    (SETELT_U32 |pa| |m| |nlc|)
                    (EXIT
                     (LETT |poli| (SPADCALL |poli| (QREFELT $ 14)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |pa|))))) 

(DEFUN |MODHP;VSUPI_to_VPA;VIV;2| (|vps| |p| $)
  (PROG (|i| |vpa| |m|)
    (RETURN
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
          (EXIT |vpa|))))) 

(DEFUN |MODHP;SUPPI_to_PA| (|poli| |vars| |pts| |p| $)
  (PROG (|nlc| |m| |pa| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |poli| (QREFELT $ 22)) . #1=(|MODHP;SUPPI_to_PA|))
      (LETT |pa| (GETREFV_U32 (+ |n| 1) 0) . #1#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |poli| (QREFELT $ 23)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ (LETT |m| (SPADCALL |poli| (QREFELT $ 22)) . #1#)
                (LETT |nlc|
                      (SPADCALL (SPADCALL |poli| (QREFELT $ 25)) |vars| |pts|
                                |p| (QREFELT $ 29))
                      . #1#)
                (SETELT_U32 |pa| |m| |nlc|)
                (EXIT (LETT |poli| (SPADCALL |poli| (QREFELT $ 30)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |pa|))))) 

(DEFUN |MODHP;VSUPPI_to_VPA;VLLIV;4| (|vps| |vars| |pts| |p| $)
  (PROG (|i| |vpa| |m|)
    (RETURN
     (SEQ (LETT |m| (QVSIZE |vps|) . #1=(|MODHP;VSUPPI_to_VPA;VLLIV;4|))
          (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |m|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |vpa| |i|
                           (|MODHP;SUPPI_to_PA|
                            (SPADCALL |vps| |i| (QREFELT $ 32)) |vars| |pts|
                            |p| $)
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |vpa|))))) 

(DEFUN |MODHP;LLFI_to_LPA;L2IU;5| (|llfi| |n| |prime| $)
  (PROG (|resl| |nlc| |dms| #1=#:G190 |dm| |nm| #2=#:G192 |j| #3=#:G193 |el|
         |pa| |nn| #4=#:G191 |lfi|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |resl| NIL . #5=(|MODHP;LLFI_to_LPA;L2IU;5|))
            (SEQ (LETT |lfi| NIL . #5#) (LETT #4# |llfi| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |lfi| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |nn|
                        (COND ((SPADCALL |n| 0 (QREFELT $ 36)) |n|)
                              ('T (LENGTH |lfi|)))
                        . #5#)
                  (LETT |pa| (GETREFV_U32 |nn| 0) . #5#)
                  (SEQ (LETT |el| NIL . #5#) (LETT #3# |lfi| . #5#)
                       (LETT |j| 0 . #5#) (LETT #2# (- |nn| 1) . #5#) G190
                       (COND
                        ((OR (|greater_SI| |j| #2#) (ATOM #3#)
                             (PROGN (LETT |el| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |nm|
                              (SPADCALL (SPADCALL |el| (QREFELT $ 37)) |prime|
                                        (QREFELT $ 13))
                              . #5#)
                        (LETT |dm|
                              (SPADCALL (SPADCALL |el| (QREFELT $ 38)) |prime|
                                        (QREFELT $ 13))
                              . #5#)
                        (EXIT
                         (COND
                          ((EQL |dm| 0)
                           (PROGN (LETT #1# (CONS 1 "failed") . #5#) (GO #1#)))
                          ('T
                           (SEQ (LETT |dms| |dm| . #5#)
                                (LETT |nlc|
                                      (QSMULMOD32 |nm|
                                                  (SPADCALL |dms| |prime|
                                                            (QREFELT $ 40))
                                                  |prime|)
                                      . #5#)
                                (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #3# (CDR #3#) . #5#))
                             . #5#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |resl| (CONS |pa| |resl|) . #5#)))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |resl|)))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;LLFPI_to_LPA;LILLIU;6| (|llfi| |n| |vars| |pts| |prime| $)
  (PROG (|resl| |nlc| |dms| #1=#:G203 |dm| |nm| #2=#:G205 |j| #3=#:G206 |el|
         |pa| #4=#:G204 |lfi|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |resl| NIL . #5=(|MODHP;LLFPI_to_LPA;LILLIU;6|))
            (SEQ (LETT |lfi| NIL . #5#) (LETT #4# |llfi| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |lfi| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (LETT |pa| (GETREFV_U32 |n| 0) . #5#)
                      (SEQ (LETT |el| NIL . #5#) (LETT #3# |lfi| . #5#)
                           (LETT |j| 0 . #5#) (LETT #2# (- |n| 1) . #5#) G190
                           (COND
                            ((OR (|greater_SI| |j| #2#) (ATOM #3#)
                                 (PROGN (LETT |el| (CAR #3#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 45))
                                            |vars| |pts| |prime|
                                            (QREFELT $ 29))
                                  . #5#)
                            (LETT |dm|
                                  (SPADCALL (SPADCALL |el| (QREFELT $ 46))
                                            |vars| |pts| |prime|
                                            (QREFELT $ 29))
                                  . #5#)
                            (EXIT
                             (COND
                              ((EQL |dm| 0)
                               (PROGN
                                (LETT #1# (CONS 1 "failed") . #5#)
                                (GO #1#)))
                              ('T
                               (SEQ (LETT |dms| |dm| . #5#)
                                    (LETT |nlc|
                                          (QSMULMOD32 |nm|
                                                      (SPADCALL |dms| |prime|
                                                                (QREFELT $ 40))
                                                      |prime|)
                                          . #5#)
                                    (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|)
                                   (LETT #3# (CDR #3#) . #5#))
                                 . #5#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |pa| |resl|) . #5#)))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |resl|)))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;PPFtoPA| (|pfi| |sigma| |psi| $)
  (PROG (|nc| |nlcq| |m| |prime| |pa|)
    (RETURN
     (SEQ (LETT |pa| (GETREFV_U32 |sigma| 0) . #1=(|MODHP;PPFtoPA|))
          (LETT |prime| |psi| . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |pfi| (QREFELT $ 10)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |m| (SPADCALL |pfi| (QREFELT $ 8)) . #1#)
                    (COND
                     ((< |m| |sigma|)
                      (SEQ (LETT |nlcq| (SPADCALL |pfi| (QREFELT $ 12)) . #1#)
                           (LETT |nc| (SPADCALL |nlcq| |prime| (QREFELT $ 13))
                                 . #1#)
                           (EXIT (SETELT_U32 |pa| |m| |nc|)))))
                    (EXIT (LETT |pfi| (SPADCALL |pfi| (QREFELT $ 14)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 0 |pa|)))))) 

(DEFUN |MODHP;LPPFtoVPA| (|lpi| |sigma| |psi| $)
  (PROG (#1=#:G222 |vpp| |i| #2=#:G223 |p| |vpa| |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |m| (LENGTH |lpi|) . #3=(|MODHP;LPPFtoVPA|))
            (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #3#)
            (SEQ (LETT |p| NIL . #3#) (LETT #2# |lpi| . #3#) (LETT |i| 1 . #3#)
                 G190
                 (COND
                  ((OR (|greater_SI| |i| |m|) (ATOM #2#)
                       (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |vpp| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                        ('T
                         (SPADCALL |vpa| |i| (QCDR |vpp|) (QREFELT $ 19))))))
                 (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                       . #3#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |vpa|))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;intpoly_to_PFI| (|p| $) (SPADCALL (ELT $ 49) |p| (QREFELT $ 53))) 

(DEFUN |MODHP;check_sol1a;VLM3IUv;10| (|nres| |gv0| |gen| |sigma| |qval| |p| $)
  (PROG (|i| |res| |gvp| |m|)
    (RETURN
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
          (EXIT |res|))))) 

(DEFUN |MODHP;HP_solve_I;LLSNniMMU;11|
       (|list| |degs| |kind| |sigma| |gen| |check| $)
  (PROG (#1=#:G322 |l| #2=#:G326 |i| |mress| #3=#:G301 |ii| #4=#:G300 |sol_ok|
         |sol_okp| |k| |s| |mm| |j| |resvi| |resv| #5=#:G288 |ppr| |pp|
         |empty_offsets| |offsets| #6=#:G280 |cp| |rv| #7=#:G270 |rstate|
         |oldciv| |oldva| |nsols| #8=#:G267 |is_bad| |all_bad| |civ| |va| |bm|
         |rblr| |blr| |gv2| |gv0| |gv0p| |psi| |nprimes| |ok| |lp| |prime|
         |maxd| |vi| |pts| #9=#:G247 #10=#:G325 |pts0| |ve| #11=#:G324 |d|
         #12=#:G323 |degs_sum| |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lp| NIL . #13=(|MODHP;HP_solve_I;LLSNniMMU;11|))
            (COND
             ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
              (EXIT (CONS 1 'T))))
            (LETT |m| (LENGTH |degs|) . #13#)
            (LETT |degs_sum|
                  (+ (SPADCALL (ELT $ 62) |degs| (QREFELT $ 64)) |m|) . #13#)
            (LETT |ve|
                  (SPADCALL
                   (PROGN
                    (LETT #12# NIL . #13#)
                    (SEQ (LETT |d| NIL . #13#) (LETT #11# |degs| . #13#) G190
                         (COND
                          ((OR (ATOM #11#)
                               (PROGN (LETT |d| (CAR #11#) . #13#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #12# (CONS |d| #12#) . #13#)))
                         (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                         (EXIT (NREVERSE #12#))))
                   (QREFELT $ 66))
                  . #13#)
            (LETT |pts|
                  (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((EQUAL |kind| '|shiftHP|)
                             (PROGN
                              (LETT #9#
                                    (SEQ
                                     (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                           . #13#)
                                     (SEQ (LETT |i| 0 . #13#)
                                          (LETT #10# (- |sigma| 1) . #13#) G190
                                          (COND
                                           ((|greater_SI| |i| #10#) (GO G191)))
                                          (SEQ
                                           (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                          (LETT |i| (|inc_SI| |i|) . #13#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT |pts0|))
                                    . #13#)
                              (GO #9#)))))
                          #9# (EXIT #9#))))
                  . #13#)
            (LETT |vi| (MAKEARR1 |m| NIL) . #13#) (LETT |nsols| -1 . #13#)
            (LETT |maxd| -1 . #13#) (LETT |nprimes| 0 . #13#)
            (LETT |nsols| (+ |m| 1) . #13#) (LETT |empty_offsets| 'T . #13#)
            (SEQ G190 NIL
                 (SEQ (LETT |ok| 'NIL . #13#)
                      (SEQ (LETT |k| 1 . #13#) G190
                           (COND
                            ((OR (|greater_SI| |k| 100)
                                 (NULL (COND (|ok| 'NIL) ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (LETT |prime|
                                  (SPADCALL (+ (RANDOM 2000000) 2000000)
                                            (QREFELT $ 69))
                                  . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL |prime| |lp| (QREFELT $ 70))
                               "iterate")
                              ('T
                               (SEQ (LETT |lp| (CONS |prime| |lp|) . #13#)
                                    (EXIT (LETT |ok| 'T . #13#)))))))
                           (LETT |k| (|inc_SI| |k|) . #13#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        (|ok|
                         (SEQ (LETT |nprimes| (+ |nprimes| 1) . #13#)
                              (LETT |psi| (SPADCALL |prime| (QREFELT $ 71))
                                    . #13#)
                              (LETT |gv0p|
                                    (SPADCALL |list| 0 |psi| (QREFELT $ 43))
                                    . #13#)
                              (EXIT
                               (COND ((QEQCAR |gv0p| 1) "iterate")
                                     ('T
                                      (SEQ (LETT |gv0| (QCDR |gv0p|) . #13#)
                                           (LETT |gv2|
                                                 (SPADCALL |gv0| |prime| 1
                                                           |gen|)
                                                 . #13#)
                                           (LETT |blr|
                                                 (SPADCALL |gv2| |ve| |sigma|
                                                           |pts| |prime| |kind|
                                                           (QREFELT $ 75))
                                                 . #13#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |blr| 1)
                                              (PROGN
                                               (LETT #1# (CONS 1 'NIL) . #13#)
                                               (GO #1#)))
                                             ('T
                                              (SEQ
                                               (LETT |rblr| (QCDR |blr|)
                                                     . #13#)
                                               (LETT |bm| (QVELT |rblr| 0)
                                                     . #13#)
                                               (LETT |va| (QVELT |rblr| 1)
                                                     . #13#)
                                               (LETT |civ| (QVELT |rblr| 2)
                                                     . #13#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QVSIZE |va|)
                                                            |nsols|
                                                            (QREFELT $ 36))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |is_bad| 'NIL . #13#)
                                                   (LETT |all_bad|
                                                         (< (QVSIZE |va|)
                                                            |nsols|)
                                                         . #13#)
                                                   (COND
                                                    ((EQL (QVSIZE |va|)
                                                          |nsols|)
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ (LETT |i| 1 . #13#)
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
                                                                  . #13#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #8#
                                                                         |$NoValue|
                                                                         . #13#)
                                                                   (GO #8#)))))
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
                                                                       . #13#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #8#
                                                                         |$NoValue|
                                                                         . #13#)
                                                                   (GO #8#)))))
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
                                                                  . #13#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #8#
                                                                         |$NoValue|
                                                                         . #13#)
                                                                   (GO #8#)))))
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
                                                                       . #13#)
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #8#
                                                                         |$NoValue|
                                                                         . #13#)
                                                                   (GO
                                                                    #8#))))))))
                                                            (LETT |i|
                                                                  (|inc_SI|
                                                                   |i|)
                                                                  . #13#)
                                                            (GO G190) G191
                                                            (EXIT NIL)))
                                                      #8# (EXIT #8#))))
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
                                                                     . #13#)
                                                               (LETT |oldva|
                                                                     |va|
                                                                     . #13#)
                                                               (LETT |oldciv|
                                                                     |civ|
                                                                     . #13#)
                                                               (LETT |rstate|
                                                                     (SPADCALL
                                                                      (*
                                                                       |nsols|
                                                                       |degs_sum|)
                                                                      (QREFELT
                                                                       $ 78))
                                                                     . #13#)
                                                               (LETT |rv|
                                                                     (GETREFV_U32
                                                                      (SPADCALL
                                                                       (PROG1
                                                                           (LETT
                                                                            #7#
                                                                            |nsols|
                                                                            . #13#)
                                                                         (|check_subtype|
                                                                          (>
                                                                           #7#
                                                                           0)
                                                                          '(|PositiveInteger|)
                                                                          #7#))
                                                                       |degs_sum|
                                                                       (QREFELT
                                                                        $ 80))
                                                                      0)
                                                                     . #13#)
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'T . #13#)))))
                                                            (LETT |k| 0 . #13#)
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
                                                                   . #13#)
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |i| |nsols|)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |j| 1
                                                                      . #13#)
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
                                                                       . #13#)
                                                                 (LETT |cp|
                                                                       (SPADCALL
                                                                        |bm|
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         $ 86))
                                                                       . #13#)
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |l| 0
                                                                         . #13#)
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
                                                                           . #13#)))
                                                                   (LETT |l|
                                                                         (|inc_SI|
                                                                          |l|)
                                                                         . #13#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT
                                                                    NIL))))
                                                                (LETT |j|
                                                                      (|inc_SI|
                                                                       |j|)
                                                                      . #13#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))
                                                             (LETT |i|
                                                                   (|inc_SI|
                                                                    |i|)
                                                                   . #13#)
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
                                                                           #6#
                                                                           |nsols|
                                                                           . #13#)
                                                                        (|check_subtype|
                                                                         (>=
                                                                          #6#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         #6#))
                                                                      0)
                                                                     . #13#)
                                                               (LETT |j| 0
                                                                     . #13#)
                                                               (SEQ
                                                                (LETT |i| 1
                                                                      . #13#)
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
                                                                        . #13#)))
                                                                (LETT |i|
                                                                      (|inc_SI|
                                                                       |i|)
                                                                      . #13#)
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                               (EXIT
                                                                (LETT
                                                                 |empty_offsets|
                                                                 'NIL
                                                                 . #13#)))))
                                                            (LETT |pp|
                                                                  (SPADCALL
                                                                   |rstate|
                                                                   |offsets|
                                                                   (QREFELT $
                                                                            90))
                                                                  . #13#)
                                                            (EXIT
                                                             (COND
                                                              ((QEQCAR |pp| 1)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |ppr|
                                                                      (QCDR
                                                                       |pp|)
                                                                      . #13#)
                                                                (LETT |k| 0
                                                                      . #13#)
                                                                (LETT |resv|
                                                                      (MAKEARR1
                                                                       (PROG1
                                                                           (LETT
                                                                            #5#
                                                                            |nsols|
                                                                            . #13#)
                                                                         (|check_subtype|
                                                                          (>=
                                                                           #5#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          #5#))
                                                                       (MAKE-ARRAY
                                                                        0))
                                                                      . #13#)
                                                                (LETT |ii| 1
                                                                      . #13#)
                                                                (LETT |sol_ok|
                                                                      'T
                                                                      . #13#)
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |i| 1
                                                                         . #13#)
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
                                                                     . #13#)
                                                                    (SEQ
                                                                     (LETT |j|
                                                                           1
                                                                           . #13#)
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
                                                                       . #13#)
                                                                      (LETT |s|
                                                                            (|spadConstant|
                                                                             $
                                                                             91)
                                                                            . #13#)
                                                                      (SEQ
                                                                       (LETT
                                                                        |l| 0
                                                                        . #13#)
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
                                                                         . #13#)
                                                                        (EXIT
                                                                         (LETT
                                                                          |k|
                                                                          (+
                                                                           |k|
                                                                           1)
                                                                          . #13#)))
                                                                       (LETT
                                                                        |l|
                                                                        (|inc_SI|
                                                                         |l|)
                                                                        . #13#)
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
                                                                           . #13#)
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
                                                                     . #13#)
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
                                                                         . #13#)
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #4#
                                                                           |$NoValue|
                                                                           . #13#)
                                                                          (GO
                                                                           #4#)))))
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
                                                                          . #13#)))))))
                                                                   (LETT |i|
                                                                         (|inc_SI|
                                                                          |i|)
                                                                         . #13#)
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL)))
                                                                 #4#
                                                                 (EXIT #4#))
                                                                (EXIT
                                                                 (COND
                                                                  (|sol_ok|
                                                                   (SEQ
                                                                    (LETT
                                                                     |mress|
                                                                     (SPADCALL
                                                                      |m|
                                                                      (PROG1
                                                                          (LETT
                                                                           #3#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #13#)
                                                                        (|check_subtype|
                                                                         (>=
                                                                          #3#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         #3#))
                                                                      (|spadConstant|
                                                                       $ 91)
                                                                      (QREFELT
                                                                       $ 100))
                                                                     . #13#)
                                                                    (SEQ
                                                                     (LETT |i|
                                                                           1
                                                                           . #13#)
                                                                     (LETT #2#
                                                                           (-
                                                                            |ii|
                                                                            1)
                                                                           . #13#)
                                                                     G190
                                                                     (COND
                                                                      ((|greater_SI|
                                                                        |i|
                                                                        #2#)
                                                                       (GO
                                                                        G191)))
                                                                     (SEQ
                                                                      (EXIT
                                                                       (SEQ
                                                                        (LETT
                                                                         |l| 1
                                                                         . #13#)
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
                                                                              101))
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
                                                                         . #13#)
                                                                        (GO
                                                                         G190)
                                                                        G191
                                                                        (EXIT
                                                                         NIL))))
                                                                     (LETT |i|
                                                                           (|inc_SI|
                                                                            |i|)
                                                                           . #13#)
                                                                     (GO G190)
                                                                     G191
                                                                     (EXIT
                                                                      NIL))
                                                                    (EXIT
                                                                     (PROGN
                                                                      (LETT #1#
                                                                            (CONS
                                                                             0
                                                                             |mress|)
                                                                            . #13#)
                                                                      (GO
                                                                       #1#)))))))))))))))))))))))))))))
                        ('T (|error| "Run out of primes")))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #1# (CONS 1 'T) . #13#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;get_variables2| (|llpi| $)
  (PROG (|res| #1=#:G333 |p| #2=#:G332 |lpi|)
    (RETURN
     (SEQ (LETT |res| NIL . #3=(|MODHP;get_variables2|))
          (SEQ (LETT |lpi| NIL . #3#) (LETT #2# |llpi| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |lpi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #3#) (LETT #1# |lpi| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                                 (QREFELT $ 107))
                                       (QREFELT $ 108))
                             . #3#)
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 46))
                                                  (QREFELT $ 107))
                                        (QREFELT $ 108))
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MODHP;unpack_poly;LSevPa2ISup;13| (|vars| |exps| |coeffs| |lo| |hi| $)
  (PROG (|res| #1=#:G345 |i| |term| |term1| #2=#:G339 |k| #3=#:G348 |var| |j|
         #4=#:G335 |jj| |i0| |nn| |nvars|)
    (RETURN
     (SEQ
      (LETT |res| (|spadConstant| $ 109)
            . #5=(|MODHP;unpack_poly;LSevPa2ISup;13|))
      (LETT |nvars| (LENGTH |vars|) . #5#) (LETT |nn| (+ |nvars| 1) . #5#)
      (LETT |vars| (REVERSE |vars|) . #5#) (LETT |j| -1 . #5#)
      (LETT |i| (* |lo| |nn|) . #5#)
      (SEQ (LETT |i0| |lo| . #5#) G190 (COND ((> |i0| |hi|) (GO G191)))
           (SEQ (LETT |jj| (ELT_U32 |exps| |i|) . #5#)
                (EXIT
                 (COND
                  ((< |jj| |j|)
                   (|error| "Internal error: inconsistent exponent vector"))
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
                                                   (PROG1 (LETT #4# |j| . #5#)
                                                     (|check_subtype|
                                                      (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      #4#))
                                                   (QREFELT $ 110))
                                         (QREFELT $ 111))
                               . #5#)))
                       (LETT |j| |jj| . #5#)
                       (EXIT (LETT |term| (|spadConstant| $ 112) . #5#)))))
                    (LETT |term1|
                          (SPADCALL (QAREF1 |coeffs| |i0|) (QREFELT $ 113))
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
                                           (SPADCALL (|spadConstant| $ 114)
                                                     |var|
                                                     (PROG1
                                                         (LETT #2#
                                                               (ELT_U32 |exps|
                                                                        (+ |i|
                                                                           |k|))
                                                               . #5#)
                                                       (|check_subtype|
                                                        (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        #2#))
                                                     (QREFELT $ 115))
                                           (QREFELT $ 116))
                                 . #5#)))
                         (LETT |k|
                               (PROG1 (|inc_SI| |k|)
                                 (LETT #3# (CDR #3#) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |term| (SPADCALL |term1| |term| (QREFELT $ 117))
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
                                  (QREFELT $ 110))
                        (QREFELT $ 111))
              . #5#)))
      (EXIT |res|))))) 

(DEFUN |MODHP;intpoly_to_PFPI| (|p| $)
  (SPADCALL (ELT $ 121) |p| (QREFELT $ 125))) 

(DEFUN |MODHP;PFPI_to_PFI| (|p| $)
  (PROG (|res| |iq| |q| |m|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 67) . #1=(|MODHP;PFPI_to_PFI|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |p| (QREFELT $ 126)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |m| (SPADCALL |p| (QREFELT $ 127)) . #1#)
                    (LETT |q| (SPADCALL |p| (QREFELT $ 128)) . #1#)
                    (LETT |p| (SPADCALL |p| (QREFELT $ 129)) . #1#)
                    (LETT |iq| (SPADCALL |q| (QREFELT $ 130)) . #1#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL (SPADCALL |iq| |m| (QREFELT $ 131)) |res|
                                     (QREFELT $ 132))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MODHP;PI_to_PPI| (|p| $)
  (PROG (|res| |mq| |q| |m|)
    (RETURN
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
                           (SPADCALL (SPADCALL |mq| |m| (QREFELT $ 110)) |res|
                                     (QREFELT $ 111))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MODHP;LPI_to_LPPI| (|lp| $)
  (PROG (#1=#:G363 |p| #2=#:G362)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MODHP;LPI_to_LPPI|))
       (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (|MODHP;PI_to_PPI| |p| $) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MODHP;trivial_poly_solve|
       (|list| |degs| |kind| |sigma| |gen| |check| $)
  (PROG (|j| |i| |res| |nc| |nr| |resi| #1=#:G386 |pres| |nlist| #2=#:G390 |q|
         #3=#:G389 #4=#:G388 |li| #5=#:G387)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQUAL |kind| '|qshiftHP|)
         (PROGN
          (LETT #1# (CONS 1 'T) . #6=(|MODHP;trivial_poly_solve|))
          (GO #1#)))
        (#7='T
         (SEQ (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP| . #6#)))
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
                                                            (QREFELT $ 130))
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
                              (QREFELT $ 106))
                    . #6#)
              (EXIT
               (COND
                ((QEQCAR |pres| 1)
                 (PROGN (LETT #1# (CONS 1 (QCDR |pres|)) . #6#) (GO #1#)))
                (#7#
                 (SEQ (LETT |resi| (QCDR |pres|) . #6#)
                      (LETT |nr| (QVSIZE |resi|) . #6#)
                      (LETT |nc| (SPADCALL |resi| (QREFELT $ 133)) . #6#)
                      (LETT |res|
                            (SPADCALL |nr| |nc| (|spadConstant| $ 109)
                                      (QREFELT $ 136))
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
                                                         (QREFELT $ 137))
                                               $)
                                              (QREFELT $ 138))))
                                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190)
                                  G191 (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS 0 |res|))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;trivial_poly_solve!0| (|x| $$)
  (PROG ($ |check|)
    (LETT $ (QREFELT $$ 1) . #1=(|MODHP;trivial_poly_solve|))
    (LETT |check| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (|MODHP;LPI_to_LPPI| |x| $) |check|))))) 

(DEFUN |MODHP;get_variables;L2SL;19| (|list| |kind| |qvar| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (LETT |vars| (|MODHP;get_variables2| |list| $)
            . #1=(|MODHP;get_variables;L2SL;19|))
      (COND
       ((OR (EQUAL |kind| '|qdiffHP|)
            (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
        (LETT |vars|
              (COND ((SPADCALL |qvar| |vars| (QREFELT $ 139)) |vars|)
                    ('T (CONS |qvar| |vars|)))
              . #1#)))
      (EXIT (REVERSE (SPADCALL |vars| (QREFELT $ 140)))))))) 

(DEFUN |MODHP;HP_solve_P;LL2SNniMMU;20|
       (|list| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G452 |l| #2=#:G458 |i| |mress| #3=#:G438 |ii| #4=#:G437 |ok|
         |sol_okp| |hi| |ohi| |kk| |lo| |j| |resvi| |resv| |nsols| |cc|
         |coeffs| |exps| |oc| |offsets| |ppr| |pp| |gv0| #5=#:G457 |li|
         #6=#:G456 |vars| |pts| #7=#:G408 #8=#:G455 |pts0| |ve| #9=#:G454 |d|
         #10=#:G453 |m| |lp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lp| NIL . #11=(|MODHP;HP_solve_P;LL2SNniMMU;20|))
            (LETT |m| (LENGTH |degs|) . #11#)
            (LETT |ve|
                  (SPADCALL
                   (PROGN
                    (LETT #10# NIL . #11#)
                    (SEQ (LETT |d| NIL . #11#) (LETT #9# |degs| . #11#) G190
                         (COND
                          ((OR (ATOM #9#)
                               (PROGN (LETT |d| (CAR #9#) . #11#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #10# (CONS |d| #10#) . #11#)))
                         (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                         (EXIT (NREVERSE #10#))))
                   (QREFELT $ 66))
                  . #11#)
            (LETT |pts|
                  (SEQ
                   (EXIT
                    (COND
                     ((OR (EQUAL |kind| '|diffHP|) (EQUAL |kind| '|qdiffHP|))
                      (GETREFV_U32 0 0))
                     ((OR (EQUAL |kind| '|shiftHP|) (EQUAL |kind| '|qmixed|))
                      (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0) . #11#)
                           (SEQ (LETT |i| 0 . #11#)
                                (LETT #8# (- |sigma| 1) . #11#) G190
                                (COND ((|greater_SI| |i| #8#) (GO G191)))
                                (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |pts0|)))
                     ('T
                      (COND
                       ((EQUAL |kind| '|qshiftHP|)
                        (PROGN
                         (LETT #7# (GETREFV_U32 |sigma| 0) . #11#)
                         (GO #7#)))))))
                   #7# (EXIT #7#))
                  . #11#)
            (LETT |vars| (|MODHP;get_variables2| |list| $) . #11#)
            (COND
             ((OR (EQUAL |kind| '|qdiffHP|)
                  (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
              (LETT |vars|
                    (COND ((SPADCALL |qvar| |vars| (QREFELT $ 139)) |vars|)
                          (#12='T (CONS |qvar| |vars|)))
                    . #11#)))
            (EXIT
             (COND
              ((NULL |vars|)
               (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma| |gen|
                |check| $))
              (#12#
               (SEQ
                (LETT |gv0|
                      (PROGN
                       (LETT #6# NIL . #11#)
                       (SEQ (LETT |li| NIL . #11#) (LETT #5# |list| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |li| (CAR #5#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS (SPADCALL |li| (QREFELT $ 145)) #6#)
                                    . #11#)))
                            (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #11#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |pp|
                             (SPADCALL |vars| |gv0| |ve| |sigma| |pts| |kind|
                                       |qvar| |gen| (QREFELT $ 149))
                             . #11#)
                       (EXIT
                        (COND
                         ((QEQCAR |pp| 1)
                          (PROGN (LETT #1# (CONS 1 'NIL) . #11#) (GO #1#)))
                         ('T
                          (SEQ (LETT |ppr| (QCDR |pp|) . #11#)
                               (LETT |offsets| (QVELT |ppr| 3) . #11#)
                               (LETT |oc| (QVSIZE |offsets|) . #11#)
                               (LETT |exps| (QVELT |ppr| 4) . #11#)
                               (LETT |coeffs| (QVELT |ppr| 5) . #11#)
                               (LETT |cc| (QVSIZE |coeffs|) . #11#)
                               (LETT |nsols| (QUOTIENT2 (QVSIZE |offsets|) |m|)
                                     . #11#)
                               (LETT |ok| 'T . #11#) (LETT |kk| 1 . #11#)
                               (LETT |ohi|
                                     (SPADCALL |offsets| 1 (QREFELT $ 76))
                                     . #11#)
                               (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0))
                                     . #11#)
                               (LETT |ii| 1 . #11#)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |i| 1 . #11#) G190
                                      (COND
                                       ((|greater_SI| |i| |nsols|) (GO G191)))
                                      (SEQ
                                       (LETT |resvi|
                                             (MAKEARR1 |m|
                                                       (|spadConstant| $ 109))
                                             . #11#)
                                       (SEQ (LETT |j| 1 . #11#) G190
                                            (COND
                                             ((|greater_SI| |j| |m|)
                                              (GO G191)))
                                            (SEQ (LETT |lo| |ohi| . #11#)
                                                 (LETT |ohi|
                                                       (SEQ
                                                        (LETT |kk| (+ |kk| 1)
                                                              . #11#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |kk| |oc|
                                                                     (QREFELT $
                                                                              152))
                                                           (SPADCALL |offsets|
                                                                     |kk|
                                                                     (QREFELT $
                                                                              76)))
                                                          ('T |cc|))))
                                                       . #11#)
                                                 (LETT |hi| (- |ohi| 1) . #11#)
                                                 (EXIT
                                                  (SPADCALL |resvi| |j|
                                                            (SPADCALL |vars|
                                                                      |exps|
                                                                      |coeffs|
                                                                      |lo| |hi|
                                                                      (QREFELT
                                                                       $ 120))
                                                            (QREFELT $ 153))))
                                            (LETT |j| (|inc_SI| |j|) . #11#)
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |sol_okp|
                                             (SPADCALL
                                              (SPADCALL |resvi|
                                                        (QREFELT $ 155))
                                              |check|)
                                             . #11#)
                                       (EXIT
                                        (COND ((QEQCAR |sol_okp| 1) "iterate")
                                              ((QEQCAR |sol_okp| 2)
                                               (SEQ (LETT |ok| 'NIL . #11#)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #4# |$NoValue|
                                                            . #11#)
                                                      (GO #4#)))))
                                              ('T
                                               (SEQ
                                                (SPADCALL |resv| |ii| |resvi|
                                                          (QREFELT $ 157))
                                                (EXIT
                                                 (LETT |ii| (+ |ii| 1)
                                                       . #11#)))))))
                                      (LETT |i| (|inc_SI| |i|) . #11#)
                                      (GO G190) G191 (EXIT NIL)))
                                #4# (EXIT #4#))
                               (EXIT
                                (COND
                                 (|ok|
                                  (SEQ
                                   (LETT |mress|
                                         (SPADCALL |m|
                                                   (PROG1
                                                       (LETT #3# (- |ii| 1)
                                                             . #11#)
                                                     (|check_subtype|
                                                      (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      #3#))
                                                   (|spadConstant| $ 109)
                                                   (QREFELT $ 136))
                                         . #11#)
                                   (SEQ (LETT |i| 1 . #11#)
                                        (LETT #2# (- |ii| 1) . #11#) G190
                                        (COND
                                         ((|greater_SI| |i| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |l| 1 . #11#) G190
                                               (COND
                                                ((|greater_SI| |l| |m|)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |mress| |l| |i|
                                                           (SPADCALL
                                                            (SPADCALL |resv|
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 158))
                                                            |l| (QREFELT $ 32))
                                                           (QREFELT $ 138))))
                                               (LETT |l| (|inc_SI| |l|) . #11#)
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |i| (|inc_SI| |i|) . #11#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (PROGN
                                     (LETT #1# (CONS 0 |mress|) . #11#)
                                     (GO #1#)))))
                                 ('T
                                  (SEQ
                                   (SPADCALL "check_sol_poly rejected solution"
                                             (QREFELT $ 83))
                                   (SPADCALL (SPADCALL |resvi| (QREFELT $ 159))
                                             (QREFELT $ 83))
                                   (EXIT (|error| "giving up")))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;HP_solve_M;LLSINniMMU;21|
       (|list| |degs| |kind| |prime| |sigma| |gen| |check| $)
  (PROG (#1=#:G489 |l| #2=#:G495 |i| |mress| #3=#:G484 |ii| |sol_okp| |s|
         |bmij| |mm| |j| |resvi| |resv| |nsols| |va| |bm| |rblr| |blr| |gv|
         |gv0| #4=#:G494 |li| #5=#:G493 |pts| #6=#:G467 #7=#:G492 |pts0| |ve|
         #8=#:G491 |d| #9=#:G490 |m| |lp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lp| NIL . #10=(|MODHP;HP_solve_M;LLSINniMMU;21|))
            (COND
             ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
              (EXIT (CONS 1 'T))))
            (LETT |m| (LENGTH |degs|) . #10#)
            (LETT |ve|
                  (SPADCALL
                   (PROGN
                    (LETT #9# NIL . #10#)
                    (SEQ (LETT |d| NIL . #10#) (LETT #8# |degs| . #10#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |d| (CAR #8#) . #10#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #9# (CONS |d| #9#) . #10#)))
                         (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                         (EXIT (NREVERSE #9#))))
                   (QREFELT $ 66))
                  . #10#)
            (LETT |pts|
                  (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                        (#11='T
                         (SEQ
                          (EXIT
                           (COND
                            ((EQUAL |kind| '|shiftHP|)
                             (PROGN
                              (LETT #6#
                                    (SEQ
                                     (LETT |pts0| (GETREFV_U32 |sigma| 0)
                                           . #10#)
                                     (SEQ (LETT |i| 0 . #10#)
                                          (LETT #7# (- |sigma| 1) . #10#) G190
                                          (COND
                                           ((|greater_SI| |i| #7#) (GO G191)))
                                          (SEQ
                                           (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                          (LETT |i| (|inc_SI| |i|) . #10#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT |pts0|))
                                    . #10#)
                              (GO #6#)))))
                          #6# (EXIT #6#))))
                  . #10#)
            (LETT |gv0|
                  (PROGN
                   (LETT #5# NIL . #10#)
                   (SEQ (LETT |li| NIL . #10#) (LETT #4# |list| . #10#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |li| (CAR #4#) . #10#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5# (CONS (SPADCALL |li| (QREFELT $ 163)) #5#)
                                . #10#)))
                        (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  . #10#)
            (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|) . #10#)
            (LETT |blr|
                  (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                            (QREFELT $ 75))
                  . #10#)
            (EXIT
             (COND
              ((QEQCAR |blr| 1)
               (PROGN (LETT #1# (CONS 1 'NIL) . #10#) (GO #1#)))
              (#11#
               (SEQ (LETT |rblr| (QCDR |blr|) . #10#)
                    (LETT |bm| (QVELT |rblr| 0) . #10#)
                    (LETT |va| (QVELT |rblr| 1) . #10#)
                    (LETT |nsols| (QVSIZE |va|) . #10#)
                    (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)) . #10#)
                    (LETT |ii| 1 . #10#)
                    (SEQ (LETT |i| 1 . #10#) G190
                         (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                         (SEQ
                          (LETT |resvi| (MAKEARR1 |m| (|spadConstant| $ 91))
                                . #10#)
                          (SEQ (LETT |j| 1 . #10#) G190
                               (COND ((|greater_SI| |j| |m|) (GO G191)))
                               (SEQ
                                (LETT |mm| (SPADCALL |ve| |j| (QREFELT $ 76))
                                      . #10#)
                                (LETT |bmij|
                                      (SPADCALL |bm| |i| |j| (QREFELT $ 86))
                                      . #10#)
                                (LETT |s| (|spadConstant| $ 91) . #10#)
                                (SEQ (LETT |l| 0 . #10#) G190
                                     (COND ((|greater_SI| |l| |mm|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |s|
                                             (SPADCALL |s|
                                                       (SPADCALL
                                                        (ELT_U32 |bmij| |l|)
                                                        |l| (QREFELT $ 92))
                                                       (QREFELT $ 93))
                                             . #10#)))
                                     (LETT |l| (|inc_SI| |l|) . #10#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (SPADCALL |resvi| |j| |s| (QREFELT $ 94))))
                               (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |sol_okp|
                                (SPADCALL (SPADCALL |resvi| (QREFELT $ 96))
                                          |check|)
                                . #10#)
                          (EXIT
                           (COND ((QEQCAR |sol_okp| 1) "iterate")
                                 ((QEQCAR |sol_okp| 2)
                                  (|error|
                                   "HP_solve_M: check should never return no_solution for finite fields"))
                                 ('T
                                  (SEQ
                                   (SPADCALL |resv| |ii| |resvi|
                                             (QREFELT $ 98))
                                   (EXIT (LETT |ii| (+ |ii| 1) . #10#)))))))
                         (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |mress|
                          (SPADCALL |m|
                                    (PROG1 (LETT #3# (- |ii| 1) . #10#)
                                      (|check_subtype| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                    (|spadConstant| $ 91) (QREFELT $ 100))
                          . #10#)
                    (SEQ (LETT |i| 1 . #10#) (LETT #2# (- |ii| 1) . #10#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| 1 . #10#) G190
                                (COND ((|greater_SI| |l| |m|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |mress| |l| |i|
                                            (SPADCALL
                                             (SPADCALL |resv| |i|
                                                       (QREFELT $ 101))
                                             |l| (QREFELT $ 16))
                                            (QREFELT $ 102))))
                                (LETT |l| (|inc_SI| |l|) . #10#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS 0 |mress|) . #10#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHP;HP_solve_A;LLSNniMMU;22|
       (|list| |degs| |kind| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHP;HP_solve_PA;LL2SNniMMU;23|
       (|list| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |ModularHermitePade| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G513)
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
                         (LIST (CONS NIL (CONS 1 (|ModularHermitePade;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ModularHermitePade|))))))))))) 

(DEFUN |ModularHermitePade;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ModularHermitePade|) . #1=(|ModularHermitePade|))
      (LETT $ (GETREFV 174) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ModularHermitePade| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

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
              (104 . |denom|) (|List| 143) |MODHP;LLFPI_to_LPA;LILLIU;6|
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
              (|Union| 119 '"failed") (234 . |reconstruct|) (240 . |Zero|)
              (244 . |monomial|) (250 . +) (256 . |setelt|) (|List| 7)
              (263 . |entries|) (|Vector| 15) (268 . |setelt|) (|Matrix| 7)
              (275 . |new|) (282 . |elt|) (288 . |setelt|) (|Union| 99 9)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 104 95)
              |MODHP;HP_solve_I;LLSNniMMU;11| (296 . |variables|)
              (301 . |setUnion|) (307 . |Zero|) (311 . |monomial|) (317 . +)
              (323 . |Zero|) (327 . |coerce|) (332 . |One|) (336 . |monomial|)
              (343 . *) (349 . +) (|SortedExponentVector|)
              (|PrimitiveArray| 11) |MODHP;unpack_poly;LSevPa2ISup;13|
              (355 . |coerce|) (|SparseUnivariatePolynomial| 44)
              (|Mapping| 44 24) (|SparseUnivariatePolynomialFunctions2| 24 44)
              (360 . |map|) (366 . |zero?|) (371 . |degree|)
              (376 . |leadingCoefficient|) (381 . |reductum|) (386 . |retract|)
              (391 . |monomial|) (397 . +) (403 . |ncols|) (408 . |Zero|)
              (|Matrix| 21) (412 . |new|) (419 . |elt|) (426 . |setelt|)
              (434 . |member?|) (440 . |sort|) |MODHP;get_variables;L2SL;19|
              (445 . |One|) (|List| 44) (|PrimitiveArray| 44)
              (449 . |construct|)
              (|Record| (|:| |defects| 65) (|:| |cinds| 65) (|:| |rowlen| 11)
                        (|:| |offsetdata| 65) (|:| |expdata| 118)
                        (|:| |coeffdata| 119))
              (|Union| 146 '"no_solution") (|List| 144)
              (454 . |do_poly_integer|) (466 . |One|) (470 . |One|) (474 . <=)
              (480 . |setelt|) (|List| 21) (487 . |entries|) (|Vector| 31)
              (492 . |setelt|) (499 . |elt|) (505 . |coerce|) (|Union| 135 9)
              (|Mapping| 104 154) |MODHP;HP_solve_P;LL2SNniMMU;20|
              (510 . |construct|) (|List| 27) |MODHP;HP_solve_M;LLSINniMMU;21|
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
           '#(|unpack_poly| 515 |get_variables| 524 |check_sol1a| 531
              |VSUPPI_to_VPA| 541 |VSUPI_to_VPA| 549 |LLFPI_to_LPA| 555
              |LLFI_to_LPA| 564 |HP_solve_PA| 571 |HP_solve_P| 582 |HP_solve_M|
              593 |HP_solve_I| 604 |HP_solve_A| 614)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 173
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
                                                   0 96 3 97 15 0 11 15 98 3 99
                                                   0 6 6 7 100 2 97 15 0 11 101
                                                   4 99 7 0 11 11 7 102 1 24 26
                                                   0 107 2 26 0 0 0 108 0 21 0
                                                   109 2 21 0 24 6 110 2 21 0 0
                                                   0 111 0 24 0 112 1 24 0 11
                                                   113 0 24 0 114 3 24 0 0 74 6
                                                   115 2 24 0 0 0 116 2 24 0 0
                                                   0 117 1 44 0 24 121 2 124
                                                   122 123 21 125 1 122 9 0 126
                                                   1 122 6 0 127 1 122 44 0 128
                                                   1 122 0 0 129 1 44 34 0 130
                                                   2 50 0 34 6 131 2 50 0 0 0
                                                   132 1 99 6 0 133 0 122 0 134
                                                   3 135 0 6 6 21 136 3 99 7 0
                                                   11 11 137 4 135 21 0 11 11
                                                   21 138 2 26 9 74 0 139 1 26
                                                   0 0 140 0 122 0 142 1 144 0
                                                   143 145 8 28 147 26 148 65 6
                                                   17 74 74 60 149 0 21 0 150 0
                                                   44 0 151 2 11 9 0 0 152 3 31
                                                   21 0 11 21 153 1 31 154 0
                                                   155 3 156 31 0 11 31 157 2
                                                   156 31 0 11 158 1 31 81 0
                                                   159 1 17 0 27 163 5 0 21 26
                                                   118 119 11 11 120 3 0 26 47
                                                   74 74 141 6 0 17 18 59 60 11
                                                   11 11 61 4 0 18 31 26 27 11
                                                   33 2 0 18 15 11 20 5 0 41 47
                                                   11 26 27 11 48 3 0 41 42 11
                                                   11 43 7 0 170 171 27 74 74 6
                                                   60 172 173 7 0 160 47 27 74
                                                   74 6 60 161 162 7 0 103 164
                                                   27 74 11 6 60 105 165 6 0
                                                   103 42 27 74 6 60 105 106 6
                                                   0 166 167 27 74 6 60 168
                                                   169)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularHermitePade| 'NILADIC T) 
