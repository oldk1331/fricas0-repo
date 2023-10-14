
(SDEFUN |IMODHP;eval1a|
        ((|pol| |Polynomial| (|Integer|)) (|pt| |Integer|)
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| #1=(|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|)) (|:| |eval1coeffbuf| #2=(|U32Vector|))
          (|:| |eval1expbuf| #3=(|SortedExponentVector|)))
         ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (|pk| (|Integer|)) (|ptk| (|Integer|))
          (|ki| (|Integer|)) (|j| NIL) (|i| (|SingleInteger|))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (|n| (|NonNegativeInteger|)) (|exps| #3#)
          (|nexps| (|SortedExponentVector|)) (|coeffs| #2#)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (#4=#:G160 NIL) (|t0| NIL) (|ns| (|SingleInteger|))
          (|polu|
           #5=(|List|
               (|Record| (|:| |k| (|NonNegativeInteger|))
                         (|:| |c| (|Polynomial| (|Integer|))))))
          (#6=#:G159 NIL)
          (|polr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|)) (|:| |ts| #5#))))
          (|p| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 5) . #7=(|IMODHP;eval1a|))
                (LETT |polr| |pol| . #7#)
                (EXIT
                 (COND
                  ((QEQCAR |polr| 0)
                   (PROGN (LETT #6# (QCDR |polr|) . #7#) (GO #8=#:G158)))
                  ('T
                   (SEQ (LETT |polu| (QCDR (QCDR |polr|)) . #7#)
                        (LETT |i| 0 . #7#)
                        (LETT |coeffs| (QVELT |pss| 11) . #7#)
                        (LETT |exps| (QVELT |pss| 12) . #7#)
                        (LETT |n| (QV_LEN_U32 |coeffs|) . #7#)
                        (LETT |ns| |n| . #7#)
                        (SEQ (LETT |t0| NIL . #7#) (LETT #4# |polu| . #7#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |t0| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((>= |i| |n|)
                                (SEQ
                                 (LETT |nn| (SPADCALL 2 |n| (QREFELT $ 8))
                                       . #7#)
                                 (LETT |ncoeffs| (GETREFV_U32 |nn| 0) . #7#)
                                 (SPADCALL |ncoeffs| |coeffs| |n|
                                           (QREFELT $ 13))
                                 (LETT |coeffs| |ncoeffs| . #7#)
                                 (QSETVELT |pss| 11 |coeffs|)
                                 (LETT |nexps| (GETREFV_U32 |nn| 0) . #7#)
                                 (SPADCALL |nexps| |exps| |n| (QREFELT $ 13))
                                 (LETT |exps| |nexps| . #7#)
                                 (QSETVELT |pss| 12 |exps|)
                                 (EXIT (LETT |n| |nn| . #7#)))))
                              (LETT |t1| (QCDR |t0|) . #7#)
                              (SETELT_U32 |exps| |i| (QCAR |t0|))
                              (COND
                               ((QEQCAR |t1| 0)
                                (SETELT_U32 |coeffs| |i| (QCDR |t1|)))
                               ('T
                                (|error| "More than one variable in eval1a")))
                              (EXIT (LETT |i| (|add_SI| |i| 1) . #7#)))
                             (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |res| 0 . #7#) (LETT |ptk| 1 . #7#)
                        (LETT |pk| 0 . #7#)
                        (SEQ (LETT |j| (|sub_SI| |i| 1) . #7#) G190
                             (COND ((< |j| 0) (GO G191)))
                             (SEQ (LETT |ki| (ELT_U32 |exps| |j|) . #7#)
                                  (SEQ G190
                                       (COND ((NULL (< |pk| |ki|)) (GO G191)))
                                       (SEQ
                                        (LETT |ptk| (QSMULMOD32 |ptk| |pt| |p|)
                                              . #7#)
                                        (EXIT (LETT |pk| (+ |pk| 1) . #7#)))
                                       NIL (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |res|
                                         (QSMULADDMOD64-32 |ptk|
                                                           (ELT_U32 |coeffs|
                                                                    |j|)
                                                           |res| |p|)
                                         . #7#)))
                             (LETT |j| (+ |j| -1) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|)))))))
          #8# (EXIT #6#)))) 

(SDEFUN |IMODHP;eval1s|
        ((|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pt| |Integer|) (|var| |Symbol|)
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| #1=(|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#2=#:G172 NIL) (|dm| #3=(|Integer|))
          (|nm| #3#) (|nlcq| (|Fraction| (|Polynomial| (|Integer|))))
          (#4=#:G174 NIL) (|j| NIL) (|ress| (|U32Vector|))
          (|n| (|NonNegativeInteger|)) (#5=#:G173 NIL) (|gv0| NIL) (|p| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 5) . #6=(|IMODHP;eval1s|))
                (LETT |resl| NIL . #6#)
                (SEQ (LETT |gv0| NIL . #6#) (LETT #5# |gvl| . #6#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |gv0| (CAR #5#) . #6#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #6#)
                          (LETT |ress| (GETREFV_U32 |n| 0) . #6#)
                          (SEQ (LETT |j| 0 . #6#) (LETT #4# (- |n| 1) . #6#)
                               G190 (COND ((|greater_SI| |j| #4#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #6#)
                                    (LETT |nm|
                                          (|IMODHP;eval1a|
                                           (SPADCALL |nlcq| (QREFELT $ 16))
                                           |pt| |pss| $)
                                          . #6#)
                                    (LETT |dm|
                                          (|IMODHP;eval1a|
                                           (SPADCALL |nlcq| (QREFELT $ 17))
                                           |pt| |pss| $)
                                          . #6#)
                                    (EXIT
                                     (COND
                                      ((EQL |dm| 0)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #6#)
                                        (GO #7=#:G171)))
                                      ('T
                                       (SEQ (LETT |dms| |dm| . #6#)
                                            (LETT |nlc|
                                                  (QSMULMOD32 |nm|
                                                              (SPADCALL |dms|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 19))
                                                              |p|)
                                                  . #6#)
                                            (EXIT
                                             (SETELT_U32 |ress| |j|
                                                         |nlc|)))))))
                               (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #6#)))
                     (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #7# (EXIT #2#)))) 

(SDEFUN |IMODHP;modpreduction;PIP;3|
        ((|x| |Polynomial| (|Integer|)) (|p| |Integer|)
         ($ |Polynomial| (|Integer|)))
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
          (|c1| (|Polynomial| (|Integer|))) (|c0| (|Integer|))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#1=#:G193 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vx| (|Symbol|)))
         (SEQ (LETT |xr| |x| . #2=(|IMODHP;modpreduction;PIP;3|))
              (EXIT
               (COND
                ((QEQCAR |xr| 0)
                 (SEQ
                  (LETT |c0| (SPADCALL (QCDR |xr|) |p| (QREFELT $ 20)) . #2#)
                  (LETT |xr| (CONS 0 |c0|) . #2#) (EXIT (SETF |xr| |xr|))))
                (#3='T
                 (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #2#)
                      (LETT |xu| (QCDR (QCDR |xr|)) . #2#)
                      (LETT |yu| NIL . #2#)
                      (SEQ (LETT |t0| NIL . #2#) (LETT #1# |xu| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t0| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ (LETT |t1| (QCDR |t0|) . #2#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |t1| 0)
                                   (SEQ
                                    (LETT |c0|
                                          (SPADCALL (QCDR |t1|) |p|
                                                    (QREFELT $ 20))
                                          . #2#)
                                    (EXIT
                                     (COND ((EQL |c0| 0) 0)
                                           ('T
                                            (SEQ
                                             (LETT |xr| (CONS 0 |c0|) . #2#)
                                             (EXIT
                                              (LETT |yu|
                                                    (CONS
                                                     (CONS (QCAR |t0|)
                                                           (SETF |xr| |xr|))
                                                     |yu|)
                                                    . #2#))))))))
                                  ('T
                                   (SEQ
                                    (LETT |c1|
                                          (SPADCALL (QCDR |t0|) |p|
                                                    (QREFELT $ 22))
                                          . #2#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |c1| (|spadConstant| $ 21)
                                                 (QREFELT $ 24))
                                       0)
                                      ('T
                                       (LETT |yu|
                                             (CONS (CONS (QCAR |t0|) |c1|)
                                                   |yu|)
                                             . #2#)))))))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |xr|
                            (COND
                             ((SPADCALL |yu| NIL (QREFELT $ 27)) (CONS 0 0))
                             (#3# (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                            . #2#)
                      (EXIT (SETF |xr| |xr|))))))))) 

(SDEFUN |IMODHP;modpeval;PLL2I;4|
        ((|x| |Polynomial| (|Integer|)) (|vars| |List| (|Symbol|))
         (|pts| |List| (|Integer|)) (|p| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| #1=(|Integer|)) (|c0| (|Integer|)) (|kk| #1#)
          (|ptk| (|Integer|)) (|kk1| (|NonNegativeInteger|))
          (|t1|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|)))))))))
          (#2=#:G208 NIL) (|t0| NIL)
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c| (|Polynomial| (|Integer|))))))
          (|vxval| (|Integer|)) (#3=#:G207 NIL) (|vx| (|Symbol|))
          (|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|Polynomial|
                                                    (|Integer|))))))))))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |x| . #4=(|IMODHP;modpeval;PLL2I;4|))
                (EXIT
                 (COND
                  ((QEQCAR |xr| 0)
                   (PROGN
                    (LETT #3# (SPADCALL (QCDR |xr|) |p| (QREFELT $ 20)) . #4#)
                    (GO #5=#:G206)))
                  (#6='T
                   (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |vx| (|SPADfirst| |vars|) (QREFELT $ 29))
                           (PROGN
                            (LETT #3#
                                  (SPADCALL |x| (CDR |vars|) (CDR |pts|) |p|
                                            (QREFELT $ 32))
                                  . #4#)
                            (GO #5#)))
                          (#6#
                           (SEQ (LETT |vxval| (|SPADfirst| |pts|) . #4#)
                                (LETT |vars| (CDR |vars|) . #4#)
                                (LETT |pts| (CDR |pts|) . #4#)
                                (LETT |xu| (QCDR (QCDR |xr|)) . #4#)
                                (LETT |yu| NIL . #4#) (LETT |ptk| 1 . #4#)
                                (LETT |kk| 0 . #4#) (LETT |res| 0 . #4#)
                                (LETT |xu| (REVERSE |xu|) . #4#)
                                (SEQ (LETT |t0| NIL . #4#)
                                     (LETT #2# |xu| . #4#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |t0| (CAR #2#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ (LETT |t1| (QCDR |t0|) . #4#)
                                          (LETT |kk1| (QCAR |t0|) . #4#)
                                          (SEQ G190
                                               (COND
                                                ((NULL (< |kk| |kk1|))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |ptk|
                                                      (QSMULMOD32 |vxval| |ptk|
                                                                  |p|)
                                                      . #4#)
                                                (EXIT
                                                 (LETT |kk| (+ |kk| 1) . #4#)))
                                               NIL (GO G190) G191 (EXIT NIL))
                                          (LETT |c0|
                                                (COND
                                                 ((QEQCAR |t1| 0)
                                                  (SPADCALL (QCDR |t1|) |p|
                                                            (QREFELT $ 20)))
                                                 ('T
                                                  (SPADCALL (QCDR |t0|) |vars|
                                                            |pts| |p|
                                                            (QREFELT $ 32))))
                                                . #4#)
                                          (EXIT
                                           (LETT |res|
                                                 (QSMULADDMOD64-32 |ptk| |c0|
                                                                   |res| |p|)
                                                 . #4#)))
                                     (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |res|)))))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |IMODHP;eval2s|
        ((|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pt| . #1=(|Integer|)) (|var| . #2=(|Symbol|)) (|p| |Integer|)
         ($ |Union|
          (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
          "failed"))
        (SPROG
         ((|resl|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (#3=#:G218 NIL) (|dm| #4=(|Polynomial| (|Integer|))) (|nm| #4#)
          (|dmp| #5=(|Polynomial| (|Integer|))) (|nmp| #5#)
          (|nlcq| (|Fraction| (|Polynomial| (|Integer|)))) (#6=#:G220 NIL)
          (|j| NIL) (|pts| (|List| #1#)) (|vars| (|List| #2#))
          (|ress| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
          (|n| (|NonNegativeInteger|)) (#7=#:G219 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #8=(|IMODHP;eval2s|))
                (SEQ (LETT |gv0| NIL . #8#) (LETT #7# |gvl| . #8#) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |gv0| (CAR #7#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #8#)
                          (LETT |ress| (MAKEARR1 |n| (|spadConstant| $ 33))
                                . #8#)
                          (LETT |vars| (LIST |var|) . #8#)
                          (LETT |pts| (LIST |pt|) . #8#)
                          (SEQ (LETT |j| 0 . #8#) (LETT #6# (- |n| 1) . #8#)
                               G190 (COND ((|greater_SI| |j| #6#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #8#)
                                    (LETT |nmp|
                                          (SPADCALL
                                           (SPADCALL |nlcq| (QREFELT $ 16))
                                           |vars| |pts| (QREFELT $ 34))
                                          . #8#)
                                    (LETT |dmp|
                                          (SPADCALL
                                           (SPADCALL |nlcq| (QREFELT $ 17))
                                           |vars| |pts| (QREFELT $ 34))
                                          . #8#)
                                    (LETT |nm|
                                          (SPADCALL |nmp| |p| (QREFELT $ 22))
                                          . #8#)
                                    (LETT |dm|
                                          (SPADCALL |dmp| |p| (QREFELT $ 22))
                                          . #8#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |dm| (|spadConstant| $ 21)
                                                 (QREFELT $ 24))
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed") . #8#)
                                        (GO #9=#:G217)))
                                      ('T
                                       (QSETAREF1 |ress| |j|
                                                  (SPADCALL |nm| |dm|
                                                            (QREFELT $
                                                                     35)))))))
                               (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #8#)))
                     (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #9# (EXIT #3#)))) 

(SDEFUN |IMODHP;eval3s|
        ((|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|p| |Integer|)
         ($ |Union|
          (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
          "failed"))
        (SPROG
         ((|resl|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (#1=#:G227 NIL) (|dm| #2=(|Polynomial| (|Integer|))) (|nm| #2#)
          (|dmp| (|Polynomial| (|Integer|))) (|nmp| (|Polynomial| (|Integer|)))
          (|nlcq| (|Fraction| (|Polynomial| (|Integer|)))) (#3=#:G229 NIL)
          (|j| NIL)
          (|ress| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
          (|n| (|NonNegativeInteger|)) (#4=#:G228 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #5=(|IMODHP;eval3s|))
                (SEQ (LETT |gv0| NIL . #5#) (LETT #4# |gvl| . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |gv0| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #5#)
                          (LETT |ress| (MAKEARR1 |n| (|spadConstant| $ 33))
                                . #5#)
                          (SEQ (LETT |j| 0 . #5#) (LETT #3# (- |n| 1) . #5#)
                               G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #5#)
                                    (LETT |nmp|
                                          (SPADCALL |nlcq| (QREFELT $ 16))
                                          . #5#)
                                    (LETT |dmp|
                                          (SPADCALL |nlcq| (QREFELT $ 17))
                                          . #5#)
                                    (LETT |nm|
                                          (SPADCALL |nmp| |p| (QREFELT $ 22))
                                          . #5#)
                                    (LETT |dm|
                                          (SPADCALL |dmp| |p| (QREFELT $ 22))
                                          . #5#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |dm| (|spadConstant| $ 21)
                                                 (QREFELT $ 24))
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #5#)
                                        (GO #6=#:G226)))
                                      ('T
                                       (QSETAREF1 |ress| |j|
                                                  (SPADCALL |nm| |dm|
                                                            (QREFELT $
                                                                     35)))))))
                               (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #5#)))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #1#)))) 

(SDEFUN |IMODHP;do_modular_solve0|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|) ($ |List| (|Any|)))
        (COND
         ((OR (EQUAL |kind| '|diffHP|) (EQUAL |kind| '|qdiffHP|))
          (SPADCALL |gv| |ve| |sigma| |prime| (QREFELT $ 40)))
         ((OR (EQUAL |kind| '|shiftHP|)
              (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
          (SPADCALL |gv| |ve| |pts| |prime| (QREFELT $ 41)))
         ('T
          (|error|
           "kind must be diffHP, qdiffHP, shiftHP, qshiftHP or qmixed")))) 

(SDEFUN |IMODHP;do_modular_solve;VVNniUvISU;8|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|)
         ($ |Union|
          (|Record| (|:| |basis| #1=(|TwoDimensionalArray| (|U32Vector|)))
                    (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#2=#:G267 NIL) (|j| (|PositiveInteger|)) (#3=#:G266 NIL) (|i| NIL)
          (|cindk| (|Integer|)) (|k| NIL)
          (|nbas| (|TwoDimensionalArray| (|U32Vector|)))
          (|nr| (|NonNegativeInteger|)) (|bas| #1#)
          (|res|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|bm| (|Vector| (|U32Vector|))) (|dbm| #4=(|Any|)) (|ok| (|Boolean|))
          (|m2| #5=(|NonNegativeInteger|)) (|va| (|Vector| (|Integer|)))
          (|dva| #4#) (|blr| (|List| (|Any|))) (|nve| (|Vector| (|Integer|)))
          (|ngv| (|Vector| (|U32Vector|))) (|m1| (|NonNegativeInteger|))
          (|m0| #5#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m0| (QVSIZE |ve|)
                  . #6=(|IMODHP;do_modular_solve;VVNniUvISU;8|))
            (LETT |m1| 0 . #6#)
            (SEQ (LETT |i| 1 . #6#) G190
                 (COND ((|greater_SI| |i| |m0|) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((>= (SPADCALL |ve| |i| (QREFELT $ 42)) 0)
                     (LETT |m1| (+ |m1| 1) . #6#)))))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (COND
             ((< |m1| |m0|)
              (SEQ (LETT |ngv| (MAKEARR1 |m1| (GETREFV_U32 0 0)) . #6#)
                   (LETT |nve| (MAKEARR1 |m1| 0) . #6#) (LETT |j| 1 . #6#)
                   (EXIT
                    (SEQ (LETT |i| 1 . #6#) G190
                         (COND ((|greater_SI| |i| |m0|) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((>= (SPADCALL |ve| |i| (QREFELT $ 42)) 0)
                             (SEQ
                              (SPADCALL |ngv| |j|
                                        (SPADCALL |gv| |i| (QREFELT $ 43))
                                        (QREFELT $ 44))
                              (SPADCALL |nve| |j|
                                        (SPADCALL |ve| |i| (QREFELT $ 42))
                                        (QREFELT $ 45))
                              (EXIT (LETT |j| (+ |j| 1) . #6#)))))))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL)))))
             (#7='T
              (SEQ (LETT |ngv| |gv| . #6#) (EXIT (LETT |nve| |ve| . #6#)))))
            (LETT |blr|
                  (|IMODHP;do_modular_solve0| |ngv| |nve| |sigma| |pts| |prime|
                   |kind| $)
                  . #6#)
            (LETT |dva| (SPADCALL |blr| 3 (QREFELT $ 47)) . #6#)
            (LETT |va| (SPADCALL |dva| (QREFELT $ 49)) . #6#)
            (LETT |ok| 'NIL . #6#) (LETT |m2| (QVSIZE |va|) . #6#)
            (SEQ (LETT |i| 1 . #6#) G190
                 (COND ((|greater_SI| |i| |m2|) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |ok|
                         (COND (|ok| 'T)
                               ('T (>= (SPADCALL |va| |i| (QREFELT $ 42)) 0)))
                         . #6#)))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              (|ok|
               (SEQ (LETT |dbm| (SPADCALL |blr| 1 (QREFELT $ 47)) . #6#)
                    (LETT |bm| (SPADCALL |dbm| (QREFELT $ 51)) . #6#)
                    (LETT |res|
                          (SPADCALL |bm| |nve| |va| |prime| (QREFELT $ 53))
                          . #6#)
                    (COND
                     ((< |m1| |m0|)
                      (SEQ (LETT |bas| (QVELT |res| 0) . #6#)
                           (LETT |nr| (ANROWS |bas|) . #6#)
                           (LETT |nbas|
                                 (MAKE_MATRIX1 |nr| |m0| (GETREFV_U32 0 0))
                                 . #6#)
                           (LETT |j| 1 . #6#)
                           (SEQ (LETT |i| 1 . #6#) G190
                                (COND ((|greater_SI| |i| |m0|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((>= (SPADCALL |ve| |i| (QREFELT $ 42)) 0)
                                    (SEQ
                                     (SEQ (LETT |k| 1 . #6#) G190
                                          (COND
                                           ((|greater_SI| |k| |nr|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (QSETAREF2O |nbas| |k| |i|
                                                        (QAREF2O |bas| |k| |j|
                                                                 1 1)
                                                        1 1)))
                                          (LETT |k| (|inc_SI| |k|) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |j| (+ |j| 1) . #6#)))))))
                                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (QSETVELT |res| 0 |nbas|)
                           (EXIT
                            (SEQ (LETT |k| 1 . #6#) G190
                                 (COND ((|greater_SI| |k| |nr|) (GO G191)))
                                 (SEQ
                                  (LETT |cindk|
                                        (SPADCALL (QVELT |res| 2) |k|
                                                  (QREFELT $ 42))
                                        . #6#)
                                  (LETT |j| 1 . #6#)
                                  (EXIT
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1 . #6#) G190
                                          (COND
                                           ((|greater_SI| |i| |m0|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((>=
                                               (SPADCALL |ve| |i|
                                                         (QREFELT $ 42))
                                               0)
                                              (SEQ
                                               (COND
                                                ((EQL |j| |cindk|)
                                                 (SEQ
                                                  (SPADCALL (QVELT |res| 2) |k|
                                                            |i| (QREFELT $ 45))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #3# |$NoValue| . #6#)
                                                    (GO #8=#:G256))))))
                                               (EXIT
                                                (LETT |j| (+ |j| 1)
                                                      . #6#)))))))
                                          (LETT |i| (|inc_SI| |i|) . #6#)
                                          (GO G190) G191 (EXIT NIL)))
                                    #8# (EXIT #3#))))
                                 (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                                 (EXIT NIL))))))
                    (EXIT (CONS 0 |res|))))
              (#7#
               (PROGN
                (LETT #2# (CONS 1 "no_solution") . #6#)
                (GO #9=#:G265)))))))
          #9# (EXIT #2#)))) 

(SDEFUN |IMODHP;compute_blocks|
        ((|offsets| |Vector| (|Integer|)) (|rowlen| |Integer|)
         (|nsols| |Integer|) ($ |Vector| (|Integer|)))
        (SPROG ((|i| NIL) (|block_offsets| (|Vector| (|Integer|))))
               (SEQ
                (LETT |block_offsets| (MAKEARR1 |nsols| 0)
                      . #1=(|IMODHP;compute_blocks|))
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |block_offsets| |i|
                                 (SPADCALL |offsets|
                                           (+ (* (- |i| 1) |rowlen|) 1)
                                           (QREFELT $ 42))
                                 (QREFELT $ 45))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |block_offsets|)))) 

(SDEFUN |IMODHP;merge_exponents;IVSevVSevL;10|
        ((|nvars| |Integer|) (|offsets| |Vector| (|Integer|))
         (|exps| |SortedExponentVector|) (|noffsets| |Vector| (|Integer|))
         (|nexps| |SortedExponentVector|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|j0| (|Integer|)) (|i0| (|Integer|)) (|j| (|Integer|))
          (|i| (|Integer|)) (|ci| (|Integer|)) (#1=#:G296 NIL)
          (|j0i| (|Integer|)) (|ji| #2=(|Integer|)) (|jl| (|List| (|Integer|)))
          (|i0i| (|Integer|)) (|ii| #2#) (|il| (|List| (|Integer|))) (|k| NIL)
          (|lj| (|Integer|)) (|li| (|Integer|)) (#3=#:G297 NIL) (#4=#:G299 NIL)
          (|jj| NIL) (#5=#:G298 NIL) (|kk| (|Integer|)) (|nn| (|Integer|))
          (|oc| (|NonNegativeInteger|)) (|m| #6=(|Integer|)) (|n| #6#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (QUOTIENT2 (QV_LEN_U32 |exps|) |nvars|)
                  . #7=(|IMODHP;merge_exponents;IVSevVSevL;10|))
            (LETT |m| (QUOTIENT2 (QV_LEN_U32 |nexps|) |nvars|) . #7#)
            (LETT |oc| (QVSIZE |offsets|) . #7#) (LETT |i0| 0 . #7#)
            (LETT |j0| 0 . #7#) (LETT |ci| 0 . #7#) (LETT |i| 0 . #7#)
            (LETT |j| 0 . #7#) (LETT |li| 0 . #7#) (LETT |lj| 0 . #7#)
            (LETT |il| NIL . #7#) (LETT |jl| NIL . #7#) (LETT |kk| 1 . #7#)
            (LETT |nn| (- |nvars| 1) . #7#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |i0i| 1 . #7#) (LETT |j0i| 1 . #7#)
                       (LETT |ii| |nvars| . #7#) (LETT |ji| |nvars| . #7#)
                       (COND
                        ((OR (EQL |i0| |li|) (EQL |j0| |lj|))
                         (EXIT
                          (SEQ (LETT |kk| (+ |kk| 1) . #7#)
                               (COND
                                ((< |i0| |li|)
                                 (SEQ (LETT |jj| |i0| . #7#)
                                      (LETT #5# (- |li| 1) . #7#) G190
                                      (COND ((> |jj| #5#) (GO G191)))
                                      (SEQ (LETT |jl| (CONS |ci| |jl|) . #7#)
                                           (EXIT (LETT |ci| (+ |ci| 1) . #7#)))
                                      (LETT |jj| (+ |jj| 1) . #7#) (GO G190)
                                      G191 (EXIT NIL))))
                               (COND
                                ((< |j0| |lj|)
                                 (SEQ (LETT |jj| |j0| . #7#)
                                      (LETT #4# (- |lj| 1) . #7#) G190
                                      (COND ((> |jj| #4#) (GO G191)))
                                      (SEQ (LETT |il| (CONS |ci| |il|) . #7#)
                                           (EXIT (LETT |ci| (+ |ci| 1) . #7#)))
                                      (LETT |jj| (+ |jj| 1) . #7#) (GO G190)
                                      G191 (EXIT NIL))))
                               (EXIT
                                (COND
                                 ((EQL |li| |n|)
                                  (PROGN
                                   (LETT #3#
                                         (LIST (NREVERSE |il|) (NREVERSE |jl|))
                                         . #7#)
                                   (GO #8=#:G295)))
                                 ('T
                                  (SEQ (LETT |i0| |li| . #7#)
                                       (LETT |j0| |lj| . #7#)
                                       (LETT |i| (* |i0| |nvars|) . #7#)
                                       (LETT |j| (* |j0| |nvars|) . #7#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |kk| |oc| (QREFELT $ 56))
                                          (SEQ
                                           (LETT |li|
                                                 (SPADCALL |offsets| |kk|
                                                           (QREFELT $ 42))
                                                 . #7#)
                                           (EXIT
                                            (LETT |lj|
                                                  (SPADCALL |noffsets| |kk|
                                                            (QREFELT $ 42))
                                                  . #7#))))
                                         ('T
                                          (SEQ (LETT |li| |n| . #7#)
                                               (EXIT
                                                (LETT |lj| |m|
                                                      . #7#))))))))))))))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| 0 . #7#) G190
                              (COND ((|greater_SI| |k| |nn|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (ELT_U32 |exps| (+ |i| |k|))
                                            (ELT_U32 |nexps| (+ |j| |k|))
                                            (QREFELT $ 57))
                                  (PROGN
                                   (LETT #1#
                                         (COND
                                          ((SPADCALL
                                            (ELT_U32 |exps| (+ |i| |k|))
                                            (ELT_U32 |nexps| (+ |j| |k|))
                                            (QREFELT $ 58))
                                           (SEQ
                                            (LETT |il| (CONS |ci| |il|) . #7#)
                                            (LETT |ii| 0 . #7#)
                                            (LETT |i0i| 0 . #7#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #7#)
                                              (GO #9=#:G291)))))
                                          ('T
                                           (SEQ
                                            (LETT |jl| (CONS |ci| |jl|) . #7#)
                                            (LETT |ji| 0 . #7#)
                                            (LETT |j0i| 0 . #7#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #7#)
                                              (GO #9#))))))
                                         . #7#)
                                   (GO #9#))))))
                              (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                              (EXIT NIL)))
                        #9# (EXIT #1#))
                       (LETT |ci| (+ |ci| 1) . #7#)
                       (LETT |i| (+ |i| |ii|) . #7#)
                       (LETT |j| (+ |j| |ji|) . #7#)
                       (LETT |i0| (+ |i0| |i0i|) . #7#)
                       (EXIT (LETT |j0| (+ |j0| |j0i|) . #7#)))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #3#)))) 

(SDEFUN |IMODHP;merge2;I2LVSevVSevR;11|
        ((|nvars| |Integer|) (|odl| |List| (|Integer|))
         (|ndl| |List| (|Integer|)) (|ov1| |Vector| (|Integer|))
         (|exps1| |SortedExponentVector|) (|ov2| |Vector| (|Integer|))
         (|exps2| |SortedExponentVector|)
         ($ |Record| (|:| |offsetdata| (|Vector| (|Integer|)))
          (|:| |expdata| (|SortedExponentVector|))))
        (SPROG
         ((|i| (|Integer|)) (|ci| (|Integer|)) (|i00| (|Integer|))
          (|i0| (|Integer|)) (|j0| (|Integer|)) (|j| (|Integer|)) (|k| NIL)
          (|j00| (|Integer|)) (|lj| #1=(|Integer|)) (|li| #1#)
          (|kk| (|Integer|)) (#2=#:G323 NIL) (|ci0| (|Integer|))
          (|nv1| (|Integer|)) (|noffsets| (|Vector| (|Integer|)))
          (|m| (|NonNegativeInteger|)) (|nexps| (|SortedExponentVector|))
          (#3=#:G302 NIL) (|nn1| (|Integer|)) (|n1| (|Integer|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n0| (QV_LEN_U32 |exps1|)
                . #4=(|IMODHP;merge2;I2LVSevVSevR;11|))
          (LETT |nn| (LENGTH |odl|) . #4#)
          (LETT |n1| (+ (QUOTIENT2 |n0| |nvars|) |nn|) . #4#)
          (LETT |nn1| (* |n1| |nvars|) . #4#)
          (LETT |nexps|
                (GETREFV_U32
                 (PROG1 (LETT #3# |nn1| . #4#)
                   (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #3#))
                 0)
                . #4#)
          (LETT |m| (QVSIZE |ov2|) . #4#)
          (LETT |noffsets| (MAKEARR1 |m| 0) . #4#)
          (LETT |nv1| (- |nvars| 1) . #4#) (LETT |i0| 0 . #4#)
          (LETT |j0| 0 . #4#) (LETT |ci0| 0 . #4#) (LETT |i| 0 . #4#)
          (LETT |j| 0 . #4#) (LETT |ci| 0 . #4#)
          (LETT |j00| (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|)))
                . #4#)
          (LETT |i00| (|SPADfirst| |odl|) . #4#)
          (LETT |li| (SPADCALL |ov1| 1 (QREFELT $ 42)) . #4#)
          (LETT |lj| (SPADCALL |ov2| 1 (QREFELT $ 42)) . #4#)
          (LETT |kk| 1 . #4#)
          (SEQ (LETT |ci0| 0 . #4#) (LETT #2# (- |n1| 1) . #4#) G190
               (COND ((|greater_SI| |ci0| #2#) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((EQL |i0| |li|) (EQL |j0| |lj|)) ('T 'NIL)))
                       (GO G191)))
                     (SEQ (SPADCALL |noffsets| |kk| |ci0| (QREFELT $ 45))
                          (LETT |kk| (+ |kk| 1) . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL |kk| |m| (QREFELT $ 56))
                             (SEQ
                              (LETT |li| (SPADCALL |ov1| |kk| (QREFELT $ 42))
                                    . #4#)
                              (EXIT
                               (LETT |lj| (SPADCALL |ov2| |kk| (QREFELT $ 42))
                                     . #4#))))
                            ('T
                             (SEQ (LETT |li| |n1| . #4#)
                                  (EXIT (LETT |lj| |n1| . #4#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |ci0| |j00|)
                  (SEQ
                   (SEQ (LETT |k| 0 . #4#) G190
                        (COND ((|greater_SI| |k| |nv1|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |nexps| (+ |ci| |k|)
                                      (ELT_U32 |exps1| (+ |i| |k|)))))
                        (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |ndl| (CDR |ndl|) . #4#)
                   (EXIT
                    (LETT |j00|
                          (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|)))
                          . #4#))))
                 ('T
                  (SEQ
                   (SEQ (LETT |k| 0 . #4#) G190
                        (COND ((|greater_SI| |k| |nv1|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |nexps| (+ |ci| |k|)
                                      (ELT_U32 |exps2| (+ |j| |k|)))))
                        (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                        (EXIT NIL))
                   (LETT |j| (+ |j| |nvars|) . #4#)
                   (EXIT (LETT |j0| (+ |j0| 1) . #4#)))))
                (COND
                 ((SPADCALL |ci0| |i00| (QREFELT $ 57))
                  (SEQ (LETT |i| (+ |i| |nvars|) . #4#)
                       (EXIT (LETT |i0| (+ |i0| 1) . #4#))))
                 ('T
                  (SEQ (LETT |odl| (CDR |odl|) . #4#)
                       (EXIT
                        (LETT |i00|
                              (COND ((NULL |odl|) |n1|)
                                    ('T (|SPADfirst| |odl|)))
                              . #4#)))))
                (EXIT (LETT |ci| (+ |ci| |nvars|) . #4#)))
               (LETT |ci0| (|inc_SI| |ci0|) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| |kk| . #4#) G190 (COND ((> |i| |m|) (GO G191)))
               (SEQ (EXIT (SPADCALL |noffsets| |i| |n1| (QREFELT $ 45))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |noffsets| |nexps|))))) 

(SDEFUN |IMODHP;check_defects|
        ((|va| |Vector| (|Integer|)) (|civ| |Vector| (|Integer|))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| #1=(|Vector| (|Integer|)))
          (|:| |oldciv| #2=(|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| #3=(|Integer|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union| "OK" "failed" "all_bad"))
        (SPROG
         ((#4=#:G343 NIL) (#5=#:G342 NIL) (|is_bad| (|Boolean|))
          (|all_bad| (|Boolean|)) (|i| NIL) (|ociv| #2#) (|ova| #1#)
          (|nsols| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |nsols| (QVELT |pss| 10) . #6=(|IMODHP;check_defects|))
                (LETT |is_bad| (SPADCALL (QVSIZE |va|) |nsols| (QREFELT $ 58))
                      . #6#)
                (LETT |all_bad| (< (QVSIZE |va|) |nsols|) . #6#)
                (COND
                 ((EQL (QVSIZE |va|) |nsols|)
                  (SEQ (LETT |ova| (QVELT |pss| 7) . #6#)
                       (LETT |ociv| (QVELT |pss| 8) . #6#)
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ (LETT |i| 1 . #6#) G190
                               (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((< (SPADCALL |va| |i| (QREFELT $ 42))
                                      (SPADCALL |ova| |i| (QREFELT $ 42)))
                                   (SEQ (LETT |all_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7=#:G337)))))
                                  ((SPADCALL (SPADCALL |va| |i| (QREFELT $ 42))
                                             (SPADCALL |ova| |i|
                                                       (QREFELT $ 42))
                                             (QREFELT $ 58))
                                   (SEQ (LETT |is_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7#)))))
                                  ((< (SPADCALL |civ| |i| (QREFELT $ 42))
                                      (SPADCALL |ociv| |i| (QREFELT $ 42)))
                                   (SEQ (LETT |all_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7#)))))
                                  ((SPADCALL
                                    (SPADCALL |civ| |i| (QREFELT $ 42))
                                    (SPADCALL |ociv| |i| (QREFELT $ 42))
                                    (QREFELT $ 58))
                                   (SEQ (LETT |is_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7#))))))))
                               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #5#))))))
                (EXIT
                 (COND
                  (|is_bad|
                   (PROGN (LETT #4# (CONS 1 "failed") . #6#) (GO #8=#:G341)))
                  (|all_bad|
                   (PROGN (LETT #4# (CONS 2 "all_bad") . #6#) (GO #8#)))
                  ('T (PROGN (LETT #4# (CONS 0 "OK") . #6#) (GO #8#)))))))
          #8# (EXIT #4#)))) 

(SDEFUN |IMODHP;eval_and_solve;ILLRMU;13|
        ((|pt| |Integer|) (|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)))
          "failed" "no_solution"))
        (SPROG
         ((#1=#:G381 NIL)
          (|ngvl|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (|ngv0p|
           (|Union|
            (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
            "failed"))
          (#2=#:G382 NIL) (|i| NIL) (|nev| #3=(|SortedExponentVector|))
          (#4=#:G368 NIL) (|ncv| #5=(|U32Vector|)) (#6=#:G366 NIL)
          (|k| (|Integer|)) (|cpl| (|Integer|)) (|l| NIL) (|cp| (|U32Vector|))
          (|mm| (|Integer|)) (|k1| (|Integer|)) (|j| NIL)
          (|ov| (|Vector| (|Integer|))) (|ev| #3#) (#7=#:G358 NIL) (|cv| #5#)
          (#8=#:G356 NIL) (|r_cnt| (|Integer|)) (|m| #9=(|NonNegativeInteger|))
          (|nsols| #9#) (|civ| #10=(|Vector| (|Integer|)))
          (|va| #11=(|Vector| (|Integer|)))
          (|bm| #12=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #12#) (|:| |defects| #11#)
                      (|:| |cinds| #10#))
            "no_solution"))
          (|ve| (|Vector| (|Integer|))) (|ngv2| (|Vector| (|U32Vector|)))
          (|ngv10| (|List| (|U32Vector|)))
          (|ngv10p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|nvars| (|NonNegativeInteger|)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |p| (QVELT |pss| 5)
                  . #13=(|IMODHP;eval_and_solve;ILLRMU;13|))
            (LETT |nvars| (LENGTH |vars|) . #13#)
            (EXIT
             (COND
              ((EQL |nvars| 1)
               (SEQ
                (LETT |ngv10p|
                      (|IMODHP;eval1s| |gvl| |pt| (|SPADfirst| |vars|) |pss| $)
                      . #13#)
                (EXIT
                 (COND
                  ((QEQCAR |ngv10p| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #13#) (GO #14=#:G380)))
                  (#15='T
                   (SEQ (LETT |ngv10| (QCDR |ngv10p|) . #13#)
                        (LETT |ngv2|
                              (SPADCALL |ngv10| |p| (QVELT |pss| 4) |gen|)
                              . #13#)
                        (LETT |ve| (QVELT |pss| 0) . #13#)
                        (LETT |blr|
                              (SPADCALL |ngv2| |ve| (QVELT |pss| 1)
                                        (QVELT |pss| 2) |p| (QVELT |pss| 6)
                                        (QREFELT $ 55))
                              . #13#)
                        (EXIT
                         (COND
                          ((QEQCAR |blr| 1)
                           (PROGN
                            (LETT #1# (CONS 2 "no_solution") . #13#)
                            (GO #14#)))
                          (#15#
                           (SEQ (LETT |rblr| (QCDR |blr|) . #13#)
                                (LETT |bm| (QVELT |rblr| 0) . #13#)
                                (LETT |va| (QVELT |rblr| 1) . #13#)
                                (LETT |civ| (QVELT |rblr| 2) . #13#)
                                (LETT |nsols| (QVSIZE |va|) . #13#)
                                (LETT |r_cnt| 0 . #13#)
                                (LETT |m| (QVSIZE |ve|) . #13#)
                                (SEQ (LETT |j| 1 . #13#) G190
                                     (COND ((|greater_SI| |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |r_cnt|
                                             (+
                                              (+ |r_cnt|
                                                 (SPADCALL |ve| |j|
                                                           (QREFELT $ 42)))
                                              1)
                                             . #13#)))
                                     (LETT |j| (|inc_SI| |j|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |r_cnt| (* |r_cnt| |nsols|) . #13#)
                                (LETT |cv|
                                      (GETREFV_U32
                                       (PROG1 (LETT #8# |r_cnt| . #13#)
                                         (|check_subtype2| (>= #8# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #8#))
                                       0)
                                      . #13#)
                                (LETT |ev|
                                      (GETREFV_U32
                                       (PROG1 (LETT #7# |r_cnt| . #13#)
                                         (|check_subtype2| (>= #7# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #7#))
                                       0)
                                      . #13#)
                                (LETT |ov| (MAKEARR1 (* |nsols| |m|) 0) . #13#)
                                (LETT |k| 0 . #13#) (LETT |k1| 1 . #13#)
                                (SEQ (LETT |i| 1 . #13#) G190
                                     (COND
                                      ((|greater_SI| |i| |nsols|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |j| 1 . #13#) G190
                                            (COND
                                             ((|greater_SI| |j| |m|)
                                              (GO G191)))
                                            (SEQ
                                             (SPADCALL |ov| |k1| |k|
                                                       (QREFELT $ 45))
                                             (LETT |k1| (+ |k1| 1) . #13#)
                                             (LETT |mm|
                                                   (SPADCALL |ve| |j|
                                                             (QREFELT $ 42))
                                                   . #13#)
                                             (LETT |cp|
                                                   (SPADCALL |bm| |i| |j|
                                                             (QREFELT $ 66))
                                                   . #13#)
                                             (EXIT
                                              (SEQ (LETT |l| 0 . #13#) G190
                                                   (COND
                                                    ((|greater_SI| |l| |mm|)
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |cpl|
                                                          (ELT_U32 |cp| |l|)
                                                          . #13#)
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |cpl| 0
                                                                 (QREFELT $
                                                                          57))
                                                       (SEQ
                                                        (SETELT_U32 |cv| |k|
                                                                    |cpl|)
                                                        (SETELT_U32 |ev| |k|
                                                                    |l|)
                                                        (EXIT
                                                         (LETT |k| (+ |k| 1)
                                                               . #13#)))))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #13#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |j| (|inc_SI| |j|) . #13#)
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |ncv|
                                      (GETREFV_U32
                                       (PROG1 (LETT #6# |k| . #13#)
                                         (|check_subtype2| (>= #6# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #6#))
                                       0)
                                      . #13#)
                                (LETT |nev|
                                      (GETREFV_U32
                                       (PROG1 (LETT #4# |k| . #13#)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       0)
                                      . #13#)
                                (SEQ (LETT |i| 0 . #13#)
                                     (LETT #2# (- |k| 1) . #13#) G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (SETELT_U32 |ncv| |i| (ELT_U32 |cv| |i|))
                                      (EXIT
                                       (SETELT_U32 |nev| |i|
                                                   (ELT_U32 |ev| |i|))))
                                     (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (PROGN
                                  (LETT #1#
                                        (CONS 0
                                              (VECTOR |va| |civ| |m| |ov| |nev|
                                                      |ncv|))
                                        . #13#)
                                  (GO #14#)))))))))))))
              (#15#
               (SEQ
                (LETT |ngv0p|
                      (|IMODHP;eval2s| |gvl| |pt| (|SPADfirst| |vars|) |p| $)
                      . #13#)
                (EXIT
                 (COND
                  ((QEQCAR |ngv0p| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #13#) (GO #14#)))
                  (#15#
                   (SEQ (LETT |ngvl| (QCDR |ngv0p|) . #13#)
                        (EXIT
                         (PROGN
                          (LETT #1#
                                (SPADCALL (CDR |vars|) |ngvl| |pss| |gen|
                                          (QREFELT $ 72))
                                . #13#)
                          (GO #14#)))))))))))))
          #14# (EXIT #1#)))) 

(SDEFUN |IMODHP;do_poly_modular;LLRMU;14|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| #1=(|Vector| (|Integer|)))
                    (|:| |cinds| #2=(|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| #3=(|Vector| (|Integer|)))
                    (|:| |expdata| #4=(|SortedExponentVector|))
                    (|:| |coeffdata| #5=(|U32Vector|)))
          "failed" "no_solution"))
        (SPROG
         ((#6=#:G438 NIL)
          (|rr|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (#7=#:G441 NIL) (|j| NIL) (|hi| #8=(|Integer|)) (|lo| #8#)
          (|invc| (|Integer|)) (#9=#:G437 NIL) (|ok| #10=(|Boolean|))
          (|nofi| #8#) (|ofi| #8#) (|ofin| #11=(|Integer|)) (|cnum| #8#)
          (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| #5#)
          (|jl| (|Integer|)) (|ndl| #12=(|List| (|Integer|))) (#13=#:G440 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #12#) (|dl| (|List| (|List| (|Integer|))))
          (|good_cnt| #14=(|Integer|)) (|all_bad| (|Boolean|)) (|nsols| #11#)
          (|bad_cnt| #14#) (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| #3#) (|nexps| #4#) (|civ| #2#) (|va| #1#)
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pprp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed" "no_solution"))
          (|qn| (|Integer|)) (#15=#:G439 NIL) (|k| NIL) (|pts| (|U32Vector|))
          (|npt| (|Integer|)) (|lpt| (|List| (|Integer|))) (|pt| (|Integer|))
          (|nvars| (|NonNegativeInteger|)) (|m| (|Integer|)) (|p| (|Integer|))
          (|update_qval| (|Boolean|)) (|update_points| #10#))
         (SEQ
          (EXIT
           (SEQ (LETT |lpt| NIL . #16=(|IMODHP;do_poly_modular;LLRMU;14|))
                (LETT |bad_cnt| 0 . #16#) (LETT |good_cnt| 0 . #16#)
                (LETT |exps| (GETREFV_U32 0 0) . #16#)
                (LETT |offsets| (MAKE-ARRAY 0) . #16#)
                (LETT |all_bad| 'T . #16#)
                (LETT |update_points|
                      (COND
                       ((EQUAL (QVELT |pss| 6) '|qshiftHP|)
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T 'NIL))
                      . #16#)
                (LETT |update_qval|
                      (COND
                       ((OR (EQUAL (QVELT |pss| 6) '|qshiftHP|)
                            (OR (EQUAL (QVELT |pss| 6) '|qdiffHP|)
                                (EQUAL (QVELT |pss| 6) '|qmixed|)))
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T 'NIL))
                      . #16#)
                (LETT |p| (QVELT |pss| 5) . #16#)
                (LETT |m| (QVELT |pss| 9) . #16#)
                (LETT |nvars| (LENGTH |vars|) . #16#)
                (LETT |nsols| (+ |m| 1) . #16#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| 'NIL . #16#)
                           (SEQ (LETT |k| 1 . #16#) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (COND (|ok| 'NIL) ('T 'T))))
                                  (GO G191)))
                                (SEQ (LETT |pt| (RANDOM |p|) . #16#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |pt| |lpt| (QREFELT $ 74))
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |lpt| (CONS |pt| |lpt|) . #16#)
                                         (EXIT (LETT |ok| 'T . #16#)))))))
                                (LETT |k| (|inc_SI| |k|) . #16#) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((EQL
                              (SPADCALL (LETT |npt| (LENGTH |lpt|) . #16#) 100
                                        (QREFELT $ 20))
                              0)
                             (SEQ
                              (SPADCALL "Number of evaluation points"
                                        (QREFELT $ 76))
                              (EXIT
                               (SPADCALL (SPADCALL |npt| (QREFELT $ 77))
                                         (QREFELT $ 76))))))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ
                               (COND
                                (|update_points|
                                 (SEQ (LETT |pts| (QVELT |pss| 2) . #16#)
                                      (LETT |qn| 1 . #16#)
                                      (EXIT
                                       (SEQ (LETT |k| 0 . #16#)
                                            (LETT #15# (- (QVELT |pss| 1) 1)
                                                  . #16#)
                                            G190
                                            (COND
                                             ((|greater_SI| |k| #15#)
                                              (GO G191)))
                                            (SEQ (SETELT_U32 |pts| |k| |qn|)
                                                 (EXIT
                                                  (LETT |qn|
                                                        (SPADCALL (* |pt| |qn|)
                                                                  |p|
                                                                  (QREFELT $
                                                                           20))
                                                        . #16#)))
                                            (LETT |k| (|inc_SI| |k|) . #16#)
                                            (GO G190) G191 (EXIT NIL))))))
                               (COND (|update_qval| (QSETVELT |pss| 4 |pt|)))
                               (LETT |pprp|
                                     (SPADCALL |pt| |vars| |gvl| |pss| |gen|
                                               (QREFELT $ 73))
                                     . #16#)
                               (EXIT
                                (COND
                                 ((QEQCAR |pprp| 2)
                                  (PROGN
                                   (LETT #6# (CONS 2 "no_solution") . #16#)
                                   (GO #17=#:G436)))
                                 ((QEQCAR |pprp| 1)
                                  (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1) . #16#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |bad_cnt| (+ |good_cnt| 2)
                                                    (QREFELT $ 58))
                                          (PROGN
                                           (LETT #6# (CONS 1 "failed") . #16#)
                                           (GO #17#)))
                                         ('T "iterate")))))
                                 ('T
                                  (SEQ (LETT |ppr| (QCDR |pprp|) . #16#)
                                       (LETT |va| (QVELT |ppr| 0) . #16#)
                                       (LETT |civ| (QVELT |ppr| 1) . #16#)
                                       (LETT |nexps| (QVELT |ppr| 4) . #16#)
                                       (LETT |noffsets| (QVELT |ppr| 3) . #16#)
                                       (LETT |coeffs| (QVELT |ppr| 5) . #16#)
                                       (LETT |chk_ress|
                                             (|IMODHP;check_defects| |va| |civ|
                                              |pss| $)
                                             . #16#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |chk_ress| 1)
                                          (SEQ
                                           (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                 . #16#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |bad_cnt|
                                                        (+ |good_cnt| 2)
                                                        (QREFELT $ 58))
                                              (PROGN
                                               (LETT #6# (CONS 1 "failed")
                                                     . #16#)
                                               (GO #17#)))
                                             ('T "iterate")))))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((QEQCAR |chk_ress| 2)
                                             (LETT |all_bad| 'T . #16#)))
                                           (COND
                                            (|all_bad|
                                             (SEQ
                                              (LETT |nsols| (QVSIZE |va|)
                                                    . #16#)
                                              (QSETVELT |pss| 10 |nsols|)
                                              (QSETVELT |pss| 7 |va|)
                                              (QSETVELT |pss| 8 |civ|)
                                              (LETT |exps| |nexps| . #16#)
                                              (LETT |offsets| |noffsets|
                                                    . #16#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL
                                                      (QV_LEN_U32 |coeffs|) |p|
                                                      (QREFELT $ 79))
                                                     . #16#)))))
                                           (LETT |all_bad| 'NIL . #16#)
                                           (LETT |good_cnt| (+ |good_cnt| 1)
                                                 . #16#)
                                           (LETT |dl|
                                                 (SPADCALL |nvars| |offsets|
                                                           |exps| |noffsets|
                                                           |nexps|
                                                           (QREFELT $ 61))
                                                 . #16#)
                                           (LETT |odl|
                                                 (SPADCALL |dl| 1
                                                           (QREFELT $ 80))
                                                 . #16#)
                                           (LETT |ndl|
                                                 (SPADCALL |dl| 2
                                                           (QREFELT $ 80))
                                                 . #16#)
                                           (COND
                                            ((SPADCALL |odl| NIL
                                                       (QREFELT $ 81))
                                             (SEQ
                                              (LETT |oer|
                                                    (SPADCALL |nvars| |odl|
                                                              |ndl| |offsets|
                                                              |exps| |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 64))
                                                    . #16#)
                                              (LETT |offsets| (QCAR |oer|)
                                                    . #16#)
                                              (LETT |exps| (QCDR |oer|) . #16#)
                                              (LETT |ncc|
                                                    (QUOTIENT2
                                                     (QV_LEN_U32 |exps|)
                                                     |nvars|)
                                                    . #16#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL |ncc| |p|
                                                               (QREFELT $ 79))
                                                     . #16#)))))
                                           (COND
                                            ((SPADCALL |ndl| NIL
                                                       (QREFELT $ 81))
                                             (SEQ
                                              (LETT |n0| (QV_LEN_U32 |coeffs|)
                                                    . #16#)
                                              (LETT |nn| (LENGTH |ndl|) . #16#)
                                              (LETT |n1| (+ |n0| |nn|) . #16#)
                                              (LETT |ncoeffs|
                                                    (GETREFV_U32 |n1| 0)
                                                    . #16#)
                                              (LETT |i| 0 . #16#)
                                              (LETT |jl| (|SPADfirst| |ndl|)
                                                    . #16#)
                                              (SEQ (LETT |j| 0 . #16#)
                                                   (LETT #13# (- |n1| 1)
                                                         . #16#)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |j| #13#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (COND
                                                      ((EQL |j| |jl|)
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j| 0)
                                                        (LETT |ndl| (CDR |ndl|)
                                                              . #16#)
                                                        (EXIT
                                                         (LETT |jl|
                                                               (COND
                                                                ((NULL |ndl|)
                                                                 |n1|)
                                                                ('T
                                                                 (|SPADfirst|
                                                                  |ndl|)))
                                                               . #16#))))
                                                      ('T
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j|
                                                                    (ELT_U32
                                                                     |coeffs|
                                                                     |i|))
                                                        (EXIT
                                                         (LETT |i| (+ |i| 1)
                                                               . #16#)))))))
                                                   (LETT |j| (|inc_SI| |j|)
                                                         . #16#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |coeffs| |ncoeffs|
                                                     . #16#)))))
                                           (LETT |block_offsets|
                                                 (|IMODHP;compute_blocks|
                                                  |offsets| |m| |nsols| $)
                                                 . #16#)
                                           (LETT |n1| (QV_LEN_U32 |coeffs|)
                                                 . #16#)
                                           (LETT |ok| 'T . #16#)
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |i| 1 . #16#) G190
                                                  (COND
                                                   ((|greater_SI| |i| |nsols|)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |cnum|
                                                         (SPADCALL |civ| |i|
                                                                   (QREFELT $
                                                                            42))
                                                         . #16#)
                                                   (LETT |ofin|
                                                         (+ (* |m| (- |i| 1))
                                                            |cnum|)
                                                         . #16#)
                                                   (LETT |ofi|
                                                         (SPADCALL |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            42))
                                                         . #16#)
                                                   (LETT |nofi|
                                                         (COND
                                                          ((OR (< |i| |nsols|)
                                                               (< |cnum| |m|))
                                                           (SPADCALL |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              42)))
                                                          ('T |n1|))
                                                         . #16#)
                                                   (LETT |nofi| (- |nofi| 1)
                                                         . #16#)
                                                   (EXIT
                                                    (COND
                                                     ((< |nofi| |ofi|)
                                                      (SEQ
                                                       (SPADCALL
                                                        (SPADCALL |civ|
                                                                  (QREFELT $
                                                                           82))
                                                        (QREFELT $ 76))
                                                       (SPADCALL
                                                        (SPADCALL |offsets|
                                                                  (QREFELT $
                                                                           82))
                                                        (QREFELT $ 76))
                                                       (EXIT
                                                        (|error|
                                                         "Internal error: corrupted offsets 1"))))
                                                     ((EQL
                                                       (ELT_U32 |coeffs|
                                                                |nofi|)
                                                       0)
                                                      (SEQ
                                                       (LETT |ok| 'NIL . #16#)
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #9# |$NoValue|
                                                               . #16#)
                                                         (GO #18=#:G423)))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |invc|
                                                             (SPADCALL
                                                              (ELT_U32 |coeffs|
                                                                       |nofi|)
                                                              |p|
                                                              (QREFELT $ 83))
                                                             . #16#)
                                                       (LETT |lo|
                                                             (SPADCALL
                                                              |block_offsets|
                                                              |i|
                                                              (QREFELT $ 42))
                                                             . #16#)
                                                       (LETT |hi|
                                                             (COND
                                                              ((< |i| |nsols|)
                                                               (SPADCALL
                                                                |block_offsets|
                                                                (+ |i| 1)
                                                                (QREFELT $
                                                                         42)))
                                                              ('T |n1|))
                                                             . #16#)
                                                       (EXIT
                                                        (SEQ
                                                         (LETT |j| |lo| . #16#)
                                                         (LETT #7# (- |hi| 1)
                                                               . #16#)
                                                         G190
                                                         (COND
                                                          ((> |j| #7#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (SETELT_U32 |coeffs|
                                                                       |j|
                                                                       (QSMULMOD32
                                                                        (ELT_U32
                                                                         |coeffs|
                                                                         |j|)
                                                                        |invc|
                                                                        |p|))))
                                                         (LETT |j| (+ |j| 1)
                                                               . #16#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #16#)
                                                  (GO G190) G191 (EXIT NIL)))
                                            #18# (EXIT #9#))
                                           (EXIT
                                            (COND
                                             (|ok|
                                              (SEQ
                                               (SPADCALL |coeffs| |pt| |rstate|
                                                         (QREFELT $ 84))
                                               (LETT |pp|
                                                     (SPADCALL |rstate| |nvars|
                                                               |block_offsets|
                                                               |offsets| |exps|
                                                               (QREFELT $ 87))
                                                     . #16#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |pp| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |rr| (QCDR |pp|)
                                                         . #16#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6#
                                                           (CONS 0
                                                                 (VECTOR |va|
                                                                         |civ|
                                                                         |m|
                                                                         (QVELT
                                                                          |rr|
                                                                          1)
                                                                         (QVELT
                                                                          |rr|
                                                                          2)
                                                                         (QVELT
                                                                          |rr|
                                                                          3)))
                                                           . #16#)
                                                     (GO #17#)))))))))
                                             ('T "iterate")))))))))))))
                             ('T (|error| "Run out of evaluation points")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #17# (EXIT #6#)))) 

(SDEFUN |IMODHP;do_poly_integer0|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |prime| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| #1=(|Integer|))
          (|:| |sol_cnt| (|Integer|)) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|PrimitiveArray| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#2=#:G489 NIL)
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#3=#:G491 NIL) (|j| NIL) (|hi| #4=(|Integer|)) (|lo| #4#)
          (|invc| (|Integer|)) (#5=#:G488 NIL) (|ok| (|Boolean|)) (|nofi| #4#)
          (|ofi| #4#) (|ofin| #6=(|Integer|)) (|cnum| #4#) (|i| (|Integer|))
          (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| #7=(|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #8=(|List| (|Integer|))) (#9=#:G490 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #8#) (|dl| (|List| (|List| (|Integer|))))
          (|all_bad| (|Boolean|)) (|nsols| #6#)
          (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| #10=(|Vector| (|Integer|)))
          (|nexps| #11=(|SortedExponentVector|))
          (|civ| #12=(|Vector| (|Integer|))) (|va| #13=(|Vector| (|Integer|)))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|pprp|
           (|Union|
            (|Record| (|:| |defects| #13#) (|:| |cinds| #12#)
                      (|:| |rowlen| (|Integer|)) (|:| |offsetdata| #10#)
                      (|:| |expdata| #11#) (|:| |coeffdata| #7#))
            "failed" "no_solution"))
          (|ngvl|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (|ngv0p|
           (|Union|
            (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
            "failed"))
          (|lp| (|List| (|Integer|))) (|p| (|Integer|)) (|k| NIL)
          (|nvars| (|NonNegativeInteger|)) (|m| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #14=(|IMODHP;do_poly_integer0|))
                (LETT |exps| (GETREFV_U32 0 0) . #14#)
                (LETT |offsets| (MAKE-ARRAY 0) . #14#)
                (LETT |all_bad| 'T . #14#) (LETT |p| 16 . #14#)
                (LETT |m| (QVELT |pss| 9) . #14#)
                (LETT |nvars| (LENGTH |vars|) . #14#)
                (LETT |nsols| (+ |m| 1) . #14#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| 'NIL . #14#)
                           (SEQ (LETT |k| 1 . #14#) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (COND (|ok| 'NIL) ('T 'T))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |p|
                                       (SPADCALL (+ (RANDOM 200000) 200000)
                                                 (QREFELT $ 89))
                                       . #14#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| |lp| (QREFELT $ 74))
                                    "iterate")
                                   ('T
                                    (SEQ (LETT |lp| (CONS |p| |lp|) . #14#)
                                         (EXIT (LETT |ok| 'T . #14#)))))))
                                (LETT |k| (|inc_SI| |k|) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ (QSETVELT |pss| 5 |p|)
                                   (LETT |ngv0p| (|IMODHP;eval3s| |gvl| |p| $)
                                         . #14#)
                                   (EXIT
                                    (COND ((QEQCAR |ngv0p| 1) "iterate")
                                          ('T
                                           (SEQ
                                            (LETT |ngvl| (QCDR |ngv0p|) . #14#)
                                            (LETT |pprp|
                                                  (SPADCALL |vars| |ngvl| |pss|
                                                            |gen|
                                                            (QREFELT $ 72))
                                                  . #14#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |pprp| 2)
                                               (PROGN
                                                (LETT #2#
                                                      (CONS 1 "no_solution")
                                                      . #14#)
                                                (GO #15=#:G487)))
                                              ((QEQCAR |pprp| 1) "iterate")
                                              ('T
                                               (SEQ
                                                (LETT |ppr| (QCDR |pprp|)
                                                      . #14#)
                                                (LETT |va| (QVELT |ppr| 0)
                                                      . #14#)
                                                (LETT |civ| (QVELT |ppr| 1)
                                                      . #14#)
                                                (LETT |nexps| (QVELT |ppr| 4)
                                                      . #14#)
                                                (LETT |noffsets|
                                                      (QVELT |ppr| 3) . #14#)
                                                (LETT |coeffs| (QVELT |ppr| 5)
                                                      . #14#)
                                                (LETT |chk_ress|
                                                      (|IMODHP;check_defects|
                                                       |va| |civ| |pss| $)
                                                      . #14#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |chk_ress| 1)
                                                   "iterate")
                                                  ('T
                                                   (SEQ
                                                    (COND
                                                     ((QEQCAR |chk_ress| 2)
                                                      (LETT |all_bad| 'T
                                                            . #14#)))
                                                    (COND
                                                     (|all_bad|
                                                      (SEQ
                                                       (LETT |nsols|
                                                             (QVSIZE |va|)
                                                             . #14#)
                                                       (QSETVELT |pss| 10
                                                                 |nsols|)
                                                       (QSETVELT |pss| 7 |va|)
                                                       (QSETVELT |pss| 8 |civ|)
                                                       (LETT |exps| |nexps|
                                                             . #14#)
                                                       (LETT |offsets|
                                                             |noffsets| . #14#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL
                                                               (QV_LEN_U32
                                                                |coeffs|)
                                                               (QREFELT $ 91))
                                                              . #14#)))))
                                                    (LETT |all_bad| 'NIL
                                                          . #14#)
                                                    (LETT |dl|
                                                          (SPADCALL
                                                           (+ |nvars| 1)
                                                           |offsets| |exps|
                                                           |noffsets| |nexps|
                                                           (QREFELT $ 61))
                                                          . #14#)
                                                    (LETT |odl|
                                                          (SPADCALL |dl| 1
                                                                    (QREFELT $
                                                                             80))
                                                          . #14#)
                                                    (LETT |ndl|
                                                          (SPADCALL |dl| 2
                                                                    (QREFELT $
                                                                             80))
                                                          . #14#)
                                                    (COND
                                                     ((SPADCALL |odl| NIL
                                                                (QREFELT $ 81))
                                                      (SEQ
                                                       (LETT |oer|
                                                             (SPADCALL
                                                              (+ |nvars| 1)
                                                              |odl| |ndl|
                                                              |offsets| |exps|
                                                              |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 64))
                                                             . #14#)
                                                       (LETT |offsets|
                                                             (QCAR |oer|)
                                                             . #14#)
                                                       (LETT |exps|
                                                             (QCDR |oer|)
                                                             . #14#)
                                                       (LETT |ncc|
                                                             (QUOTIENT2
                                                              (QV_LEN_U32
                                                               |exps|)
                                                              (+ |nvars| 1))
                                                             . #14#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL |ncc|
                                                                        (QREFELT
                                                                         $ 91))
                                                              . #14#)))))
                                                    (COND
                                                     ((SPADCALL |ndl| NIL
                                                                (QREFELT $ 81))
                                                      (SEQ
                                                       (LETT |n0|
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             . #14#)
                                                       (LETT |nn|
                                                             (LENGTH |ndl|)
                                                             . #14#)
                                                       (LETT |n1| (+ |n0| |nn|)
                                                             . #14#)
                                                       (LETT |ncoeffs|
                                                             (GETREFV_U32 |n1|
                                                                          0)
                                                             . #14#)
                                                       (LETT |i| 0 . #14#)
                                                       (LETT |jl|
                                                             (|SPADfirst|
                                                              |ndl|)
                                                             . #14#)
                                                       (SEQ (LETT |j| 0 . #14#)
                                                            (LETT #9#
                                                                  (- |n1| 1)
                                                                  . #14#)
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
                                                                  |ncoeffs| |j|
                                                                  0)
                                                                 (LETT |ndl|
                                                                       (CDR
                                                                        |ndl|)
                                                                       . #14#)
                                                                 (EXIT
                                                                  (LETT |jl|
                                                                        (COND
                                                                         ((NULL
                                                                           |ndl|)
                                                                          |n1|)
                                                                         ('T
                                                                          (|SPADfirst|
                                                                           |ndl|)))
                                                                        . #14#))))
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
                                                                        . #14#)))))))
                                                            (LETT |j|
                                                                  (|inc_SI|
                                                                   |j|)
                                                                  . #14#)
                                                            (GO G190) G191
                                                            (EXIT NIL))
                                                       (EXIT
                                                        (LETT |coeffs|
                                                              |ncoeffs|
                                                              . #14#)))))
                                                    (LETT |block_offsets|
                                                          (|IMODHP;compute_blocks|
                                                           |offsets| |m|
                                                           |nsols| $)
                                                          . #14#)
                                                    (LETT |n1|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #14#)
                                                    (LETT |ok| 'T . #14#)
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |i| 1 . #14#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |i|
                                                                           |nsols|)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |cnum|
                                                                  (SPADCALL
                                                                   |civ| |i|
                                                                   (QREFELT $
                                                                            42))
                                                                  . #14#)
                                                            (LETT |ofin|
                                                                  (+
                                                                   (* |m|
                                                                      (- |i|
                                                                         1))
                                                                   |cnum|)
                                                                  . #14#)
                                                            (LETT |ofi|
                                                                  (SPADCALL
                                                                   |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            42))
                                                                  . #14#)
                                                            (LETT |nofi|
                                                                  (COND
                                                                   ((OR
                                                                     (< |i|
                                                                        |nsols|)
                                                                     (< |cnum|
                                                                        |m|))
                                                                    (SPADCALL
                                                                     |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              42)))
                                                                   ('T |n1|))
                                                                  . #14#)
                                                            (LETT |nofi|
                                                                  (- |nofi| 1)
                                                                  . #14#)
                                                            (EXIT
                                                             (COND
                                                              ((< |nofi| |ofi|)
                                                               (SEQ
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |civ|
                                                                  (QREFELT $
                                                                           82))
                                                                 (QREFELT $
                                                                          76))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |offsets|
                                                                  (QREFELT $
                                                                           82))
                                                                 (QREFELT $
                                                                          76))
                                                                (EXIT
                                                                 (|error|
                                                                  "Internal error: corrupted offsets"))))
                                                              ((EQL
                                                                (ELT_U32
                                                                 |coeffs|
                                                                 |nofi|)
                                                                0)
                                                               (SEQ
                                                                (LETT |ok| 'NIL
                                                                      . #14#)
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #5#
                                                                        |$NoValue|
                                                                        . #14#)
                                                                  (GO
                                                                   #16=#:G475)))))
                                                              ('T
                                                               (SEQ
                                                                (LETT |invc|
                                                                      (SPADCALL
                                                                       (ELT_U32
                                                                        |coeffs|
                                                                        |nofi|)
                                                                       |p|
                                                                       (QREFELT
                                                                        $ 83))
                                                                      . #14#)
                                                                (LETT |lo|
                                                                      (SPADCALL
                                                                       |block_offsets|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 42))
                                                                      . #14#)
                                                                (LETT |hi|
                                                                      (COND
                                                                       ((< |i|
                                                                           |nsols|)
                                                                        (SPADCALL
                                                                         |block_offsets|
                                                                         (+ |i|
                                                                            1)
                                                                         (QREFELT
                                                                          $
                                                                          42)))
                                                                       ('T
                                                                        |n1|))
                                                                      . #14#)
                                                                (EXIT
                                                                 (SEQ
                                                                  (LETT |j|
                                                                        |lo|
                                                                        . #14#)
                                                                  (LETT #3#
                                                                        (- |hi|
                                                                           1)
                                                                        . #14#)
                                                                  G190
                                                                  (COND
                                                                   ((> |j| #3#)
                                                                    (GO G191)))
                                                                  (SEQ
                                                                   (EXIT
                                                                    (SETELT_U32
                                                                     |coeffs|
                                                                     |j|
                                                                     (QSMULMOD32
                                                                      (ELT_U32
                                                                       |coeffs|
                                                                       |j|)
                                                                      |invc|
                                                                      |p|))))
                                                                  (LETT |j|
                                                                        (+ |j|
                                                                           1)
                                                                        . #14#)
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT
                                                                   NIL))))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #14#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                     #16# (EXIT #5#))
                                                    (EXIT
                                                     (COND
                                                      (|ok|
                                                       (SEQ
                                                        (SPADCALL |coeffs| |p|
                                                                  |rstate|
                                                                  (QREFELT $
                                                                           92))
                                                        (LETT |pp|
                                                              (SPADCALL
                                                               |rstate|
                                                               |block_offsets|
                                                               (QREFELT $ 94))
                                                              . #14#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |pp| 1)
                                                           "iterate")
                                                          ('T
                                                           (PROGN
                                                            (LETT #2#
                                                                  (CONS 0
                                                                        (VECTOR
                                                                         |va|
                                                                         |civ|
                                                                         |m|
                                                                         |offsets|
                                                                         |exps|
                                                                         (QCDR
                                                                          |pp|)))
                                                                  . #14#)
                                                            (GO #15#)))))))
                                                      ('T
                                                       "iterate")))))))))))))))))
                             ('T (|error| "Run out of primes")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #15# (EXIT #2#)))) 

(SDEFUN |IMODHP;do_poly_integer;LLVNniUv2SMU;16|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|ve| |Vector| (|Integer|)) (|sigma| |NonNegativeInteger|)
         (|pts| |U32Vector|) (|kind| |Symbol|) (|qvar| |Symbol|)
         (|gen| |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|))
         ($ |Union|
          (|Record| (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|)))
                    (|:| |rowlen| (|Integer|))
                    (|:| |offsetdata| (|Vector| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|PrimitiveArray| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#1=#:G502 NIL)
          (|pss|
           (|Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
                     (|:| |pss_sigma| (|NonNegativeInteger|))
                     (|:| |points| (|U32Vector|)) (|:| |pss_qvar| (|Symbol|))
                     (|:| |pss_qval| (|Integer|)) (|:| |prime| (|Integer|))
                     (|:| |pss_kind| (|Symbol|))
                     (|:| |oldva| (|Vector| (|Integer|)))
                     (|:| |oldciv| (|Vector| (|Integer|)))
                     (|:| |pss_m| (|Integer|)) (|:| |sol_cnt| (|Integer|))
                     (|:| |eval1coeffbuf| (|U32Vector|))
                     (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pss|
                  (VECTOR |ve| |sigma| |pts| |qvar| 0 0 |kind| (MAKE-ARRAY 0)
                          (MAKE-ARRAY 0) (QVSIZE |ve|) (+ (QVSIZE |ve|) 1)
                          (GETREFV_U32 10 0) (GETREFV_U32 10 0))
                  . #2=(|IMODHP;do_poly_integer;LLVNniUv2SMU;16|))
            (EXIT
             (PROGN
              (LETT #1# (|IMODHP;do_poly_integer0| |vars| |gvl| |pss| |gen| $)
                    . #2#)
              (GO #3=#:G501)))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |InnerModularHermitePade;|)) 

(DEFUN |InnerModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G504)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InnerModularHermitePade|)
                    . #2=(|InnerModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InnerModularHermitePade|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|InnerModularHermitePade;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|InnerModularHermitePade|)))))))))) 

(DEFUN |InnerModularHermitePade;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InnerModularHermitePade|)
                . #1=(|InnerModularHermitePade|))
          (LETT $ (GETREFV 98) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerModularHermitePade| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InnerModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|)
              (|NonNegativeInteger|) (0 . *) (|Void|) (|U32Vector|) (|Integer|)
              (|U32VectorPolynomialOperations|) (6 . |copy_first|)
              (|Polynomial| 11) (|Fraction| 14) (13 . |numer|) (18 . |denom|)
              (|SingleInteger|) (23 . |invmod|) (29 . |positiveRemainder|)
              (35 . |Zero|) |IMODHP;modpreduction;PIP;3| (|Boolean|) (39 . =)
              (|Record| (|:| |k| 7) (|:| |c| 14)) (|List| 25) (45 . =)
              (|Symbol|) (51 . ~=) (|List| 28) (|List| 11)
              |IMODHP;modpeval;PLL2I;4| (57 . |Zero|) (61 . |eval|) (68 . /)
              (|List| 46) (|Vector| 10) (|Vector| 11)
              (|NaiveBeckermannLabahnModular|) (74 . |naiveBeckermannLabahn|)
              (82 . |naiveBeckermannLabahnMultipoint|) (90 . |elt|)
              (96 . |elt|) (102 . |setelt!|) (109 . |setelt!|) (|Any|)
              (116 . |elt|) (|AnyFunctions1| 38) (122 . |retract|)
              (|AnyFunctions1| 37) (127 . |retract|)
              (|Record| (|:| |basis| 65) (|:| |defects| 38) (|:| |cinds| 38))
              (132 . |reduceBasis|) (|Union| 52 '"no_solution")
              |IMODHP;do_modular_solve;VVNniUvISU;8| (140 . <=) (146 . ~=)
              (152 . >) (|List| 31) (|SortedExponentVector|)
              |IMODHP;merge_exponents;IVSevVSevL;10| (158 . |One|)
              (|Record| (|:| |offsetdata| 38) (|:| |expdata| 60))
              |IMODHP;merge2;I2LVSevVSevR;11| (|TwoDimensionalArray| 10)
              (162 . |elt|)
              (|Record| (|:| |defects| 38) (|:| |cinds| 38) (|:| |rowlen| 11)
                        (|:| |offsetdata| 38) (|:| |expdata| 60)
                        (|:| |coeffdata| 10))
              (|Union| 67 '"failed" '"no_solution")
              (|List| (|PrimitiveArray| 15))
              (|Record| (|:| |degree_bounds| 38) (|:| |pss_sigma| 7)
                        (|:| |points| 10) (|:| |pss_qvar| 28)
                        (|:| |pss_qval| 11) (|:| |prime| 11)
                        (|:| |pss_kind| 28) (|:| |oldva| 38) (|:| |oldciv| 38)
                        (|:| |pss_m| 11) (|:| |sol_cnt| 11)
                        (|:| |eval1coeffbuf| 10) (|:| |eval1expbuf| 60))
              (|Mapping| 37 (|List| 10) 11 11)
              |IMODHP;do_poly_modular;LLRMU;14|
              |IMODHP;eval_and_solve;ILLRMU;13| (169 . |member?|)
              (|OutputForm|) (175 . |print|) (180 . |coerce|)
              (|VectorModularReconstructor|) (185 . |empty|) (191 . |elt|)
              (197 . ~=) (203 . |coerce|) (208 . |invmod|)
              (214 . |chinese_update|)
              (|Record| (|:| |nvars| 11) (|:| |offsetdata| 38)
                        (|:| |expdata| 60) (|:| |coeffdata| 10))
              (|Union| 85 '"failed") (221 . |reconstruct|)
              (|IntegerPrimesPackage| 11) (230 . |nextPrime|)
              (|VectorIntegerReconstructor|) (235 . |empty|)
              (240 . |chinese_update|)
              (|Union| (|PrimitiveArray| 11) '"failed") (247 . |reconstruct|)
              (|Record| (|:| |defects| 38) (|:| |cinds| 38) (|:| |rowlen| 11)
                        (|:| |offsetdata| 38) (|:| |expdata| 60)
                        (|:| |coeffdata| (|PrimitiveArray| 11)))
              (|Union| 95 '"no_solution")
              |IMODHP;do_poly_integer;LLVNniUv2SMU;16|)
           '#(|modpreduction| 253 |modpeval| 259 |merge_exponents| 267 |merge2|
              276 |eval_and_solve| 287 |do_poly_modular| 296 |do_poly_integer|
              304 |do_modular_solve| 316)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 97
                                                 '(2 7 0 6 0 8 3 12 9 10 10 11
                                                   13 1 15 14 0 16 1 15 14 0 17
                                                   2 18 0 0 0 19 2 11 0 0 0 20
                                                   0 14 0 21 2 14 23 0 0 24 2
                                                   26 23 0 0 27 2 28 23 0 0 29
                                                   0 15 0 33 3 14 0 0 30 31 34
                                                   2 15 0 14 14 35 4 39 36 37
                                                   38 7 11 40 4 39 36 37 38 10
                                                   11 41 2 38 11 0 11 42 2 37
                                                   10 0 11 43 3 37 10 0 11 10
                                                   44 3 38 11 0 11 11 45 2 36
                                                   46 0 11 47 1 48 38 46 49 1
                                                   50 37 46 51 4 39 52 37 38 38
                                                   11 53 2 11 23 0 0 56 2 11 23
                                                   0 0 57 2 11 23 0 0 58 0 15 0
                                                   62 3 65 10 0 11 11 66 2 31
                                                   23 11 0 74 1 75 9 0 76 1 11
                                                   75 0 77 2 78 0 11 11 79 2 59
                                                   31 0 11 80 2 31 23 0 0 81 1
                                                   38 75 0 82 2 11 0 0 0 83 3
                                                   78 9 10 11 0 84 5 78 86 0 11
                                                   38 38 60 87 1 88 11 11 89 1
                                                   90 0 11 91 3 90 9 10 11 0 92
                                                   2 90 93 0 38 94 2 0 14 14 11
                                                   22 4 0 11 14 30 31 11 32 5 0
                                                   59 11 38 60 38 60 61 7 0 63
                                                   11 31 31 38 60 38 60 64 5 0
                                                   68 11 30 69 70 71 73 4 0 68
                                                   30 69 70 71 72 8 0 96 30 69
                                                   38 7 10 28 28 71 97 6 0 54
                                                   37 38 7 10 11 28 55)))))
           '|lookupComplete|)) 

(MAKEPROP '|InnerModularHermitePade| 'NILADIC T) 
