
(/VERSIONCHECK 2) 

(DEFUN |POLYVEC;copy_first;2UvIV;1| (|np| |op| |n| $)
  (PROG (#1=#:G140 |j| |ns|)
    (RETURN
     (SEQ (LETT |ns| |n| . #2=(|POLYVEC;copy_first;2UvIV;1|))
          (EXIT
           (SEQ (LETT |j| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#) G190
                (COND ((|greater_SI| |j| #1#) (GO G191)))
                (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;copy_slice;2Uv2IV;2| (|np| |op| |m| |n| $)
  (PROG (#1=#:G144 |j| |ns| |ms|)
    (RETURN
     (SEQ (LETT |ms| |m| . #2=(|POLYVEC;copy_slice;2Uv2IV;2|))
          (LETT |ns| |n| . #2#)
          (EXIT
           (SEQ (LETT |j| |ms| . #2#)
                (LETT #1# (|sub_SI| (|add_SI| |ms| |ns|) 1) . #2#) G190
                (COND ((|greater_SI| |j| #1#) (GO G191)))
                (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;eval_at;Uv4I;3| (|v| |deg| |pt| |p| $)
  (PROG (|i| |res|)
    (RETURN
     (SEQ
      (LETT |i| (SPADCALL |deg| (QREFELT $ 12))
            . #1=(|POLYVEC;eval_at;Uv4I;3|))
      (LETT |res| 0 . #1#)
      (SEQ G190
           (COND ((NULL (COND ((|less_SI| |i| 0) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |res| (QSMULADDMOD64-32 |pt| |res| (ELT_U32 |v| |i|) |p|)
                  . #1#)
            (EXIT (LETT |i| (|sub_SI| |i| 1) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |POLYVEC;to_mod_pa;SupIUv;4| (|s| |p| $)
  (PROG (|n| |ncoeffs| |n0|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |s| (QREFELT $ 16)) (GETREFV_U32 1 0))
            ('T
             (SEQ
              (LETT |n0| (SPADCALL |s| (QREFELT $ 19))
                    . #1=(|POLYVEC;to_mod_pa;SupIUv;4|))
              (LETT |ncoeffs| (GETREFV_U32 (|add_SI| |n0| 1) 0) . #1#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((SPADCALL |s| (QREFELT $ 16)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 19)) . #1#)
                        (SETELT_U32 |ncoeffs| |n|
                                    (SPADCALL (SPADCALL |s| (QREFELT $ 20)) |p|
                                              (QREFELT $ 21)))
                        (EXIT (LETT |s| (SPADCALL |s| (QREFELT $ 22)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ncoeffs|)))))))) 

(DEFUN |POLYVEC;vector_add_mul;2Uv4IV;5| (|v1| |v2| |m| |n| |c| |p| $)
  (PROG (|i| |ns| |ms|)
    (RETURN
     (SEQ (LETT |ms| |m| . #1=(|POLYVEC;vector_add_mul;2Uv4IV;5|))
          (LETT |ns| |n| . #1#)
          (EXIT
           (SEQ (LETT |i| |ms| . #1#) G190
                (COND ((|greater_SI| |i| |ns|) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT_U32 |v1| |i|
                              (QSMULADDMOD64-32 |c| (ELT_U32 |v2| |i|)
                                                (ELT_U32 |v1| |i|) |p|))))
                (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;mul_by_binomial;Uv3IV;6| (|v| |n| |pt| |p| $)
  (PROG (|prev_coeff| |pp| #1=#:G162 |i| |ns|)
    (RETURN
     (SEQ (LETT |prev_coeff| 0 . #2=(|POLYVEC;mul_by_binomial;Uv3IV;6|))
          (LETT |ns| |n| . #2#)
          (EXIT
           (SEQ (LETT |i| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ (LETT |pp| (ELT_U32 |v| |i|) . #2#)
                     (SETELT_U32 |v| |i|
                                 (QSMULADDMOD64-32 |pt| |pp| |prev_coeff| |p|))
                     (EXIT (LETT |prev_coeff| |pp| . #2#)))
                (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;mul_by_binomial;Uv2IV;7| (|v| |pt| |p| $)
  (SPADCALL |v| (QV_LEN_U32 |v|) |pt| |p| (QREFELT $ 25))) 

(DEFUN |POLYVEC;mul_by_scalar;Uv3IV;8| (|v| |n| |c| |p| $)
  (PROG (|i| |ns|)
    (RETURN
     (SEQ (LETT |ns| |n| . #1=(|POLYVEC;mul_by_scalar;Uv3IV;8|))
          (EXIT
           (SEQ (LETT |i| 0 . #1#) G190
                (COND ((|greater_SI| |i| |ns|) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT_U32 |v| |i| (QSMULMOD32 |c| (ELT_U32 |v| |i|) |p|))))
                (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;degree;UvI;9| (|v| $)
  (PROG (#1=#:G168 #2=#:G170 |i| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (QV_LEN_U32 |v|) . #3=(|POLYVEC;degree;UvI;9|))
            (SEQ
             (EXIT
              (SEQ (LETT |i| (- |n| 1) . #3#) G190 (COND ((< |i| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (EQL (ELT_U32 |v| |i|) 0))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |i| . #3#) (GO #2#)) . #3#)
                        (GO #1#))))))
                   (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT -1)))
      #2# (EXIT #2#))))) 

(DEFUN |POLYVEC;vector_combination;UvIUv4IV;10|
       (|v1| |c1| |v2| |c2| |n| |delta| |p| $)
  (PROG (|i| #1=#:G179 |ds| |ns|)
    (RETURN
     (SEQ (LETT |ns| |n| . #2=(|POLYVEC;vector_combination;UvIUv4IV;10|))
          (LETT |ds| |delta| . #2#)
          (EXIT
           (COND
            ((EQL |c1| 1)
             (SEQ (LETT |i| |ds| . #2#) G190
                  (COND ((|greater_SI| |i| |ns|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT_U32 |v1| |i|
                                (QSMULADDMOD64-32 |c2|
                                                  (ELT_U32 |v2|
                                                           (|sub_SI| |i| |ds|))
                                                  (ELT_U32 |v1| |i|) |p|))))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))
            ((|less_SI| (|add_SI| |ns| 1) |ds|)
             (SEQ (LETT |i| 0 . #2#) G190
                  (COND ((|greater_SI| |i| |ns|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT_U32 |v1| |i|
                                (QSMULMOD32 (ELT_U32 |v1| |i|) |c1| |p|))))
                  (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL)))
            ('T
             (SEQ
              (SEQ (LETT |i| 0 . #2#) (LETT #1# (|sub_SI| |ds| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SETELT_U32 |v1| |i|
                                 (QSMULMOD32 (ELT_U32 |v1| |i|) |c1| |p|))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SEQ (LETT |i| |ds| . #2#) G190
                    (COND ((|greater_SI| |i| |ns|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT_U32 |v1| |i|
                                  (QSDOT2MOD64-32 (ELT_U32 |v1| |i|) |c1|
                                                  (ELT_U32 |v2|
                                                           (|sub_SI| |i| |ds|))
                                                  |c2| |p|))))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                    (EXIT NIL))))))))))) 

(DEFUN |POLYVEC;divide!;3UvIV;11| (|r0| |r1| |res| |p| $)
  (PROG (#1=#:G181 |dr0| #2=#:G183 |c1| |delta| |c0| |dr1|)
    (RETURN
     (SEQ
      (LETT |dr0| (SPADCALL |r0| (QREFELT $ 28))
            . #3=(|POLYVEC;divide!;3UvIV;11|))
      (LETT |dr1| (SPADCALL |r1| (QREFELT $ 28)) . #3#)
      (LETT |c0| (ELT_U32 |r1| |dr1|) . #3#)
      (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 30)) . #3#)
      (EXIT
       (SEQ
        (EXIT
         (SEQ G190
              (COND
               ((NULL (COND ((|less_SI| |dr0| |dr1|) 'NIL) ('T 'T)))
                (GO G191)))
              (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #3#)
                   (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|) . #3#)
                   (SETELT_U32 |res| |delta| |c1|)
                   (LETT |c1| (- |p| |c1|) . #3#) (SETELT_U32 |r0| |dr0| 0)
                   (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                   (COND
                    ((|less_SI| |dr0| 0)
                     (PROGN (LETT #2# |$NoValue| . #3#) (GO #2#))))
                   (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p| (QREFELT $ 29))
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL (EQL (ELT_U32 |r0| |dr0|) 0)) (GO G191)))
                           (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                                (EXIT
                                 (COND
                                  ((|less_SI| |dr0| 0)
                                   (PROGN
                                    (LETT #1# |$NoValue| . #3#)
                                    (GO #1#))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #1# (EXIT #1#))))
              NIL (GO G190) G191 (EXIT NIL)))
        #2# (EXIT #2#))))))) 

(DEFUN |POLYVEC;remainder!;2UvIV;12| (|r0| |r1| |p| $)
  (PROG (#1=#:G187 |dr0| #2=#:G189 |c1| |delta| |c0| |dr1|)
    (RETURN
     (SEQ
      (LETT |dr0| (SPADCALL |r0| (QREFELT $ 28))
            . #3=(|POLYVEC;remainder!;2UvIV;12|))
      (LETT |dr1| (SPADCALL |r1| (QREFELT $ 28)) . #3#)
      (LETT |c0| (ELT_U32 |r1| |dr1|) . #3#)
      (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 30)) . #3#)
      (EXIT
       (SEQ
        (EXIT
         (SEQ G190
              (COND
               ((NULL (COND ((|less_SI| |dr0| |dr1|) 'NIL) ('T 'T)))
                (GO G191)))
              (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #3#)
                   (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|) . #3#)
                   (LETT |c1| (- |p| |c1|) . #3#) (SETELT_U32 |r0| |dr0| 0)
                   (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                   (COND
                    ((|less_SI| |dr0| 0)
                     (PROGN (LETT #2# |$NoValue| . #3#) (GO #2#))))
                   (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p| (QREFELT $ 29))
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL (EQL (ELT_U32 |r0| |dr0|) 0)) (GO G191)))
                           (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                                (EXIT
                                 (COND
                                  ((|less_SI| |dr0| 0)
                                   (PROGN
                                    (LETT #1# |$NoValue| . #3#)
                                    (GO #1#))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #1# (EXIT #1#))))
              NIL (GO G190) G191 (EXIT NIL)))
        #2# (EXIT #2#))))))) 

(DEFUN |POLYVEC;gcd;2UvIUv;13| (|x| |y| |p| $)
  (PROG (#1=#:G207 |c| |dr1| |r1| |dr0| |r0| |tmp| |tmpp| #2=#:G197 |c0| |c1|
         |delta|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |dr0| (SPADCALL |y| (QREFELT $ 28))
              . #3=(|POLYVEC;gcd;2UvIUv;13|))
        (COND
         ((|less_SI| |dr0| 0)
          (SEQ (LETT |tmpp| |x| . #3#) (LETT |x| |y| . #3#)
               (LETT |y| |tmpp| . #3#) (LETT |dr1| |dr0| . #3#)
               (EXIT (LETT |dr0| (SPADCALL |y| (QREFELT $ 28)) . #3#))))
         (#4='T (LETT |dr1| (SPADCALL |x| (QREFELT $ 28)) . #3#)))
        (EXIT
         (COND
          ((|less_SI| |dr0| 0)
           (PROGN (LETT #1# (GETREFV_U32 1 0) . #3#) (GO #1#)))
          (#4#
           (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #3#)
                (SPADCALL |r0| |y| (|add_SI| |dr0| 1) (QREFELT $ 9))
                (EXIT
                 (COND
                  ((|less_SI| |dr1| 0)
                   (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #3#)
                        (LETT |c| (SPADCALL |c| |p| (QREFELT $ 30)) . #3#)
                        (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 27))
                        (EXIT (PROGN (LETT #1# |r0| . #3#) (GO #1#)))))
                  (#4#
                   (SEQ (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #3#)
                        (SPADCALL |r1| |x| (|add_SI| |dr1| 1) (QREFELT $ 9))
                        (SEQ G190 (COND ((NULL (|less_SI| 0 |dr1|)) (GO G191)))
                             (SEQ
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((|less_SI| |dr0| |dr1|) 'NIL)
                                            ('T 'T)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |delta| (|sub_SI| |dr0| |dr1|) . #3#)
                                    (LETT |c1|
                                          (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                          . #3#)
                                    (LETT |c0| (ELT_U32 |r1| |dr1|) . #3#)
                                    (COND
                                     ((SPADCALL |c0| 1 (QREFELT $ 33))
                                      (COND
                                       ((SPADCALL |delta| 30 (QREFELT $ 34))
                                        (SEQ
                                         (LETT |c0|
                                               (SPADCALL |c0| |p|
                                                         (QREFELT $ 30))
                                               . #3#)
                                         (SPADCALL |r1| |dr1| |c0| |p|
                                                   (QREFELT $ 27))
                                         (EXIT (LETT |c0| 1 . #3#)))))))
                                    (SETELT_U32 |r0| |dr0| 0)
                                    (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                                    (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta|
                                              |p| (QREFELT $ 29))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (EQL (ELT_U32 |r0| |dr0|) 0))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |dr0| (|sub_SI| |dr0| 1)
                                                   . #3#)
                                             (EXIT
                                              (COND
                                               ((|less_SI| |dr0| 0)
                                                (PROGN
                                                 (LETT #2# |$NoValue| . #3#)
                                                 (GO #2#))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #2# (EXIT #2#))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |tmpp| |r0| . #3#) (LETT |tmp| |dr0| . #3#)
                              (LETT |r0| |r1| . #3#) (LETT |dr0| |dr1| . #3#)
                              (LETT |r1| |tmpp| . #3#)
                              (EXIT (LETT |dr1| |tmp| . #3#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((|less_SI| |dr1| 0)
                           (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #3#)
                                (LETT |c| (SPADCALL |c| |p| (QREFELT $ 30))
                                      . #3#)
                                (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 27))
                                (EXIT |r0|)))
                          (#4#
                           (SEQ (SETELT_U32 |r1| 0 1)
                                (EXIT
                                 (PROGN
                                  (LETT #1# |r1| . #3#)
                                  (GO #1#)))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYVEC;gcd;Pa3IUv;14| (|a| |lo| |hi| |p| $)
  (PROG (|res| |i|)
    (RETURN
     (SEQ (LETT |res| (QAREF1 |a| |lo|) . #1=(|POLYVEC;gcd;Pa3IUv;14|))
          (SEQ (LETT |i| (+ |lo| 1) . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL (QAREF1 |a| |i|) |res| |p| (QREFELT $ 35))
                       . #1#)))
               (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |POLYVEC;lcm2| (|v1| |v2| |p| $)
  (PROG (|tmp2| |tmp1| |dpp| |dv2| |pp|)
    (RETURN
     (SEQ
      (LETT |pp| (SPADCALL |v1| |v2| |p| (QREFELT $ 35)) . #1=(|POLYVEC;lcm2|))
      (LETT |dv2| (SPADCALL |v2| (QREFELT $ 28)) . #1#)
      (LETT |dpp| (SPADCALL |pp| (QREFELT $ 28)) . #1#)
      (EXIT
       (COND ((EQL |dv2| |dpp|) |v1|)
             ((EQL |dpp| 0) (SPADCALL |v1| |v2| |p| (QREFELT $ 38)))
             ('T
              (SEQ (LETT |tmp1| (GETREFV_U32 (+ |dv2| 1) 0) . #1#)
                   (LETT |tmp2| (GETREFV_U32 (+ (- |dv2| |dpp|) 1) 0) . #1#)
                   (SPADCALL |tmp1| |v2| (+ |dv2| 1) (QREFELT $ 9))
                   (SPADCALL |tmp1| |pp| |tmp2| |p| (QREFELT $ 31))
                   (EXIT (SPADCALL |v1| |tmp2| |p| (QREFELT $ 38))))))))))) 

(DEFUN |POLYVEC;lcm;Pa3IUv;16| (|a| |lo| |hi| |p| $)
  (PROG (|res| |i|)
    (RETURN
     (SEQ (LETT |res| (QAREF1 |a| |lo|) . #1=(|POLYVEC;lcm;Pa3IUv;16|))
          (SEQ (LETT |i| (+ |lo| 1) . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res| (|POLYVEC;lcm2| (QAREF1 |a| |i|) |res| |p| $)
                       . #1#)))
               (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |POLYVEC;mul;2UvIUv;17| (|x| |y| |p| $)
  (PROG (|zcoeffs| |zdeg0| |zdeg| |ycoeffs| |xcoeffs| |ydeg| |xdeg| |tmp|
         |tmpp|)
    (RETURN
     (SEQ
      (LETT |xdeg| (SPADCALL |x| (QREFELT $ 28))
            . #1=(|POLYVEC;mul;2UvIUv;17|))
      (LETT |ydeg| (SPADCALL |y| (QREFELT $ 28)) . #1#)
      (COND
       ((SPADCALL |xdeg| |ydeg| (QREFELT $ 40))
        (SEQ (LETT |tmpp| |x| . #1#) (LETT |tmp| |xdeg| . #1#)
             (LETT |x| |y| . #1#) (LETT |xdeg| |ydeg| . #1#)
             (LETT |y| |tmpp| . #1#) (EXIT (LETT |ydeg| |tmp| . #1#)))))
      (LETT |xcoeffs| |x| . #1#) (LETT |ycoeffs| |y| . #1#)
      (EXIT
       (COND ((|less_SI| |xdeg| 0) |x|)
             ('T
              (SEQ
               (COND
                ((|eql_SI| |xdeg| 0)
                 (COND
                  ((EQL (ELT_U32 |xcoeffs| 0) 1)
                   (EXIT (SPADCALL |y| (QREFELT $ 41)))))))
               (LETT |zdeg| (|add_SI| |xdeg| |ydeg|) . #1#)
               (LETT |zdeg0| (|add_SI| |zdeg| 1) . #1#)
               (LETT |zcoeffs| (GETREFV_U32 |zdeg0| 0) . #1#)
               (|POLYVEC;inner_mul| |xcoeffs| |ycoeffs| |zcoeffs| |xdeg| |ydeg|
                |zdeg| |p| $)
               (EXIT |zcoeffs|))))))))) 

(DEFUN |POLYVEC;inner_mul| (|x| |y| |z| |xdeg| |ydeg| |zdeg| |p| $)
  (PROG (|ss| |j| |i| |tmp| |tmpp|)
    (RETURN
     (SEQ
      (COND
       ((|less_SI| |ydeg| |xdeg|)
        (SEQ (LETT |tmpp| |x| . #1=(|POLYVEC;inner_mul|))
             (LETT |tmp| |xdeg| . #1#) (LETT |x| |y| . #1#)
             (LETT |xdeg| |ydeg| . #1#) (LETT |y| |tmpp| . #1#)
             (EXIT (LETT |ydeg| |tmp| . #1#)))))
      (LETT |xdeg| (COND ((|less_SI| |zdeg| |xdeg|) |zdeg|) (#2='T |xdeg|))
            . #1#)
      (LETT |ydeg| (COND ((|less_SI| |zdeg| |ydeg|) |zdeg|) (#2# |ydeg|))
            . #1#)
      (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| |xdeg|) (GO G191)))
           (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #1#)
                (SEQ (LETT |j| 0 . #1#) G190
                     (COND ((|greater_SI| |j| |i|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ss|
                             (QSMULADD64-32 (ELT_U32 |x| (- |i| |j|))
                                            (ELT_U32 |y| |j|) |ss|)
                             . #1#)))
                     (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |i| (|add_SI| |xdeg| 1) . #1#) G190
           (COND ((|greater_SI| |i| |ydeg|) (GO G191)))
           (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #1#)
                (SEQ (LETT |j| 0 . #1#) G190
                     (COND ((|greater_SI| |j| |xdeg|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ss|
                             (QSMULADD64-32 (ELT_U32 |x| |j|)
                                            (ELT_U32 |y| (- |i| |j|)) |ss|)
                             . #1#)))
                     (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SEQ (LETT |i| (|add_SI| |ydeg| 1) . #1#) G190
            (COND ((|greater_SI| |i| |zdeg|) (GO G191)))
            (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #1#)
                 (SEQ (LETT |j| (|sub_SI| |i| |xdeg|) . #1#) G190
                      (COND ((|greater_SI| |j| |ydeg|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |ss|
                              (QSMULADD64-32 (ELT_U32 |x| (|sub_SI| |i| |j|))
                                             (ELT_U32 |y| |j|) |ss|)
                              . #1#)))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
            (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |POLYVEC;truncated_mul_add;3Uv2IV;19| (|x| |y| |z| |m| |p| $)
  (PROG (|ydeg| |xdeg|)
    (RETURN
     (SEQ
      (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
            . #1=(|POLYVEC;truncated_mul_add;3Uv2IV;19|))
      (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #1#)
      (EXIT (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $)))))) 

(DEFUN |POLYVEC;truncated_multiplication;2Uv2IUv;20| (|x| |y| |m| |p| $)
  (PROG (|z| |ydeg| |xdeg|)
    (RETURN
     (SEQ
      (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
            . #1=(|POLYVEC;truncated_multiplication;2Uv2IUv;20|))
      (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #1#)
      (LETT |z| (GETREFV_U32 (|add_SI| |m| 1) 0) . #1#)
      (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $) (EXIT |z|))))) 

(DEFUN |POLYVEC;pow;UvPiNniIUv;21| (|x| |n| |d| |p| $)
  (COND ((EQL |n| 1) |x|)
        ((ODDP |n|)
         (SPADCALL |x|
                   (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 43))
                             (ASH |n| -1) |d| |p| (QREFELT $ 45))
                   |d| |p| (QREFELT $ 43)))
        ('T
         (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 43)) (ASH |n| -1) |d|
                   |p| (QREFELT $ 45))))) 

(DEFUN |POLYVEC;differentiate;UvIUv;22| (|x| |p| $)
  (PROG (|i1| #1=#:G248 |i| |r| #2=#:G242 |d|)
    (RETURN
     (SEQ
      (LETT |d| (- (QV_LEN_U32 |x|) 1) . #3=(|POLYVEC;differentiate;UvIUv;22|))
      (EXIT
       (COND ((ZEROP |d|) (GETREFV_U32 0 0))
             ('T
              (SEQ
               (LETT |r|
                     (GETREFV_U32
                      (PROG1 (LETT #2# |d| . #3#)
                        (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                         #2#))
                      0)
                     . #3#)
               (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |d| 1) . #3#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (LETT |i1| (+ |i| 1) . #3#)
                         (EXIT
                          (SETELT_U32 |r| |i|
                                      (QSMULMOD32 |i1| (ELT_U32 |x| |i1|)
                                                  |p|))))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT |r|))))))))) 

(DEFUN |POLYVEC;differentiate;UvNniIUv;23| (|x| |n| |p| $)
  (PROG (|f| |k| |j| |i| |r| |d|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) |x|)
            (#1='T
             (SEQ
              (LETT |d| (- (QV_LEN_U32 |x|) 1)
                    . #2=(|POLYVEC;differentiate;UvNniIUv;23|))
              (EXIT
               (COND ((< |d| |n|) (GETREFV_U32 0 0))
                     (#1#
                      (SEQ (LETT |r| (GETREFV_U32 (+ (- |d| |n|) 1) 0) . #2#)
                           (SEQ (LETT |i| |n| . #2#) G190
                                (COND ((> |i| |d|) (GO G191)))
                                (SEQ (LETT |j| (- |i| |n|) . #2#)
                                     (LETT |f| (+ |j| 1) . #2#)
                                     (SEQ (LETT |k| (+ |j| 2) . #2#) G190
                                          (COND ((> |k| |i|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |f| (QSMULMOD32 |f| |k| |p|)
                                                  . #2#)))
                                          (LETT |k| (+ |k| 1) . #2#) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (SETELT_U32 |r| |j|
                                                  (QSMULMOD32 |f|
                                                              (ELT_U32 |x| |i|)
                                                              |p|))))
                                (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |r|)))))))))))) 

(DEFUN |POLYVEC;extended_gcd;2UvIL;24| (|x| |y| |p| $)
  (PROG (|c| #1=#:G270 |t1| |t0| |#G126| |#G125| |s1| |s0| |#G124| |#G123|
         |dr1| |dr0| |#G122| |#G121| |r1| |r0| |#G120| |#G119| #2=#:G261 |c0|
         |c1| |delta| |ds| |dt| |swapped| |#G117| |#G116|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |dr0| (SPADCALL |x| (QREFELT $ 28))
              . #3=(|POLYVEC;extended_gcd;2UvIL;24|))
        (LETT |swapped| 'NIL . #3#)
        (COND
         ((|less_SI| |dr0| 0)
          (SEQ
           (PROGN
            (LETT |#G116| |y| . #3#)
            (LETT |#G117| |x| . #3#)
            (LETT |x| |#G116| . #3#)
            (LETT |y| |#G117| . #3#))
           (LETT |dr1| |dr0| . #3#)
           (LETT |dr0| (SPADCALL |x| (QREFELT $ 28)) . #3#)
           (EXIT (LETT |swapped| 'T . #3#))))
         (#4='T (LETT |dr1| (SPADCALL |y| (QREFELT $ 28)) . #3#)))
        (EXIT
         (COND
          ((|less_SI| |dr1| 0)
           (COND
            ((|less_SI| |dr0| 0)
             (PROGN
              (LETT #1#
                    (LIST (GETREFV_U32 1 0) (GETREFV_U32 1 0)
                          (GETREFV_U32 1 1))
                    . #3#)
              (GO #1#)))
            (#4#
             (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #3#)
                  (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                  (LETT |c| (ELT_U32 |r0| |dr0|) . #3#)
                  (LETT |c| (SPADCALL |c| |p| (QREFELT $ 30)) . #3#)
                  (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 27))
                  (LETT |t0| (GETREFV_U32 1 |c|) . #3#)
                  (EXIT
                   (COND
                    (|swapped|
                     (PROGN
                      (LETT #1# (LIST |r0| (GETREFV_U32 1 0) |t0|) . #3#)
                      (GO #1#)))
                    (#4#
                     (PROGN
                      (LETT #1# (LIST |r0| |t0| (GETREFV_U32 1 0)) . #3#)
                      (GO #1#)))))))))
          (|swapped| (|error| "impossible"))
          (#4#
           (SEQ
            (LETT |dt|
                  (COND ((SPADCALL |dr0| 0 (QREFELT $ 40)) (|sub_SI| |dr0| 1))
                        (#4# 0))
                  . #3#)
            (LETT |ds|
                  (COND ((SPADCALL |dr1| 0 (QREFELT $ 40)) (|sub_SI| |dr1| 1))
                        (#4# 0))
                  . #3#)
            (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #3#)
            (LETT |t0| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #3#)
            (LETT |s0| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #3#)
            (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
            (SETELT_U32 |s0| 0 1)
            (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #3#)
            (LETT |t1| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #3#)
            (LETT |s1| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #3#)
            (SPADCALL |r1| |y| (|add_SI| |dr1| 1) (QREFELT $ 9))
            (SETELT_U32 |t1| 0 1)
            (SEQ G190
                 (COND ((NULL (SPADCALL |dr1| 0 (QREFELT $ 40))) (GO G191)))
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |dr0| |dr1| (QREFELT $ 48)))
                         (GO G191)))
                       (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #3#)
                            (LETT |c1| (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                  . #3#)
                            (LETT |c0| (ELT_U32 |r1| |dr1|) . #3#)
                            (COND
                             ((SPADCALL |c0| 1 (QREFELT $ 33))
                              (COND
                               ((SPADCALL |delta| 30 (QREFELT $ 40))
                                (SEQ
                                 (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 30))
                                       . #3#)
                                 (SPADCALL |r1| |dr1| |c0| |p| (QREFELT $ 27))
                                 (SPADCALL |t1| |dt| |c0| |p| (QREFELT $ 27))
                                 (SPADCALL |s1| |ds| |c0| |p| (QREFELT $ 27))
                                 (EXIT (LETT |c0| 1 . #3#)))))))
                            (SETELT_U32 |r0| |dr0| 0)
                            (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                            (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta| |p|
                                      (QREFELT $ 29))
                            (SPADCALL |t0| |c0| |t1| |c1| |dt| |delta| |p|
                                      (QREFELT $ 29))
                            (SPADCALL |s0| |c0| |s1| |c1| |ds| |delta| |p|
                                      (QREFELT $ 29))
                            (EXIT
                             (SEQ
                              (EXIT
                               (SEQ G190
                                    (COND
                                     ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                      (GO G191)))
                                    (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #3#)
                                         (EXIT
                                          (COND
                                           ((|less_SI| |dr0| 0)
                                            (PROGN
                                             (LETT #2# |$NoValue| . #3#)
                                             (GO #2#))))))
                                    NIL (GO G190) G191 (EXIT NIL)))
                              #2# (EXIT #2#))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (PROGN
                   (LETT |#G119| |r1| . #3#)
                   (LETT |#G120| |r0| . #3#)
                   (LETT |r0| |#G119| . #3#)
                   (LETT |r1| |#G120| . #3#))
                  (PROGN
                   (LETT |#G121| |dr1| . #3#)
                   (LETT |#G122| |dr0| . #3#)
                   (LETT |dr0| |#G121| . #3#)
                   (LETT |dr1| |#G122| . #3#))
                  (PROGN
                   (LETT |#G123| |s1| . #3#)
                   (LETT |#G124| |s0| . #3#)
                   (LETT |s0| |#G123| . #3#)
                   (LETT |s1| |#G124| . #3#))
                  (EXIT
                   (PROGN
                    (LETT |#G125| |t1| . #3#)
                    (LETT |#G126| |t0| . #3#)
                    (LETT |t0| |#G125| . #3#)
                    (LETT |t1| |#G126| . #3#))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |dr1| 0 (QREFELT $ 48))
               (SEQ (LETT |c| (ELT_U32 |r1| 0) . #3#)
                    (LETT |c| (SPADCALL |c| |p| (QREFELT $ 30)) . #3#)
                    (SETELT_U32 |r1| 0 1)
                    (SPADCALL |s1| |ds| |c| |p| (QREFELT $ 27))
                    (SPADCALL |t1| |dt| |c| |p| (QREFELT $ 27))
                    (EXIT
                     (PROGN (LETT #1# (LIST |r1| |s1| |t1|) . #3#) (GO #1#)))))
              (#4#
               (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #3#)
                    (LETT |c| (SPADCALL |c| |p| (QREFELT $ 30)) . #3#)
                    (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 27))
                    (SPADCALL |s0| |ds| |c| |p| (QREFELT $ 27))
                    (SPADCALL |t0| |dt| |c| |p| (QREFELT $ 27))
                    (EXIT (LIST |r0| |s0| |t0|))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |POLYVEC;resultant;2Uv2I;25| (|x| |y| |p| $)
  (PROG (|res| #1=#:G284 |dr0| |c1| |delta| |c0| |dr1| |#G134| |#G133| |r1|
         |r0| |#G132| |#G131|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |dr0| (SPADCALL |x| (QREFELT $ 28))
              . #2=(|POLYVEC;resultant;2Uv2I;25|))
        (EXIT
         (COND ((|less_SI| |dr0| 0) 0)
               (#3='T
                (SEQ (LETT |dr1| (SPADCALL |y| (QREFELT $ 28)) . #2#)
                     (EXIT
                      (COND ((|less_SI| |dr1| 0) 0)
                            (#3#
                             (SEQ
                              (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0)
                                    . #2#)
                              (SPADCALL |r0| |x| (|add_SI| |dr0| 1)
                                        (QREFELT $ 9))
                              (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0)
                                    . #2#)
                              (SPADCALL |r1| |y| (|add_SI| |dr1| 1)
                                        (QREFELT $ 9))
                              (LETT |res| 1 . #2#)
                              (EXIT
                               (SEQ G190 NIL
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|less_SI| |dr0| |dr1|)
                                        (SEQ
                                         (PROGN
                                          (LETT |#G131| |r1| . #2#)
                                          (LETT |#G132| |r0| . #2#)
                                          (LETT |r0| |#G131| . #2#)
                                          (LETT |r1| |#G132| . #2#))
                                         (EXIT
                                          (PROGN
                                           (LETT |#G133| |dr1| . #2#)
                                           (LETT |#G134| |dr0| . #2#)
                                           (LETT |dr0| |#G133| . #2#)
                                           (LETT |dr1| |#G134| . #2#)))))
                                       ('T
                                        (SEQ
                                         (LETT |c0| (ELT_U32 |r1| |dr1|) . #2#)
                                         (EXIT
                                          (COND
                                           ((|eql_SI| |dr1| 0)
                                            (SEQ
                                             (SEQ G190
                                                  (COND
                                                   ((NULL (|less_SI| 0 |dr0|))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |res|
                                                         (QSMULMOD32 |res| |c0|
                                                                     |p|)
                                                         . #2#)
                                                   (EXIT
                                                    (LETT |dr0|
                                                          (|sub_SI| |dr0| 1)
                                                          . #2#)))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (PROGN
                                               (LETT #1# |res| . #2#)
                                               (GO #1#)))))
                                           ('T
                                            (SEQ
                                             (LETT |delta|
                                                   (|sub_SI| |dr0| |dr1|)
                                                   . #2#)
                                             (LETT |c1|
                                                   (|sub_SI| |p|
                                                             (ELT_U32 |r0|
                                                                      |dr0|))
                                                   . #2#)
                                             (COND
                                              ((SPADCALL |c0| 1 (QREFELT $ 33))
                                               (LETT |c1|
                                                     (QSMULMOD32 |c1|
                                                                 (SPADCALL |c0|
                                                                           |p|
                                                                           (QREFELT
                                                                            $
                                                                            30))
                                                                 |p|)
                                                     . #2#)))
                                             (SETELT_U32 |r0| |dr0| 0)
                                             (LETT |dr0| (|sub_SI| |dr0| 1)
                                                   . #2#)
                                             (SPADCALL |r0| 1 |r1| |c1| |dr0|
                                                       |delta| |p|
                                                       (QREFELT $ 29))
                                             (LETT |res|
                                                   (QSMULMOD32 |res| |c0| |p|)
                                                   . #2#)
                                             (EXIT
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (EQL (ELT_U32 |r0| |dr0|)
                                                           0))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |dr0|
                                                          (|sub_SI| |dr0| 1)
                                                          . #2#)
                                                    (EXIT
                                                     (COND
                                                      ((|less_SI| |dr0| 0)
                                                       (PROGN
                                                        (LETT #1# 0 . #2#)
                                                        (GO #1#)))
                                                      ('T
                                                       (LETT |res|
                                                             (QSMULMOD32 |res|
                                                                         |c0|
                                                                         |p|)
                                                             . #2#)))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))))))))))))
                                    NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |U32VectorPolynomialOperations| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G286)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|U32VectorPolynomialOperations|)
                . #2=(|U32VectorPolynomialOperations|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|U32VectorPolynomialOperations|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|U32VectorPolynomialOperations;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|U32VectorPolynomialOperations|))))))))))) 

(DEFUN |U32VectorPolynomialOperations;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U32VectorPolynomialOperations|)
            . #1=(|U32VectorPolynomialOperations|))
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|U32VectorPolynomialOperations| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|U32VectorPolynomialOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|U32Vector|) (|Integer|)
              |POLYVEC;copy_first;2UvIV;1| |POLYVEC;copy_slice;2Uv2IV;2|
              (|SingleInteger|) (0 . |coerce|) |POLYVEC;eval_at;Uv4I;3|
              (|Boolean|) (|SparseUnivariatePolynomial| 8) (5 . |zero?|)
              (10 . |One|) (|NonNegativeInteger|) (14 . |degree|)
              (19 . |leadingCoefficient|) (24 . |positiveRemainder|)
              (30 . |reductum|) |POLYVEC;to_mod_pa;SupIUv;4|
              |POLYVEC;vector_add_mul;2Uv4IV;5|
              |POLYVEC;mul_by_binomial;Uv3IV;6|
              |POLYVEC;mul_by_binomial;Uv2IV;7| |POLYVEC;mul_by_scalar;Uv3IV;8|
              |POLYVEC;degree;UvI;9| |POLYVEC;vector_combination;UvIUv4IV;10|
              (35 . |invmod|) |POLYVEC;divide!;3UvIV;11|
              |POLYVEC;remainder!;2UvIV;12| (41 . ~=) (47 . >)
              |POLYVEC;gcd;2UvIUv;13| (|PrimitiveArray| 7)
              |POLYVEC;gcd;Pa3IUv;14| |POLYVEC;mul;2UvIUv;17|
              |POLYVEC;lcm;Pa3IUv;16| (53 . >) (59 . |copy|)
              |POLYVEC;truncated_mul_add;3Uv2IV;19|
              |POLYVEC;truncated_multiplication;2Uv2IUv;20| (|PositiveInteger|)
              |POLYVEC;pow;UvPiNniIUv;21| |POLYVEC;differentiate;UvIUv;22|
              |POLYVEC;differentiate;UvNniIUv;23| (64 . >=) (|List| 7)
              |POLYVEC;extended_gcd;2UvIL;24| |POLYVEC;resultant;2Uv2I;25|)
           '#(|vector_combination| 70 |vector_add_mul| 81
              |truncated_multiplication| 91 |truncated_mul_add| 99 |to_mod_pa|
              108 |resultant| 114 |remainder!| 121 |pow| 128 |mul_by_scalar|
              136 |mul_by_binomial| 144 |mul| 159 |lcm| 166 |gcd| 174
              |extended_gcd| 189 |eval_at| 196 |divide!| 204 |differentiate|
              212 |degree| 225 |copy_slice| 230 |copy_first| 238)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 11 0 8 12 1 15 14 0 16 0
                                                   15 0 17 1 15 18 0 19 1 15 8
                                                   0 20 2 8 0 0 0 21 1 15 0 0
                                                   22 2 8 0 0 0 30 2 8 14 0 0
                                                   33 2 8 14 0 0 34 2 11 14 0 0
                                                   40 1 7 0 0 41 2 11 14 0 0 48
                                                   7 0 6 7 8 7 8 8 8 8 29 6 0 6
                                                   7 7 8 8 8 8 24 4 0 7 7 7 8 8
                                                   43 5 0 6 7 7 7 8 8 42 2 0 7
                                                   15 8 23 3 0 8 7 7 8 51 3 0 6
                                                   7 7 8 32 4 0 7 7 44 18 8 45
                                                   4 0 6 7 8 8 8 27 3 0 6 7 8 8
                                                   26 4 0 6 7 8 8 8 25 3 0 7 7
                                                   7 8 38 4 0 7 36 8 8 8 39 3 0
                                                   7 7 7 8 35 4 0 7 36 8 8 8 37
                                                   3 0 49 7 7 8 50 4 0 8 7 8 8
                                                   8 13 4 0 6 7 7 7 8 31 2 0 7
                                                   7 8 46 3 0 7 7 18 8 47 1 0 8
                                                   7 28 4 0 6 7 7 8 8 10 3 0 6
                                                   7 7 8 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32VectorPolynomialOperations| 'NILADIC T) 
