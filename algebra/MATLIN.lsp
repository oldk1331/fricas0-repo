
(DEFUN |MATLIN;rowAllZeroes?| (|x| |i| $)
  (PROG (#1=#:G124 #2=#:G126 #3=#:G127 |j|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |j| (SPADCALL |x| (QREFELT $ 11))
                 . #4=(|MATLIN;rowAllZeroes?|))
           (LETT #3# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
           (COND ((> |j| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                         (|spadConstant| $ 14) (QREFELT $ 16))
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |MATLIN;colAllZeroes?| (|x| |j| $)
  (PROG (#1=#:G129 #2=#:G131 #3=#:G132 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |i| (SPADCALL |x| (QREFELT $ 17))
                 . #4=(|MATLIN;colAllZeroes?|))
           (LETT #3# (SPADCALL |x| (QREFELT $ 18)) . #4#) G190
           (COND ((> |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                         (|spadConstant| $ 14) (QREFELT $ 16))
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |MATLIN;minorDet| (|x| |m| |l| |i| |v| $)
  (PROG (|j| |rl| |pos| #1=#:G173 |ans| |md| #2=#:G161 |minC| |minR| |z|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |z| (QAREF1 |v| |m|) . #3=(|MATLIN;minorDet|))
            (EXIT
             (COND ((QEQCAR |z| 0) (QCDR |z|))
                   ('T
                    (SEQ (LETT |ans| (|spadConstant| $ 14) . #3#)
                         (LETT |rl| NIL . #3#)
                         (LETT |j| (|SPADfirst| |l|) . #3#)
                         (LETT |l| (CDR |l|) . #3#) (LETT |pos| 'T . #3#)
                         (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                         (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #3#)
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |x| (+ |j| |minR|) (+ |i| |minC|)
                                             (QREFELT $ 13))
                                   (|spadConstant| $ 14) (QREFELT $ 16))
                                  (LETT |ans|
                                        (SEQ
                                         (LETT |md|
                                               (SPADCALL
                                                (|MATLIN;minorDet| |x|
                                                 (- |m|
                                                    (EXPT 2
                                                          (PROG1
                                                              (LETT #2# |j|
                                                                    . #3#)
                                                            (|check_subtype|
                                                             (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             #2#))))
                                                 (SPADCALL (REVERSE |rl|) |l|
                                                           (QREFELT $ 20))
                                                 (+ |i| 1) |v| $)
                                                (SPADCALL |x| (+ |j| |minR|)
                                                          (+ |i| |minC|)
                                                          (QREFELT $ 13))
                                                (QREFELT $ 22))
                                               . #3#)
                                         (EXIT
                                          (COND
                                           (|pos|
                                            (SPADCALL |ans| |md|
                                                      (QREFELT $ 23)))
                                           ('T
                                            (SPADCALL |ans| |md|
                                                      (QREFELT $ 24))))))
                                        . #3#)))
                                (EXIT
                                 (COND
                                  ((NULL |l|)
                                   (SEQ (QSETAREF1 |v| |m| (CONS 0 |ans|))
                                        (EXIT
                                         (PROGN
                                          (LETT #1# |ans| . #3#)
                                          (GO #1#)))))
                                  ('T
                                   (SEQ
                                    (LETT |pos| (COND (|pos| 'NIL) ('T 'T))
                                          . #3#)
                                    (LETT |rl| (CONS |j| |rl|) . #3#)
                                    (LETT |j| (|SPADfirst| |l|) . #3#)
                                    (EXIT (LETT |l| (CDR |l|) . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MATLIN;minordet;MR;4| (|x| $)
  (PROG (|i| #1=#:G186 |maxC| |minR| |v| #2=#:G177 |n1| |ndim|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |ndim| (SPADCALL |x| (QREFELT $ 26))
               . #3=(|MATLIN;minordet;MR;4|))
         (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 28))
        (|error| "determinant: matrix must be square"))
       ('T
        (SEQ (LETT |n1| (- |ndim| 1) . #3#)
             (LETT |v|
                   (MAKEARR1
                    (PROG1 (LETT #2# (- (EXPT 2 |ndim|) 1) . #3#)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    (CONS 1 "uncomputed"))
                   . #3#)
             (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #3#)
             (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #3#)
             (SEQ (LETT |i| 0 . #3#) G190
                  (COND ((|greater_SI| |i| |n1|) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF1 |v| (|sub_SI| (SPADCALL 2 |i| (QREFELT $ 30)) 1)
                               (CONS 0
                                     (SPADCALL |x| (+ |i| |minR|) |maxC|
                                               (QREFELT $ 13))))))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|MATLIN;minorDet| |x|
               (|sub_SI| (SPADCALL 2 |ndim| (QREFELT $ 30)) 2)
               (PROGN
                (LETT #1# NIL . #3#)
                (SEQ (LETT |i| 0 . #3#) G190
                     (COND ((|greater_SI| |i| |n1|) (GO G191)))
                     (SEQ (EXIT (LETT #1# (CONS |i| #1#) . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #1#))))
               0 |v| $))))))))) 

(DEFUN |MATLIN;elRow1!;M2IM;5| (|m| |i| |j| $)
  (PROG (|vec|)
    (RETURN
     (SEQ
      (LETT |vec| (SPADCALL |m| |i| (QREFELT $ 32)) |MATLIN;elRow1!;M2IM;5|)
      (SPADCALL |m| |i| (SPADCALL |m| |j| (QREFELT $ 32)) (QREFELT $ 33))
      (SPADCALL |m| |j| |vec| (QREFELT $ 33)) (EXIT |m|))))) 

(DEFUN |MATLIN;elRow2!;MR2IM;6| (|m| |a| |i| |j| $)
  (PROG (|vec|)
    (RETURN
     (SEQ
      (LETT |vec|
            (SPADCALL (CONS #'|MATLIN;elRow2!;MR2IM;6!0| (VECTOR $ |a|))
                      (SPADCALL |m| |j| (QREFELT $ 32)) (QREFELT $ 36))
            . #1=(|MATLIN;elRow2!;MR2IM;6|))
      (LETT |vec|
            (SPADCALL (ELT $ 23) (SPADCALL |m| |i| (QREFELT $ 32)) |vec|
                      (QREFELT $ 38))
            . #1#)
      (SPADCALL |m| |i| |vec| (QREFELT $ 33)) (EXIT |m|))))) 

(DEFUN |MATLIN;elRow2!;MR2IM;6!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATLIN;elRow2!;MR2IM;6|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 22)))))) 

(DEFUN |MATLIN;elColumn2!;MR2IM;7| (|m| |a| |i| |j| $)
  (PROG (|vec|)
    (RETURN
     (SEQ
      (LETT |vec|
            (SPADCALL (CONS #'|MATLIN;elColumn2!;MR2IM;7!0| (VECTOR $ |a|))
                      (SPADCALL |m| |j| (QREFELT $ 40)) (QREFELT $ 41))
            . #1=(|MATLIN;elColumn2!;MR2IM;7|))
      (LETT |vec|
            (SPADCALL (ELT $ 23) (SPADCALL |m| |i| (QREFELT $ 40)) |vec|
                      (QREFELT $ 42))
            . #1#)
      (SPADCALL |m| |i| |vec| (QREFELT $ 43)) (EXIT |m|))))) 

(DEFUN |MATLIN;elColumn2!;MR2IM;7!0| (|r1| $$)
  (PROG (|a| $)
    (LETT |a| (QREFELT $$ 1) . #1=(|MATLIN;elColumn2!;MR2IM;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT $ 22)))))) 

(DEFUN |MATLIN;fractionFreeGauss!;2M;8| (|x| $)
  (PROG (|j| |lasti| #1=#:G215 #2=#:G217 |i| |b| #3=#:G207 |val| |l| |pv| |k|
         |c| |ans| #4=#:G202 |rown| |maxC| |minC| |maxR| |minR| |ndim|)
    (RETURN
     (SEQ
      (LETT |ndim| (SPADCALL |x| (QREFELT $ 26))
            . #5=(|MATLIN;fractionFreeGauss!;2M;8|))
      (EXIT
       (COND ((EQL |ndim| 1) |x|)
             ('T
              (SEQ (LETT |ans| (LETT |b| (|spadConstant| $ 21) . #5#) . #5#)
                   (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #5#)
                   (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #5#)
                   (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #5#)
                   (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #5#)
                   (LETT |i| |minR| . #5#)
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| |minC| . #5#) G190
                          (COND ((> |j| |maxC|) (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                       (|spadConstant| $ 14) (QREFELT $ 45))
                             (SEQ (LETT |rown| (- |minR| 1) . #5#)
                                  (SEQ
                                   (EXIT
                                    (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                                         (COND ((> |k| |maxR|) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |x| |k| |j|
                                                        (QREFELT $ 13))
                                              (|spadConstant| $ 14)
                                              (QREFELT $ 16))
                                             (SEQ (LETT |rown| |k| . #5#)
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #4# |$NoValue| . #5#)
                                                    (GO #4#))))))))
                                         (LETT |k| (+ |k| 1) . #5#) (GO G190)
                                         G191 (EXIT NIL)))
                                   #4# (EXIT #4#))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |rown| (- |minR| 1)
                                               (QREFELT $ 46))
                                     (SEQ
                                      (SPADCALL |x| |i| |rown| (QREFELT $ 47))
                                      (EXIT
                                       (LETT |ans|
                                             (SPADCALL |ans| (QREFELT $ 48))
                                             . #5#)))))))))
                           (LETT |c| (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                 . #5#)
                           (EXIT
                            (COND
                             ((SPADCALL |c| (|spadConstant| $ 14)
                                        (QREFELT $ 45))
                              "next j")
                             ('T
                              (SEQ
                               (EXIT
                                (SEQ
                                 (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                                      (COND ((> |k| |maxR|) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| |k| |j|
                                                     (QREFELT $ 13))
                                           (|spadConstant| $ 14)
                                           (QREFELT $ 45))
                                          (SEQ (LETT |l| (+ |j| 1) . #5#) G190
                                               (COND
                                                ((> |l| |maxC|) (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |x| |k| |l|
                                                           (PROG2
                                                               (LETT #3#
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |c|
                                                                       (SPADCALL
                                                                        |x| |k|
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 13))
                                                                       (QREFELT
                                                                        $ 22))
                                                                      |b|
                                                                      (QREFELT
                                                                       $ 50))
                                                                     . #5#)
                                                               (QCDR #3#)
                                                             (|check_union|
                                                              (QEQCAR #3# 0)
                                                              (QREFELT $ 6)
                                                              #3#))
                                                           (QREFELT $ 51))))
                                               (LETT |l| (+ |l| 1) . #5#)
                                               (GO G190) G191 (EXIT NIL)))
                                         ('T
                                          (SEQ
                                           (LETT |pv|
                                                 (SPADCALL |x| |k| |j|
                                                           (QREFELT $ 13))
                                                 . #5#)
                                           (SPADCALL |x| |k| |j|
                                                     (|spadConstant| $ 14)
                                                     (QREFELT $ 51))
                                           (EXIT
                                            (SEQ (LETT |l| (+ |j| 1) . #5#)
                                                 G190
                                                 (COND
                                                  ((> |l| |maxC|) (GO G191)))
                                                 (SEQ
                                                  (LETT |val|
                                                        (SPADCALL
                                                         (SPADCALL |c|
                                                                   (SPADCALL
                                                                    |x| |k| |l|
                                                                    (QREFELT $
                                                                             13))
                                                                   (QREFELT $
                                                                            22))
                                                         (SPADCALL |pv|
                                                                   (SPADCALL
                                                                    |x| |i| |l|
                                                                    (QREFELT $
                                                                             13))
                                                                   (QREFELT $
                                                                            22))
                                                         (QREFELT $ 24))
                                                        . #5#)
                                                  (EXIT
                                                   (SPADCALL |x| |k| |l|
                                                             (PROG2
                                                                 (LETT #3#
                                                                       (SPADCALL
                                                                        |val|
                                                                        |b|
                                                                        (QREFELT
                                                                         $ 50))
                                                                       . #5#)
                                                                 (QCDR #3#)
                                                               (|check_union|
                                                                (QEQCAR #3# 0)
                                                                (QREFELT $ 6)
                                                                #3#))
                                                             (QREFELT $ 51))))
                                                 (LETT |l| (+ |l| 1) . #5#)
                                                 (GO G190) G191
                                                 (EXIT NIL))))))))
                                      (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |b| |c| . #5#)
                                 (LETT |i| (+ |i| 1) . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |i| |maxR| (QREFELT $ 46))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# |$NoValue| . #5#)
                                            (GO #2#))
                                           . #5#)
                                     (GO #1#)))))))
                               #1# (EXIT #1#))))))
                          (LETT |j| (+ |j| 1) . #5#) (GO G190) G191
                          (EXIT NIL)))
                    #2# (EXIT #2#))
                   (COND
                    ((SPADCALL |ans|
                               (SPADCALL (|spadConstant| $ 21) (QREFELT $ 48))
                               (QREFELT $ 45))
                     (SEQ (LETT |lasti| (- |i| 1) . #5#)
                          (EXIT
                           (SEQ (LETT |j| 1 . #5#) G190
                                (COND ((|greater_SI| |j| |maxC|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |x| |lasti| |j|
                                            (SPADCALL
                                             (SPADCALL |x| |lasti| |j|
                                                       (QREFELT $ 52))
                                             (QREFELT $ 48))
                                            (QREFELT $ 53))))
                                (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                                (EXIT NIL))))))
                   (EXIT |x|))))))))) 

(DEFUN |MATLIN;lastStep| (|x| $)
  (PROG (|iCol| #1=#:G228 |ss| #2=#:G225 #3=#:G224 #4=#:G226 #5=#:G236 |k| |j|
         |i| |iRow| |minC1| |maxC1| |maxR1| |det| |exCol| |maxC| |minC| |maxR|
         |minR| |ndim|)
    (RETURN
     (SEQ (LETT |ndim| (SPADCALL |x| (QREFELT $ 26)) . #6=(|MATLIN;lastStep|))
          (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #6#)
          (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #6#)
          (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #6#)
          (LETT |maxC| (- (+ |minC| |ndim|) 1) . #6#)
          (LETT |exCol| (SPADCALL |x| (QREFELT $ 12)) . #6#)
          (LETT |det| (SPADCALL |x| |maxR| |maxC| (QREFELT $ 52)) . #6#)
          (LETT |maxR1| (- |maxR| 1) . #6#) (LETT |maxC1| (+ |maxC| 1) . #6#)
          (LETT |minC1| (+ |minC| 1) . #6#) (LETT |iRow| |maxR| . #6#)
          (LETT |iCol| (- |maxC| 1) . #6#)
          (SEQ (LETT |i| |maxR1| . #6#) G190 (COND ((< |i| 1) (GO G191)))
               (SEQ
                (SEQ (LETT |j| |maxC1| . #6#) G190
                     (COND ((> |j| |exCol|) (GO G191)))
                     (SEQ
                      (LETT |ss|
                            (PROGN
                             (LETT #2# NIL . #6#)
                             (SEQ (LETT |k| 1 . #6#)
                                  (LETT #5# (- |maxR| |i|) . #6#) G190
                                  (COND ((|greater_SI| |k| #5#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #4#
                                           (SPADCALL
                                            (SPADCALL |x| |i| (+ |iCol| |k|)
                                                      (QREFELT $ 52))
                                            (SPADCALL |x| (+ |i| |k|) |j|
                                                      (QREFELT $ 52))
                                            (QREFELT $ 22))
                                           . #6#)
                                     (COND
                                      (#2#
                                       (LETT #3#
                                             (SPADCALL #3# #4# (QREFELT $ 23))
                                             . #6#))
                                      ('T
                                       (PROGN
                                        (LETT #3# #4# . #6#)
                                        (LETT #2# 'T . #6#)))))))
                                  (LETT |k| (|inc_SI| |k|) . #6#) (GO G190)
                                  G191 (EXIT NIL))
                             (COND (#2# #3#) ('T (|spadConstant| $ 14))))
                            . #6#)
                      (EXIT
                       (SPADCALL |x| |i| |j|
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |det|
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT $
                                                                          52))
                                                       (QREFELT $ 22))
                                             |ss| (QREFELT $ 24))
                                            (SPADCALL |x| |i| |iCol|
                                                      (QREFELT $ 52))
                                            (QREFELT $ 50))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                  #1#))
                                 (QREFELT $ 53))))
                     (LETT |j| (+ |j| 1) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |iCol| (- |iCol| 1) . #6#)))
               (LETT |i| (+ |i| -1) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |x| |minR| |maxR| |maxC1| |exCol| (QREFELT $ 55))))))) 

(DEFUN |MATLIN;invertIfCan;MU;10| (|y| $)
  (PROG (|den| |adjRec| |nr|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |nr| (SPADCALL |y| (QREFELT $ 26))
               . #1=(|MATLIN;invertIfCan;MU;10|))
         (SPADCALL |y| (QREFELT $ 27)) (QREFELT $ 28))
        (|error| "invertIfCan: matrix must be square"))
       (#2='T
        (SEQ (LETT |adjRec| (SPADCALL |y| (QREFELT $ 57)) . #1#)
             (LETT |den| (SPADCALL (QCDR |adjRec|) (QREFELT $ 58)) . #1#)
             (EXIT
              (COND ((QEQCAR |den| 1) (CONS 1 "failed"))
                    (#2#
                     (CONS 0
                           (SPADCALL (QCDR |den|) (QCAR |adjRec|)
                                     (QREFELT $ 59))))))))))))) 

(DEFUN |MATLIN;adjoint;MR;11| (|y| $)
  (PROG (|det| |ffr| |x| |maxC| |maxR| |nr|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |nr| (SPADCALL |y| (QREFELT $ 26))
               . #1=(|MATLIN;adjoint;MR;11|))
         (SPADCALL |y| (QREFELT $ 27)) (QREFELT $ 28))
        (|error| "adjoint: matrix must be square"))
       ('T
        (SEQ (LETT |maxR| (SPADCALL |y| (QREFELT $ 18)) . #1#)
             (LETT |maxC| (SPADCALL |y| (QREFELT $ 12)) . #1#)
             (LETT |x|
                   (SPADCALL (SPADCALL |y| (QREFELT $ 62))
                             (SPADCALL |nr| (|spadConstant| $ 21)
                                       (QREFELT $ 63))
                             (QREFELT $ 64))
                   . #1#)
             (LETT |ffr| (SPADCALL |x| (QREFELT $ 54)) . #1#)
             (LETT |det| (SPADCALL |ffr| |maxR| |maxC| (QREFELT $ 52)) . #1#)
             (EXIT (CONS (|MATLIN;lastStep| |ffr| $) |det|))))))))) 

(DEFUN |MATLIN;rowEchelon;2M;12| (|y| $) (SPADCALL |y| (QREFELT $ 66))) 

(DEFUN |MATLIN;rank;MNni;13| (|y| $) (SPADCALL |y| (QREFELT $ 68))) 

(DEFUN |MATLIN;nullity;MNni;14| (|y| $) (SPADCALL |y| (QREFELT $ 70))) 

(DEFUN |MATLIN;determinant;MR;15| (|y| $) (SPADCALL |y| (QREFELT $ 72))) 

(DEFUN |MATLIN;inverse;MU;16| (|y| $) (SPADCALL |y| (QREFELT $ 74))) 

(DEFUN |MATLIN;nullSpace;ML;17| (|y| $) (SPADCALL |y| (QREFELT $ 77))) 

(DEFUN |MATLIN;nullSpace;ML;18| (|y| $)
  (PROG (#1=#:G268 |v| #2=#:G267)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MATLIN;nullSpace;ML;18|))
       (SEQ (LETT |v| NIL . #3#)
            (LETT #1#
                  (SPADCALL
                   (SPADCALL (LIST #'|MATLIN;nullSpace;ML;18!0|) |y|
                             (QREFELT $ 81))
                   (QREFELT $ 84))
                  . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (LIST #'|MATLIN;nullSpace;ML;18!1|) |v|
                               (QREFELT $ 87))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MATLIN;nullSpace;ML;18!1| (|r1| $$) |r1|) 

(DEFUN |MATLIN;nullSpace;ML;18!0| (|r1| $$) |r1|) 

(DEFUN |MATLIN;nullSpace;ML;19| (|m| $) (SPADCALL |m| (QREFELT $ 89))) 

(DEFUN |MATLIN;determinant;MR;20| (|y| $)
  (PROG (|fm|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |y| (QREFELT $ 26)) (SPADCALL |y| (QREFELT $ 27))
                  (QREFELT $ 28))
        (|error| "determinant: matrix must be square"))
       ('T
        (SEQ
         (LETT |fm| (SPADCALL (SPADCALL |y| (QREFELT $ 62)) (QREFELT $ 54))
               |MATLIN;determinant;MR;20|)
         (EXIT
          (SPADCALL |fm| (SPADCALL |fm| (QREFELT $ 18))
                    (SPADCALL |fm| (QREFELT $ 12)) (QREFELT $ 52)))))))))) 

(DEFUN |MATLIN;rank;MNni;21| (|x| $)
  (PROG (|rk| #1=#:G275 |i| |y| |rh|)
    (RETURN
     (SEQ
      (LETT |y|
            (SEQ
             (LETT |rk| (SPADCALL |x| (QREFELT $ 26))
                   . #2=(|MATLIN;rank;MNni;21|))
             (LETT |rh| (SPADCALL |x| (QREFELT $ 27)) . #2#)
             (EXIT
              (COND
               ((SPADCALL |rk| |rh| (QREFELT $ 90))
                (SEQ (LETT |rk| |rh| . #2#)
                     (EXIT (SPADCALL |x| (QREFELT $ 91)))))
               ('T (SPADCALL |x| (QREFELT $ 62))))))
            . #2#)
      (LETT |y| (SPADCALL |y| (QREFELT $ 54)) . #2#)
      (LETT |i| (SPADCALL |y| (QREFELT $ 18)) . #2#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |rk| 0 (QREFELT $ 90))
                (|MATLIN;rowAllZeroes?| |y| |i| $))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (LETT |i| (- |i| 1) . #2#)
                (EXIT
                 (LETT |rk|
                       (PROG1 (LETT #1# (- |rk| 1) . #2#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |rk|))))) 

(DEFUN |MATLIN;nullity;MNni;22| (|x| $)
  (PROG (#1=#:G280)
    (RETURN
     (PROG1
         (LETT #1#
               (- (SPADCALL |x| (QREFELT $ 27)) (SPADCALL |x| (QREFELT $ 69)))
               |MATLIN;nullity;MNni;22|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |MATLIN;normalizedDivide;2RR;23| (|n| |d| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr| (SPADCALL |n| |d| (QREFELT $ 93))
            |MATLIN;normalizedDivide;2RR;23|)
      (EXIT
       (COND ((SPADCALL (QCDR |qr|) (|spadConstant| $ 14) (QREFELT $ 94)) |qr|)
             ((SPADCALL |d| (|spadConstant| $ 14) (QREFELT $ 95))
              (SEQ
               (PROGN
                (RPLACD |qr| (SPADCALL (QCDR |qr|) |d| (QREFELT $ 23)))
                (QCDR |qr|))
               (PROGN
                (RPLACA |qr|
                        (SPADCALL (QCAR |qr|) (|spadConstant| $ 21)
                                  (QREFELT $ 24)))
                (QCAR |qr|))
               (EXIT |qr|)))
             ('T
              (SEQ
               (PROGN
                (RPLACD |qr| (SPADCALL (QCDR |qr|) |d| (QREFELT $ 24)))
                (QCDR |qr|))
               (PROGN
                (RPLACA |qr|
                        (SPADCALL (QCAR |qr|) (|spadConstant| $ 21)
                                  (QREFELT $ 23)))
                (QCAR |qr|))
               (EXIT |qr|))))))))) 

(DEFUN |MATLIN;normalizedDivide;2RR;24| (|n| |d| $)
  (SPADCALL |n| |d| (QREFELT $ 93))) 

(DEFUN |MATLIN;rowEchelon;2M;25| (|y| $)
  (PROG (|i| |k1| |qr| #1=#:G318 |k| |xij| |jj| |un| |val2| |val1| |a1|
         #2=#:G298 |b1| |d| |b| |a| |#G67| |#G66| |#G65| |aa| |xnj| |n| |xkj|
         #3=#:G315 |j| |maxC| |minC| |maxR| |minR| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |y| (QREFELT $ 62)) . #4=(|MATLIN;rowEchelon;2M;25|))
      (LETT |minR| (SPADCALL |x| (QREFELT $ 17)) . #4#)
      (LETT |maxR| (SPADCALL |x| (QREFELT $ 18)) . #4#)
      (LETT |minC| (SPADCALL |x| (QREFELT $ 11)) . #4#)
      (LETT |maxC| (SPADCALL |x| (QREFELT $ 12)) . #4#)
      (LETT |n| (- |minR| 1) . #4#) (LETT |i| |minR| . #4#)
      (SEQ
       (EXIT
        (SEQ (LETT |j| |minC| . #4#) G190 (COND ((> |j| |maxC|) (GO G191)))
             (SEQ
              (COND
               ((SPADCALL |i| |maxR| (QREFELT $ 46))
                (PROGN (LETT #3# |$NoValue| . #4#) (GO #3#))))
              (LETT |n| (- |minR| 1) . #4#)
              (SEQ (LETT |k| |i| . #4#) G190 (COND ((> |k| |maxR|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |xkj| (SPADCALL |x| |k| |j| (QREFELT $ 13))
                               . #4#)
                         (QREFELT $ 98)))
                       (COND
                        ((OR (EQL |n| (- |minR| 1))
                             (SPADCALL |xkj| |xnj| (QREFELT $ 99)))
                         (SEQ (LETT |n| |k| . #4#)
                              (EXIT (LETT |xnj| |xkj| . #4#)))))))))
                   (LETT |k| (+ |k| 1) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |n| (- |minR| 1)) "next j")
                     ('T
                      (SEQ (SPADCALL |x| |i| |n| (QREFELT $ 47))
                           (SEQ (LETT |k| (+ |i| 1) . #4#) G190
                                (COND ((> |k| |maxR|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                     (|spadConstant| $ 14) (QREFELT $ 45))
                                    "next k")
                                   ('T
                                    (SEQ
                                     (LETT |aa|
                                           (SPADCALL
                                            (SPADCALL |x| |i| |j|
                                                      (QREFELT $ 13))
                                            (SPADCALL |x| |k| |j|
                                                      (QREFELT $ 13))
                                            (QREFELT $ 101))
                                           . #4#)
                                     (PROGN
                                      (LETT |#G65| (QVELT |aa| 0) . #4#)
                                      (LETT |#G66| (QVELT |aa| 1) . #4#)
                                      (LETT |#G67| (QVELT |aa| 2) . #4#)
                                      (LETT |a| |#G65| . #4#)
                                      (LETT |b| |#G66| . #4#)
                                      (LETT |d| |#G67| . #4#))
                                     (LETT |b1|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL
                                                      (SPADCALL |x| |i| |j|
                                                                (QREFELT $ 13))
                                                      |d| (QREFELT $ 50))
                                                     . #4#)
                                               (QCDR #2#)
                                             (|check_union| (QEQCAR #2# 0)
                                                            (QREFELT $ 6) #2#))
                                           . #4#)
                                     (LETT |a1|
                                           (PROG2
                                               (LETT #2#
                                                     (SPADCALL
                                                      (SPADCALL |x| |k| |j|
                                                                (QREFELT $ 13))
                                                      |d| (QREFELT $ 50))
                                                     . #4#)
                                               (QCDR #2#)
                                             (|check_union| (QEQCAR #2# 0)
                                                            (QREFELT $ 6) #2#))
                                           . #4#)
                                     (SEQ (LETT |k1| (+ |j| 1) . #4#) G190
                                          (COND ((> |k1| |maxC|) (GO G191)))
                                          (SEQ
                                           (LETT |val1|
                                                 (SPADCALL
                                                  (SPADCALL |a|
                                                            (SPADCALL |x| |i|
                                                                      |k1|
                                                                      (QREFELT
                                                                       $ 13))
                                                            (QREFELT $ 22))
                                                  (SPADCALL |b|
                                                            (SPADCALL |x| |k|
                                                                      |k1|
                                                                      (QREFELT
                                                                       $ 13))
                                                            (QREFELT $ 22))
                                                  (QREFELT $ 23))
                                                 . #4#)
                                           (LETT |val2|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |a1|
                                                             (SPADCALL |x| |i|
                                                                       |k1|
                                                                       (QREFELT
                                                                        $ 13))
                                                             (QREFELT $ 22))
                                                   (QREFELT $ 48))
                                                  (SPADCALL |b1|
                                                            (SPADCALL |x| |k|
                                                                      |k1|
                                                                      (QREFELT
                                                                       $ 13))
                                                            (QREFELT $ 22))
                                                  (QREFELT $ 23))
                                                 . #4#)
                                           (SPADCALL |x| |i| |k1| |val1|
                                                     (QREFELT $ 51))
                                           (EXIT
                                            (SPADCALL |x| |k| |k1| |val2|
                                                      (QREFELT $ 51))))
                                          (LETT |k1| (+ |k1| 1) . #4#)
                                          (GO G190) G191 (EXIT NIL))
                                     (SPADCALL |x| |i| |j| |d| (QREFELT $ 51))
                                     (EXIT
                                      (SPADCALL |x| |k| |j|
                                                (|spadConstant| $ 14)
                                                (QREFELT $ 51))))))))
                                (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |un|
                                 (SPADCALL
                                  (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                  (QREFELT $ 103))
                                 . #4#)
                           (SPADCALL |x| |i| |j| (QVELT |un| 1) (QREFELT $ 51))
                           (COND
                            ((SPADCALL (QVELT |un| 2) (|spadConstant| $ 21)
                                       (QREFELT $ 16))
                             (SEQ (LETT |jj| (+ |j| 1) . #4#) G190
                                  (COND ((> |jj| |maxC|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |x| |i| |jj|
                                              (SPADCALL (QVELT |un| 2)
                                                        (SPADCALL |x| |i| |jj|
                                                                  (QREFELT $
                                                                           13))
                                                        (QREFELT $ 22))
                                              (QREFELT $ 51))))
                                  (LETT |jj| (+ |jj| 1) . #4#) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |xij| (SPADCALL |x| |i| |j| (QREFELT $ 13))
                                 . #4#)
                           (SEQ (LETT |k| |minR| . #4#)
                                (LETT #1# (- |i| 1) . #4#) G190
                                (COND ((> |k| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |x| |k| |j| (QREFELT $ 13))
                                     (|spadConstant| $ 14) (QREFELT $ 45))
                                    "next k")
                                   ('T
                                    (SEQ
                                     (LETT |qr|
                                           (SPADCALL
                                            (SPADCALL |x| |k| |j|
                                                      (QREFELT $ 13))
                                            |xij| (QREFELT $ 97))
                                           . #4#)
                                     (SPADCALL |x| |k| |j| (QCDR |qr|)
                                               (QREFELT $ 51))
                                     (EXIT
                                      (SEQ (LETT |k1| (+ |j| 1) . #4#) G190
                                           (COND ((> |k1| |maxC|) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL |x| |k| |k1|
                                                       (SPADCALL
                                                        (SPADCALL |x| |k| |k1|
                                                                  (QREFELT $
                                                                           13))
                                                        (SPADCALL (QCAR |qr|)
                                                                  (SPADCALL |x|
                                                                            |i|
                                                                            |k1|
                                                                            (QREFELT
                                                                             $
                                                                             13))
                                                                  (QREFELT $
                                                                           22))
                                                        (QREFELT $ 24))
                                                       (QREFELT $ 51))))
                                           (LETT |k1| (+ |k1| 1) . #4#)
                                           (GO G190) G191 (EXIT NIL))))))))
                                (LETT |k| (+ |k| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #4#)))))))
             (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL)))
       #3# (EXIT #3#))
      (EXIT |x|))))) 

(DEFUN |MATLIN;determinant;MR;26| (|x| $) (SPADCALL |x| (QREFELT $ 31))) 

(DECLAIM (NOTINLINE |MatrixLinearAlgebraFunctions;|)) 

(DEFUN |MatrixLinearAlgebraFunctions| (&REST #1=#:G320)
  (PROG ()
    (RETURN
     (PROG (#2=#:G321)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MatrixLinearAlgebraFunctions|)
                                           '|domainEqualList|)
                . #3=(|MatrixLinearAlgebraFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MatrixLinearAlgebraFunctions;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|MatrixLinearAlgebraFunctions|))))))))))) 

(DEFUN |MatrixLinearAlgebraFunctions;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MatrixLinearAlgebraFunctions|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MatrixLinearAlgebraFunctions| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 104) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory| |#1|
                                                              '(|EuclideanDomain|))
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|MatrixLinearAlgebraFunctions|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 54
                   (CONS (|dispatchFunction| |MATLIN;fractionFreeGauss!;2M;8|)
                         $))
         (QSETREFV $ 61
                   (CONS (|dispatchFunction| |MATLIN;invertIfCan;MU;10|) $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |MATLIN;adjoint;MR;11|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 67
                   (CONS (|dispatchFunction| |MATLIN;rowEchelon;2M;12|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |MATLIN;rank;MNni;13|) $))
         (QSETREFV $ 71 (CONS (|dispatchFunction| |MATLIN;nullity;MNni;14|) $))
         (QSETREFV $ 73
                   (CONS (|dispatchFunction| |MATLIN;determinant;MR;15|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |MATLIN;inverse;MU;16|) $))
         (COND
          ((|HasCategory| |#3| '(|shallowlyMutable|))
           (QSETREFV $ 78
                     (CONS (|dispatchFunction| |MATLIN;nullSpace;ML;17|) $)))
          ('T
           (QSETREFV $ 78
                     (CONS (|dispatchFunction| |MATLIN;nullSpace;ML;18|)
                           $))))))
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 78 (CONS (|dispatchFunction| |MATLIN;nullSpace;ML;19|) $))
         (QSETREFV $ 73
                   (CONS (|dispatchFunction| |MATLIN;determinant;MR;20|) $))
         (QSETREFV $ 69 (CONS (|dispatchFunction| |MATLIN;rank;MNni;21|) $))
         (QSETREFV $ 71 (CONS (|dispatchFunction| |MATLIN;nullity;MNni;22|) $))
         (COND
          ((|testBitVector| |pv$| 2)
           (PROGN
            (COND
             ((|HasCategory| |#1| '(|IntegerNumberSystem|))
              (QSETREFV $ 97
                        (CONS
                         (|dispatchFunction| |MATLIN;normalizedDivide;2RR;23|)
                         $)))
             ('T
              (QSETREFV $ 97
                        (CONS
                         (|dispatchFunction| |MATLIN;normalizedDivide;2RR;24|)
                         $))))
            (QSETREFV $ 67
                      (CONS (|dispatchFunction| |MATLIN;rowEchelon;2M;25|)
                            $)))))))
       ('T
        (QSETREFV $ 73
                  (CONS (|dispatchFunction| |MATLIN;determinant;MR;26|) $))))
      $)))) 

(MAKEPROP '|MatrixLinearAlgebraFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |qelt|) (17 . |Zero|) (|Boolean|)
              (21 . ~=) (27 . |minRowIndex|) (32 . |maxRowIndex|) (|List| 10)
              (37 . |concat!|) (43 . |One|) (47 . *) (53 . +) (59 . -)
              (|NonNegativeInteger|) (65 . |nrows|) (70 . |ncols|) (75 . ~=)
              (|SingleInteger|) (81 . ^) |MATLIN;minordet;MR;4| (87 . |row|)
              (93 . |setRow!|) |MATLIN;elRow1!;M2IM;5| (|Mapping| 6 6)
              (100 . |map|) (|Mapping| 6 6 6) (106 . |map|)
              |MATLIN;elRow2!;MR2IM;6| (113 . |column|) (119 . |map|)
              (125 . |map|) (132 . |setColumn!|) |MATLIN;elColumn2!;MR2IM;7|
              (139 . =) (145 . >) (151 . |swapRows!|) (158 . -)
              (|Union| $ '"failed") (163 . |exquo|) (169 . |qsetelt!|)
              (177 . |elt|) (184 . |setelt|) (192 . |fractionFreeGauss!|)
              (197 . |subMatrix|) (|Record| (|:| |adjMat| 9) (|:| |detMat| 6))
              (206 . |adjoint|) (211 . |recip|) (216 . *) (|Union| 9 '"failed")
              (222 . |invertIfCan|) (227 . |copy|) (232 . |scalarMatrix|)
              (238 . |horizConcat|)
              (|InnerMatrixLinearAlgebraFunctions| 6 7 8 9)
              (244 . |rowEchelon|) (249 . |rowEchelon|) (254 . |rank|)
              (259 . |rank|) (264 . |nullity|) (269 . |nullity|)
              (274 . |determinant|) (279 . |determinant|) (284 . |inverse|)
              (289 . |inverse|) (|List| 8) (294 . |nullSpace|)
              (299 . |nullSpace|) (|Matrix| 6)
              (|MatrixCategoryFunctions2| 6 7 8 9 6 85 85 79) (304 . |map|)
              (|List| 85) (|InnerMatrixLinearAlgebraFunctions| 6 85 85 79)
              (310 . |nullSpace|) (|Vector| 6)
              (|FiniteLinearAggregateFunctions2| 6 85 6 8) (315 . |map|)
              (|InnerMatrixQuotientFieldFunctions| 6 7 8 9 (|Fraction| 6)
                                                   (|Vector| (|Fraction| 6))
                                                   (|Vector| (|Fraction| 6))
                                                   (|Matrix| (|Fraction| 6)))
              (321 . |nullSpace|) (326 . >) (332 . |transpose|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (337 . |divide|) (343 . >=) (349 . >)
              (|Record| (|:| |quotient| 6) (|:| |remainder| 6))
              (355 . |normalizedDivide|) (361 . |zero?|) (366 . |sizeLess?|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (372 . |extendedEuclidean|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (378 . |unitNormal|))
           '#(|rowEchelon| 383 |rank| 388 |nullity| 393 |nullSpace| 398
              |normalizedDivide| 403 |minordet| 409 |invertIfCan| 414 |inverse|
              419 |fractionFreeGauss!| 424 |elRow2!| 429 |elRow1!| 437
              |elColumn2!| 444 |determinant| 452 |adjoint| 457)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 103
                                                 '(1 9 10 0 11 1 9 10 0 12 3 9
                                                   6 0 10 10 13 0 6 0 14 2 6 15
                                                   0 0 16 1 9 10 0 17 1 9 10 0
                                                   18 2 19 0 0 0 20 0 6 0 21 2
                                                   6 0 0 0 22 2 6 0 0 0 23 2 6
                                                   0 0 0 24 1 9 25 0 26 1 9 25
                                                   0 27 2 25 15 0 0 28 2 29 0 0
                                                   25 30 2 9 7 0 10 32 3 9 0 0
                                                   10 7 33 2 7 0 35 0 36 3 7 0
                                                   37 0 0 38 2 9 8 0 10 40 2 8
                                                   0 35 0 41 3 8 0 37 0 0 42 3
                                                   9 0 0 10 8 43 2 6 15 0 0 45
                                                   2 10 15 0 0 46 3 9 0 0 10 10
                                                   47 1 6 0 0 48 2 6 49 0 0 50
                                                   4 9 6 0 10 10 6 51 3 9 6 0
                                                   10 10 52 4 9 6 0 10 10 6 53
                                                   1 0 9 9 54 5 9 0 0 10 10 10
                                                   10 55 1 0 56 9 57 1 6 49 0
                                                   58 2 9 0 6 0 59 1 0 60 9 61
                                                   1 9 0 0 62 2 9 0 25 6 63 2 9
                                                   0 0 0 64 1 65 9 9 66 1 0 9 9
                                                   67 1 65 25 9 68 1 0 25 9 69
                                                   1 65 25 9 70 1 0 25 9 71 1
                                                   65 6 9 72 1 0 6 9 73 1 65 60
                                                   9 74 1 0 60 9 75 1 65 76 9
                                                   77 1 0 76 9 78 2 80 79 35 9
                                                   81 1 83 82 79 84 2 86 8 35
                                                   85 87 1 88 76 9 89 2 25 15 0
                                                   0 90 1 9 0 0 91 2 6 92 0 0
                                                   93 2 6 15 0 0 94 2 6 15 0 0
                                                   95 2 0 96 6 6 97 1 6 15 0 98
                                                   2 6 15 0 0 99 2 6 100 0 0
                                                   101 1 6 102 0 103 1 2 9 9 67
                                                   1 3 25 9 69 1 3 25 9 71 1 3
                                                   76 9 78 2 2 96 6 6 97 1 0 6
                                                   9 31 1 3 60 9 61 1 1 60 9 75
                                                   1 3 9 9 54 4 0 9 9 6 10 10
                                                   39 3 0 9 9 10 10 34 4 0 9 9
                                                   6 10 10 44 1 0 6 9 73 1 3 56
                                                   9 57)))))
           '|lookupComplete|)) 
