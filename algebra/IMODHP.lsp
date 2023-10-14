
(/VERSIONCHECK 2) 

(DEFUN |IMODHP;eval1a| (|pol| |pt| |pss| $)
  (PROG (|res| |pk| |ptk| |ki| |j| |i| |t1| |n| |exps| |nexps| |coeffs|
         |ncoeffs| |nn| #1=#:G182 |t0| |ns| |polu| #2=#:G181 |polr| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p| (QVELT |pss| 5) . #3=(|IMODHP;eval1a|))
            (LETT |polr| |pol| . #3#)
            (EXIT
             (COND
              ((QEQCAR |polr| 0)
               (PROGN (LETT #2# (QCDR |polr|) . #3#) (GO #2#)))
              ('T
               (SEQ (LETT |polu| (QCDR (QCDR |polr|)) . #3#) (LETT |i| 0 . #3#)
                    (LETT |coeffs| (QVELT |pss| 11) . #3#)
                    (LETT |exps| (QVELT |pss| 12) . #3#)
                    (LETT |n| (QV_LEN_U32 |coeffs|) . #3#)
                    (LETT |ns| |n| . #3#)
                    (SEQ (LETT |t0| NIL . #3#) (LETT #1# |polu| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t0| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((>= |i| |n|)
                            (SEQ
                             (LETT |nn| (SPADCALL 2 |n| (QREFELT $ 8)) . #3#)
                             (LETT |ncoeffs| (GETREFV_U32 |nn| 0) . #3#)
                             (SPADCALL |ncoeffs| |coeffs| |n| (QREFELT $ 13))
                             (LETT |coeffs| |ncoeffs| . #3#)
                             (QSETVELT |pss| 11 |coeffs|)
                             (LETT |nexps| (GETREFV_U32 |nn| 0) . #3#)
                             (SPADCALL |nexps| |exps| |n| (QREFELT $ 13))
                             (LETT |exps| |nexps| . #3#)
                             (QSETVELT |pss| 12 |exps|)
                             (EXIT (LETT |n| |nn| . #3#)))))
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
                              (SEQ G190 (COND ((NULL (< |pk| |ki|)) (GO G191)))
                                   (SEQ
                                    (LETT |ptk| (QSMULMOD32 |ptk| |pt| |p|)
                                          . #3#)
                                    (EXIT (LETT |pk| (+ |pk| 1) . #3#)))
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

(DEFUN |IMODHP;eval1s| (|gvl| |pt| |var| |pss| $)
  (PROG (|resl| |nlc| |dms| #1=#:G193 |dm| |nm| |nlcq| #2=#:G195 |j| |ress| |n|
         #3=#:G194 |gv0| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p| (QVELT |pss| 5) . #4=(|IMODHP;eval1s|))
            (LETT |resl| NIL . #4#)
            (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                      (LETT |ress| (GETREFV_U32 |n| 0) . #4#)
                      (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                (LETT |nm|
                                      (|IMODHP;eval1a|
                                       (SPADCALL |nlcq| (QREFELT $ 16)) |pt|
                                       |pss| $)
                                      . #4#)
                                (LETT |dm|
                                      (|IMODHP;eval1a|
                                       (SPADCALL |nlcq| (QREFELT $ 17)) |pt|
                                       |pss| $)
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((EQL |dm| 0)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #4#)
                                    (GO #1#)))
                                  ('T
                                   (SEQ (LETT |dms| |dm| . #4#)
                                        (LETT |nlc|
                                              (QSMULMOD32 |nm|
                                                          (SPADCALL |dms| |p|
                                                                    (QREFELT $
                                                                             19))
                                                          |p|)
                                              . #4#)
                                        (EXIT
                                         (SETELT_U32 |ress| |j| |nlc|)))))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |resl|)))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;modpreduction;PIP;3| (|x| |p| $)
  (PROG (|xr| |yu| |c1| |c0| |t1| #1=#:G214 |t0| |xu| |vx|)
    (RETURN
     (SEQ (LETT |xr| |x| . #2=(|IMODHP;modpreduction;PIP;3|))
          (EXIT
           (COND
            ((QEQCAR |xr| 0)
             (SEQ (LETT |c0| (SPADCALL (QCDR |xr|) |p| (QREFELT $ 20)) . #2#)
                  (LETT |xr| (CONS 0 |c0|) . #2#) (EXIT (SETF |xr| |xr|))))
            (#3='T
             (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #2#)
                  (LETT |xu| (QCDR (QCDR |xr|)) . #2#) (LETT |yu| NIL . #2#)
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
                                      (SPADCALL (QCDR |t1|) |p| (QREFELT $ 20))
                                      . #2#)
                                (EXIT
                                 (COND ((EQL |c0| 0) 0)
                                       ('T
                                        (SEQ (LETT |xr| (CONS 0 |c0|) . #2#)
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
                                      (SPADCALL (QCDR |t0|) |p| (QREFELT $ 22))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |c1| (|spadConstant| $ 21)
                                             (QREFELT $ 24))
                                   0)
                                  ('T
                                   (LETT |yu|
                                         (CONS (CONS (QCAR |t0|) |c1|) |yu|)
                                         . #2#)))))))))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (LETT |xr|
                        (COND ((SPADCALL |yu| NIL (QREFELT $ 27)) (CONS 0 0))
                              (#3# (CONS 1 (CONS |vx| (NREVERSE |yu|)))))
                        . #2#)
                  (EXIT (SETF |xr| |xr|)))))))))) 

(DEFUN |IMODHP;modpeval;PLL2I;4| (|x| |vars| |pts| |p| $)
  (PROG (|res| |c0| |kk| |ptk| |kk1| |t1| #1=#:G228 |t0| |xu| |yu| |vxval|
         #2=#:G227 |vx| |xr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |xr| |x| . #3=(|IMODHP;modpeval;PLL2I;4|))
            (EXIT
             (COND
              ((QEQCAR |xr| 0)
               (PROGN
                (LETT #2# (SPADCALL (QCDR |xr|) |p| (QREFELT $ 20)) . #3#)
                (GO #2#)))
              (#4='T
               (SEQ (LETT |vx| (QCAR (QCDR |xr|)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |vx| (|SPADfirst| |vars|) (QREFELT $ 29))
                       (PROGN
                        (LETT #2#
                              (SPADCALL |x| (CDR |vars|) (CDR |pts|) |p|
                                        (QREFELT $ 32))
                              . #3#)
                        (GO #2#)))
                      (#4#
                       (SEQ (LETT |vxval| (|SPADfirst| |pts|) . #3#)
                            (LETT |vars| (CDR |vars|) . #3#)
                            (LETT |pts| (CDR |pts|) . #3#)
                            (LETT |xu| (QCDR (QCDR |xr|)) . #3#)
                            (LETT |yu| NIL . #3#) (LETT |ptk| 1 . #3#)
                            (LETT |kk| 0 . #3#) (LETT |res| 0 . #3#)
                            (LETT |xu| (REVERSE |xu|) . #3#)
                            (SEQ (LETT |t0| NIL . #3#) (LETT #1# |xu| . #3#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t0| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |t1| (QCDR |t0|) . #3#)
                                      (LETT |kk1| (QCAR |t0|) . #3#)
                                      (SEQ G190
                                           (COND
                                            ((NULL (< |kk| |kk1|)) (GO G191)))
                                           (SEQ
                                            (LETT |ptk|
                                                  (QSMULMOD32 |vxval| |ptk|
                                                              |p|)
                                                  . #3#)
                                            (EXIT
                                             (LETT |kk| (+ |kk| 1) . #3#)))
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
                                            . #3#)
                                      (EXIT
                                       (LETT |res|
                                             (QSMULADDMOD64-32 |ptk| |c0| |res|
                                                               |p|)
                                             . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |IMODHP;eval2s| (|gvl| |pt| |var| |p| $)
  (PROG (|resl| #1=#:G237 |dm| |nm| |dmp| |nmp| |nlcq| #2=#:G239 |j| |pts|
         |vars| |ress| |n| #3=#:G238 |gv0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval2s|))
            (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                      (LETT |ress| (MAKEARR1 |n| (|spadConstant| $ 33)) . #4#)
                      (LETT |vars| (LIST |var|) . #4#)
                      (LETT |pts| (LIST |pt|) . #4#)
                      (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                (LETT |nmp|
                                      (SPADCALL
                                       (SPADCALL |nlcq| (QREFELT $ 16)) |vars|
                                       |pts| (QREFELT $ 34))
                                      . #4#)
                                (LETT |dmp|
                                      (SPADCALL
                                       (SPADCALL |nlcq| (QREFELT $ 17)) |vars|
                                       |pts| (QREFELT $ 34))
                                      . #4#)
                                (LETT |nm| (SPADCALL |nmp| |p| (QREFELT $ 22))
                                      . #4#)
                                (LETT |dm| (SPADCALL |dmp| |p| (QREFELT $ 22))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |dm| (|spadConstant| $ 21)
                                             (QREFELT $ 24))
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #4#)
                                    (GO #1#)))
                                  ('T
                                   (QSETAREF1 |ress| |j|
                                              (SPADCALL |nm| |dm|
                                                        (QREFELT $ 35)))))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |resl|)))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;eval3s| (|gvl| |p| $)
  (PROG (|resl| #1=#:G245 |dm| |nm| |dmp| |nmp| |nlcq| #2=#:G247 |j| |ress| |n|
         #3=#:G246 |gv0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |resl| NIL . #4=(|IMODHP;eval3s|))
            (SEQ (LETT |gv0| NIL . #4#) (LETT #3# |gvl| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |gv0| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |n| (QVSIZE |gv0|) . #4#)
                      (LETT |ress| (MAKEARR1 |n| (|spadConstant| $ 33)) . #4#)
                      (SEQ (LETT |j| 0 . #4#) (LETT #2# (- |n| 1) . #4#) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ (LETT |nlcq| (QAREF1 |gv0| |j|) . #4#)
                                (LETT |nmp| (SPADCALL |nlcq| (QREFELT $ 16))
                                      . #4#)
                                (LETT |dmp| (SPADCALL |nlcq| (QREFELT $ 17))
                                      . #4#)
                                (LETT |nm| (SPADCALL |nmp| |p| (QREFELT $ 22))
                                      . #4#)
                                (LETT |dm| (SPADCALL |dmp| |p| (QREFELT $ 22))
                                      . #4#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |dm| (|spadConstant| $ 21)
                                             (QREFELT $ 24))
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #4#)
                                    (GO #1#)))
                                  ('T
                                   (QSETAREF1 |ress| |j|
                                              (SPADCALL |nm| |dm|
                                                        (QREFELT $ 35)))))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |ress| |resl|) . #4#)))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |resl|)))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;do_modular_solve0| (|gv| |ve| |sigma| |pts| |prime| |kind| $)
  (COND
   ((OR (EQUAL |kind| '|diffHP|) (EQUAL |kind| '|qdiffHP|))
    (SPADCALL |gv| |ve| |sigma| |prime| (QREFELT $ 40)))
   ((OR (EQUAL |kind| '|shiftHP|)
        (OR (EQUAL |kind| '|qshiftHP|) (EQUAL |kind| '|qmixed|)))
    (SPADCALL |gv| |ve| |pts| |prime| (QREFELT $ 41)))
   ('T (|error| "kind must be diffHP, qdiffHP, shiftHP, qshiftHP or qmixed")))) 

(DEFUN |IMODHP;do_modular_solve;VVNniUvISU;8|
       (|gv| |ve| |sigma| |pts| |prime| |kind| $)
  (PROG (#1=#:G283 |j| #2=#:G274 |i| |cindk| |k| |nbas| |nr| |bas| |res| |bm|
         |dbm| |ok| |m2| |va| |dva| |blr| |nve| |ngv| |m1| |m0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |m0| (QVSIZE |ve|) . #3=(|IMODHP;do_modular_solve;VVNniUvISU;8|))
        (LETT |m1| 0 . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m0|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((>= (SPADCALL |ve| |i| (QREFELT $ 42)) 0)
                 (LETT |m1| (+ |m1| 1) . #3#)))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (COND
         ((< |m1| |m0|)
          (SEQ (LETT |ngv| (MAKEARR1 |m1| (GETREFV_U32 0 0)) . #3#)
               (LETT |nve| (MAKEARR1 |m1| 0) . #3#) (LETT |j| 1 . #3#)
               (EXIT
                (SEQ (LETT |i| 1 . #3#) G190
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
                          (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT NIL)))))
         (#4='T (SEQ (LETT |ngv| |gv| . #3#) (EXIT (LETT |nve| |ve| . #3#)))))
        (LETT |blr|
              (|IMODHP;do_modular_solve0| |ngv| |nve| |sigma| |pts| |prime|
               |kind| $)
              . #3#)
        (LETT |dva| (SPADCALL |blr| 3 (QREFELT $ 47)) . #3#)
        (LETT |va| (SPADCALL |dva| (QREFELT $ 49)) . #3#)
        (LETT |ok| 'NIL . #3#) (LETT |m2| (QVSIZE |va|) . #3#)
        (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m2|) (GO G191)))
             (SEQ
              (EXIT
               (LETT |ok|
                     (COND (|ok| 'T)
                           ('T (>= (SPADCALL |va| |i| (QREFELT $ 42)) 0)))
                     . #3#)))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND
          (|ok|
           (SEQ (LETT |dbm| (SPADCALL |blr| 1 (QREFELT $ 47)) . #3#)
                (LETT |bm| (SPADCALL |dbm| (QREFELT $ 51)) . #3#)
                (LETT |res| (SPADCALL |bm| |nve| |va| |prime| (QREFELT $ 53))
                      . #3#)
                (COND
                 ((< |m1| |m0|)
                  (SEQ (LETT |bas| (QVELT |res| 0) . #3#)
                       (LETT |nr| (ANROWS |bas|) . #3#)
                       (LETT |nbas| (MAKE_MATRIX1 |nr| |m0| (GETREFV_U32 0 0))
                             . #3#)
                       (LETT |j| 1 . #3#)
                       (SEQ (LETT |i| 1 . #3#) G190
                            (COND ((|greater_SI| |i| |m0|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((>= (SPADCALL |ve| |i| (QREFELT $ 42)) 0)
                                (SEQ
                                 (SEQ (LETT |k| 1 . #3#) G190
                                      (COND
                                       ((|greater_SI| |k| |nr|) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETAREF2O |nbas| |k| |i|
                                                    (QAREF2O |bas| |k| |j| 1 1)
                                                    1 1)))
                                      (LETT |k| (|inc_SI| |k|) . #3#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (QSETVELT |res| 0 |nbas|)
                       (EXIT
                        (SEQ (LETT |k| 1 . #3#) G190
                             (COND ((|greater_SI| |k| |nr|) (GO G191)))
                             (SEQ
                              (LETT |cindk|
                                    (SPADCALL (QVELT |res| 2) |k|
                                              (QREFELT $ 42))
                                    . #3#)
                              (LETT |j| 1 . #3#)
                              (EXIT
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |i| 1 . #3#) G190
                                      (COND
                                       ((|greater_SI| |i| |m0|) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((>=
                                           (SPADCALL |ve| |i| (QREFELT $ 42))
                                           0)
                                          (SEQ
                                           (COND
                                            ((EQL |j| |cindk|)
                                             (SEQ
                                              (SPADCALL (QVELT |res| 2) |k| |i|
                                                        (QREFELT $ 45))
                                              (EXIT
                                               (PROGN
                                                (LETT #2# |$NoValue| . #3#)
                                                (GO #2#))))))
                                           (EXIT
                                            (LETT |j| (+ |j| 1) . #3#)))))))
                                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                      G191 (EXIT NIL)))
                                #2# (EXIT #2#))))
                             (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                             (EXIT NIL))))))
                (EXIT (CONS 0 |res|))))
          (#4# (PROGN (LETT #1# (CONS 1 "no_solution") . #3#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;compute_blocks| (|offsets| |rowlen| |nsols| $)
  (PROG (|i| |block_offsets|)
    (RETURN
     (SEQ
      (LETT |block_offsets| (MAKEARR1 |nsols| 0)
            . #1=(|IMODHP;compute_blocks|))
      (SEQ (LETT |i| 1 . #1#) G190
           (COND ((|greater_SI| |i| |nsols|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |block_offsets| |i|
                       (SPADCALL |offsets| (+ (* (- |i| 1) |rowlen|) 1)
                                 (QREFELT $ 42))
                       (QREFELT $ 45))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |block_offsets|))))) 

(DEFUN |IMODHP;merge_exponents;IVSevVSevL;10|
       (|nvars| |offsets| |exps| |noffsets| |nexps| $)
  (PROG (|j0| |i0| |j| |i| |ci| #1=#:G307 |j0i| |ji| |jl| |i0i| |ii| |il| |k|
         |lj| |li| #2=#:G311 #3=#:G313 |jj| #4=#:G312 |kk| |nn| |oc| |m| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (QUOTIENT2 (QV_LEN_U32 |exps|) |nvars|)
              . #5=(|IMODHP;merge_exponents;IVSevVSevL;10|))
        (LETT |m| (QUOTIENT2 (QV_LEN_U32 |nexps|) |nvars|) . #5#)
        (LETT |oc| (QVSIZE |offsets|) . #5#) (LETT |i0| 0 . #5#)
        (LETT |j0| 0 . #5#) (LETT |ci| 0 . #5#) (LETT |i| 0 . #5#)
        (LETT |j| 0 . #5#) (LETT |li| 0 . #5#) (LETT |lj| 0 . #5#)
        (LETT |il| NIL . #5#) (LETT |jl| NIL . #5#) (LETT |kk| 1 . #5#)
        (LETT |nn| (- |nvars| 1) . #5#)
        (EXIT
         (SEQ G190 NIL
              (SEQ (LETT |i0i| 1 . #5#) (LETT |j0i| 1 . #5#)
                   (LETT |ii| |nvars| . #5#) (LETT |ji| |nvars| . #5#)
                   (COND
                    ((OR (EQL |i0| |li|) (EQL |j0| |lj|))
                     (EXIT
                      (SEQ (LETT |kk| (+ |kk| 1) . #5#)
                           (COND
                            ((< |i0| |li|)
                             (SEQ (LETT |jj| |i0| . #5#)
                                  (LETT #4# (- |li| 1) . #5#) G190
                                  (COND ((> |jj| #4#) (GO G191)))
                                  (SEQ (LETT |jl| (CONS |ci| |jl|) . #5#)
                                       (EXIT (LETT |ci| (+ |ci| 1) . #5#)))
                                  (LETT |jj| (+ |jj| 1) . #5#) (GO G190) G191
                                  (EXIT NIL))))
                           (COND
                            ((< |j0| |lj|)
                             (SEQ (LETT |jj| |j0| . #5#)
                                  (LETT #3# (- |lj| 1) . #5#) G190
                                  (COND ((> |jj| #3#) (GO G191)))
                                  (SEQ (LETT |il| (CONS |ci| |il|) . #5#)
                                       (EXIT (LETT |ci| (+ |ci| 1) . #5#)))
                                  (LETT |jj| (+ |jj| 1) . #5#) (GO G190) G191
                                  (EXIT NIL))))
                           (EXIT
                            (COND
                             ((EQL |li| |n|)
                              (PROGN
                               (LETT #2# (LIST (NREVERSE |il|) (NREVERSE |jl|))
                                     . #5#)
                               (GO #2#)))
                             ('T
                              (SEQ (LETT |i0| |li| . #5#)
                                   (LETT |j0| |lj| . #5#)
                                   (LETT |i| (* |i0| |nvars|) . #5#)
                                   (LETT |j| (* |j0| |nvars|) . #5#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |kk| |oc| (QREFELT $ 56))
                                      (SEQ
                                       (LETT |li|
                                             (SPADCALL |offsets| |kk|
                                                       (QREFELT $ 42))
                                             . #5#)
                                       (EXIT
                                        (LETT |lj|
                                              (SPADCALL |noffsets| |kk|
                                                        (QREFELT $ 42))
                                              . #5#))))
                                     ('T
                                      (SEQ (LETT |li| |n| . #5#)
                                           (EXIT
                                            (LETT |lj| |m| . #5#))))))))))))))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| 0 . #5#) G190
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
                                      ((SPADCALL (ELT_U32 |exps| (+ |i| |k|))
                                                 (ELT_U32 |nexps| (+ |j| |k|))
                                                 (QREFELT $ 58))
                                       (SEQ (LETT |il| (CONS |ci| |il|) . #5#)
                                            (LETT |ii| 0 . #5#)
                                            (LETT |i0i| 0 . #5#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #5#)
                                              (GO #1#)))))
                                      ('T
                                       (SEQ (LETT |jl| (CONS |ci| |jl|) . #5#)
                                            (LETT |ji| 0 . #5#)
                                            (LETT |j0i| 0 . #5#)
                                            (EXIT
                                             (PROGN
                                              (LETT #1# |$NoValue| . #5#)
                                              (GO #1#))))))
                                     . #5#)
                               (GO #1#))))))
                          (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                          (EXIT NIL)))
                    #1# (EXIT #1#))
                   (LETT |ci| (+ |ci| 1) . #5#) (LETT |i| (+ |i| |ii|) . #5#)
                   (LETT |j| (+ |j| |ji|) . #5#)
                   (LETT |i0| (+ |i0| |i0i|) . #5#)
                   (EXIT (LETT |j0| (+ |j0| |j0i|) . #5#)))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |IMODHP;merge2;I2LVSevVSevR;11|
       (|nvars| |odl| |ndl| |ov1| |exps1| |ov2| |exps2| $)
  (PROG (|i| |ci| |i00| |i0| |j0| |j| |k| |j00| |lj| |li| |kk| #1=#:G337 |ci0|
         |nv1| |noffsets| |m| |nexps| #2=#:G316 |nn1| |n1| |nn| |n0|)
    (RETURN
     (SEQ
      (LETT |n0| (QV_LEN_U32 |exps1|) . #3=(|IMODHP;merge2;I2LVSevVSevR;11|))
      (LETT |nn| (LENGTH |odl|) . #3#)
      (LETT |n1| (+ (QUOTIENT2 |n0| |nvars|) |nn|) . #3#)
      (LETT |nn1| (* |n1| |nvars|) . #3#)
      (LETT |nexps|
            (GETREFV_U32
             (PROG1 (LETT #2# |nn1| . #3#)
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             0)
            . #3#)
      (LETT |m| (QVSIZE |ov2|) . #3#) (LETT |noffsets| (MAKEARR1 |m| 0) . #3#)
      (LETT |nv1| (- |nvars| 1) . #3#) (LETT |i0| 0 . #3#) (LETT |j0| 0 . #3#)
      (LETT |ci0| 0 . #3#) (LETT |i| 0 . #3#) (LETT |j| 0 . #3#)
      (LETT |ci| 0 . #3#)
      (LETT |j00| (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|))) . #3#)
      (LETT |i00| (|SPADfirst| |odl|) . #3#)
      (LETT |li| (SPADCALL |ov1| 1 (QREFELT $ 42)) . #3#)
      (LETT |lj| (SPADCALL |ov2| 1 (QREFELT $ 42)) . #3#) (LETT |kk| 1 . #3#)
      (SEQ (LETT |ci0| 0 . #3#) (LETT #1# (- |n1| 1) . #3#) G190
           (COND ((|greater_SI| |ci0| #1#) (GO G191)))
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL (COND ((EQL |i0| |li|) (EQL |j0| |lj|)) ('T 'NIL)))
                   (GO G191)))
                 (SEQ (SPADCALL |noffsets| |kk| |ci0| (QREFELT $ 45))
                      (LETT |kk| (+ |kk| 1) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |kk| |m| (QREFELT $ 56))
                         (SEQ
                          (LETT |li| (SPADCALL |ov1| |kk| (QREFELT $ 42))
                                . #3#)
                          (EXIT
                           (LETT |lj| (SPADCALL |ov2| |kk| (QREFELT $ 42))
                                 . #3#))))
                        ('T
                         (SEQ (LETT |li| |n1| . #3#)
                              (EXIT (LETT |lj| |n1| . #3#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             ((EQL |ci0| |j00|)
              (SEQ
               (SEQ (LETT |k| 0 . #3#) G190
                    (COND ((|greater_SI| |k| |nv1|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT_U32 |nexps| (+ |ci| |k|)
                                  (ELT_U32 |exps1| (+ |i| |k|)))))
                    (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |ndl| (CDR |ndl|) . #3#)
               (EXIT
                (LETT |j00| (COND ((NULL |ndl|) |n1|) ('T (|SPADfirst| |ndl|)))
                      . #3#))))
             ('T
              (SEQ
               (SEQ (LETT |k| 0 . #3#) G190
                    (COND ((|greater_SI| |k| |nv1|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT_U32 |nexps| (+ |ci| |k|)
                                  (ELT_U32 |exps2| (+ |j| |k|)))))
                    (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |j| (+ |j| |nvars|) . #3#)
               (EXIT (LETT |j0| (+ |j0| 1) . #3#)))))
            (COND
             ((SPADCALL |ci0| |i00| (QREFELT $ 57))
              (SEQ (LETT |i| (+ |i| |nvars|) . #3#)
                   (EXIT (LETT |i0| (+ |i0| 1) . #3#))))
             ('T
              (SEQ (LETT |odl| (CDR |odl|) . #3#)
                   (EXIT
                    (LETT |i00|
                          (COND ((NULL |odl|) |n1|) ('T (|SPADfirst| |odl|)))
                          . #3#)))))
            (EXIT (LETT |ci| (+ |ci| |nvars|) . #3#)))
           (LETT |ci0| (|inc_SI| |ci0|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |i| |kk| . #3#) G190 (COND ((> |i| |m|) (GO G191)))
           (SEQ (EXIT (SPADCALL |noffsets| |i| |n1| (QREFELT $ 45))))
           (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |noffsets| |nexps|)))))) 

(DEFUN |IMODHP;check_defects| (|va| |civ| |pss| $)
  (PROG (#1=#:G355 #2=#:G351 |is_bad| |all_bad| |i| |ociv| |ova| |nsols|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nsols| (QVELT |pss| 10) . #3=(|IMODHP;check_defects|))
            (LETT |is_bad| (SPADCALL (QVSIZE |va|) |nsols| (QREFELT $ 58))
                  . #3#)
            (LETT |all_bad| (< (QVSIZE |va|) |nsols|) . #3#)
            (COND
             ((EQL (QVSIZE |va|) |nsols|)
              (SEQ (LETT |ova| (QVELT |pss| 7) . #3#)
                   (LETT |ociv| (QVELT |pss| 8) . #3#)
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| 1 . #3#) G190
                           (COND ((|greater_SI| |i| |nsols|) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((< (SPADCALL |va| |i| (QREFELT $ 42))
                                  (SPADCALL |ova| |i| (QREFELT $ 42)))
                               (SEQ (LETT |all_bad| 'T . #3#)
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |$NoValue| . #3#)
                                      (GO #2#)))))
                              ((SPADCALL (SPADCALL |va| |i| (QREFELT $ 42))
                                         (SPADCALL |ova| |i| (QREFELT $ 42))
                                         (QREFELT $ 58))
                               (SEQ (LETT |is_bad| 'T . #3#)
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |$NoValue| . #3#)
                                      (GO #2#)))))
                              ((< (SPADCALL |civ| |i| (QREFELT $ 42))
                                  (SPADCALL |ociv| |i| (QREFELT $ 42)))
                               (SEQ (LETT |all_bad| 'T . #3#)
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |$NoValue| . #3#)
                                      (GO #2#)))))
                              ((SPADCALL (SPADCALL |civ| |i| (QREFELT $ 42))
                                         (SPADCALL |ociv| |i| (QREFELT $ 42))
                                         (QREFELT $ 58))
                               (SEQ (LETT |is_bad| 'T . #3#)
                                    (EXIT
                                     (PROGN
                                      (LETT #2# |$NoValue| . #3#)
                                      (GO #2#))))))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #2# (EXIT #2#))))))
            (EXIT
             (COND
              (|is_bad| (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
              (|all_bad| (PROGN (LETT #1# (CONS 2 "all_bad") . #3#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 0 "OK") . #3#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;eval_and_solve;ILLRMU;13| (|pt| |vars| |gvl| |pss| |gen| $)
  (PROG (#1=#:G392 |ngvl| |ngv0p| #2=#:G393 |i| |nev| #3=#:G380 |ncv| #4=#:G378
         |k| |cpl| |l| |cp| |mm| |k1| |j| |ov| |ev| #5=#:G370 |cv| #6=#:G368
         |r_cnt| |m| |nsols| |civ| |va| |bm| |rblr| |blr| |ve| |ngv2| |ngv10|
         |ngv10p| |nvars| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p| (QVELT |pss| 5) . #7=(|IMODHP;eval_and_solve;ILLRMU;13|))
            (LETT |nvars| (LENGTH |vars|) . #7#)
            (EXIT
             (COND
              ((EQL |nvars| 1)
               (SEQ
                (LETT |ngv10p|
                      (|IMODHP;eval1s| |gvl| |pt| (|SPADfirst| |vars|) |pss| $)
                      . #7#)
                (EXIT
                 (COND
                  ((QEQCAR |ngv10p| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#)))
                  (#8='T
                   (SEQ (LETT |ngv10| (QCDR |ngv10p|) . #7#)
                        (LETT |ngv2|
                              (SPADCALL |ngv10| |p| (QVELT |pss| 4) |gen|)
                              . #7#)
                        (LETT |ve| (QVELT |pss| 0) . #7#)
                        (LETT |blr|
                              (SPADCALL |ngv2| |ve| (QVELT |pss| 1)
                                        (QVELT |pss| 2) |p| (QVELT |pss| 6)
                                        (QREFELT $ 55))
                              . #7#)
                        (EXIT
                         (COND
                          ((QEQCAR |blr| 1)
                           (PROGN
                            (LETT #1# (CONS 2 "no_solution") . #7#)
                            (GO #1#)))
                          (#8#
                           (SEQ (LETT |rblr| (QCDR |blr|) . #7#)
                                (LETT |bm| (QVELT |rblr| 0) . #7#)
                                (LETT |va| (QVELT |rblr| 1) . #7#)
                                (LETT |civ| (QVELT |rblr| 2) . #7#)
                                (LETT |nsols| (QVSIZE |va|) . #7#)
                                (LETT |r_cnt| 0 . #7#)
                                (LETT |m| (QVSIZE |ve|) . #7#)
                                (SEQ (LETT |j| 1 . #7#) G190
                                     (COND ((|greater_SI| |j| |m|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |r_cnt|
                                             (+
                                              (+ |r_cnt|
                                                 (SPADCALL |ve| |j|
                                                           (QREFELT $ 42)))
                                              1)
                                             . #7#)))
                                     (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |r_cnt| (* |r_cnt| |nsols|) . #7#)
                                (LETT |cv|
                                      (GETREFV_U32
                                       (PROG1 (LETT #6# |r_cnt| . #7#)
                                         (|check_subtype| (>= #6# 0)
                                                          '(|NonNegativeInteger|)
                                                          #6#))
                                       0)
                                      . #7#)
                                (LETT |ev|
                                      (GETREFV_U32
                                       (PROG1 (LETT #5# |r_cnt| . #7#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       0)
                                      . #7#)
                                (LETT |ov| (MAKEARR1 (* |nsols| |m|) 0) . #7#)
                                (LETT |k| 0 . #7#) (LETT |k1| 1 . #7#)
                                (SEQ (LETT |i| 1 . #7#) G190
                                     (COND
                                      ((|greater_SI| |i| |nsols|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |j| 1 . #7#) G190
                                            (COND
                                             ((|greater_SI| |j| |m|)
                                              (GO G191)))
                                            (SEQ
                                             (SPADCALL |ov| |k1| |k|
                                                       (QREFELT $ 45))
                                             (LETT |k1| (+ |k1| 1) . #7#)
                                             (LETT |mm|
                                                   (SPADCALL |ve| |j|
                                                             (QREFELT $ 42))
                                                   . #7#)
                                             (LETT |cp|
                                                   (SPADCALL |bm| |i| |j|
                                                             (QREFELT $ 66))
                                                   . #7#)
                                             (EXIT
                                              (SEQ (LETT |l| 0 . #7#) G190
                                                   (COND
                                                    ((|greater_SI| |l| |mm|)
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |cpl|
                                                          (ELT_U32 |cp| |l|)
                                                          . #7#)
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
                                                               . #7#)))))))
                                                   (LETT |l| (|inc_SI| |l|)
                                                         . #7#)
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |j| (|inc_SI| |j|) . #7#)
                                            (GO G190) G191 (EXIT NIL))))
                                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |ncv|
                                      (GETREFV_U32
                                       (PROG1 (LETT #4# |k| . #7#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       0)
                                      . #7#)
                                (LETT |nev|
                                      (GETREFV_U32
                                       (PROG1 (LETT #3# |k| . #7#)
                                         (|check_subtype| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          #3#))
                                       0)
                                      . #7#)
                                (SEQ (LETT |i| 0 . #7#)
                                     (LETT #2# (- |k| 1) . #7#) G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (SETELT_U32 |ncv| |i| (ELT_U32 |cv| |i|))
                                      (EXIT
                                       (SETELT_U32 |nev| |i|
                                                   (ELT_U32 |ev| |i|))))
                                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                     G191 (EXIT NIL))
                                (EXIT
                                 (PROGN
                                  (LETT #1#
                                        (CONS 0
                                              (VECTOR |va| |civ| |m| |ov| |nev|
                                                      |ncv|))
                                        . #7#)
                                  (GO #1#)))))))))))))
              (#8#
               (SEQ
                (LETT |ngv0p|
                      (|IMODHP;eval2s| |gvl| |pt| (|SPADfirst| |vars|) |p| $)
                      . #7#)
                (EXIT
                 (COND
                  ((QEQCAR |ngv0p| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#)))
                  (#8#
                   (SEQ (LETT |ngvl| (QCDR |ngv0p|) . #7#)
                        (EXIT
                         (PROGN
                          (LETT #1#
                                (SPADCALL (CDR |vars|) |ngvl| |pss| |gen|
                                          (QREFELT $ 72))
                                . #7#)
                          (GO #1#)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;do_poly_modular;LLRMU;14| (|vars| |gvl| |pss| |gen| $)
  (PROG (#1=#:G447 |rr| |pp| #2=#:G450 |j| |hi| |lo| |invc| #3=#:G434 |ok|
         |nofi| |ofi| |ofin| |cnum| |i| |n1| |block_offsets| |coeffs| |jl|
         |ndl| #4=#:G449 |ncoeffs| |nn| |n0| |rstate| |ncc| |exps| |offsets|
         |oer| |odl| |dl| |good_cnt| |all_bad| |nsols| |bad_cnt| |chk_ress|
         |noffsets| |nexps| |civ| |va| |ppr| |pprp| |qn| #5=#:G448 |k| |pts|
         |npt| |lpt| |pt| |nvars| |m| |p| |update_qval| |update_points|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lpt| NIL . #6=(|IMODHP;do_poly_modular;LLRMU;14|))
            (LETT |bad_cnt| 0 . #6#) (LETT |good_cnt| 0 . #6#)
            (LETT |exps| (GETREFV_U32 0 0) . #6#)
            (LETT |offsets| (MAKE-ARRAY 0) . #6#) (LETT |all_bad| 'T . #6#)
            (LETT |update_points|
                  (COND
                   ((EQUAL (QVELT |pss| 6) '|qshiftHP|)
                    (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                   ('T 'NIL))
                  . #6#)
            (LETT |update_qval|
                  (COND
                   ((OR (EQUAL (QVELT |pss| 6) '|qshiftHP|)
                        (OR (EQUAL (QVELT |pss| 6) '|qdiffHP|)
                            (EQUAL (QVELT |pss| 6) '|qmixed|)))
                    (EQUAL (QVELT |pss| 3) (|SPADfirst| |vars|)))
                   ('T 'NIL))
                  . #6#)
            (LETT |p| (QVELT |pss| 5) . #6#) (LETT |m| (QVELT |pss| 9) . #6#)
            (LETT |nvars| (LENGTH |vars|) . #6#) (LETT |nsols| (+ |m| 1) . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |ok| 'NIL . #6#)
                       (SEQ (LETT |k| 1 . #6#) G190
                            (COND
                             ((OR (|greater_SI| |k| 100)
                                  (NULL (COND (|ok| 'NIL) ('T 'T))))
                              (GO G191)))
                            (SEQ (LETT |pt| (RANDOM |p|) . #6#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |pt| |lpt| (QREFELT $ 74))
                                    "iterate")
                                   ('T
                                    (SEQ (LETT |lpt| (CONS |pt| |lpt|) . #6#)
                                         (EXIT (LETT |ok| 'T . #6#)))))))
                            (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        ((EQL
                          (SPADCALL (LETT |npt| (LENGTH |lpt|) . #6#) 100
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
                             (SEQ (LETT |pts| (QVELT |pss| 2) . #6#)
                                  (LETT |qn| 1 . #6#)
                                  (EXIT
                                   (SEQ (LETT |k| 0 . #6#)
                                        (LETT #5# (- (QVELT |pss| 1) 1) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |k| #5#) (GO G191)))
                                        (SEQ (SETELT_U32 |pts| |k| |qn|)
                                             (EXIT
                                              (LETT |qn|
                                                    (SPADCALL (* |pt| |qn|) |p|
                                                              (QREFELT $ 20))
                                                    . #6#)))
                                        (LETT |k| (|inc_SI| |k|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))))
                           (COND (|update_qval| (QSETVELT |pss| 4 |pt|)))
                           (LETT |pprp|
                                 (SPADCALL |pt| |vars| |gvl| |pss| |gen|
                                           (QREFELT $ 73))
                                 . #6#)
                           (EXIT
                            (COND
                             ((QEQCAR |pprp| 2)
                              (PROGN
                               (LETT #1# (CONS 2 "no_solution") . #6#)
                               (GO #1#)))
                             ((QEQCAR |pprp| 1)
                              (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1) . #6#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |bad_cnt| (+ |good_cnt| 2)
                                                (QREFELT $ 58))
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed") . #6#)
                                       (GO #1#)))
                                     ('T "iterate")))))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pprp|) . #6#)
                                   (LETT |va| (QVELT |ppr| 0) . #6#)
                                   (LETT |civ| (QVELT |ppr| 1) . #6#)
                                   (LETT |nexps| (QVELT |ppr| 4) . #6#)
                                   (LETT |noffsets| (QVELT |ppr| 3) . #6#)
                                   (LETT |coeffs| (QVELT |ppr| 5) . #6#)
                                   (LETT |chk_ress|
                                         (|IMODHP;check_defects| |va| |civ|
                                          |pss| $)
                                         . #6#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |chk_ress| 1)
                                      (SEQ
                                       (LETT |bad_cnt| (+ |bad_cnt| 1) . #6#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |bad_cnt| (+ |good_cnt| 2)
                                                    (QREFELT $ 58))
                                          (PROGN
                                           (LETT #1# (CONS 1 "failed") . #6#)
                                           (GO #1#)))
                                         ('T "iterate")))))
                                     ('T
                                      (SEQ
                                       (COND
                                        ((QEQCAR |chk_ress| 2)
                                         (LETT |all_bad| 'T . #6#)))
                                       (COND
                                        (|all_bad|
                                         (SEQ
                                          (LETT |nsols| (QVSIZE |va|) . #6#)
                                          (QSETVELT |pss| 10 |nsols|)
                                          (QSETVELT |pss| 7 |va|)
                                          (QSETVELT |pss| 8 |civ|)
                                          (LETT |exps| |nexps| . #6#)
                                          (LETT |offsets| |noffsets| . #6#)
                                          (EXIT
                                           (LETT |rstate|
                                                 (SPADCALL
                                                  (QV_LEN_U32 |coeffs|) |p|
                                                  (QREFELT $ 79))
                                                 . #6#)))))
                                       (LETT |all_bad| 'NIL . #6#)
                                       (LETT |good_cnt| (+ |good_cnt| 1) . #6#)
                                       (LETT |dl|
                                             (SPADCALL |nvars| |offsets| |exps|
                                                       |noffsets| |nexps|
                                                       (QREFELT $ 61))
                                             . #6#)
                                       (LETT |odl|
                                             (SPADCALL |dl| 1 (QREFELT $ 80))
                                             . #6#)
                                       (LETT |ndl|
                                             (SPADCALL |dl| 2 (QREFELT $ 80))
                                             . #6#)
                                       (COND
                                        ((SPADCALL |odl| NIL (QREFELT $ 81))
                                         (SEQ
                                          (LETT |oer|
                                                (SPADCALL |nvars| |odl| |ndl|
                                                          |offsets| |exps|
                                                          |noffsets| |nexps|
                                                          (QREFELT $ 64))
                                                . #6#)
                                          (LETT |offsets| (QCAR |oer|) . #6#)
                                          (LETT |exps| (QCDR |oer|) . #6#)
                                          (LETT |ncc|
                                                (QUOTIENT2 (QV_LEN_U32 |exps|)
                                                           |nvars|)
                                                . #6#)
                                          (EXIT
                                           (LETT |rstate|
                                                 (SPADCALL |ncc| |p|
                                                           (QREFELT $ 79))
                                                 . #6#)))))
                                       (COND
                                        ((SPADCALL |ndl| NIL (QREFELT $ 81))
                                         (SEQ
                                          (LETT |n0| (QV_LEN_U32 |coeffs|)
                                                . #6#)
                                          (LETT |nn| (LENGTH |ndl|) . #6#)
                                          (LETT |n1| (+ |n0| |nn|) . #6#)
                                          (LETT |ncoeffs| (GETREFV_U32 |n1| 0)
                                                . #6#)
                                          (LETT |i| 0 . #6#)
                                          (LETT |jl| (|SPADfirst| |ndl|) . #6#)
                                          (SEQ (LETT |j| 0 . #6#)
                                               (LETT #4# (- |n1| 1) . #6#) G190
                                               (COND
                                                ((|greater_SI| |j| #4#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((EQL |j| |jl|)
                                                   (SEQ
                                                    (SETELT_U32 |ncoeffs| |j|
                                                                0)
                                                    (LETT |ndl| (CDR |ndl|)
                                                          . #6#)
                                                    (EXIT
                                                     (LETT |jl|
                                                           (COND
                                                            ((NULL |ndl|) |n1|)
                                                            ('T
                                                             (|SPADfirst|
                                                              |ndl|)))
                                                           . #6#))))
                                                  ('T
                                                   (SEQ
                                                    (SETELT_U32 |ncoeffs| |j|
                                                                (ELT_U32
                                                                 |coeffs| |i|))
                                                    (EXIT
                                                     (LETT |i| (+ |i| 1)
                                                           . #6#)))))))
                                               (LETT |j| (|inc_SI| |j|) . #6#)
                                               (GO G190) G191 (EXIT NIL))
                                          (EXIT
                                           (LETT |coeffs| |ncoeffs| . #6#)))))
                                       (LETT |block_offsets|
                                             (|IMODHP;compute_blocks| |offsets|
                                              |m| |nsols| $)
                                             . #6#)
                                       (LETT |n1| (QV_LEN_U32 |coeffs|) . #6#)
                                       (LETT |ok| 'T . #6#)
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |i| 1 . #6#) G190
                                              (COND
                                               ((|greater_SI| |i| |nsols|)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |cnum|
                                                     (SPADCALL |civ| |i|
                                                               (QREFELT $ 42))
                                                     . #6#)
                                               (LETT |ofin|
                                                     (+ (* |m| (- |i| 1))
                                                        |cnum|)
                                                     . #6#)
                                               (LETT |ofi|
                                                     (SPADCALL |offsets| |ofin|
                                                               (QREFELT $ 42))
                                                     . #6#)
                                               (LETT |nofi|
                                                     (COND
                                                      ((OR (< |i| |nsols|)
                                                           (< |cnum| |m|))
                                                       (SPADCALL |offsets|
                                                                 (+ |ofin| 1)
                                                                 (QREFELT $
                                                                          42)))
                                                      ('T |n1|))
                                                     . #6#)
                                               (LETT |nofi| (- |nofi| 1) . #6#)
                                               (EXIT
                                                (COND
                                                 ((< |nofi| |ofi|)
                                                  (SEQ
                                                   (SPADCALL
                                                    (SPADCALL |civ|
                                                              (QREFELT $ 82))
                                                    (QREFELT $ 76))
                                                   (SPADCALL
                                                    (SPADCALL |offsets|
                                                              (QREFELT $ 82))
                                                    (QREFELT $ 76))
                                                   (EXIT
                                                    (|error|
                                                     "Internal error: corrupted offsets 1"))))
                                                 ((EQL
                                                   (ELT_U32 |coeffs| |nofi|) 0)
                                                  (SEQ (LETT |ok| 'NIL . #6#)
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #3# |$NoValue|
                                                               . #6#)
                                                         (GO #3#)))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |invc|
                                                         (SPADCALL
                                                          (ELT_U32 |coeffs|
                                                                   |nofi|)
                                                          |p| (QREFELT $ 83))
                                                         . #6#)
                                                   (LETT |lo|
                                                         (SPADCALL
                                                          |block_offsets| |i|
                                                          (QREFELT $ 42))
                                                         . #6#)
                                                   (LETT |hi|
                                                         (COND
                                                          ((< |i| |nsols|)
                                                           (SPADCALL
                                                            |block_offsets|
                                                            (+ |i| 1)
                                                            (QREFELT $ 42)))
                                                          ('T |n1|))
                                                         . #6#)
                                                   (EXIT
                                                    (SEQ (LETT |j| |lo| . #6#)
                                                         (LETT #2# (- |hi| 1)
                                                               . #6#)
                                                         G190
                                                         (COND
                                                          ((> |j| #2#)
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
                                                               . #6#)
                                                         (GO G190) G191
                                                         (EXIT NIL))))))))
                                              (LETT |i| (|inc_SI| |i|) . #6#)
                                              (GO G190) G191 (EXIT NIL)))
                                        #3# (EXIT #3#))
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
                                                 . #6#)
                                           (EXIT
                                            (COND ((QEQCAR |pp| 1) "iterate")
                                                  ('T
                                                   (SEQ
                                                    (LETT |rr| (QCDR |pp|)
                                                          . #6#)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #1#
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
                                                            . #6#)
                                                      (GO #1#)))))))))
                                         ('T "iterate")))))))))))))
                         ('T (|error| "Run out of evaluation points")))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;do_poly_integer0| (|vars| |gvl| |pss| |gen| $)
  (PROG (#1=#:G496 |pp| #2=#:G498 |j| |hi| |lo| |invc| #3=#:G484 |ok| |nofi|
         |ofi| |ofin| |cnum| |i| |n1| |block_offsets| |coeffs| |jl| |ndl|
         #4=#:G497 |ncoeffs| |nn| |n0| |rstate| |ncc| |exps| |offsets| |oer|
         |odl| |dl| |all_bad| |nsols| |chk_ress| |noffsets| |nexps| |civ| |va|
         |ppr| |pprp| |ngvl| |ngv0p| |lp| |p| |k| |nvars| |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lp| NIL . #5=(|IMODHP;do_poly_integer0|))
            (LETT |exps| (GETREFV_U32 0 0) . #5#)
            (LETT |offsets| (MAKE-ARRAY 0) . #5#) (LETT |all_bad| 'T . #5#)
            (LETT |p| 16 . #5#) (LETT |m| (QVELT |pss| 9) . #5#)
            (LETT |nvars| (LENGTH |vars|) . #5#) (LETT |nsols| (+ |m| 1) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |ok| 'NIL . #5#)
                       (SEQ (LETT |k| 1 . #5#) G190
                            (COND
                             ((OR (|greater_SI| |k| 100)
                                  (NULL (COND (|ok| 'NIL) ('T 'T))))
                              (GO G191)))
                            (SEQ
                             (LETT |p|
                                   (SPADCALL (+ (RANDOM 200000) 200000)
                                             (QREFELT $ 89))
                                   . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |p| |lp| (QREFELT $ 74)) "iterate")
                               ('T
                                (SEQ (LETT |lp| (CONS |p| |lp|) . #5#)
                                     (EXIT (LETT |ok| 'T . #5#)))))))
                            (LETT |k| (|inc_SI| |k|) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (COND
                         (|ok|
                          (SEQ (QSETVELT |pss| 5 |p|)
                               (LETT |ngv0p| (|IMODHP;eval3s| |gvl| |p| $)
                                     . #5#)
                               (EXIT
                                (COND ((QEQCAR |ngv0p| 1) "iterate")
                                      ('T
                                       (SEQ (LETT |ngvl| (QCDR |ngv0p|) . #5#)
                                            (LETT |pprp|
                                                  (SPADCALL |vars| |ngvl| |pss|
                                                            |gen|
                                                            (QREFELT $ 72))
                                                  . #5#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |pprp| 2)
                                               (PROGN
                                                (LETT #1#
                                                      (CONS 1 "no_solution")
                                                      . #5#)
                                                (GO #1#)))
                                              ((QEQCAR |pprp| 1) "iterate")
                                              ('T
                                               (SEQ
                                                (LETT |ppr| (QCDR |pprp|)
                                                      . #5#)
                                                (LETT |va| (QVELT |ppr| 0)
                                                      . #5#)
                                                (LETT |civ| (QVELT |ppr| 1)
                                                      . #5#)
                                                (LETT |nexps| (QVELT |ppr| 4)
                                                      . #5#)
                                                (LETT |noffsets|
                                                      (QVELT |ppr| 3) . #5#)
                                                (LETT |coeffs| (QVELT |ppr| 5)
                                                      . #5#)
                                                (LETT |chk_ress|
                                                      (|IMODHP;check_defects|
                                                       |va| |civ| |pss| $)
                                                      . #5#)
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |chk_ress| 1)
                                                   "iterate")
                                                  ('T
                                                   (SEQ
                                                    (COND
                                                     ((QEQCAR |chk_ress| 2)
                                                      (LETT |all_bad| 'T
                                                            . #5#)))
                                                    (COND
                                                     (|all_bad|
                                                      (SEQ
                                                       (LETT |nsols|
                                                             (QVSIZE |va|)
                                                             . #5#)
                                                       (QSETVELT |pss| 10
                                                                 |nsols|)
                                                       (QSETVELT |pss| 7 |va|)
                                                       (QSETVELT |pss| 8 |civ|)
                                                       (LETT |exps| |nexps|
                                                             . #5#)
                                                       (LETT |offsets|
                                                             |noffsets| . #5#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL
                                                               (QV_LEN_U32
                                                                |coeffs|)
                                                               (QREFELT $ 91))
                                                              . #5#)))))
                                                    (LETT |all_bad| 'NIL . #5#)
                                                    (LETT |dl|
                                                          (SPADCALL
                                                           (+ |nvars| 1)
                                                           |offsets| |exps|
                                                           |noffsets| |nexps|
                                                           (QREFELT $ 61))
                                                          . #5#)
                                                    (LETT |odl|
                                                          (SPADCALL |dl| 1
                                                                    (QREFELT $
                                                                             80))
                                                          . #5#)
                                                    (LETT |ndl|
                                                          (SPADCALL |dl| 2
                                                                    (QREFELT $
                                                                             80))
                                                          . #5#)
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
                                                             . #5#)
                                                       (LETT |offsets|
                                                             (QCAR |oer|)
                                                             . #5#)
                                                       (LETT |exps|
                                                             (QCDR |oer|)
                                                             . #5#)
                                                       (LETT |ncc|
                                                             (QUOTIENT2
                                                              (QV_LEN_U32
                                                               |exps|)
                                                              (+ |nvars| 1))
                                                             . #5#)
                                                       (EXIT
                                                        (LETT |rstate|
                                                              (SPADCALL |ncc|
                                                                        (QREFELT
                                                                         $ 91))
                                                              . #5#)))))
                                                    (COND
                                                     ((SPADCALL |ndl| NIL
                                                                (QREFELT $ 81))
                                                      (SEQ
                                                       (LETT |n0|
                                                             (QV_LEN_U32
                                                              |coeffs|)
                                                             . #5#)
                                                       (LETT |nn|
                                                             (LENGTH |ndl|)
                                                             . #5#)
                                                       (LETT |n1| (+ |n0| |nn|)
                                                             . #5#)
                                                       (LETT |ncoeffs|
                                                             (GETREFV_U32 |n1|
                                                                          0)
                                                             . #5#)
                                                       (LETT |i| 0 . #5#)
                                                       (LETT |jl|
                                                             (|SPADfirst|
                                                              |ndl|)
                                                             . #5#)
                                                       (SEQ (LETT |j| 0 . #5#)
                                                            (LETT #4#
                                                                  (- |n1| 1)
                                                                  . #5#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |j|
                                                                            #4#)
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
                                                                       . #5#)
                                                                 (EXIT
                                                                  (LETT |jl|
                                                                        (COND
                                                                         ((NULL
                                                                           |ndl|)
                                                                          |n1|)
                                                                         ('T
                                                                          (|SPADfirst|
                                                                           |ndl|)))
                                                                        . #5#))))
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
                                                                        . #5#)))))))
                                                            (LETT |j|
                                                                  (|inc_SI|
                                                                   |j|)
                                                                  . #5#)
                                                            (GO G190) G191
                                                            (EXIT NIL))
                                                       (EXIT
                                                        (LETT |coeffs|
                                                              |ncoeffs|
                                                              . #5#)))))
                                                    (LETT |block_offsets|
                                                          (|IMODHP;compute_blocks|
                                                           |offsets| |m|
                                                           |nsols| $)
                                                          . #5#)
                                                    (LETT |n1|
                                                          (QV_LEN_U32 |coeffs|)
                                                          . #5#)
                                                    (LETT |ok| 'T . #5#)
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |i| 1 . #5#)
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
                                                                  . #5#)
                                                            (LETT |ofin|
                                                                  (+
                                                                   (* |m|
                                                                      (- |i|
                                                                         1))
                                                                   |cnum|)
                                                                  . #5#)
                                                            (LETT |ofi|
                                                                  (SPADCALL
                                                                   |offsets|
                                                                   |ofin|
                                                                   (QREFELT $
                                                                            42))
                                                                  . #5#)
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
                                                                  . #5#)
                                                            (LETT |nofi|
                                                                  (- |nofi| 1)
                                                                  . #5#)
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
                                                                      . #5#)
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #3#
                                                                        |$NoValue|
                                                                        . #5#)
                                                                  (GO #3#)))))
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
                                                                      . #5#)
                                                                (LETT |lo|
                                                                      (SPADCALL
                                                                       |block_offsets|
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 42))
                                                                      . #5#)
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
                                                                      . #5#)
                                                                (EXIT
                                                                 (SEQ
                                                                  (LETT |j|
                                                                        |lo|
                                                                        . #5#)
                                                                  (LETT #2#
                                                                        (- |hi|
                                                                           1)
                                                                        . #5#)
                                                                  G190
                                                                  (COND
                                                                   ((> |j| #2#)
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
                                                                        . #5#)
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT
                                                                   NIL))))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #5#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))
                                                     #3# (EXIT #3#))
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
                                                              . #5#)
                                                        (EXIT
                                                         (COND
                                                          ((QEQCAR |pp| 1)
                                                           "iterate")
                                                          ('T
                                                           (PROGN
                                                            (LETT #1#
                                                                  (CONS 0
                                                                        (VECTOR
                                                                         |va|
                                                                         |civ|
                                                                         |m|
                                                                         |offsets|
                                                                         |exps|
                                                                         (QCDR
                                                                          |pp|)))
                                                                  . #5#)
                                                            (GO #1#)))))))
                                                      ('T
                                                       "iterate")))))))))))))))))
                         ('T (|error| "Run out of primes")))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |IMODHP;do_poly_integer;LLVNniUv2SMU;16|
       (|vars| |gvl| |ve| |sigma| |pts| |kind| |qvar| |gen| $)
  (PROG (#1=#:G508 |pss|)
    (RETURN
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
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |InnerModularHermitePade;|)) 

(DEFUN |InnerModularHermitePade| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G510)
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
                          (CONS NIL (CONS 1 (|InnerModularHermitePade;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|InnerModularHermitePade|))))))))))) 

(DEFUN |InnerModularHermitePade;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
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
      $)))) 

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
              (96 . |elt|) (102 . |setelt|) (109 . |setelt|) (|Any|)
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
