
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

(DEFUN |INTEF;droponex| (|f| |a| |ka| |x| $)
  (PROG (|u| |z| |arg| |op| |k| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |f| (QREFELT $ 79)) . #1=(|INTEF;droponex|))
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ((SPADCALL
                   (LETT |op|
                         (SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 15))
                         . #1#)
                   '|%diff| (QREFELT $ 80))
                  (SEQ
                   (LETT |z|
                         (SPADCALL
                          (LETT |arg| (SPADCALL |k| (QREFELT $ 18)) . #1#)
                          (QREFELT $ 81))
                         . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |z| |a| (QREFELT $ 82))
                      (CONS 0
                            (SPADCALL |op|
                                      (LIST (|SPADfirst| |arg|)
                                            (SPADCALL |arg| (QREFELT $ 83))
                                            |x|)
                                      (QREFELT $ 85))))
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
                                                               (QREFELT $ 83))
                                                     |z|)
                                               (QREFELT $ 85))))))))))))
                 (#2#
                  (CONS 0
                        (SPADCALL |f| (LIST |ka|) (LIST |x|)
                                  (QREFELT $ 87)))))))))) 

(DEFUN |INTEF;unklimint| (|f| |x| |lu| $)
  (PROG (#1=#:G238 #2=#:G240 |c| #3=#:G241 |u|)
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
  (PROG (|f3| |nres3| |nres2| |nrat| |alpha| #1=#:G266 |nlogs| |cpol| #2=#:G267
         |lg| |logs| |nres| |f2| |dv| |k1| |args| |f1| |nfu|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nfu| (SPADCALL (SPADCALL |f| (QREFELT $ 65)) |k| (QREFELT $ 93))
              . #3=(|INTEF;diffint1|))
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |nfu| (QREFELT $ 95)) 1 (QREFELT $ 97))
           (CONS 1 "failed"))
          (#4='T
           (SEQ
            (LETT |f1|
                  (SPADCALL
                   (SPADCALL (SPADCALL |nfu| (QREFELT $ 98)) (QREFELT $ 62))
                   (SPADCALL (SPADCALL |f| (QREFELT $ 61)) (QREFELT $ 62))
                   (QREFELT $ 66))
                  . #3#)
            (LETT |args| (SPADCALL |k| (QREFELT $ 18)) . #3#)
            (EXIT
             (COND
              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 97))
               (|error| "internal error, k is not a diff"))
              (#4#
               (SEQ
                (LETT |k1|
                      (SPADCALL (SPADCALL |args| 1 (QREFELT $ 100))
                                (SPADCALL (SPADCALL |args| 2 (QREFELT $ 100))
                                          (QREFELT $ 101))
                                (SPADCALL |args| 3 (QREFELT $ 100))
                                (QREFELT $ 102))
                      . #3#)
                (LETT |dv| (SPADCALL (QREFELT $ 103)) . #3#)
                (LETT |f2|
                      (SPADCALL |f1| |k1| (SPADCALL |dv| (QREFELT $ 72))
                                (QREFELT $ 104))
                      . #3#)
                (LETT |nres| (SPADCALL |f2| |dv| (QREFELT $ 58)) . #3#)
                (COND
                 ((NULL (NULL (SPADCALL |nres| (QREFELT $ 105))))
                  (EXIT (CONS 1 "failed"))))
                (LETT |logs| (SPADCALL |nres| (QREFELT $ 106)) . #3#)
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
                              (SPADCALL |cpol| (QREFELT $ 108))
                              (QREFELT $ 110))
                             (LETT |nlogs| (CONS |lg| |nlogs|) . #3#))
                            ((SPADCALL (SPADCALL |cpol| (QREFELT $ 111)) 1
                                       (QREFELT $ 97))
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #1#)))
                            ('T
                             (SEQ
                              (LETT |alpha|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |cpol| 0 (QREFELT $ 112))
                                      (SPADCALL |cpol| (QREFELT $ 113))
                                      (QREFELT $ 66))
                                     (QREFELT $ 114))
                                    . #3#)
                              (EXIT
                               (LETT |nrat|
                                     (SPADCALL |nrat|
                                               (SPADCALL
                                                (SPADCALL (QVELT |lg| 0)
                                                          |alpha|
                                                          (QREFELT $ 116))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL (QVELT |lg| 2)
                                                            (QREFELT $ 90)
                                                            |alpha|
                                                            (QREFELT $ 117))
                                                  (QREFELT $ 118))
                                                 (QREFELT $ 68))
                                                (QREFELT $ 69))
                                               (QREFELT $ 119))
                                     . #3#)))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (LETT |nres2|
                      (SPADCALL
                       (SPADCALL (SPADCALL |nres| (QREFELT $ 120)) |nrat|
                                 (QREFELT $ 119))
                       (NREVERSE |nlogs|) NIL (QREFELT $ 77))
                      . #3#)
                (LETT |nres3|
                      (SPADCALL
                       (CONS #'|INTEF;diffint1!1| (VECTOR |k1| $ |dv|)) |nres2|
                       (QREFELT $ 123))
                      . #3#)
                (LETT |f3|
                      (SPADCALL |f| (SPADCALL |nres3| |x| (QREFELT $ 124))
                                (QREFELT $ 125))
                      . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |k| (SPADCALL |f3| (QREFELT $ 126))
                             (QREFELT $ 128))
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
      (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 121)) |k1| (QREFELT $ 102)))))) 

(DEFUN |INTEF;diffint1!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTEF;diffint1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x1| |x| (QREFELT $ 107)) (|spadConstant| $ 63)
                (QREFELT $ 82)))))) 

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
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 79)) . #1=(|INTEF;isx?|))
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 (#2='T
                  (SEQ (LETT |r| (SPADCALL (QCDR |k|) (QREFELT $ 130)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r| 1) 'NIL)
                              (#2# (EQUAL (QCDR |r|) |x|)))))))))))) 

(DEFUN |INTEF;alg_split_root0| (|f| |r| |n| $)
  (PROG (#1=#:G289 |i| #2=#:G288 |q| |f1| |f0| |ef|)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 2)
        (SEQ
         (LETT |ef|
               (SPADCALL |f| |r|
                         (SPADCALL (SPADCALL |r| (QREFELT $ 131))
                                   (QREFELT $ 114))
                         (QREFELT $ 102))
               . #3=(|INTEF;alg_split_root0|))
         (LETT |f0|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 119))
                         (SPADCALL 2 (QREFELT $ 132)) (QREFELT $ 66))
               . #3#)
         (LETT |f1|
               (SPADCALL (SPADCALL |f| |ef| (QREFELT $ 125))
                         (SPADCALL 2 (QREFELT $ 132)) (QREFELT $ 66))
               . #3#)
         (EXIT
          (COND
           ((SPADCALL |r| (SPADCALL |f0| (QREFELT $ 126)) (QREFELT $ 128))
            (SEQ (SPADCALL (SPADCALL |f0| (QREFELT $ 134)) (QREFELT $ 136))
                 (EXIT (|error| "alg_split_root0: roots did not cancel 1"))))
           (#4='T
            (SEQ
             (LETT |f1|
                   (SPADCALL |f1| (SPADCALL |r| (QREFELT $ 131))
                             (QREFELT $ 66))
                   . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f1| (QREFELT $ 126)) (QREFELT $ 128))
                (SEQ (SPADCALL (SPADCALL |f1| (QREFELT $ 134)) (QREFELT $ 136))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
               (#4# (LIST |f0| |f1|))))))))))
       (#4#
        (SEQ
         (LETT |q|
               (SPADCALL |f| |r| (SPADCALL |r| (QREFELT $ 137))
                         (QREFELT $ 138))
               . #3#)
         (EXIT
          (PROGN
           (LETT #2# NIL . #3#)
           (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 112)) #2#)
                        . #3#)))
                (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |INTEF;alg_split_roots| (|f| |r1| |r2| $)
  (PROG (|res| |nrr| |nr| |bb2| #1=#:G292 |bb1| |nn| |np2| |nn2| |g2| #2=#:G303
         |f2| #3=#:G304 |pow2| |np1| |nn1| |g1| |l2| #4=#:G301 |f1| #5=#:G302
         |pow1| |rop| |l1| |b2| |n2| |b1| |n1| |a2| |a1|)
    (RETURN
     (SEQ
      (LETT |a1| (SPADCALL |r1| (QREFELT $ 18)) . #6=(|INTEF;alg_split_roots|))
      (LETT |a2| (SPADCALL |r2| (QREFELT $ 18)) . #6#)
      (LETT |n1| (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 100)) (QREFELT $ 139))
            . #6#)
      (LETT |b1| (SPADCALL |a1| 1 (QREFELT $ 100)) . #6#)
      (LETT |n2| (SPADCALL (SPADCALL |a2| 2 (QREFELT $ 100)) (QREFELT $ 139))
            . #6#)
      (LETT |b2| (SPADCALL |a2| 1 (QREFELT $ 100)) . #6#)
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
              ((SPADCALL |f1| (|spadConstant| $ 63) (QREFELT $ 82)) "iterate")
              ('T
               (SEQ
                (LETT |l2| (|INTEF;alg_split_root0| |f1| |r2| |n2| $) . #6#)
                (LETT |g1| (GCD |n1| |pow1|) . #6#)
                (LETT |nn1|
                      (PROG2
                          (LETT #1# (SPADCALL |n1| |g1| (QREFELT $ 141)) . #6#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                      . #6#)
                (LETT |np1|
                      (PROG2
                          (LETT #1# (SPADCALL |pow1| |g1| (QREFELT $ 141))
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
                         ((SPADCALL |f2| (|spadConstant| $ 63) (QREFELT $ 82))
                          "iterate")
                         ('T
                          (SEQ (LETT |g2| (GCD |n2| |pow2|) . #6#)
                               (LETT |nn2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |n2| |g2|
                                                         (QREFELT $ 141))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |np2|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |pow2| |g2|
                                                         (QREFELT $ 141))
                                               . #6#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#))
                                     . #6#)
                               (LETT |nn|
                                     (SPADCALL |nn1| |nn2| (QREFELT $ 142))
                                     . #6#)
                               (LETT |bb1|
                                     (SPADCALL |b1|
                                               (* |np1|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn1|
                                                                      (QREFELT
                                                                       $ 141))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 143))
                                     . #6#)
                               (LETT |bb2|
                                     (SPADCALL |b2|
                                               (* |np2|
                                                  (PROG2
                                                      (LETT #1#
                                                            (SPADCALL |nn|
                                                                      |nn2|
                                                                      (QREFELT
                                                                       $ 141))
                                                            . #6#)
                                                      (QCDR #1#)
                                                    (|check_union|
                                                     (QEQCAR #1# 0) (|Integer|)
                                                     #1#)))
                                               (QREFELT $ 143))
                                     . #6#)
                               (LETT |nr|
                                     (SPADCALL |rop|
                                               (LIST
                                                (SPADCALL |bb1| |bb2|
                                                          (QREFELT $ 69))
                                                (SPADCALL |nn|
                                                          (QREFELT $ 132)))
                                               (QREFELT $ 144))
                                     . #6#)
                               (LETT |nrr|
                                     (COND
                                      ((SPADCALL (+ |pow1| |pow2|) 0
                                                 (QREFELT $ 145))
                                       |nr|)
                                      ('T (|spadConstant| $ 99)))
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
  (PROG (|y| |rec| |res| |ir1| |oroot| #1=#:G325 |al| |kx| |xf|)
    (RETURN
     (SEQ (LETT |xf| (SPADCALL |x| (QREFELT $ 72)) . #2=(|INTEF;alglfint|))
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL
               (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 147)) . #2#)
               (QREFELT $ 130))
              0)
             (|INTEF;addx| (SPADCALL |f| |kx| |k| (QREFELT $ 149)) |xf| $))
            ((SPADCALL |kx| '|exp| (QREFELT $ 13))
             (|INTEF;addx| (|INTEF;algexpint| |f| |kx| |k| |x| $) |xf| $))
            ((|INTEF;prim?| |kx| |x| $)
             (|INTEF;addx| (|INTEF;algprimint| |f| |kx| |k| |x| $) |xf| $))
            ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9)
                       (QREFELT $ 16))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                          (QREFELT $ 80))
                (COND
                 ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) '|nthRoot|
                            (QREFELT $ 80))
                  (COND
                   ((NULL
                     (SPADCALL |kx|
                               (SPADCALL (SPADCALL |k| (QREFELT $ 131))
                                         (QREFELT $ 150))
                               (QREFELT $ 128)))
                    (EXIT
                     (SEQ
                      (LETT |al| (|INTEF;alg_split_roots| |f| |k| |kx| $)
                            . #2#)
                      (LETT |res| (|spadConstant| $ 151) . #2#)
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
                                        (QREFELT $ 145))
                              (SEQ
                               (LETT |oroot|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 131))
                                                (QVELT |rec| 2)
                                                (QREFELT $ 143))
                                      (SPADCALL (SPADCALL |kx| (QREFELT $ 131))
                                                (QVELT |rec| 3)
                                                (QREFELT $ 143))
                                      (QREFELT $ 69))
                                     . #2#)
                               (EXIT
                                (LETT |ir1|
                                      (SPADCALL
                                       (CONS #'|INTEF;alglfint!0|
                                             (VECTOR |oroot| $ |rec|))
                                       |ir1| (QREFELT $ 123))
                                      . #2#)))))
                            (EXIT
                             (LETT |res| (SPADCALL |res| |ir1| (QREFELT $ 59))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |res|)))))))))
              (LETT |rec|
                    (SPADCALL (SPADCALL |kx| (QREFELT $ 131))
                              (SPADCALL |k| (QREFELT $ 131)) (QREFELT $ 154))
                    . #2#)
              (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 155)) . #2#)
              (EXIT
               (SPADCALL (CONS #'|INTEF;alglfint!1| (VECTOR |rec| $ |y|))
                         (SPADCALL
                          (SPADCALL |f| (LIST |kx| |k|)
                                    (LIST
                                     (SPADCALL (QVELT |rec| 1) |y|
                                               (QREFELT $ 156))
                                     (SPADCALL (QVELT |rec| 2) |y|
                                               (QREFELT $ 156)))
                                    (QREFELT $ 87))
                          |x| (QREFELT $ 58))
                         (QREFELT $ 123)))))
            ('T (|INTEF;unknownint| |f| |x| $)))))))) 

(DEFUN |INTEF;alglfint!1| (|x1| $$)
  (PROG (|y| $ |rec|)
    (LETT |y| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |rec| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |y| (QREFELT $ 101)) (QVELT |rec| 0)
                (QREFELT $ 102)))))) 

(DEFUN |INTEF;alglfint!0| (|x1| $$)
  (PROG (|rec| $ |oroot|)
    (LETT |rec| (QREFELT $$ 2) . #1=(|INTEF;alglfint|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |oroot| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL (QVELT |rec| 1) (QREFELT $ 101)) |oroot|
                (QREFELT $ 102)))))) 

(DEFUN |INTEF;alglfextint| (|f| |k| |l| |x| |g| $)
  (PROG (|r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 147))
                . #1=(|INTEF;alglfextint|))
          (QREFELT $ 130))
         0)
        (SPADCALL |f| |kx| |k| |g| (QREFELT $ 157)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 131))
                         (SPADCALL |k| (QREFELT $ 131)) (QREFELT $ 154))
               . #1#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 155)) . #1#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 156))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 156)))
               . #1#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 87))
                         |x|
                         (SPADCALL |g| (LIST |kx| |k|) |lrhs| (QREFELT $ 87))
                         (QREFELT $ 38))
               . #1#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 101)) . #1#)
                      (LETT |r| (QCDR |u|) . #1#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 102))
                              (SPADCALL (QCDR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 102)))))))))))
       ((OR (SPADCALL |kx| '|exp| (QREFELT $ 13))
            (SPADCALL |kx| '|log| (QREFELT $ 13)))
        (|error| "failed - cannot handle that integrand"))
       ('T (|INTEF;unkextint| |f| |x| |g| $))))))) 

(DEFUN |INTEF;alglflimint| (|f| |k| |l| |x| |lu| $)
  (PROG (#1=#:G362 |rc| #2=#:G361 |r| |ky| |u| |lrhs| |y| |rec| |kx|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR
         (SPADCALL
          (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT $ 147))
                . #3=(|INTEF;alglflimint|))
          (QREFELT $ 130))
         0)
        (SPADCALL |f| |kx| |k| |lu| (QREFELT $ 158)))
       ((SPADCALL (SPADCALL |kx| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (SEQ
         (LETT |rec|
               (SPADCALL (SPADCALL |kx| (QREFELT $ 131))
                         (SPADCALL |k| (QREFELT $ 131)) (QREFELT $ 154))
               . #3#)
         (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 155)) . #3#)
         (LETT |lrhs|
               (LIST (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 156))
                     (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 156)))
               . #3#)
         (LETT |u|
               (SPADCALL (SPADCALL |f| (LIST |kx| |k|) |lrhs| (QREFELT $ 87))
                         |x|
                         (SPADCALL
                          (CONS #'|INTEF;alglflimint!0|
                                (VECTOR $ |lrhs| |k| |kx|))
                          |lu| (QREFELT $ 159))
                         (QREFELT $ 35))
               . #3#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |ky| (SPADCALL |y| (QREFELT $ 101)) . #3#)
                      (LETT |r| (QCDR |u|) . #3#)
                      (EXIT
                       (CONS 0
                             (CONS
                              (SPADCALL (QCAR |r|) |ky| (QVELT |rec| 0)
                                        (QREFELT $ 102))
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
                                                        (QREFELT $ 102))
                                              (SPADCALL (QCDR |rc|) |ky|
                                                        (QVELT |rec| 0)
                                                        (QREFELT $ 102)))
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
    (RETURN (PROGN (SPADCALL |x1| (LIST |kx| |k|) |lrhs| (QREFELT $ 87)))))) 

(DEFUN |INTEF;lfintegrate;FSIr;15| (|f| |x| $)
  (SPADCALL |f| |x| (CONS (|function| |INTEF;lfintegrate0|) $) (ELT $ 164)
            (QREFELT $ 167))) 

(DEFUN |INTEF;lfintegrate;FSIr;16| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;17| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate;FSIr;18| (|f| |x| $) (|INTEF;lfintegrate0| |f| |x| $)) 

(DEFUN |INTEF;lfintegrate0| (|f| |x| $)
  (PROG (|k| |l| |xf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 67)) (|spadConstant| $ 151))
            (#1='T
             (SEQ
              (LETT |xf| (SPADCALL |x| (QREFELT $ 72))
                    . #2=(|INTEF;lfintegrate0|))
              (EXIT
               (COND
                ((NULL
                  (LETT |l|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 126)) |x|
                                  (QREFELT $ 168))
                        . #2#))
                 (SPADCALL (SPADCALL |xf| |f| (QREFELT $ 69)) (QREFELT $ 70)))
                ((QEQCAR
                  (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 169)) . #2#)
                            (QREFELT $ 130))
                  0)
                 (SPADCALL (CONS #'|INTEF;lfintegrate0!0| (VECTOR $ |k|))
                           (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                                     (QREFELT $ 171))
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
  (PROG (#1=#:G397 |ne| #2=#:G396)
    (RETURN
     (SEQ
      (COND ((SPADCALL |i| (QREFELT $ 172)) |i|)
            ('T
             (SPADCALL (SPADCALL |i| (QREFELT $ 120))
                       (SPADCALL |i| (QREFELT $ 106))
                       (PROGN
                        (LETT #2# NIL . #3=(|INTEF;addx|))
                        (SEQ (LETT |ne| NIL . #3#)
                             (LETT #1# (SPADCALL |i| (QREFELT $ 105)) . #3#)
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
     (SEQ (LETT |z| (SPADCALL (QREFELT $ 103)) . #1=(|INTEF;tryChangeVar|))
          (LETT |g|
                (SPADCALL
                 (SPADCALL |f|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 131)) |x|
                                     (QREFELT $ 19))
                           (QREFELT $ 66))
                 (LIST |t|) (LIST (SPADCALL |z| (QREFELT $ 72)))
                 (QREFELT $ 173))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |g| |x| (QREFELT $ 174))
             (CONS 0
                   (SPADCALL (CONS #'|INTEF;tryChangeVar!0| (VECTOR |t| $ |z|))
                             (SPADCALL |g| |z| (QREFELT $ 58))
                             (QREFELT $ 123))))
            ('T (CONS 1 "failed")))))))) 

(DEFUN |INTEF;tryChangeVar!0| (|x1| $$)
  (PROG (|z| $ |t|)
    (LETT |z| (QREFELT $$ 2) . #1=(|INTEF;tryChangeVar|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |t| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x1| (SPADCALL |z| (QREFELT $ 121))
                (SPADCALL |t| (QREFELT $ 131)) (QREFELT $ 102)))))) 

(DEFUN |INTEF;algexpint| (|f| |t| |y| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (|INTEF;tryChangeVar| |f| |t| |x| $) |INTEF;algexpint|)
          (EXIT
           (COND ((QEQCAR |u| 0) (QCDR |u|))
                 ('T
                  (SPADCALL |f| |t| |y|
                            (CONS #'|INTEF;algexpint!1| (VECTOR |t| |x| $))
                            (QREFELT $ 178))))))))) 

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
                     (SPADCALL (SPADCALL |t| (QREFELT $ 18)) (QREFELT $ 175))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 176) (QREFELT $ 25))
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
                            (QREFELT $ 178))))))))) 

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
                    (SPADCALL (SPADCALL |t| (QREFELT $ 131)) |x|
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
               (SPADCALL (SPADCALL |f| (QREFELT $ 126)) |x| (QREFELT $ 168))
               . #1=(|INTEF;lfextendedint;FSFU;24|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 72)) |f| (QREFELT $ 69))
                    (|spadConstant| $ 63))))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 169)) . #1#)
                   (QREFELT $ 130))
         0)
        (SEQ
         (LETT |g1|
               (COND
                ((OR
                  (NULL
                   (LETT |l1|
                         (SPADCALL (SPADCALL |g| (QREFELT $ 126)) |x|
                                   (QREFELT $ 168))
                         . #1#))
                  (NULL
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 169)) |k|
                             (QREFELT $ 179))))
                 (|spadConstant| $ 63))
                ('T |g|))
               . #1#)
         (EXIT
          (SPADCALL (CONS #'|INTEF;lfextendedint;FSFU;24!0| (VECTOR $ |k|))
                    (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                              (SPADCALL |g1| |k| (QREFELT $ 22))
                              (QREFELT $ 182))
                    (QREFELT $ 183)))))
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

(DEFUN |INTEF;lflimitedint;FSLU;25| (|f| |x| |lu| $)
  (PROG (#1=#:G457 |u| #2=#:G456 |k| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l|
               (SPADCALL (SPADCALL |f| (QREFELT $ 126)) |x| (QREFELT $ 168))
               . #3=(|INTEF;lflimitedint;FSLU;25|)))
        (CONS 0
              (CONS (SPADCALL (SPADCALL |x| (QREFELT $ 72)) |f| (QREFELT $ 69))
                    NIL)))
       ((QEQCAR
         (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT $ 169)) . #3#)
                   (QREFELT $ 130))
         0)
        (SPADCALL (CONS #'|INTEF;lflimitedint;FSLU;25!0| (VECTOR $ |k|))
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
                            (QREFELT $ 188))
                  (QREFELT $ 189)))
       ((SPADCALL |k| '|exp| (QREFELT $ 13))
        (|INTEF;explimint| |f| |x| |k| |lu| $))
       ((|INTEF;prim?| |k| |x| $) (|INTEF;primlimint| |f| |x| |k| |lu| $))
       ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9) (QREFELT $ 16))
        (|INTEF;alglflimint| |f| |k| |l| |x| |lu| $))
       ('T (|INTEF;unklimint| |f| |x| |lu| $))))))) 

(DEFUN |INTEF;lflimitedint;FSLU;25!0| (|x1| $$)
  (PROG (|k| $)
    (LETT |k| (QREFELT $$ 1) . #1=(|INTEF;lflimitedint;FSLU;25|))
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
  (PROG (|u2| |u1| |lk| #1=#:G489 |a| #2=#:G488)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primextint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 150)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 192))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 168))
            . #3#)
      (LETT |u1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primextint!1| (VECTOR |k| |x| $))
                      (CONS #'|INTEF;primextint!2| (VECTOR $ |lk| |k| |x|))
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 197))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 119))
                              (QCDR (QCDR |u2|))))))))))))))) 

(DEFUN |INTEF;primextint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primextint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 193)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 131)) |x|
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
                      (SPADCALL |g| |k| (QREFELT $ 22)) (QREFELT $ 202))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 119))
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
                   (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 175))
                   |x4| |x| (CONS #'|INTEF;expextint!2| (VECTOR $ |x|))
                   (CONS #'|INTEF;expextint!3| (VECTOR $ |x|))
                   (QREFELT $ 200)))))))) 

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
                     (SPADCALL (SPADCALL |k| (QREFELT $ 18)) (QREFELT $ 175))
                     |x| (QREFELT $ 19))
                    (|spadConstant| $ 176) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expextint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;denint_dummy| (|f| $)
  (VECTOR (|spadConstant| $ 203) |f| (|spadConstant| $ 204))) 

(DEFUN |INTEF;primint| (|f| |x| |k| $)
  (PROG (|r1| |denint| |lk| #1=#:G565 |a| #2=#:G564)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|INTEF;primint|))
              (SEQ (LETT |a| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 150)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 192))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#4='T 'NIL))
                       (LETT #2# (CONS |a| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 168))
            . #3#)
      (LETT |denint|
            (COND
             ((SPADCALL |k| '|log| (QREFELT $ 13))
              (CONS #'|INTEF;primint!0| (VECTOR (QREFELT $ 210) |x| |k|)))
             (#4# (CONS (|function| |INTEF;denint_dummy|) $)))
            . #3#)
      (LETT |r1|
            (SPADCALL (SPADCALL |f| |k| (QREFELT $ 22))
                      (CONS #'|INTEF;primint!2| (VECTOR |k| |x| $)) |denint|
                      (CONS #'|INTEF;primint!3| (VECTOR $ |lk| |k| |x|))
                      (QREFELT $ 215))
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
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 193)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 131)) |x|
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
  (PROG (#1=#:G584 #2=#:G583 #3=#:G585 #4=#:G595 |c| |cf| |u2| #5=#:G594 |u|
         #6=#:G593 |lg| #7=#:G592 |kk| #8=#:G591 |twr| #9=#:G589 |u1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u1|
               (SPADCALL |f| |x|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 131)) |x|
                                   (QREFELT $ 19))
                         (QREFELT $ 38))
               . #10=(|INTEF;lfextlimint;FSKLU;31|))
         (EXIT
          (COND
           ((NULL (QEQCAR |u1| 1)) (PROGN (LETT #9# |u1| . #10#) (GO #9#))))))
        (LETT |twr| (SPADCALL |f| (QREFELT $ 150)) . #10#)
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
                            ((COND ((SPADCALL |kk| |twr| (QREFELT $ 128)) 'NIL)
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
                                                  (QREFELT $ 216))
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
                                                            (QREFELT $ 131))
                                                  (QREFELT $ 69))
                                        (QREFELT $ 125))
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
                                                         (QREFELT $ 119))
                                               . #10#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #10#)
                                          (LETT #1# 'T . #10#)))))))
                                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#11# (|spadConstant| $ 63))))
                              (QREFELT $ 119))
                             |cf|)))))))))))))
      #9# (EXIT #9#))))) 

(DEFUN |INTEF;cfind| (|f| |l| $)
  (PROG (#1=#:G598 #2=#:G600 #3=#:G601 |u|)
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
                  ((SPADCALL |f| (QCDR |u|) (QREFELT $ 82))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (QCAR |u|) . #4#) (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|spadConstant| $ 63))))
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
                            (VECTOR (QREFELT $ 212) |x| |k|))
                      (CONS #'|INTEF;expint!5| (VECTOR $ |x| |eta|))
                      (QREFELT $ 217))
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
                   (QREFELT $ 200)))))))) 

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
                             (|spadConstant| $ 176) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;expint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;primlimint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G655 |lg| #2=#:G654 |u1| #3=#:G653 |u| #4=#:G652 |lk|
         #5=#:G651 |a| #6=#:G650)
    (RETURN
     (SEQ
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #6# NIL . #7=(|INTEF;primlimint|))
              (SEQ (LETT |a| NIL . #7#)
                   (LETT #5# (SPADCALL |f| (QREFELT $ 150)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND
                        ((SPADCALL |k| |a| (QREFELT $ 192))
                         (SPADCALL |a| '|log| (QREFELT $ 13)))
                        (#8='T 'NIL))
                       (LETT #6# (CONS |a| #6#) . #7#)))))
                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                   (EXIT (NREVERSE #6#))))
             |x| (QREFELT $ 168))
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
                      (QREFELT $ 220))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 119))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 222))))))))))))))) 

(DEFUN |INTEF;primlimint!2| (|x3| $$)
  (PROG (|x| |k| |lk| $)
    (LETT |x| (QREFELT $$ 3) . #1=(|INTEF;primlimint|))
    (LETT |k| (QREFELT $$ 2) . #1#)
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x3| |x| |k| |lk| (QREFELT $ 193)))))) 

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
                    (SPADCALL (SPADCALL |k| (QREFELT $ 131)) |x|
                              (QREFELT $ 19))
                    (QREFELT $ 26))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;primlimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |INTEF;explimint| (|f| |x| |k| |lu| $)
  (PROG (|u2| |l| #1=#:G685 |lg| #2=#:G684 |u1| #3=#:G683 |u| #4=#:G682 |eta|)
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
                      (QREFELT $ 223))
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
                               (QCAR (QCDR |u2|)) (QREFELT $ 119))
                              (SPADCALL (QCDR (QCDR |u2|)) |l|
                                        (QREFELT $ 222))))))))))))))) 

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
                   (QREFELT $ 200)))))))) 

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
                             (|spadConstant| $ 176) (QREFELT $ 25))
                   (QREFELT $ 29)))))))) 

(DEFUN |INTEF;explimint!0| (|x2| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |x| (QREFELT $ 19)))))) 

(DEFUN |ElementaryIntegration| (&REST #1=#:G686)
  (PROG ()
    (RETURN
     (PROG (#2=#:G687)
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
       (LETT $ (GETREFV 224) . #1#)
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
       (QSETREFV $ 90 (SPADCALL (QREFELT $ 89)))
       (COND
        ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
         (COND
          ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
           (PROGN
            (QSETREFV $ 160
                      (COND
                       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
                        (|HasCategory| |#2| '(|RetractableTo| (|Symbol|))))
                       ('T 'NIL)))
            (COND
             ((QREFELT $ 160)
              (PROGN
               (QSETREFV $ 58
                         (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;15|)
                               $))))
             ('T
              (QSETREFV $ 58
                        (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;16|)
                              $))))))
          ('T
           (QSETREFV $ 58
                     (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;17|)
                           $)))))
        ('T
         (QSETREFV $ 58
                   (CONS (|dispatchFunction| |INTEF;lfintegrate;FSIr;18|) $))))
       (QSETREFV $ 210
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 209))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 209))))))
                  (EXIT (CONS #'|ElementaryIntegration!0| $))))
       (QSETREFV $ 212
                 (SEQ
                  (COND
                   ((|domainEqual| |#1| (|Integer|))
                    (COND
                     ((|domainEqual| |#2| (|Expression| (|Integer|)))
                      (EXIT (ELT $ 211))))))
                  (COND
                   ((|domainEqual| |#1| (|Complex| (|Integer|)))
                    (COND
                     ((|domainEqual| |#2|
                                     (|Expression| (|Complex| (|Integer|))))
                      (EXIT (ELT $ 211))))))
                  (EXIT (CONS #'|ElementaryIntegration!1| $))))
       $))))) 

(DEFUN |ElementaryIntegration!1| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(DEFUN |ElementaryIntegration!0| (|rf| |k| |x| $) (|INTEF;denint_dummy| |rf| $)) 

(MAKEPROP '|ElementaryIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (|List| 7)
              (17 . |argument|) (22 . |differentiate|) (|Fraction| 91)
              (|Kernel| $) (28 . |univariate|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (34 . |monomial|)
              (40 . |coerce|) (45 . +) (|Mapping| 7 7) (51 . |differentiate|)
              (|PositiveInteger|) (58 . *)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| 221))
              (|Union| 33 '"failed") |INTEF;lflimitedint;FSLU;25|
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 36 '"failed") |INTEF;lfextendedint;FSFU;24|
              (|Union| 17 '"failed") (|Integer|) (|Mapping| 34 7 17)
              (|Mapping| 37 7 7) (|ElementaryRischDESystem| 6 7)
              (64 . |rischDEsys|) (|Record| (|:| |answer| 55) (|:| |a0| 7))
              (|Fraction| 24) (|Mapping| 24 24) (|Mapping| 39 40 7 7)
              (|TranscendentalIntegration| 7 24) (75 . |tanintegrate|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6 92 7)
              (82 . |multivariate|) (|IntegrationResult| 7) (|Mapping| 7 46)
              (|IntegrationResult| 46) (|IntegrationResultFunctions2| 46 7)
              (88 . |map|) (94 . |lfintegrate|) (100 . +)
              (|SparseMultivariatePolynomial| 6 21) (106 . |denom|)
              (111 . |coerce|) (116 . |Zero|) (120 . ~=) (126 . |numer|)
              (131 . /) (137 . |zero?|) (142 . |log|) (147 . *)
              (153 . |coerce|) (158 . |Zero|) (162 . |coerce|)
              (|Record| (|:| |scalar| 115) (|:| |coeff| 24) (|:| |logand| 24))
              (|List| 73) (|Record| (|:| |integrand| 7) (|:| |intvar| 7))
              (|List| 75) (167 . |mkAnswer|) (|Union| 21 '"failed")
              (174 . |retractIfCan|) (179 . |is?|) (185 . |third|) (190 . =)
              (196 . |second|) (|List| $) (201 . |elt|) (|List| 21)
              (207 . |eval|) (|SingletonAsOrderedSet|) (214 . |create|)
              '|dummy| (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 12) (218 . |univariate|)
              (|SparseUnivariatePolynomial| 92) (224 . |degree|) (229 . |One|)
              (233 . ~=) (239 . |leadingCoefficient|) (244 . |One|)
              (248 . |elt|) (254 . |retract|) (259 . |eval|) (266 . |new|)
              (270 . |eval|) (277 . |notelem|) (282 . |logpart|) (287 . D)
              (293 . |coefficients|) (|Mapping| 10 7) (298 . |every?|)
              (304 . |degree|) (309 . |coefficient|)
              (315 . |leadingCoefficient|) (320 . -) (|Fraction| 40) (325 . *)
              (331 . |eval|) (338 . |retract|) (343 . +) (349 . |ratpart|)
              (354 . |kernel|) (|IntegrationResultFunctions2| 7 7)
              (359 . |map|) (365 . |differentiate|) (371 . -) (377 . |kernels|)
              (|List| 12) (382 . |member?|) (|Union| 11 '"failed")
              (388 . |symbolIfCan|) (393 . |coerce|) (398 . |coerce|)
              (|OutputForm|) (403 . |coerce|) (|Void|) (408 . |print|)
              (413 . |minPoly|) (418 . |univariate|) (425 . |retract|)
              (|Union| $ '"failed") (430 . |exquo|) (436 . |lcm|) (442 . ^)
              (448 . |kernel|) (454 . >) (|IntegrationTools| 6 7)
              (460 . |ksec|) (|PureAlgebraicIntegration| 6 7 7)
              (467 . |palgint|) (474 . |tower|) (479 . |Zero|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 24) (|:| |pol2| 24)
                        (|:| |prim| 24))
              (|FunctionSpacePrimitiveElement| 6 7) (483 . |primitiveElement|)
              (489 . |rootOf|) (494 . |elt|) (500 . |palgextint|)
              (508 . |palglimint|) (516 . |map|) '#:G159
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 161 '"failed") (|PatternMatchIntegration| 6 7)
              (522 . |pmintegrate|) (|Mapping| 53 7 11) (|Mapping| 162 7 11)
              (528 . |intPatternMatch|) (536 . |varselect|) (542 . |kmax|)
              (|RationalIntegration| 7 24) (547 . |integrate|) (552 . |elem?|)
              (557 . |subst|) (564 . |freeOf?|) (570 . |first|) (575 . |One|)
              (|AlgebraicIntegration| 6 7) (579 . |algint|) (587 . =)
              (|Record| (|:| |ratpart| 46) (|:| |coeff| 46))
              (|Union| 180 '"failed") (593 . |extendedint|) (599 . |map|)
              (|Record| (|:| |coeff| 46) (|:| |logand| 46))
              (|Record| (|:| |mainpart| 46) (|:| |limitedlogs| (|List| 184)))
              (|Union| 185 '"failed") (|List| 46) (605 . |limitedint|)
              (611 . |map|) (|Union| 7 '"failed") |INTEF;lfinfieldint;FSU;26|
              (617 . ~=) |INTEF;lfextlimint;FSKLU;31|
              (|Record| (|:| |answer| 46) (|:| |a0| 7))
              (|Union| 194 180 '"failed") (|Mapping| 37 7)
              (623 . |primextendedint|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |sol?| 10))
              (|ElementaryRischDE| 6 7) (631 . |rischDE|) (|Mapping| 198 40 7)
              (641 . |expextendedint|) (649 . |Zero|) (653 . |Zero|)
              (|Record| (|:| |answer| 206) (|:| |logpart| 206)
                        (|:| |ir| (|IntegrationResult| 206)))
              (|Fraction| (|SparseUnivariatePolynomial| (|Expression| 6)))
              (|Kernel| (|Expression| 6)) (|DenominatorIntegration| 6)
              (657 . |li_int|) '|denint_li| (664 . |poly_int|) '|denint_poly|
              (|Record| (|:| |answer| 46) (|:| |logpart| 46) (|:| |ir| 55))
              (|Mapping| 213 46) (671 . |primintegrate|) (679 . |union|)
              (685 . |expintegrate|) (|Record| (|:| |answer| 185) (|:| |a0| 7))
              (|Union| 218 '"failed") (693 . |primlimitedint|) (|List| 32)
              (701 . |concat|) (707 . |explimitedint|))
           '#(|lflimitedint| 715 |lfintegrate| 722 |lfinfieldint| 728
              |lfextlimint| 734 |lfextendedint| 742)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 223
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
                                                   77 1 7 78 0 79 2 14 10 0 11
                                                   80 1 17 7 0 81 2 7 10 0 0 82
                                                   1 17 7 0 83 2 7 0 14 84 85 3
                                                   7 0 0 86 84 87 0 88 0 89 2
                                                   92 91 0 12 93 1 94 23 0 95 0
                                                   6 0 96 2 23 10 0 0 97 1 94
                                                   92 0 98 0 7 0 99 2 17 7 0 40
                                                   100 1 7 21 0 101 3 7 0 0 21
                                                   0 102 0 11 0 103 3 7 0 0 0 0
                                                   104 1 53 76 0 105 1 53 74 0
                                                   106 2 7 0 0 11 107 1 24 17 0
                                                   108 2 17 10 109 0 110 1 24
                                                   23 0 111 2 24 7 0 23 112 1
                                                   24 7 0 113 1 7 0 0 114 2 7 0
                                                   115 0 116 3 24 0 0 88 7 117
                                                   1 24 7 0 118 2 7 0 0 0 119 1
                                                   53 7 0 120 1 12 0 11 121 2
                                                   122 53 28 53 123 2 53 7 0 11
                                                   124 2 7 0 0 0 125 1 7 86 0
                                                   126 2 127 10 12 0 128 1 12
                                                   129 0 130 1 7 0 21 131 1 7 0
                                                   40 132 1 7 133 0 134 1 133
                                                   135 0 136 1 7 91 21 137 3 51
                                                   24 7 12 24 138 1 7 40 0 139
                                                   2 40 140 0 0 141 2 40 0 0 0
                                                   142 2 7 0 0 40 143 2 7 0 14
                                                   84 144 2 40 10 0 0 145 3 146
                                                   12 12 127 11 147 3 148 53 7
                                                   12 12 149 1 7 86 0 150 0 53
                                                   0 151 2 153 152 7 7 154 1 7
                                                   0 91 155 2 24 7 0 7 156 4
                                                   148 37 7 12 12 7 157 4 148
                                                   34 7 12 12 17 158 2 17 0 28
                                                   0 159 2 163 162 7 11 164 4
                                                   146 53 7 11 165 166 167 2
                                                   146 127 127 11 168 1 146 12
                                                   127 169 1 170 55 46 171 1 53
                                                   10 0 172 3 7 0 0 86 84 173 2
                                                   7 10 0 11 174 1 17 7 0 175 0
                                                   23 0 176 4 177 53 7 12 12 47
                                                   178 2 12 10 0 0 179 2 170
                                                   181 46 46 182 2 56 37 54 181
                                                   183 2 170 186 46 187 188 2
                                                   56 34 54 186 189 2 12 10 0 0
                                                   192 4 49 195 46 47 196 46
                                                   197 6 199 198 40 7 7 11 41
                                                   42 200 4 49 195 46 47 201 46
                                                   202 0 46 0 203 0 55 0 204 3
                                                   208 205 206 207 11 209 3 208
                                                   205 206 207 11 211 4 49 45
                                                   46 47 214 196 215 2 146 127
                                                   127 127 216 4 49 45 46 47
                                                   214 201 217 4 49 219 46 47
                                                   196 187 220 2 221 0 0 0 222
                                                   4 49 219 46 47 201 187 223 3
                                                   0 34 7 11 17 35 2 0 53 7 11
                                                   58 2 0 190 7 11 191 4 0 37 7
                                                   11 12 127 193 3 0 37 7 11 7
                                                   38)))))
           '|lookupComplete|)) 
