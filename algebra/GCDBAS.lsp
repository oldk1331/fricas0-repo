
(SDEFUN |GCDBAS;gcdBasis;2V;1| ((|v| |Vector| R) ($ |Vector| R))
        (QCAR (SPADCALL |v| (QREFELT $ 9)))) 

(SDEFUN |GCDBAS;splitNums|
        ((|a| R) (|b| R)
         ($ |Union|
          (|Record| (|:| |fac1| R) (|:| |fac2| R) (|:| |commonfac| R))
          "failed"))
        (SPROG ((|b1| (R)) (#1=#:G115 NIL) (|a1| (R)) (|cf| (R)))
               (SEQ
                (LETT |cf| (SPADCALL |a| |b| (QREFELT $ 11))
                      . #2=(|GCDBAS;splitNums|))
                (EXIT
                 (COND ((SPADCALL |cf| (QREFELT $ 13)) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (LETT |a1|
                               (PROG2
                                   (LETT #1# (SPADCALL |a| |cf| (QREFELT $ 15))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                #1#))
                               . #2#)
                         (LETT |b1|
                               (PROG2
                                   (LETT #1# (SPADCALL |b| |cf| (QREFELT $ 15))
                                         . #2#)
                                   (QCDR #1#)
                                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                                #1#))
                               . #2#)
                         (EXIT (CONS 0 (VECTOR |a1| |b1| |cf|)))))))))) 

(SDEFUN |GCDBAS;gcdDecomposition;VR;3|
        ((|v| |Vector| (|Fraction| R))
         ($ |Record| (|:| |basis| #1=(|Vector| R))
          (|:| |transform| #2=(|Matrix| (|Integer|)))))
        (SPROG
         ((|j| NIL) (|i| NIL) (|ct| (|Matrix| (|Integer|)))
          (|m| (|NonNegativeInteger|)) (|ct0| #2#) (|cb| #1#)
          (|pr|
           (|Record| (|:| |basis| (|Vector| R))
                     (|:| |transform| (|Matrix| (|Integer|)))))
          (|nv| (|Vector| R)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #3=(|GCDBAS;gcdDecomposition;VR;3|))
              (LETT |nv|
                    (MAKEARR1 (SPADCALL 2 |n| (QREFELT $ 18))
                              (|spadConstant| $ 19))
                    . #3#)
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |n|) (GO G191)))
                   (SEQ
                    (SPADCALL |nv| |i|
                              (SPADCALL (SPADCALL |v| |i| (QREFELT $ 23))
                                        (QREFELT $ 24))
                              (QREFELT $ 25))
                    (EXIT
                     (SPADCALL |nv| (+ |i| |n|)
                               (SPADCALL (SPADCALL |v| |i| (QREFELT $ 23))
                                         (QREFELT $ 26))
                               (QREFELT $ 25))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |pr| (SPADCALL |nv| (QREFELT $ 9)) . #3#) |pr|
              (LETT |cb| (QCAR |pr|) . #3#) (LETT |ct0| (QCDR |pr|) . #3#)
              (LETT |m| (QVSIZE |cb|) . #3#)
              (LETT |ct| (MAKE_MATRIX1 |m| |n| 0) . #3#)
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) G190
                          (COND ((|greater_SI| |j| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |ct| |i| |j|
                                      (-
                                       (SPADCALL |ct0| |i| |j| (QREFELT $ 29))
                                       (SPADCALL |ct0| |i| (+ |j| |n|)
                                                 (QREFELT $ 29)))
                                      (QREFELT $ 30))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |cb| |ct|))))) 

(SDEFUN |GCDBAS;gcdDecomposition;VR;4|
        ((|v| |Vector| R)
         ($ |Record| (|:| |basis| #1=(|Vector| R))
          (|:| |transform| #2=(|Matrix| (|Integer|)))))
        (SPROG
         ((#3=#:G166 NIL) (|i| NIL) (#4=#:G165 NIL)
          (|nv| (|Vector| (|Integer|))) (|a| (R)) (#5=#:G164 NIL) (|l| NIL)
          (|m| (|NonNegativeInteger|)) (|firstAdded| (|Boolean|))
          (|c| (|Integer|)) (|k| NIL) (|ov| (|Vector| (|Integer|)))
          (|n1| #6=(|NonNegativeInteger|)) (|ct1| #2#) (|cb1| #1#)
          (|dr1|
           (|Record| (|:| |basis| (|Vector| R))
                     (|:| |transform| (|Matrix| (|Integer|)))))
          (#7=#:G163 NIL) (|cf| (R)) (|b1| (R)) (|a1| (R))
          (|sr| (|Record| (|:| |fac1| R) (|:| |fac2| R) (|:| |commonfac| R)))
          (|sr1|
           (|Union|
            (|Record| (|:| |fac1| R) (|:| |fac2| R) (|:| |commonfac| R))
            "failed"))
          (|pquo| (|Union| R "failed")) (|b| (R)) (|j| NIL)
          (|i0| (|NonNegativeInteger|))
          (|ct| (|FlexibleArray| (|Vector| (|Integer|)))) (|n| #6#)
          (|cb| (|FlexibleArray| R)))
         (SEQ
          (LETT |cb| (SPADCALL (QREFELT $ 33))
                . #8=(|GCDBAS;gcdDecomposition;VR;4|))
          (LETT |n| (QVSIZE |v|) . #8#)
          (LETT |ct| (SPADCALL (QREFELT $ 35)) . #8#)
          (SEQ (LETT |i| 1 . #8#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |a| (SPADCALL |v| |i| (QREFELT $ 36)) . #8#)
                    (LETT |i0| (SPADCALL |cb| (QREFELT $ 37)) . #8#)
                    (SEQ (LETT |j| 1 . #8#) G190
                         (COND
                          ((OR (|greater_SI| |j| |i0|)
                               (NULL
                                (COND ((SPADCALL |a| (QREFELT $ 13)) 'NIL)
                                      ('T 'T))))
                           (GO G191)))
                         (SEQ
                          (LETT |b| (SPADCALL |cb| |j| (QREFELT $ 38)) . #8#)
                          (EXIT
                           (COND ((SPADCALL |b| (QREFELT $ 13)) "iterate")
                                 ('T
                                  (SEQ
                                   (LETT |pquo|
                                         (SPADCALL |a| |b| (QREFELT $ 15))
                                         . #8#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |pquo| 0)
                                      (SEQ G190
                                           (COND
                                            ((NULL (QEQCAR |pquo| 0))
                                             (GO G191)))
                                           (SEQ
                                            (SPADCALL
                                             (SPADCALL |ct| |j| (QREFELT $ 40))
                                             |i|
                                             (+
                                              (SPADCALL
                                               (SPADCALL |ct| |j|
                                                         (QREFELT $ 40))
                                               |i| (QREFELT $ 41))
                                              1)
                                             (QREFELT $ 42))
                                            (LETT |a| (QCDR |pquo|) . #8#)
                                            (EXIT
                                             (LETT |pquo|
                                                   (SPADCALL |a| |b|
                                                             (QREFELT $ 15))
                                                   . #8#)))
                                           NIL (GO G190) G191 (EXIT NIL)))
                                     ('T
                                      (SEQ
                                       (LETT |sr1|
                                             (|GCDBAS;splitNums| |a| |b| $)
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |sr1| 0)
                                          (SEQ (LETT |sr| (QCDR |sr1|) . #8#)
                                               (LETT |a1| (QVELT |sr| 0) . #8#)
                                               (LETT |b1| (QVELT |sr| 1) . #8#)
                                               (LETT |cf| (QVELT |sr| 2) . #8#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL
                                                   (SPADCALL |a1| |cf|
                                                             (QREFELT $ 11))
                                                   (QREFELT $ 13))
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |b1| |cf|
                                                               (QREFELT $ 11))
                                                     (QREFELT $ 13))
                                                    (SEQ
                                                     (SPADCALL |cb| |b1|
                                                               (QREFELT $ 43))
                                                     (SPADCALL |ct|
                                                               (SPADCALL
                                                                (SPADCALL |ct|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           40))
                                                                (QREFELT $ 44))
                                                               (QREFELT $ 45))
                                                     (SPADCALL |cb| |j| |cf|
                                                               (QREFELT $ 46))
                                                     (SPADCALL
                                                      (SPADCALL |ct| |j|
                                                                (QREFELT $ 40))
                                                      |i| 1 (QREFELT $ 42))
                                                     (EXIT
                                                      (LETT |a| |a1| . #8#))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |dr1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (LIST |a1| |b1|
                                                                   |cf|)
                                                             (QREFELT $ 48))
                                                            (QREFELT $ 9))
                                                           . #8#)
                                                     (LETT |cb1| (QCAR |dr1|)
                                                           . #8#)
                                                     (LETT |ct1| (QCDR |dr1|)
                                                           . #8#)
                                                     (LETT |firstAdded| 'T
                                                           . #8#)
                                                     (LETT |a|
                                                           (|spadConstant| $
                                                                           49)
                                                           . #8#)
                                                     (LETT |n1| (QVSIZE |cb1|)
                                                           . #8#)
                                                     (LETT |ov|
                                                           (SPADCALL |ct| |j|
                                                                     (QREFELT $
                                                                              40))
                                                           . #8#)
                                                     (EXIT
                                                      (SEQ (LETT |k| 1 . #8#)
                                                           G190
                                                           (COND
                                                            ((|greater_SI| |k|
                                                                           |n1|)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |c|
                                                                  (+
                                                                   (SPADCALL
                                                                    |ct1| |k| 2
                                                                    (QREFELT $
                                                                             29))
                                                                   (SPADCALL
                                                                    |ct1| |k| 3
                                                                    (QREFELT $
                                                                             29)))
                                                                  . #8#)
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |c| 0
                                                                         (QREFELT
                                                                          $
                                                                          50))
                                                               (SEQ
                                                                (COND
                                                                 (|firstAdded|
                                                                  (SEQ
                                                                   (LETT
                                                                    |firstAdded|
                                                                    'NIL . #8#)
                                                                   (SPADCALL
                                                                    |cb| |j|
                                                                    (SPADCALL
                                                                     |cb1| |k|
                                                                     (QREFELT $
                                                                              36))
                                                                    (QREFELT $
                                                                             46))
                                                                   (EXIT
                                                                    (LETT |m|
                                                                          |j|
                                                                          . #8#))))
                                                                 ('T
                                                                  (SEQ
                                                                   (SPADCALL
                                                                    |cb|
                                                                    (SPADCALL
                                                                     |cb1| |k|
                                                                     (QREFELT $
                                                                              36))
                                                                    (QREFELT $
                                                                             43))
                                                                   (SPADCALL
                                                                    |ct|
                                                                    (MAKE-ARRAY
                                                                     0)
                                                                    (QREFELT $
                                                                             45))
                                                                   (EXIT
                                                                    (LETT |m|
                                                                          (SPADCALL
                                                                           |cb|
                                                                           (QREFELT
                                                                            $
                                                                            37))
                                                                          . #8#)))))
                                                                (LETT |nv|
                                                                      (MAKEARR1
                                                                       |n| 0)
                                                                      . #8#)
                                                                (SEQ
                                                                 (LETT |l| 1
                                                                       . #8#)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |l| |n|)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (SPADCALL
                                                                    |nv| |l|
                                                                    (* |c|
                                                                       (SPADCALL
                                                                        |ov|
                                                                        |l|
                                                                        (QREFELT
                                                                         $
                                                                         41)))
                                                                    (QREFELT $
                                                                             42))))
                                                                 (LETT |l|
                                                                       (|inc_SI|
                                                                        |l|)
                                                                       . #8#)
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (SPADCALL |nv|
                                                                          |i|
                                                                          (+
                                                                           (SPADCALL
                                                                            |ct1|
                                                                            |k|
                                                                            1
                                                                            (QREFELT
                                                                             $
                                                                             29))
                                                                           (SPADCALL
                                                                            |ct1|
                                                                            |k|
                                                                            3
                                                                            (QREFELT
                                                                             $
                                                                             29)))
                                                                          (QREFELT
                                                                           $
                                                                           42))
                                                                (EXIT
                                                                 (SPADCALL |ct|
                                                                           |m|
                                                                           |nv|
                                                                           (QREFELT
                                                                            $
                                                                            51)))))
                                                              ('T
                                                               (SEQ
                                                                (LETT |l| 1
                                                                      . #8#)
                                                                (LETT #7#
                                                                      (SPADCALL
                                                                       |ct1|
                                                                       |k| 1
                                                                       (QREFELT
                                                                        $ 29))
                                                                      . #8#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |l| #7#)
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (EXIT
                                                                  (LETT |a|
                                                                        (SPADCALL
                                                                         |a|
                                                                         (SPADCALL
                                                                          |cb1|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           36))
                                                                         (QREFELT
                                                                          $
                                                                          52))
                                                                        . #8#)))
                                                                (LETT |l|
                                                                      (|inc_SI|
                                                                       |l|)
                                                                      . #8#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))))
                                                           (LETT |k|
                                                                 (|inc_SI| |k|)
                                                                 . #8#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |dr1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (LIST |a1| |b1|
                                                                 |cf|)
                                                           (QREFELT $ 48))
                                                          (QREFELT $ 9))
                                                         . #8#)
                                                   (LETT |cb1| (QCAR |dr1|)
                                                         . #8#)
                                                   (LETT |ct1| (QCDR |dr1|)
                                                         . #8#)
                                                   (LETT |firstAdded| 'T . #8#)
                                                   (LETT |a|
                                                         (|spadConstant| $ 49)
                                                         . #8#)
                                                   (LETT |n1| (QVSIZE |cb1|)
                                                         . #8#)
                                                   (LETT |ov|
                                                         (SPADCALL |ct| |j|
                                                                   (QREFELT $
                                                                            40))
                                                         . #8#)
                                                   (EXIT
                                                    (SEQ (LETT |k| 1 . #8#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |k|
                                                                         |n1|)
                                                           (GO G191)))
                                                         (SEQ
                                                          (LETT |c|
                                                                (+
                                                                 (SPADCALL
                                                                  |ct1| |k| 2
                                                                  (QREFELT $
                                                                           29))
                                                                 (SPADCALL
                                                                  |ct1| |k| 3
                                                                  (QREFELT $
                                                                           29)))
                                                                . #8#)
                                                          (EXIT
                                                           (COND
                                                            ((SPADCALL |c| 0
                                                                       (QREFELT
                                                                        $ 50))
                                                             (SEQ
                                                              (COND
                                                               (|firstAdded|
                                                                (SEQ
                                                                 (LETT
                                                                  |firstAdded|
                                                                  'NIL . #8#)
                                                                 (SPADCALL |cb|
                                                                           |j|
                                                                           (SPADCALL
                                                                            |cb1|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             36))
                                                                           (QREFELT
                                                                            $
                                                                            46))
                                                                 (EXIT
                                                                  (LETT |m| |j|
                                                                        . #8#))))
                                                               ('T
                                                                (SEQ
                                                                 (SPADCALL |cb|
                                                                           (SPADCALL
                                                                            |cb1|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             36))
                                                                           (QREFELT
                                                                            $
                                                                            43))
                                                                 (SPADCALL |ct|
                                                                           (MAKE-ARRAY
                                                                            0)
                                                                           (QREFELT
                                                                            $
                                                                            45))
                                                                 (EXIT
                                                                  (LETT |m|
                                                                        (SPADCALL
                                                                         |cb|
                                                                         (QREFELT
                                                                          $
                                                                          37))
                                                                        . #8#)))))
                                                              (LETT |nv|
                                                                    (MAKEARR1
                                                                     |n| 0)
                                                                    . #8#)
                                                              (SEQ
                                                               (LETT |l| 1
                                                                     . #8#)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |l| |n|)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (SPADCALL |nv|
                                                                           |l|
                                                                           (*
                                                                            |c|
                                                                            (SPADCALL
                                                                             |ov|
                                                                             |l|
                                                                             (QREFELT
                                                                              $
                                                                              41)))
                                                                           (QREFELT
                                                                            $
                                                                            42))))
                                                               (LETT |l|
                                                                     (|inc_SI|
                                                                      |l|)
                                                                     . #8#)
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                              (SPADCALL |nv|
                                                                        |i|
                                                                        (+
                                                                         (SPADCALL
                                                                          |ct1|
                                                                          |k| 1
                                                                          (QREFELT
                                                                           $
                                                                           29))
                                                                         (SPADCALL
                                                                          |ct1|
                                                                          |k| 3
                                                                          (QREFELT
                                                                           $
                                                                           29)))
                                                                        (QREFELT
                                                                         $ 42))
                                                              (EXIT
                                                               (SPADCALL |ct|
                                                                         |m|
                                                                         |nv|
                                                                         (QREFELT
                                                                          $
                                                                          51)))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |l| 1
                                                                    . #8#)
                                                              (LETT #5#
                                                                    (SPADCALL
                                                                     |ct1| |k|
                                                                     1
                                                                     (QREFELT $
                                                                              29))
                                                                    . #8#)
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |l| #5#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT |a|
                                                                      (SPADCALL
                                                                       |a|
                                                                       (SPADCALL
                                                                        |cb1|
                                                                        |k|
                                                                        (QREFELT
                                                                         $ 36))
                                                                       (QREFELT
                                                                        $ 52))
                                                                      . #8#)))
                                                              (LETT |l|
                                                                    (|inc_SI|
                                                                     |l|)
                                                                    . #8#)
                                                              (GO G190) G191
                                                              (EXIT NIL))))))
                                                         (LETT |k|
                                                               (|inc_SI| |k|)
                                                               . #8#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          NIL))))))))))))))))))))
                         (LETT |j| (|inc_SI| |j|) . #8#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL |a| (|spadConstant| $ 49) (QREFELT $ 53)))
                       (SEQ (SPADCALL |cb| |a| (QREFELT $ 43))
                            (LETT |nv| (MAKEARR1 |n| 0) . #8#)
                            (SPADCALL |nv| |i| 1 (QREFELT $ 42))
                            (EXIT (SPADCALL |ct| |nv| (QREFELT $ 45))))))))
               (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS (SPADCALL (SPADCALL |cb| (QREFELT $ 54)) (QREFELT $ 48))
                 (SPADCALL
                  (PROGN
                   (LETT #4# NIL . #8#)
                   (SEQ (LETT |i| 1 . #8#)
                        (LETT #3# (SPADCALL |ct| (QREFELT $ 55)) . #8#) G190
                        (COND ((|greater_SI| |i| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4#
                                (CONS
                                 (SPADCALL (SPADCALL |ct| |i| (QREFELT $ 40))
                                           (QREFELT $ 57))
                                 #4#)
                                . #8#)))
                        (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  (QREFELT $ 59))))))) 

(DECLAIM (NOTINLINE |GcdBasis;|)) 

(DEFUN |GcdBasis| (#1=#:G167)
  (SPROG NIL
         (PROG (#2=#:G168)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GcdBasis|)
                                               '|domainEqualList|)
                    . #3=(|GcdBasis|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|GcdBasis;| #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|GcdBasis|)))))))))) 

(DEFUN |GcdBasis;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GcdBasis|))
          (LETT |dv$| (LIST '|GcdBasis| DV$1) . #1#)
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GcdBasis| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GcdBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |basis| 8) (|:| |transform| 28)) (|Vector| 6)
              |GCDBAS;gcdDecomposition;VR;4| |GCDBAS;gcdBasis;2V;1| (0 . |gcd|)
              (|Boolean|) (6 . |unit?|) (|Union| $ '"failed") (11 . |exquo|)
              (|PositiveInteger|) (|NonNegativeInteger|) (17 . *) (23 . |Zero|)
              (|Fraction| 6) (|Integer|) (|Vector| 20) (27 . |elt|)
              (33 . |numer|) (38 . |setelt|) (45 . |denom|) (50 . |Zero|)
              (|Matrix| 21) (54 . |elt|) (61 . |setelt|)
              |GCDBAS;gcdDecomposition;VR;3| (|FlexibleArray| 6) (69 . |empty|)
              (|FlexibleArray| 39) (73 . |empty|) (77 . |elt|) (83 . |#|)
              (88 . |elt|) (|Vector| 21) (94 . |elt|) (100 . |elt|)
              (106 . |setelt|) (113 . |concat!|) (119 . |copy|)
              (124 . |concat!|) (130 . |setelt|) (|List| 6) (137 . |vector|)
              (142 . |One|) (146 . >) (152 . |setelt|) (159 . *) (165 . =)
              (171 . |parts|) (176 . |#|) (|List| 21) (181 . |parts|)
              (|List| 56) (186 . |matrix|))
           '#(|gcdDecomposition| 191 |gcdBasis| 201) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(2 6 0 0 0 11 1 6 12 0 13 2 6
                                                   14 0 0 15 2 17 0 16 0 18 0 6
                                                   0 19 2 22 20 0 21 23 1 20 6
                                                   0 24 3 8 6 0 21 6 25 1 20 6
                                                   0 26 0 20 0 27 3 28 21 0 21
                                                   21 29 4 28 21 0 21 21 21 30
                                                   0 32 0 33 0 34 0 35 2 8 6 0
                                                   21 36 1 32 17 0 37 2 32 6 0
                                                   21 38 2 34 39 0 21 40 2 39
                                                   21 0 21 41 3 39 21 0 21 21
                                                   42 2 32 0 0 6 43 1 39 0 0 44
                                                   2 34 0 0 39 45 3 32 6 0 21 6
                                                   46 1 8 0 47 48 0 6 0 49 2 21
                                                   12 0 0 50 3 34 39 0 21 39 51
                                                   2 6 0 0 0 52 2 6 12 0 0 53 1
                                                   32 47 0 54 1 34 17 0 55 1 39
                                                   56 0 57 1 28 0 58 59 1 0 7
                                                   22 31 1 0 7 8 9 1 0 8 8
                                                   10)))))
           '|lookupComplete|)) 
