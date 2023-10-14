
(/VERSIONCHECK 2) 

(DEFUN |INTDEN;MP_to_UP| (|p| |k| $)
  (PROG (|up1|)
    (RETURN
     (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 9)) |INTDEN;MP_to_UP|)
          (EXIT (SPADCALL (ELT $ 12) |up1| (QREFELT $ 17))))))) 

(DEFUN |INTDEN;li_factors| (|df| |k| |lk| |x| $)
  (PROG (|res| |f2| |k2| #1=#:G240 |c| #2=#:G241 |ki| #3=#:G239 |u1| #4=#:G237
         |ui| #5=#:G238 #6=#:G236 |d| |cd| |sv| |su| |ulst| #7=#:G235 |kk|
         #8=#:G234 |dvvec| #9=#:G233 #10=#:G232 |vlst| #11=#:G231 #12=#:G230
         |rsum| |deg1| |f1| #13=#:G229 |fac| |u0| |nk| |dummy| |lfac|)
    (RETURN
     (SEQ
      (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 20)) (QREFELT $ 23))
            . #14=(|INTDEN;li_factors|))
      (LETT |res| NIL . #14#) (LETT |dummy| (SPADCALL (QREFELT $ 25)) . #14#)
      (LETT |vlst| NIL . #14#) (LETT |nk| (LENGTH |lk|) . #14#)
      (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT $ 27)) 1 (QREFELT $ 29))
            . #14#)
      (SEQ (LETT |fac| NIL . #14#) (LETT #13# |lfac| . #14#) G190
           (COND
            ((OR (ATOM #13#) (PROGN (LETT |fac| (CAR #13#) . #14#) NIL))
             (GO G191)))
           (SEQ (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #14#)
                (LETT |f1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f1| (QREFELT $ 30)) (QREFELT $ 31))
                       |f1| (QREFELT $ 32))
                      . #14#)
                (LETT |deg1| (SPADCALL |f1| (QREFELT $ 34)) . #14#)
                (EXIT
                 (COND ((EQL |deg1| 0) "iterate")
                       ((SPADCALL (CONS #'|INTDEN;li_factors!0| (VECTOR $ |x|))
                                  (SPADCALL |f1| (QREFELT $ 42))
                                  (QREFELT $ 44))
                        (LETT |res|
                              (CONS
                               (VECTOR |f1| |f1| |u0| (|spadConstant| $ 39) 1)
                               |res|)
                              . #14#))
                       ((NULL |lk|) "iterate")
                       ('T
                        (SEQ
                         (LETT |rsum|
                               (SPADCALL
                                (SPADCALL (SPADCALL |deg1| (QREFELT $ 45))
                                          (QREFELT $ 31))
                                (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 48))
                                (QREFELT $ 49))
                               . #14#)
                         (COND
                          ((SPADCALL |deg1| 1 (QREFELT $ 50))
                           (LETT |f2|
                                 (SPADCALL |f1| |dummy|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 51) 1
                                                      (QREFELT $ 52))
                                            (SPADCALL |rsum| (QREFELT $ 53))
                                            (QREFELT $ 54))
                                           (QREFELT $ 55))
                                 . #14#)))
                         (COND
                          ((SPADCALL |deg1| 1 (QREFELT $ 50))
                           (COND
                            ((NULL
                              (SPADCALL
                               (CONS #'|INTDEN;li_factors!1| (VECTOR $ |x|))
                               (SPADCALL |f2| (QREFELT $ 42)) (QREFELT $ 44)))
                             (EXIT "iterate")))))
                         (COND
                          ((NULL |vlst|)
                           (SEQ
                            (LETT |vlst|
                                  (PROGN
                                   (LETT #12# NIL . #14#)
                                   (SEQ (LETT |kk| NIL . #14#)
                                        (LETT #11# |lk| . #14#) G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |kk| (CAR #11#) . #14#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #12#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |kk| '|log|
                                                             (QREFELT $ 56))
                                                   (SPADCALL |kk|
                                                             (QREFELT $ 58)))
                                                  ('T
                                                   (SPADCALL
                                                    (SPADCALL |kk|
                                                              (QREFELT $ 27))
                                                    1 (QREFELT $ 29))))
                                                 #12#)
                                                . #14#)))
                                        (LETT #11# (CDR #11#) . #14#) (GO G190)
                                        G191 (EXIT (NREVERSE #12#))))
                                  . #14#)
                            (LETT |dvvec|
                                  (SPADCALL
                                   (PROGN
                                    (LETT #10# NIL . #14#)
                                    (SEQ (LETT |c| NIL . #14#)
                                         (LETT #9# |vlst| . #14#) G190
                                         (COND
                                          ((OR (ATOM #9#)
                                               (PROGN
                                                (LETT |c| (CAR #9#) . #14#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #10#
                                                 (CONS
                                                  (SPADCALL |c| |x|
                                                            (QREFELT $ 38))
                                                  #10#)
                                                 . #14#)))
                                         (LETT #9# (CDR #9#) . #14#) (GO G190)
                                         G191 (EXIT (NREVERSE #10#))))
                                   (QREFELT $ 60))
                                  . #14#)
                            (EXIT
                             (LETT |ulst|
                                   (PROGN
                                    (LETT #8# NIL . #14#)
                                    (SEQ (LETT |kk| NIL . #14#)
                                         (LETT #7# |lk| . #14#) G190
                                         (COND
                                          ((OR (ATOM #7#)
                                               (PROGN
                                                (LETT |kk| (CAR #7#) . #14#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #8#
                                                 (CONS
                                                  (COND
                                                   ((SPADCALL |kk| '|log|
                                                              (QREFELT $ 56))
                                                    (SPADCALL
                                                     (SPADCALL |kk|
                                                               (QREFELT $ 27))
                                                     1 (QREFELT $ 29)))
                                                   ('T
                                                    (SPADCALL |kk|
                                                              (QREFELT $ 58))))
                                                  #8#)
                                                 . #14#)))
                                         (LETT #7# (CDR #7#) . #14#) (GO G190)
                                         G191 (EXIT (NREVERSE #8#))))
                                   . #14#)))))
                         (LETT |su|
                               (SPADCALL |dvvec|
                                         (SPADCALL |rsum| |x| (QREFELT $ 38))
                                         (QREFELT $ 63))
                               . #14#)
                         (EXIT
                          (COND ((QEQCAR |su| 1) "iterate")
                                ('T
                                 (SEQ (LETT |sv| (QCDR |su|) . #14#)
                                      (LETT |cd| (SPADCALL |sv| (QREFELT $ 67))
                                            . #14#)
                                      (LETT |d| (QCDR |cd|) . #14#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |d| 1 (QREFELT $ 68))
                                         "iterate")
                                        ('T
                                         (SEQ
                                          (LETT |u1|
                                                (SPADCALL (ELT $ 49)
                                                          (PROGN
                                                           (LETT #6# NIL
                                                                 . #14#)
                                                           (SEQ
                                                            (LETT |ki| NIL
                                                                  . #14#)
                                                            (LETT #5#
                                                                  (QCAR |cd|)
                                                                  . #14#)
                                                            (LETT |ui| NIL
                                                                  . #14#)
                                                            (LETT #4# |ulst|
                                                                  . #14#)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #4#)
                                                                  (PROGN
                                                                   (LETT |ui|
                                                                         (CAR
                                                                          #4#)
                                                                         . #14#)
                                                                   NIL)
                                                                  (ATOM #5#)
                                                                  (PROGN
                                                                   (LETT |ki|
                                                                         (CAR
                                                                          #5#)
                                                                         . #14#)
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #6#
                                                                    (CONS
                                                                     (SPADCALL
                                                                      |ui| |ki|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     #6#)
                                                                    . #14#)))
                                                            (LETT #4#
                                                                  (PROG1
                                                                      (CDR #4#)
                                                                    (LETT #5#
                                                                          (CDR
                                                                           #5#)
                                                                          . #14#))
                                                                  . #14#)
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #6#))))
                                                          (QREFELT $ 71))
                                                . #14#)
                                          (LETT |k2|
                                                (SPADCALL (ELT $ 72)
                                                          (PROGN
                                                           (LETT #3# NIL
                                                                 . #14#)
                                                           (SEQ
                                                            (LETT |ki| NIL
                                                                  . #14#)
                                                            (LETT #2#
                                                                  (QCAR |cd|)
                                                                  . #14#)
                                                            (LETT |c| NIL
                                                                  . #14#)
                                                            (LETT #1# |vlst|
                                                                  . #14#)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #1#)
                                                                  (PROGN
                                                                   (LETT |c|
                                                                         (CAR
                                                                          #1#)
                                                                         . #14#)
                                                                   NIL)
                                                                  (ATOM #2#)
                                                                  (PROGN
                                                                   (LETT |ki|
                                                                         (CAR
                                                                          #2#)
                                                                         . #14#)
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #3#
                                                                    (CONS
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |ki|
                                                                       (QREFELT
                                                                        $ 45))
                                                                      |c|
                                                                      (QREFELT
                                                                       $ 49))
                                                                     #3#)
                                                                    . #14#)))
                                                            (LETT #1#
                                                                  (PROG1
                                                                      (CDR #1#)
                                                                    (LETT #2#
                                                                          (CDR
                                                                           #2#)
                                                                          . #14#))
                                                                  . #14#)
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE #3#))))
                                                          (QREFELT $ 71))
                                                . #14#)
                                          (LETT |f2|
                                                (SPADCALL |f1| |dummy|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            51)
                                                            1 (QREFELT $ 52))
                                                           (SPADCALL |k2|
                                                                     (QREFELT $
                                                                              53))
                                                           (QREFELT $ 54))
                                                          (QREFELT $ 55))
                                                . #14#)
                                          (COND
                                           ((NULL
                                             (SPADCALL
                                              (CONS #'|INTDEN;li_factors!2|
                                                    (VECTOR $ |x|))
                                              (SPADCALL |f2| (QREFELT $ 42))
                                              (QREFELT $ 44)))
                                            (EXIT (|error| "Inpossible 1"))))
                                          (EXIT
                                           (LETT |res|
                                                 (CONS
                                                  (VECTOR |f1| |f2|
                                                          (SPADCALL
                                                           (SPADCALL |u0| |d|
                                                                     (QREFELT $
                                                                              69))
                                                           |u1| (QREFELT $ 49))
                                                          |k2| |d|)
                                                  |res|)
                                                 . #14#)))))))))))))))
           (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |INTDEN;li_factors!2| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 38)) (|spadConstant| $ 39)
                (QREFELT $ 41)))))) 

(DEFUN |INTDEN;li_factors!1| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 38)) (|spadConstant| $ 39)
                (QREFELT $ 41)))))) 

(DEFUN |INTDEN;li_factors!0| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 38)) (|spadConstant| $ 39)
                (QREFELT $ 41)))))) 

(DEFUN |INTDEN;poly_factors| (|df| |k| |lk| |x| $)
  (PROG (|res| |f2| |k2| #1=#:G308 |c| #2=#:G309 |ki| #3=#:G307 |u1| #4=#:G305
         |ui| #5=#:G306 #6=#:G304 |d| |cd| |sv| |su| |ulst| #7=#:G303 |kk|
         #8=#:G302 |dvvec| #9=#:G301 #10=#:G300 |vlst| #11=#:G299 #12=#:G298
         |lprod| |f1| |tc| |deg1| #13=#:G297 |fac| |v0| |nk| |dummy| |lfac|)
    (RETURN
     (SEQ
      (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 20)) (QREFELT $ 23))
            . #14=(|INTDEN;poly_factors|))
      (LETT |res| NIL . #14#) (LETT |dummy| (SPADCALL (QREFELT $ 25)) . #14#)
      (LETT |vlst| NIL . #14#) (LETT |nk| (LENGTH |lk|) . #14#)
      (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT $ 27)) 1 (QREFELT $ 29))
            . #14#)
      (SEQ (LETT |fac| NIL . #14#) (LETT #13# |lfac| . #14#) G190
           (COND
            ((OR (ATOM #13#) (PROGN (LETT |fac| (CAR #13#) . #14#) NIL))
             (GO G191)))
           (SEQ
            (LETT |f1|
                  (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #14#)
                  . #14#)
            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 34)) . #14#)
            (EXIT
             (COND ((EQL |deg1| 0) "iterate")
                   ('T
                    (SEQ (LETT |tc| (SPADCALL |f1| 0 (QREFELT $ 48)) . #14#)
                         (EXIT
                          (COND
                           ((SPADCALL |tc| (|spadConstant| $ 39)
                                      (QREFELT $ 41))
                            "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL (SPADCALL |tc| (QREFELT $ 31))
                                             |f1| (QREFELT $ 32))
                                   . #14#)
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (CONS #'|INTDEN;poly_factors!0|
                                       (VECTOR $ |x|))
                                 (SPADCALL |f1| (QREFELT $ 42)) (QREFELT $ 44))
                                (LETT |res|
                                      (CONS
                                       (VECTOR |f1| |f1| (|spadConstant| $ 51)
                                               |v0| 1)
                                       |res|)
                                      . #14#))
                               ((NULL |lk|) "iterate")
                               ('T
                                (SEQ
                                 (LETT |lprod| (SPADCALL |f1| (QREFELT $ 30))
                                       . #14#)
                                 (COND
                                  ((NULL |vlst|)
                                   (SEQ
                                    (LETT |vlst|
                                          (PROGN
                                           (LETT #12# NIL . #14#)
                                           (SEQ (LETT |kk| NIL . #14#)
                                                (LETT #11# |lk| . #14#) G190
                                                (COND
                                                 ((OR (ATOM #11#)
                                                      (PROGN
                                                       (LETT |kk| (CAR #11#)
                                                             . #14#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #12#
                                                        (CONS
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|log|
                                                                     (QREFELT $
                                                                              56))
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              58)))
                                                          ('T
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 27))
                                                            1 (QREFELT $ 29))))
                                                         #12#)
                                                        . #14#)))
                                                (LETT #11# (CDR #11#) . #14#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #12#))))
                                          . #14#)
                                    (LETT |dvvec|
                                          (SPADCALL
                                           (PROGN
                                            (LETT #10# NIL . #14#)
                                            (SEQ (LETT |c| NIL . #14#)
                                                 (LETT #9# |vlst| . #14#) G190
                                                 (COND
                                                  ((OR (ATOM #9#)
                                                       (PROGN
                                                        (LETT |c| (CAR #9#)
                                                              . #14#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #10#
                                                         (CONS
                                                          (SPADCALL |c| |x|
                                                                    (QREFELT $
                                                                             38))
                                                          #10#)
                                                         . #14#)))
                                                 (LETT #9# (CDR #9#) . #14#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #10#))))
                                           (QREFELT $ 60))
                                          . #14#)
                                    (EXIT
                                     (LETT |ulst|
                                           (PROGN
                                            (LETT #8# NIL . #14#)
                                            (SEQ (LETT |kk| NIL . #14#)
                                                 (LETT #7# |lk| . #14#) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |kk| (CAR #7#)
                                                              . #14#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8#
                                                         (CONS
                                                          (COND
                                                           ((SPADCALL |kk|
                                                                      '|log|
                                                                      (QREFELT
                                                                       $ 56))
                                                            (SPADCALL
                                                             (SPADCALL |kk|
                                                                       (QREFELT
                                                                        $ 27))
                                                             1 (QREFELT $ 29)))
                                                           ('T
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 58))))
                                                          #8#)
                                                         . #14#)))
                                                 (LETT #7# (CDR #7#) . #14#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #8#))))
                                           . #14#)))))
                                 (LETT |su|
                                       (SPADCALL |dvvec|
                                                 (SPADCALL
                                                  (SPADCALL |lprod| |x|
                                                            (QREFELT $ 38))
                                                  (SPADCALL
                                                   (SPADCALL |deg1|
                                                             (QREFELT $ 45))
                                                   |lprod| (QREFELT $ 49))
                                                  (QREFELT $ 73))
                                                 (QREFELT $ 63))
                                       . #14#)
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) "iterate")
                                        ('T
                                         (SEQ (LETT |sv| (QCDR |su|) . #14#)
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT $ 67))
                                                    . #14#)
                                              (LETT |d| (QCDR |cd|) . #14#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT $ 68))
                                                 "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT $ 49)
                                                                  (PROGN
                                                                   (LETT #6#
                                                                         NIL
                                                                         . #14#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #14#)
                                                                    (LETT #5#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #14#)
                                                                    (LETT |ui|
                                                                          NIL
                                                                          . #14#)
                                                                    (LETT #4#
                                                                          |ulst|
                                                                          . #14#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #4#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ui|
                                                                         (CAR
                                                                          #4#)
                                                                         . #14#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #5#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #5#)
                                                                         . #14#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #6#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              |ui|
                                                                              |ki|
                                                                              (QREFELT
                                                                               $
                                                                               69))
                                                                             #6#)
                                                                            . #14#)))
                                                                    (LETT #4#
                                                                          (PROG1
                                                                              (CDR
                                                                               #4#)
                                                                            (LETT
                                                                             #5#
                                                                             (CDR
                                                                              #5#)
                                                                             . #14#))
                                                                          . #14#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #6#))))
                                                                  (QREFELT $
                                                                           71))
                                                        . #14#)
                                                  (LETT |k2|
                                                        (SPADCALL (ELT $ 72)
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         NIL
                                                                         . #14#)
                                                                   (SEQ
                                                                    (LETT |ki|
                                                                          NIL
                                                                          . #14#)
                                                                    (LETT #2#
                                                                          (QCAR
                                                                           |cd|)
                                                                          . #14#)
                                                                    (LETT |c|
                                                                          NIL
                                                                          . #14#)
                                                                    (LETT #1#
                                                                          |vlst|
                                                                          . #14#)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #1#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |c|
                                                                         (CAR
                                                                          #1#)
                                                                         . #14#)
                                                                        NIL)
                                                                       (ATOM
                                                                        #2#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ki|
                                                                         (CAR
                                                                          #2#)
                                                                         . #14#)
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT #3#
                                                                            (CONS
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               |ki|
                                                                               (QREFELT
                                                                                $
                                                                                45))
                                                                              |c|
                                                                              (QREFELT
                                                                               $
                                                                               49))
                                                                             #3#)
                                                                            . #14#)))
                                                                    (LETT #1#
                                                                          (PROG1
                                                                              (CDR
                                                                               #1#)
                                                                            (LETT
                                                                             #2#
                                                                             (CDR
                                                                              #2#)
                                                                             . #14#))
                                                                          . #14#)
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #3#))))
                                                                  (QREFELT $
                                                                           71))
                                                        . #14#)
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT $
                                                                             31))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 51)
                                                                    1
                                                                    (QREFELT $
                                                                             52))
                                                                   (QREFELT $
                                                                            32))
                                                                  (QREFELT $
                                                                           55))
                                                        . #14#)
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR $ |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT $ 42))
                                                      (QREFELT $ 44)))
                                                    (EXIT "iterate")))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT $
                                                                            72))
                                                                  1)
                                                          |res|)
                                                         . #14#)))))))))))))))))))))))
           (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |INTDEN;poly_factors!1| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 38)) (|spadConstant| $ 39)
                (QREFELT $ 41)))))) 

(DEFUN |INTDEN;poly_factors!0| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 38)) (|spadConstant| $ 39)
                (QREFELT $ 41)))))) 

(DEFUN |INTDEN;decompose| (|nn| |elden| |lidens| $)
  (PROG (|res| |l1| |elfac| |cden| |cnum| |ct| |i| |nfacs| |pfr| |nd| |fdens|
         |ndf1| #1=#:G326 |nden| #2=#:G325 |ndens| |nden1|)
    (RETURN
     (SEQ (LETT |nden1| |elden| . #3=(|INTDEN;decompose|))
          (LETT |ndens| |lidens| . #3#)
          (LETT |fdens|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |nden| NIL . #3#) (LETT #1# |ndens| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |nden| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |nden| 1 (QREFELT $ 76)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |ndf1| (SPADCALL |nden1| 1 (QREFELT $ 76)) . #3#)
          (LETT |fdens| (CONS |ndf1| |fdens|) . #3#)
          (LETT |nd| (SPADCALL (ELT $ 78) |fdens| (QREFELT $ 81)) . #3#)
          (LETT |pfr| (SPADCALL |nn| |nd| (QREFELT $ 83)) . #3#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pfr| (QREFELT $ 84)) (|spadConstant| $ 35)
                       (QREFELT $ 85))
             (|error| "impossible: wholePart(pfr) ~= 0"))
            ('T
             (SEQ (LETT |nfacs| (SPADCALL |pfr| (QREFELT $ 86)) . #3#)
                  (LETT |elfac| (|spadConstant| $ 35) . #3#)
                  (LETT |res| NIL . #3#)
                  (SEQ (LETT |i| 1 . #3#) G190
                       (COND ((|greater_SI| |i| |nfacs|) (GO G191)))
                       (SEQ
                        (LETT |ct| (SPADCALL |pfr| |i| (QREFELT $ 87)) . #3#)
                        (LETT |cnum| (SPADCALL |ct| (QREFELT $ 88)) . #3#)
                        (LETT |cden| (SPADCALL |ct| (QREFELT $ 89)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |cden| |ndf1| (QREFELT $ 90))
                           (LETT |elfac| |cnum| . #3#))
                          ('T
                           (SEQ
                            (LETT |l1|
                                  (LIST |cnum|
                                        (SPADCALL |cden| (QREFELT $ 91)))
                                  . #3#)
                            (EXIT (LETT |res| (CONS |l1| |res|) . #3#)))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS (LIST |elfac| |nden1|) |res|)))))))))) 

(DEFUN |INTDEN;p_power_in_q| (|p| |q| $)
  (PROG (|res| #1=#:G328 |qq|)
    (RETURN
     (SEQ (LETT |res| 0 . #2=(|INTDEN;p_power_in_q|))
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 94)) . #2#)
                          0))
                 (GO G191)))
               (SEQ
                (LETT |q|
                      (PROG2 (LETT #1# |qq| . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|SparseMultivariatePolynomial|
                                        (|Expression| (|Integer|))
                                        (|Kernel| (|Expression| (|Integer|))))
                                       #1#))
                      . #2#)
                (EXIT (LETT |res| (+ |res| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |INTDEN;MP_to_MPF| (|p| |lk| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTDEN;MP_to_MPF!0| (VECTOR $ |lk|))
               (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 104))))) 

(DEFUN |INTDEN;MP_to_MPF!1| (|c| $)
  (SPADCALL (SPADCALL |c| (QREFELT $ 45)) (QREFELT $ 100))) 

(DEFUN |INTDEN;MP_to_MPF!0| (|k| $$)
  (PROG (|lk| $)
    (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL |k| |lk| (QREFELT $ 96))
        (SPADCALL (|spadConstant| $ 97) |k| (|spadConstant| $ 98)
                  (QREFELT $ 99)))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 58)) (QREFELT $ 100)))))))) 

(DEFUN |INTDEN;li_int1| (|f| |u| |x| $)
  (PROG (#1=#:G393 |c| |j| #2=#:G392 |sl| |sl0| |eqsl| |eqs| #3=#:G390 |p1|
         #4=#:G391 |coef| |lpow| |pp| #5=#:G389 |lpow0| |coefs| #6=#:G388 |nf1|
         |cc| #7=#:G383 |ccru| |ccu| |dup| #8=#:G356 |nup| #9=#:G354 |n| |m|
         |qu| |degdu| |degnu| |degdf| |degnf| |du| |nu| |df1| |vk2| #10=#:G387
         |k| #11=#:G386 |f1| |deru| |k1| |vk| #12=#:G385 #13=#:G384)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |vk|
              (PROGN
               (LETT #13# NIL . #14=(|INTDEN;li_int1|))
               (SEQ (LETT |k| NIL . #14#)
                    (LETT #12# (SPADCALL |u| (QREFELT $ 106)) . #14#) G190
                    (COND
                     ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#) . #14#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT $ 58)) |x|
                                   (QREFELT $ 38))
                         (|spadConstant| $ 39) (QREFELT $ 107))
                        (LETT #13# (CONS |k| #13#) . #14#)))))
                    (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                    (EXIT (NREVERSE #13#))))
              . #14#)
        (EXIT
         (COND ((NULL |vk|) (|error| "li_int1: constant log"))
               (#15='T
                (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 108)) . #14#)
                     (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 38)) . #14#)
                     (LETT |f1| (SPADCALL |f| |deru| (QREFELT $ 73)) . #14#)
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 38))
                                  (|spadConstant| $ 39) (QREFELT $ 41))
                        (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 39)))))
                       (#15#
                        (SEQ
                         (LETT |vk2|
                               (PROGN
                                (LETT #11# NIL . #14#)
                                (SEQ (LETT |k| NIL . #14#)
                                     (LETT #10# (SPADCALL |f1| (QREFELT $ 106))
                                           . #14#)
                                     G190
                                     (COND
                                      ((OR (ATOM #10#)
                                           (PROGN
                                            (LETT |k| (CAR #10#) . #14#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 58)) |x|
                                           (QREFELT $ 38))
                                          (|spadConstant| $ 39)
                                          (QREFELT $ 107))
                                         (LETT #11# (CONS |k| #11#) . #14#)))))
                                     (LETT #10# (CDR #10#) . #14#) (GO G190)
                                     G191 (EXIT (NREVERSE #11#))))
                               . #14#)
                         (COND
                          ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 109)))
                           (COND
                            ((NULL
                              (NULL (SPADCALL |vk| |vk2| (QREFELT $ 109))))
                             (EXIT
                              (PROGN
                               (LETT #7# (CONS 1 #16="failed") . #14#)
                               (GO #7#))))))
                          (#15#
                           (EXIT
                            (PROGN (LETT #7# (CONS 1 #16#) . #14#) (GO #7#)))))
                         (LETT |nf1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 110)) |vk| $)
                               . #14#)
                         (LETT |df1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 111)) |vk| $)
                               . #14#)
                         (LETT |nu|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 110)) |vk| $)
                               . #14#)
                         (LETT |du|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 111)) |vk| $)
                               . #14#)
                         (LETT |degnf| (SPADCALL |nf1| |k1| (QREFELT $ 112))
                               . #14#)
                         (LETT |degdf| (SPADCALL |df1| |k1| (QREFELT $ 112))
                               . #14#)
                         (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 112))
                               . #14#)
                         (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 112))
                               . #14#)
                         (COND
                          ((EQL |degdu| 0)
                           (SEQ
                            (LETT |qu|
                                  (SPADCALL |degdf| |degnu| (QREFELT $ 113))
                                  . #14#)
                            (EXIT
                             (COND
                              ((QEQCAR |qu| 1)
                               (PROGN
                                (LETT #7# (CONS 1 "failed") . #14#)
                                (GO #7#)))
                              (#15#
                               (SEQ (LETT |n| (QCDR |qu|) . #14#)
                                    (LETT |qu|
                                          (SPADCALL |degnf| |degnu|
                                                    (QREFELT $ 113))
                                          . #14#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #7# (CONS 1 "failed") . #14#)
                                        (GO #7#)))
                                      (#15#
                                       (LETT |m| (- (QCDR |qu|) |n|)
                                             . #14#))))))))))
                          ((EQL |degnu| 0)
                           (SEQ
                            (LETT |qu|
                                  (SPADCALL |degdf| |degdu| (QREFELT $ 113))
                                  . #14#)
                            (EXIT
                             (COND
                              ((QEQCAR |qu| 1)
                               (PROGN
                                (LETT #7# (CONS 1 "failed") . #14#)
                                (GO #7#)))
                              (#15#
                               (SEQ (LETT |m| (QCDR |qu|) . #14#)
                                    (LETT |qu|
                                          (SPADCALL |degnf| |degdu|
                                                    (QREFELT $ 113))
                                          . #14#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #7# (CONS 1 "failed") . #14#)
                                        (GO #7#)))
                                      (#15#
                                       (LETT |n| (- (QCDR |qu|) |m|)
                                             . #14#))))))))))
                          (#15#
                           (SEQ
                            (LETT |m| (|INTDEN;p_power_in_q| |du| |df1| $)
                                  . #14#)
                            (LETT |n| (|INTDEN;p_power_in_q| |nu| |df1| $)
                                  . #14#)
                            (EXIT
                             (COND
                              ((SPADCALL (+ (* |m| |degdu|) (* |n| |degnu|))
                                         |degdf| (QREFELT $ 68))
                               (PROGN
                                (LETT #7# (CONS 1 "failed") . #14#)
                                (GO #7#))))))))
                         (LETT |nup|
                               (COND
                                ((SPADCALL |n| 0 (QREFELT $ 114))
                                 (SPADCALL |nu|
                                           (PROG1 (LETT #9# |n| . #14#)
                                             (|check_subtype| (>= #9# 0)
                                                              '(|NonNegativeInteger|)
                                                              #9#))
                                           (QREFELT $ 115)))
                                (#15# (|spadConstant| $ 97)))
                               . #14#)
                         (LETT |dup|
                               (COND
                                ((SPADCALL |m| 0 (QREFELT $ 114))
                                 (SPADCALL |du|
                                           (PROG1 (LETT #8# |m| . #14#)
                                             (|check_subtype| (>= #8# 0)
                                                              '(|NonNegativeInteger|)
                                                              #8#))
                                           (QREFELT $ 115)))
                                (#15# (|spadConstant| $ 97)))
                               . #14#)
                         (LETT |ccu|
                               (SPADCALL |df1|
                                         (SPADCALL |dup| |nup| (QREFELT $ 116))
                                         (QREFELT $ 94))
                               . #14#)
                         (EXIT
                          (COND
                           ((QEQCAR |ccu| 1)
                            (PROGN
                             (LETT #7# (CONS 1 "failed") . #14#)
                             (GO #7#)))
                           (#15#
                            (SEQ
                             (LETT |ccru|
                                   (SPADCALL (QCDR |ccu|) (QREFELT $ 118))
                                   . #14#)
                             (EXIT
                              (COND
                               ((QEQCAR |ccru| 1)
                                (SEQ
                                 (SPADCALL (SPADCALL |ccu| (QREFELT $ 121))
                                           (QREFELT $ 123))
                                 (EXIT
                                  (PROGN
                                   (LETT #7# (CONS 1 "failed") . #14#)
                                   (GO #7#)))))
                               (#15#
                                (SEQ (LETT |cc| (QCDR |ccru|) . #14#)
                                     (LETT |nf1|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 51)
                                                      |cc| (QREFELT $ 73))
                                            |nf1| (QREFELT $ 125))
                                           . #14#)
                                     (LETT |coefs|
                                           (PROGN
                                            (LETT #6# NIL . #14#)
                                            (SEQ (LETT |j| (- |n|) . #14#) G190
                                                 (COND ((> |j| |m|) (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #6#
                                                         (CONS
                                                          (SPADCALL
                                                           (QREFELT $ 126))
                                                          #6#)
                                                         . #14#)))
                                                 (LETT |j| (+ |j| 1) . #14#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #6#))))
                                           . #14#)
                                     (LETT |eqs| |nf1| . #14#)
                                     (LETT |pp| (|spadConstant| $ 97) . #14#)
                                     (LETT |lpow0| (LIST |pp|) . #14#)
                                     (SEQ (LETT |j| (- 1 |n|) . #14#) G190
                                          (COND ((> |j| |m|) (GO G191)))
                                          (SEQ
                                           (LETT |pp|
                                                 (SPADCALL |nu| |pp|
                                                           (QREFELT $ 116))
                                                 . #14#)
                                           (EXIT
                                            (LETT |lpow0| (CONS |pp| |lpow0|)
                                                  . #14#)))
                                          (LETT |j| (+ |j| 1) . #14#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |lpow| (LIST (|SPADfirst| |lpow0|))
                                           . #14#)
                                     (LETT |pp| (|spadConstant| $ 97) . #14#)
                                     (SEQ (LETT |p1| NIL . #14#)
                                          (LETT #5# (CDR |lpow0|) . #14#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |p1| (CAR #5#) . #14#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |pp|
                                                 (SPADCALL |du| |pp|
                                                           (QREFELT $ 116))
                                                 . #14#)
                                           (EXIT
                                            (LETT |lpow|
                                                  (CONS
                                                   (SPADCALL |pp| |p1|
                                                             (QREFELT $ 116))
                                                   |lpow|)
                                                  . #14#)))
                                          (LETT #5# (CDR #5#) . #14#) (GO G190)
                                          G191 (EXIT NIL))
                                     (SEQ (LETT |coef| NIL . #14#)
                                          (LETT #4# |coefs| . #14#)
                                          (LETT |p1| NIL . #14#)
                                          (LETT #3# |lpow| . #14#) G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |p1| (CAR #3#) . #14#)
                                                 NIL)
                                                (ATOM #4#)
                                                (PROGN
                                                 (LETT |coef| (CAR #4#) . #14#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |eqs|
                                                  (SPADCALL |eqs|
                                                            (SPADCALL
                                                             (SPADCALL |coef|
                                                                       (QREFELT
                                                                        $ 127))
                                                             |p1|
                                                             (QREFELT $ 125))
                                                            (QREFELT $ 128))
                                                  . #14#)))
                                          (LETT #3#
                                                (PROG1 (CDR #3#)
                                                  (LETT #4# (CDR #4#) . #14#))
                                                . #14#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |eqsl|
                                           (SPADCALL |eqs| (QREFELT $ 129))
                                           . #14#)
                                     (LETT |sl0|
                                           (SPADCALL |eqsl| |coefs|
                                                     (QREFELT $ 133))
                                           . #14#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |sl0| 1) (CONS 1 "failed"))
                                       (#15#
                                        (SEQ (LETT |sl| (QCDR |sl0|) . #14#)
                                             (EXIT
                                              (CONS 0
                                                    (PROGN
                                                     (LETT #2# NIL . #14#)
                                                     (SEQ
                                                      (LETT |j| (- |n|) . #14#)
                                                      (LETT |c| NIL . #14#)
                                                      (LETT #1# |sl| . #14#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #1#)
                                                                   . #14#)
                                                             NIL)
                                                            (> |j| |m|))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL |c|
                                                                    (|spadConstant|
                                                                     $ 39)
                                                                    (QREFELT $
                                                                             107))
                                                          (LETT #2#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         45)))
                                                                 #2#)
                                                                . #14#)))))
                                                      (LETT #1#
                                                            (PROG1 (CDR #1#)
                                                              (LETT |j|
                                                                    (+ |j| 1)
                                                                    . #14#))
                                                            . #14#)
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE
                                                        #2#))))))))))))))))))))))))))))
      #7# (EXIT #7#))))) 

(DEFUN |INTDEN;mk_li| (|c| |j| |u| |s| $)
  (PROG (|es|)
    (RETURN
     (SEQ
      (COND
       ((EQL |j| -1)
        (SPADCALL |c|
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 134)) |s| (QREFELT $ 72))
                   (QREFELT $ 134))
                  (QREFELT $ 49)))
       ('T
        (SEQ (LETT |es| (SPADCALL |s| (QREFELT $ 135)) |INTDEN;mk_li|)
             (EXIT
              (SPADCALL
               (SPADCALL |c|
                         (SPADCALL
                          (SPADCALL (SPADCALL |u| |es| (QREFELT $ 49))
                                    (+ |j| 1) (QREFELT $ 69))
                          (QREFELT $ 136))
                         (QREFELT $ 49))
               (SPADCALL |es| (+ |j| 1) (QREFELT $ 69)) (QREFELT $ 73)))))))))) 

(DEFUN |INTDEN;UP2UPR| (|p| $)
  (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 142))) 

(DEFUN |INTDEN;UP2UPR!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) (QREFELT $ 138))) 

(DEFUN |INTDEN;li_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G436 |zz| |lle| |logs| #2=#:G435 |e| |zzl| |rf1k| |elpart|
         |lli| #3=#:G430 |liu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1| |linum|
         |u1| #4=#:G434 |lifac| |cfac| |liden| #5=#:G433 |ldr| |u0| |dummy|
         |lifacs| |elfac| |dn| |elden| |lidens| #6=#:G432 #7=#:G431 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;li_factors| (SPADCALL |f| (QREFELT $ 111)) |k| |lk| |x|
               $)
              . #8=(|INTDEN;li_int3|))
        (LETT |lidens|
              (PROGN
               (LETT #7# NIL . #8#)
               (SEQ (LETT |ldr| NIL . #8#) (LETT #6# |ldrs| . #8#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |ldr| (CAR #6#) . #8#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #7# (CONS (QVELT |ldr| 0) #7#) . #8#)))
                    (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #7#))))
              . #8#)
        (EXIT
         (COND ((NULL |lidens|) (CONS 1 "failed"))
               (#9='T
                (SEQ
                 (LETT |elden|
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 143))
                                 (SPADCALL (ELT $ 77) |lidens| (QREFELT $ 146))
                                 (QREFELT $ 147))
                       . #8#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Inpossible 2"))
                        (#9#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose|
                                 (SPADCALL |rf| (QREFELT $ 148)) (QCDR |elden|)
                                 |lidens| $)
                                . #8#)
                          (LETT |elfac| (|SPADfirst| |dn|) . #8#)
                          (LETT |lifacs| (CDR |dn|) . #8#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |elfac|)
                                          (SPADCALL |elfac| (QREFELT $ 149))
                                          (QREFELT $ 150))
                                . #8#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 25)) . #8#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 27)) 1
                                          (QREFELT $ 29))
                                . #8#)
                          (LETT |res| (|spadConstant| $ 39) . #8#)
                          (LETT |logs| NIL . #8#)
                          (SEQ (LETT |ldr| NIL . #8#) (LETT #5# |ldrs| . #8#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |ldr| (CAR #5#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ (LETT |liden| (QVELT |ldr| 0) . #8#)
                                    (LETT |cfac| (QVELT |ldr| 1) . #8#)
                                    (SEQ (LETT |lifac| NIL . #8#)
                                         (LETT #4# |lifacs| . #8#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |lifac| (CAR #4#) . #8#)
                                                NIL)
                                               (NULL
                                                (COND
                                                 ((SPADCALL |liden|
                                                            (SPADCALL |lifac|
                                                                      (QREFELT
                                                                       $ 149))
                                                            (QREFELT $ 151))
                                                  'NIL)
                                                 ('T 'T))))
                                           (GO G191)))
                                         (SEQ (EXIT 0))
                                         (LETT #4# (CDR #4#) . #8#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND
                                     ((NULL
                                       (SPADCALL |liden|
                                                 (SPADCALL |lifac|
                                                           (QREFELT $ 149))
                                                 (QREFELT $ 151)))
                                      (EXIT (|error| "Inpossible 3"))))
                                    (LETT |u1| (QVELT |ldr| 2) . #8#)
                                    (LETT |linum| (|SPADfirst| |lifac|) . #8#)
                                    (SEQ
                                     (LETT |deg1|
                                           (SPADCALL |liden| (QREFELT $ 34))
                                           . #8#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |deg1| 1 (QREFELT $ 50))
                                        (SEQ
                                         (LETT |rfc|
                                               (SPADCALL |cfac|
                                                         (QREFELT $ 152))
                                               . #8#)
                                         (LETT |c_shift|
                                               (SPADCALL |rfc| (QREFELT $ 153))
                                               . #8#)
                                         (LETT |rf1|
                                               (SPADCALL |rfc| (QVELT |ldr| 3)
                                                         (QREFELT $ 154))
                                               . #8#)
                                         (LETT |ddf|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |liden|
                                                           (QREFELT $ 155))
                                                 |dummy| |rf1| (QREFELT $ 156))
                                                (QREFELT $ 157))
                                               . #8#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |linum| |dummy|
                                                            |rf1|
                                                            (QREFELT $ 156))
                                                  (QREFELT $ 157))
                                                 |ddf| (QREFELT $ 73))
                                                . #8#))))
                                       ('T
                                        (SEQ
                                         (LETT |c_shift|
                                               (SPADCALL |cfac| 0
                                                         (QREFELT $ 48))
                                               . #8#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL |linum|
                                                          (QREFELT $ 157))
                                                . #8#)))))))
                                    (LETT |liu|
                                          (|INTDEN;li_int1| |tf| |u1| |x| $)
                                          . #8#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |liu| 1)
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed") . #8#)
                                        (GO #3#)))
                                      ('T
                                       (SEQ (LETT |lli| (QCDR |liu|) . #8#)
                                            (COND
                                             ((EQL (LENGTH |lli|) 1)
                                              (COND
                                               ((SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |lli| 1
                                                            (QREFELT $ 159))
                                                  2 (QREFELT $ 29))
                                                 (SPADCALL
                                                  (|spadConstant| $ 51)
                                                  (QREFELT $ 153))
                                                 (QREFELT $ 41))
                                                (EXIT
                                                 (COND
                                                  ((EQL |deg1| 1)
                                                   (LETT |logs|
                                                         (CONS
                                                          (VECTOR
                                                           (|spadConstant| $
                                                                           161)
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             162)
                                                             1 (QREFELT $ 163))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL |lli|
                                                                          1
                                                                          (QREFELT
                                                                           $
                                                                           159))
                                                                1
                                                                (QREFELT $ 29))
                                                               (QREFELT $ 53))
                                                              (QREFELT $ 138))
                                                             (QREFELT $ 164))
                                                            (QREFELT $ 165))
                                                           (SPADCALL
                                                            (SPADCALL |liden|
                                                                      (QREFELT
                                                                       $ 138))
                                                            (QREFELT $ 164)))
                                                          |logs|)
                                                         . #8#))
                                                  ('T
                                                   (LETT |elpart|
                                                         (SPADCALL |elpart|
                                                                   (SPADCALL
                                                                    |linum|
                                                                    |liden|
                                                                    (QREFELT $
                                                                             150))
                                                                   (QREFELT $
                                                                            166))
                                                         . #8#))))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 50))
                                              (SEQ
                                               (LETT |rf1k|
                                                     (SPADCALL |rfc|
                                                               (QREFELT $ 167))
                                                     . #8#)
                                               (EXIT
                                                (LETT |zzl|
                                                      (SPADCALL |cfac|
                                                                (QREFELT $
                                                                         169))
                                                      . #8#)))))
                                            (EXIT
                                             (SEQ (LETT |e| NIL . #8#)
                                                  (LETT #2# |lli| . #8#) G190
                                                  (COND
                                                   ((OR (ATOM #2#)
                                                        (PROGN
                                                         (LETT |e| (CAR #2#)
                                                               . #8#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL |e| 2
                                                                (QREFELT $ 29))
                                                      (SPADCALL
                                                       (|spadConstant| $ 51)
                                                       (QREFELT $ 153))
                                                      (QREFELT $ 41))
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (EXIT
                                                        (LETT |logs|
                                                              (CONS
                                                               (VECTOR
                                                                (|spadConstant|
                                                                 $ 161)
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (|spadConstant|
                                                                   $ 162)
                                                                  1
                                                                  (QREFELT $
                                                                           163))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |e| 1
                                                                     (QREFELT $
                                                                              29))
                                                                    (QREFELT $
                                                                             53))
                                                                   (QREFELT $
                                                                            138))
                                                                  (QREFELT $
                                                                           164))
                                                                 (QREFELT $
                                                                          165))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |liden|
                                                                  (QREFELT $
                                                                           138))
                                                                 (QREFELT $
                                                                          164)))
                                                               |logs|)
                                                              . #8#))))))
                                                   (LETT |lle|
                                                         (|INTDEN;mk_li|
                                                          (SPADCALL |e| 1
                                                                    (QREFELT $
                                                                             29))
                                                          (SPADCALL
                                                           (SPADCALL |e| 2
                                                                     (QREFELT $
                                                                              29))
                                                           (QREFELT $ 170))
                                                          |u1| |c_shift| $)
                                                         . #8#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |deg1| 1
                                                                (QREFELT $ 50))
                                                      (SEQ
                                                       (LETT |zz| NIL . #8#)
                                                       (LETT #1# |zzl| . #8#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |zz|
                                                                    (CAR #1#)
                                                                    . #8#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT |res|
                                                               (SPADCALL |res|
                                                                         (SPADCALL
                                                                          |lle|
                                                                          |rf1k|
                                                                          |zz|
                                                                          (QREFELT
                                                                           $
                                                                           171))
                                                                         (QREFELT
                                                                          $
                                                                          72))
                                                               . #8#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #8#)
                                                       (GO G190) G191
                                                       (EXIT NIL)))
                                                     ('T
                                                      (LETT |res|
                                                            (SPADCALL |res|
                                                                      |lle|
                                                                      (QREFELT
                                                                       $ 72))
                                                            . #8#)))))
                                                  (LETT #2# (CDR #2#) . #8#)
                                                  (GO G190) G191
                                                  (EXIT NIL))))))))
                               (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (CONS 0
                                 (VECTOR
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 53))
                                            (QREFELT $ 138))
                                  |elpart|
                                  (SPADCALL (|spadConstant| $ 172) |logs| NIL
                                            (QREFELT $ 178)))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |INTDEN;mk_poly| (|c| |j| |u| |s| $)
  (PROG (|ifac| |res| |i1| |i| |j1| |eu|)
    (RETURN
     (SEQ
      (COND
       ((EQL |j| 0)
        (SPADCALL |c|
                  (SPADCALL |u|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u| (QREFELT $ 135))
                                       (SPADCALL (|spadConstant| $ 51) |s|
                                                 (QREFELT $ 73))
                                       (QREFELT $ 72))
                             (QREFELT $ 134))
                            (QREFELT $ 154))
                  (QREFELT $ 49)))
       ('T
        (SEQ
         (LETT |eu|
               (SPADCALL |s| (SPADCALL |u| (QREFELT $ 135)) (QREFELT $ 49))
               . #1=(|INTDEN;mk_poly|))
         (LETT |j1| (+ |j| 1) . #1#)
         (LETT |res|
               (SPADCALL (SPADCALL |u| |j1| (QREFELT $ 69))
                         (SPADCALL |j1| (QREFELT $ 45)) (QREFELT $ 73))
               . #1#)
         (LETT |res|
               (SPADCALL |res|
                         (SPADCALL (SPADCALL |u| |j| (QREFELT $ 69))
                                   (SPADCALL
                                    (SPADCALL |eu| (|spadConstant| $ 51)
                                              (QREFELT $ 72))
                                    (QREFELT $ 134))
                                   (QREFELT $ 49))
                         (QREFELT $ 154))
               . #1#)
         (LETT |ifac| (SPADCALL (SPADCALL |j| (QREFELT $ 45)) (QREFELT $ 153))
               . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |j|) (GO G191)))
              (SEQ (LETT |i1| (- |j| |i|) . #1#)
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL
                                    (SPADCALL |ifac|
                                              (SPADCALL |u| |i1|
                                                        (QREFELT $ 69))
                                              (QREFELT $ 49))
                                    (SPADCALL
                                     (SPADCALL (+ |i| 1) (QREFELT $ 45))
                                     (SPADCALL |eu| (QREFELT $ 153))
                                     (QREFELT $ 179))
                                    (QREFELT $ 49))
                                   (QREFELT $ 72))
                         . #1#)
                   (EXIT
                    (LETT |ifac|
                          (SPADCALL
                           (SPADCALL (SPADCALL |i1| (QREFELT $ 45)) |ifac|
                                     (QREFELT $ 49))
                           (QREFELT $ 153))
                          . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT (SPADCALL |c| |res| (QREFELT $ 49)))))))))) 

(DEFUN |INTDEN;poly_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G479 |zz| |lle| #2=#:G470 |ii| #3=#:G478 |e| |zzl| |rf1k|
         |elpart| |lpoly| |polyu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1|
         |polynum| |v1| #4=#:G477 |polyfac| |cfac| |polyden| #5=#:G475 |ldr|
         #6=#:G476 |polyden1| |logs| |u0| |dummy| |polyfacs| |elfac| |dn|
         |elden| |polydens1| #7=#:G474 |p| #8=#:G473 |polydens| #9=#:G472
         #10=#:G471 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;poly_factors| (SPADCALL |f| (QREFELT $ 111)) |k| |lk|
               |x| $)
              . #11=(|INTDEN;poly_int3|))
        (LETT |polydens|
              (PROGN
               (LETT #10# NIL . #11#)
               (SEQ (LETT |ldr| NIL . #11#) (LETT #9# |ldrs| . #11#) G190
                    (COND
                     ((OR (ATOM #9#) (PROGN (LETT |ldr| (CAR #9#) . #11#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #10# (CONS (QVELT |ldr| 0) #10#) . #11#)))
                    (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                    (EXIT (NREVERSE #10#))))
              . #11#)
        (EXIT
         (COND ((NULL |polydens|) (CONS 1 "failed"))
               (#12='T
                (SEQ
                 (LETT |polydens1|
                       (PROGN
                        (LETT #8# NIL . #11#)
                        (SEQ (LETT |p| NIL . #11#) (LETT #7# |polydens| . #11#)
                             G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |p| (CAR #7#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #8#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                                 (QREFELT $ 31))
                                       |p| (QREFELT $ 32))
                                      #8#)
                                     . #11#)))
                             (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #8#))))
                       . #11#)
                 (LETT |elden|
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 143))
                                 (SPADCALL (ELT $ 77) |polydens1|
                                           (QREFELT $ 146))
                                 (QREFELT $ 147))
                       . #11#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Inpossible 4"))
                        (#12#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose|
                                 (SPADCALL |rf| (QREFELT $ 148)) (QCDR |elden|)
                                 |polydens1| $)
                                . #11#)
                          (LETT |elfac| (|SPADfirst| |dn|) . #11#)
                          (LETT |polyfacs| (CDR |dn|) . #11#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |elfac|)
                                          (SPADCALL |elfac| (QREFELT $ 149))
                                          (QREFELT $ 150))
                                . #11#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 25)) . #11#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 27)) 1
                                          (QREFELT $ 29))
                                . #11#)
                          (LETT |res| (|spadConstant| $ 39) . #11#)
                          (LETT |logs| NIL . #11#)
                          (SEQ (LETT |polyden1| NIL . #11#)
                               (LETT #6# |polydens1| . #11#)
                               (LETT |ldr| NIL . #11#) (LETT #5# |ldrs| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |ldr| (CAR #5#) . #11#) NIL)
                                     (ATOM #6#)
                                     (PROGN
                                      (LETT |polyden1| (CAR #6#) . #11#)
                                      NIL))
                                 (GO G191)))
                               (SEQ (LETT |polyden| (QVELT |ldr| 0) . #11#)
                                    (LETT |cfac| (QVELT |ldr| 1) . #11#)
                                    (SEQ (LETT |polyfac| NIL . #11#)
                                         (LETT #4# |polyfacs| . #11#) G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |polyfac| (CAR #4#)
                                                      . #11#)
                                                NIL)
                                               (NULL
                                                (COND
                                                 ((SPADCALL |polyden1|
                                                            (SPADCALL |polyfac|
                                                                      (QREFELT
                                                                       $ 149))
                                                            (QREFELT $ 151))
                                                  'NIL)
                                                 ('T 'T))))
                                           (GO G191)))
                                         (SEQ (EXIT 0))
                                         (LETT #4# (CDR #4#) . #11#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND
                                     ((NULL
                                       (SPADCALL |polyden1|
                                                 (SPADCALL |polyfac|
                                                           (QREFELT $ 149))
                                                 (QREFELT $ 151)))
                                      (EXIT (|error| "Inpossible 5"))))
                                    (LETT |v1| (QVELT |ldr| 3) . #11#)
                                    (LETT |polynum|
                                          (SPADCALL
                                           (SPADCALL |polyden| (QREFELT $ 30))
                                           (|SPADfirst| |polyfac|)
                                           (QREFELT $ 32))
                                          . #11#)
                                    (SEQ
                                     (LETT |deg1|
                                           (SPADCALL |polyden| (QREFELT $ 34))
                                           . #11#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |deg1| 1 (QREFELT $ 50))
                                        (SEQ
                                         (LETT |rfc|
                                               (SPADCALL |cfac|
                                                         (QREFELT $ 152))
                                               . #11#)
                                         (LETT |rf1|
                                               (SPADCALL |rfc| (QVELT |ldr| 2)
                                                         (QREFELT $ 73))
                                               . #11#)
                                         (LETT |c_shift|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 51)
                                                          |rfc| (QREFELT $ 73))
                                                (QREFELT $ 153))
                                               . #11#)
                                         (LETT |ddf|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |cfac|
                                                           (QREFELT $ 155))
                                                 |dummy| |rfc| (QREFELT $ 156))
                                                (QREFELT $ 157))
                                               . #11#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |polynum| |dummy|
                                                             |rf1|
                                                             (QREFELT $ 156))
                                                   (QREFELT $ 157))
                                                  (SPADCALL |rfc| |ddf|
                                                            (QREFELT $ 49))
                                                  (QREFELT $ 73))
                                                 (QREFELT $ 153))
                                                . #11#))))
                                       ('T
                                        (SEQ
                                         (LETT |c_shift|
                                               (SPADCALL |cfac| 1
                                                         (QREFELT $ 48))
                                               . #11#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL |polynum|
                                                          (QREFELT $ 157))
                                                . #11#)))))))
                                    (LETT |polyu|
                                          (|INTDEN;li_int1| |tf| |v1| |x| $)
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |polyu| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #11#)
                                        (GO #2#)))
                                      ('T
                                       (SEQ
                                        (LETT |lpoly| (QCDR |polyu|) . #11#)
                                        (COND
                                         ((EQL (LENGTH |lpoly|) 1)
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |lpoly| 1
                                                        (QREFELT $ 159))
                                              2 (QREFELT $ 29))
                                             (|spadConstant| $ 39)
                                             (QREFELT $ 41))
                                            (EXIT
                                             (LETT |elpart|
                                                   (SPADCALL |elpart|
                                                             (SPADCALL
                                                              |polynum|
                                                              |polyden|
                                                              (QREFELT $ 150))
                                                             (QREFELT $ 166))
                                                   . #11#))))))
                                        (COND
                                         ((SPADCALL |deg1| 1 (QREFELT $ 50))
                                          (SEQ
                                           (LETT |rf1k|
                                                 (SPADCALL |rfc|
                                                           (QREFELT $ 167))
                                                 . #11#)
                                           (EXIT
                                            (LETT |zzl|
                                                  (SPADCALL |cfac|
                                                            (QREFELT $ 169))
                                                  . #11#)))))
                                        (EXIT
                                         (SEQ (LETT |e| NIL . #11#)
                                              (LETT #3# |lpoly| . #11#) G190
                                              (COND
                                               ((OR (ATOM #3#)
                                                    (PROGN
                                                     (LETT |e| (CAR #3#)
                                                           . #11#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |ii|
                                                     (SPADCALL
                                                      (SPADCALL |e| 2
                                                                (QREFELT $ 29))
                                                      (QREFELT $ 170))
                                                     . #11#)
                                               (EXIT
                                                (COND
                                                 ((< |ii| 0)
                                                  (PROGN
                                                   (LETT #2# (CONS 1 "failed")
                                                         . #11#)
                                                   (GO #2#)))
                                                 ((SPADCALL
                                                   (SPADCALL |e| 1
                                                             (QREFELT $ 29))
                                                   (|spadConstant| $ 39)
                                                   (QREFELT $ 41))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |lle|
                                                         (|INTDEN;mk_poly|
                                                          (SPADCALL |e| 1
                                                                    (QREFELT $
                                                                             29))
                                                          |ii| |v1| |c_shift|
                                                          $)
                                                         . #11#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |deg1| 1
                                                                (QREFELT $ 50))
                                                      (SEQ
                                                       (LETT |zz| NIL . #11#)
                                                       (LETT #1# |zzl| . #11#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |zz|
                                                                    (CAR #1#)
                                                                    . #11#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT |res|
                                                               (SPADCALL |res|
                                                                         (SPADCALL
                                                                          |lle|
                                                                          |rf1k|
                                                                          |zz|
                                                                          (QREFELT
                                                                           $
                                                                           171))
                                                                         (QREFELT
                                                                          $
                                                                          72))
                                                               . #11#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #11#)
                                                       (GO G190) G191
                                                       (EXIT NIL)))
                                                     ('T
                                                      (LETT |res|
                                                            (SPADCALL |res|
                                                                      |lle|
                                                                      (QREFELT
                                                                       $ 72))
                                                            . #11#)))))))))
                                              (LETT #3# (CDR #3#) . #11#)
                                              (GO G190) G191 (EXIT NIL))))))))
                               (LETT #5#
                                     (PROG1 (CDR #5#)
                                       (LETT #6# (CDR #6#) . #11#))
                                     . #11#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (CONS 0
                                 (VECTOR
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 53))
                                            (QREFELT $ 138))
                                  |elpart|
                                  (SPADCALL (|spadConstant| $ 172) |logs| NIL
                                            (QREFELT $ 178)))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTDEN;li_int;FKSR;13| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G487 |kk| #2=#:G486 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
            . #3=(|INTDEN;li_int;FKSR;13|))
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |kk| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 182)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 56)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 56))
                              (SPADCALL |kk| |k| (QREFELT $ 183)))
                             (#4='T 'NIL))
                       (LETT #2# (CONS |kk| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 185))
            . #3#)
      (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| $) . #3#)
      (EXIT
       (COND
        ((QEQCAR |res| 1)
         (VECTOR (|spadConstant| $ 172) |rf| (|spadConstant| $ 186)))
        (#4# (QCDR |res|)))))))) 

(DEFUN |INTDEN;poly_int;FKSR;14| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G494 |kk| #2=#:G493 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
            . #3=(|INTDEN;poly_int;FKSR;14|))
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |kk| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 182)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 56)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 56))
                              (SPADCALL |kk| |k| (QREFELT $ 183)))
                             (#4='T 'NIL))
                       (LETT #2# (CONS |kk| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 185))
            . #3#)
      (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| $) . #3#)
      (EXIT
       (COND
        ((QEQCAR |res| 1)
         (VECTOR (|spadConstant| $ 172) |rf| (|spadConstant| $ 186)))
        (#4# (QCDR |res|)))))))) 

(DEFUN |DenominatorIntegration| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G496)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DenominatorIntegration|)
                . #2=(|DenominatorIntegration|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DenominatorIntegration|
                         (LIST
                          (CONS NIL (CONS 1 (|DenominatorIntegration;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|DenominatorIntegration|))))))))))) 

(DEFUN |DenominatorIntegration;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DenominatorIntegration|) . #1=(|DenominatorIntegration|))
      (LETT $ (GETREFV 190) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DenominatorIntegration| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DenominatorIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| $)
              (|Kernel| 11) (|SparseMultivariatePolynomial| 28 7)
              (0 . |univariate|) (|SparseMultivariatePolynomial| 28 57)
              (|Expression| 28) (6 . |coerce|)
              (|SparseUnivariatePolynomial| 11) (|Mapping| 11 8)
              (|SparseUnivariatePolynomial| 8)
              (|SparseUnivariatePolynomialFunctions2| 8 11) (11 . |map|)
              (|Factored| 8)
              (|MultivariateFactorize| 7 (|IndexedExponents| 7) 28 8)
              (17 . |factor|) (|Record| (|:| |factor| 8) (|:| |exponent| 28))
              (|List| 21) (22 . |factors|) (|SingletonAsOrderedSet|)
              (27 . |create|) (|List| 11) (31 . |argument|) (|Integer|)
              (36 . |elt|) (42 . |leadingCoefficient|) (47 . |inv|) (52 . *)
              (|NonNegativeInteger|) (58 . |degree|) (63 . |Zero|)
              (67 . |Zero|) (|Symbol|) (71 . D) (77 . |Zero|) (|Boolean|)
              (81 . =) (87 . |coefficients|) (|Mapping| 40 11) (92 . |every?|)
              (98 . |coerce|) (103 . |One|) (107 . |One|) (111 . |coefficient|)
              (117 . *) (123 . >) (129 . |One|) (133 . |monomial|)
              (139 . |coerce|) (144 . -) (150 . |eval|) (157 . |is?|)
              (|Kernel| $) (163 . |coerce|) (|Vector| 11) (168 . |vector|)
              (|Union| 65 '"failed") (|IntegerLinearDependence| 11)
              (173 . |solveLinearlyOverQ|)
              (|Record| (|:| |num| (|List| 28)) (|:| |den| 28)) (|Vector| 160)
              (|InnerCommonDenominator| 28 160 (|List| 28) 65)
              (179 . |splitDenominator|) (184 . ~=) (190 . ^)
              (|Mapping| 11 11 11) (196 . |reduce|) (202 . +) (208 . /)
              (|Factored| 13) (214 . |One|) (218 . |nilFactor|) (224 . *)
              (230 . *) (|Mapping| 74 74 74) (|List| 74) (236 . |reduce|)
              (|PartialFraction| 13) (242 . |partialFraction|)
              (248 . |wholePart|) (253 . ~=) (259 . |numberOfFractionalTerms|)
              (264 . |nthFractionalTerm|) (270 . |firstNumer|)
              (275 . |firstDenom|) (280 . =) (286 . |expand|)
              (|Union| $ '#1="failed") (|SparseMultivariatePolynomial| 11 7)
              (291 . |exquo|) (|List| 7) (297 . |member?|) (303 . |One|)
              (307 . |One|) (311 . |monomial|) (318 . |coerce|)
              (|Mapping| 93 7) (|Mapping| 93 28)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 28 8 93)
              (323 . |map|) (|List| 57) (330 . |kernels|) (335 . ~=)
              (341 . |last|) (346 . |setDifference|) (352 . |numer|)
              (357 . |denom|) (362 . |degree|) (368 . |exquo|) (374 . >)
              (380 . ^) (386 . *) (|Union| 11 '"failed") (392 . |retractIfCan|)
              (|OutputForm|) (|Union| 93 '#1#) (397 . |coerce|) (|Void|)
              (402 . |print|) (407 . /) (413 . *) (419 . |new|)
              (423 . |coerce|) (428 . -) (434 . |coefficients|)
              (|Union| 26 '"failed") (|List| 37) (|ExpressionLinearSolve| 28)
              (439 . |lin_sol|) (445 . |log|) (450 . |exp|) (455 . |li|)
              (|Fraction| 13) (460 . |coerce|)
              (|SparseUnivariatePolynomial| 137) (|Mapping| 137 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 13 137 139)
              (465 . |map|) (471 . |denom|) (|Mapping| 13 13 13) (|List| 13)
              (476 . |reduce|) (482 . |exquo|) (488 . |numer|) (493 . |second|)
              (498 . /) (504 . =) (510 . |rootOf|) (515 . -) (520 . -)
              (526 . |differentiate|) (531 . |eval|) (538 . |retract|)
              (|List| 26) (543 . |elt|) (|Fraction| 28) (549 . |One|)
              (553 . |One|) (557 . |monomial|) (563 . |coerce|) (568 . -)
              (574 . +) (580 . |retract|) (|List| $) (585 . |zerosOf|)
              (590 . |retract|) (595 . |eval|) (602 . |Zero|)
              (|Record| (|:| |scalar| 160) (|:| |coeff| 139)
                        (|:| |logand| 139))
              (|List| 173) (|Record| (|:| |integrand| 137) (|:| |intvar| 137))
              (|List| 175) (|IntegrationResult| 137) (606 . |mkAnswer|)
              (613 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 7) 7
                                                     28 8 11)
              (619 . |multivariate|) (625 . |tower|) (630 . ~=)
              (|IntegrationTools| 28 11) (636 . |varselect|) (642 . |Zero|)
              (|Record| (|:| |answer| 137) (|:| |logpart| 137) (|:| |ir| 177))
              |INTDEN;li_int;FKSR;13| |INTDEN;poly_int;FKSR;14|)
           '#(|poly_int| 646 |li_int| 653) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 189
                                                 '(2 8 6 0 7 9 1 11 0 10 12 2
                                                   16 13 14 15 17 1 19 18 8 20
                                                   1 18 22 0 23 0 24 0 25 1 7
                                                   26 0 27 2 26 11 0 28 29 1 13
                                                   11 0 30 1 11 0 0 31 2 13 0
                                                   11 0 32 1 13 33 0 34 0 13 0
                                                   35 0 8 0 36 2 11 0 0 37 38 0
                                                   11 0 39 2 11 40 0 0 41 1 13
                                                   26 0 42 2 26 40 43 0 44 1 11
                                                   0 28 45 0 13 0 46 0 8 0 47 2
                                                   13 11 0 33 48 2 11 0 0 0 49
                                                   2 33 40 0 0 50 0 11 0 51 2
                                                   13 0 11 33 52 1 13 0 11 53 2
                                                   13 0 0 0 54 3 13 0 0 24 0 55
                                                   2 7 40 0 37 56 1 11 0 57 58
                                                   1 59 0 26 60 2 62 61 59 11
                                                   63 1 66 64 65 67 2 28 40 0 0
                                                   68 2 11 0 0 28 69 2 26 11 70
                                                   0 71 2 11 0 0 0 72 2 11 0 0
                                                   0 73 0 74 0 75 2 74 0 13 28
                                                   76 2 13 0 0 0 77 2 74 0 0 0
                                                   78 2 80 74 79 0 81 2 82 0 13
                                                   74 83 1 82 13 0 84 2 13 40 0
                                                   0 85 1 82 28 0 86 2 82 0 0
                                                   28 87 1 82 13 0 88 1 82 74 0
                                                   89 2 74 40 0 0 90 1 74 13 0
                                                   91 2 93 92 0 0 94 2 95 40 7
                                                   0 96 0 93 0 97 0 33 0 98 3
                                                   93 0 0 7 33 99 1 93 0 11 100
                                                   3 103 93 101 102 8 104 1 11
                                                   105 0 106 2 11 40 0 0 107 1
                                                   95 7 0 108 2 95 0 0 0 109 1
                                                   11 10 0 110 1 11 10 0 111 2
                                                   93 33 0 7 112 2 33 92 0 0
                                                   113 2 28 40 0 0 114 2 93 0 0
                                                   33 115 2 93 0 0 0 116 1 93
                                                   117 0 118 1 120 119 0 121 1
                                                   119 122 0 123 2 93 0 0 11
                                                   124 2 93 0 11 0 125 0 37 0
                                                   126 1 11 0 37 127 2 93 0 0 0
                                                   128 1 93 26 0 129 2 132 130
                                                   26 131 133 1 11 0 0 134 1 11
                                                   0 0 135 1 11 0 0 136 1 137 0
                                                   13 138 2 141 139 140 13 142
                                                   1 137 13 0 143 2 145 13 144
                                                   0 146 2 13 92 0 0 147 1 137
                                                   13 0 148 1 145 13 0 149 2
                                                   137 0 13 13 150 2 13 40 0 0
                                                   151 1 11 0 6 152 1 11 0 0
                                                   153 2 11 0 0 0 154 1 13 0 0
                                                   155 3 13 0 0 24 11 156 1 13
                                                   11 0 157 2 158 26 0 28 159 0
                                                   160 0 161 0 137 0 162 2 139
                                                   0 137 33 163 1 139 0 137 164
                                                   2 139 0 0 0 165 2 137 0 0 0
                                                   166 1 11 57 0 167 1 11 168 6
                                                   169 1 11 28 0 170 3 11 0 0
                                                   57 0 171 0 137 0 172 3 177 0
                                                   137 174 176 178 2 11 0 0 0
                                                   179 2 180 11 137 7 181 1 11
                                                   105 0 182 2 7 40 0 0 183 2
                                                   184 95 95 37 185 0 177 0 186
                                                   3 0 187 137 7 37 189 3 0 187
                                                   137 7 37 188)))))
           '|lookupComplete|)) 

(MAKEPROP '|DenominatorIntegration| 'NILADIC T) 
