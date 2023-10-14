
(/VERSIONCHECK 2) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1| (|vp| |vn| |sigma| |prime| $)
  (SPADCALL |vp| |vn| |sigma| |prime|
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!0| $)
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!1| $)
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;1!2| $) (QREFELT $ 14))) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!2| (|x| |pt| |p| $)
  (|NBLM;vector_shift| |x| $)) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!1| (|x| |pt| |p| $)
  (|NBLM;vector_shift| |x| $)) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;1!0| (|x| $) (|spadConstant| $ 7)) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2| (|vp| |vn| |sigma| |prime| $)
  (SPADCALL |vp| |vn| |sigma| |prime|
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!0| $)
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!1| $)
            (CONS #'|NBLM;naiveBeckermannLabahn;VVNniIL;2!2| $) (QREFELT $ 17))) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!2| (|x| |pt| |p| $)
  (|NBLM;vector_shift| |x| $)) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!1| (|x| |pt| |p| $)
  (|NBLM;vector_shift| |x| $)) 

(DEFUN |NBLM;naiveBeckermannLabahn;VVNniIL;2!0| (|x| $) (|spadConstant| $ 7)) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
       (|vp| |vn| |pts| |prime| $)
  (PROG ()
    (RETURN
     (COND
      ((SPADCALL (QV_LEN_U32 |pts|) |prime| (QREFELT $ 20))
       (|error| "naiveBeckermannLabahnMultipoint: number of points > prime"))
      ('T
       (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                 (CONS #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0|
                       (VECTOR $ |pts| |prime|))
                 (CONS #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1|
                       (VECTOR $ |pts|))
                 (ELT $ 25) (QREFELT $ 14))))))) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!1| (|x| |pt| |p| $$)
  (PROG (|pts| $)
    (LETT |pts| (QREFELT $$ 1)
          . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| $))))) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3!0| (|x| $$)
  (PROG (|prime| |pts| $)
    (LETT |prime| (QREFELT $$ 2)
          . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|))
    (LETT |pts| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT $ 22))))))) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|
       (|vp| |vn| |pts| |prime| $)
  (PROG ()
    (RETURN
     (COND
      ((SPADCALL (QV_LEN_U32 |pts|) |prime| (QREFELT $ 20))
       (|error| "naiveBeckermannLabahnMultipoint: number of points > prime"))
      ('T
       (SPADCALL |vp| |vn| (QV_LEN_U32 |pts|) |prime|
                 (CONS #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0|
                       (VECTOR $ |pts| |prime|))
                 (CONS #'|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1|
                       (VECTOR $ |pts|))
                 (ELT $ 25) (QREFELT $ 17))))))) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!1| (|x| |pt| |p| $$)
  (PROG (|pts| $)
    (LETT |pts| (QREFELT $$ 1)
          . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|NBLM;mul_by_binomial_pointwise| |x| |pt| |pts| |p| $))))) 

(DEFUN |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4!0| (|x| $$)
  (PROG (|prime| |pts| $)
    (LETT |prime| (QREFELT $$ 2)
          . #1=(|NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4|))
    (LETT |pts| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|sub_SI| |prime| (SPADCALL |pts| |x| (QREFELT $ 22))))))) 

(DEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
       (|vp| |vn| |sigma| |prime| |pts| |up_residual| |up_poly| $)
  (PROG (|p| |l| |vk| |k| |vpa| #1=#:G181 |m|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |m| (QVSIZE |vp|)
               . #2=(|NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|))
         (QVSIZE |vn|) (QREFELT $ 28))
        (|error| "Number of polynomials and number of degrees do not agree"))
       ('T
        (SEQ
         (LETT |vpa|
               (SPADCALL
                (PROGN
                 (LETT #1# NIL . #2#)
                 (SEQ (LETT |k| 1 . #2#) G190
                      (COND ((|greater_SI| |k| |m|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (GETREFV_U32 |sigma| 0) #1#) . #2#)))
                      (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (QREFELT $ 30))
               . #2#)
         (SEQ (LETT |k| 1 . #2#) G190 (COND ((|greater_SI| |k| |m|) (GO G191)))
              (SEQ (LETT |p| (SPADCALL |vp| |k| (QREFELT $ 32)) . #2#)
                   (LETT |vk| (SPADCALL |vpa| |k| (QREFELT $ 33)) . #2#)
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |p| (QREFELT $ 34)) 'NIL)
                                  ('T 'T)))
                           (GO G191)))
                         (SEQ (LETT |l| (SPADCALL |p| (QREFELT $ 35)) . #2#)
                              (COND
                               ((< |l| |sigma|)
                                (SETELT_U32 |vk| |l|
                                            (SPADCALL |p| (QREFELT $ 36)))))
                              (EXIT
                               (LETT |p| (SPADCALL |p| (QREFELT $ 37)) . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))))
              (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT
          (SPADCALL |vpa| |vn| |sigma| |prime| |pts| |up_residual| |up_poly|
                    (QREFELT $ 17)))))))))) 

(DEFUN |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
       (|vpa| |vn| |sigma| |prime| |pts| |up_residual| |up_poly| $)
  (PROG (|vd| |k| #1=#:G196 |m2| |vk| |mp| |m1| |m|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |m| (QVSIZE |vpa|)
               . #2=(|NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|))
         (QVSIZE |vn|) (QREFELT $ 28))
        (|error| "Number of polynomials and number of degrees do not agree"))
       ('T
        (SEQ (LETT |m1| 0 . #2#)
             (SEQ (LETT |k| 1 . #2#) G190
                  (COND ((|greater_SI| |k| |m|) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |m1|
                          (+ (+ |m1| (SPADCALL |vn| |k| (QREFELT $ 38))) 1)
                          . #2#)))
                  (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
             (LETT |mp| (MAKEARR1 |m| (GETREFV_U32 0 0)) . #2#)
             (LETT |m2| 0 . #2#)
             (SEQ (LETT |k| 1 . #2#) G190
                  (COND ((|greater_SI| |k| |m|) (GO G191)))
                  (SEQ (SPADCALL |mp| |k| (GETREFV_U32 |m1| 0) (QREFELT $ 39))
                       (LETT |vk| (SPADCALL |mp| |k| (QREFELT $ 33)) . #2#)
                       (SETELT_U32 |vk| |m2| 1)
                       (EXIT
                        (LETT |m2|
                              (+ (+ |m2| (SPADCALL |vn| |k| (QREFELT $ 38))) 1)
                              . #2#)))
                  (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
             (LETT |vd|
                   (SPADCALL
                    (PROGN
                     (LETT #1# NIL . #2#)
                     (SEQ (LETT |k| 1 . #2#) G190
                          (COND ((|greater_SI| |k| |m|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |vn| |k| (QREFELT $ 38)) #1#)
                                  . #2#)))
                          (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT $ 41))
                   . #2#)
             (SPADCALL |mp| |vpa| |vd| |sigma| |prime| |pts| |up_residual|
                       |up_poly| (QREFELT $ 42))
             (EXIT
              (LIST (SPADCALL |mp| (QREFELT $ 45))
                    (SPADCALL |vpa| (QREFELT $ 45))
                    (SPADCALL |vd| (QREFELT $ 47))))))))))) 

(DEFUN |NBLM;vector_shift| (|v| $)
  (PROG (|i| |n|)
    (RETURN
     (SEQ (LETT |n| (QV_LEN_U32 |v|) . #1=(|NBLM;vector_shift|))
          (LETT |i| (SPADCALL (- |n| 1) (QREFELT $ 49)) . #1#)
          (SEQ G190 (COND ((NULL (SPADCALL |i| 0 (QREFELT $ 50))) (GO G191)))
               (SEQ (SETELT_U32 |v| |i| (ELT_U32 |v| (|sub_SI| |i| 1)))
                    (EXIT (LETT |i| (|sub_SI| |i| 1) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SETELT_U32 |v| 0 0)))))) 

(DEFUN |NBLM;mul_by_binomial_pointwise| (|v| |pt| |pts| |p| $)
  (PROG (|pp| #1=#:G205 |i| |n|)
    (RETURN
     (SEQ (LETT |n| (QV_LEN_U32 |v|) . #2=(|NBLM;mul_by_binomial_pointwise|))
          (EXIT
           (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (LETT |pp| (|addmod_SI| (ELT_U32 |pts| |i|) |pt| |p|) . #2#)
                 (EXIT
                  (SETELT_U32 |v| |i|
                              (QSMULMOD32 (ELT_U32 |v| |i|) |pp| |p|))))
                (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|
       (|mp| |vp| |vd| |sigma| |p| |pts| |up_residual| |up_poly| $)
  (PROG (|vckinv| |k| |vcinv| |maxd| |cpi| |pi| |pt| #1=#:G223 #2=#:G207 |l|
         |s1| |m1| |vc| |m|)
    (RETURN
     (SEQ
      (LETT |m| (QVSIZE |vd|)
            . #3=(|NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9|))
      (LETT |vc| (MAKEARR1 |m| 0) . #3#)
      (LETT |m1| (- (QV_LEN_U32 (SPADCALL |mp| 1 (QREFELT $ 33))) 1) . #3#)
      (LETT |s1| (- |sigma| 1) . #3#)
      (EXIT
       (SEQ (LETT |l| 0 . #3#)
            (LETT #1#
                  (PROG1 (LETT #2# |s1| . #3#)
                    (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                  . #3#)
            G190 (COND ((|greater_SI| |l| #1#) (GO G191)))
            (SEQ (LETT |pt| (SPADCALL |l| |pts|) . #3#) (LETT |maxd| -1 . #3#)
                 (LETT |pi| 0 . #3#)
                 (SEQ (LETT |k| 1 . #3#) G190
                      (COND ((|greater_SI| |k| |m|) (GO G191)))
                      (SEQ
                       (SPADCALL |vc| |k|
                                 (ELT_U32 (SPADCALL |vp| |k| (QREFELT $ 33))
                                          |l|)
                                 (QREFELT $ 51))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |vc| |k| (QREFELT $ 38)) 0
                                    (QREFELT $ 52))
                          (COND
                           ((< |maxd| (SPADCALL |vd| |k| (QREFELT $ 38)))
                            (SEQ (LETT |pi| |k| . #3#)
                                 (LETT |cpi| (SPADCALL |vc| |k| (QREFELT $ 38))
                                       . #3#)
                                 (EXIT
                                  (LETT |maxd|
                                        (SPADCALL |vd| |k| (QREFELT $ 38))
                                        . #3#)))))))))
                      (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT
                  (COND ((EQL |pi| 0) "iterate")
                        ('T
                         (SEQ
                          (LETT |vcinv|
                                (QSMULMOD32 (- |p| 1)
                                            (SPADCALL
                                             (SPADCALL |vc| |pi|
                                                       (QREFELT $ 38))
                                             |p| (QREFELT $ 53))
                                            |p|)
                                . #3#)
                          (SEQ (LETT |k| 1 . #3#) G190
                               (COND ((|greater_SI| |k| |m|) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |vc| |k| (QREFELT $ 38))
                                             0 (QREFELT $ 52))
                                   (COND
                                    ((>= (SPADCALL |vd| |k| (QREFELT $ 38)) 0)
                                     (COND
                                      ((SPADCALL |k| |pi| (QREFELT $ 52))
                                       (SEQ
                                        (LETT |vckinv|
                                              (QSMULMOD32 |vcinv|
                                                          (SPADCALL |vc| |k|
                                                                    (QREFELT $
                                                                             38))
                                                          |p|)
                                              . #3#)
                                        (SPADCALL
                                         (SPADCALL |vp| |k| (QREFELT $ 33))
                                         (SPADCALL |vp| |pi| (QREFELT $ 33))
                                         |l| |s1| |vckinv| |p| (QREFELT $ 54))
                                        (EXIT
                                         (SPADCALL (QAREF1O |mp| |k| 1)
                                                   (QAREF1O |mp| |pi| 1) 0 |m1|
                                                   |vckinv| |p|
                                                   (QREFELT $ 54))))))))))))
                               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                               (EXIT NIL))
                          (SPADCALL |vd| |pi|
                                    (- (SPADCALL |vd| |pi| (QREFELT $ 38)) 1)
                                    (QREFELT $ 51))
                          (EXIT
                           (COND
                            ((>= (SPADCALL |vd| |pi| (QREFELT $ 38)) 0)
                             (SEQ
                              (SPADCALL (SPADCALL |vp| |pi| (QREFELT $ 33))
                                        |pt| |p| |up_residual|)
                              (EXIT
                               (SPADCALL (QAREF1O |mp| |pi| 1) |pt| |p|
                                         |up_poly|)))))))))))
            (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;critical_index| (|m| |i| |d| |vn| $)
  (PROG (#1=#:G224 #2=#:G228 |pa| |nj| |j| |nc|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nc| (QVSIZE |vn|) . #3=(|NBLM;critical_index|))
            (SEQ (LETT |j| 1 . #3#) G190
                 (COND ((|greater_SI| |j| |nc|) (GO G191)))
                 (SEQ
                  (LETT |nj| (- (SPADCALL |vn| |j| (QREFELT $ 38)) |d|) . #3#)
                  (EXIT
                   (COND ((< |nj| 0) "iterate")
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ (LETT |pa| (QAREF2O |m| |i| |j| 1 1) . #3#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL (ELT_U32 |pa| |nj|) 0
                                              (QREFELT $ 52))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# |j| . #3#)
                                            (GO #2#))
                                           . #3#)
                                     (GO #1#)))))))
                           #1# (EXIT #1#))))))
                 (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "Incorrect defect"))))
      #2# (EXIT #2#))))) 

(DEFUN |NBLM;swap_rows| (|m| |i| |j| $)
  (PROG (|t2| |t1| |k| |kmax|)
    (RETURN
     (SEQ
      (COND ((EQL |i| |j|) "nothing")
            ('T
             (SEQ (LETT |kmax| (ANCOLS |m|) . #1=(|NBLM;swap_rows|))
                  (EXIT
                   (SEQ (LETT |k| 1 . #1#) G190
                        (COND ((|greater_SI| |k| |kmax|) (GO G191)))
                        (SEQ (LETT |t1| (QAREF2O |m| |i| |k| 1 1) . #1#)
                             (LETT |t2| (QAREF2O |m| |j| |k| 1 1) . #1#)
                             (QSETAREF2O |m| |i| |k| |t2| 1 1)
                             (EXIT (QSETAREF2O |m| |j| |k| |t1| 1 1)))
                        (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191
                        (EXIT NIL)))))))))) 

(DEFUN |NBLM;mult_vector| (|v| |c| |p| $)
  (PROG (#1=#:G236 |i| |n|)
    (RETURN
     (SEQ (LETT |n| (QV_LEN_U32 |v|) . #2=(|NBLM;mult_vector|))
          (EXIT
           (SEQ (LETT |i| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT_U32 |v| |i| (QSMULMOD32 |c| (ELT_U32 |v| |i|) |p|))))
                (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;mult_row| (|m| |i| |c| |p| $)
  (PROG (|j| |jmax|)
    (RETURN
     (SEQ (LETT |jmax| (ANCOLS |m|) . #1=(|NBLM;mult_row|))
          (EXIT
           (SEQ (LETT |j| 1 . #1#) G190
                (COND ((|greater_SI| |j| |jmax|) (GO G191)))
                (SEQ
                 (EXIT
                  (|NBLM;mult_vector| (QAREF2O |m| |i| |j| 1 1) |c| |p| $)))
                (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;add_vector| (|v1| |v2| |c| |k| |p| $)
  (PROG (#1=#:G243 |i| |n|)
    (RETURN
     (SEQ (LETT |n| (QV_LEN_U32 |v1|) . #2=(|NBLM;add_vector|))
          (EXIT
           (SEQ (LETT |i| |k| . #2#) (LETT #1# (- |n| 1) . #2#) G190
                (COND ((> |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT_U32 |v1| |i|
                              (QSMULADDMOD64-32 |c| (ELT_U32 |v2| (- |i| |k|))
                                                (ELT_U32 |v1| |i|) |p|))))
                (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;add_row| (|m| |j1| |j2| |c| |k| |p| $)
  (PROG (|i| |imax|)
    (RETURN
     (SEQ (LETT |imax| (ANCOLS |m|) . #1=(|NBLM;add_row|))
          (EXIT
           (SEQ (LETT |i| 1 . #1#) G190
                (COND ((|greater_SI| |i| |imax|) (GO G191)))
                (SEQ
                 (EXIT
                  (|NBLM;add_vector| (QAREF2O |m| |j1| |i| 1 1)
                   (QAREF2O |m| |j2| |i| 1 1) |c| |k| |p| $)))
                (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;reduce_row_by_row1| (|m| |j| |i| |ci| |cdeg| |vdiff| |p| $)
  (PROG (#1=#:G247 |c| |k| |rj0|)
    (RETURN
     (SEQ
      (LETT |rj0| (QAREF2O |m| |j| |ci| 1 1) . #2=(|NBLM;reduce_row_by_row1|))
      (EXIT
       (COND
        ((< |vdiff| 0)
         (|error| "Internal error : vdiff < 0 in reduce_row_by_row1"))
        ('T
         (SEQ
          (EXIT
           (SEQ (LETT |k| (+ |vdiff| |cdeg|) . #2#)
                (LETT |c| (ELT_U32 |rj0| |k|) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |c| 0 (QREFELT $ 52))
                   (PROGN
                    (LETT #1#
                          (|NBLM;add_row| |m| |j| |i| (- |p| |c|) |vdiff| |p|
                           $)
                          . #2#)
                    (GO #1#)))))))
          #1# (EXIT #1#))))))))) 

(DEFUN |NBLM;top_reduce_by_row| (|m| |i| |ci| |vn| |vd| |p| $)
  (PROG (|j| |minv| |mcoeff| |cdeg| |mdeg| |nr|)
    (RETURN
     (SEQ (LETT |nr| (QVSIZE |vd|) . #1=(|NBLM;top_reduce_by_row|))
          (LETT |mdeg| (SPADCALL |vn| |ci| (QREFELT $ 38)) . #1#)
          (LETT |cdeg| (- |mdeg| (SPADCALL |vd| |i| (QREFELT $ 38))) . #1#)
          (LETT |mcoeff| (ELT_U32 (QAREF2O |m| |i| |ci| 1 1) |cdeg|) . #1#)
          (LETT |minv| (SPADCALL |mcoeff| |p| (QREFELT $ 53)) . #1#)
          (|NBLM;mult_row| |m| |i| |minv| |p| $)
          (EXIT
           (SEQ (LETT |j| (+ |i| 1) . #1#) G190 (COND ((> |j| |nr|) (GO G191)))
                (SEQ
                 (EXIT
                  (|NBLM;reduce_row_by_row1| |m| |j| |i| |ci| |cdeg|
                   (- (SPADCALL |vd| |i| (QREFELT $ 38))
                      (SPADCALL |vd| |j| (QREFELT $ 38)))
                   |p| $)))
                (LETT |j| (+ |j| 1) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;final_reduce| (|m| |civ| |vn| |vd| |p| $)
  (PROG (|ci| #1=#:G255 |vdi| |i| #2=#:G261 |d| |vdj| |j| |mvd| |ns|)
    (RETURN
     (SEQ (LETT |ns| (QVSIZE |vd|) . #3=(|NBLM;final_reduce|))
          (LETT |mvd| (SPADCALL |vd| 1 (QREFELT $ 38)) . #3#)
          (EXIT
           (SEQ (LETT |j| 1 . #3#) G190
                (COND ((|greater_SI| |j| |ns|) (GO G191)))
                (SEQ (LETT |vdj| (SPADCALL |vd| |j| (QREFELT $ 38)) . #3#)
                     (EXIT
                      (SEQ (LETT |d| 0 . #3#) (LETT #2# (- |mvd| |vdj|) . #3#)
                           G190 (COND ((|greater_SI| |d| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| 1 . #3#) G190
                                  (COND ((|greater_SI| |i| |ns|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND ((EQL |i| |j|) "iterate")
                                          ('T
                                           (SEQ
                                            (LETT |vdi|
                                                  (SPADCALL |vd| |i|
                                                            (QREFELT $ 38))
                                                  . #3#)
                                            (EXIT
                                             (COND
                                              ((< |vdi| (+ |vdj| |d|))
                                               (PROGN
                                                (LETT #1# |$NoValue| . #3#)
                                                (GO #1#)))
                                              ('T
                                               (SEQ
                                                (LETT |ci|
                                                      (SPADCALL |civ| |i|
                                                                (QREFELT $ 38))
                                                      . #3#)
                                                (EXIT
                                                 (|NBLM;reduce_row_by_row1| |m|
                                                  |j| |i| |ci|
                                                  (-
                                                   (SPADCALL |vn| |ci|
                                                             (QREFELT $ 38))
                                                   |vdi|)
                                                  |d| |p| $)))))))))))
                                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                  G191 (EXIT NIL)))
                            #1# (EXIT #1#))
                           (LETT |d| (|inc_SI| |d|) . #3#) (GO G190) G191
                           (EXIT NIL))))
                (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NBLM;reduceBasis0;Tda2VIR;19| (|m| |vn| |vd| |p| $)
  (PROG (|tmp| |maxj| |ci| |nci| |maxd| |cd| |j| |i| |civ| |ns| |nc|)
    (RETURN
     (SEQ (LETT |nc| (QVSIZE |vn|) . #1=(|NBLM;reduceBasis0;Tda2VIR;19|))
          (LETT |ns| (QVSIZE |vd|) . #1#) (LETT |civ| (MAKEARR1 |ns| 0) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |ns|) (GO G191)))
               (SEQ (LETT |maxd| -1 . #1#)
                    (SEQ (LETT |j| |i| . #1#) G190
                         (COND ((> |j| |ns|) (GO G191)))
                         (SEQ
                          (LETT |cd| (SPADCALL |vd| |j| (QREFELT $ 38)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |cd| |maxd| (QREFELT $ 20))
                             (SEQ (LETT |maxd| |cd| . #1#)
                                  (LETT |ci|
                                        (|NBLM;critical_index| |m| |j| |maxd|
                                         |vn| $)
                                        . #1#)
                                  (EXIT (LETT |maxj| |j| . #1#))))
                            ((EQL |cd| |maxd|)
                             (SEQ
                              (LETT |nci|
                                    (|NBLM;critical_index| |m| |j| |maxd| |vn|
                                     $)
                                    . #1#)
                              (EXIT
                               (COND
                                ((< |nci| |ci|)
                                 (SEQ (LETT |ci| |nci| . #1#)
                                      (EXIT (LETT |maxj| |j| . #1#)))))))))))
                         (LETT |j| (+ |j| 1) . #1#) (GO G190) G191 (EXIT NIL))
                    (|NBLM;swap_rows| |m| |i| |maxj| $)
                    (LETT |tmp| (SPADCALL |vd| |i| (QREFELT $ 38)) . #1#)
                    (SPADCALL |vd| |i| (SPADCALL |vd| |maxj| (QREFELT $ 38))
                              (QREFELT $ 51))
                    (SPADCALL |vd| |maxj| |tmp| (QREFELT $ 51))
                    (SPADCALL |civ| |i| |ci| (QREFELT $ 51))
                    (EXIT
                     (|NBLM;top_reduce_by_row| |m| |i| |ci| |vn| |vd| |p| $)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (|NBLM;final_reduce| |m| |civ| |vn| |vd| |p| $)
          (EXIT (VECTOR |m| |vd| |civ|)))))) 

(DEFUN |NBLM;reduceBasis;V2VIR;20| (|m| |vn| |vd| |p| $)
  (PROG (|j| |m2| #1=#:G284 |i1| |resjk| |vnk1| |k| |mi| |i| |nvd| |res| |ns|
         |nc| |nr|)
    (RETURN
     (SEQ (LETT |nr| (QVSIZE |vd|) . #2=(|NBLM;reduceBasis;V2VIR;20|))
          (LETT |nc| (QVSIZE |vn|) . #2#) (LETT |ns| 0 . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nr|) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((>= (SPADCALL |vd| |i| (QREFELT $ 38)) 0)
                   (LETT |ns| (+ |ns| 1) . #2#)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (MAKE_MATRIX1 |ns| |nc| (GETREFV_U32 0 0)) . #2#)
          (LETT |nvd| (MAKEARR1 |ns| 0) . #2#) (LETT |j| 1 . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |nr|) (GO G191)))
               (SEQ (LETT |mi| (SPADCALL |m| |i| (QREFELT $ 33)) . #2#)
                    (LETT |m2| 0 . #2#)
                    (EXIT
                     (COND
                      ((>= (SPADCALL |vd| |i| (QREFELT $ 38)) 0)
                       (SEQ
                        (SPADCALL |nvd| |j| (SPADCALL |vd| |i| (QREFELT $ 38))
                                  (QREFELT $ 51))
                        (SEQ (LETT |k| 1 . #2#) G190
                             (COND ((|greater_SI| |k| |nc|) (GO G191)))
                             (SEQ
                              (LETT |vnk1|
                                    (+ (SPADCALL |vn| |k| (QREFELT $ 38)) 1)
                                    . #2#)
                              (LETT |resjk| (GETREFV_U32 |vnk1| 0) . #2#)
                              (SEQ (LETT |i1| 0 . #2#)
                                   (LETT #1# (|sub_SI| |vnk1| 1) . #2#) G190
                                   (COND ((|greater_SI| |i1| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT_U32 |resjk| |i1|
                                                 (ELT_U32 |mi|
                                                          (+ |m2| |i1|)))))
                                   (LETT |i1| (|inc_SI| |i1|) . #2#) (GO G190)
                                   G191 (EXIT NIL))
                              (LETT |m2| (|add_SI| |m2| |vnk1|) . #2#)
                              (EXIT (QSETAREF2O |res| |j| |k| |resjk| 1 1)))
                             (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |j| (+ |j| 1) . #2#)))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| |vn| |nvd| |p| (QREFELT $ 57))))))) 

(DECLAIM (NOTINLINE |NaiveBeckermannLabahnModular;|)) 

(DEFUN |NaiveBeckermannLabahnModular| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G286)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|NaiveBeckermannLabahnModular|)
                . #2=(|NaiveBeckermannLabahnModular|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|NaiveBeckermannLabahnModular|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|NaiveBeckermannLabahnModular;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|NaiveBeckermannLabahnModular|))))))))))) 

(DEFUN |NaiveBeckermannLabahnModular;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|NaiveBeckermannLabahnModular|)
            . #1=(|NaiveBeckermannLabahnModular|))
      (LETT $ (GETREFV 59) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NaiveBeckermannLabahnModular| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NaiveBeckermannLabahnModular| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (0 . |Zero|)
              (|List| 43) (|Vector| 31) (|Vector| 11) (|Integer|)
              (|Mapping| 11 11) (|Mapping| 23 21 11 11)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;5|
              |NBLM;naiveBeckermannLabahn;VVNniIL;1| (|Vector| 21)
              |NBLM;naiveBeckermannLabahn1;VVNniIM2ML;6|
              |NBLM;naiveBeckermannLabahn;VVNniIL;2| (|Boolean|) (4 . >)
              (|U32Vector|) (10 . |elt|) (|Void|)
              (|U32VectorPolynomialOperations|) (16 . |mul_by_binomial|)
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;3|
              |NBLM;naiveBeckermannLabahnMultipoint;VVUvIL;4| (23 . ~=)
              (|List| 21) (29 . |vector|) (|SparseUnivariatePolynomial| 11)
              (34 . |elt|) (40 . |elt|) (46 . |zero?|) (51 . |degree|)
              (56 . |leadingCoefficient|) (61 . |reductum|) (66 . |elt|)
              (72 . |setelt|) (|List| 11) (79 . |vector|)
              |NBLM;naiveBeckermannLabahn0;2VVNniIM2MV;9| (|Any|)
              (|AnyFunctions1| 16) (84 . |coerce|) (|AnyFunctions1| 10)
              (89 . |coerce|) (|SingleInteger|) (94 . |coerce|) (99 . >)
              (105 . |setelt|) (112 . ~=) (118 . |invmod|)
              (124 . |vector_add_mul|)
              (|Record| (|:| |basis| 56) (|:| |defects| 10) (|:| |cinds| 10))
              (|TwoDimensionalArray| 21) |NBLM;reduceBasis0;Tda2VIR;19|
              |NBLM;reduceBasis;V2VIR;20|)
           '#(|reduceBasis0| 134 |reduceBasis| 142
              |naiveBeckermannLabahnMultipoint| 150 |naiveBeckermannLabahn1|
              166 |naiveBeckermannLabahn0| 188 |naiveBeckermannLabahn| 200)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 58
                                                 '(0 6 0 7 2 11 19 0 0 20 2 21
                                                   11 0 11 22 3 24 23 21 11 11
                                                   25 2 6 19 0 0 28 1 16 0 29
                                                   30 2 9 31 0 11 32 2 16 21 0
                                                   11 33 1 31 19 0 34 1 31 6 0
                                                   35 1 31 11 0 36 1 31 0 0 37
                                                   2 10 11 0 11 38 3 16 21 0 11
                                                   21 39 1 10 0 40 41 1 44 43
                                                   16 45 1 46 43 10 47 1 48 0
                                                   11 49 2 48 19 0 0 50 3 10 11
                                                   0 11 11 51 2 11 19 0 0 52 2
                                                   11 0 0 0 53 6 24 23 21 21 11
                                                   11 11 11 54 4 0 55 56 10 10
                                                   11 57 4 0 55 16 10 10 11 58
                                                   4 0 8 9 10 21 11 26 4 0 8 16
                                                   10 21 11 27 7 0 8 16 10 6 11
                                                   12 13 13 17 7 0 8 9 10 6 11
                                                   12 13 13 14 8 0 23 16 16 10
                                                   6 11 12 13 13 42 4 0 8 9 10
                                                   6 11 15 4 0 8 16 10 6 11
                                                   18)))))
           '|lookupComplete|)) 

(MAKEPROP '|NaiveBeckermannLabahnModular| 'NILADIC T) 
