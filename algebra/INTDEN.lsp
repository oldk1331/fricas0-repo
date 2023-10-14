
(/VERSIONCHECK 2) 

(DEFUN |INTDEN;MP_to_UP| (|p| |k| $)
  (PROG (|up1|)
    (RETURN
     (SEQ (LETT |up1| (SPADCALL |p| |k| (QREFELT $ 10)) |INTDEN;MP_to_UP|)
          (EXIT (SPADCALL (ELT $ 13) |up1| (QREFELT $ 18))))))) 

(DEFUN |INTDEN;factor;SmpF;2| (|p| $) (SPADCALL |p| (QREFELT $ 22))) 

(PUT '|INTDEN;factor;SmpF;3| '|SPADreplace|
     '(XLAM (|p|) (|error| "No factor for polynomials over R"))) 

(DEFUN |INTDEN;factor;SmpF;3| (|p| $)
  (|error| "No factor for polynomials over R")) 

(DEFUN |INTDEN;li_factors| (|df| |k| |lk| |x| $)
  (PROG (|res| |f2| |k2| #1=#:G245 |c| #2=#:G246 |ki| #3=#:G244 |u1| #4=#:G242
         |ui| #5=#:G243 #6=#:G241 |d| |cd| |sv| |su| |ulst| #7=#:G240 |kk|
         #8=#:G239 |dvvec| #9=#:G238 #10=#:G237 |vlst| #11=#:G236 #12=#:G235
         |rsum| |deg1| |f1| #13=#:G234 |fac| |u0| |nk| |dummy| |lfac|)
    (RETURN
     (SEQ
      (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
            . #14=(|INTDEN;li_factors|))
      (LETT |res| NIL . #14#) (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #14#)
      (LETT |vlst| NIL . #14#) (LETT |nk| (LENGTH |lk|) . #14#)
      (LETT |u0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
            . #14#)
      (SEQ (LETT |fac| NIL . #14#) (LETT #13# |lfac| . #14#) G190
           (COND
            ((OR (ATOM #13#) (PROGN (LETT |fac| (CAR #13#) . #14#) NIL))
             (GO G191)))
           (SEQ (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #14#)
                (LETT |f1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f1| (QREFELT $ 33)) (QREFELT $ 34))
                       |f1| (QREFELT $ 35))
                      . #14#)
                (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #14#)
                (EXIT
                 (COND ((EQL |deg1| 0) "iterate")
                       ((SPADCALL (CONS #'|INTDEN;li_factors!0| (VECTOR $ |x|))
                                  (SPADCALL |f1| (QREFELT $ 45))
                                  (QREFELT $ 47))
                        (LETT |res|
                              (CONS
                               (VECTOR |f1| |f1| |u0| (|spadConstant| $ 42) 1)
                               |res|)
                              . #14#))
                       ((NULL |lk|) "iterate")
                       ('T
                        (SEQ
                         (LETT |rsum|
                               (SPADCALL
                                (SPADCALL (SPADCALL |deg1| (QREFELT $ 48))
                                          (QREFELT $ 34))
                                (SPADCALL |f1| (- |deg1| 1) (QREFELT $ 51))
                                (QREFELT $ 52))
                               . #14#)
                         (COND
                          ((SPADCALL |deg1| 1 (QREFELT $ 53))
                           (LETT |f2|
                                 (SPADCALL |f1| |dummy|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 54) 1
                                                      (QREFELT $ 55))
                                            (SPADCALL |rsum| (QREFELT $ 56))
                                            (QREFELT $ 57))
                                           (QREFELT $ 58))
                                 . #14#)))
                         (COND
                          ((SPADCALL |deg1| 1 (QREFELT $ 53))
                           (COND
                            ((NULL
                              (SPADCALL
                               (CONS #'|INTDEN;li_factors!1| (VECTOR $ |x|))
                               (SPADCALL |f2| (QREFELT $ 45)) (QREFELT $ 47)))
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
                                                             (QREFELT $ 59))
                                                   (SPADCALL |kk|
                                                             (QREFELT $ 61)))
                                                  ('T
                                                   (SPADCALL
                                                    (SPADCALL |kk|
                                                              (QREFELT $ 30))
                                                    1 (QREFELT $ 32))))
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
                                                            (QREFELT $ 41))
                                                  #10#)
                                                 . #14#)))
                                         (LETT #9# (CDR #9#) . #14#) (GO G190)
                                         G191 (EXIT (NREVERSE #10#))))
                                   (QREFELT $ 63))
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
                                                              (QREFELT $ 59))
                                                    (SPADCALL
                                                     (SPADCALL |kk|
                                                               (QREFELT $ 30))
                                                     1 (QREFELT $ 32)))
                                                   ('T
                                                    (SPADCALL |kk|
                                                              (QREFELT $ 61))))
                                                  #8#)
                                                 . #14#)))
                                         (LETT #7# (CDR #7#) . #14#) (GO G190)
                                         G191 (EXIT (NREVERSE #8#))))
                                   . #14#)))))
                         (LETT |su|
                               (SPADCALL |dvvec|
                                         (SPADCALL |rsum| |x| (QREFELT $ 41))
                                         (QREFELT $ 66))
                               . #14#)
                         (EXIT
                          (COND ((QEQCAR |su| 1) "iterate")
                                ('T
                                 (SEQ (LETT |sv| (QCDR |su|) . #14#)
                                      (LETT |cd| (SPADCALL |sv| (QREFELT $ 70))
                                            . #14#)
                                      (LETT |d| (QCDR |cd|) . #14#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |d| 1 (QREFELT $ 71))
                                         "iterate")
                                        ('T
                                         (SEQ
                                          (LETT |u1|
                                                (SPADCALL (ELT $ 52)
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
                                                                       $ 72))
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
                                                          (QREFELT $ 74))
                                                . #14#)
                                          (LETT |k2|
                                                (SPADCALL (ELT $ 75)
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
                                                                       (SPADCALL
                                                                        |ki|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       (QREFELT
                                                                        $ 77))
                                                                      |c|
                                                                      (QREFELT
                                                                       $ 52))
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
                                                          (QREFELT $ 74))
                                                . #14#)
                                          (LETT |f2|
                                                (SPADCALL |f1| |dummy|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| $
                                                                            54)
                                                            1 (QREFELT $ 55))
                                                           (SPADCALL |k2|
                                                                     (QREFELT $
                                                                              56))
                                                           (QREFELT $ 57))
                                                          (QREFELT $ 58))
                                                . #14#)
                                          (COND
                                           ((NULL
                                             (SPADCALL
                                              (CONS #'|INTDEN;li_factors!2|
                                                    (VECTOR $ |x|))
                                              (SPADCALL |f2| (QREFELT $ 45))
                                              (QREFELT $ 47)))
                                            (EXIT (|error| "Impossible 1"))))
                                          (EXIT
                                           (LETT |res|
                                                 (CONS
                                                  (VECTOR |f1| |f2|
                                                          (SPADCALL
                                                           (SPADCALL |u0| |d|
                                                                     (QREFELT $
                                                                              72))
                                                           |u1| (QREFELT $ 52))
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
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                (QREFELT $ 44)))))) 

(DEFUN |INTDEN;li_factors!1| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                (QREFELT $ 44)))))) 

(DEFUN |INTDEN;li_factors!0| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;li_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                (QREFELT $ 44)))))) 

(DEFUN |INTDEN;poly_factors| (|df| |k| |lk| |x| $)
  (PROG (|res| |f2| |k2| #1=#:G313 |c| #2=#:G314 |ki| #3=#:G312 |u1| #4=#:G310
         |ui| #5=#:G311 #6=#:G309 |d| |cd| |sv| |su| |ulst| #7=#:G308 |kk|
         #8=#:G307 |dvvec| #9=#:G306 #10=#:G305 |vlst| #11=#:G304 #12=#:G303
         |lprod| |f1| |tc| |deg1| #13=#:G302 |fac| |v0| |nk| |dummy| |lfac|)
    (RETURN
     (SEQ
      (LETT |lfac| (SPADCALL (SPADCALL |df| (QREFELT $ 23)) (QREFELT $ 26))
            . #14=(|INTDEN;poly_factors|))
      (LETT |res| NIL . #14#) (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #14#)
      (LETT |vlst| NIL . #14#) (LETT |nk| (LENGTH |lk|) . #14#)
      (LETT |v0| (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1 (QREFELT $ 32))
            . #14#)
      (SEQ (LETT |fac| NIL . #14#) (LETT #13# |lfac| . #14#) G190
           (COND
            ((OR (ATOM #13#) (PROGN (LETT |fac| (CAR #13#) . #14#) NIL))
             (GO G191)))
           (SEQ
            (LETT |f1|
                  (LETT |f1| (|INTDEN;MP_to_UP| (QCAR |fac|) |k| $) . #14#)
                  . #14#)
            (LETT |deg1| (SPADCALL |f1| (QREFELT $ 37)) . #14#)
            (EXIT
             (COND ((EQL |deg1| 0) "iterate")
                   ('T
                    (SEQ (LETT |tc| (SPADCALL |f1| 0 (QREFELT $ 51)) . #14#)
                         (EXIT
                          (COND
                           ((SPADCALL |tc| (|spadConstant| $ 42)
                                      (QREFELT $ 44))
                            "iterate")
                           ('T
                            (SEQ
                             (LETT |f1|
                                   (SPADCALL (SPADCALL |tc| (QREFELT $ 34))
                                             |f1| (QREFELT $ 35))
                                   . #14#)
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (CONS #'|INTDEN;poly_factors!0|
                                       (VECTOR $ |x|))
                                 (SPADCALL |f1| (QREFELT $ 45)) (QREFELT $ 47))
                                (LETT |res|
                                      (CONS
                                       (VECTOR |f1| |f1| (|spadConstant| $ 54)
                                               |v0| 1)
                                       |res|)
                                      . #14#))
                               ((NULL |lk|) "iterate")
                               ('T
                                (SEQ
                                 (LETT |lprod| (SPADCALL |f1| (QREFELT $ 33))
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
                                                                              59))
                                                           (SPADCALL |kk|
                                                                     (QREFELT $
                                                                              61)))
                                                          ('T
                                                           (SPADCALL
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 30))
                                                            1 (QREFELT $ 32))))
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
                                                                             41))
                                                          #10#)
                                                         . #14#)))
                                                 (LETT #9# (CDR #9#) . #14#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #10#))))
                                           (QREFELT $ 63))
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
                                                                       $ 59))
                                                            (SPADCALL
                                                             (SPADCALL |kk|
                                                                       (QREFELT
                                                                        $ 30))
                                                             1 (QREFELT $ 32)))
                                                           ('T
                                                            (SPADCALL |kk|
                                                                      (QREFELT
                                                                       $ 61))))
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
                                                            (QREFELT $ 41))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |deg1|
                                                              (QREFELT $ 76))
                                                    (QREFELT $ 77))
                                                   |lprod| (QREFELT $ 52))
                                                  (QREFELT $ 78))
                                                 (QREFELT $ 66))
                                       . #14#)
                                 (EXIT
                                  (COND ((QEQCAR |su| 1) "iterate")
                                        ('T
                                         (SEQ (LETT |sv| (QCDR |su|) . #14#)
                                              (LETT |cd|
                                                    (SPADCALL |sv|
                                                              (QREFELT $ 70))
                                                    . #14#)
                                              (LETT |d| (QCDR |cd|) . #14#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |d| 1
                                                           (QREFELT $ 71))
                                                 "iterate")
                                                ('T
                                                 (SEQ
                                                  (LETT |u1|
                                                        (SPADCALL (ELT $ 52)
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
                                                                               72))
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
                                                                           74))
                                                        . #14#)
                                                  (LETT |k2|
                                                        (SPADCALL (ELT $ 75)
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
                                                                               (SPADCALL
                                                                                |ki|
                                                                                (QREFELT
                                                                                 $
                                                                                 76))
                                                                               (QREFELT
                                                                                $
                                                                                77))
                                                                              |c|
                                                                              (QREFELT
                                                                               $
                                                                               52))
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
                                                                           74))
                                                        . #14#)
                                                  (LETT |f2|
                                                        (SPADCALL |f1| |dummy|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |u1|
                                                                    (QREFELT $
                                                                             34))
                                                                   (SPADCALL
                                                                    (|spadConstant|
                                                                     $ 54)
                                                                    1
                                                                    (QREFELT $
                                                                             55))
                                                                   (QREFELT $
                                                                            35))
                                                                  (QREFELT $
                                                                           58))
                                                        . #14#)
                                                  (COND
                                                   ((NULL
                                                     (SPADCALL
                                                      (CONS
                                                       #'|INTDEN;poly_factors!1|
                                                       (VECTOR $ |x|))
                                                      (SPADCALL |f2|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 47)))
                                                    (EXIT "iterate")))
                                                  (EXIT
                                                   (LETT |res|
                                                         (CONS
                                                          (VECTOR |f1| |f2|
                                                                  |u1|
                                                                  (SPADCALL
                                                                   |v0| |k2|
                                                                   (QREFELT $
                                                                            75))
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
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                (QREFELT $ 44)))))) 

(DEFUN |INTDEN;poly_factors!0| (|c| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTDEN;poly_factors|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |x| (QREFELT $ 41)) (|spadConstant| $ 42)
                (QREFELT $ 44)))))) 

(DEFUN |INTDEN;decompose| (|nn| |elden| |lidens| $)
  (PROG (|res| |l1| |elfac| |cden| |cnum| |ct| |i| |nfacs| |pfr| |nd| |fdens|
         |ndf1| #1=#:G331 |nden| #2=#:G330 |ndens| |nden1|)
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
                        (LETT #2# (CONS (SPADCALL |nden| 1 (QREFELT $ 80)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |ndf1| (SPADCALL |nden1| 1 (QREFELT $ 80)) . #3#)
          (LETT |fdens| (CONS |ndf1| |fdens|) . #3#)
          (LETT |nd| (SPADCALL (ELT $ 82) |fdens| (QREFELT $ 85)) . #3#)
          (LETT |pfr| (SPADCALL |nn| |nd| (QREFELT $ 87)) . #3#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pfr| (QREFELT $ 88)) (|spadConstant| $ 39)
                       (QREFELT $ 89))
             (|error| "impossible: wholePart(pfr) ~= 0"))
            ('T
             (SEQ (LETT |nfacs| (SPADCALL |pfr| (QREFELT $ 90)) . #3#)
                  (LETT |elfac| (|spadConstant| $ 39) . #3#)
                  (LETT |res| NIL . #3#)
                  (SEQ (LETT |i| 1 . #3#) G190
                       (COND ((|greater_SI| |i| |nfacs|) (GO G191)))
                       (SEQ
                        (LETT |ct| (SPADCALL |pfr| |i| (QREFELT $ 91)) . #3#)
                        (LETT |cnum| (SPADCALL |ct| (QREFELT $ 92)) . #3#)
                        (LETT |cden| (SPADCALL |ct| (QREFELT $ 93)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |cden| |ndf1| (QREFELT $ 94))
                           (LETT |elfac| |cnum| . #3#))
                          ('T
                           (SEQ
                            (LETT |l1|
                                  (LIST |cnum|
                                        (SPADCALL |cden| (QREFELT $ 95)))
                                  . #3#)
                            (EXIT (LETT |res| (CONS |l1| |res|) . #3#)))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS (LIST |elfac| |nden1|) |res|)))))))))) 

(DEFUN |INTDEN;p_power_in_q| (|p| |q| $)
  (PROG (|res| #1=#:G333 |qq|)
    (RETURN
     (SEQ (LETT |res| 0 . #2=(|INTDEN;p_power_in_q|))
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 98)) . #2#)
                          0))
                 (GO G191)))
               (SEQ
                (LETT |q|
                      (PROG2 (LETT #1# |qq| . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0)
                                       (|SparseMultivariatePolynomial|
                                        (|Expression| (QREFELT $ 6))
                                        (|Kernel|
                                         (|Expression| (QREFELT $ 6))))
                                       #1#))
                      . #2#)
                (EXIT (LETT |res| (+ |res| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |INTDEN;MP_to_MPF| (|p| |lk| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|INTDEN;MP_to_MPF!0| (VECTOR $ |lk|))
               (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 108))))) 

(DEFUN |INTDEN;MP_to_MPF!1| (|c| $)
  (SPADCALL (SPADCALL |c| (QREFELT $ 77)) (QREFELT $ 104))) 

(DEFUN |INTDEN;MP_to_MPF!0| (|k| $$)
  (PROG (|lk| $)
    (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL |k| |lk| (QREFELT $ 100))
        (SPADCALL (|spadConstant| $ 101) |k| (|spadConstant| $ 102)
                  (QREFELT $ 103)))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 61)) (QREFELT $ 104)))))))) 

(DEFUN |INTDEN;li_int1| (|f| |u| |x| $)
  (PROG (#1=#:G398 |c| |j| #2=#:G397 |sl| |sl0| |eqsl| |eqs| #3=#:G395 |p1|
         #4=#:G396 |coef| |lpow| |pp| #5=#:G394 |lpow0| |coefs| #6=#:G393 |nf1|
         |cc| #7=#:G388 |ccru| |ccu| |dup| #8=#:G361 |nup| #9=#:G359 |n| |m|
         |qu| |degdu| |degnu| |degdf| |degnf| |du| |nu| |df1| |vk2| #10=#:G392
         |k| #11=#:G391 |f1| |deru| |k1| |vk| #12=#:G390 #13=#:G389)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |vk|
              (PROGN
               (LETT #13# NIL . #14=(|INTDEN;li_int1|))
               (SEQ (LETT |k| NIL . #14#)
                    (LETT #12# (SPADCALL |u| (QREFELT $ 110)) . #14#) G190
                    (COND
                     ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#) . #14#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT $ 61)) |x|
                                   (QREFELT $ 41))
                         (|spadConstant| $ 42) (QREFELT $ 111))
                        (LETT #13# (CONS |k| #13#) . #14#)))))
                    (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                    (EXIT (NREVERSE #13#))))
              . #14#)
        (EXIT
         (COND ((NULL |vk|) (|error| "li_int1: constant log"))
               (#15='T
                (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 112)) . #14#)
                     (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 41)) . #14#)
                     (LETT |f1| (SPADCALL |f| |deru| (QREFELT $ 78)) . #14#)
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 41))
                                  (|spadConstant| $ 42) (QREFELT $ 44))
                        (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 42)))))
                       (#15#
                        (SEQ
                         (LETT |vk2|
                               (PROGN
                                (LETT #11# NIL . #14#)
                                (SEQ (LETT |k| NIL . #14#)
                                     (LETT #10# (SPADCALL |f1| (QREFELT $ 110))
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
                                           (SPADCALL |k| (QREFELT $ 61)) |x|
                                           (QREFELT $ 41))
                                          (|spadConstant| $ 42)
                                          (QREFELT $ 111))
                                         (LETT #11# (CONS |k| #11#) . #14#)))))
                                     (LETT #10# (CDR #10#) . #14#) (GO G190)
                                     G191 (EXIT (NREVERSE #11#))))
                               . #14#)
                         (COND
                          ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 113)))
                           (COND
                            ((NULL
                              (NULL (SPADCALL |vk| |vk2| (QREFELT $ 113))))
                             (EXIT
                              (PROGN
                               (LETT #7# (CONS 1 #16="failed") . #14#)
                               (GO #7#))))))
                          (#15#
                           (EXIT
                            (PROGN (LETT #7# (CONS 1 #16#) . #14#) (GO #7#)))))
                         (LETT |nf1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 114)) |vk| $)
                               . #14#)
                         (LETT |df1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 115)) |vk| $)
                               . #14#)
                         (LETT |nu|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 114)) |vk| $)
                               . #14#)
                         (LETT |du|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 115)) |vk| $)
                               . #14#)
                         (LETT |degnf| (SPADCALL |nf1| |k1| (QREFELT $ 116))
                               . #14#)
                         (LETT |degdf| (SPADCALL |df1| |k1| (QREFELT $ 116))
                               . #14#)
                         (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 116))
                               . #14#)
                         (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 116))
                               . #14#)
                         (COND
                          ((EQL |degdu| 0)
                           (SEQ
                            (LETT |qu|
                                  (SPADCALL |degdf| |degnu| (QREFELT $ 117))
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
                                                    (QREFELT $ 117))
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
                                  (SPADCALL |degdf| |degdu| (QREFELT $ 117))
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
                                                    (QREFELT $ 117))
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
                                         |degdf| (QREFELT $ 71))
                               (PROGN
                                (LETT #7# (CONS 1 "failed") . #14#)
                                (GO #7#))))))))
                         (LETT |nup|
                               (COND
                                ((SPADCALL |n| 0 (QREFELT $ 118))
                                 (SPADCALL |nu|
                                           (PROG1 (LETT #9# |n| . #14#)
                                             (|check_subtype| (>= #9# 0)
                                                              '(|NonNegativeInteger|)
                                                              #9#))
                                           (QREFELT $ 119)))
                                (#15# (|spadConstant| $ 101)))
                               . #14#)
                         (LETT |dup|
                               (COND
                                ((SPADCALL |m| 0 (QREFELT $ 118))
                                 (SPADCALL |du|
                                           (PROG1 (LETT #8# |m| . #14#)
                                             (|check_subtype| (>= #8# 0)
                                                              '(|NonNegativeInteger|)
                                                              #8#))
                                           (QREFELT $ 119)))
                                (#15# (|spadConstant| $ 101)))
                               . #14#)
                         (LETT |ccu|
                               (SPADCALL |df1|
                                         (SPADCALL |dup| |nup| (QREFELT $ 120))
                                         (QREFELT $ 98))
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
                                   (SPADCALL (QCDR |ccu|) (QREFELT $ 122))
                                   . #14#)
                             (EXIT
                              (COND
                               ((QEQCAR |ccru| 1)
                                (SEQ
                                 (SPADCALL (SPADCALL |ccu| (QREFELT $ 125))
                                           (QREFELT $ 127))
                                 (EXIT
                                  (PROGN
                                   (LETT #7# (CONS 1 "failed") . #14#)
                                   (GO #7#)))))
                               (#15#
                                (SEQ (LETT |cc| (QCDR |ccru|) . #14#)
                                     (LETT |nf1|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 54)
                                                      |cc| (QREFELT $ 78))
                                            |nf1| (QREFELT $ 130))
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
                                                           (QREFELT $ 131))
                                                          #6#)
                                                         . #14#)))
                                                 (LETT |j| (+ |j| 1) . #14#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #6#))))
                                           . #14#)
                                     (LETT |eqs| |nf1| . #14#)
                                     (LETT |pp| (|spadConstant| $ 101) . #14#)
                                     (LETT |lpow0| (LIST |pp|) . #14#)
                                     (SEQ (LETT |j| (- 1 |n|) . #14#) G190
                                          (COND ((> |j| |m|) (GO G191)))
                                          (SEQ
                                           (LETT |pp|
                                                 (SPADCALL |nu| |pp|
                                                           (QREFELT $ 120))
                                                 . #14#)
                                           (EXIT
                                            (LETT |lpow0| (CONS |pp| |lpow0|)
                                                  . #14#)))
                                          (LETT |j| (+ |j| 1) . #14#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |lpow| (LIST (|SPADfirst| |lpow0|))
                                           . #14#)
                                     (LETT |pp| (|spadConstant| $ 101) . #14#)
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
                                                           (QREFELT $ 120))
                                                 . #14#)
                                           (EXIT
                                            (LETT |lpow|
                                                  (CONS
                                                   (SPADCALL |pp| |p1|
                                                             (QREFELT $ 120))
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
                                                                        $ 132))
                                                             |p1|
                                                             (QREFELT $ 130))
                                                            (QREFELT $ 133))
                                                  . #14#)))
                                          (LETT #3#
                                                (PROG1 (CDR #3#)
                                                  (LETT #4# (CDR #4#) . #14#))
                                                . #14#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |eqsl|
                                           (SPADCALL |eqs| (QREFELT $ 134))
                                           . #14#)
                                     (LETT |sl0|
                                           (SPADCALL |eqsl| |coefs|
                                                     (QREFELT $ 138))
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
                                                                     $ 42)
                                                                    (QREFELT $
                                                                             111))
                                                          (LETT #2#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         48)))
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
                   (SPADCALL (SPADCALL |u| (QREFELT $ 139)) |s| (QREFELT $ 75))
                   (QREFELT $ 139))
                  (QREFELT $ 52)))
       ('T
        (SEQ (LETT |es| (SPADCALL |s| (QREFELT $ 140)) |INTDEN;mk_li|)
             (EXIT
              (SPADCALL
               (SPADCALL |c|
                         (SPADCALL
                          (SPADCALL (SPADCALL |u| |es| (QREFELT $ 52))
                                    (+ |j| 1) (QREFELT $ 72))
                          (QREFELT $ 141))
                         (QREFELT $ 52))
               (SPADCALL |es| (+ |j| 1) (QREFELT $ 72)) (QREFELT $ 78)))))))))) 

(DEFUN |INTDEN;UP2UPR| (|p| $)
  (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 147))) 

(DEFUN |INTDEN;UP2UPR!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 56)) (QREFELT $ 143))) 

(DEFUN |INTDEN;li_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G441 |zz| |lle| |logs| #2=#:G440 |e| |zzl| |rf1k| |elpart|
         |lli| #3=#:G435 |liu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1| |linum|
         |u1| #4=#:G439 |lifac| |cfac| |liden| #5=#:G438 |ldr| |u0| |dummy|
         |lifacs| |elfac| |dn| |elden| |lidens| #6=#:G437 #7=#:G436 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;li_factors| (SPADCALL |f| (QREFELT $ 115)) |k| |lk| |x|
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
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 148))
                                 (SPADCALL (ELT $ 81) |lidens| (QREFELT $ 151))
                                 (QREFELT $ 152))
                       . #8#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                        (#9#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose|
                                 (SPADCALL |rf| (QREFELT $ 153)) (QCDR |elden|)
                                 |lidens| $)
                                . #8#)
                          (LETT |elfac| (|SPADfirst| |dn|) . #8#)
                          (LETT |lifacs| (CDR |dn|) . #8#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |elfac|)
                                          (SPADCALL |elfac| (QREFELT $ 154))
                                          (QREFELT $ 155))
                                . #8#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #8#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                          (QREFELT $ 32))
                                . #8#)
                          (LETT |res| (|spadConstant| $ 42) . #8#)
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
                                                                       $ 154))
                                                            (QREFELT $ 156))
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
                                                           (QREFELT $ 154))
                                                 (QREFELT $ 156)))
                                      (EXIT (|error| "Impossible 3"))))
                                    (LETT |u1| (QVELT |ldr| 2) . #8#)
                                    (LETT |linum| (|SPADfirst| |lifac|) . #8#)
                                    (SEQ
                                     (LETT |deg1|
                                           (SPADCALL |liden| (QREFELT $ 37))
                                           . #8#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                        (SEQ
                                         (LETT |rfc|
                                               (SPADCALL |cfac|
                                                         (QREFELT $ 157))
                                               . #8#)
                                         (LETT |c_shift|
                                               (SPADCALL |rfc| (QREFELT $ 158))
                                               . #8#)
                                         (LETT |rf1|
                                               (SPADCALL |rfc| (QVELT |ldr| 3)
                                                         (QREFELT $ 159))
                                               . #8#)
                                         (LETT |ddf|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |liden|
                                                           (QREFELT $ 160))
                                                 |dummy| |rf1| (QREFELT $ 161))
                                                (QREFELT $ 162))
                                               . #8#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |linum| |dummy|
                                                            |rf1|
                                                            (QREFELT $ 161))
                                                  (QREFELT $ 162))
                                                 |ddf| (QREFELT $ 78))
                                                . #8#))))
                                       ('T
                                        (SEQ
                                         (LETT |c_shift|
                                               (SPADCALL |cfac| 0
                                                         (QREFELT $ 51))
                                               . #8#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL |linum|
                                                          (QREFELT $ 162))
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
                                                            (QREFELT $ 164))
                                                  2 (QREFELT $ 32))
                                                 (SPADCALL
                                                  (|spadConstant| $ 54)
                                                  (QREFELT $ 158))
                                                 (QREFELT $ 44))
                                                (EXIT
                                                 (COND
                                                  ((EQL |deg1| 1)
                                                   (LETT |logs|
                                                         (CONS
                                                          (VECTOR
                                                           (|spadConstant| $
                                                                           166)
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             167)
                                                             1 (QREFELT $ 168))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL |lli|
                                                                          1
                                                                          (QREFELT
                                                                           $
                                                                           164))
                                                                1
                                                                (QREFELT $ 32))
                                                               (QREFELT $ 56))
                                                              (QREFELT $ 143))
                                                             (QREFELT $ 169))
                                                            (QREFELT $ 170))
                                                           (SPADCALL
                                                            (SPADCALL |liden|
                                                                      (QREFELT
                                                                       $ 143))
                                                            (QREFELT $ 169)))
                                                          |logs|)
                                                         . #8#))
                                                  ('T
                                                   (LETT |elpart|
                                                         (SPADCALL |elpart|
                                                                   (SPADCALL
                                                                    |linum|
                                                                    |liden|
                                                                    (QREFELT $
                                                                             155))
                                                                   (QREFELT $
                                                                            171))
                                                         . #8#))))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 53))
                                              (SEQ
                                               (LETT |rf1k|
                                                     (SPADCALL |rfc|
                                                               (QREFELT $ 172))
                                                     . #8#)
                                               (EXIT
                                                (LETT |zzl|
                                                      (SPADCALL |cfac|
                                                                (QREFELT $
                                                                         174))
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
                                                                (QREFELT $ 32))
                                                      (SPADCALL
                                                       (|spadConstant| $ 54)
                                                       (QREFELT $ 158))
                                                      (QREFELT $ 44))
                                                     (COND
                                                      ((EQL |deg1| 1)
                                                       (EXIT
                                                        (LETT |logs|
                                                              (CONS
                                                               (VECTOR
                                                                (|spadConstant|
                                                                 $ 166)
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (|spadConstant|
                                                                   $ 167)
                                                                  1
                                                                  (QREFELT $
                                                                           168))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     |e| 1
                                                                     (QREFELT $
                                                                              32))
                                                                    (QREFELT $
                                                                             56))
                                                                   (QREFELT $
                                                                            143))
                                                                  (QREFELT $
                                                                           169))
                                                                 (QREFELT $
                                                                          170))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |liden|
                                                                  (QREFELT $
                                                                           143))
                                                                 (QREFELT $
                                                                          169)))
                                                               |logs|)
                                                              . #8#))))))
                                                   (LETT |lle|
                                                         (|INTDEN;mk_li|
                                                          (SPADCALL |e| 1
                                                                    (QREFELT $
                                                                             32))
                                                          (SPADCALL
                                                           (SPADCALL |e| 2
                                                                     (QREFELT $
                                                                              32))
                                                           (QREFELT $ 175))
                                                          |u1| |c_shift| $)
                                                         . #8#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |deg1| 1
                                                                (QREFELT $ 53))
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
                                                                           176))
                                                                         (QREFELT
                                                                          $
                                                                          75))
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
                                                                       $ 75))
                                                            . #8#)))))
                                                  (LETT #2# (CDR #2#) . #8#)
                                                  (GO G190) G191
                                                  (EXIT NIL))))))))
                               (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (CONS 0
                                 (VECTOR
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                            (QREFELT $ 143))
                                  |elpart|
                                  (SPADCALL (|spadConstant| $ 177) |logs| NIL
                                            (QREFELT $ 183)))))))))))))))
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
                             (SPADCALL (SPADCALL |u| (QREFELT $ 140))
                                       (SPADCALL (|spadConstant| $ 54) |s|
                                                 (QREFELT $ 78))
                                       (QREFELT $ 75))
                             (QREFELT $ 139))
                            (QREFELT $ 159))
                  (QREFELT $ 52)))
       ('T
        (SEQ
         (LETT |eu|
               (SPADCALL |s| (SPADCALL |u| (QREFELT $ 140)) (QREFELT $ 52))
               . #1=(|INTDEN;mk_poly|))
         (LETT |j1| (+ |j| 1) . #1#)
         (LETT |res|
               (SPADCALL (SPADCALL |u| |j1| (QREFELT $ 72))
                         (SPADCALL (SPADCALL |j1| (QREFELT $ 76))
                                   (QREFELT $ 77))
                         (QREFELT $ 78))
               . #1#)
         (LETT |res|
               (SPADCALL |res|
                         (SPADCALL (SPADCALL |u| |j| (QREFELT $ 72))
                                   (SPADCALL
                                    (SPADCALL |eu| (|spadConstant| $ 54)
                                              (QREFELT $ 75))
                                    (QREFELT $ 139))
                                   (QREFELT $ 52))
                         (QREFELT $ 159))
               . #1#)
         (LETT |ifac|
               (SPADCALL
                (SPADCALL (SPADCALL |j| (QREFELT $ 76)) (QREFELT $ 77))
                (QREFELT $ 158))
               . #1#)
         (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |j|) (GO G191)))
              (SEQ (LETT |i1| (- |j| |i|) . #1#)
                   (LETT |res|
                         (SPADCALL |res|
                                   (SPADCALL
                                    (SPADCALL |ifac|
                                              (SPADCALL |u| |i1|
                                                        (QREFELT $ 72))
                                              (QREFELT $ 52))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (+ |i| 1) (QREFELT $ 76))
                                      (QREFELT $ 77))
                                     (SPADCALL |eu| (QREFELT $ 158))
                                     (QREFELT $ 184))
                                    (QREFELT $ 52))
                                   (QREFELT $ 75))
                         . #1#)
                   (EXIT
                    (LETT |ifac|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |i1| (QREFELT $ 76))
                                      (QREFELT $ 77))
                            |ifac| (QREFELT $ 52))
                           (QREFELT $ 158))
                          . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT (SPADCALL |c| |res| (QREFELT $ 52)))))))))) 

(DEFUN |INTDEN;poly_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G484 |zz| |lle| #2=#:G475 |ii| #3=#:G483 |e| |zzl| |rf1k|
         |elpart| |lpoly| |polyu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1|
         |polynum| |v1| #4=#:G482 |polyfac| |cfac| |polyden| #5=#:G480 |ldr|
         #6=#:G481 |polyden1| |logs| |u0| |dummy| |polyfacs| |elfac| |dn|
         |elden| |polydens1| #7=#:G479 |p| #8=#:G478 |polydens| #9=#:G477
         #10=#:G476 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;poly_factors| (SPADCALL |f| (QREFELT $ 115)) |k| |lk|
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
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                                 (QREFELT $ 34))
                                       |p| (QREFELT $ 35))
                                      #8#)
                                     . #11#)))
                             (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                             (EXIT (NREVERSE #8#))))
                       . #11#)
                 (LETT |elden|
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 148))
                                 (SPADCALL (ELT $ 81) |polydens1|
                                           (QREFELT $ 151))
                                 (QREFELT $ 152))
                       . #11#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                        (#12#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose|
                                 (SPADCALL |rf| (QREFELT $ 153)) (QCDR |elden|)
                                 |polydens1| $)
                                . #11#)
                          (LETT |elfac| (|SPADfirst| |dn|) . #11#)
                          (LETT |polyfacs| (CDR |dn|) . #11#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |elfac|)
                                          (SPADCALL |elfac| (QREFELT $ 154))
                                          (QREFELT $ 155))
                                . #11#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #11#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                          (QREFELT $ 32))
                                . #11#)
                          (LETT |res| (|spadConstant| $ 42) . #11#)
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
                                                                       $ 154))
                                                            (QREFELT $ 156))
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
                                                           (QREFELT $ 154))
                                                 (QREFELT $ 156)))
                                      (EXIT (|error| "Impossible 5"))))
                                    (LETT |v1| (QVELT |ldr| 3) . #11#)
                                    (LETT |polynum|
                                          (SPADCALL
                                           (SPADCALL |polyden| (QREFELT $ 33))
                                           (|SPADfirst| |polyfac|)
                                           (QREFELT $ 35))
                                          . #11#)
                                    (SEQ
                                     (LETT |deg1|
                                           (SPADCALL |polyden| (QREFELT $ 37))
                                           . #11#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                        (SEQ
                                         (LETT |rfc|
                                               (SPADCALL |cfac|
                                                         (QREFELT $ 157))
                                               . #11#)
                                         (LETT |rf1|
                                               (SPADCALL |rfc| (QVELT |ldr| 2)
                                                         (QREFELT $ 78))
                                               . #11#)
                                         (LETT |c_shift|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 54)
                                                          |rfc| (QREFELT $ 78))
                                                (QREFELT $ 158))
                                               . #11#)
                                         (LETT |ddf|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |cfac|
                                                           (QREFELT $ 160))
                                                 |dummy| |rfc| (QREFELT $ 161))
                                                (QREFELT $ 162))
                                               . #11#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |polynum| |dummy|
                                                             |rf1|
                                                             (QREFELT $ 161))
                                                   (QREFELT $ 162))
                                                  (SPADCALL |rfc| |ddf|
                                                            (QREFELT $ 52))
                                                  (QREFELT $ 78))
                                                 (QREFELT $ 158))
                                                . #11#))))
                                       ('T
                                        (SEQ
                                         (LETT |c_shift|
                                               (SPADCALL |cfac| 1
                                                         (QREFELT $ 51))
                                               . #11#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL |polynum|
                                                          (QREFELT $ 162))
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
                                                        (QREFELT $ 164))
                                              2 (QREFELT $ 32))
                                             (|spadConstant| $ 42)
                                             (QREFELT $ 44))
                                            (EXIT
                                             (LETT |elpart|
                                                   (SPADCALL |elpart|
                                                             (SPADCALL
                                                              |polynum|
                                                              |polyden|
                                                              (QREFELT $ 155))
                                                             (QREFELT $ 171))
                                                   . #11#))))))
                                        (COND
                                         ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                          (SEQ
                                           (LETT |rf1k|
                                                 (SPADCALL |rfc|
                                                           (QREFELT $ 172))
                                                 . #11#)
                                           (EXIT
                                            (LETT |zzl|
                                                  (SPADCALL |cfac|
                                                            (QREFELT $ 174))
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
                                                                (QREFELT $ 32))
                                                      (QREFELT $ 175))
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
                                                             (QREFELT $ 32))
                                                   (|spadConstant| $ 42)
                                                   (QREFELT $ 44))
                                                  "iterate")
                                                 ('T
                                                  (SEQ
                                                   (LETT |lle|
                                                         (|INTDEN;mk_poly|
                                                          (SPADCALL |e| 1
                                                                    (QREFELT $
                                                                             32))
                                                          |ii| |v1| |c_shift|
                                                          $)
                                                         . #11#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |deg1| 1
                                                                (QREFELT $ 53))
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
                                                                           176))
                                                                         (QREFELT
                                                                          $
                                                                          75))
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
                                                                       $ 75))
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
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                            (QREFELT $ 143))
                                  |elpart|
                                  (SPADCALL (|spadConstant| $ 177) |logs| NIL
                                            (QREFELT $ 183)))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTDEN;li_int;FKSR;15| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G492 |kk| #2=#:G491 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 186))
            . #3=(|INTDEN;li_int;FKSR;15|))
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |kk| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 187)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 59))
                              (SPADCALL |kk| |k| (QREFELT $ 188)))
                             (#4='T 'NIL))
                       (LETT #2# (CONS |kk| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 190))
            . #3#)
      (LETT |res| (|INTDEN;li_int3| |f| |rf| |k| |lk| |x| $) . #3#)
      (EXIT
       (COND
        ((QEQCAR |res| 1)
         (VECTOR (|spadConstant| $ 177) |rf| (|spadConstant| $ 191)))
        (#4# (QCDR |res|)))))))) 

(DEFUN |INTDEN;poly_int;FKSR;16| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G499 |kk| #2=#:G498 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 186))
            . #3=(|INTDEN;poly_int;FKSR;16|))
      (LETT |lk|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |kk| NIL . #3#)
                   (LETT #1# (SPADCALL |f| (QREFELT $ 187)) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 59))
                              (SPADCALL |kk| |k| (QREFELT $ 188)))
                             (#4='T 'NIL))
                       (LETT #2# (CONS |kk| #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             |x| (QREFELT $ 190))
            . #3#)
      (LETT |res| (|INTDEN;poly_int3| |f| |rf| |k| |lk| |x| $) . #3#)
      (EXIT
       (COND
        ((QEQCAR |res| 1)
         (VECTOR (|spadConstant| $ 177) |rf| (|spadConstant| $ 191)))
        (#4# (QCDR |res|)))))))) 

(DEFUN |DenominatorIntegration| (#1=#:G500)
  (PROG ()
    (RETURN
     (PROG (#2=#:G501)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DenominatorIntegration|)
                                           '|domainEqualList|)
                . #3=(|DenominatorIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|DenominatorIntegration;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DenominatorIntegration|))))))))))) 

(DEFUN |DenominatorIntegration;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DenominatorIntegration|))
      (LETT |dv$| (LIST '|DenominatorIntegration| DV$1) . #1#)
      (LETT $ (GETREFV 195) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DenominatorIntegration| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 19
                (COND
                 ((|HasCategory| |#1| '(|EuclideanDomain|))
                  (|HasCategory| |#1| '(|CharacteristicZero|)))
                 ('T 'NIL)))
      (COND
       ((QREFELT $ 19)
        (QSETREFV $ 23 (CONS (|dispatchFunction| |INTDEN;factor;SmpF;2|) $)))
       ('T
        (QSETREFV $ 23 (CONS (|dispatchFunction| |INTDEN;factor;SmpF;3|) $))))
      $)))) 

(MAKEPROP '|DenominatorIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|SparseUnivariatePolynomial| $) (|Kernel| 12)
              (|SparseMultivariatePolynomial| 6 8) (0 . |univariate|)
              (|SparseMultivariatePolynomial| 6 60) (|Expression| 6)
              (6 . |coerce|) (|SparseUnivariatePolynomial| 12) (|Mapping| 12 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 12) (11 . |map|)
              '#:G127 (|Factored| 9)
              (|MultivariateFactorize| 8 (|IndexedExponents| 8) 6 9)
              (17 . |factor|) (22 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 31)) (|List| 24)
              (27 . |factors|) (|SingletonAsOrderedSet|) (32 . |create|)
              (|List| 12) (36 . |argument|) (|Integer|) (41 . |elt|)
              (47 . |leadingCoefficient|) (52 . |inv|) (57 . *)
              (|NonNegativeInteger|) (63 . |degree|) (68 . |Zero|)
              (72 . |Zero|) (|Symbol|) (76 . D) (82 . |Zero|) (|Boolean|)
              (86 . =) (92 . |coefficients|) (|Mapping| 43 12) (97 . |every?|)
              (103 . |coerce|) (108 . |One|) (112 . |One|)
              (116 . |coefficient|) (122 . *) (128 . >) (134 . |One|)
              (138 . |monomial|) (144 . |coerce|) (149 . -) (155 . |eval|)
              (162 . |is?|) (|Kernel| $) (168 . |coerce|) (|Vector| 12)
              (173 . |vector|) (|Union| 68 '"failed")
              (|IntegerLinearDependence| 12) (178 . |solveLinearlyOverQ|)
              (|Record| (|:| |num| (|List| 31)) (|:| |den| 31)) (|Vector| 165)
              (|InnerCommonDenominator| 31 165 (|List| 31) 68)
              (184 . |splitDenominator|) (189 . ~=) (195 . ^)
              (|Mapping| 12 12 12) (201 . |reduce|) (207 . +) (213 . |coerce|)
              (218 . |coerce|) (223 . /) (|Factored| 14) (229 . |nilFactor|)
              (235 . *) (241 . *) (|Mapping| 79 79 79) (|List| 79)
              (247 . |reduce|) (|PartialFraction| 14) (253 . |partialFraction|)
              (259 . |wholePart|) (264 . ~=) (270 . |numberOfFractionalTerms|)
              (275 . |nthFractionalTerm|) (281 . |firstNumer|)
              (286 . |firstDenom|) (291 . =) (297 . |expand|)
              (|Union| $ '#1="failed") (|SparseMultivariatePolynomial| 12 8)
              (302 . |exquo|) (|List| 8) (308 . |member?|) (314 . |One|)
              (318 . |One|) (322 . |monomial|) (329 . |coerce|)
              (|Mapping| 97 8) (|Mapping| 97 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 6 9 97)
              (334 . |map|) (|List| 60) (341 . |kernels|) (346 . ~=)
              (352 . |last|) (357 . |setDifference|) (363 . |numer|)
              (368 . |denom|) (373 . |degree|) (379 . |exquo|) (385 . >)
              (391 . ^) (397 . *) (|Union| 12 '"failed") (403 . |retractIfCan|)
              (|OutputForm|) (|Union| 97 '#1#) (408 . |coerce|) (|Void|)
              (413 . |print|) (418 . /) (424 . |One|) (428 . *) (434 . |new|)
              (438 . |coerce|) (443 . -) (449 . |coefficients|)
              (|Union| 29 '"failed") (|List| 40) (|ExpressionLinearSolve| 6)
              (454 . |lin_sol|) (460 . |log|) (465 . |exp|) (470 . |li|)
              (|Fraction| 14) (475 . |coerce|)
              (|SparseUnivariatePolynomial| 142) (|Mapping| 142 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 14 142 144)
              (480 . |map|) (486 . |denom|) (|Mapping| 14 14 14) (|List| 14)
              (491 . |reduce|) (497 . |exquo|) (503 . |numer|) (508 . |second|)
              (513 . /) (519 . =) (525 . |rootOf|) (530 . -) (535 . -)
              (541 . |differentiate|) (546 . |eval|) (553 . |retract|)
              (|List| 29) (558 . |elt|) (|Fraction| 31) (564 . |One|)
              (568 . |One|) (572 . |monomial|) (578 . |coerce|) (583 . -)
              (589 . +) (595 . |retract|) (|List| $) (600 . |zerosOf|)
              (605 . |retract|) (610 . |eval|) (617 . |Zero|)
              (|Record| (|:| |scalar| 165) (|:| |coeff| 144)
                        (|:| |logand| 144))
              (|List| 178) (|Record| (|:| |integrand| 142) (|:| |intvar| 142))
              (|List| 180) (|IntegrationResult| 142) (621 . |mkAnswer|)
              (628 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 8) 8 6
                                                     9 12)
              (634 . |multivariate|) (640 . |tower|) (645 . ~=)
              (|IntegrationTools| 6 12) (651 . |varselect|) (657 . |Zero|)
              (|Record| (|:| |answer| 142) (|:| |logpart| 142) (|:| |ir| 182))
              |INTDEN;li_int;FKSR;15| |INTDEN;poly_int;FKSR;16|)
           '#(|poly_int| 661 |li_int| 668 |factor| 675) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 194
                                                 '(2 9 7 0 8 10 1 12 0 11 13 2
                                                   17 14 15 16 18 1 21 20 9 22
                                                   1 0 20 9 23 1 20 25 0 26 0
                                                   27 0 28 1 8 29 0 30 2 29 12
                                                   0 31 32 1 14 12 0 33 1 12 0
                                                   0 34 2 14 0 12 0 35 1 14 36
                                                   0 37 0 6 0 38 0 14 0 39 2 12
                                                   0 0 40 41 0 12 0 42 2 12 43
                                                   0 0 44 1 14 29 0 45 2 29 43
                                                   46 0 47 1 12 0 31 48 0 6 0
                                                   49 0 14 0 50 2 14 12 0 36 51
                                                   2 12 0 0 0 52 2 36 43 0 0 53
                                                   0 12 0 54 2 14 0 12 36 55 1
                                                   14 0 12 56 2 14 0 0 0 57 3
                                                   14 0 0 27 0 58 2 8 43 0 40
                                                   59 1 12 0 60 61 1 62 0 29 63
                                                   2 65 64 62 12 66 1 69 67 68
                                                   70 2 31 43 0 0 71 2 12 0 0
                                                   31 72 2 29 12 73 0 74 2 12 0
                                                   0 0 75 1 6 0 31 76 1 12 0 6
                                                   77 2 12 0 0 0 78 2 79 0 14
                                                   31 80 2 14 0 0 0 81 2 79 0 0
                                                   0 82 2 84 79 83 0 85 2 86 0
                                                   14 79 87 1 86 14 0 88 2 14
                                                   43 0 0 89 1 86 31 0 90 2 86
                                                   0 0 31 91 1 86 14 0 92 1 86
                                                   79 0 93 2 79 43 0 0 94 1 79
                                                   14 0 95 2 97 96 0 0 98 2 99
                                                   43 8 0 100 0 97 0 101 0 36 0
                                                   102 3 97 0 0 8 36 103 1 97 0
                                                   12 104 3 107 97 105 106 9
                                                   108 1 12 109 0 110 2 12 43 0
                                                   0 111 1 99 8 0 112 2 99 0 0
                                                   0 113 1 12 11 0 114 1 12 11
                                                   0 115 2 97 36 0 8 116 2 36
                                                   96 0 0 117 2 31 43 0 0 118 2
                                                   97 0 0 36 119 2 97 0 0 0 120
                                                   1 97 121 0 122 1 124 123 0
                                                   125 1 123 126 0 127 2 97 0 0
                                                   12 128 0 9 0 129 2 97 0 12 0
                                                   130 0 40 0 131 1 12 0 40 132
                                                   2 97 0 0 0 133 1 97 29 0 134
                                                   2 137 135 29 136 138 1 12 0
                                                   0 139 1 12 0 0 140 1 12 0 0
                                                   141 1 142 0 14 143 2 146 144
                                                   145 14 147 1 142 14 0 148 2
                                                   150 14 149 0 151 2 14 96 0 0
                                                   152 1 142 14 0 153 1 150 14
                                                   0 154 2 142 0 14 14 155 2 14
                                                   43 0 0 156 1 12 0 7 157 1 12
                                                   0 0 158 2 12 0 0 0 159 1 14
                                                   0 0 160 3 14 0 0 27 12 161 1
                                                   14 12 0 162 2 163 29 0 31
                                                   164 0 165 0 166 0 142 0 167
                                                   2 144 0 142 36 168 1 144 0
                                                   142 169 2 144 0 0 0 170 2
                                                   142 0 0 0 171 1 12 60 0 172
                                                   1 12 173 7 174 1 12 31 0 175
                                                   3 12 0 0 60 0 176 0 142 0
                                                   177 3 182 0 142 179 181 183
                                                   2 12 0 0 0 184 2 185 12 142
                                                   8 186 1 12 109 0 187 2 8 43
                                                   0 0 188 2 189 99 99 40 190 0
                                                   182 0 191 3 0 192 142 8 40
                                                   194 3 0 192 142 8 40 193 1 0
                                                   20 9 23)))))
           '|lookupComplete|)) 
