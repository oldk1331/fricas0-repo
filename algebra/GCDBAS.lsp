
(/VERSIONCHECK 2) 

(DEFUN |GCDBAS;gcdBasis;2V;1| (|v| $) (QCAR (SPADCALL |v| (QREFELT $ 9)))) 

(DEFUN |GCDBAS;splitNums| (|a| |b| $)
  (PROG (|b1| #1=#:G137 |a1| |cf|)
    (RETURN
     (SEQ
      (LETT |cf| (SPADCALL |a| |b| (QREFELT $ 11)) . #2=(|GCDBAS;splitNums|))
      (EXIT
       (COND ((SPADCALL |cf| (QREFELT $ 13)) (CONS 1 "failed"))
             ('T
              (SEQ
               (LETT |a1|
                     (PROG2 (LETT #1# (SPADCALL |a| |cf| (QREFELT $ 15)) . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                     . #2#)
               (LETT |b1|
                     (PROG2 (LETT #1# (SPADCALL |b| |cf| (QREFELT $ 15)) . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                     . #2#)
               (EXIT (CONS 0 (VECTOR |a1| |b1| |cf|))))))))))) 

(DEFUN |GCDBAS;gcdDecomposition;VR;3| (|v| $)
  (PROG (|j| |i| |ct| |m| |ct0| |cb| |pr| |nv| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #1=(|GCDBAS;gcdDecomposition;VR;3|))
          (LETT |nv|
                (MAKEARR1 (SPADCALL 2 |n| (QREFELT $ 18))
                          (|spadConstant| $ 19))
                . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
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
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |pr| (SPADCALL |nv| (QREFELT $ 9)) . #1#) |pr|
          (LETT |cb| (QCAR |pr|) . #1#) (LETT |ct0| (QCDR |pr|) . #1#)
          (LETT |m| (QVSIZE |cb|) . #1#)
          (LETT |ct| (SPADCALL |m| |n| 0 (QREFELT $ 29)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |m|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ct| |i| |j|
                                  (- (SPADCALL |ct0| |i| |j| (QREFELT $ 30))
                                     (SPADCALL |ct0| |i| (+ |j| |n|)
                                               (QREFELT $ 30)))
                                  (QREFELT $ 31))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |cb| |ct|)))))) 

(DEFUN |GCDBAS;gcdDecomposition;VR;4| (|v| $)
  (PROG (#1=#:G188 |i| #2=#:G187 |nv| |a| #3=#:G186 |l| |m| |firstAdded| |c|
         |k| |ov| |n1| |ct1| |cb1| |dr1| #4=#:G185 |cf| |b1| |a1| |sr| |sr1|
         |pquo| |b| |j| |i0| |ct| |n| |cb|)
    (RETURN
     (SEQ
      (LETT |cb| (SPADCALL (QREFELT $ 34))
            . #5=(|GCDBAS;gcdDecomposition;VR;4|))
      (LETT |n| (QVSIZE |v|) . #5#) (LETT |ct| (SPADCALL (QREFELT $ 36)) . #5#)
      (SEQ (LETT |i| 1 . #5#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |a| (SPADCALL |v| |i| (QREFELT $ 37)) . #5#)
                (LETT |i0| (SPADCALL |cb| (QREFELT $ 38)) . #5#)
                (SEQ (LETT |j| 1 . #5#) G190
                     (COND
                      ((OR (|greater_SI| |j| |i0|)
                           (NULL
                            (COND ((SPADCALL |a| (QREFELT $ 13)) 'NIL)
                                  ('T 'T))))
                       (GO G191)))
                     (SEQ (LETT |b| (SPADCALL |cb| |j| (QREFELT $ 39)) . #5#)
                          (EXIT
                           (COND ((SPADCALL |b| (QREFELT $ 13)) "iterate")
                                 ('T
                                  (SEQ
                                   (LETT |pquo|
                                         (SPADCALL |a| |b| (QREFELT $ 15))
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |pquo| 0)
                                      (SEQ G190
                                           (COND
                                            ((NULL (QEQCAR |pquo| 0))
                                             (GO G191)))
                                           (SEQ
                                            (SPADCALL
                                             (SPADCALL |ct| |j| (QREFELT $ 41))
                                             |i|
                                             (+
                                              (SPADCALL
                                               (SPADCALL |ct| |j|
                                                         (QREFELT $ 41))
                                               |i| (QREFELT $ 42))
                                              1)
                                             (QREFELT $ 43))
                                            (LETT |a| (QCDR |pquo|) . #5#)
                                            (EXIT
                                             (LETT |pquo|
                                                   (SPADCALL |a| |b|
                                                             (QREFELT $ 15))
                                                   . #5#)))
                                           NIL (GO G190) G191 (EXIT NIL)))
                                     ('T
                                      (SEQ
                                       (LETT |sr1|
                                             (|GCDBAS;splitNums| |a| |b| $)
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |sr1| 0)
                                          (SEQ (LETT |sr| (QCDR |sr1|) . #5#)
                                               (LETT |a1| (QVELT |sr| 0) . #5#)
                                               (LETT |b1| (QVELT |sr| 1) . #5#)
                                               (LETT |cf| (QVELT |sr| 2) . #5#)
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
                                                               (QREFELT $ 44))
                                                     (SPADCALL |ct|
                                                               (SPADCALL
                                                                (SPADCALL |ct|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           41))
                                                                (QREFELT $ 45))
                                                               (QREFELT $ 46))
                                                     (SPADCALL |cb| |j| |cf|
                                                               (QREFELT $ 47))
                                                     (SPADCALL
                                                      (SPADCALL |ct| |j|
                                                                (QREFELT $ 41))
                                                      |i| 1 (QREFELT $ 43))
                                                     (EXIT
                                                      (LETT |a| |a1| . #5#))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |dr1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (LIST |a1| |b1|
                                                                   |cf|)
                                                             (QREFELT $ 49))
                                                            (QREFELT $ 9))
                                                           . #5#)
                                                     (LETT |cb1| (QCAR |dr1|)
                                                           . #5#)
                                                     (LETT |ct1| (QCDR |dr1|)
                                                           . #5#)
                                                     (LETT |firstAdded| 'T
                                                           . #5#)
                                                     (LETT |a|
                                                           (|spadConstant| $
                                                                           50)
                                                           . #5#)
                                                     (LETT |n1| (QVSIZE |cb1|)
                                                           . #5#)
                                                     (LETT |ov|
                                                           (SPADCALL |ct| |j|
                                                                     (QREFELT $
                                                                              41))
                                                           . #5#)
                                                     (EXIT
                                                      (SEQ (LETT |k| 1 . #5#)
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
                                                                             30))
                                                                   (SPADCALL
                                                                    |ct1| |k| 3
                                                                    (QREFELT $
                                                                             30)))
                                                                  . #5#)
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL |c| 0
                                                                         (QREFELT
                                                                          $
                                                                          51))
                                                               (SEQ
                                                                (COND
                                                                 (|firstAdded|
                                                                  (SEQ
                                                                   (LETT
                                                                    |firstAdded|
                                                                    'NIL . #5#)
                                                                   (SPADCALL
                                                                    |cb| |j|
                                                                    (SPADCALL
                                                                     |cb1| |k|
                                                                     (QREFELT $
                                                                              37))
                                                                    (QREFELT $
                                                                             47))
                                                                   (EXIT
                                                                    (LETT |m|
                                                                          |j|
                                                                          . #5#))))
                                                                 ('T
                                                                  (SEQ
                                                                   (SPADCALL
                                                                    |cb|
                                                                    (SPADCALL
                                                                     |cb1| |k|
                                                                     (QREFELT $
                                                                              37))
                                                                    (QREFELT $
                                                                             44))
                                                                   (SPADCALL
                                                                    |ct|
                                                                    (MAKE-ARRAY
                                                                     0)
                                                                    (QREFELT $
                                                                             46))
                                                                   (EXIT
                                                                    (LETT |m|
                                                                          (SPADCALL
                                                                           |cb|
                                                                           (QREFELT
                                                                            $
                                                                            38))
                                                                          . #5#)))))
                                                                (LETT |nv|
                                                                      (MAKEARR1
                                                                       |n| 0)
                                                                      . #5#)
                                                                (SEQ
                                                                 (LETT |l| 1
                                                                       . #5#)
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
                                                                         42)))
                                                                    (QREFELT $
                                                                             43))))
                                                                 (LETT |l|
                                                                       (|inc_SI|
                                                                        |l|)
                                                                       . #5#)
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
                                                                             30))
                                                                           (SPADCALL
                                                                            |ct1|
                                                                            |k|
                                                                            3
                                                                            (QREFELT
                                                                             $
                                                                             30)))
                                                                          (QREFELT
                                                                           $
                                                                           43))
                                                                (EXIT
                                                                 (SPADCALL |ct|
                                                                           |m|
                                                                           |nv|
                                                                           (QREFELT
                                                                            $
                                                                            52)))))
                                                              ('T
                                                               (SEQ
                                                                (LETT |l| 1
                                                                      . #5#)
                                                                (LETT #4#
                                                                      (SPADCALL
                                                                       |ct1|
                                                                       |k| 1
                                                                       (QREFELT
                                                                        $ 30))
                                                                      . #5#)
                                                                G190
                                                                (COND
                                                                 ((|greater_SI|
                                                                   |l| #4#)
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
                                                                           37))
                                                                         (QREFELT
                                                                          $
                                                                          53))
                                                                        . #5#)))
                                                                (LETT |l|
                                                                      (|inc_SI|
                                                                       |l|)
                                                                      . #5#)
                                                                (GO G190) G191
                                                                (EXIT NIL))))))
                                                           (LETT |k|
                                                                 (|inc_SI| |k|)
                                                                 . #5#)
                                                           (GO G190) G191
                                                           (EXIT NIL)))))))
                                                 ('T
                                                  (SEQ
                                                   (LETT |dr1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (LIST |a1| |b1|
                                                                 |cf|)
                                                           (QREFELT $ 49))
                                                          (QREFELT $ 9))
                                                         . #5#)
                                                   (LETT |cb1| (QCAR |dr1|)
                                                         . #5#)
                                                   (LETT |ct1| (QCDR |dr1|)
                                                         . #5#)
                                                   (LETT |firstAdded| 'T . #5#)
                                                   (LETT |a|
                                                         (|spadConstant| $ 50)
                                                         . #5#)
                                                   (LETT |n1| (QVSIZE |cb1|)
                                                         . #5#)
                                                   (LETT |ov|
                                                         (SPADCALL |ct| |j|
                                                                   (QREFELT $
                                                                            41))
                                                         . #5#)
                                                   (EXIT
                                                    (SEQ (LETT |k| 1 . #5#)
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
                                                                           30))
                                                                 (SPADCALL
                                                                  |ct1| |k| 3
                                                                  (QREFELT $
                                                                           30)))
                                                                . #5#)
                                                          (EXIT
                                                           (COND
                                                            ((SPADCALL |c| 0
                                                                       (QREFELT
                                                                        $ 51))
                                                             (SEQ
                                                              (COND
                                                               (|firstAdded|
                                                                (SEQ
                                                                 (LETT
                                                                  |firstAdded|
                                                                  'NIL . #5#)
                                                                 (SPADCALL |cb|
                                                                           |j|
                                                                           (SPADCALL
                                                                            |cb1|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             37))
                                                                           (QREFELT
                                                                            $
                                                                            47))
                                                                 (EXIT
                                                                  (LETT |m| |j|
                                                                        . #5#))))
                                                               ('T
                                                                (SEQ
                                                                 (SPADCALL |cb|
                                                                           (SPADCALL
                                                                            |cb1|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             37))
                                                                           (QREFELT
                                                                            $
                                                                            44))
                                                                 (SPADCALL |ct|
                                                                           (MAKE-ARRAY
                                                                            0)
                                                                           (QREFELT
                                                                            $
                                                                            46))
                                                                 (EXIT
                                                                  (LETT |m|
                                                                        (SPADCALL
                                                                         |cb|
                                                                         (QREFELT
                                                                          $
                                                                          38))
                                                                        . #5#)))))
                                                              (LETT |nv|
                                                                    (MAKEARR1
                                                                     |n| 0)
                                                                    . #5#)
                                                              (SEQ
                                                               (LETT |l| 1
                                                                     . #5#)
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
                                                                              42)))
                                                                           (QREFELT
                                                                            $
                                                                            43))))
                                                               (LETT |l|
                                                                     (|inc_SI|
                                                                      |l|)
                                                                     . #5#)
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
                                                                           30))
                                                                         (SPADCALL
                                                                          |ct1|
                                                                          |k| 3
                                                                          (QREFELT
                                                                           $
                                                                           30)))
                                                                        (QREFELT
                                                                         $ 43))
                                                              (EXIT
                                                               (SPADCALL |ct|
                                                                         |m|
                                                                         |nv|
                                                                         (QREFELT
                                                                          $
                                                                          52)))))
                                                            ('T
                                                             (SEQ
                                                              (LETT |l| 1
                                                                    . #5#)
                                                              (LETT #3#
                                                                    (SPADCALL
                                                                     |ct1| |k|
                                                                     1
                                                                     (QREFELT $
                                                                              30))
                                                                    . #5#)
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |l| #3#)
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
                                                                         $ 37))
                                                                       (QREFELT
                                                                        $ 53))
                                                                      . #5#)))
                                                              (LETT |l|
                                                                    (|inc_SI|
                                                                     |l|)
                                                                    . #5#)
                                                              (GO G190) G191
                                                              (EXIT NIL))))))
                                                         (LETT |k|
                                                               (|inc_SI| |k|)
                                                               . #5#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          NIL))))))))))))))))))))
                     (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((NULL (SPADCALL |a| (|spadConstant| $ 50) (QREFELT $ 54)))
                   (SEQ (SPADCALL |cb| |a| (QREFELT $ 44))
                        (LETT |nv| (MAKEARR1 |n| 0) . #5#)
                        (SPADCALL |nv| |i| 1 (QREFELT $ 43))
                        (EXIT (SPADCALL |ct| |nv| (QREFELT $ 46))))))))
           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS (SPADCALL (SPADCALL |cb| (QREFELT $ 55)) (QREFELT $ 49))
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #5#)
               (SEQ (LETT |i| 1 . #5#)
                    (LETT #1# (SPADCALL |ct| (QREFELT $ 56)) . #5#) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (SPADCALL |ct| |i| (QREFELT $ 41))
                                       (QREFELT $ 58))
                             #2#)
                            . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 60)))))))) 

(DEFUN |GcdBasis| (#1=#:G189)
  (PROG ()
    (RETURN
     (PROG (#2=#:G190)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|GcdBasis|))))))))))) 

(DEFUN |GcdBasis;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GcdBasis|))
      (LETT |dv$| (LIST '|GcdBasis| DV$1) . #1#)
      (LETT $ (GETREFV 61) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|GcdBasis| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|GcdBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |basis| 8) (|:| |transform| 28)) (|Vector| 6)
              |GCDBAS;gcdDecomposition;VR;4| |GCDBAS;gcdBasis;2V;1| (0 . |gcd|)
              (|Boolean|) (6 . |unit?|) (|Union| $ '"failed") (11 . |exquo|)
              (|PositiveInteger|) (|NonNegativeInteger|) (17 . *) (23 . |Zero|)
              (|Fraction| 6) (|Integer|) (|Vector| 20) (27 . |elt|)
              (33 . |numer|) (38 . |setelt|) (45 . |denom|) (50 . |Zero|)
              (|Matrix| 21) (54 . |new|) (61 . |elt|) (68 . |setelt|)
              |GCDBAS;gcdDecomposition;VR;3| (|FlexibleArray| 6) (76 . |empty|)
              (|FlexibleArray| 40) (80 . |empty|) (84 . |elt|) (90 . |#|)
              (95 . |elt|) (|Vector| 21) (101 . |elt|) (107 . |elt|)
              (113 . |setelt|) (120 . |concat!|) (126 . |copy|)
              (131 . |concat!|) (137 . |setelt|) (|List| 6) (144 . |vector|)
              (149 . |One|) (153 . >) (159 . |setelt|) (166 . *) (172 . =)
              (178 . |parts|) (183 . |#|) (|List| 21) (188 . |parts|)
              (|List| 57) (193 . |matrix|))
           '#(|gcdDecomposition| 198 |gcdBasis| 208) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(2 6 0 0 0 11 1 6 12 0 13 2 6
                                                   14 0 0 15 2 17 0 16 0 18 0 6
                                                   0 19 2 22 20 0 21 23 1 20 6
                                                   0 24 3 8 6 0 21 6 25 1 20 6
                                                   0 26 0 20 0 27 3 28 0 17 17
                                                   21 29 3 28 21 0 21 21 30 4
                                                   28 21 0 21 21 21 31 0 33 0
                                                   34 0 35 0 36 2 8 6 0 21 37 1
                                                   33 17 0 38 2 33 6 0 21 39 2
                                                   35 40 0 21 41 2 40 21 0 21
                                                   42 3 40 21 0 21 21 43 2 33 0
                                                   0 6 44 1 40 0 0 45 2 35 0 0
                                                   40 46 3 33 6 0 21 6 47 1 8 0
                                                   48 49 0 6 0 50 2 21 12 0 0
                                                   51 3 35 40 0 21 40 52 2 6 0
                                                   0 0 53 2 6 12 0 0 54 1 33 48
                                                   0 55 1 35 17 0 56 1 40 57 0
                                                   58 1 28 0 59 60 1 0 7 22 32
                                                   1 0 7 8 9 1 0 8 8 10)))))
           '|lookupComplete|)) 
