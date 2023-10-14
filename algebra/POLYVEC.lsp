
(SDEFUN |POLYVEC;copy_first;2UvIV;1|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|n| |Integer|) ($ |Void|))
        (SPROG ((#1=#:G118 NIL) (|j| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n| . #2=(|POLYVEC;copy_first;2UvIV;1|))
                    (EXIT
                     (SEQ (LETT |j| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                          (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;copy_slice;2Uv2IV;2|
        ((|np| |U32Vector|) (|op| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         ($ |Void|))
        (SPROG
         ((#1=#:G122 NIL) (|j| NIL) (|ns| #2=(|SingleInteger|)) (|ms| #2#))
         (SEQ (LETT |ms| |m| . #3=(|POLYVEC;copy_slice;2Uv2IV;2|))
              (LETT |ns| |n| . #3#)
              (EXIT
               (SEQ (LETT |j| |ms| . #3#)
                    (LETT #1# (|sub_SI| (|add_SI| |ms| |ns|) 1) . #3#) G190
                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                    (SEQ (EXIT (SETELT_U32 |np| |j| (ELT_U32 |op| |j|))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |POLYVEC;eval_at;Uv4I;3|
        ((|v| |U32Vector|) (|deg| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Integer|))
        (SPROG ((|i| (|SingleInteger|)) (|res| (|Integer|)))
               (SEQ (LETT |i| |deg| . #1=(|POLYVEC;eval_at;Uv4I;3|))
                    (LETT |res| 0 . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (COND ((|less_SI| |i| 0) 'NIL) ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (QSMULADDMOD64-32 |pt| |res| (ELT_U32 |v| |i|)
                                                  |p|)
                                . #1#)
                          (EXIT (LETT |i| (|sub_SI| |i| 1) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |POLYVEC;to_mod_pa;SupIUv;4|
        ((|s| |SparseUnivariatePolynomial| (|Integer|)) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ncoeffs| (|U32Vector|))
          (|n0| (|SingleInteger|)))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT $ 14)) (GETREFV_U32 1 0))
                ('T
                 (SEQ
                  (LETT |n0| (SPADCALL |s| (QREFELT $ 17))
                        . #1=(|POLYVEC;to_mod_pa;SupIUv;4|))
                  (LETT |ncoeffs| (GETREFV_U32 (|add_SI| |n0| 1) 0) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |s| (QREFELT $ 14)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 17)) . #1#)
                            (SETELT_U32 |ncoeffs| |n|
                                        (SPADCALL (SPADCALL |s| (QREFELT $ 18))
                                                  |p| (QREFELT $ 19)))
                            (EXIT
                             (LETT |s| (SPADCALL |s| (QREFELT $ 20)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ncoeffs|))))))) 

(SDEFUN |POLYVEC;vector_add_mul;2Uv4IV;5|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|m| |Integer|) (|n| |Integer|)
         (|c| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPROG ((|i| NIL) (|ns| #1=(|SingleInteger|)) (|ms| #1#))
               (SEQ (LETT |ms| |m| . #2=(|POLYVEC;vector_add_mul;2Uv4IV;5|))
                    (LETT |ns| |n| . #2#)
                    (EXIT
                     (SEQ (LETT |i| |ms| . #2#) G190
                          (COND ((|greater_SI| |i| |ns|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v1| |i|
                                        (QSMULADDMOD64-32 |c|
                                                          (ELT_U32 |v2| |i|)
                                                          (ELT_U32 |v1| |i|)
                                                          |p|))))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv3IV;6|
        ((|v| |U32Vector|) (|n| |Integer|) (|pt| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((|prev_coeff| (|Integer|)) (|pp| (|Integer|)) (#1=#:G140 NIL)
          (|i| NIL) (|ns| (|SingleInteger|)))
         (SEQ (LETT |prev_coeff| 0 . #2=(|POLYVEC;mul_by_binomial;Uv3IV;6|))
              (LETT |ns| |n| . #2#)
              (EXIT
               (SEQ (LETT |i| 0 . #2#) (LETT #1# (|sub_SI| |ns| 1) . #2#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ (LETT |pp| (ELT_U32 |v| |i|) . #2#)
                         (SETELT_U32 |v| |i|
                                     (QSMULADDMOD64-32 |pt| |pp| |prev_coeff|
                                                       |p|))
                         (EXIT (LETT |prev_coeff| |pp| . #2#)))
                    (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |POLYVEC;mul_by_binomial;Uv2IV;7|
        ((|v| |U32Vector|) (|pt| |Integer|) (|p| |Integer|) ($ |Void|))
        (SPADCALL |v| (QV_LEN_U32 |v|) |pt| |p| (QREFELT $ 23))) 

(SDEFUN |POLYVEC;mul_by_scalar;Uv3IV;8|
        ((|v| |U32Vector|) (|n| |Integer|) (|c| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG ((|i| NIL) (|ns| (|SingleInteger|)))
               (SEQ (LETT |ns| |n| . #1=(|POLYVEC;mul_by_scalar;Uv3IV;8|))
                    (EXIT
                     (SEQ (LETT |i| 0 . #1#) G190
                          (COND ((|greater_SI| |i| |ns|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT_U32 |v| |i|
                                        (QSMULMOD32 |c| (ELT_U32 |v| |i|)
                                                    |p|))))
                          (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                          (EXIT NIL)))))) 

(SDEFUN |POLYVEC;degree;UvI;9| ((|v| |U32Vector|) ($ |Integer|))
        (SPROG
         ((#1=#:G149 NIL) (#2=#:G150 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QV_LEN_U32 |v|) . #3=(|POLYVEC;degree;UvI;9|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1) . #3#) G190
                       (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (EQL (ELT_U32 |v| |i|) 0))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# |i| . #3#) (GO #4=#:G148))
                                  . #3#)
                            (GO #5=#:G146))))))
                       (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #1#))
                (EXIT -1)))
          #4# (EXIT #2#)))) 

(SDEFUN |POLYVEC;vector_combination;UvIUv4IV;10|
        ((|v1| |U32Vector|) (|c1| |Integer|) (|v2| |U32Vector|)
         (|c2| |Integer|) (|n| |Integer|) (|delta| |Integer|) (|p| |Integer|)
         ($ |Void|))
        (SPROG
         ((|i| NIL) (#1=#:G159 NIL) (|ds| #2=(|SingleInteger|)) (|ns| #2#))
         (SEQ (LETT |ns| |n| . #3=(|POLYVEC;vector_combination;UvIUv4IV;10|))
              (LETT |ds| |delta| . #3#)
              (EXIT
               (COND
                ((EQL |c1| 1)
                 (SEQ (LETT |i| |ds| . #3#) G190
                      (COND ((|greater_SI| |i| |ns|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULADDMOD64-32 |c2|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      (ELT_U32 |v1| |i|)
                                                      |p|))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))
                ((|less_SI| (|add_SI| |ns| 1) |ds|)
                 (SEQ (LETT |i| 0 . #3#) G190
                      (COND ((|greater_SI| |i| |ns|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT_U32 |v1| |i|
                                    (QSMULMOD32 (ELT_U32 |v1| |i|) |c1| |p|))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))
                ('T
                 (SEQ
                  (SEQ (LETT |i| 0 . #3#) (LETT #1# (|sub_SI| |ds| 1) . #3#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT_U32 |v1| |i|
                                     (QSMULMOD32 (ELT_U32 |v1| |i|) |c1|
                                                 |p|))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |i| |ds| . #3#) G190
                        (COND ((|greater_SI| |i| |ns|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT_U32 |v1| |i|
                                      (QSDOT2MOD64-32 (ELT_U32 |v1| |i|) |c1|
                                                      (ELT_U32 |v2|
                                                               (|sub_SI| |i|
                                                                         |ds|))
                                                      |c2| |p|))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |POLYVEC;divide!;3UvIV;11|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|res| |U32Vector|)
         (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G166 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G167 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ
          (LETT |dr0| (SPADCALL |r0| (QREFELT $ 26))
                . #4=(|POLYVEC;divide!;3UvIV;11|))
          (LETT |dr1| (SPADCALL |r1| (QREFELT $ 26)) . #4#)
          (LETT |c0| (ELT_U32 |r1| |dr1|) . #4#)
          (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 28)) . #4#)
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190
                  (COND
                   ((NULL (COND ((|less_SI| |dr0| |dr1|) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #4#)
                       (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|)
                             . #4#)
                       (SETELT_U32 |res| |delta| |c1|)
                       (LETT |c1| (- |p| |c1|) . #4#) (SETELT_U32 |r0| |dr0| 0)
                       (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                       (COND
                        ((|less_SI| |dr0| 0)
                         (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G163))))
                       (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                 (QREFELT $ 27))
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND
                                ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                 (GO G191)))
                               (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                                    (EXIT
                                     (COND
                                      ((|less_SI| |dr0| 0)
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #6=#:G161))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #5# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;remainder!;2UvIV;12|
        ((|r0| |U32Vector|) (|r1| |U32Vector|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G174 NIL) (|dr0| #2=(|SingleInteger|)) (#3=#:G175 NIL)
          (|c1| (|Integer|)) (|delta| (|SingleInteger|)) (|c0| (|Integer|))
          (|dr1| #2#))
         (SEQ
          (LETT |dr0| (SPADCALL |r0| (QREFELT $ 26))
                . #4=(|POLYVEC;remainder!;2UvIV;12|))
          (LETT |dr1| (SPADCALL |r1| (QREFELT $ 26)) . #4#)
          (LETT |c0| (ELT_U32 |r1| |dr1|) . #4#)
          (LETT |c0| (SPADCALL |c0| |p| (QREFELT $ 28)) . #4#)
          (EXIT
           (SEQ
            (EXIT
             (SEQ G190
                  (COND
                   ((NULL (COND ((|less_SI| |dr0| |dr1|) 'NIL) ('T 'T)))
                    (GO G191)))
                  (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #4#)
                       (LETT |c1| (QSMULMOD32 |c0| (ELT_U32 |r0| |dr0|) |p|)
                             . #4#)
                       (LETT |c1| (- |p| |c1|) . #4#) (SETELT_U32 |r0| |dr0| 0)
                       (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                       (COND
                        ((|less_SI| |dr0| 0)
                         (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G171))))
                       (SPADCALL |r0| 1 |r1| |c1| |dr0| |delta| |p|
                                 (QREFELT $ 27))
                       (EXIT
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND
                                ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                 (GO G191)))
                               (SEQ (LETT |dr0| (|sub_SI| |dr0| 1) . #4#)
                                    (EXIT
                                     (COND
                                      ((|less_SI| |dr0| 0)
                                       (PROGN
                                        (LETT #1# |$NoValue| . #4#)
                                        (GO #6=#:G169))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))))
                  NIL (GO G190) G191 (EXIT NIL)))
            #5# (EXIT #3#)))))) 

(SDEFUN |POLYVEC;gcd;2UvIUv;13|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G193 NIL) (|c| #2=(|Integer|)) (|dr1| #3=(|SingleInteger|))
          (|r1| #4=(|U32Vector|)) (|dr0| #3#) (|r0| #4#)
          (|tmp| #5=(|SingleInteger|)) (|tmpp| (|U32Vector|)) (#6=#:G192 NIL)
          (|c0| #2#) (|c1| NIL) (|delta| #5#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |y| (QREFELT $ 26))
                  . #7=(|POLYVEC;gcd;2UvIUv;13|))
            (COND
             ((|less_SI| |dr0| 0)
              (SEQ (LETT |tmpp| |x| . #7#) (LETT |x| |y| . #7#)
                   (LETT |y| |tmpp| . #7#) (LETT |dr1| |dr0| . #7#)
                   (EXIT (LETT |dr0| (SPADCALL |y| (QREFELT $ 26)) . #7#))))
             (#8='T (LETT |dr1| (SPADCALL |x| (QREFELT $ 26)) . #7#)))
            (EXIT
             (COND
              ((|less_SI| |dr0| 0)
               (PROGN (LETT #1# (GETREFV_U32 1 0) . #7#) (GO #9=#:G191)))
              (#8#
               (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #7#)
                    (SPADCALL |r0| |y| (|add_SI| |dr0| 1) (QREFELT $ 9))
                    (EXIT
                     (COND
                      ((|less_SI| |dr1| 0)
                       (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #7#)
                            (LETT |c| (SPADCALL |c| |p| (QREFELT $ 28)) . #7#)
                            (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 25))
                            (EXIT (PROGN (LETT #1# |r0| . #7#) (GO #9#)))))
                      (#8#
                       (SEQ
                        (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #7#)
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
                                    (LETT |delta| (|sub_SI| |dr0| |dr1|) . #7#)
                                    (LETT |c1|
                                          (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                          . #7#)
                                    (LETT |c0| (ELT_U32 |r1| |dr1|) . #7#)
                                    (COND
                                     ((SPADCALL |c0| 1 (QREFELT $ 31))
                                      (COND
                                       ((SPADCALL |delta| 30 (QREFELT $ 32))
                                        (SEQ
                                         (LETT |c0|
                                               (SPADCALL |c0| |p|
                                                         (QREFELT $ 28))
                                               . #7#)
                                         (SPADCALL |r1| |dr1| |c0| |p|
                                                   (QREFELT $ 25))
                                         (EXIT (LETT |c0| 1 . #7#)))))))
                                    (SETELT_U32 |r0| |dr0| 0)
                                    (LETT |dr0| (|sub_SI| |dr0| 1) . #7#)
                                    (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta|
                                              |p| (QREFELT $ 27))
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
                                                   . #7#)
                                             (EXIT
                                              (COND
                                               ((|less_SI| |dr0| 0)
                                                (PROGN
                                                 (LETT #6# |$NoValue| . #7#)
                                                 (GO #10=#:G181))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #10# (EXIT #6#))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |tmpp| |r0| . #7#) (LETT |tmp| |dr0| . #7#)
                              (LETT |r0| |r1| . #7#) (LETT |dr0| |dr1| . #7#)
                              (LETT |r1| |tmpp| . #7#)
                              (EXIT (LETT |dr1| |tmp| . #7#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((|less_SI| |dr1| 0)
                           (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #7#)
                                (LETT |c| (SPADCALL |c| |p| (QREFELT $ 28))
                                      . #7#)
                                (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 25))
                                (EXIT |r0|)))
                          (#8#
                           (SEQ (SETELT_U32 |r1| 0 1)
                                (EXIT
                                 (PROGN
                                  (LETT #1# |r1| . #7#)
                                  (GO #9#)))))))))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |POLYVEC;gcd;Pa3IUv;14|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (|i| NIL))
               (SEQ
                (LETT |res| (QAREF1 |a| |lo|) . #1=(|POLYVEC;gcd;Pa3IUv;14|))
                (SEQ (LETT |i| (+ |lo| 1) . #1#) G190
                     (COND ((> |i| |hi|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL (QAREF1 |a| |i|) |res| |p|
                                       (QREFELT $ 33))
                             . #1#)))
                     (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |POLYVEC;lcm2|
        ((|v1| |U32Vector|) (|v2| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|tmp2| #1=(|U32Vector|)) (|tmp1| #1#) (|dpp| #2=(|Integer|))
          (|dv2| #2#) (|pp| (|U32Vector|)))
         (SEQ
          (LETT |pp| (SPADCALL |v1| |v2| |p| (QREFELT $ 33))
                . #3=(|POLYVEC;lcm2|))
          (LETT |dv2| (SPADCALL |v2| (QREFELT $ 26)) . #3#)
          (LETT |dpp| (SPADCALL |pp| (QREFELT $ 26)) . #3#)
          (EXIT
           (COND ((EQL |dv2| |dpp|) |v1|)
                 ((EQL |dpp| 0) (SPADCALL |v1| |v2| |p| (QREFELT $ 36)))
                 ('T
                  (SEQ (LETT |tmp1| (GETREFV_U32 (+ |dv2| 1) 0) . #3#)
                       (LETT |tmp2| (GETREFV_U32 (+ (- |dv2| |dpp|) 1) 0)
                             . #3#)
                       (SPADCALL |tmp1| |v2| (+ |dv2| 1) (QREFELT $ 9))
                       (SPADCALL |tmp1| |pp| |tmp2| |p| (QREFELT $ 29))
                       (EXIT (SPADCALL |v1| |tmp2| |p| (QREFELT $ 36)))))))))) 

(SDEFUN |POLYVEC;lcm;Pa3IUv;16|
        ((|a| |PrimitiveArray| (|U32Vector|)) (|lo| |Integer|) (|hi| |Integer|)
         (|p| |Integer|) ($ |U32Vector|))
        (SPROG ((|res| (|U32Vector|)) (|i| NIL))
               (SEQ
                (LETT |res| (QAREF1 |a| |lo|) . #1=(|POLYVEC;lcm;Pa3IUv;16|))
                (SEQ (LETT |i| (+ |lo| 1) . #1#) G190
                     (COND ((> |i| |hi|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (|POLYVEC;lcm2| (QAREF1 |a| |i|) |res| |p| $)
                             . #1#)))
                     (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |POLYVEC;mul;2UvIUv;17|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|zcoeffs| (|U32Vector|)) (|zdeg0| (|NonNegativeInteger|))
          (|zdeg| (|SingleInteger|)) (|ycoeffs| (|U32Vector|))
          (|xcoeffs| #1=(|U32Vector|)) (|ydeg| #2=(|SingleInteger|))
          (|xdeg| #2#) (|tmp| #2#) (|tmpp| #1#))
         (SEQ
          (LETT |xdeg| (SPADCALL |x| (QREFELT $ 26))
                . #3=(|POLYVEC;mul;2UvIUv;17|))
          (LETT |ydeg| (SPADCALL |y| (QREFELT $ 26)) . #3#)
          (COND
           ((SPADCALL |xdeg| |ydeg| (QREFELT $ 39))
            (SEQ (LETT |tmpp| |x| . #3#) (LETT |tmp| |xdeg| . #3#)
                 (LETT |x| |y| . #3#) (LETT |xdeg| |ydeg| . #3#)
                 (LETT |y| |tmpp| . #3#) (EXIT (LETT |ydeg| |tmp| . #3#)))))
          (LETT |xcoeffs| |x| . #3#) (LETT |ycoeffs| |y| . #3#)
          (EXIT
           (COND ((|less_SI| |xdeg| 0) |x|)
                 ('T
                  (SEQ
                   (COND
                    ((|eql_SI| |xdeg| 0)
                     (COND
                      ((EQL (ELT_U32 |xcoeffs| 0) 1)
                       (EXIT (SPADCALL |y| (QREFELT $ 40)))))))
                   (LETT |zdeg| (|add_SI| |xdeg| |ydeg|) . #3#)
                   (LETT |zdeg0| (|add_SI| |zdeg| 1) . #3#)
                   (LETT |zcoeffs| (GETREFV_U32 |zdeg0| 0) . #3#)
                   (|POLYVEC;inner_mul| |xcoeffs| |ycoeffs| |zcoeffs| |xdeg|
                    |ydeg| |zdeg| |p| $)
                   (EXIT |zcoeffs|)))))))) 

(SDEFUN |POLYVEC;inner_mul|
        ((|x| . #1=(|U32Vector|)) (|y| |U32Vector|) (|z| |U32Vector|)
         (|xdeg| . #2=(|SingleInteger|)) (|ydeg| |SingleInteger|)
         (|zdeg| |SingleInteger|) (|p| |Integer|) ($ |Void|))
        (SPROG
         ((|ss| (|Integer|)) (|j| NIL) (|i| NIL) (|tmp| #2#) (|tmpp| #1#))
         (SEQ
          (COND
           ((|less_SI| |ydeg| |xdeg|)
            (SEQ (LETT |tmpp| |x| . #3=(|POLYVEC;inner_mul|))
                 (LETT |tmp| |xdeg| . #3#) (LETT |x| |y| . #3#)
                 (LETT |xdeg| |ydeg| . #3#) (LETT |y| |tmpp| . #3#)
                 (EXIT (LETT |ydeg| |tmp| . #3#)))))
          (LETT |xdeg| (COND ((|less_SI| |zdeg| |xdeg|) |zdeg|) (#4='T |xdeg|))
                . #3#)
          (LETT |ydeg| (COND ((|less_SI| |zdeg| |ydeg|) |zdeg|) (#4# |ydeg|))
                . #3#)
          (SEQ (LETT |i| 0 . #3#) G190
               (COND ((|greater_SI| |i| |xdeg|) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #3#)
                    (SEQ (LETT |j| 0 . #3#) G190
                         (COND ((|greater_SI| |j| |i|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64-32 (ELT_U32 |x| (- |i| |j|))
                                                (ELT_U32 |y| |j|) |ss|)
                                 . #3#)))
                         (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (|add_SI| |xdeg| 1) . #3#) G190
               (COND ((|greater_SI| |i| |ydeg|) (GO G191)))
               (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #3#)
                    (SEQ (LETT |j| 0 . #3#) G190
                         (COND ((|greater_SI| |j| |xdeg|) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ss|
                                 (QSMULADD64-32 (ELT_U32 |x| |j|)
                                                (ELT_U32 |y| (- |i| |j|)) |ss|)
                                 . #3#)))
                         (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| (|add_SI| |ydeg| 1) . #3#) G190
                (COND ((|greater_SI| |i| |zdeg|) (GO G191)))
                (SEQ (LETT |ss| (ELT_U32 |z| |i|) . #3#)
                     (SEQ (LETT |j| (|sub_SI| |i| |xdeg|) . #3#) G190
                          (COND ((|greater_SI| |j| |ydeg|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |ss|
                                  (QSMULADD64-32
                                   (ELT_U32 |x| (|sub_SI| |i| |j|))
                                   (ELT_U32 |y| |j|) |ss|)
                                  . #3#)))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT (SETELT_U32 |z| |i| (QSMOD64-32 |ss| |p|))))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |POLYVEC;truncated_mul_add;3Uv2IV;19|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|z| |U32Vector|) (|m| |Integer|)
         (|p| |Integer|) ($ |Void|))
        (SPROG ((|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ
                (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
                      . #2=(|POLYVEC;truncated_mul_add;3Uv2IV;19|))
                (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #2#)
                (EXIT
                 (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $))))) 

(SDEFUN |POLYVEC;truncated_multiplication;2Uv2IUv;20|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|m| |Integer|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG ((|z| (|U32Vector|)) (|ydeg| #1=(|SingleInteger|)) (|xdeg| #1#))
               (SEQ
                (LETT |xdeg| (- (QV_LEN_U32 |x|) 1)
                      . #2=(|POLYVEC;truncated_multiplication;2Uv2IUv;20|))
                (LETT |ydeg| (- (QV_LEN_U32 |y|) 1) . #2#)
                (LETT |z| (GETREFV_U32 (|add_SI| |m| 1) 0) . #2#)
                (|POLYVEC;inner_mul| |x| |y| |z| |xdeg| |ydeg| |m| |p| $)
                (EXIT |z|)))) 

(SDEFUN |POLYVEC;pow;UvPiNniIUv;21|
        ((|x| |U32Vector|) (|n| |PositiveInteger|) (|d| |NonNegativeInteger|)
         (|p| |Integer|) ($ |U32Vector|))
        (COND ((EQL |n| 1) |x|)
              ((ODDP |n|)
               (SPADCALL |x|
                         (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 42))
                                   (ASH |n| -1) |d| |p| (QREFELT $ 44))
                         |d| |p| (QREFELT $ 42)))
              ('T
               (SPADCALL (SPADCALL |x| |x| |d| |p| (QREFELT $ 42)) (ASH |n| -1)
                         |d| |p| (QREFELT $ 44))))) 

(SDEFUN |POLYVEC;differentiate;UvIUv;22|
        ((|x| |U32Vector|) (|p| |Integer|) ($ |U32Vector|))
        (SPROG
         ((|i1| (|NonNegativeInteger|)) (#1=#:G234 NIL) (|i| NIL)
          (|r| (|U32Vector|)) (#2=#:G228 NIL) (|d| (|Integer|)))
         (SEQ
          (LETT |d| (- (QV_LEN_U32 |x|) 1)
                . #3=(|POLYVEC;differentiate;UvIUv;22|))
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
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |r|)))))))) 

(SDEFUN |POLYVEC;differentiate;UvNniIUv;23|
        ((|x| |U32Vector|) (|n| |NonNegativeInteger|) (|p| |Integer|)
         ($ |U32Vector|))
        (SPROG
         ((|f| (|Integer|)) (|k| NIL) (|j| #1=(|Integer|)) (|i| NIL)
          (|r| (|U32Vector|)) (|d| #1#))
         (SEQ
          (COND ((ZEROP |n|) |x|)
                (#2='T
                 (SEQ
                  (LETT |d| (- (QV_LEN_U32 |x|) 1)
                        . #3=(|POLYVEC;differentiate;UvNniIUv;23|))
                  (EXIT
                   (COND ((< |d| |n|) (GETREFV_U32 0 0))
                         (#2#
                          (SEQ
                           (LETT |r| (GETREFV_U32 (+ (- |d| |n|) 1) 0) . #3#)
                           (SEQ (LETT |i| |n| . #3#) G190
                                (COND ((> |i| |d|) (GO G191)))
                                (SEQ (LETT |j| (- |i| |n|) . #3#)
                                     (LETT |f| (+ |j| 1) . #3#)
                                     (SEQ (LETT |k| (+ |j| 2) . #3#) G190
                                          (COND ((> |k| |i|) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |f| (QSMULMOD32 |f| |k| |p|)
                                                  . #3#)))
                                          (LETT |k| (+ |k| 1) . #3#) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (SETELT_U32 |r| |j|
                                                  (QSMULMOD32 |f|
                                                              (ELT_U32 |x| |i|)
                                                              |p|))))
                                (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |r|))))))))))) 

(SDEFUN |POLYVEC;extended_gcd;2UvIL;24|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|)
         ($ |List| (|U32Vector|)))
        (SPROG
         ((|c| #1=(|Integer|)) (#2=#:G258 NIL) (|t1| #3=(|U32Vector|))
          (|t0| #3#) (|#G126| #3#) (|#G125| #3#) (|s1| #3#) (|s0| #3#)
          (|#G124| #3#) (|#G123| #3#) (|dr1| #4=(|SingleInteger|)) (|dr0| #4#)
          (|#G122| #5=(|SingleInteger|)) (|#G121| #4#) (|r1| #3#) (|r0| #3#)
          (|#G120| #3#) (|#G119| #3#) (#6=#:G257 NIL) (|c0| #1#) (|c1| NIL)
          (|delta| #5#) (|ds| #7=(|SingleInteger|)) (|dt| #7#)
          (|swapped| (|Boolean|)) (|#G117| (|U32Vector|))
          (|#G116| (|U32Vector|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |x| (QREFELT $ 26))
                  . #8=(|POLYVEC;extended_gcd;2UvIL;24|))
            (LETT |swapped| 'NIL . #8#)
            (COND
             ((|less_SI| |dr0| 0)
              (SEQ
               (PROGN
                (LETT |#G116| |y| . #8#)
                (LETT |#G117| |x| . #8#)
                (LETT |x| |#G116| . #8#)
                (LETT |y| |#G117| . #8#))
               (LETT |dr1| |dr0| . #8#)
               (LETT |dr0| (SPADCALL |x| (QREFELT $ 26)) . #8#)
               (EXIT (LETT |swapped| 'T . #8#))))
             (#9='T (LETT |dr1| (SPADCALL |y| (QREFELT $ 26)) . #8#)))
            (EXIT
             (COND
              ((|less_SI| |dr1| 0)
               (COND
                ((|less_SI| |dr0| 0)
                 (PROGN
                  (LETT #2#
                        (LIST (GETREFV_U32 1 0) (GETREFV_U32 1 0)
                              (GETREFV_U32 1 1))
                        . #8#)
                  (GO #10=#:G256)))
                (#9#
                 (SEQ (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #8#)
                      (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                      (LETT |c| (ELT_U32 |r0| |dr0|) . #8#)
                      (LETT |c| (SPADCALL |c| |p| (QREFELT $ 28)) . #8#)
                      (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 25))
                      (LETT |t0| (GETREFV_U32 1 |c|) . #8#)
                      (EXIT
                       (COND
                        (|swapped|
                         (PROGN
                          (LETT #2# (LIST |r0| (GETREFV_U32 1 0) |t0|) . #8#)
                          (GO #10#)))
                        (#9#
                         (PROGN
                          (LETT #2# (LIST |r0| |t0| (GETREFV_U32 1 0)) . #8#)
                          (GO #10#)))))))))
              (|swapped| (|error| "impossible"))
              (#9#
               (SEQ
                (LETT |dt|
                      (COND
                       ((SPADCALL |dr0| 0 (QREFELT $ 39)) (|sub_SI| |dr0| 1))
                       (#9# 0))
                      . #8#)
                (LETT |ds|
                      (COND
                       ((SPADCALL |dr1| 0 (QREFELT $ 39)) (|sub_SI| |dr1| 1))
                       (#9# 0))
                      . #8#)
                (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0) . #8#)
                (LETT |t0| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #8#)
                (LETT |s0| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #8#)
                (SPADCALL |r0| |x| (|add_SI| |dr0| 1) (QREFELT $ 9))
                (SETELT_U32 |s0| 0 1)
                (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0) . #8#)
                (LETT |t1| (GETREFV_U32 (|add_SI| |dt| 1) 0) . #8#)
                (LETT |s1| (GETREFV_U32 (|add_SI| |ds| 1) 0) . #8#)
                (SPADCALL |r1| |y| (|add_SI| |dr1| 1) (QREFELT $ 9))
                (SETELT_U32 |t1| 0 1)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |dr1| 0 (QREFELT $ 39))) (GO G191)))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |dr0| |dr1| (QREFELT $ 47)))
                             (GO G191)))
                           (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|) . #8#)
                                (LETT |c1| (|sub_SI| |p| (ELT_U32 |r0| |dr0|))
                                      . #8#)
                                (LETT |c0| (ELT_U32 |r1| |dr1|) . #8#)
                                (COND
                                 ((SPADCALL |c0| 1 (QREFELT $ 31))
                                  (COND
                                   ((SPADCALL |delta| 30 (QREFELT $ 39))
                                    (SEQ
                                     (LETT |c0|
                                           (SPADCALL |c0| |p| (QREFELT $ 28))
                                           . #8#)
                                     (SPADCALL |r1| |dr1| |c0| |p|
                                               (QREFELT $ 25))
                                     (SPADCALL |t1| |dt| |c0| |p|
                                               (QREFELT $ 25))
                                     (SPADCALL |s1| |ds| |c0| |p|
                                               (QREFELT $ 25))
                                     (EXIT (LETT |c0| 1 . #8#)))))))
                                (SETELT_U32 |r0| |dr0| 0)
                                (LETT |dr0| (|sub_SI| |dr0| 1) . #8#)
                                (SPADCALL |r0| |c0| |r1| |c1| |dr0| |delta| |p|
                                          (QREFELT $ 27))
                                (SPADCALL |t0| |c0| |t1| |c1| |dt| |delta| |p|
                                          (QREFELT $ 27))
                                (SPADCALL |s0| |c0| |s1| |c1| |ds| |delta| |p|
                                          (QREFELT $ 27))
                                (EXIT
                                 (SEQ
                                  (EXIT
                                   (SEQ G190
                                        (COND
                                         ((NULL (EQL (ELT_U32 |r0| |dr0|) 0))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |dr0| (|sub_SI| |dr0| 1) . #8#)
                                         (EXIT
                                          (COND
                                           ((|less_SI| |dr0| 0)
                                            (PROGN
                                             (LETT #6# |$NoValue| . #8#)
                                             (GO #11=#:G247))))))
                                        NIL (GO G190) G191 (EXIT NIL)))
                                  #11# (EXIT #6#))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (PROGN
                       (LETT |#G119| |r1| . #8#)
                       (LETT |#G120| |r0| . #8#)
                       (LETT |r0| |#G119| . #8#)
                       (LETT |r1| |#G120| . #8#))
                      (PROGN
                       (LETT |#G121| |dr1| . #8#)
                       (LETT |#G122| |dr0| . #8#)
                       (LETT |dr0| |#G121| . #8#)
                       (LETT |dr1| |#G122| . #8#))
                      (PROGN
                       (LETT |#G123| |s1| . #8#)
                       (LETT |#G124| |s0| . #8#)
                       (LETT |s0| |#G123| . #8#)
                       (LETT |s1| |#G124| . #8#))
                      (EXIT
                       (PROGN
                        (LETT |#G125| |t1| . #8#)
                        (LETT |#G126| |t0| . #8#)
                        (LETT |t0| |#G125| . #8#)
                        (LETT |t1| |#G126| . #8#))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |dr1| 0 (QREFELT $ 47))
                   (SEQ (LETT |c| (ELT_U32 |r1| 0) . #8#)
                        (LETT |c| (SPADCALL |c| |p| (QREFELT $ 28)) . #8#)
                        (SETELT_U32 |r1| 0 1)
                        (SPADCALL |s1| |ds| |c| |p| (QREFELT $ 25))
                        (SPADCALL |t1| |dt| |c| |p| (QREFELT $ 25))
                        (EXIT
                         (PROGN
                          (LETT #2# (LIST |r1| |s1| |t1|) . #8#)
                          (GO #10#)))))
                  (#9#
                   (SEQ (LETT |c| (ELT_U32 |r0| |dr0|) . #8#)
                        (LETT |c| (SPADCALL |c| |p| (QREFELT $ 28)) . #8#)
                        (SPADCALL |r0| |dr0| |c| |p| (QREFELT $ 25))
                        (SPADCALL |s0| |ds| |c| |p| (QREFELT $ 25))
                        (SPADCALL |t0| |dt| |c| |p| (QREFELT $ 25))
                        (EXIT (LIST |r0| |s0| |t0|))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |POLYVEC;resultant;2Uv2I;25|
        ((|x| |U32Vector|) (|y| |U32Vector|) (|p| |Integer|) ($ |Integer|))
        (SPROG
         ((|res| (|SingleInteger|)) (#1=#:G273 NIL)
          (|dr0| #2=(|SingleInteger|)) (|c1| NIL) (|delta| (|SingleInteger|))
          (|c0| (|Integer|)) (|dr1| #2#) (|#G134| #2#) (|#G133| #2#)
          (|r1| #3=(|U32Vector|)) (|r0| #3#) (|#G132| #3#) (|#G131| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |dr0| (SPADCALL |x| (QREFELT $ 26))
                  . #4=(|POLYVEC;resultant;2Uv2I;25|))
            (EXIT
             (COND ((|less_SI| |dr0| 0) 0)
                   (#5='T
                    (SEQ (LETT |dr1| (SPADCALL |y| (QREFELT $ 26)) . #4#)
                         (EXIT
                          (COND ((|less_SI| |dr1| 0) 0)
                                (#5#
                                 (SEQ
                                  (LETT |r0| (GETREFV_U32 (|add_SI| |dr0| 1) 0)
                                        . #4#)
                                  (SPADCALL |r0| |x| (|add_SI| |dr0| 1)
                                            (QREFELT $ 9))
                                  (LETT |r1| (GETREFV_U32 (|add_SI| |dr1| 1) 0)
                                        . #4#)
                                  (SPADCALL |r1| |y| (|add_SI| |dr1| 1)
                                            (QREFELT $ 9))
                                  (LETT |res| 1 . #4#)
                                  (EXIT
                                   (SEQ G190 NIL
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((|less_SI| |dr0| |dr1|)
                                            (SEQ
                                             (PROGN
                                              (LETT |#G131| |r1| . #4#)
                                              (LETT |#G132| |r0| . #4#)
                                              (LETT |r0| |#G131| . #4#)
                                              (LETT |r1| |#G132| . #4#))
                                             (EXIT
                                              (PROGN
                                               (LETT |#G133| |dr1| . #4#)
                                               (LETT |#G134| |dr0| . #4#)
                                               (LETT |dr0| |#G133| . #4#)
                                               (LETT |dr1| |#G134| . #4#)))))
                                           ('T
                                            (SEQ
                                             (LETT |c0| (ELT_U32 |r1| |dr1|)
                                                   . #4#)
                                             (EXIT
                                              (COND
                                               ((|eql_SI| |dr1| 0)
                                                (SEQ
                                                 (SEQ G190
                                                      (COND
                                                       ((NULL
                                                         (|less_SI| 0 |dr0|))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |res|
                                                             (QSMULMOD32 |res|
                                                                         |c0|
                                                                         |p|)
                                                             . #4#)
                                                       (EXIT
                                                        (LETT |dr0|
                                                              (|sub_SI| |dr0|
                                                                        1)
                                                              . #4#)))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #1# |res| . #4#)
                                                   (GO #6=#:G272)))))
                                               ('T
                                                (SEQ
                                                 (LETT |delta|
                                                       (|sub_SI| |dr0| |dr1|)
                                                       . #4#)
                                                 (LETT |c1|
                                                       (|sub_SI| |p|
                                                                 (ELT_U32 |r0|
                                                                          |dr0|))
                                                       . #4#)
                                                 (COND
                                                  ((SPADCALL |c0| 1
                                                             (QREFELT $ 31))
                                                   (LETT |c1|
                                                         (QSMULMOD32 |c1|
                                                                     (SPADCALL
                                                                      |c0| |p|
                                                                      (QREFELT
                                                                       $ 28))
                                                                     |p|)
                                                         . #4#)))
                                                 (SETELT_U32 |r0| |dr0| 0)
                                                 (LETT |dr0| (|sub_SI| |dr0| 1)
                                                       . #4#)
                                                 (SPADCALL |r0| 1 |r1| |c1|
                                                           |dr0| |delta| |p|
                                                           (QREFELT $ 27))
                                                 (LETT |res|
                                                       (QSMULMOD32 |res| |c0|
                                                                   |p|)
                                                       . #4#)
                                                 (EXIT
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (EQL
                                                           (ELT_U32 |r0| |dr0|)
                                                           0))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |dr0|
                                                              (|sub_SI| |dr0|
                                                                        1)
                                                              . #4#)
                                                        (EXIT
                                                         (COND
                                                          ((|less_SI| |dr0| 0)
                                                           (PROGN
                                                            (LETT #1# 0 . #4#)
                                                            (GO #6#)))
                                                          ('T
                                                           (LETT |res|
                                                                 (QSMULMOD32
                                                                  |res| |c0|
                                                                  |p|)
                                                                 . #4#)))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))))))))))))
                                        NIL (GO G190) G191
                                        (EXIT NIL)))))))))))))
          #6# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |U32VectorPolynomialOperations;|)) 

(DEFUN |U32VectorPolynomialOperations| ()
  (SPROG NIL
         (PROG (#1=#:G275)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|U32VectorPolynomialOperations|)
                    . #2=(|U32VectorPolynomialOperations|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|U32VectorPolynomialOperations|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|U32VectorPolynomialOperations;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|U32VectorPolynomialOperations|)))))))))) 

(DEFUN |U32VectorPolynomialOperations;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|U32VectorPolynomialOperations|)
                . #1=(|U32VectorPolynomialOperations|))
          (LETT $ (GETREFV 51) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|U32VectorPolynomialOperations| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|U32VectorPolynomialOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|U32Vector|) (|Integer|)
              |POLYVEC;copy_first;2UvIV;1| |POLYVEC;copy_slice;2Uv2IV;2|
              |POLYVEC;eval_at;Uv4I;3| (|Boolean|)
              (|SparseUnivariatePolynomial| 8) (0 . |zero?|) (5 . |One|)
              (|NonNegativeInteger|) (9 . |degree|) (14 . |leadingCoefficient|)
              (19 . |positiveRemainder|) (25 . |reductum|)
              |POLYVEC;to_mod_pa;SupIUv;4| |POLYVEC;vector_add_mul;2Uv4IV;5|
              |POLYVEC;mul_by_binomial;Uv3IV;6|
              |POLYVEC;mul_by_binomial;Uv2IV;7| |POLYVEC;mul_by_scalar;Uv3IV;8|
              |POLYVEC;degree;UvI;9| |POLYVEC;vector_combination;UvIUv4IV;10|
              (30 . |invmod|) |POLYVEC;divide!;3UvIV;11|
              |POLYVEC;remainder!;2UvIV;12| (36 . ~=) (42 . >)
              |POLYVEC;gcd;2UvIUv;13| (|PrimitiveArray| 7)
              |POLYVEC;gcd;Pa3IUv;14| |POLYVEC;mul;2UvIUv;17|
              |POLYVEC;lcm;Pa3IUv;16| (|SingleInteger|) (48 . >) (54 . |copy|)
              |POLYVEC;truncated_mul_add;3Uv2IV;19|
              |POLYVEC;truncated_multiplication;2Uv2IUv;20| (|PositiveInteger|)
              |POLYVEC;pow;UvPiNniIUv;21| |POLYVEC;differentiate;UvIUv;22|
              |POLYVEC;differentiate;UvNniIUv;23| (59 . >=) (|List| 7)
              |POLYVEC;extended_gcd;2UvIL;24| |POLYVEC;resultant;2Uv2I;25|)
           '#(|vector_combination| 65 |vector_add_mul| 76
              |truncated_multiplication| 86 |truncated_mul_add| 94 |to_mod_pa|
              103 |resultant| 109 |remainder!| 116 |pow| 123 |mul_by_scalar|
              131 |mul_by_binomial| 139 |mul| 154 |lcm| 161 |gcd| 169
              |extended_gcd| 184 |eval_at| 191 |divide!| 199 |differentiate|
              207 |degree| 220 |copy_slice| 225 |copy_first| 233)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 50
                                                 '(1 13 12 0 14 0 13 0 15 1 13
                                                   16 0 17 1 13 8 0 18 2 8 0 0
                                                   0 19 1 13 0 0 20 2 8 0 0 0
                                                   28 2 8 12 0 0 31 2 8 12 0 0
                                                   32 2 38 12 0 0 39 1 7 0 0 40
                                                   2 38 12 0 0 47 7 0 6 7 8 7 8
                                                   8 8 8 27 6 0 6 7 7 8 8 8 8
                                                   22 4 0 7 7 7 8 8 42 5 0 6 7
                                                   7 7 8 8 41 2 0 7 13 8 21 3 0
                                                   8 7 7 8 50 3 0 6 7 7 8 30 4
                                                   0 7 7 43 16 8 44 4 0 6 7 8 8
                                                   8 25 3 0 6 7 8 8 24 4 0 6 7
                                                   8 8 8 23 3 0 7 7 7 8 36 4 0
                                                   7 34 8 8 8 37 3 0 7 7 7 8 33
                                                   4 0 7 34 8 8 8 35 3 0 48 7 7
                                                   8 49 4 0 8 7 8 8 8 11 4 0 6
                                                   7 7 7 8 29 2 0 7 7 8 45 3 0
                                                   7 7 16 8 46 1 0 8 7 26 4 0 6
                                                   7 7 8 8 10 3 0 6 7 7 8
                                                   9)))))
           '|lookupComplete|)) 

(MAKEPROP '|U32VectorPolynomialOperations| 'NILADIC T) 
