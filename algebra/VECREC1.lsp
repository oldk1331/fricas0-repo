
(/VERSIONCHECK 2) 

(DEFUN |VECREC1;empty;2I$;1| (|npoly| |np| $)
  (PROG (|state| #1=#:G147 |i| |polyvec| #2=#:G142)
    (RETURN
     (SEQ
      (LETT |polyvec|
            (MAKEARR1
             (PROG1 (LETT #2# |npoly| . #3=(|VECREC1;empty;2I$;1|))
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (GETREFV_U32 0 0))
            . #3#)
      (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |npoly| 1) . #3#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |polyvec| |i| (GETREFV_U32 5 0))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |state|
            (VECTOR |np| (GETREFV_U32 5 0) 0 0 |npoly| 5 |polyvec| 3 1
                    (MAKE-ARRAY 0) (MAKE-ARRAY 0))
            . #3#)
      (SETELT_U32 (QVELT |state| 1) 0 1) (EXIT |state|))))) 

(DEFUN |VECREC1;add_slots;L$V;2| (|ndl| |statearg| $)
  (PROG (|j| |li| #1=#:G150 #2=#:G159 |i| |nvec| |npoly| |n1| |n0| |m|
         |polyvec| |state|)
    (RETURN
     (SEQ (LETT |state| |statearg| . #3=(|VECREC1;add_slots;L$V;2|))
          (LETT |polyvec| (QVELT |state| 6) . #3#)
          (LETT |m| (QVELT |state| 5) . #3#)
          (LETT |n0| (QVSIZE |polyvec|) . #3#) (LETT |n1| (LENGTH |ndl|) . #3#)
          (LETT |npoly| (+ |n0| |n1|) . #3#)
          (LETT |nvec| (MAKEARR1 |npoly| (GETREFV_U32 0 0)) . #3#)
          (LETT |li| (|SPADfirst| |ndl|) . #3#) (LETT |j| 0 . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- |npoly| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL |i| |li|)
                   (SEQ
                    (QSETAREF1 |nvec| |i|
                               (GETREFV_U32
                                (PROG1 (LETT #1# |m| . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                0))
                    (LETT |ndl| (CDR |ndl|) . #3#)
                    (EXIT
                     (LETT |li|
                           (COND ((NULL |ndl|) |npoly|)
                                 ('T (|SPADfirst| |ndl|)))
                           . #3#))))
                  ('T
                   (SEQ (QSETAREF1 |nvec| |i| (QAREF1 |polyvec| |j|))
                        (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (SPADCALL (QVELT |state| 9) (QREFELT $ 11)))
            (SEQ (QSETVELT |state| 9 (MAKEARR1 |npoly| (GETREFV_U32 0 0)))
                 (EXIT
                  (QSETVELT |state| 10
                            (MAKEARR1 |npoly| (GETREFV_U32 0 0)))))))
          (QSETVELT |state| 6 |polyvec|) (EXIT (QSETVELT |state| 4 |npoly|)))))) 

(DEFUN |VECREC1;double_poly_space| (|statearg| $)
  (PROG (|op| |np| #1=#:G161 #2=#:G167 |i| |n| |m| |polyvec| |state|)
    (RETURN
     (SEQ (LETT |state| |statearg| . #3=(|VECREC1;double_poly_space|))
          (LETT |polyvec| (QVELT |state| 6) . #3#)
          (LETT |m| (QVELT |state| 5) . #3#)
          (LETT |n| (SPADCALL 2 |m| (QREFELT $ 16)) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QVELT |state| 4) 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |np|
                      (GETREFV_U32
                       (PROG1 (LETT #1# |n| . #3#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       0)
                      . #3#)
                (LETT |op| (QAREF1 |polyvec| |i|) . #3#)
                (SPADCALL |np| |op| |m| (QREFELT $ 19))
                (EXIT (QSETAREF1 |polyvec| |i| |np|)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (QSETVELT |state| 5 |n|)))))) 

(DEFUN |VECREC1;chinese_update;UvI$V;4| (|vec| |pt| |statearg| $)
  (PROG (|mtvec| |nmt| #1=#:G173 |cor| |pol| #2=#:G179 |i| |nn| |polyvec|
         |mtcor| |mtval| |p| |npt1| |npt| |state|)
    (RETURN
     (SEQ (LETT |state| |statearg| . #3=(|VECREC1;chinese_update;UvI$V;4|))
          (LETT |mtvec| (QVELT |state| 1) . #3#)
          (LETT |npt| (QVELT |state| 3) . #3#) (LETT |npt1| (+ |npt| 1) . #3#)
          (LETT |p| (QVELT |state| 0) . #3#)
          (LETT |mtval| (SPADCALL |mtvec| |npt| |pt| |p| (QREFELT $ 20)) . #3#)
          (EXIT
           (COND ((EQL |mtval| 0) (|error| "Duplicate point in update"))
                 ('T
                  (SEQ
                   (LETT |mtcor| (SPADCALL |mtval| |p| (QREFELT $ 21)) . #3#)
                   (QSETVELT |state| 3 |npt1|)
                   (COND
                    ((SPADCALL |npt1| (QVELT |state| 5) (QREFELT $ 22))
                     (|VECREC1;double_poly_space| |statearg| $)))
                   (LETT |polyvec| (QVELT |state| 6) . #3#)
                   (LETT |nn| (- |npt| 1) . #3#)
                   (SEQ (LETT |i| 0 . #3#)
                        (LETT #2# (- (QVELT |state| 4) 1) . #3#) G190
                        (COND ((|greater_SI| |i| #2#) (GO G191)))
                        (SEQ (LETT |pol| (QAREF1 |polyvec| |i|) . #3#)
                             (LETT |cor|
                                   (- (ELT_U32 |vec| |i|)
                                      (SPADCALL |pol| |nn| |pt| |p|
                                                (QREFELT $ 20)))
                                   . #3#)
                             (LETT |cor|
                                   (COND ((< |cor| 0) (+ |cor| |p|))
                                         ('T |cor|))
                                   . #3#)
                             (LETT |cor|
                                   (SPADCALL (* |cor| |mtcor|) |p|
                                             (QREFELT $ 23))
                                   . #3#)
                             (EXIT
                              (SPADCALL |pol| |mtvec| 0 |npt| |cor| |p|
                                        (QREFELT $ 24))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (COND
                    ((< (QV_LEN_U32 |mtvec|) (+ |npt1| 1))
                     (SEQ
                      (LETT |nmt|
                            (GETREFV_U32
                             (SPADCALL 2
                                       (PROG1 (LETT #1# |npt1| . #3#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (QREFELT $ 26))
                             0)
                            . #3#)
                      (SPADCALL |nmt| |mtvec| |npt1| (QREFELT $ 19))
                      (EXIT (LETT |mtvec| |nmt| . #3#)))))
                   (SPADCALL |mtvec| (+ |npt1| 1) (- |p| |pt|) |p|
                             (QREFELT $ 27))
                   (EXIT (QSETVELT |state| 1 |mtvec|)))))))))) 

(DEFUN |VECREC1;rational_reconstruction;2Uv2IU;5| (|x| |y| |i| |p| $)
  (PROG (|c| |ds1| |s1| |ds0| |s0| |tmp| |tmpp| |dr1| |r1| |dr0| |r0| |ds0a|
         #1=#:G186 |c0| |c1| |delta| |j|)
    (RETURN
     (SEQ
      (LETT |j| (SPADCALL |y| (QREFELT $ 29))
            . #2=(|VECREC1;rational_reconstruction;2Uv2IU;5|))
      (LETT |r0| (GETREFV_U32 (+ |j| 1) 0) . #2#)
      (SPADCALL |r0| |y| (+ |j| 1) (QREFELT $ 19)) (LETT |dr0| |j| . #2#)
      (LETT |s0| (GETREFV_U32 (+ |j| 1) 0) . #2#) (LETT |ds0| 0 . #2#)
      (LETT |r1| (GETREFV_U32 (+ |j| 1) 0) . #2#)
      (LETT |dr1| (SPADCALL |x| (QREFELT $ 29)) . #2#)
      (SPADCALL |r1| |x| (+ |dr1| 1) (QREFELT $ 19))
      (LETT |s1| (GETREFV_U32 (+ |j| 1) 0) . #2#) (SETELT_U32 |s1| 0 1)
      (LETT |ds1| 0 . #2#)
      (SEQ G190 (COND ((NULL (SPADCALL |dr1| |i| (QREFELT $ 22))) (GO G191)))
           (SEQ
            (SEQ G190 (COND ((NULL (>= |dr0| |dr1|)) (GO G191)))
                 (SEQ (LETT |delta| (- |dr0| |dr1|) . #2#)
                      (LETT |c1| (- |p| (ELT_U32 |r0| |dr0|)) . #2#)
                      (LETT |c0| (ELT_U32 |r1| |dr1|) . #2#)
                      (SETELT_U32 |r0| |dr0| 0) (LETT |dr0| (- |dr0| 1) . #2#)
                      (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta| |p|
                                (QREFELT $ 30))
                      (SEQ
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL (EQL (ELT_U32 |r0| |dr0|) 0)) (GO G191)))
                             (SEQ (LETT |dr0| (- |dr0| 1) . #2#)
                                  (EXIT
                                   (COND
                                    ((< |dr0| 0)
                                     (PROGN
                                      (LETT #1# |$NoValue| . #2#)
                                      (GO #1#))))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #1# (EXIT #1#))
                      (LETT |ds0a| (+ |ds1| |delta|) . #2#)
                      (LETT |ds0a|
                            (COND
                             ((SPADCALL |ds0| |ds0a| (QREFELT $ 22)) |ds0|)
                             ('T |ds0a|))
                            . #2#)
                      (SPADCALL |s0| |c0| |s1| |c1| |ds0a| |delta| |p|
                                (QREFELT $ 30))
                      (EXIT
                       (LETT |ds0|
                             (COND
                              ((SPADCALL |ds0| |ds0a| (QREFELT $ 22)) |ds0|)
                              ((< |ds0| |ds0a|) |ds0a|)
                              ('T
                               (SEQ
                                (SEQ G190
                                     (COND
                                      ((NULL (EQL (ELT_U32 |s0| |ds0a|) 0))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT |ds0a| (- |ds0a| 1) . #2#)))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT |ds0a|))))
                             . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |tmpp| |r0| . #2#) (LETT |tmp| |dr0| . #2#)
            (LETT |r0| |r1| . #2#) (LETT |dr0| |dr1| . #2#)
            (LETT |r1| |tmpp| . #2#) (LETT |dr1| |tmp| . #2#)
            (LETT |tmpp| |s0| . #2#) (LETT |tmp| |ds0| . #2#)
            (LETT |s0| |s1| . #2#) (LETT |ds0| |ds1| . #2#)
            (LETT |s1| |tmpp| . #2#) (EXIT (LETT |ds1| |tmp| . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((OR (SPADCALL |ds1| (- (- |j| |i|) 2) (QREFELT $ 22))
             (SPADCALL
              (SPADCALL (SPADCALL |s1| |y| |p| (QREFELT $ 31)) (QREFELT $ 29))
              0 (QREFELT $ 32)))
         (CONS 1 "failed"))
        ('T
         (SEQ (LETT |c| (ELT_U32 |s1| |ds1|) . #2#)
              (LETT |c| (SPADCALL |c| |p| (QREFELT $ 21)) . #2#)
              (SPADCALL |r1| |dr1| |c| |p| (QREFELT $ 33))
              (SPADCALL |s1| |ds1| |c| |p| (QREFELT $ 33))
              (EXIT (CONS 0 (CONS |r1| |s1|))))))))))) 

(DEFUN |VECREC1;rational_reconstruction;$U;6| (|statearg| $)
  (PROG (#1=#:G231 |cden| |ppr| |pp| |rp| |deg_r1| |r1| |j| |dens| |nums|
         #2=#:G212 #3=#:G210 |n| |ok| |bound| |m| |j0| |p| |polyvec| |modulus|
         |state|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |state| |statearg| . #4=(|VECREC1;rational_reconstruction;$U;6|))
        (LETT |modulus| (QVELT |state| 1) . #4#)
        (LETT |polyvec| (QVELT |state| 6) . #4#)
        (LETT |p| (QVELT |state| 0) . #4#) (LETT |j0| (QVELT |state| 2) . #4#)
        (LETT |m| (QVELT |state| 3) . #4#)
        (EXIT
         (COND
          ((SPADCALL |m| (QVELT |state| 7) (QREFELT $ 37))
           (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#)))
          (#5='T
           (SEQ (QSETVELT |state| 7 (+ (QVELT |state| 7) (QVELT |state| 8)))
                (COND
                 ((SPADCALL |m| 30 (QREFELT $ 22))
                  (QSETVELT |state| 8
                            (+ (QVELT |state| 8)
                               (COND ((SPADCALL |m| 200 (QREFELT $ 22)) 4)
                                     (#5# 1))))))
                (LETT |bound| (QUOTIENT2 |m| 2) . #4#) (LETT |ok| 'T . #4#)
                (LETT |pp|
                      (SPADCALL (QAREF1 |polyvec| |j0|) |modulus| |bound| |p|
                                (QREFELT $ 36))
                      . #4#)
                (EXIT
                 (COND ((QEQCAR |pp| 1) (CONS 1 "failed"))
                       (#5#
                        (SEQ (LETT |n| (QVELT |state| 4) . #4#)
                             (COND
                              ((SPADCALL (QVELT |state| 9) (QREFELT $ 11))
                               (SEQ
                                (QSETVELT |state| 9
                                          (MAKEARR1
                                           (PROG1 (LETT #3# |n| . #4#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           (GETREFV_U32 0 0)))
                                (EXIT
                                 (QSETVELT |state| 10
                                           (MAKEARR1
                                            (PROG1 (LETT #2# |n| . #4#)
                                              (|check_subtype| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               #2#))
                                            (GETREFV_U32 0 0)))))))
                             (LETT |nums| (QVELT |state| 9) . #4#)
                             (LETT |dens| (QVELT |state| 10) . #4#)
                             (LETT |ppr| (QCDR |pp|) . #4#)
                             (QSETAREF1 |nums| |j0| (QCAR |ppr|))
                             (QSETAREF1 |dens| |j0| (QCDR |ppr|))
                             (LETT |cden| (QCDR |ppr|) . #4#)
                             (LETT |j| |j0| . #4#)
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ (LETT |j| (+ |j| 1) . #4#)
                                        (COND
                                         ((>= |j| |n|)
                                          (LETT |j| (- |j| |n|) . #4#)))
                                        (EXIT
                                         (COND
                                          ((EQL |j| |j0|)
                                           (PROGN
                                            (LETT #1#
                                                  (CONS 0 (CONS |nums| |dens|))
                                                  . #4#)
                                            (GO #1#)))
                                          ('T
                                           (SEQ
                                            (LETT |r1| (QAREF1 |polyvec| |j|)
                                                  . #4#)
                                            (LETT |r1|
                                                  (SPADCALL |r1| |cden| |p|
                                                            (QREFELT $ 38))
                                                  . #4#)
                                            (SPADCALL |r1| |modulus| |p|
                                                      (QREFELT $ 39))
                                            (LETT |deg_r1|
                                                  (SPADCALL |r1|
                                                            (QREFELT $ 29))
                                                  . #4#)
                                            (EXIT
                                             (COND
                                              ((< |deg_r1| |bound|)
                                               (SEQ
                                                (LETT |rp|
                                                      (GETREFV_U32
                                                       (+ |deg_r1| 1) 0)
                                                      . #4#)
                                                (SPADCALL |rp| |r1|
                                                          (+ |deg_r1| 1)
                                                          (QREFELT $ 19))
                                                (QSETAREF1 |nums| |j| |rp|)
                                                (EXIT
                                                 (QSETAREF1 |dens| |j|
                                                            |cden|))))
                                              ('T
                                               (SEQ
                                                (LETT |pp|
                                                      (SPADCALL |r1| |modulus|
                                                                |bound| |p|
                                                                (QREFELT $ 36))
                                                      . #4#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |pp| 1)
                                                   (SEQ
                                                    (QSETVELT |state| 2 |j|)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 1 "failed")
                                                            . #4#)
                                                      (GO #1#)))))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ppr| (QCDR |pp|)
                                                          . #4#)
                                                    (LETT |cden|
                                                          (SPADCALL |cden|
                                                                    (QCDR
                                                                     |ppr|)
                                                                    |p|
                                                                    (QREFELT $
                                                                             38))
                                                          . #4#)
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL
                                                        (SPADCALL |cden|
                                                                  (QREFELT $
                                                                           29))
                                                        |bound| (QREFELT $ 22))
                                                       (SEQ
                                                        (QSETVELT |state| 2
                                                                  |j|)
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #1#
                                                                (CONS 1
                                                                      "failed")
                                                                . #4#)
                                                          (GO #1#)))))
                                                      ('T
                                                       (SEQ
                                                        (QSETAREF1 |nums| |j|
                                                                   (QCAR
                                                                    |ppr|))
                                                        (EXIT
                                                         (QSETAREF1 |dens| |j|
                                                                    |cden|)))))))))))))))))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |VECREC1;repack_polys;IVSevPaR;7|
       (|var_cnt| |poly_offsets| |exps| |coeffs| $)
  (PROG (|i| |oei| |nei| |oei0| |i1| |nm| |cij| #1=#:G254 |j| |k| |ci| |opi|
         |pi| #2=#:G253 |npo| |pi_cnt| |ncoeffs| |nexps| |nnvars| |m| #3=#:G252
         #4=#:G251 |n|)
    (RETURN
     (SEQ (LETT |m| 0 . #5=(|VECREC1;repack_polys;IVSevPaR;7|))
          (LETT |n| (QVSIZE |coeffs|) . #5#)
          (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |n| 1) . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ (LETT |ci| (QAREF1 |coeffs| |i|) . #5#)
                    (LETT |k| (QV_LEN_U32 |ci|) . #5#)
                    (EXIT
                     (SEQ (LETT |j| 0 . #5#) (LETT #3# (- |k| 1) . #5#) G190
                          (COND ((|greater_SI| |j| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL (ELT_U32 |ci| |j|) 0 (QREFELT $ 32))
                              (LETT |m| (+ |m| 1) . #5#)))))
                          (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |nnvars| (+ |var_cnt| 1) . #5#)
          (LETT |nexps| (GETREFV_U32 (* |m| |nnvars|) 0) . #5#)
          (LETT |ncoeffs| (GETREFV_U32 |m| 0) . #5#)
          (LETT |pi_cnt| (QVSIZE |poly_offsets|) . #5#)
          (LETT |npo| (MAKEARR1 |pi_cnt| 0) . #5#) (LETT |pi| 1 . #5#)
          (LETT |opi| (SPADCALL |poly_offsets| |pi| (QREFELT $ 44)) . #5#)
          (LETT |nm| 0 . #5#) (LETT |oei| 0 . #5#) (LETT |nei| 0 . #5#)
          (SEQ (LETT |i| 0 . #5#) (LETT #2# (- |n| 1) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (SEQ G190 (COND ((NULL (EQL |opi| |i|)) (GO G191)))
                     (SEQ (SPADCALL |npo| |pi| |nm| (QREFELT $ 45))
                          (LETT |pi| (+ |pi| 1) . #5#)
                          (EXIT
                           (LETT |opi|
                                 (COND
                                  ((SPADCALL |pi| |pi_cnt| (QREFELT $ 37))
                                   (LETT |opi|
                                         (SPADCALL |poly_offsets| |pi|
                                                   (QREFELT $ 44))
                                         . #5#))
                                  ('T -1))
                                 . #5#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |ci| (QAREF1 |coeffs| |i|) . #5#)
                (LETT |k| (QV_LEN_U32 |ci|) . #5#)
                (SEQ (LETT |j| 0 . #5#) (LETT #1# (- |k| 1) . #5#) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ (LETT |cij| (ELT_U32 |ci| |j|) . #5#)
                          (EXIT
                           (COND
                            ((SPADCALL |cij| 0 (QREFELT $ 32))
                             (SEQ (SETELT_U32 |ncoeffs| |nm| |cij|)
                                  (LETT |nm| (|add_SI| |nm| 1) . #5#)
                                  (LETT |oei0| |oei| . #5#)
                                  (SEQ (LETT |i1| 1 . #5#) G190
                                       (COND
                                        ((|greater_SI| |i1| |var_cnt|)
                                         (GO G191)))
                                       (SEQ
                                        (SETELT_U32 |nexps| |nei|
                                                    (ELT_U32 |exps| |oei0|))
                                        (LETT |nei| (|add_SI| |nei| 1) . #5#)
                                        (EXIT
                                         (LETT |oei0| (|add_SI| |oei0| 1)
                                               . #5#)))
                                       (LETT |i1| (|inc_SI| |i1|) . #5#)
                                       (GO G190) G191 (EXIT NIL))
                                  (SETELT_U32 |nexps| |nei| |j|)
                                  (EXIT
                                   (LETT |nei| (|add_SI| |nei| 1) . #5#)))))))
                     (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |oei| (|add_SI| |oei| |var_cnt|) . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| |pi| . #5#) G190 (COND ((> |i| |pi_cnt|) (GO G191)))
               (SEQ (EXIT (SPADCALL |npo| |i| |nm| (QREFELT $ 45))))
               (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |nnvars| |npo| |nexps| |ncoeffs|)))))) 

(DEFUN |VECREC1;remove_denoms;V2PaIPa;8| (|block_offsets| |nums| |dens| |p| $)
  (PROG (|dt| |j| |tmpp2| |tmpp1| |dtmp| |dresi| |resi| |i| |dcf| |cfactor|
         |dcden| |cden| |hi| |li| |ib| |res| |np| |nb|)
    (RETURN
     (SEQ
      (LETT |nb| (QVSIZE |block_offsets|)
            . #1=(|VECREC1;remove_denoms;V2PaIPa;8|))
      (LETT |np| (QVSIZE |nums|) . #1#)
      (LETT |res| (MAKEARR1 |np| (GETREFV_U32 0 0)) . #1#)
      (SEQ (LETT |ib| 1 . #1#) G190 (COND ((|greater_SI| |ib| |nb|) (GO G191)))
           (SEQ
            (LETT |li| (SPADCALL |block_offsets| |ib| (QREFELT $ 44)) . #1#)
            (LETT |hi|
                  (COND ((EQL |ib| |nb|) |np|)
                        ('T
                         (SPADCALL |block_offsets| (+ |ib| 1) (QREFELT $ 44))))
                  . #1#)
            (LETT |hi| (- |hi| 1) . #1#)
            (LETT |cden| (SPADCALL |dens| |li| |hi| |p| (QREFELT $ 49)) . #1#)
            (LETT |dcden| (SPADCALL |cden| (QREFELT $ 29)) . #1#)
            (LETT |tmpp1| (GETREFV_U32 (+ |dcden| 1) 0) . #1#)
            (LETT |tmpp2| (GETREFV_U32 (+ |dcden| 1) 0) . #1#)
            (SEQ (LETT |i| |li| . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
                 (SEQ (SPADCALL |tmpp1| |cden| (+ |dcden| 1) (QREFELT $ 19))
                      (SEQ (LETT |j| 0 . #1#) G190
                           (COND ((|greater_SI| |j| |dcden|) (GO G191)))
                           (SEQ (EXIT (SETELT_U32 |tmpp2| |j| 0)))
                           (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (SPADCALL |tmpp1| (QAREF1 |dens| |i|) |tmpp2| |p|
                                (QREFELT $ 50))
                      (LETT |dt| (SPADCALL |tmpp2| (QREFELT $ 29)) . #1#)
                      (EXIT
                       (QSETAREF1 |res| |i|
                                  (COND
                                   ((SPADCALL |dt| 0 (QREFELT $ 22))
                                    (SPADCALL |tmpp2| (QAREF1 |nums| |i|) |p|
                                              (QREFELT $ 38)))
                                   ('T
                                    (SEQ
                                     (COND
                                      ((EQL |dt| 0)
                                       (COND
                                        ((SPADCALL (ELT_U32 |tmpp2| 0) 1
                                                   (QREFELT $ 32))
                                         (EXIT
                                          (|error|
                                           "remove_denoms expect quotient to be 1"))))))
                                     (EXIT (QAREF1 |nums| |i|))))))))
                 (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
            (LETT |cfactor| (SPADCALL |res| |li| |hi| |p| (QREFELT $ 51))
                  . #1#)
            (LETT |dcf| (SPADCALL |cfactor| (QREFELT $ 29)) . #1#)
            (LETT |dtmp| |dcden| . #1#)
            (EXIT
             (COND
              ((>= |dcf| 1)
               (SEQ (LETT |i| |li| . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
                    (SEQ (LETT |resi| (QAREF1 |res| |i|) . #1#)
                         (LETT |dresi| (SPADCALL |resi| (QREFELT $ 29)) . #1#)
                         (COND
                          ((SPADCALL |dresi| |dtmp| (QREFELT $ 22))
                           (SEQ (LETT |dtmp| |dresi| . #1#)
                                (LETT |tmpp1| (GETREFV_U32 (+ |dtmp| 1) 0)
                                      . #1#)
                                (EXIT
                                 (LETT |tmpp2| (GETREFV_U32 (+ |dtmp| 1) 0)
                                       . #1#))))
                          ('T
                           (SEQ (LETT |j| 0 . #1#) G190
                                (COND ((|greater_SI| |j| |dtmp|) (GO G191)))
                                (SEQ (EXIT (SETELT_U32 |tmpp2| |j| 0)))
                                (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                                (EXIT NIL))))
                         (SPADCALL |tmpp1| |resi| (+ |dresi| 1) (QREFELT $ 19))
                         (SPADCALL |tmpp1| |cfactor| |tmpp2| |p|
                                   (QREFELT $ 50))
                         (LETT |dt| (SPADCALL |tmpp2| (QREFELT $ 29)) . #1#)
                         (QSETAREF1 |res| |i| (GETREFV_U32 (+ |dt| 1) 0))
                         (EXIT
                          (SPADCALL (QAREF1 |res| |i|) |tmpp2| (+ |dt| 1)
                                    (QREFELT $ 19))))
                    (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))))))
           (LETT |ib| (|inc_SI| |ib|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |VECREC1;reconstruct;I2VSev2PaIR;9|
       (|var_cnt| |block_offsets| |poly_offsets| |exps| |nums| |dens| |p| $)
  (PROG (|ppa|)
    (RETURN
     (SEQ
      (LETT |ppa| (SPADCALL |block_offsets| |nums| |dens| |p| (QREFELT $ 52))
            |VECREC1;reconstruct;I2VSev2PaIR;9|)
      (EXIT (SPADCALL |var_cnt| |poly_offsets| |exps| |ppa| (QREFELT $ 48))))))) 

(DEFUN |VECREC1;reconstruct;$I2VSevU;10|
       (|statearg| |var_cnt| |block_offsets| |poly_offsets| |exps| $)
  (PROG (|ppr| |state| #1=#:G285 |pp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pp| (SPADCALL |statearg| (QREFELT $ 42))
              . #2=(|VECREC1;reconstruct;$I2VSevU;10|))
        (EXIT
         (COND
          ((QEQCAR |pp| 1) (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
          ('T
           (SEQ (LETT |state| |statearg| . #2#) (LETT |ppr| (QCDR |pp|) . #2#)
                (EXIT
                 (CONS 0
                       (SPADCALL |var_cnt| |block_offsets| |poly_offsets|
                                 |exps| (QCAR |ppr|) (QCDR |ppr|)
                                 (QVELT |state| 0) (QREFELT $ 53))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |VectorModularReconstructor| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G287)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|VectorModularReconstructor|)
                . #2=(|VectorModularReconstructor|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|VectorModularReconstructor|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|VectorModularReconstructor;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|VectorModularReconstructor|))))))))))) 

(DEFUN |VectorModularReconstructor;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|VectorModularReconstructor|)
            . #1=(|VectorModularReconstructor|))
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|VectorModularReconstructor| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |prime| (|Integer|)) (|:| |lpol| (|U32Vector|))
                          (|:| |curj| (|Integer|)) (|:| |npoints| (|Integer|))
                          (|:| |npolys| (|Integer|)) (|:| |palloc| (|Integer|))
                          (|:| |polys| (|PrimitiveArray| (|U32Vector|)))
                          (|:| |next_rec| (|Integer|))
                          (|:| |rec_step| (|Integer|))
                          (|:| |numers| (|PrimitiveArray| (|U32Vector|)))
                          (|:| |denoms| (|PrimitiveArray| (|U32Vector|)))))
      $)))) 

(MAKEPROP '|VectorModularReconstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) |VECREC1;empty;2I$;1|
              (|Boolean|) (|PrimitiveArray| 17) (0 . |empty?|) (|Void|)
              (|List| 7) |VECREC1;add_slots;L$V;2| (|PositiveInteger|) (5 . *)
              (|U32Vector|) (|U32VectorPolynomialOperations|)
              (11 . |copy_first|) (18 . |eval_at|) (26 . |invmod|) (32 . >)
              (38 . |positiveRemainder|) (44 . |vector_add_mul|)
              (|NonNegativeInteger|) (54 . *) (60 . |mul_by_binomial|)
              |VECREC1;chinese_update;UvI$V;4| (68 . |degree|)
              (73 . |vector_combination|) (84 . |gcd|) (91 . ~=)
              (97 . |mul_by_scalar|)
              (|Record| (|:| |numer| 17) (|:| |denom| 17))
              (|Union| 34 '"failed") |VECREC1;rational_reconstruction;2Uv2IU;5|
              (105 . <=) (111 . |mul|) (118 . |remainder!|)
              (|Record| (|:| |numers| 10) (|:| |denoms| 10))
              (|Union| 40 '"failed") |VECREC1;rational_reconstruction;$U;6|
              (|Vector| 7) (125 . |elt|) (131 . |setelt|)
              (|Record| (|:| |nvars| 7) (|:| |offsetdata| 43)
                        (|:| |expdata| 47) (|:| |coeffdata| 17))
              (|SortedExponentVector|) |VECREC1;repack_polys;IVSevPaR;7|
              (138 . |lcm|) (146 . |divide!|) (154 . |gcd|)
              |VECREC1;remove_denoms;V2PaIPa;8|
              |VECREC1;reconstruct;I2VSev2PaIR;9| (|Union| 46 '"failed")
              |VECREC1;reconstruct;$I2VSevU;10|)
           '#(|repack_polys| 162 |remove_denoms| 170 |reconstruct| 178
              |rational_reconstruction| 198 |empty| 211 |chinese_update| 217
              |add_slots| 224)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(1 10 9 0 11 2 7 0 15 0 16 3
                                                   18 12 17 17 7 19 4 18 7 17 7
                                                   7 7 20 2 7 0 0 0 21 2 7 9 0
                                                   0 22 2 7 0 0 0 23 6 18 12 17
                                                   17 7 7 7 7 24 2 25 0 15 0 26
                                                   4 18 12 17 7 7 7 27 1 18 7
                                                   17 29 7 18 12 17 7 17 7 7 7
                                                   7 30 3 18 17 17 17 7 31 2 7
                                                   9 0 0 32 4 18 12 17 7 7 7 33
                                                   2 7 9 0 0 37 3 18 17 17 17 7
                                                   38 3 18 12 17 17 7 39 2 43 7
                                                   0 7 44 3 43 7 0 7 7 45 4 18
                                                   17 10 7 7 7 49 4 18 12 17 17
                                                   17 7 50 4 18 17 10 7 7 7 51
                                                   4 0 46 7 43 47 10 48 4 0 10
                                                   43 10 10 7 52 5 0 54 0 7 43
                                                   43 47 55 7 0 46 7 43 43 47
                                                   10 10 7 53 1 0 41 0 42 4 0
                                                   35 17 17 7 7 36 2 0 0 7 7 8
                                                   3 0 12 17 7 0 28 2 0 12 13 0
                                                   14)))))
           '|lookupComplete|)) 

(MAKEPROP '|VectorModularReconstructor| 'NILADIC T) 
