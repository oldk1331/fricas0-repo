
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
  (PROG (|c| |da| |a|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |da|
               (SPADCALL
                (LETT |a|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 61)) (QREFELT $ 62))
                      . #1=(|INTEF;unknownint|))
                |x| (QREFELT $ 19))
               . #1#)
         (|spadConstant| $ 63) (QREFELT $ 64))
        (COND
         ((SPADCALL
           (SPADCALL
            (LETT |c|
                  (SPADCALL
                   (SPADCALL (SPADCALL |f| (QREFELT $ 65)) (QREFELT $ 62)) |da|
                   (QREFELT $ 66))
                  . #1#)
            |x| (QREFELT $ 19))
           (QREFELT $ 67))
          (EXIT
           (SPADCALL
            (SPADCALL |c| (SPADCALL |a| (QREFELT $ 68)) (QREFELT $ 69))
            (QREFELT $ 70)))))))
      (EXIT
       (SPADCALL (|spadConstant| $ 63) NIL
                 (LIST (CONS |f| (SPADCALL |x| (QREFELT $ 72))))
                 (QREFELT $ 77))))))) 

(DEFUN |INTEF;unklimint| (|f| |x| |lu| $)
  (PROG (#1=#:G204 #2=#:G206 |c| #3=#:G207 |u|)
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
                  ((SPADCALL |u| (|spadConstant| $ 63) (QREFELT $ 64))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (LETT |c|
                             (SPADCALL (SPADCALL |f| |u| (QREFELT $ 69))
                                       (SPADCALL |u| |x| (QREFELT $ 19))
                                       (QREFELT $ 66))
                             . #4#)
                       |x| (QREFELT $ 19))
                      (QREFELT $ 67))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2#
                                   (CONS 0
                                         (CONS (|spadConstant| $ 63)
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
         (QREFELT $ 67))
        (NULL
         (SPADCALL
          (SPADCALL (LETT |c| (SPADCALL |f| |g'| (QREFELT $ 66)) . #1#) |x|
                    (QREFELT $ 19))
          (QREFELT $ 67))))
       (CONS 1 "failed"))
      ('T (CONS 0 (CONS (|spadConstant| $ 63) |c|))))))) 

(DEFUN |INTEF;diffint1| (|f| |x| |k| $)
  (PROG (|f3| |nres3| |nres2| |nrat| |alpha| #1=#:G232 |nlogs| |cpol| #2=#:G233
         |lg| |logs| |nres| |f2| |dv| |k1| |args| |f1| |nfu|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nfu| (SPADCALL (SPADCALL |f| (QREFELT $ 65)) |k| (QREFELT $ 83))
              . #3=(|INTEF;diffint1|))
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |nfu| (QREFELT $ 85)) 1 (QREFELT $ 87))
           (CONS 1 "failed"))
          (#4='T
           (SEQ
            (LETT |f1|
                  (SPADCALL
                   (SPADCALL (SPADCALL |nfu| (QREFELT $ 88)) (QREFELT $ 62))
                   (SPADCALL (SPADCALL |f| (QREFELT $ 61)) (QREFELT $ 62))
                   (QREFELT $ 66))
                  . #3#)
            (LETT |args| (SPADCALL |k| (QREFELT $ 18)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 87))
               (|error| "internal error, k is not a diff"))
              (#4#
               (SEQ
                (LETT |k1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT $ 90))
                                (SPADCALL (SPADCALL |args| 2 (QREFELT $ 90))
                                          (QREFELT $ 91))
                                (SPADCALL |args| 3 (QREFELT $ 90))
                                (QREFELT $ 92))
                      . #3#)
                (LETT |dv| (SPADCALL (QREFELT $ 93)) . #3#)
                (LETT |f2|
                      (SPADCALL |f1| |k1| (SPADCALL |dv| (QREFELT $ 72))
                                (QREFELT $ 94))
                      . #3#)
                (LETT |nres| (SPADCALL |f2| |dv| (QREFELT $ 58)) . #3#)
                (COND
                 ((NULL (NULL (SPADCALL |nres| (QREFELT $ 95))))
                  (EXIT (CONS 1 "failed"))))
                (LETT |logs| (SPADCALL |nres| (QREFELT $ 96)) . #3#)
                (LETT |nlogs| NIL . #3#)
                (LETT |nrat| (|spadConstant| $ 63) . #3#)
                (SEQ (LETT |lg| NIL . #3#) (LETT #2# |logs| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |lg| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |cpol| (QVELT |lg| 1) . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (CONS #'|INTEF;diffint1!0| (VECTOR $ |x|))
                              (SPADCALL |cpol| (QREFELT $ 99)) (QREFELT $ 101))
                             (LETT |nlogs| (CONS |lg| |nlogs|) . #3#))
                            ((SPADCALL (SPADCALL |cpol| (QREFELT $ 102)) 1
                                       (QREFELT $ 87))
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #1#)))
                            ('T
                             (SEQ
                              (LETT |alpha|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |cpol| 0 (QREFELT $ 103))
                                      (SPADCALL |cpol| (QREFELT $ 104))
                                      (QREFELT $ 66))
                                     (QREFELT $ 105))
                                    . #3#)
                              (EXIT
                               (LETT |nrat|
                                     (SPADCALL |nrat|
                                               (SPADCALL
                                                (SPADCALL (QVELT |lg| 0)
                                                          |alpha|
                                                          (QREFELT $ 107))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL (QVELT |lg| 2)
                                                            (QREFELT $ 80)
                                                            |alpha|
                                                            (QREFELT $ 108))
                                                  (QREFELT $ 109))
                                                 (QREFELT $ 68))
                                                (QREFELT $ 69))
                                               (QREFELT $ 110))
                                     . #3#)))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (LETT |nres2|
                      (SPADCALL
                       (SPADCALL (SPADCALL |nres| (QREFELT $ 111)) |nrat|
                                 (QREFELT $ 110))
                       (NREVERSE |nlogs|) NIL (QREFELT $ 77))
                      . #3#)
                (LETT |nres3|
                      (SPADCALL
                       (CONS #'|INTEF;diffint1!1| (VECTOR |k1| $ |dv|)) |nres2|
                       (QREFELT $ 114))
                      . #3#)
                (LETT |f3|
                      (SPADCALL |f| (SPADCALL |nres3| |x| (QREFELT $ 115))
                                (QREFELT $ 116))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |k| (SPADCALL |f3| (QREFELT $ 118))
                             (QREFELT $ 120))
                   (|error| "internal error, f still contains k"))
                  (#4#
                   (CONS 0
                         (SPADCALL |nres3| (SPADCALL |f3| |x| (QREFELT $ 58))
                                   (QREFELT $ 59))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTEF;diffint1!1| (|x1| $$)
  (PROG (|dv| $ |k1|)
    (LETT |dv| (QREFELT $$ 2) . #1=(|INTEF;diffint1|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |k1| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 112)) |k1| (QREFELT $ 92)))))) 

(DEFUN |INTEF;diffint1!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;diffint1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x1| |x| (QREFELT $ 97)) (|spadConstant| $ 63)
                (QREFELT $ 98)))))) 

(DEFUN |INTEF;diffint| (|f| |x| |k| $)
  (PROG (|r1|)
    (RETURN
     (SEQ (LETT |r1| (|INTEF;diffint1| |f| |x| |k| $) |INTEF;diffint|)
          (EXIT
           (COND ((QEQCAR |r1| 0) (QCDR |r1|))
                 ('T
                  (SPADCALL (|spadConstant| $ 63) NIL
                            (LIST (CONS |f| (SPADCALL |x| (QREFELT $ 72))))
                            (QREFELT $ 77))))))))) 

(DEFUN |INTEF;isx?| (|f| |x| $)
  (PROG (|r| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 122)) . #1=(|INTEF;isx?|))
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 (#2='T
                  (SEQ (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 124)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) 'NIL)
                              (#2# (EQUAL (QCDR |r|) |x|)))))))))))) 

(DEFUN |INTEF;alg_split_root0| (|f| |r| |n| $)
  (PROG (#1=#:G255 |i| #2=#:G254 |q| |f1| |f0| |ef|)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 2)
        (SEQ
         (LETT |ef|
               (SPADCALL |f| |r|
                         (SPADCALL (SPADCALL |r| (QREFELT $ 125))
                                   (QREFELT $ 105))
                         (QREFELT $ 92))
               . #3=(|INTEF;alg_split_root0|))
         (LETT |f0|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 110))
                         (SPADCALL 2 (QREFELT $ 126)) (QREFELT $ 66))
               . #3#)
         (LETT |f1|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 116))
                         (SPADCALL 2 (QREFELT $ 126)) (QREFELT $ 66))
               . #3#)
         (EXIT
          (COND
           ((SPADCALL |r| (SPADCALL |f0| (QREFELT $ 118)) (QREFELT $ 120))
            (SEQ (SPADCALL (SPADCALL |f0| (QREFELT $ 128)) (QREFELT $ 130))
                 (EXIT (|error| "alg_split_root0: roots did not cancel 1"))))
           (#4='T
            (SEQ
             (LETT |f1|
                   (SPADCALL |f1| (SPADCALL |r| (QREFELT $ 125))
                             (QREFELT $ 66))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f1| (QREFELT $ 118)) (QREFELT $ 120))
                (SEQ (SPADCALL (SPADCALL |f1| (QREFELT $ 128)) (QREFELT $ 130))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
               (#4# (LIST |f0| |f1|))))))))))
       (#4#
        (SEQ
         (LETT |q|
               (SPADCALL |f| |r| (SPADCALL |r| (QREFELT $ 131))
                         (QREFELT $ 132))
               . #3#)
         (EXIT
          (PROGN
           (LETT #2# NIL . #3#)
           (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 103)) #2#)
                        . #3#)))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |INTEF;alg_split_roots| (|f| |r1| |r2| $)
  (PROG (|res| |nrr| |nr| |bb2| #1=#:G258 |bb1| |nn| |np2| |nn2| |g2| #2=#:G269
         |f2| #3=#:G270 |pow2| |np1| |nn1| |g1| |l2| #4=#:G267 |f1| #5=#:G268
         |pow1| |rop| |l1| |b2| |n2| |b1| |n1| |a2| |a1|)
    (RETURN
     (SEQ
      (LETT |a1| (SPADCALL |r1| (QREFELT $ 18)) . #6=(|INTEF;alg_split_roots|))
      (LETT |a2| (SPADCALL |r2| (QREFELT $ 18)) . #6#)
      (LETT |n1| (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 90)) (QREFELT $ 133))
            . #6#)
      (LETT |b1| (SPADCALL |a1| 1 (QREFELT $ 90)) . #6#)
      (LETT |n2| (SPADCALL (SPADCALL |a2| 2 (QREFELT $ 90)) (QREFELT $ 133))
            . #6#)
      (LETT |b2| (SPADCALL |a2| 1 (QREFELT $ 90)) . #6#)
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
              ((SPADCALL |f1| (|spadConstant| $ 63) (QREFELT $ 98)) "iterate")
              ('T
               (SEQ
                (LETT |l2| (|INTEF;alg_split_root0| |f1| |r2| |n2| $) . #6#)
                (LETT |g1| (GCD |n1| |pow1|) . #6#)
                (LETT |nn1|
                      (PROG2
                          (LETT #1# (SPADCALL |n1| |g1| (QREFELT $ 135)) . #6#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                      . #6#)
                (LETT |np1|
                      (PROG2
                          (LETT #1# (SPADCALL |pow1| |g1| (QREFELT $ 135))
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
                         ((SPADCALL |f2| (|spadConstant| $ 63) (QREFELT $ 98))
                          "iterate")
                         ('T
                          (SEQ (LETT |g2| (GCD |n2| |pow2|) . #6#)
                               (LETT |nn2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |n2| |g2|
                                                         (QREFELT $ 135))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |np2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |pow2| |g2|
                                                         (QREFELT $ 135))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |nn|
                                     (SPADCALL |nn1| |nn2| (QREFELT $ 136))
                                     . #6#)
                               (LETT |bb1|
                                     (SPADCALL |b1|
                                               (* |np1|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn1|
                                                                      (QREFELT
                                                                       $ 135))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 137))
                                     . #6#)
                               (LETT |bb2|
                                     (SPADCALL |b2|
                                               (* |np2|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn2|
                                                                      (QREFELT
                                                                       $ 135))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 137))
                                     . #6#)
                               (LETT |nr|
                                     (SPADCALL |rop|
                                               (LIST
                                                (SPADCALL |bb1| |bb2|
                                                          (QREFELT $ 69))
                                                (SPADCALL |nn|
                                                          (QREFELT $ 126)))
                                               (QREFELT $ 139))
                                     . #6#)
                               (LETT |nrr|
                                     (COND
                                      ((SPADCALL (+ |pow1| |pow2|) 0
                                                 (QREFELT $ 140))
                                       |nr|)
                                      ('T (|spadConstant| $ 89)))
                                     . #6#)
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (VECTOR
                                        (SPADCALL |f2| |nrr| (QREFELT $ 69))
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
  (PROG (|y| |rec| |res| |ir1| |oroot| #1=#:G291 |al| |kx| |xf|)
    (RETURN
     (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 72)) . #2=(|INTEF;alglfint|))
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL
               (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 142)) . #2#)
               (QREFELT $ 124))
              0)
             (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 144)) |xf| $))
            ((SPADCALL |kx| '|exp| (QREFELT $ 13))
             (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
            ((|INTEF;prim?| |kx| |x| $)
             (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
            ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                       (QREFELT $ 16))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                          (QREFELT $ 145))
                (COND
                 ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                            (QREFELT $ 145))
                  (COND
                   ((NULL
                     (SPADCALL |kx|
                               (SPADCALL (SPADCALL |k| (QREFELT $ 125))
                                         (QREFELT $ 146))
                               (QREFELT $ 120)))
                    (EXIT
                     (SEQ
                      (LETT |al| (|INTEF;alg_split_roots| |f| |k| |kx| $)
                            . #2#)
                      (LETT |res| (|spadConstant| $ 147) . #2#)
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
                                        (QREFELT $ 140))
                              (SEQ
                               (LETT |oroot|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 125))
                                                (QVELT |rec| 2)
                                                (QREFELT $ 137))
                                      (SPADCALL (SPADCALL |kx| (QREFELT $ 125))
                                                (QVELT |rec| 3)
                                                (QREFELT $ 137))
                                      (QREFELT $ 69))
                                     . #2#)
                               (EXIT
                                (LETT |ir1|
                                      (SPADCALL
                                       (CONS #'|INTEF;alglfint!0|
                                             (VECTOR |oroot| $ |rec|))
                                       |ir1| (QREFELT $ 114))
                                      . #2#)))))
                            (EXIT
                             (LETT |res| (SPADCALL |res| |ir1| (QREFELT $ 59))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))))
              (LETT |rec|
                    (SPADCALL (SPADCALL |kx| (QREFELT $ 125))
                              (SPADCALL |k| (QREFELT $ 125)) (QREFELT $ 150))
                    . #2#)
              (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 151)) . #2#)
              (EXIT
               (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                         (SPADCALL
                          (SPADCALL |f| (LIST |kx| |k|)
                                    (LIST
                                     (SPADCALL (QVELT |rec| 1) |y|
                                               (QREFELT $ 152))
                                     (SPADCALL (QVELT |rec| 2) |y|
                                               (QREFELT $ 152)))
                                    (QREFELT $ 153))
                          |x| (QREFELT $ 58))
                         (QREFELT $ 114)))))
            ('T (|INTEF;unknownint| |f| |x| $)))))))) 

(DEFUN |INTEF;alglfint!1| (|x1| $$)
  (PROG (|y| $ |rec|)
    (LETT |y| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |rec| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 91)) (QVELT |rec| 0)
                (QREFELT $ 92)))))) 

(DEFUN |INTEF;alglfint!0| (|x1| $$)
  (PROG (|rec| $ |oroot|)
    (LETT |rec| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |oroot| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL (QVELT |rec| 1) (QREFELT $ 91)) |oroot|
                (QREFELT $ 92)))))) 

(DEFUN |INTEF;alglfextint| (|f| |k| |l| |x| |g| $)
  (PROG (|u2| |r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 142))
                . #1=(|INTEF;alglfextint|))
          (QREFELT $ 124))
         0)
        (SPADCALL |f| |kx| |k| |g| (QREFELT $ 154)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 125))
                         (SPADCALL |k| (QREFELT $ 125)) (QREFELT $ 150))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 151)) . #1#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 152))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 152)))
               . #1#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 153))
                         |x|
                         (SPADCALL |g| (LIST |kx| |k|) |lrhs| (QREFELT $ 153))
                         (QREFELT $ 38))
               . #1#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                (#2='T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 91)) . #1#)
                      (LETT |r| (QCDR |u|) . #1#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 92))
                              (SPADCALL (QCDR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 92)))))))))))
       ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
            (SPADCALL |kx| '|log| (QREFELT $ 13)))
        (SEQ (LETT |u2| (|INTEF;try_change_var2| |f| |kx| |x| |g| $) . #1#)
             (EXIT
              (COND ((QEQCAR |u2| 2) (CONS 1 "failed"))
                    ((QEQCAR |u2| 0) (CONS 0 (QCDR |u2|)))
                    (#2# (|error| "failed - cannot handle that integrand"))))))
       ('T (|INTEF;unkextint| |f| |x| |g| $))))))) 

(DEFUN |INTEF;alglflogint| (|f| |k| |l| |x| |lu| $)
  (PROG (#1=#:G334 |rc| #2=#:G333 |r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 142))
                . #3=(|INTEF;alglflogint|))
          (QREFELT $ 124))
         0)
        (SPADCALL |f| |kx| |k| |lu| (QREFELT $ 155)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 125))
                         (SPADCALL |k| (QREFELT $ 125)) (QREFELT $ 150))
               . #3#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 151)) . #3#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 152))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 152)))
               . #3#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 153))
                         |x|
                         (SPADCALL
                          (CONS #'|INTEF;alglflogint!0|
                                (VECTOR $ |lrhs| |k| |kx|))
                          |lu| (QREFELT $ 156))
                         (QREFELT $ 35))
               . #3#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 91)) . #3#)
                      (LETT |r| (QCDR |u|) . #3#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 92))
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
                                                        (QREFELT $ 92))
                                              (SPADCALL (QCDR |rc|) |ky|
                                                        (QVELT |rec| 0)
                                                        (QREFELT $ 92)))
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))))))))))
       ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
            (SPADCALL |kx| '|log| (QREFELT $ 13)))
        (|error| "failed - cannot handle that integrand"))
       ('T (|INTEF;unklimint| |f| |x| |lu| $))))))) 

(DEFUN |INTEF;alglflogint!0| (|x1| $$)
  (PROG (|kx| |k| |lrhs| $)
    (LETT |kx| (QREFELT $$ 3) . #1=(|INTEF;alglflogint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lrhs| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| (LIST |kx| |k|) |lrhs| (QREFELT $ 153)))))) 

(DEFUN |INTEF;lfintegrate;FSIr;14| (|f| |x| $)
  (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $) (ELT $ 161)
            (QREFELT $ 164))) 

(DEFUN |INTEF;lfintegrate;FSIr;15| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;16| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;17| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate0| (|f| |x| $)
  (PROG (|k| |l| |xf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 67)) (|spadConstant| $ 147))
            (#1='T
             (SEQ
              (LETT |xf| (SPADCALL |x| (QREFELT $ 72))
                    . #2=(|INTEF;lfintegrate0|))
              (EXIT
               (COND
                ((NULL
                  (LETT |l|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 118)) |x|
                                  (QREFELT $ 165))
                        . #2#))
                 (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 69)) (QREFELT $ 70)))
                ((QEQCAR
                  (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 166)) . #2#)
                            (QREFELT $ 124))
                  0)
                 (SPADCALL (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                           (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                                     (QREFELT $ 168))
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
                ((SPADCALL |k| '|%diff| (QREFELT $ 13))
                 (|INTEF;diffint| |f| |x| |k| $))
                (#1# (|INTEF;unknownint| |f| |x| $))))))))))) 

(DEFUN |INTEF;lfintegrate0!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfintegrate0|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;addx| (|i| |x| $)
  (PROG (#1=#:G369 |ne| #2=#:G368)
    (RETURN
     (SEQ
      (COND ((SPADCALL |i| (QREFELT $ 169)) |i|)
            ('T
             (SPADCALL (SPADCALL |i| (QREFELT $ 111))
                       (SPADCALL |i| (QREFELT $ 96))
                       (PROGN
                        (LETT #2# NIL . #3=(|INTEF;addx|))
                        (SEQ (LETT |ne| NIL . #3#)
                             (LETT #1# (SPADCALL |i| (QREFELT $ 95)) . #3#)
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
                       (QREFELT $ 77)))))))) 

(DEFUN |INTEF;tryChangeVar| (|f| |t| |x| $)
  (PROG (|g| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 93)) . #1=(|INTEF;tryChangeVar|))
          (LETT |g|
                (SPADCALL
                 (SPADCALL |f|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 125)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 66))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 72)))
                 (QREFELT $ 170))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |g| |x| (QREFELT $ 171))
             (CONS 0
                   (SPADCALL (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                             (SPADCALL |g| |z| (QREFELT $ 58))
                             (QREFELT $ 114))))
            ('T (CONS 1 "failed")))))))) 

(DEFUN |INTEF;tryChangeVar!0| (|x1| $$)
  (PROG (|z| $ |t|)
    (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |t| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 112))
                (SPADCALL |t| (QREFELT $ 125)) (QREFELT $ 92)))))) 

(DEFUN |INTEF;try_change_var2| (|f| |t| |x| |g| $)
  (PROG (|res2| |res1| |g1| |f1| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 93)) . #1=(|INTEF;try_change_var2|))
          (LETT |f1|
                (SPADCALL
                 (SPADCALL |f|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 125)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 66))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 72)))
                 (QREFELT $ 170))
                . #1#)
          (COND
           ((NULL (SPADCALL |f1| |x| (QREFELT $ 171)))
            (EXIT (CONS 1 "reject"))))
          (LETT |g1|
                (SPADCALL
                 (SPADCALL |g|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 125)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 66))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 72)))
                 (QREFELT $ 170))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |g1| |x| (QREFELT $ 171))
             (SEQ (LETT |res1| (SPADCALL |f1| |z| |g1| (QREFELT $ 38)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |res1| 1) (CONS 2 "failed"))
                         (#2='T
                          (CONS 0
                                (CONS
                                 (SPADCALL (QCAR (QCDR |res1|))
                                           (SPADCALL |z| (QREFELT $ 112))
                                           (SPADCALL |t| (QREFELT $ 125))
                                           (QREFELT $ 92))
                                 (QCDR (QCDR |res1|)))))))))
            (#2#
             (SEQ (LETT |res2| (SPADCALL |f1| |z| NIL (QREFELT $ 35)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |res2| 1) (CONS 1 "reject"))
                         (#2#
                          (CONS 0
                                (CONS
                                 (SPADCALL (QCAR (QCDR |res2|))
                                           (SPADCALL |z| (QREFELT $ 112))
                                           (SPADCALL |t| (QREFELT $ 125))
                                           (QREFELT $ 92))
                                 (|spadConstant| $ 63)))))))))))))) 

(DEFUN |INTEF;algexpint| (|f| |t| |y| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $) |INTEF;algexpint|)
          (EXIT
           (COND ((QEQCAR |u| 0) (QCDR |u|))
                 ('T
                  (SPADCALL |f| |t| |y|
                            (CONS #'|INTEF;algexpint!1| (VECTOR |t| |x| $))
                            (QREFELT $ 175))))))))) 

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
                     (SPADCALL (SPADCALL |t| (QREFELT $ 18)) (QREFELT $ 172))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 173) (QREFELT $ 25))
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
                            (QREFELT $ 175))))))))) 

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
                    (SPADCALL (SPADCALL |t| (QREFELT $ 125)) |x|
                              (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;algprimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;lfextendedint;FSFU;24| (|f| |x| |g| $)
  (PROG (|g1| |l1| |k| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l|
               (SPADCALL (SPADCALL |f| (QREFELT $ 118)) |x| (QREFELT $ 165))
               . #1=(|INTEF;lfextendedint;FSFU;24|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 72)) |f| (QREFELT $ 69))
                    (|spadConstant| $ 63))))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 166)) . #1#)
                   (QREFELT $ 124))
         0)
        (SEQ
         (LETT |g1|
               (COND
                ((OR
                  (NULL
                   (LETT |l1|
                         (SPADCALL (SPADCALL |g| (QREFELT $ 118)) |x|
                                   (QREFELT $ 165))
                         . #1#))
                  (NULL
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 166)) |k|
                             (QREFELT $ 176))))
                 (|spadConstant| $ 63))
                ('T |g|))
               . #1#)
         (EXIT
          (SPADCALL (CONS #'|INTEF;lfextendedint;FSFU;24!0| (VECTOR $ |k|))
                    (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                              (SPADCALL |g1| |k| (QREFELT $ 22))
                              (QREFELT $ 179))
                    (QREFELT $ 180)))))
       ((SPADCALL |k| '|exp| (QREFELT $ 13))
        (|INTEF;expextint| |f| |x| |k| |g| $))
       ((|INTEF;prim?| |k| |x| $) (|INTEF;primextint| |f| |x| |k| |g| $))
       ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (|INTEF;alglfextint| |f| |k| |l| |x| |g| $))
       ('T (|INTEF;unkextint| |f| |x| |g| $))))))) 

(DEFUN |INTEF;lfextendedint;FSFU;24!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lfextendedint;FSFU;24|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;lflogint;FSLU;25| (|f| |x| |lu| $)
  (PROG (#1=#:G446 |u| #2=#:G445 |k| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l|
               (SPADCALL (SPADCALL |f| (QREFELT $ 118)) |x| (QREFELT $ 165))
               . #3=(|INTEF;lflogint;FSLU;25|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 72)) |f| (QREFELT $ 69))
                    NIL)))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 166)) . #3#)
                   (QREFELT $ 124))
         0)
        (SPADCALL (CONS #'|INTEF;lflogint;FSLU;25!0| (VECTOR $ |k|))
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
                            (QREFELT $ 185))
                  (QREFELT $ 186)))
       ((SPADCALL |k| '|exp| (QREFELT $ 13))
        (|INTEF;explflogint| |f| |x| |k| |lu| $))
       ((|INTEF;prim?| |k| |x| $) (|INTEF;primlflogint| |f| |x| |k| |lu| $))
       ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (|INTEF;alglflogint| |f| |k| |l| |x| |lu| $))
       ('T (|INTEF;unklimint| |f| |x| |lu| $))))))) 

(DEFUN |INTEF;lflogint;FSLU;25!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lflogint;FSLU;25|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;lfinfieldint;FSU;26| (|f| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |f| |x| (|spadConstant| $ 63) (QREFELT $ 38))
            |INTEF;lfinfieldint;FSU;26|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCAR (QCDR |u|)))))))))) 

(DEFUN |INTEF;primextint| (|f| |x| |k| |g| $)
  (PROG (|u2| |u1| |lk| #1=#:G478 |a| #2=#:G477)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primextint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 146)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 189))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 165))
            . #3#)
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primextint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;primextint!2| (VECTOR $ |lk| |k| |x|))
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 194))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 110))
                              (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTEF;primextint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primextint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 190)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 125)) |x|
                              (QREFELT $ 19))
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
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 199))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 110))
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
                   (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 172))
                   |x4| |x| (CONS #'|INTEF;expextint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;expextint!3| (VECTOR $ |x|))
                   (QREFELT $ 197)))))))) 

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
                     (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 172))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 173) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expextint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;denint_dummy| (|f| $)
  (VECTOR (|spadConstant| $ 200) |f| (|spadConstant| $ 201))) 

(DEFUN |INTEF;primint| (|f| |x| |k| $)
  (PROG (|r1| |denint| |lk| #1=#:G554 |a| #2=#:G553)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 146)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 189))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 165))
            . #3#)
      (LETT |denint|
            (COND
             ((SPADCALL |k| '|log| (QREFELT $ 13))
              (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 207) |x| |k|)))
             (#4# (CONS (|function| |INTEF;denint_dummy|) $)))
            . #3#)
      (LETT |r1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primint!2| (VECTOR |k| |x| $)) |denint|
                      (CONS #'|INTEF;primint!3| (VECTOR $ |lk| |k| |x|))
                      (QREFELT $ 212))
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
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 190)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 125)) |x|
                              (QREFELT $ 19))
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

(DEFUN |INTEF;lfextlimint;FSKLU;31| (|f| |x| |k| |lk| $)
  (PROG (#1=#:G573 #2=#:G572 #3=#:G574 #4=#:G584 |c| |cf| |u2| #5=#:G583 |u|
         #6=#:G582 |lg| #7=#:G581 |kk| #8=#:G580 |twr| #9=#:G578 |u1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u1|
               (SPADCALL |f| |x|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 125)) |x|
                                   (QREFELT $ 19))
                         (QREFELT $ 38))
               . #10=(|INTEF;lfextlimint;FSKLU;31|))
         (EXIT
          (COND
           ((NULL (QEQCAR |u1| 1)) (PROGN (LETT #9# |u1| . #10#) (GO #9#))))))
        (LETT |twr| (SPADCALL |f| (QREFELT $ 146)) . #10#)
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
                            ((COND ((SPADCALL |kk| |twr| (QREFELT $ 120)) 'NIL)
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
                                                  (QREFELT $ 213))
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
                                                  (SPADCALL |k|
                                                            (QREFELT $ 125))
                                                  (QREFELT $ 69))
                                        (QREFELT $ 116))
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
                                                                          68))
                                                       (QREFELT $ 69))
                                             . #10#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 110))
                                               . #10#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #10#)
                                          (LETT #1# 'T . #10#)))))))
                                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#11# (|spadConstant| $ 63))))
                              (QREFELT $ 110))
                             |cf|)))))))))))))
      #9# (EXIT #9#))))) 

(DEFUN |INTEF;cfind| (|f| |l| $)
  (PROG (#1=#:G587 #2=#:G589 #3=#:G590 |u|)
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
                  ((SPADCALL |f| (QCDR |u|) (QREFELT $ 98))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (QCAR |u|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|spadConstant| $ 63))))
      #2# (EXIT #2#))))) 

(DEFUN |INTEF;risch_de_solver| (|x3| |x4| |eta| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL |x3| |eta| |x4| |x|
               (CONS #'|INTEF;risch_de_solver!0| (VECTOR $ |x|))
               (CONS #'|INTEF;risch_de_solver!1| (VECTOR $ |x|))
               (QREFELT $ 216))))) 

(DEFUN |INTEF;risch_de_solver!1| (|x7| |x8| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;risch_de_solver|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x7| |x| |x8| (QREFELT $ 38)))))) 

(DEFUN |INTEF;risch_de_solver!0| (|x5| |x6| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;risch_de_solver|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 35)))))) 

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
                            (VECTOR (QREFELT $ 209) |x| |k|))
                      (CONS #'|INTEF;expint!3| (VECTOR $ |x| |eta|))
                      (QREFELT $ 218))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (CONS #'|INTEF;expint!4| (VECTOR $ |k|)) (QCAR |r1|)
                  (QREFELT $ 57))
        (SPADCALL (QCDR |r1|) |x| (QREFELT $ 58)) (QREFELT $ 59))))))) 

(DEFUN |INTEF;expint!4| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;expint|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |k| (QREFELT $ 52)))))) 

(DEFUN |INTEF;expint!3| (|x3| |x4| $$)
  (PROG (|eta| |x| $)
    (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;expint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTEF;risch_de_solver| |x3| |x4| |eta| |x| $))))) 

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
                             (|spadConstant| $ 173) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;primlflogint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G645 |lg| #2=#:G644 |u1| #3=#:G643 |u| #4=#:G642 |lk|
         #5=#:G641 |a| #6=#:G640)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #6# NIL . #7=(|INTEF;primlflogint|))
              (SEQ (LETT |a| NIL . #7#)
                   (LETT #5# (SPADCALL |f| (QREFELT $ 146)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 189))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#8='T 'NIL))
                       (LETT #6# (CONS |a| #6#) . #7#)))))
                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #6#))))
             |x| (QREFELT $ 165))
            . #7#)
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primlflogint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;primlflogint!2| (VECTOR $ |lk| |k| |x|))
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
                      (QREFELT $ 221))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 110))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 223))))))))))))))) 

(DEFUN |INTEF;primlflogint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primlflogint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 190)))))) 

(DEFUN |INTEF;primlflogint!1| (|x1| $$)
  (PROG ($ |x| |k|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;primlflogint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;primlflogint!0| (VECTOR $ |x|))
                   (SPADCALL
                    (SPADCALL (SPADCALL |k| (QREFELT $ 125)) |x|
                              (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;primlflogint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;explflogint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G675 |lg| #2=#:G674 |u1| #3=#:G673 |u| #4=#:G672 |eta|)
    (RETURN
     (SEQ
      (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 18)))
            . #5=(|INTEF;explflogint|))
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;explflogint!1| (VECTOR |eta| |x| $))
                      (CONS #'|INTEF;explflogint!4| (VECTOR $ |x| |eta|))
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
                      (QREFELT $ 224))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 110))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 223))))))))))))))) 

(DEFUN |INTEF;explflogint!4| (|x1| |x2| $$)
  (PROG (|eta| |x| $)
    (LETT |eta| (QREFELT $$ 2) . #1=(|INTEF;explflogint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| |eta| |x2| |x|
                   (CONS #'|INTEF;explflogint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;explflogint!3| (VECTOR $ |x|))
                   (QREFELT $ 197)))))))) 

(DEFUN |INTEF;explflogint!3| (|x5| |x6| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x5| |x| |x6| (QREFELT $ 38)))))) 

(DEFUN |INTEF;explflogint!2| (|x3| |x4| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x3| |x| |x4| (QREFELT $ 35)))))) 

(DEFUN |INTEF;explflogint!1| (|x1| $$)
  (PROG ($ |x| |eta|)
    (LETT $ (QREFELT $$ 2) . #1=(|INTEF;explflogint|))
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |eta| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |x1| (CONS #'|INTEF;explflogint!0| (VECTOR $ |x|))
                   (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 19))
                             (|spadConstant| $ 173) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;explflogint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DECLAIM (NOTINLINE |ElementaryIntegration;|)) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G676)
  (PROG ()
    (RETURN
     (PROG (#2=#:G677)
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
       (LETT $ (GETREFV 225) . #1#)
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
       (QSETREFV $ 80 (SPADCALL (QREFELT $ 79)))
       (COND
        ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
         (COND
          ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
           (PROGN
            (QSETREFV $ 157
                      (COND
                       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
                        (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                       ('T 'NIL)))
            (COND
             ((QREFELT $ 157)
              (PROGN
               (QSETREFV $ 58
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;14|)
                               $))))
             ('T
              (QSETREFV $ 58
                        (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;15|)
                              $))))))
          ('T
           (QSETREFV $ 58
                     (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;16|)
                           $)))))
        ('T
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;17|) $))))
       (QSETREFV $ 207
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 206))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 206))))))
                  (EXIT (CONS #'|ElementaryIntegration!0| $))))
       (QSETREFV $ 209
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 208))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 208))))))
                  (EXIT (CONS #'|ElementaryIntegration!1| $))))
       $))))) 

(DEFUN |ElementaryIntegration!1| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(DEFUN |ElementaryIntegration!0| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(MAKEPROP '|ElementaryIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (|List| 7)
              (17 . |argument|) (22 . |differentiate|) (|Fraction| 81)
              (|Kernel| $) (28 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (34 . |monomial|)
              (40 . |coerce|) (45 . +) (|Mapping| 7 7) (51 . |differentiate|)
              (|PositiveInteger|) (58 . *)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| 222))
              (|Union| 33 '"failed") |INTEF;lflogint;FSLU;25|
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 36 '"failed") |INTEF;lfextendedint;FSFU;24|
              (|Union| 17 '"failed") (|Integer|) (|Mapping| 34 7 17)
              (|Mapping| 37 7 7) (|ElementaryRischDESystem| 6 7)
              (64 . |rischDEsys|) (|Record| (|:| |answer| 55) (|:| |a0| 7))
              (|Fraction| 24) (|Mapping| 24 24) (|Mapping| 39 40 7 7)
              (|TranscendentalIntegration| 7 24) (75 . |tanintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 82 7)
              (82 . |multivariate|) (|IntegrationResult| 7) (|Mapping| 7 46)
              (|IntegrationResult| 46) (|IntegrationResultFunctions2| 46 7)
              (88 . |map|) (94 . |lfintegrate|) (100 . +)
              (|SparseMultivariatePolynomial| 6 21) (106 . |denom|)
              (111 . |coerce|) (116 . |Zero|) (120 . ~=) (126 . |numer|)
              (131 . /) (137 . |zero?|) (142 . |log|) (147 . *)
              (153 . |coerce|) (158 . |Zero|) (162 . |coerce|)
              (|Record| (|:| |scalar| 106) (|:| |coeff| 24) (|:| |logand| 24))
              (|List| 73) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 75) (167 . |mkAnswer|) (|SingletonAsOrderedSet|)
              (174 . |create|) '|dummy| (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 12) (178 . |univariate|)
              (|SparseUnivariatePolynomial| 82) (184 . |degree|) (189 . |One|)
              (193 . ~=) (199 . |leadingCoefficient|) (204 . |One|)
              (208 . |elt|) (214 . |retract|) (219 . |eval|) (226 . |new|)
              (230 . |eval|) (237 . |notelem|) (242 . |logpart|) (247 . D)
              (253 . =) (259 . |coefficients|) (|Mapping| 10 7)
              (264 . |every?|) (270 . |degree|) (275 . |coefficient|)
              (281 . |leadingCoefficient|) (286 . -) (|Fraction| 40) (291 . *)
              (297 . |eval|) (304 . |retract|) (309 . +) (315 . |ratpart|)
              (320 . |kernel|) (|IntegrationResultFunctions2| 7 7)
              (325 . |map|) (331 . |differentiate|) (337 . -) (|List| 21)
              (343 . |kernels|) (|List| 12) (348 . |member?|)
              (|Union| 21 '"failed") (354 . |retractIfCan|)
              (|Union| 11 '"failed") (359 . |symbolIfCan|) (364 . |coerce|)
              (369 . |coerce|) (|OutputForm|) (374 . |coerce|) (|Void|)
              (379 . |print|) (384 . |minPoly|) (389 . |univariate|)
              (396 . |retract|) (|Union| $ '"failed") (401 . |exquo|)
              (407 . |lcm|) (413 . ^) (|List| $) (419 . |kernel|) (425 . >)
              (|IntegrationTools| 6 7) (431 . |ksec|)
              (|PureAlgebraicIntegration| 6 7 7) (438 . |palgint|)
              (445 . |is?|) (451 . |tower|) (456 . |Zero|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 24) (|:| |pol2| 24)
                        (|:| |prim| 24))
              (|FunctionSpacePrimitiveElement| 6 7) (460 . |primitiveElement|)
              (466 . |rootOf|) (471 . |elt|) (477 . |eval|)
              (484 . |palgextint|) (492 . |palglimint|) (500 . |map|) '#:G134
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 158 '"failed") (|PatternMatchIntegration| 6 7)
              (506 . |pmintegrate|) (|Mapping| 53 7 11) (|Mapping| 159 7 11)
              (512 . |intPatternMatch|) (520 . |varselect|) (526 . |kmax|)
              (|RationalIntegration| 7 24) (531 . |integrate|) (536 . |elem?|)
              (541 . |subst|) (548 . |freeOf?|) (554 . |first|) (559 . |One|)
              (|AlgebraicIntegration| 6 7) (563 . |algint|) (571 . =)
              (|Record| (|:| |ratpart| 46) (|:| |coeff| 46))
              (|Union| 177 '"failed") (577 . |extendedint|) (583 . |map|)
              (|Record| (|:| |coeff| 46) (|:| |logand| 46))
              (|Record| (|:| |mainpart| 46) (|:| |limitedlogs| (|List| 181)))
              (|Union| 182 '"failed") (|List| 46) (589 . |limitedint|)
              (595 . |map|) (|Union| 7 '"failed") |INTEF;lfinfieldint;FSU;26|
              (601 . ~=) |INTEF;lfextlimint;FSKLU;31|
              (|Record| (|:| |answer| 46) (|:| |a0| 7))
              (|Union| 191 177 '"failed") (|Mapping| 37 7)
              (607 . |primextendedint|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|ElementaryRischDE| 6 7) (615 . |rischDE|) (|Mapping| 195 40 7)
              (625 . |expextendedint|) (633 . |Zero|) (637 . |Zero|)
              (|Record| (|:| |answer| 203) (|:| |logpart| 203)
                        (|:| |ir| (|IntegrationResult| 203)))
              (|Fraction| (|SparseUnivariatePolynomial| (|Expression| 6)))
              (|Kernel| (|Expression| 6)) (|DenominatorIntegration| 6)
              (641 . |li_int|) '|denint_li| (648 . |poly_int|) '|denint_poly|
              (|Record| (|:| |answer| 46) (|:| |logpart| 46) (|:| |ir| 55))
              (|Mapping| 210 46) (655 . |primintegrate|) (663 . |union|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 10))
              (|ElementaryRischDEX2| 6 7) (669 . |risch_de_ext|)
              (|Mapping| 214 40 7) (679 . |expintegrate|)
              (|Record| (|:| |answer| 182) (|:| |a0| 7))
              (|Union| 219 '"failed") (687 . |primlogint|) (|List| 32)
              (695 . |concat|) (701 . |explogint|))
           '#(|lflogint| 709 |lfintegrate| 716 |lfinfieldint| 722 |lfextlimint|
              728 |lfextendedint| 736)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 224
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 1 12 17 0 18
                                                   2 7 0 0 11 19 2 7 20 0 21 22
                                                   2 24 0 7 23 25 1 24 0 7 26 2
                                                   24 0 0 0 27 3 24 0 0 28 0 29
                                                   2 7 0 30 0 31 7 43 39 40 7 7
                                                   7 11 41 42 44 3 49 45 46 47
                                                   48 50 2 51 7 46 12 52 2 56
                                                   53 54 55 57 2 0 53 7 11 58 2
                                                   53 0 0 0 59 1 7 60 0 61 1 7
                                                   0 60 62 0 7 0 63 2 7 10 0 0
                                                   64 1 7 60 0 65 2 7 0 0 0 66
                                                   1 7 10 0 67 1 7 0 0 68 2 7 0
                                                   0 0 69 1 53 0 7 70 0 6 0 71
                                                   1 7 0 11 72 3 53 0 7 74 76
                                                   77 0 78 0 79 2 82 81 0 12 83
                                                   1 84 23 0 85 0 6 0 86 2 23
                                                   10 0 0 87 1 84 82 0 88 0 7 0
                                                   89 2 17 7 0 40 90 1 7 21 0
                                                   91 3 7 0 0 21 0 92 0 11 0 93
                                                   3 7 0 0 0 0 94 1 53 76 0 95
                                                   1 53 74 0 96 2 7 0 0 11 97 2
                                                   7 10 0 0 98 1 24 17 0 99 2
                                                   17 10 100 0 101 1 24 23 0
                                                   102 2 24 7 0 23 103 1 24 7 0
                                                   104 1 7 0 0 105 2 7 0 106 0
                                                   107 3 24 0 0 78 7 108 1 24 7
                                                   0 109 2 7 0 0 0 110 1 53 7 0
                                                   111 1 12 0 11 112 2 113 53
                                                   28 53 114 2 53 7 0 11 115 2
                                                   7 0 0 0 116 1 7 117 0 118 2
                                                   119 10 12 0 120 1 7 121 0
                                                   122 1 12 123 0 124 1 7 0 21
                                                   125 1 7 0 40 126 1 7 127 0
                                                   128 1 127 129 0 130 1 7 81
                                                   21 131 3 51 24 7 12 24 132 1
                                                   7 40 0 133 2 40 134 0 0 135
                                                   2 40 0 0 0 136 2 7 0 0 40
                                                   137 2 7 0 14 138 139 2 40 10
                                                   0 0 140 3 141 12 12 119 11
                                                   142 3 143 53 7 12 12 144 2
                                                   14 10 0 11 145 1 7 117 0 146
                                                   0 53 0 147 2 149 148 7 7 150
                                                   1 7 0 81 151 2 24 7 0 7 152
                                                   3 7 0 0 117 138 153 4 143 37
                                                   7 12 12 7 154 4 143 34 7 12
                                                   12 17 155 2 17 0 28 0 156 2
                                                   160 159 7 11 161 4 141 53 7
                                                   11 162 163 164 2 141 119 119
                                                   11 165 1 141 12 119 166 1
                                                   167 55 46 168 1 53 10 0 169
                                                   3 7 0 0 117 138 170 2 7 10 0
                                                   11 171 1 17 7 0 172 0 23 0
                                                   173 4 174 53 7 12 12 47 175
                                                   2 12 10 0 0 176 2 167 178 46
                                                   46 179 2 56 37 54 178 180 2
                                                   167 183 46 184 185 2 56 34
                                                   54 183 186 2 12 10 0 0 189 4
                                                   49 192 46 47 193 46 194 6
                                                   196 195 40 7 7 11 41 42 197
                                                   4 49 192 46 47 198 46 199 0
                                                   46 0 200 0 55 0 201 3 205
                                                   202 203 204 11 206 3 205 202
                                                   203 204 11 208 4 49 45 46 47
                                                   211 193 212 2 141 119 119
                                                   119 213 6 215 214 40 7 7 11
                                                   41 42 216 4 49 45 46 47 211
                                                   217 218 4 49 220 46 47 193
                                                   184 221 2 222 0 0 0 223 4 49
                                                   220 46 47 198 184 224 3 0 34
                                                   7 11 17 35 2 0 53 7 11 58 2
                                                   0 187 7 11 188 4 0 37 7 11
                                                   12 119 190 3 0 37 7 11 7
                                                   38)))))
           '|lookupComplete|)) 
