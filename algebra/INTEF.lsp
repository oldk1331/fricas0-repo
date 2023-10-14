
(/VERSIONCHECK 2) 

(DEFUN |INTEF;prim?| (|k| |x| $)
  (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
        ('T
         (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                   (QREFELT $ 16))))) 

(DEFUN |INTEF;tanint| (|f| |x| |k| $)
  (PROG (|r1| |eta'| |eta|)
    (RETURN
     (SEQ
      (LETT |eta'|
            (SPADCALL
             (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                   . #1=(|INTEF;tanint|))
             |x| (QREFELT $ 19))
            . #1#)
      (LETT |r1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;tanint!1| (VECTOR |eta'| |x| $))
                      (CONS #'|INTEF;tanint!4| (VECTOR |x| $ |eta|))
                      (QREFELT $ 50))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (CONS #'|INTEF;tanint!5| (VECTOR $ |k|)) (QCAR |r1|)
                  (QREFELT $ 57))
        (SPADCALL (QCDR |r1|) |x| (QREFELT $ 58)) (QREFELT $ 59))))))) 

(DEFUN |INTEF;tanint!5| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;tanint|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;tanint!4| (|x6| |x2| |x3| $$)
  (PROG (|eta| $ |x|)
    (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;tanint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x6| (SPADCALL 2 |eta| (QREFELT $ 31)) |x2| |x3| |x|
                   (CONS #'|INTEF;tanint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;tanint!3| (VECTOR $ |x|))
                   (QREFELT $ 44)))))))) 

(DEFUN |INTEF;tanint!3| (|x4| |x5| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x4| |x| |x5| (QREFELT $ 38)))))) 

(DEFUN |INTEF;tanint!2| (|x4| |x5| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x4| |x| |x5| (QREFELT $ 35)))))) 

(DEFUN |INTEF;tanint!1| (|x1| $$)
  (PROG ($ |x| |eta'|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;tanint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |eta'| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;tanint!0| (VECTOR $ |x|))
                   (SPADCALL (SPADCALL |eta'| 2 (QREFELT $ 25))
                             (SPADCALL |eta'| (QREFELT $ 26)) (QREFELT $ 27))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;tanint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;unknownint| (|f| |x| $)
  (PROG (|c| |da| |a| #1=#:G225 |u| |z| |zz| |ka| |l| |k| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 61)) . #2=(|INTEF;unknownint|))
             (EXIT
              (COND
               ((QEQCAR |r| 0)
                (COND
                 ((SPADCALL (LETT |k| (QCDR |r|) . #2#) '|%diff|
                            (QREFELT $ 13))
                  (SEQ
                   (LETT |ka|
                         (SPADCALL
                          (LETT |a|
                                (SPADCALL
                                 (LETT |l| (SPADCALL |k| (QREFELT $ 18)) . #2#)
                                 (QREFELT $ 62))
                                . #2#)
                          (QREFELT $ 61))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |ka| 0)
                      (SEQ
                       (LETT |z|
                             (SPADCALL
                              (LETT |zz| (SPADCALL |l| (QREFELT $ 63)) . #2#)
                              (QREFELT $ 65))
                             . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |z| 0)
                          (COND
                           ((EQUAL (QCDR |z|) |x|)
                            (SEQ
                             (LETT |u|
                                   (|INTEF;droponex| (|SPADfirst| |l|) |a|
                                    (QCDR |ka|) |zz| $)
                                   . #2#)
                             (EXIT
                              (COND
                               ((QEQCAR |u| 0)
                                (PROGN
                                 (LETT #1# (SPADCALL (QCDR |u|) (QREFELT $ 66))
                                       . #2#)
                                 (GO #1#))))))))))))))))))))))
        (COND
         ((SPADCALL
           (LETT |da|
                 (SPADCALL
                  (LETT |a|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 68)) (QREFELT $ 69))
                        . #2#)
                  |x| (QREFELT $ 19))
                 . #2#)
           (|spadConstant| $ 70) (QREFELT $ 71))
          (COND
           ((SPADCALL
             (SPADCALL
              (LETT |c|
                    (SPADCALL
                     (SPADCALL (SPADCALL |f| (QREFELT $ 72)) (QREFELT $ 69))
                     |da| (QREFELT $ 73))
                    . #2#)
              |x| (QREFELT $ 19))
             (QREFELT $ 74))
            (EXIT
             (SPADCALL
              (SPADCALL |c| (SPADCALL |a| (QREFELT $ 75)) (QREFELT $ 76))
              (QREFELT $ 66)))))))
        (EXIT
         (SPADCALL (|spadConstant| $ 70) NIL
                   (LIST (CONS |f| (SPADCALL |x| (QREFELT $ 78))))
                   (QREFELT $ 83)))))
      #1# (EXIT #1#))))) 

(DEFUN |INTEF;droponex| (|f| |a| |ka| |x| $)
  (PROG (|u| |z| |arg| |op| |k| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 61)) . #1=(|INTEF;droponex|))
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ((SPADCALL
                   (LETT |op|
                         (SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 15))
                         . #1#)
                   '|%diff| (QREFELT $ 84))
                  (SEQ
                   (LETT |z|
                         (SPADCALL
                          (LETT |arg| (SPADCALL |k| (QREFELT $ 18)) . #1#)
                          (QREFELT $ 63))
                         . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |z| |a| (QREFELT $ 85))
                      (CONS 0
                            (SPADCALL |op|
                                      (LIST (|SPADfirst| |arg|)
                                            (SPADCALL |arg| (QREFELT $ 62))
                                            |x|)
                                      (QREFELT $ 87))))
                     (#2='T
                      (SEQ
                       (LETT |u|
                             (|INTEF;droponex| (|SPADfirst| |arg|) |a| |ka| |x|
                              $)
                             . #1#)
                       (EXIT
                        (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                              (#2#
                               (CONS 0
                                     (SPADCALL |op|
                                               (LIST (QCDR |u|)
                                                     (SPADCALL |arg|
                                                               (QREFELT $ 62))
                                                     |z|)
                                               (QREFELT $ 87))))))))))))
                 (#2#
                  (CONS 0
                        (SPADCALL |f| (LIST |ka|) (LIST |x|)
                                  (QREFELT $ 89)))))))))) 

(DEFUN |INTEF;unklimint| (|f| |x| |lu| $)
  (PROG (#1=#:G244 #2=#:G246 |c| #3=#:G247 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |u| NIL . #4=(|INTEF;unklimint|)) (LETT #3# |lu| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |u| (|spadConstant| $ 70) (QREFELT $ 71))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (LETT |c|
                             (SPADCALL (SPADCALL |f| |u| (QREFELT $ 76))
                                       (SPADCALL |u| |x| (QREFELT $ 19))
                                       (QREFELT $ 73))
                             . #4#)
                       |x| (QREFELT $ 19))
                      (QREFELT $ 74))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2#
                                   (CONS 0
                                         (CONS (|spadConstant| $ 70)
                                               (LIST (CONS |c| |u|))))
                                   . #4#)
                             (GO #2#))
                            . #4#)
                      (GO #1#))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |INTEF;unkextint| (|f| |x| |g| $)
  (PROG (|c| |g'|)
    (RETURN
     (COND
      ((OR
        (SPADCALL
         (LETT |g'| (SPADCALL |g| |x| (QREFELT $ 19)) . #1=(|INTEF;unkextint|))
         (QREFELT $ 74))
        (NULL
         (SPADCALL
          (SPADCALL (LETT |c| (SPADCALL |f| |g'| (QREFELT $ 73)) . #1#) |x|
                    (QREFELT $ 19))
          (QREFELT $ 74))))
       (CONS 1 "failed"))
      ('T (CONS 0 (CONS (|spadConstant| $ 70) |c|))))))) 

(DEFUN |INTEF;isx?| (|f| |x| $)
  (PROG (|r| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 61)) . #1=(|INTEF;isx?|))
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 (#2='T
                  (SEQ (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 90)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) 'NIL)
                              (#2# (EQUAL (QCDR |r|) |x|)))))))))))) 

(DEFUN |INTEF;alg_split_root0| (|f| |r| |n| $)
  (PROG (#1=#:G272 |i| #2=#:G271 |q| |f1| |f0| |ef|)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 2)
        (SEQ
         (LETT |ef|
               (SPADCALL |f| |r|
                         (SPADCALL (SPADCALL |r| (QREFELT $ 91))
                                   (QREFELT $ 92))
                         (QREFELT $ 93))
               . #3=(|INTEF;alg_split_root0|))
         (LETT |f0|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 94))
                         (SPADCALL 2 (QREFELT $ 95)) (QREFELT $ 73))
               . #3#)
         (LETT |f1|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 96))
                         (SPADCALL 2 (QREFELT $ 95)) (QREFELT $ 73))
               . #3#)
         (EXIT
          (COND
           ((SPADCALL |r| (SPADCALL |f0| (QREFELT $ 97)) (QREFELT $ 99))
            (SEQ (SPADCALL (SPADCALL |f0| (QREFELT $ 101)) (QREFELT $ 103))
                 (EXIT (|error| "alg_split_root0: roots did not cancel 1"))))
           (#4='T
            (SEQ
             (LETT |f1|
                   (SPADCALL |f1| (SPADCALL |r| (QREFELT $ 91)) (QREFELT $ 73))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f1| (QREFELT $ 97)) (QREFELT $ 99))
                (SEQ (SPADCALL (SPADCALL |f1| (QREFELT $ 101)) (QREFELT $ 103))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
               (#4# (LIST |f0| |f1|))))))))))
       (#4#
        (SEQ
         (LETT |q|
               (SPADCALL |f| |r| (SPADCALL |r| (QREFELT $ 105))
                         (QREFELT $ 106))
               . #3#)
         (EXIT
          (PROGN
           (LETT #2# NIL . #3#)
           (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 109)) #2#)
                        . #3#)))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |INTEF;alg_split_roots| (|f| |r1| |r2| $)
  (PROG (|res| |nrr| |nr| |bb2| #1=#:G275 |bb1| |nn| |np2| |nn2| |g2| #2=#:G286
         |f2| #3=#:G287 |pow2| |np1| |nn1| |g1| |l2| #4=#:G284 |f1| #5=#:G285
         |pow1| |rop| |l1| |b2| |n2| |b1| |n1| |a2| |a1|)
    (RETURN
     (SEQ
      (LETT |a1| (SPADCALL |r1| (QREFELT $ 18)) . #6=(|INTEF;alg_split_roots|))
      (LETT |a2| (SPADCALL |r2| (QREFELT $ 18)) . #6#)
      (LETT |n1| (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 110)) (QREFELT $ 111))
            . #6#)
      (LETT |b1| (SPADCALL |a1| 1 (QREFELT $ 110)) . #6#)
      (LETT |n2| (SPADCALL (SPADCALL |a2| 2 (QREFELT $ 110)) (QREFELT $ 111))
            . #6#)
      (LETT |b2| (SPADCALL |a2| 1 (QREFELT $ 110)) . #6#)
      (LETT |l1| (|INTEF;alg_split_root0| |f| |r1| |n1| $) . #6#)
      (LETT |res| NIL . #6#) (LETT |rop| (SPADCALL |r1| (QREFELT $ 15)) . #6#)
      (SEQ (LETT |pow1| 0 . #6#) (LETT #5# (- |n1| 1) . #6#)
           (LETT |f1| NIL . #6#) (LETT #4# |l1| . #6#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |f1| (CAR #4#) . #6#) NIL)
                 (|greater_SI| |pow1| #5#))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |f1| (|spadConstant| $ 70) (QREFELT $ 85)) "iterate")
              ('T
               (SEQ
                (LETT |l2| (|INTEF;alg_split_root0| |f1| |r2| |n2| $) . #6#)
                (LETT |g1| (GCD |n1| |pow1|) . #6#)
                (LETT |nn1|
                      (PROG2
                          (LETT #1# (SPADCALL |n1| |g1| (QREFELT $ 113)) . #6#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                      . #6#)
                (LETT |np1|
                      (PROG2
                          (LETT #1# (SPADCALL |pow1| |g1| (QREFELT $ 113))
                                . #6#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                      . #6#)
                (EXIT
                 (SEQ (LETT |pow2| 0 . #6#) (LETT #3# (- |n2| 1) . #6#)
                      (LETT |f2| NIL . #6#) (LETT #2# |l2| . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f2| (CAR #2#) . #6#) NIL)
                            (|greater_SI| |pow2| #3#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |f2| (|spadConstant| $ 70) (QREFELT $ 85))
                          "iterate")
                         ('T
                          (SEQ (LETT |g2| (GCD |n2| |pow2|) . #6#)
                               (LETT |nn2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |n2| |g2|
                                                         (QREFELT $ 113))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |np2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |pow2| |g2|
                                                         (QREFELT $ 113))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |nn|
                                     (SPADCALL |nn1| |nn2| (QREFELT $ 114))
                                     . #6#)
                               (LETT |bb1|
                                     (SPADCALL |b1|
                                               (* |np1|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn1|
                                                                      (QREFELT
                                                                       $ 113))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 115))
                                     . #6#)
                               (LETT |bb2|
                                     (SPADCALL |b2|
                                               (* |np2|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn2|
                                                                      (QREFELT
                                                                       $ 113))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 115))
                                     . #6#)
                               (LETT |nr|
                                     (SPADCALL |rop|
                                               (LIST
                                                (SPADCALL |bb1| |bb2|
                                                          (QREFELT $ 76))
                                                (SPADCALL |nn| (QREFELT $ 95)))
                                               (QREFELT $ 116))
                                     . #6#)
                               (LETT |nrr|
                                     (COND
                                      ((SPADCALL (+ |pow1| |pow2|) 0
                                                 (QREFELT $ 117))
                                       |nr|)
                                      ('T (|spadConstant| $ 108)))
                                     . #6#)
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (VECTOR
                                        (SPADCALL |f2| |nrr| (QREFELT $ 76))
                                        |nrr| |pow1| |pow2|)
                                       |res|)
                                      . #6#)))))))
                      (LETT #2#
                            (PROG1 (CDR #2#)
                              (LETT |pow2| (|inc_SI| |pow2|) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))))))
           (LETT #4# (PROG1 (CDR #4#) (LETT |pow1| (|inc_SI| |pow1|) . #6#))
                 . #6#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |INTEF;alglfint| (|f| |k| |l| |x| $)
  (PROG (|y| |rec| |res| |ir1| |oroot| #1=#:G308 |al| |kx| |xf|)
    (RETURN
     (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 78)) . #2=(|INTEF;alglfint|))
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL
               (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 119)) . #2#)
               (QREFELT $ 90))
              0)
             (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 121)) |xf| $))
            ((SPADCALL |kx| '|exp| (QREFELT $ 13))
             (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
            ((|INTEF;prim?| |kx| |x| $)
             (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
            ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                       (QREFELT $ 16))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                          (QREFELT $ 84))
                (COND
                 ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                            (QREFELT $ 84))
                  (COND
                   ((NULL
                     (SPADCALL |kx|
                               (SPADCALL (SPADCALL |k| (QREFELT $ 91))
                                         (QREFELT $ 122))
                               (QREFELT $ 99)))
                    (EXIT
                     (SEQ
                      (LETT |al| (|INTEF;alg_split_roots| |f| |k| |kx| $)
                            . #2#)
                      (LETT |res| (|spadConstant| $ 123) . #2#)
                      (SEQ (LETT |rec| NIL . #2#) (LETT #1# |al| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |ir1|
                                  (SPADCALL (QVELT |rec| 0) |x| (QREFELT $ 58))
                                  . #2#)
                            (COND
                             ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3)) 0
                                        (QREFELT $ 117))
                              (SEQ
                               (LETT |oroot|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 91))
                                                (QVELT |rec| 2)
                                                (QREFELT $ 115))
                                      (SPADCALL (SPADCALL |kx| (QREFELT $ 91))
                                                (QVELT |rec| 3)
                                                (QREFELT $ 115))
                                      (QREFELT $ 76))
                                     . #2#)
                               (EXIT
                                (LETT |ir1|
                                      (SPADCALL
                                       (CONS #'|INTEF;alglfint!0|
                                             (VECTOR |oroot| $ |rec|))
                                       |ir1| (QREFELT $ 126))
                                      . #2#)))))
                            (EXIT
                             (LETT |res| (SPADCALL |res| |ir1| (QREFELT $ 59))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))))
              (LETT |rec|
                    (SPADCALL (SPADCALL |kx| (QREFELT $ 91))
                              (SPADCALL |k| (QREFELT $ 91)) (QREFELT $ 129))
                    . #2#)
              (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 130)) . #2#)
              (EXIT
               (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                         (SPADCALL
                          (SPADCALL |f| (LIST |kx| |k|)
                                    (LIST
                                     (SPADCALL (QVELT |rec| 1) |y|
                                               (QREFELT $ 131))
                                     (SPADCALL (QVELT |rec| 2) |y|
                                               (QREFELT $ 131)))
                                    (QREFELT $ 89))
                          |x| (QREFELT $ 58))
                         (QREFELT $ 126)))))
            ('T (|INTEF;unknownint| |f| |x| $)))))))) 

(DEFUN |INTEF;alglfint!1| (|x1| $$)
  (PROG (|y| $ |rec|)
    (LETT |y| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |rec| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 124)) (QVELT |rec| 0)
                (QREFELT $ 93)))))) 

(DEFUN |INTEF;alglfint!0| (|x1| $$)
  (PROG (|rec| $ |oroot|)
    (LETT |rec| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |oroot| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL (QVELT |rec| 1) (QREFELT $ 124)) |oroot|
                (QREFELT $ 93)))))) 

(DEFUN |INTEF;alglfextint| (|f| |k| |l| |x| |g| $)
  (PROG (|r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 119))
                . #1=(|INTEF;alglfextint|))
          (QREFELT $ 90))
         0)
        (SPADCALL |f| |kx| |k| |g| (QREFELT $ 132)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 91))
                         (SPADCALL |k| (QREFELT $ 91)) (QREFELT $ 129))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 130)) . #1#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 131))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 131)))
               . #1#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 89))
                         |x|
                         (SPADCALL |g| (LIST |kx| |k|) |lrhs| (QREFELT $ 89))
                         (QREFELT $ 38))
               . #1#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 124)) . #1#)
                      (LETT |r| (QCDR |u|) . #1#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 93))
                              (SPADCALL (QCDR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 93)))))))))))
       ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
            (SPADCALL |kx| '|log| (QREFELT $ 13)))
        (|error| "failed - cannot handle that integrand"))
       ('T (|INTEF;unkextint| |f| |x| |g| $))))))) 

(DEFUN |INTEF;alglflimint| (|f| |k| |l| |x| |lu| $)
  (PROG (#1=#:G345 |rc| #2=#:G344 |r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 119))
                . #3=(|INTEF;alglflimint|))
          (QREFELT $ 90))
         0)
        (SPADCALL |f| |kx| |k| |lu| (QREFELT $ 133)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 91))
                         (SPADCALL |k| (QREFELT $ 91)) (QREFELT $ 129))
               . #3#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 130)) . #3#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 131))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 131)))
               . #3#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 89))
                         |x|
                         (SPADCALL
                          (CONS #'|INTEF;alglflimint!0|
                                (VECTOR $ |lrhs| |k| |kx|))
                          |lu| (QREFELT $ 134))
                         (QREFELT $ 35))
               . #3#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 124)) . #3#)
                      (LETT |r| (QCDR |u|) . #3#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 93))
                              (PROGN
                               (LETT #2# NIL . #3#)
                               (SEQ (LETT |rc| NIL . #3#)
                                    (LETT #1# (QCDR |r|) . #3#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |rc| (CAR #1#) . #3#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (CONS
                                              (SPADCALL (QCAR |rc|) |ky|
                                                        (QVELT |rec| 0)
                                                        (QREFELT $ 93))
                                              (SPADCALL (QCDR |rc|) |ky|
                                                        (QVELT |rec| 0)
                                                        (QREFELT $ 93)))
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))))))))))
       ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
            (SPADCALL |kx| '|log| (QREFELT $ 13)))
        (|error| "failed - cannot handle that integrand"))
       ('T (|INTEF;unklimint| |f| |x| |lu| $))))))) 

(DEFUN |INTEF;alglflimint!0| (|x1| $$)
  (PROG (|kx| |k| |lrhs| $)
    (LETT |kx| (QREFELT $$ 3) . #1=(|INTEF;alglflimint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lrhs| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| (LIST |kx| |k|) |lrhs| (QREFELT $ 89)))))) 

(DEFUN |INTEF;lfintegrate;FSIr;13| (|f| |x| $)
  (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $) (ELT $ 139)
            (QREFELT $ 142))) 

(DEFUN |INTEF;lfintegrate;FSIr;14| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;15| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;16| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate0| (|f| |x| $)
  (PROG (|k| |l| |xf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 74)) (|spadConstant| $ 123))
            (#1='T
             (SEQ
              (LETT |xf| (SPADCALL |x| (QREFELT $ 78))
                    . #2=(|INTEF;lfintegrate0|))
              (EXIT
               (COND
                ((NULL
                  (LETT |l|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 97)) |x|
                                  (QREFELT $ 143))
                        . #2#))
                 (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 76)) (QREFELT $ 66)))
                ((QEQCAR
                  (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 144)) . #2#)
                            (QREFELT $ 90))
                  0)
                 (SPADCALL (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                           (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                                     (QREFELT $ 146))
                           (QREFELT $ 57)))
                ((SPADCALL |k| '|tan| (QREFELT $ 13))
                 (|INTEF;addx| (|INTEF;tanint| |f| |x| |k| $) |xf| $))
                ((SPADCALL |k| '|exp| (QREFELT $ 13))
                 (|INTEF;addx| (|INTEF;expint| |f| |x| |k| $) |xf| $))
                ((|INTEF;prim?| |k| |x| $)
                 (|INTEF;addx| (|INTEF;primint| |f| |x| |k| $) |xf| $))
                ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                           (QREFELT $ 16))
                 (|INTEF;alglfint| |f| |k| |l| |x| $))
                (#1# (|INTEF;unknownint| |f| |x| $))))))))))) 

(DEFUN |INTEF;lfintegrate0!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfintegrate0|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;addx| (|i| |x| $)
  (PROG (#1=#:G379 |ne| #2=#:G378)
    (RETURN
     (SEQ
      (COND ((SPADCALL |i| (QREFELT $ 147)) |i|)
            ('T
             (SPADCALL (SPADCALL |i| (QREFELT $ 148))
                       (SPADCALL |i| (QREFELT $ 149))
                       (PROGN
                        (LETT #2# NIL . #3=(|INTEF;addx|))
                        (SEQ (LETT |ne| NIL . #3#)
                             (LETT #1# (SPADCALL |i| (QREFELT $ 150)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ne| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2# (CONS (CONS (QCAR |ne|) |x|) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 83)))))))) 

(DEFUN |INTEF;tryChangeVar| (|f| |t| |x| $)
  (PROG (|g| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 151)) . #1=(|INTEF;tryChangeVar|))
          (LETT |g|
                (SPADCALL
                 (SPADCALL |f|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 91)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 73))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 78)))
                 (QREFELT $ 152))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |g| |x| (QREFELT $ 153))
             (CONS 0
                   (SPADCALL (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                             (SPADCALL |g| |z| (QREFELT $ 58))
                             (QREFELT $ 126))))
            ('T (CONS 1 "failed")))))))) 

(DEFUN |INTEF;tryChangeVar!0| (|x1| $$)
  (PROG (|z| $ |t|)
    (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |t| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 154))
                (SPADCALL |t| (QREFELT $ 91)) (QREFELT $ 93)))))) 

(DEFUN |INTEF;algexpint| (|f| |t| |y| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $) |INTEF;algexpint|)
          (EXIT
           (COND ((QEQCAR |u| 0) (QCDR |u|))
                 ('T
                  (SPADCALL |f| |t| |y|
                            (CONS #'|INTEF;algexpint!1| (VECTOR |t| |x| $))
                            (QREFELT $ 158))))))))) 

(DEFUN |INTEF;algexpint!1| (|x1| $$)
  (PROG ($ |x| |t|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algexpint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |t| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;algexpint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |t| (QREFELT $ 18)) (QREFELT $ 155))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 156) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;algexpint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;algprimint| (|f| |t| |y| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $) |INTEF;algprimint|)
          (EXIT
           (COND ((QEQCAR |u| 0) (QCDR |u|))
                 ('T
                  (SPADCALL |f| |t| |y|
                            (CONS #'|INTEF;algprimint!1| (VECTOR |t| |x| $))
                            (QREFELT $ 158))))))))) 

(DEFUN |INTEF;algprimint!1| (|x1| $$)
  (PROG ($ |x| |t|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;algprimint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |t| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;algprimint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |t| (QREFELT $ 91)) |x| (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;algprimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;lfextendedint;FSFU;22| (|f| |x| |g| $)
  (PROG (|g1| |l1| |k| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (SPADCALL (SPADCALL |f| (QREFELT $ 97)) |x| (QREFELT $ 143))
               . #1=(|INTEF;lfextendedint;FSFU;22|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 78)) |f| (QREFELT $ 76))
                    (|spadConstant| $ 70))))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 144)) . #1#)
                   (QREFELT $ 90))
         0)
        (SEQ
         (LETT |g1|
               (COND
                ((OR
                  (NULL
                   (LETT |l1|
                         (SPADCALL (SPADCALL |g| (QREFELT $ 97)) |x|
                                   (QREFELT $ 143))
                         . #1#))
                  (NULL
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 144)) |k|
                             (QREFELT $ 159))))
                 (|spadConstant| $ 70))
                ('T |g|))
               . #1#)
         (EXIT
          (SPADCALL (CONS #'|INTEF;lfextendedint;FSFU;22!0| (VECTOR $ |k|))
                    (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                              (SPADCALL |g1| |k| (QREFELT $ 22))
                              (QREFELT $ 162))
                    (QREFELT $ 163)))))
       ((SPADCALL |k| '|exp| (QREFELT $ 13))
        (|INTEF;expextint| |f| |x| |k| |g| $))
       ((|INTEF;prim?| |k| |x| $) (|INTEF;primextint| |f| |x| |k| |g| $))
       ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (|INTEF;alglfextint| |f| |k| |l| |x| |g| $))
       ('T (|INTEF;unkextint| |f| |x| |g| $))))))) 

(DEFUN |INTEF;lfextendedint;FSFU;22!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfextendedint;FSFU;22|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;lflimitedint;FSLU;23| (|f| |x| |lu| $)
  (PROG (#1=#:G448 |u| #2=#:G447 |k| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (SPADCALL (SPADCALL |f| (QREFELT $ 97)) |x| (QREFELT $ 143))
               . #3=(|INTEF;lflimitedint;FSLU;23|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 78)) |f| (QREFELT $ 76))
                    NIL)))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 144)) . #3#)
                   (QREFELT $ 90))
         0)
        (SPADCALL (CONS #'|INTEF;lflimitedint;FSLU;23!0| (VECTOR $ |k|))
                  (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                            (PROGN
                             (LETT #2# NIL . #3#)
                             (SEQ (LETT |u| NIL . #3#) (LETT #1# |lu| . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |u| |k| (QREFELT $ 22))
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT $ 168))
                  (QREFELT $ 169)))
       ((SPADCALL |k| '|exp| (QREFELT $ 13))
        (|INTEF;explimint| |f| |x| |k| |lu| $))
       ((|INTEF;prim?| |k| |x| $) (|INTEF;primlimint| |f| |x| |k| |lu| $))
       ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (|INTEF;alglflimint| |f| |k| |l| |x| |lu| $))
       ('T (|INTEF;unklimint| |f| |x| |lu| $))))))) 

(DEFUN |INTEF;lflimitedint;FSLU;23!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lflimitedint;FSLU;23|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;lfinfieldint;FSU;24| (|f| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |x| (|spadConstant| $ 70) (QREFELT $ 38))
            |INTEF;lfinfieldint;FSU;24|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCAR (QCDR |u|)))))))))) 

(DEFUN |INTEF;primextint| (|f| |x| |k| |g| $)
  (PROG (|u2| |u1| |lk| #1=#:G480 |a| #2=#:G479)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primextint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 122)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 172))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 143))
            . #3#)
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primextint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;primextint!2| (VECTOR $ |lk| |k| |x|))
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 177))
            . #3#)
      (EXIT
       (COND ((QEQCAR |u1| 2) (CONS 1 "failed"))
             ((QEQCAR |u1| 1)
              (CONS 0
                    (CONS (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 52))
                          (SPADCALL (QCDR (QCDR |u1|)) |k| (QREFELT $ 52)))))
             (#4#
              (SEQ
               (LETT |u2| (SPADCALL (QCDR (QCDR |u1|)) |x| |g| (QREFELT $ 38))
                     . #3#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                      (#4#
                       (CONS 0
                             (CONS
                              (SPADCALL
                               (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 52))
                               (QCAR (QCDR |u2|)) (QREFELT $ 94))
                              (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTEF;primextint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primextint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 173)))))) 

(DEFUN |INTEF;primextint!1| (|x1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primextint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;primextint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 91)) |x| (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;primextint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;expextint| (|f| |x| |k| |g| $)
  (PROG (|u2| |u1|)
    (RETURN
     (SEQ
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;expextint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;expextint!4| (VECTOR |x| $ |k|))
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 182))
            . #1=(|INTEF;expextint|))
      (EXIT
       (COND ((QEQCAR |u1| 2) (CONS 1 "failed"))
             ((QEQCAR |u1| 1)
              (CONS 0
                    (CONS (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 52))
                          (SPADCALL (QCDR (QCDR |u1|)) |k| (QREFELT $ 52)))))
             (#2='T
              (SEQ
               (LETT |u2| (SPADCALL (QCDR (QCDR |u1|)) |x| |g| (QREFELT $ 38))
                     . #1#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (CONS
                              (SPADCALL
                               (SPADCALL (QCAR (QCDR |u1|)) |k| (QREFELT $ 52))
                               (QCAR (QCDR |u2|)) (QREFELT $ 94))
                              (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTEF;expextint!4| (|x3| |x4| $$)
  (PROG (|k| $ |x|)
    (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;expextint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x3|
                   (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 155))
                   |x4| |x| (CONS #'|INTEF;expextint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;expextint!3| (VECTOR $ |x|))
                   (QREFELT $ 180)))))))) 

(DEFUN |INTEF;expextint!3| (|x7| |x8| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x7| |x| |x8| (QREFELT $ 38)))))) 

(DEFUN |INTEF;expextint!2| (|x5| |x6| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 35)))))) 

(DEFUN |INTEF;expextint!1| (|x1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;expextint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;expextint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 155))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 156) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expextint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;denint_dummy| (|f| $)
  (VECTOR (|spadConstant| $ 183) |f| (|spadConstant| $ 184))) 

(DEFUN |INTEF;primint| (|f| |x| |k| $)
  (PROG (|r1| |denint| |lk| #1=#:G556 |a| #2=#:G555)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 122)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 172))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 143))
            . #3#)
      (LETT |denint|
            (COND
             ((SPADCALL |k| '|log| (QREFELT $ 13))
              (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 190) |x| |k|)))
             (#4# (CONS (|function| |INTEF;denint_dummy|) $)))
            . #3#)
      (LETT |r1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primint!2| (VECTOR |k| |x| $)) |denint|
                      (CONS #'|INTEF;primint!3| (VECTOR $ |lk| |k| |x|))
                      (QREFELT $ 195))
            . #3#)
      (EXIT
       (SPADCALL
        (SPADCALL (CONS #'|INTEF;primint!4| (VECTOR $ |k|)) (QCAR |r1|)
                  (QREFELT $ 57))
        (SPADCALL (QCDR |r1|) |x| (QREFELT $ 58)) (QREFELT $ 59))))))) 

(DEFUN |INTEF;primint!4| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;primint|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;primint!3| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 173)))))) 

(DEFUN |INTEF;primint!2| (|x1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;primint!1| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 91)) |x| (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;primint!1| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;primint!0| (|rf| $$)
  (PROG (|k| |x| |denint_li|)
    (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;primint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |denint_li| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_li|))))) 

(DEFUN |INTEF;lfextlimint;FSKLU;29| (|f| |x| |k| |lk| $)
  (PROG (#1=#:G575 #2=#:G574 #3=#:G576 #4=#:G586 |c| |cf| |u2| #5=#:G585 |u|
         #6=#:G584 |lg| #7=#:G583 |kk| #8=#:G582 |twr| #9=#:G580 |u1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u1|
               (SPADCALL |f| |x|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 91)) |x|
                                   (QREFELT $ 19))
                         (QREFELT $ 38))
               . #10=(|INTEF;lfextlimint;FSKLU;29|))
         (EXIT
          (COND
           ((NULL (QEQCAR |u1| 1)) (PROGN (LETT #9# |u1| . #10#) (GO #9#))))))
        (LETT |twr| (SPADCALL |f| (QREFELT $ 122)) . #10#)
        (EXIT
         (COND
          ((OR
            (NULL
             (LETT |lg|
                   (PROGN
                    (LETT #8# NIL . #10#)
                    (SEQ (LETT |kk| NIL . #10#) (LETT #7# |lk| . #10#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |kk| (CAR #7#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND ((SPADCALL |kk| |twr| (QREFELT $ 99)) 'NIL)
                                   (#11='T 'T))
                             (LETT #8# (CONS |kk| #8#) . #10#)))))
                         (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   . #10#))
            (NULL (SPADCALL |k| '|log| (QREFELT $ 13))))
           (CONS 1 "failed"))
          ('T
           (SEQ
            (LETT |u2|
                  (SPADCALL |f| |x|
                            (PROGN
                             (LETT #6# NIL . #10#)
                             (SEQ (LETT |u| NIL . #10#)
                                  (LETT #5#
                                        (SPADCALL |lg| (LIST |k|)
                                                  (QREFELT $ 196))
                                        . #10#)
                                  G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN
                                         (LETT |u| (CAR #5#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (|SPADfirst|
                                            (SPADCALL |u| (QREFELT $ 18)))
                                           #6#)
                                          . #10#)))
                                  (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                  (EXIT (NREVERSE #6#))))
                            (QREFELT $ 35))
                  . #10#)
            (EXIT
             (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                   (#11#
                    (SEQ
                     (LETT |cf|
                           (|INTEF;cfind|
                            (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
                            (QCDR (QCDR |u2|)) $)
                           . #10#)
                     (EXIT
                      (CONS 0
                            (CONS
                             (SPADCALL
                              (SPADCALL (QCAR (QCDR |u2|))
                                        (SPADCALL |cf|
                                                  (SPADCALL |k| (QREFELT $ 91))
                                                  (QREFELT $ 76))
                                        (QREFELT $ 96))
                              (PROGN
                               (LETT #1# NIL . #10#)
                               (SEQ (LETT |c| NIL . #10#)
                                    (LETT #4# (QCDR (QCDR |u2|)) . #10#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |c| (CAR #4#) . #10#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (SPADCALL (QCAR |c|)
                                                       (SPADCALL (QCDR |c|)
                                                                 (QREFELT $
                                                                          75))
                                                       (QREFELT $ 76))
                                             . #10#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 94))
                                               . #10#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #10#)
                                          (LETT #1# 'T . #10#)))))))
                                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#11# (|spadConstant| $ 70))))
                              (QREFELT $ 94))
                             |cf|)))))))))))))
      #9# (EXIT #9#))))) 

(DEFUN |INTEF;cfind| (|f| |l| $)
  (PROG (#1=#:G589 #2=#:G591 #3=#:G592 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |u| NIL . #4=(|INTEF;cfind|)) (LETT #3# |l| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |f| (QCDR |u|) (QREFELT $ 85))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (QCAR |u|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|spadConstant| $ 70))))
      #2# (EXIT #2#))))) 

(DEFUN |INTEF;expint| (|f| |x| |k| $)
  (PROG (|r1| |eta|)
    (RETURN
     (SEQ
      (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
            . #1=(|INTEF;expint|))
      (LETT |r1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;expint!1| (VECTOR |eta| |x| $))
                      (CONS #'|INTEF;expint!2|
                            (VECTOR (QREFELT $ 192) |x| |k|))
                      (CONS #'|INTEF;expint!5| (VECTOR $ |x| |eta|))
                      (QREFELT $ 197))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (CONS #'|INTEF;expint!6| (VECTOR $ |k|)) (QCAR |r1|)
                  (QREFELT $ 57))
        (SPADCALL (QCDR |r1|) |x| (QREFELT $ 58)) (QREFELT $ 59))))))) 

(DEFUN |INTEF;expint!6| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;expint|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;expint!5| (|x3| |x4| $$)
  (PROG (|eta| |x| $)
    (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;expint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x3| |eta| |x4| |x| (CONS #'|INTEF;expint!3| (VECTOR $ |x|))
                   (CONS #'|INTEF;expint!4| (VECTOR $ |x|))
                   (QREFELT $ 180)))))))) 

(DEFUN |INTEF;expint!4| (|x7| |x8| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x7| |x| |x8| (QREFELT $ 38)))))) 

(DEFUN |INTEF;expint!3| (|x5| |x6| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 35)))))) 

(DEFUN |INTEF;expint!2| (|rf| $$)
  (PROG (|k| |x| |denint_poly|)
    (LETT |k| (QREFELT $$ 2) . #1=(|INTEF;expint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |denint_poly| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |rf| |k| |x| |denint_poly|))))) 

(DEFUN |INTEF;expint!1| (|x1| $$)
  (PROG ($ |x| |eta|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;expint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |eta| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;expint!0| (VECTOR $ |x|))
                   (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                             (|spadConstant| $ 156) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;primlimint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G646 |lg| #2=#:G645 |u1| #3=#:G644 |u| #4=#:G643 |lk|
         #5=#:G642 |a| #6=#:G641)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #6# NIL . #7=(|INTEF;primlimint|))
              (SEQ (LETT |a| NIL . #7#)
                   (LETT #5# (SPADCALL |f| (QREFELT $ 122)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 172))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#8='T 'NIL))
                       (LETT #6# (CONS |a| #6#) . #7#)))))
                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #6#))))
             |x| (QREFELT $ 143))
            . #7#)
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primlimint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;primlimint!2| (VECTOR $ |lk| |k| |x|))
                      (PROGN
                       (LETT #4# NIL . #7#)
                       (SEQ (LETT |u| NIL . #7#) (LETT #3# |lu| . #7#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |u| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |u| |k| (QREFELT $ 22))
                                          #4#)
                                    . #7#)))
                            (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 200))
            . #7#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
             (#8#
              (SEQ
               (LETT |l|
                     (PROGN
                      (LETT #2# NIL . #7#)
                      (SEQ (LETT |lg| NIL . #7#)
                           (LETT #1# (QCDR (QCAR (QCDR |u1|))) . #7#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |lg| (CAR #1#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS
                                     (SPADCALL (QCAR |lg|) |k| (QREFELT $ 52))
                                     (SPADCALL (QCDR |lg|) |k| (QREFELT $ 52)))
                                    #2#)
                                   . #7#)))
                           (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #7#)
               (LETT |u2| (SPADCALL (QCDR (QCDR |u1|)) |x| |lu| (QREFELT $ 35))
                     . #7#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                      (#8#
                       (CONS 0
                             (CONS
                              (SPADCALL
                               (SPADCALL (QCAR (QCAR (QCDR |u1|))) |k|
                                         (QREFELT $ 52))
                               (QCAR (QCDR |u2|)) (QREFELT $ 94))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 202))))))))))))))) 

(DEFUN |INTEF;primlimint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primlimint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 173)))))) 

(DEFUN |INTEF;primlimint!1| (|x1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primlimint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;primlimint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 91)) |x| (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;primlimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;explimint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G676 |lg| #2=#:G675 |u1| #3=#:G674 |u| #4=#:G673 |eta|)
    (RETURN
     (SEQ
      (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
            . #5=(|INTEF;explimint|))
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;explimint!1| (VECTOR |eta| |x| $))
                      (CONS #'|INTEF;explimint!4| (VECTOR $ |x| |eta|))
                      (PROGN
                       (LETT #4# NIL . #5#)
                       (SEQ (LETT |u| NIL . #5#) (LETT #3# |lu| . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |u| |k| (QREFELT $ 22))
                                          #4#)
                                    . #5#)))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 203))
            . #5#)
      (EXIT
       (COND ((QEQCAR |u1| 1) (CONS 1 "failed"))
             (#6='T
              (SEQ
               (LETT |l|
                     (PROGN
                      (LETT #2# NIL . #5#)
                      (SEQ (LETT |lg| NIL . #5#)
                           (LETT #1# (QCDR (QCAR (QCDR |u1|))) . #5#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |lg| (CAR #1#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS
                                     (SPADCALL (QCAR |lg|) |k| (QREFELT $ 52))
                                     (SPADCALL (QCDR |lg|) |k| (QREFELT $ 52)))
                                    #2#)
                                   . #5#)))
                           (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #5#)
               (LETT |u2| (SPADCALL (QCDR (QCDR |u1|)) |x| |lu| (QREFELT $ 35))
                     . #5#)
               (EXIT
                (COND ((QEQCAR |u2| 1) (CONS 1 "failed"))
                      (#6#
                       (CONS 0
                             (CONS
                              (SPADCALL
                               (SPADCALL (QCAR (QCAR (QCDR |u1|))) |k|
                                         (QREFELT $ 52))
                               (QCAR (QCDR |u2|)) (QREFELT $ 94))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 202))))))))))))))) 

(DEFUN |INTEF;explimint!4| (|x1| |x2| $$)
  (PROG (|eta| |x| $)
    (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;explimint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| |eta| |x2| |x|
                   (CONS #'|INTEF;explimint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;explimint!3| (VECTOR $ |x|))
                   (QREFELT $ 180)))))))) 

(DEFUN |INTEF;explimint!3| (|x5| |x6| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 38)))))) 

(DEFUN |INTEF;explimint!2| (|x3| |x4| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x3| |x| |x4| (QREFELT $ 35)))))) 

(DEFUN |INTEF;explimint!1| (|x1| $$)
  (PROG ($ |x| |eta|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;explimint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |eta| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;explimint!0| (VECTOR $ |x|))
                   (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                             (|spadConstant| $ 156) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;explimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G677)
  (PROG ()
    (RETURN
     (PROG (#2=#:G678)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryIntegration|)
                                           '|domainEqualList|)
                . #3=(|ElementaryIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryIntegration|))))))))))) 

(DEFUN |ElementaryIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryIntegration|))
       (LETT DV$2 (|devaluate| |#2|) . #1#)
       (LETT |dv$| (LIST '|ElementaryIntegration| DV$1 DV$2) . #1#)
       (LETT $ (GETREFV 204) . #1#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
       (|haddProp| |$ConstructorCache| '|ElementaryIntegration|
                   (LIST DV$1 DV$2) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 8 '|prim|)
       (QSETREFV $ 9 '|%alg|)
       (COND
        ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
         (COND
          ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
           (PROGN
            (QSETREFV $ 135
                      (COND
                       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
                        (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                       ('T 'NIL)))
            (COND
             ((QREFELT $ 135)
              (PROGN
               (QSETREFV $ 58
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;13|)
                               $))))
             ('T
              (QSETREFV $ 58
                        (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;14|)
                              $))))))
          ('T
           (QSETREFV $ 58
                     (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;15|)
                           $)))))
        ('T
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;16|) $))))
       (QSETREFV $ 190
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 189))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 189))))))
                  (EXIT (CONS #'|ElementaryIntegration!0| $))))
       (QSETREFV $ 192
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 191))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 191))))))
                  (EXIT (CONS #'|ElementaryIntegration!1| $))))
       $))))) 

(DEFUN |ElementaryIntegration!1| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(DEFUN |ElementaryIntegration!0| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(MAKEPROP '|ElementaryIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (|List| 7)
              (17 . |argument|) (22 . |differentiate|) (|Fraction| 104)
              (|Kernel| $) (28 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (34 . |monomial|)
              (40 . |coerce|) (45 . +) (|Mapping| 7 7) (51 . |differentiate|)
              (|PositiveInteger|) (58 . *)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| 201))
              (|Union| 33 '"failed") |INTEF;lflimitedint;FSLU;23|
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 36 '"failed") |INTEF;lfextendedint;FSFU;22|
              (|Union| 17 '"failed") (|Integer|) (|Mapping| 34 7 17)
              (|Mapping| 37 7 7) (|ElementaryRischDESystem| 6 7)
              (64 . |rischDEsys|) (|Record| (|:| |answer| 55) (|:| |a0| 7))
              (|Fraction| 24) (|Mapping| 24 24) (|Mapping| 39 40 7 7)
              (|TranscendentalIntegration| 7 24) (75 . |tanintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 12)
                                                     7)
              (82 . |multivariate|) (|IntegrationResult| 7) (|Mapping| 7 46)
              (|IntegrationResult| 46) (|IntegrationResultFunctions2| 46 7)
              (88 . |map|) (94 . |lfintegrate|) (100 . +)
              (|Union| 21 '#1="failed") (106 . |retractIfCan|) (111 . |second|)
              (116 . |third|) (|Union| 11 '#1#) (121 . |retractIfCan|)
              (126 . |coerce|) (|SparseMultivariatePolynomial| 6 21)
              (131 . |denom|) (136 . |coerce|) (141 . |Zero|) (145 . ~=)
              (151 . |numer|) (156 . /) (162 . |zero?|) (167 . |log|) (172 . *)
              (178 . |Zero|) (182 . |coerce|)
              (|Record| (|:| |scalar| (|Fraction| 40)) (|:| |coeff| 24)
                        (|:| |logand| 24))
              (|List| 79) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 81) (187 . |mkAnswer|) (194 . |is?|) (200 . =) (|List| $)
              (206 . |elt|) (|List| 21) (212 . |eval|) (219 . |symbolIfCan|)
              (224 . |coerce|) (229 . -) (234 . |eval|) (241 . +)
              (247 . |coerce|) (252 . -) (258 . |kernels|) (|List| 12)
              (263 . |member?|) (|OutputForm|) (269 . |coerce|) (|Void|)
              (274 . |print|) (|SparseUnivariatePolynomial| $)
              (279 . |minPoly|) (284 . |univariate|) (291 . |One|)
              (295 . |One|) (299 . |coefficient|) (305 . |elt|)
              (311 . |retract|) (|Union| $ '"failed") (316 . |exquo|)
              (322 . |lcm|) (328 . ^) (334 . |kernel|) (340 . >)
              (|IntegrationTools| 6 7) (346 . |ksec|)
              (|PureAlgebraicIntegration| 6 7 7) (353 . |palgint|)
              (360 . |tower|) (365 . |Zero|) (369 . |retract|)
              (|IntegrationResultFunctions2| 7 7) (374 . |map|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 24) (|:| |pol2| 24)
                        (|:| |prim| 24))
              (|FunctionSpacePrimitiveElement| 6 7) (380 . |primitiveElement|)
              (386 . |rootOf|) (391 . |elt|) (397 . |palgextint|)
              (405 . |palglimint|) (413 . |map|) '#:G152
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 136 '"failed") (|PatternMatchIntegration| 6 7)
              (419 . |pmintegrate|) (|Mapping| 53 7 11) (|Mapping| 137 7 11)
              (425 . |intPatternMatch|) (433 . |varselect|) (439 . |kmax|)
              (|RationalIntegration| 7 24) (444 . |integrate|) (449 . |elem?|)
              (454 . |ratpart|) (459 . |logpart|) (464 . |notelem|)
              (469 . |new|) (473 . |subst|) (480 . |freeOf?|) (486 . |kernel|)
              (491 . |first|) (496 . |One|) (|AlgebraicIntegration| 6 7)
              (500 . |algint|) (508 . =)
              (|Record| (|:| |ratpart| 46) (|:| |coeff| 46))
              (|Union| 160 '"failed") (514 . |extendedint|) (520 . |map|)
              (|Record| (|:| |coeff| 46) (|:| |logand| 46))
              (|Record| (|:| |mainpart| 46) (|:| |limitedlogs| (|List| 164)))
              (|Union| 165 '"failed") (|List| 46) (526 . |limitedint|)
              (532 . |map|) (|Union| 7 '"failed") |INTEF;lfinfieldint;FSU;24|
              (538 . ~=) |INTEF;lfextlimint;FSKLU;29|
              (|Record| (|:| |answer| 46) (|:| |a0| 7))
              (|Union| 174 160 '"failed") (|Mapping| 37 7)
              (544 . |primextendedint|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|ElementaryRischDE| 6 7) (552 . |rischDE|) (|Mapping| 178 40 7)
              (562 . |expextendedint|) (570 . |Zero|) (574 . |Zero|)
              (|Record| (|:| |answer| 186) (|:| |logpart| 186)
                        (|:| |ir| (|IntegrationResult| 186)))
              (|Fraction| (|SparseUnivariatePolynomial| (|Expression| 6)))
              (|Kernel| (|Expression| 6)) (|DenominatorIntegration| 6)
              (578 . |li_int|) '|denint_li| (585 . |poly_int|) '|denint_poly|
              (|Record| (|:| |answer| 46) (|:| |logpart| 46) (|:| |ir| 55))
              (|Mapping| 193 46) (592 . |primintegrate|) (600 . |union|)
              (606 . |expintegrate|) (|Record| (|:| |answer| 165) (|:| |a0| 7))
              (|Union| 198 '"failed") (614 . |primlimitedint|) (|List| 32)
              (622 . |concat|) (628 . |explimitedint|))
           '#(|lflimitedint| 636 |lfintegrate| 643 |lfinfieldint| 649
              |lfextlimint| 655 |lfextendedint| 663)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 203
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 1 12 17 0 18
                                                   2 7 0 0 11 19 2 7 20 0 21 22
                                                   2 24 0 7 23 25 1 24 0 7 26 2
                                                   24 0 0 0 27 3 24 0 0 28 0 29
                                                   2 7 0 30 0 31 7 43 39 40 7 7
                                                   7 11 41 42 44 3 49 45 46 47
                                                   48 50 2 51 7 46 12 52 2 56
                                                   53 54 55 57 2 0 53 7 11 58 2
                                                   53 0 0 0 59 1 7 60 0 61 1 17
                                                   7 0 62 1 17 7 0 63 1 7 64 0
                                                   65 1 53 0 7 66 1 7 67 0 68 1
                                                   7 0 67 69 0 7 0 70 2 7 10 0
                                                   0 71 1 7 67 0 72 2 7 0 0 0
                                                   73 1 7 10 0 74 1 7 0 0 75 2
                                                   7 0 0 0 76 0 6 0 77 1 7 0 11
                                                   78 3 53 0 7 80 82 83 2 14 10
                                                   0 11 84 2 7 10 0 0 85 2 7 0
                                                   14 86 87 3 7 0 0 88 86 89 1
                                                   12 64 0 90 1 7 0 21 91 1 7 0
                                                   0 92 3 7 0 0 21 0 93 2 7 0 0
                                                   0 94 1 7 0 40 95 2 7 0 0 0
                                                   96 1 7 88 0 97 2 98 10 12 0
                                                   99 1 7 100 0 101 1 100 102 0
                                                   103 1 7 104 21 105 3 51 24 7
                                                   12 24 106 0 6 0 107 0 7 0
                                                   108 2 24 7 0 23 109 2 17 7 0
                                                   40 110 1 7 40 0 111 2 40 112
                                                   0 0 113 2 40 0 0 0 114 2 7 0
                                                   0 40 115 2 7 0 14 86 116 2
                                                   40 10 0 0 117 3 118 12 12 98
                                                   11 119 3 120 53 7 12 12 121
                                                   1 7 88 0 122 0 53 0 123 1 7
                                                   21 0 124 2 125 53 28 53 126
                                                   2 128 127 7 7 129 1 7 0 104
                                                   130 2 24 7 0 7 131 4 120 37
                                                   7 12 12 7 132 4 120 34 7 12
                                                   12 17 133 2 17 0 28 0 134 2
                                                   138 137 7 11 139 4 118 53 7
                                                   11 140 141 142 2 118 98 98
                                                   11 143 1 118 12 98 144 1 145
                                                   55 46 146 1 53 10 0 147 1 53
                                                   7 0 148 1 53 80 0 149 1 53
                                                   82 0 150 0 11 0 151 3 7 0 0
                                                   88 86 152 2 7 10 0 11 153 1
                                                   12 0 11 154 1 17 7 0 155 0
                                                   23 0 156 4 157 53 7 12 12 47
                                                   158 2 12 10 0 0 159 2 145
                                                   161 46 46 162 2 56 37 54 161
                                                   163 2 145 166 46 167 168 2
                                                   56 34 54 166 169 2 12 10 0 0
                                                   172 4 49 175 46 47 176 46
                                                   177 6 179 178 40 7 7 11 41
                                                   42 180 4 49 175 46 47 181 46
                                                   182 0 46 0 183 0 55 0 184 3
                                                   188 185 186 187 11 189 3 188
                                                   185 186 187 11 191 4 49 45
                                                   46 47 194 176 195 2 118 98
                                                   98 98 196 4 49 45 46 47 194
                                                   181 197 4 49 199 46 47 176
                                                   167 200 2 201 0 0 0 202 4 49
                                                   199 46 47 181 167 203 3 0 34
                                                   7 11 17 35 2 0 53 7 11 58 2
                                                   0 170 7 11 171 4 0 37 7 11
                                                   12 98 173 3 0 37 7 11 7
                                                   38)))))
           '|lookupComplete|)) 
