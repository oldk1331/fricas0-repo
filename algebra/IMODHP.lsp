
(SDEFUN |IMODHP;eval1s|
        ((|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pt| |Integer|) (|var| |Symbol|)
         (|pss| |Record| (|:| |prime| #1=(|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union| (|List| (|U32Vector|)) "failed"))
        (SPROG
         ((|resl| (|List| (|U32Vector|))) (|nlc| (|Integer|))
          (|dms| (|SingleInteger|)) (#2=#:G155 NIL) (|dm| #3=(|Integer|))
          (|nm| #3#)
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#4=#:G157 NIL) (|j| NIL) (|ress| (|U32Vector|))
          (|n| (|NonNegativeInteger|)) (#5=#:G156 NIL) (|gv0| NIL) (|p| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |p| (QVELT |pss| 0) . #6=(|IMODHP;eval1s|))
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
                                          (SPADCALL (QCAR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10))
                                          . #6#)
                                    (LETT |dm|
                                          (SPADCALL (QCDR |nlcq|) |pt| |pss|
                                                    (QREFELT $ 10))
                                          . #6#)
                                    (EXIT
                                     (COND
                                      ((EQL |dm| 0)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #6#)
                                        (GO #7=#:G154)))
                                      ('T
                                       (SEQ (LETT |dms| |dm| . #6#)
                                            (LETT |nlc|
                                                  (QSMULMOD32 |nm|
                                                              (SPADCALL |dms|
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 12))
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

(SDEFUN |IMODHP;eval2s|
        ((|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pt| |Integer|) (|var| |Symbol|)
         (|pss| |Record| (|:| |prime| (|Integer|))
          (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ |Union|
          (|List|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          "failed"))
        (SPROG
         ((|resl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (#1=#:G175 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|)))))
          (#2=#:G177 NIL) (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G176 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval2s|))
                (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14)))
                                . #4#)
                          (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#)
                               G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |var| |pt| |pss|
                                                    (QREFELT $ 18))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #4#)
                                        (GO #5=#:G174)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |IMODHP;eval3s|
        ((|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|p| |Integer|)
         ($ |Union|
          (|List|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          "failed"))
        (SPROG
         ((|resl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (#1=#:G189 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))
            "failed"))
          (|nlcq| (|Fraction| (|Polynomial| (|Integer|)))) (#2=#:G191 NIL)
          (|j| NIL)
          (|ress|
           (|PrimitiveArray|
            (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                      (|:| |denom| (|Polynomial| (|Integer|))))))
          (|n| (|NonNegativeInteger|)) (#3=#:G190 NIL) (|gv0| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval3s|))
                (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                          (LETT |ress|
                                (MAKEARR1 |n|
                                          (CONS (|spadConstant| $ 13)
                                                (|spadConstant| $ 14)))
                                . #4#)
                          (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#)
                               G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                    (LETT |res1|
                                          (SPADCALL |nlcq| |p| (QREFELT $ 20))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |res1| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed") . #4#)
                                        (GO #5=#:G188)))
                                      ('T
                                       (QSETAREF1 |ress| |j| (QCDR |res1|))))))
                               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |IMODHP;do_modular_solve0|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|) ($ |List| (|Any|)))
        (COND
         ((OR (EQUAL |kind| '|diffHP|) (EQUAL |kind| '|qdiffHP|))
          (SPADCALL |gv| |ve| |sigma| |prime| (QREFELT $ 26)))
         ((OR (EQUAL |kind| '|shiftHP|)
              (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
          (SPADCALL |gv| |ve| |pts| |prime| (QREFELT $ 28)))
         ('T
          (|error|
           "kind must be diffHP, qdiffHP, shiftHP, qshiftHP or qmixed")))) 

(SDEFUN |IMODHP;do_modular_solve;VVNniUvISU;5|
        ((|gv| |Vector| (|U32Vector|)) (|ve| |Vector| (|Integer|))
         (|sigma| |NonNegativeInteger|) (|pts| |U32Vector|) (|prime| |Integer|)
         (|kind| |Symbol|)
         ($ |Union|
          (|Record| (|:| |basis| #1=(|TwoDimensionalArray| (|U32Vector|)))
                    (|:| |defects| (|Vector| (|Integer|)))
                    (|:| |cinds| (|Vector| (|Integer|))))
          "no_solution"))
        (SPROG
         ((#2=#:G229 NIL) (|j| (|Integer|)) (#3=#:G228 NIL) (|i| NIL)
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
                  . #6=(|IMODHP;do_modular_solve;VVNniUvISU;5|))
            (LETT |m1| 0 . #6#)
            (SEQ (LETT |i| 1 . #6#) G190
                 (COND ((|greater_SI| |i| |m0|) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
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
                            ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
                             (SEQ
                              (SPADCALL |ngv| |j|
                                        (SPADCALL |gv| |i| (QREFELT $ 30))
                                        (QREFELT $ 31))
                              (SPADCALL |nve| |j|
                                        (SPADCALL |ve| |i| (QREFELT $ 29))
                                        (QREFELT $ 32))
                              (EXIT (LETT |j| (+ |j| 1) . #6#)))))))
                         (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                         (EXIT NIL)))))
             (#7='T
              (SEQ (LETT |ngv| |gv| . #6#) (EXIT (LETT |nve| |ve| . #6#)))))
            (LETT |blr|
                  (|IMODHP;do_modular_solve0| |ngv| |nve| |sigma| |pts| |prime|
                   |kind| $)
                  . #6#)
            (LETT |dva| (SPADCALL |blr| 3 (QREFELT $ 34)) . #6#)
            (LETT |va| (SPADCALL |dva| (QREFELT $ 36)) . #6#)
            (LETT |ok| 'NIL . #6#) (LETT |m2| (QVSIZE |va|) . #6#)
            (SEQ (LETT |i| 1 . #6#) G190
                 (COND ((|greater_SI| |i| |m2|) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |ok|
                         (COND (|ok| 'T)
                               ('T (>= (SPADCALL |va| |i| (QREFELT $ 29)) 0)))
                         . #6#)))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              (|ok|
               (SEQ (LETT |dbm| (SPADCALL |blr| 1 (QREFELT $ 34)) . #6#)
                    (LETT |bm| (SPADCALL |dbm| (QREFELT $ 38)) . #6#)
                    (LETT |res|
                          (SPADCALL |bm| |nve| |va| |prime| (QREFELT $ 40))
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
                                   ((>= (SPADCALL |ve| |i| (QREFELT $ 29)) 0)
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
                                                  (QREFELT $ 29))
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
                                                         (QREFELT $ 29))
                                               0)
                                              (SEQ
                                               (COND
                                                ((EQL |j| |cindk|)
                                                 (SEQ
                                                  (SPADCALL (QVELT |res| 2) |k|
                                                            |i| (QREFELT $ 32))
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #3# |$NoValue| . #6#)
                                                    (GO #8=#:G218))))))
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
                (GO #9=#:G227)))))))
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
                                           (QREFELT $ 29))
                                 (QREFELT $ 32))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |block_offsets|)))) 

(SDEFUN |IMODHP;merge_exponents;IVSevVSevL;7|
        ((|nvars| |Integer|) (|offsets| |Vector| (|Integer|))
         (|exps| |SortedExponentVector|) (|noffsets| |Vector| (|Integer|))
         (|nexps| |SortedExponentVector|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|j0| (|Integer|)) (|i0| (|Integer|)) (|j| (|Integer|))
          (|i| (|Integer|)) (|ci| (|Integer|)) (#1=#:G258 NIL)
          (|j0i| (|Integer|)) (|ji| #2=(|Integer|)) (|jl| (|List| (|Integer|)))
          (|i0i| (|Integer|)) (|ii| #2#) (|il| (|List| (|Integer|))) (|k| NIL)
          (|lj| (|Integer|)) (|li| (|Integer|)) (#3=#:G259 NIL) (#4=#:G261 NIL)
          (|jj| NIL) (#5=#:G260 NIL) (|kk| (|Integer|)) (|nn| (|Integer|))
          (|oc| (|NonNegativeInteger|)) (|m| #6=(|Integer|)) (|n| #6#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (QUOTIENT2 (QV_LEN_U32 |exps|) |nvars|)
                  . #7=(|IMODHP;merge_exponents;IVSevVSevL;7|))
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
                                   (GO #8=#:G257)))
                                 ('T
                                  (SEQ (LETT |i0| |li| . #7#)
                                       (LETT |j0| |lj| . #7#)
                                       (LETT |i| (* |i0| |nvars|) . #7#)
                                       (LETT |j| (* |j0| |nvars|) . #7#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |kk| |oc| (QREFELT $ 44))
                                          (SEQ
                                           (LETT |li|
                                                 (SPADCALL |offsets| |kk|
                                                           (QREFELT $ 29))
                                                 . #7#)
                                           (EXIT
                                            (LETT |lj|
                                                  (SPADCALL |noffsets| |kk|
                                                            (QREFELT $ 29))
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
                                            (QREFELT $ 45))
                                  (PROGN
                                   (LETT #1#
                                         (COND
                                          ((SPADCALL
                                            (ELT_U32 |exps| (+ |i| |k|))
                                            (ELT_U32 |nexps| (+ |j| |k|))
                                            (QREFELT $ 46))
                                           (SEQ
                                            (LETT |il| (CONS |ci| |il|) . #7#)
                                            (LETT |ii| 0 . #7#)
                                            (LETT |i0i| 0 . #7#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #7#)
                                              (GO #9=#:G253)))))
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

(SDEFUN |IMODHP;merge2;I2LVSevVSevR;8|
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
          (|kk| (|Integer|)) (#2=#:G285 NIL) (|ci0| (|Integer|))
          (|nv1| (|Integer|)) (|noffsets| (|Vector| (|Integer|)))
          (|m| (|NonNegativeInteger|)) (|nexps| (|SortedExponentVector|))
          (#3=#:G264 NIL) (|nn1| (|Integer|)) (|n1| (|Integer|))
          (|nn| (|NonNegativeInteger|)) (|n0| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n0| (QV_LEN_U32 |exps1|)
                . #4=(|IMODHP;merge2;I2LVSevVSevR;8|))
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
          (LETT |li| (SPADCALL |ov1| 1 (QREFELT $ 29)) . #4#)
          (LETT |lj| (SPADCALL |ov2| 1 (QREFELT $ 29)) . #4#)
          (LETT |kk| 1 . #4#)
          (SEQ (LETT |ci0| 0 . #4#) (LETT #2# (- |n1| 1) . #4#) G190
               (COND ((|greater_SI| |ci0| #2#) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((EQL |i0| |li|) (EQL |j0| |lj|)) ('T 'NIL)))
                       (GO G191)))
                     (SEQ (SPADCALL |noffsets| |kk| |ci0| (QREFELT $ 32))
                          (LETT |kk| (+ |kk| 1) . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL |kk| |m| (QREFELT $ 44))
                             (SEQ
                              (LETT |li| (SPADCALL |ov1| |kk| (QREFELT $ 29))
                                    . #4#)
                              (EXIT
                               (LETT |lj| (SPADCALL |ov2| |kk| (QREFELT $ 29))
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
                 ((SPADCALL |ci0| |i00| (QREFELT $ 45))
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
               (SEQ (EXIT (SPADCALL |noffsets| |i| |n1| (QREFELT $ 32))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |noffsets| |nexps|))))) 

(SDEFUN |IMODHP;check_defects|
        ((|va| |Vector| (|Integer|)) (|civ| |Vector| (|Integer|))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| #1=(|Vector| (|Integer|)))
          (|:| |oldciv| #2=(|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| #3=(|Integer|))
          (|:| |pss1|
               (|Record| (|:| |prime| (|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
         ($ |Union| "OK" "failed" "all_bad"))
        (SPROG
         ((#4=#:G305 NIL) (#5=#:G304 NIL) (|is_bad| (|Boolean|))
          (|all_bad| (|Boolean|)) (|i| NIL) (|ociv| #2#) (|ova| #1#)
          (|nsols| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |nsols| (QVELT |pss| 9) . #6=(|IMODHP;check_defects|))
                (LETT |is_bad| (SPADCALL (QVSIZE |va|) |nsols| (QREFELT $ 46))
                      . #6#)
                (LETT |all_bad| (< (QVSIZE |va|) |nsols|) . #6#)
                (COND
                 ((EQL (QVSIZE |va|) |nsols|)
                  (SEQ (LETT |ova| (QVELT |pss| 6) . #6#)
                       (LETT |ociv| (QVELT |pss| 7) . #6#)
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ (LETT |i| 1 . #6#) G190
                               (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((< (SPADCALL |va| |i| (QREFELT $ 29))
                                      (SPADCALL |ova| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7=#:G299)))))
                                  ((SPADCALL (SPADCALL |va| |i| (QREFELT $ 29))
                                             (SPADCALL |ova| |i|
                                                       (QREFELT $ 29))
                                             (QREFELT $ 46))
                                   (SEQ (LETT |is_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7#)))))
                                  ((< (SPADCALL |civ| |i| (QREFELT $ 29))
                                      (SPADCALL |ociv| |i| (QREFELT $ 29)))
                                   (SEQ (LETT |all_bad| 'T . #6#)
                                        (EXIT
                                         (PROGN
                                          (LETT #5# |$NoValue| . #6#)
                                          (GO #7#)))))
                                  ((SPADCALL
                                    (SPADCALL |civ| |i| (QREFELT $ 29))
                                    (SPADCALL |ociv| |i| (QREFELT $ 29))
                                    (QREFELT $ 46))
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
                   (PROGN (LETT #4# (CONS 1 "failed") . #6#) (GO #8=#:G303)))
                  (|all_bad|
                   (PROGN (LETT #4# (CONS 2 "all_bad") . #6#) (GO #8#)))
                  ('T (PROGN (LETT #4# (CONS 0 "OK") . #6#) (GO #8#)))))))
          #8# (EXIT #4#)))) 

(SDEFUN |IMODHP;eval_and_solve|
        ((|pt| |Integer|) (|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pss| |Record| (|:| |degree_bounds| #1=(|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| (|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               #2=(|Record| (|:| |prime| #3=(|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (|gen| |Mapping| #4=(|Vector| (|U32Vector|)) (|List| (|U32Vector|))
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
         ((#5=#:G344 NIL)
          (|ngvl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (|ngv0p|
           (|Union|
            (|List|
             (|PrimitiveArray|
              (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                        (|:| |denom| (|Polynomial| (|Integer|))))))
            "failed"))
          (#6=#:G345 NIL) (|i| NIL) (|nev| #7=(|SortedExponentVector|))
          (#8=#:G331 NIL) (|ncv| #9=(|U32Vector|)) (#10=#:G329 NIL)
          (|k| (|Integer|)) (|cpl| (|Integer|)) (|l| NIL) (|cp| (|U32Vector|))
          (|mm| (|Integer|)) (|k1| (|Integer|)) (|j| NIL)
          (|ov| (|Vector| (|Integer|))) (|ev| #7#) (#11=#:G321 NIL) (|cv| #9#)
          (#12=#:G319 NIL) (|r_cnt| (|Integer|))
          (|m| #13=(|NonNegativeInteger|)) (|nsols| #13#)
          (|civ| #14=(|Vector| (|Integer|))) (|va| #15=(|Vector| (|Integer|)))
          (|bm| #16=(|TwoDimensionalArray| (|U32Vector|)))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #16#) (|:| |defects| #15#)
                      (|:| |cinds| #14#))
            "no_solution"))
          (|ve| #1#) (|ngv2| #4#) (|ngv10| (|List| (|U32Vector|)))
          (|ngv10p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|nvars| (|NonNegativeInteger|)) (|p| #3#) (|pss1| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |pss1| (QVELT |pss| 10) . #17=(|IMODHP;eval_and_solve|))
                (LETT |p| (QVELT |pss1| 0) . #17#)
                (LETT |nvars| (LENGTH |vars|) . #17#)
                (EXIT
                 (COND
                  ((EQL |nvars| 1)
                   (SEQ
                    (LETT |ngv10p|
                          (|IMODHP;eval1s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $)
                          . #17#)
                    (EXIT
                     (COND
                      ((QEQCAR |ngv10p| 1)
                       (PROGN
                        (LETT #5# (CONS 1 "failed") . #17#)
                        (GO #18=#:G343)))
                      (#19='T
                       (SEQ (LETT |ngv10| (QCDR |ngv10p|) . #17#)
                            (LETT |ngv2|
                                  (SPADCALL |ngv10| |p| (QVELT |pss| 4) |gen|)
                                  . #17#)
                            (LETT |ve| (QVELT |pss| 0) . #17#)
                            (LETT |blr|
                                  (SPADCALL |ngv2| |ve| (QVELT |pss| 1)
                                            (QVELT |pss| 2) |p| (QVELT |pss| 5)
                                            (QREFELT $ 42))
                                  . #17#)
                            (EXIT
                             (COND
                              ((QEQCAR |blr| 1)
                               (PROGN
                                (LETT #5# (CONS 2 "no_solution") . #17#)
                                (GO #18#)))
                              (#19#
                               (SEQ (LETT |rblr| (QCDR |blr|) . #17#)
                                    (LETT |bm| (QVELT |rblr| 0) . #17#)
                                    (LETT |va| (QVELT |rblr| 1) . #17#)
                                    (LETT |civ| (QVELT |rblr| 2) . #17#)
                                    (LETT |nsols| (QVSIZE |va|) . #17#)
                                    (LETT |r_cnt| 0 . #17#)
                                    (LETT |m| (QVSIZE |ve|) . #17#)
                                    (SEQ (LETT |j| 1 . #17#) G190
                                         (COND
                                          ((|greater_SI| |j| |m|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |r_cnt|
                                                 (+
                                                  (+ |r_cnt|
                                                     (SPADCALL |ve| |j|
                                                               (QREFELT $ 29)))
                                                  1)
                                                 . #17#)))
                                         (LETT |j| (|inc_SI| |j|) . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |r_cnt| (* |r_cnt| |nsols|) . #17#)
                                    (LETT |cv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #12# |r_cnt| . #17#)
                                             (|check_subtype2| (>= #12# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #12#))
                                           0)
                                          . #17#)
                                    (LETT |ev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #11# |r_cnt| . #17#)
                                             (|check_subtype2| (>= #11# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #11#))
                                           0)
                                          . #17#)
                                    (LETT |ov| (MAKEARR1 (* |nsols| |m|) 0)
                                          . #17#)
                                    (LETT |k| 0 . #17#) (LETT |k1| 1 . #17#)
                                    (SEQ (LETT |i| 1 . #17#) G190
                                         (COND
                                          ((|greater_SI| |i| |nsols|)
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ (LETT |j| 1 . #17#) G190
                                                (COND
                                                 ((|greater_SI| |j| |m|)
                                                  (GO G191)))
                                                (SEQ
                                                 (SPADCALL |ov| |k1| |k|
                                                           (QREFELT $ 32))
                                                 (LETT |k1| (+ |k1| 1) . #17#)
                                                 (LETT |mm|
                                                       (SPADCALL |ve| |j|
                                                                 (QREFELT $
                                                                          29))
                                                       . #17#)
                                                 (LETT |cp|
                                                       (SPADCALL |bm| |i| |j|
                                                                 (QREFELT $
                                                                          54))
                                                       . #17#)
                                                 (EXIT
                                                  (SEQ (LETT |l| 0 . #17#) G190
                                                       (COND
                                                        ((|greater_SI| |l|
                                                                       |mm|)
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |cpl|
                                                              (ELT_U32 |cp|
                                                                       |l|)
                                                              . #17#)
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |cpl| 0
                                                                     (QREFELT $
                                                                              45))
                                                           (SEQ
                                                            (SETELT_U32 |cv|
                                                                        |k|
                                                                        |cpl|)
                                                            (SETELT_U32 |ev|
                                                                        |k|
                                                                        |l|)
                                                            (EXIT
                                                             (LETT |k|
                                                                   (+ |k| 1)
                                                                   . #17#)))))))
                                                       (LETT |l| (|inc_SI| |l|)
                                                             . #17#)
                                                       (GO G190) G191
                                                       (EXIT NIL))))
                                                (LETT |j| (|inc_SI| |j|)
                                                      . #17#)
                                                (GO G190) G191 (EXIT NIL))))
                                         (LETT |i| (|inc_SI| |i|) . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |ncv|
                                          (GETREFV_U32
                                           (PROG1 (LETT #10# |k| . #17#)
                                             (|check_subtype2| (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                           0)
                                          . #17#)
                                    (LETT |nev|
                                          (GETREFV_U32
                                           (PROG1 (LETT #8# |k| . #17#)
                                             (|check_subtype2| (>= #8# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #8#))
                                           0)
                                          . #17#)
                                    (SEQ (LETT |i| 0 . #17#)
                                         (LETT #6# (- |k| 1) . #17#) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (SETELT_U32 |ncv| |i|
                                                      (ELT_U32 |cv| |i|))
                                          (EXIT
                                           (SETELT_U32 |nev| |i|
                                                       (ELT_U32 |ev| |i|))))
                                         (LETT |i| (|inc_SI| |i|) . #17#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (PROGN
                                      (LETT #5#
                                            (CONS 0
                                                  (VECTOR |va| |civ| |m| |ov|
                                                          |nev| |ncv|))
                                            . #17#)
                                      (GO #18#)))))))))))))
                  (#19#
                   (SEQ
                    (LETT |ngv0p|
                          (|IMODHP;eval2s| |gvl| |pt| (|SPADfirst| |vars|)
                           |pss1| $)
                          . #17#)
                    (EXIT
                     (COND
                      ((QEQCAR |ngv0p| 1)
                       (PROGN (LETT #5# (CONS 1 "failed") . #17#) (GO #18#)))
                      (#19#
                       (SEQ (LETT |ngvl| (QCDR |ngv0p|) . #17#)
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (|IMODHP;do_poly_modular| (CDR |vars|)
                                     |ngvl| |pss| |gen| $)
                                    . #17#)
                              (GO #18#)))))))))))))
          #18# (EXIT #5#)))) 

(SDEFUN |IMODHP;do_poly_modular|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray|
           (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                     (|:| |denom| (|Polynomial| (|Integer|))))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|))
          (|:| |points| #1=(|U32Vector|)) (|:| |pss_qvar| (|Symbol|))
          (|:| |pss_qval| (|Integer|)) (|:| |pss_kind| (|Symbol|))
          (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| #2=(|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               (|Record| (|:| |prime| #3=(|Integer|))
                         (|:| |eval1coeffbuf| (|U32Vector|))
                         (|:| |eval1expbuf| (|SortedExponentVector|)))))
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
         ((#4=#:G397 NIL)
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
          (#5=#:G400 NIL) (|j| NIL) (|hi| #6=(|Integer|)) (|lo| #6#)
          (|invc| (|Integer|)) (#7=#:G396 NIL) (|ok| #8=(|Boolean|))
          (|nofi| #6#) (|ofi| #6#) (|ofin| #9=(|Integer|)) (|cnum| #6#)
          (|i| (|Integer|)) (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #10=(|List| (|Integer|))) (#11=#:G399 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #10#) (|dl| (|List| (|List| (|Integer|))))
          (|good_cnt| #12=(|Integer|)) (|all_bad| (|Boolean|)) (|nsols| #9#)
          (|bad_cnt| #12#) (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| (|Vector| (|Integer|)))
          (|nexps| (|SortedExponentVector|)) (|civ| (|Vector| (|Integer|)))
          (|va| (|Vector| (|Integer|)))
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
          (|qn| (|Integer|)) (#13=#:G398 NIL) (|k| NIL) (|pts| #1#)
          (|npt| (|Integer|)) (|lpt| (|List| (|Integer|))) (|pt| (|Integer|))
          (|nvars| (|NonNegativeInteger|)) (|m| #2#) (|p| #3#)
          (|update_qval| (|Boolean|)) (|update_points| #8#))
         (SEQ
          (EXIT
           (SEQ (LETT |lpt| NIL . #14=(|IMODHP;do_poly_modular|))
                (LETT |bad_cnt| 0 . #14#) (LETT |good_cnt| 0 . #14#)
                (LETT |exps| (GETREFV_U32 0 0) . #14#)
                (LETT |offsets| (MAKE-ARRAY 0) . #14#)
                (LETT |all_bad| 'T . #14#)
                (LETT |update_points|
                      (COND
                       ((EQUAL (QVELT |pss| 5) '|qshiftHP|)
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T 'NIL))
                      . #14#)
                (LETT |update_qval|
                      (COND
                       ((OR (EQUAL (QVELT |pss| 5) '|qshiftHP|)
                            (OR (EQUAL (QVELT |pss| 5) '|qdiffHP|)
                                (EQUAL (QVELT |pss| 5) '|qmixed|)))
                        (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                       ('T 'NIL))
                      . #14#)
                (LETT |p| (QVELT (QVELT |pss| 10) 0) . #14#)
                (LETT |m| (QVELT |pss| 8) . #14#)
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
                                (SEQ (LETT |pt| (RANDOM |p|) . #14#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |pt| |lpt| (QREFELT $ 55))
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |lpt| (CONS |pt| |lpt|) . #14#)
                                         (EXIT (LETT |ok| 'T . #14#)))))))
                                (LETT |k| (|inc_SI| |k|) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((EQL
                              (SPADCALL (LETT |npt| (LENGTH |lpt|) . #14#) 100
                                        (QREFELT $ 56))
                              0)
                             (SEQ
                              (SPADCALL "Number of evaluation points"
                                        (QREFELT $ 59))
                              (EXIT
                               (SPADCALL (SPADCALL |npt| (QREFELT $ 60))
                                         (QREFELT $ 59))))))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ
                               (COND
                                (|update_points|
                                 (SEQ (LETT |pts| (QVELT |pss| 2) . #14#)
                                      (LETT |qn| 1 . #14#)
                                      (EXIT
                                       (SEQ (LETT |k| 0 . #14#)
                                            (LETT #13# (- (QVELT |pss| 1) 1)
                                                  . #14#)
                                            G190
                                            (COND
                                             ((|greater_SI| |k| #13#)
                                              (GO G191)))
                                            (SEQ (SETELT_U32 |pts| |k| |qn|)
                                                 (EXIT
                                                  (LETT |qn|
                                                        (SPADCALL (* |pt| |qn|)
                                                                  |p|
                                                                  (QREFELT $
                                                                           56))
                                                        . #14#)))
                                            (LETT |k| (|inc_SI| |k|) . #14#)
                                            (GO G190) G191 (EXIT NIL))))))
                               (COND (|update_qval| (QSETVELT |pss| 4 |pt|)))
                               (LETT |pprp|
                                     (|IMODHP;eval_and_solve| |pt| |vars| |gvl|
                                      |pss| |gen| $)
                                     . #14#)
                               (EXIT
                                (COND
                                 ((QEQCAR |pprp| 2)
                                  (PROGN
                                   (LETT #4# (CONS 2 "no_solution") . #14#)
                                   (GO #15=#:G395)))
                                 ((QEQCAR |pprp| 1)
                                  (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1) . #14#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |bad_cnt| (+ |good_cnt| 2)
                                                    (QREFELT $ 46))
                                          (PROGN
                                           (LETT #4# (CONS 1 "failed") . #14#)
                                           (GO #15#)))
                                         ('T "iterate")))))
                                 ('T
                                  (SEQ (LETT |ppr| (QCDR |pprp|) . #14#)
                                       (LETT |va| (QVELT |ppr| 0) . #14#)
                                       (LETT |civ| (QVELT |ppr| 1) . #14#)
                                       (LETT |nexps| (QVELT |ppr| 4) . #14#)
                                       (LETT |noffsets| (QVELT |ppr| 3) . #14#)
                                       (LETT |coeffs| (QVELT |ppr| 5) . #14#)
                                       (LETT |chk_ress|
                                             (|IMODHP;check_defects| |va| |civ|
                                              |pss| $)
                                             . #14#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |chk_ress| 1)
                                          (SEQ
                                           (LETT |bad_cnt| (+ |bad_cnt| 1)
                                                 . #14#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |bad_cnt|
                                                        (+ |good_cnt| 2)
                                                        (QREFELT $ 46))
                                              (PROGN
                                               (LETT #4# (CONS 1 "failed")
                                                     . #14#)
                                               (GO #15#)))
                                             ('T "iterate")))))
                                         ('T
                                          (SEQ
                                           (COND
                                            ((QEQCAR |chk_ress| 2)
                                             (LETT |all_bad| 'T . #14#)))
                                           (COND
                                            (|all_bad|
                                             (SEQ
                                              (LETT |nsols| (QVSIZE |va|)
                                                    . #14#)
                                              (QSETVELT |pss| 9 |nsols|)
                                              (QSETVELT |pss| 6 |va|)
                                              (QSETVELT |pss| 7 |civ|)
                                              (LETT |exps| |nexps| . #14#)
                                              (LETT |offsets| |noffsets|
                                                    . #14#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL
                                                      (QV_LEN_U32 |coeffs|) |p|
                                                      (QREFELT $ 62))
                                                     . #14#)))))
                                           (LETT |all_bad| 'NIL . #14#)
                                           (LETT |good_cnt| (+ |good_cnt| 1)
                                                 . #14#)
                                           (LETT |dl|
                                                 (SPADCALL |nvars| |offsets|
                                                           |exps| |noffsets|
                                                           |nexps|
                                                           (QREFELT $ 49))
                                                 . #14#)
                                           (LETT |odl|
                                                 (SPADCALL |dl| 1
                                                           (QREFELT $ 63))
                                                 . #14#)
                                           (LETT |ndl|
                                                 (SPADCALL |dl| 2
                                                           (QREFELT $ 63))
                                                 . #14#)
                                           (COND
                                            ((SPADCALL |odl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |oer|
                                                    (SPADCALL |nvars| |odl|
                                                              |ndl| |offsets|
                                                              |exps| |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 52))
                                                    . #14#)
                                              (LETT |offsets| (QCAR |oer|)
                                                    . #14#)
                                              (LETT |exps| (QCDR |oer|) . #14#)
                                              (LETT |ncc|
                                                    (QUOTIENT2
                                                     (QV_LEN_U32 |exps|)
                                                     |nvars|)
                                                    . #14#)
                                              (EXIT
                                               (LETT |rstate|
                                                     (SPADCALL |ncc| |p|
                                                               (QREFELT $ 62))
                                                     . #14#)))))
                                           (COND
                                            ((SPADCALL |ndl| NIL
                                                       (QREFELT $ 64))
                                             (SEQ
                                              (LETT |n0| (QV_LEN_U32 |coeffs|)
                                                    . #14#)
                                              (LETT |nn| (LENGTH |ndl|) . #14#)
                                              (LETT |n1| (+ |n0| |nn|) . #14#)
                                              (LETT |ncoeffs|
                                                    (GETREFV_U32 |n1| 0)
                                                    . #14#)
                                              (LETT |i| 0 . #14#)
                                              (LETT |jl| (|SPADfirst| |ndl|)
                                                    . #14#)
                                              (SEQ (LETT |j| 0 . #14#)
                                                   (LETT #11# (- |n1| 1)
                                                         . #14#)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |j| #11#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (COND
                                                      ((EQL |j| |jl|)
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j| 0)
                                                        (LETT |ndl| (CDR |ndl|)
                                                              . #14#)
                                                        (EXIT
                                                         (LETT |jl|
                                                               (COND
                                                                ((NULL |ndl|)
                                                                 |n1|)
                                                                ('T
                                                                 (|SPADfirst|
                                                                  |ndl|)))
                                                               . #14#))))
                                                      ('T
                                                       (SEQ
                                                        (SETELT_U32 |ncoeffs|
                                                                    |j|
                                                                    (ELT_U32
                                                                     |coeffs|
                                                                     |i|))
                                                        (EXIT
                                                         (LETT |i| (+ |i| 1)
                                                               . #14#)))))))
                                                   (LETT |j| (|inc_SI| |j|)
                                                         . #14#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |coeffs| |ncoeffs|
                                                     . #14#)))))
                                           (LETT |block_offsets|
                                                 (|IMODHP;compute_blocks|
                                                  |offsets| |m| |nsols| $)
                                                 . #14#)
                                           (LETT |n1| (QV_LEN_U32 |coeffs|)
                                                 . #14#)
                                           (LETT |ok| 'T . #14#)
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |i| 1 . #14#) G190
                                                  (COND
                                                   ((|greater_SI| |i| |nsols|)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |cnum|
                                                         (SPADCALL |civ| |i|
                                                                   (QREFELT $
                                                                            29))
                                                         . #14#)
                                                   (LETT |ofin|
                                                         (+ (* |m| (- |i| 1))
                                                            |cnum|)
                                                         . #14#)
                                                   (LETT |ofi|
                                                         (SPADCALL |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            29))
                                                         . #14#)
                                                   (LETT |nofi|
                                                         (COND
                                                          ((OR (< |i| |nsols|)
                                                               (< |cnum| |m|))
                                                           (SPADCALL |offsets|
                                                                     (+ |ofin|
                                                                        1)
                                                                     (QREFELT $
                                                                              29)))
                                                          ('T |n1|))
                                                         . #14#)
                                                   (LETT |nofi| (- |nofi| 1)
                                                         . #14#)
                                                   (EXIT
                                                    (COND
                                                     ((< |nofi| |ofi|)
                                                      (SEQ
                                                       (SPADCALL
                                                        (SPADCALL |civ|
                                                                  (QREFELT $
                                                                           65))
                                                        (QREFELT $ 59))
                                                       (SPADCALL
                                                        (SPADCALL |offsets|
                                                                  (QREFELT $
                                                                           65))
                                                        (QREFELT $ 59))
                                                       (EXIT
                                                        (|error|
                                                         "Internal error: corrupted offsets 1"))))
                                                     ((EQL
                                                       (ELT_U32 |coeffs|
                                                                |nofi|)
                                                       0)
                                                      (SEQ
                                                       (LETT |ok| 'NIL . #14#)
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #7# |$NoValue|
                                                               . #14#)
                                                         (GO #16=#:G382)))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |invc|
                                                             (SPADCALL
                                                              (ELT_U32 |coeffs|
                                                                       |nofi|)
                                                              |p|
                                                              (QREFELT $ 66))
                                                             . #14#)
                                                       (LETT |lo|
                                                             (SPADCALL
                                                              |block_offsets|
                                                              |i|
                                                              (QREFELT $ 29))
                                                             . #14#)
                                                       (LETT |hi|
                                                             (COND
                                                              ((< |i| |nsols|)
                                                               (SPADCALL
                                                                |block_offsets|
                                                                (+ |i| 1)
                                                                (QREFELT $
                                                                         29)))
                                                              ('T |n1|))
                                                             . #14#)
                                                       (EXIT
                                                        (SEQ
                                                         (LETT |j| |lo| . #14#)
                                                         (LETT #5# (- |hi| 1)
                                                               . #14#)
                                                         G190
                                                         (COND
                                                          ((> |j| #5#)
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
                                                               . #14#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #14#)
                                                  (GO G190) G191 (EXIT NIL)))
                                            #16# (EXIT #7#))
                                           (EXIT
                                            (COND
                                             (|ok|
                                              (SEQ
                                               (SPADCALL |coeffs| |pt| |rstate|
                                                         (QREFELT $ 67))
                                               (LETT |pp|
                                                     (SPADCALL |rstate| |nvars|
                                                               |block_offsets|
                                                               |offsets| |exps|
                                                               (QREFELT $ 70))
                                                     . #14#)
                                               (EXIT
                                                (COND
                                                 ((QEQCAR |pp| 1) "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |rr| (QCDR |pp|)
                                                         . #14#)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #4#
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
                                                           . #14#)
                                                     (GO #15#)))))))))
                                             ('T "iterate")))))))))))))
                             ('T (|error| "Run out of evaluation points")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #15# (EXIT #4#)))) 

(SDEFUN |IMODHP;do_poly_integer0|
        ((|vars| |List| (|Symbol|))
         (|gvl| |List|
          (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|)))))
         (|pss| |Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
          (|:| |pss_sigma| (|NonNegativeInteger|)) (|:| |points| (|U32Vector|))
          (|:| |pss_qvar| (|Symbol|)) (|:| |pss_qval| (|Integer|))
          (|:| |pss_kind| (|Symbol|)) (|:| |oldva| (|Vector| (|Integer|)))
          (|:| |oldciv| (|Vector| (|Integer|))) (|:| |pss_m| #1=(|Integer|))
          (|:| |sol_cnt| (|Integer|))
          (|:| |pss1|
               #2=(|Record| (|:| |prime| (|Integer|))
                            (|:| |eval1coeffbuf| (|U32Vector|))
                            (|:| |eval1expbuf| (|SortedExponentVector|)))))
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
         ((#3=#:G444 NIL)
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#4=#:G446 NIL) (|j| NIL) (|hi| #5=(|Integer|)) (|lo| #5#)
          (|invc| (|Integer|)) (#6=#:G443 NIL) (|ok| (|Boolean|)) (|nofi| #5#)
          (|ofi| #5#) (|ofin| #7=(|Integer|)) (|cnum| #5#) (|i| (|Integer|))
          (|n1| (|NonNegativeInteger|))
          (|block_offsets| (|Vector| (|Integer|))) (|coeffs| (|U32Vector|))
          (|jl| (|Integer|)) (|ndl| #8=(|List| (|Integer|))) (#9=#:G445 NIL)
          (|ncoeffs| (|U32Vector|)) (|nn| (|NonNegativeInteger|))
          (|n0| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|))
          (|ncc| (|NonNegativeInteger|)) (|exps| (|SortedExponentVector|))
          (|offsets| (|Vector| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|odl| #8#) (|dl| (|List| (|List| (|Integer|))))
          (|all_bad| (|Boolean|)) (|nsols| #7#)
          (|chk_ress| (|Union| "OK" "failed" "all_bad"))
          (|noffsets| (|Vector| (|Integer|)))
          (|nexps| (|SortedExponentVector|)) (|civ| (|Vector| (|Integer|)))
          (|va| (|Vector| (|Integer|)))
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
          (|ngvl|
           (|List|
            (|PrimitiveArray|
             (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                       (|:| |denom| (|Polynomial| (|Integer|)))))))
          (|ngv0p|
           (|Union|
            (|List|
             (|PrimitiveArray|
              (|Record| (|:| |numer| (|Polynomial| (|Integer|)))
                        (|:| |denom| (|Polynomial| (|Integer|))))))
            "failed"))
          (|lp| (|List| (|Integer|))) (|p| (|Integer|)) (|k| NIL)
          (|nvars| (|NonNegativeInteger|)) (|m| #1#) (|pss1| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL . #10=(|IMODHP;do_poly_integer0|))
                (LETT |exps| (GETREFV_U32 0 0) . #10#)
                (LETT |offsets| (MAKE-ARRAY 0) . #10#)
                (LETT |all_bad| 'T . #10#)
                (LETT |pss1| (QVELT |pss| 10) . #10#) (LETT |p| 16 . #10#)
                (LETT |m| (QVELT |pss| 8) . #10#)
                (LETT |nvars| (LENGTH |vars|) . #10#)
                (LETT |nsols| (+ |m| 1) . #10#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ok| 'NIL . #10#)
                           (SEQ (LETT |k| 1 . #10#) G190
                                (COND
                                 ((OR (|greater_SI| |k| 100)
                                      (NULL (COND (|ok| 'NIL) ('T 'T))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |p|
                                       (SPADCALL (+ (RANDOM 200000) 200000)
                                                 (QREFELT $ 72))
                                       . #10#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| |lp| (QREFELT $ 55))
                                    "iterate")
                                   ('T
                                    (SEQ (LETT |lp| (CONS |p| |lp|) . #10#)
                                         (EXIT (LETT |ok| 'T . #10#)))))))
                                (LETT |k| (|inc_SI| |k|) . #10#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             (|ok|
                              (SEQ (QSETVELT |pss1| 0 |p|)
                                   (LETT |ngv0p| (|IMODHP;eval3s| |gvl| |p| $)
                                         . #10#)
                                   (EXIT
                                    (COND ((QEQCAR |ngv0p| 1) "iterate")
                                          ('T
                                           (SEQ
                                            (LETT |ngvl| (QCDR |ngv0p|) . #10#)
                                            (LETT |pprp|
                                                  (|IMODHP;do_poly_modular|
                                                   |vars| |ngvl| |pss| |gen| $)
                                                  . #10#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |pprp| 2)
                                               (PROGN
                                                (LETT #3#
                                                      (CONS 1 "no_solution")
                                                      . #10#)
                                                (GO #11=#:G442)))
                                              ((QEQCAR |pprp| 1) "iterate")
                                              ('T
                                               (SEQ
                                                (LETT |ppr| (QCDR |pprp|)
                                                      . #10#)
                                                (LETT |va| (QVELT |ppr| 0)
                                                      . #10#)
                                                (LETT |civ| (QVELT |ppr| 1)
                                                      . #10#)
                                                (LETT |nexps| (QVELT |ppr| 4)
                                                      . #10#)
                                                (LETT |noffsets|
                                                      (QVELT |ppr| 3) . #10#)
                                                (LETT |coeffs| (QVELT |ppr| 5)
                                                      . #10#)
                                                (LETT |chk_ress|
                                                      (|IMODHP;check_defects|
                                                       |va| |civ| |pss| $)
                                                      . #10#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |chk_ress| 1)
                                                   "iterate")
                                                  ('T
                                                   (SEQ
                                                    (COND
                                                     ((QEQCAR |chk_ress| 2)
                                                      (LETT |all_bad| 'T
                                                            . #10#)))
                                                    (COND
                                                     (|all_bad|
                                                      (SEQ
                                                       (LETT |nsols|
                                                             (QVSIZE |va|)
                                                             . #10#)
                                                       (QSETVELT |pss| 9
                                                                 |nsols|)
                                                       (QSETVELT |pss| 6 |va|)
                                                       (QSETVELT |pss| 7 |civ|)
                                                       (LETT |exps| |nexps|
                                                             . #10#)
                                                       (LETT |offsets|
                                                             |noffsets| . #10#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL
                                                               (QV_LEN_U32
                                                                |coeffs|)
                                                               (QREFELT $ 74))
                                                              . #10#)))))
                                                    (LETT |all_bad| 'NIL
                                                          . #10#)
                                                    (LETT |dl|
                                                          (SPADCALL
                                                           (+ |nvars| 1)
                                                           |offsets| |exps|
                                                           |noffsets| |nexps|
                                                           (QREFELT $ 49))
                                                          . #10#)
                                                    (LETT |odl|
                                                          (SPADCALL |dl| 1
                                                                    (QREFELT $
                                                                             63))
                                                          . #10#)
                                                    (LETT |ndl|
                                                          (SPADCALL |dl| 2
                                                                    (QREFELT $
                                                                             63))
                                                          . #10#)
                                                    (COND
                                                     ((SPADCALL |odl| NIL
                                                                (QREFELT $ 64))
                                                      (SEQ
                                                       (LETT |oer|
                                                             (SPADCALL
                                                              (+ |nvars| 1)
                                                              |odl| |ndl|
                                                              |offsets| |exps|
                                                              |noffsets|
                                                              |nexps|
                                                              (QREFELT $ 52))
                                                             . #10#)
                                                       (LETT |offsets|
                                                             (QCAR |oer|)
                                                             . #10#)
                                                       (LETT |exps|
                                                             (QCDR |oer|)
                                                             . #10#)
                                                       (LETT |ncc|
                                                             (QUOTIENT2
                                                              (QV_LEN_U32
                                                               |exps|)
                                                              (+ |nvars| 1))
                                                             . #10#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL |ncc|
                                                                        (QREFELT
                                                                         $ 74))
                                                              . #10#)))))
                                                    (COND
                                                     ((SPADCALL |ndl| NIL
                                                                (QREFELT $ 64))
                                                      (SEQ
                                                       (LETT |n0|
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             . #10#)
                                                       (LETT |nn|
                                                             (LENGTH |ndl|)
                                                             . #10#)
                                                       (LETT |n1| (+ |n0| |nn|)
                                                             . #10#)
                                                       (LETT |ncoeffs|
                                                             (GETREFV_U32 |n1|
                                                                          0)
                                                             . #10#)
                                                       (LETT |i| 0 . #10#)
                                                       (LETT |jl|
                                                             (|SPADfirst|
                                                              |ndl|)
                                                             . #10#)
                                                       (SEQ (LETT |j| 0 . #10#)
                                                            (LETT #9#
                                                                  (- |n1| 1)
                                                                  . #10#)
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
                                                                  |ncoeffs| |j|
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
                                                    (LETT |block_offsets|
                                                          (|IMODHP;compute_blocks|
                                                           |offsets| |m|
                                                           |nsols| $)
                                                          . #10#)
                                                    (LETT |n1|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #10#)
                                                    (LETT |ok| 'T . #10#)
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |i| 1 . #10#)
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
                                                                            29))
                                                                  . #10#)
                                                            (LETT |ofin|
                                                                  (+
                                                                   (* |m|
                                                                      (- |i|
                                                                         1))
                                                                   |cnum|)
                                                                  . #10#)
                                                            (LETT |ofi|
                                                                  (SPADCALL
                                                                   |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            29))
                                                                  . #10#)
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
                                                                              29)))
                                                                   ('T |n1|))
                                                                  . #10#)
                                                            (LETT |nofi|
                                                                  (- |nofi| 1)
                                                                  . #10#)
                                                            (EXIT
                                                             (COND
                                                              ((< |nofi| |ofi|)
                                                               (SEQ
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |civ|
                                                                  (QREFELT $
                                                                           65))
                                                                 (QREFELT $
                                                                          59))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |offsets|
                                                                  (QREFELT $
                                                                           65))
                                                                 (QREFELT $
                                                                          59))
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
                                                                      . #10#)
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #6#
                                                                        |$NoValue|
                                                                        . #10#)
                                                                  (GO
                                                                   #12=#:G430)))))
                                                              ('T
                                                               (SEQ
                                                                (LETT |invc|
                                                                      (SPADCALL
                                                                       (ELT_U32
                                                                        |coeffs|
                                                                        |nofi|)
                                                                       |p|
                                                                       (QREFELT
                                                                        $ 66))
                                                                      . #10#)
                                                                (LETT |lo|
                                                                      (SPADCALL
                                                                       |block_offsets|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 29))
                                                                      . #10#)
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
                                                                          29)))
                                                                       ('T
                                                                        |n1|))
                                                                      . #10#)
                                                                (EXIT
                                                                 (SEQ
                                                                  (LETT |j|
                                                                        |lo|
                                                                        . #10#)
                                                                  (LETT #4#
                                                                        (- |hi|
                                                                           1)
                                                                        . #10#)
                                                                  G190
                                                                  (COND
                                                                   ((> |j| #4#)
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
                                                                        . #10#)
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT
                                                                   NIL))))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #10#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                     #12# (EXIT #6#))
                                                    (EXIT
                                                     (COND
                                                      (|ok|
                                                       (SEQ
                                                        (SPADCALL |coeffs| |p|
                                                                  |rstate|
                                                                  (QREFELT $
                                                                           75))
                                                        (LETT |pp|
                                                              (SPADCALL
                                                               |rstate|
                                                               |block_offsets|
                                                               (QREFELT $ 77))
                                                              . #10#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |pp| 1)
                                                           "iterate")
                                                          ('T
                                                           (PROGN
                                                            (LETT #3#
                                                                  (CONS 0
                                                                        (VECTOR
                                                                         |va|
                                                                         |civ|
                                                                         |m|
                                                                         |offsets|
                                                                         |exps|
                                                                         (QCDR
                                                                          |pp|)))
                                                                  . #10#)
                                                            (GO #11#)))))))
                                                      ('T
                                                       "iterate")))))))))))))))))
                             ('T (|error| "Run out of primes")))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #11# (EXIT #3#)))) 

(SDEFUN |IMODHP;do_poly_integer;LLVNniUv2SMU;13|
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
         ((#1=#:G459 NIL)
          (|pss|
           (|Record| (|:| |degree_bounds| (|Vector| (|Integer|)))
                     (|:| |pss_sigma| (|NonNegativeInteger|))
                     (|:| |points| (|U32Vector|)) (|:| |pss_qvar| (|Symbol|))
                     (|:| |pss_qval| (|Integer|)) (|:| |pss_kind| (|Symbol|))
                     (|:| |oldva| (|Vector| (|Integer|)))
                     (|:| |oldciv| (|Vector| (|Integer|)))
                     (|:| |pss_m| (|Integer|)) (|:| |sol_cnt| (|Integer|))
                     (|:| |pss1|
                          (|Record| (|:| |prime| (|Integer|))
                                    (|:| |eval1coeffbuf| (|U32Vector|))
                                    (|:| |eval1expbuf|
                                         (|SortedExponentVector|))))))
          (|pss1|
           (|Record| (|:| |prime| (|Integer|))
                     (|:| |eval1coeffbuf| (|U32Vector|))
                     (|:| |eval1expbuf| (|SortedExponentVector|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pss1| (VECTOR 0 (GETREFV_U32 10 0) (GETREFV_U32 10 0))
                  . #2=(|IMODHP;do_poly_integer;LLVNniUv2SMU;13|))
            (LETT |pss|
                  (VECTOR |ve| |sigma| |pts| |qvar| 0 |kind| (MAKE-ARRAY 0)
                          (MAKE-ARRAY 0) (QVSIZE |ve|) (+ (QVSIZE |ve|) 1)
                          |pss1|)
                  . #2#)
            (EXIT
             (PROGN
              (LETT #1# (|IMODHP;do_poly_integer0| |vars| |gvl| |pss| |gen| $)
                    . #2#)
              (GO #3=#:G458)))))
          #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |InnerModularHermitePade;|)) 

(DEFUN |InnerModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G461)
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
          (LETT $ (GETREFV 84) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerModularHermitePade| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|InnerModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Polynomial| 6)
              (|Record| (|:| |prime| 6) (|:| |eval1coeffbuf| 27)
                        (|:| |eval1expbuf| 48))
              (|PolynomialEvaluationUtilities|) (0 . |eval1a|)
              (|SingleInteger|) (7 . |invmod|) (13 . |Zero|) (17 . |One|)
              (|Record| (|:| |numer| 7) (|:| |denom| 7)) (|Union| 15 '"failed")
              (|Symbol|) (21 . |eval1|) (|Fraction| 7) (29 . |modpreduction|)
              (|List| 33) (|Vector| 27) (|Vector| 6) (|NonNegativeInteger|)
              (|NaiveBeckermannLabahnModular|) (35 . |naiveBeckermannLabahn|)
              (|U32Vector|) (43 . |naiveBeckermannLabahnMultipoint|)
              (51 . |elt|) (57 . |elt|) (63 . |setelt!|) (70 . |setelt!|)
              (|Any|) (77 . |elt|) (|AnyFunctions1| 23) (83 . |retract|)
              (|AnyFunctions1| 22) (88 . |retract|)
              (|Record| (|:| |basis| 53) (|:| |defects| 23) (|:| |cinds| 23))
              (93 . |reduceBasis|) (|Union| 39 '"no_solution")
              |IMODHP;do_modular_solve;VVNniUvISU;5| (|Boolean|) (101 . <=)
              (107 . ~=) (113 . >) (|List| 51) (|SortedExponentVector|)
              |IMODHP;merge_exponents;IVSevVSevL;7|
              (|Record| (|:| |offsetdata| 23) (|:| |expdata| 48)) (|List| 6)
              |IMODHP;merge2;I2LVSevVSevR;8| (|TwoDimensionalArray| 27)
              (119 . |elt|) (126 . |member?|) (132 . |positiveRemainder|)
              (|Void|) (|OutputForm|) (138 . |print|) (143 . |coerce|)
              (|VectorModularReconstructor|) (148 . |empty|) (154 . |elt|)
              (160 . ~=) (166 . |coerce|) (171 . |invmod|)
              (177 . |chinese_update|)
              (|Record| (|:| |nvars| 6) (|:| |offsetdata| 23)
                        (|:| |expdata| 48) (|:| |coeffdata| 27))
              (|Union| 68 '"failed") (184 . |reconstruct|)
              (|IntegerPrimesPackage| 6) (193 . |nextPrime|)
              (|VectorIntegerReconstructor|) (198 . |empty|)
              (203 . |chinese_update|) (|Union| (|PrimitiveArray| 6) '"failed")
              (210 . |reconstruct|)
              (|Record| (|:| |defects| 23) (|:| |cinds| 23) (|:| |rowlen| 6)
                        (|:| |offsetdata| 23) (|:| |expdata| 48)
                        (|:| |coeffdata| (|PrimitiveArray| 6)))
              (|Union| 78 '"no_solution") (|List| 17)
              (|List| (|PrimitiveArray| 19)) (|Mapping| 22 (|List| 27) 6 6)
              |IMODHP;do_poly_integer;LLVNniUv2SMU;13|)
           '#(|merge_exponents| 216 |merge2| 225 |do_poly_integer| 236
              |do_modular_solve| 248)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 83
                                                 '(3 9 6 7 6 8 10 2 11 0 0 0 12
                                                   0 7 0 13 0 7 0 14 4 9 16 15
                                                   17 6 8 18 2 9 16 19 6 20 4
                                                   25 21 22 23 24 6 26 4 25 21
                                                   22 23 27 6 28 2 23 6 0 6 29
                                                   2 22 27 0 6 30 3 22 27 0 6
                                                   27 31 3 23 6 0 6 6 32 2 21
                                                   33 0 6 34 1 35 23 33 36 1 37
                                                   22 33 38 4 25 39 22 23 23 6
                                                   40 2 6 43 0 0 44 2 6 43 0 0
                                                   45 2 6 43 0 0 46 3 53 27 0 6
                                                   6 54 2 51 43 6 0 55 2 6 0 0
                                                   0 56 1 58 57 0 59 1 6 58 0
                                                   60 2 61 0 6 6 62 2 47 51 0 6
                                                   63 2 51 43 0 0 64 1 23 58 0
                                                   65 2 6 0 0 0 66 3 61 57 27 6
                                                   0 67 5 61 69 0 6 23 23 48 70
                                                   1 71 6 6 72 1 73 0 6 74 3 73
                                                   57 27 6 0 75 2 73 76 0 23 77
                                                   5 0 47 6 23 48 23 48 49 7 0
                                                   50 6 51 51 23 48 23 48 52 8
                                                   0 79 80 81 23 24 27 17 17 82
                                                   83 6 0 41 22 23 24 27 6 17
                                                   42)))))
           '|lookupComplete|)) 

(MAKEPROP '|InnerModularHermitePade| 'NILADIC T) 
