
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
  (PROG (|res| |f2| |k2| #1=#:G221 |c| #2=#:G222 |ki| #3=#:G220 |u1| #4=#:G218
         |ui| #5=#:G219 #6=#:G217 |d| |cd| |sv| |su| |ulst| #7=#:G216 |kk|
         #8=#:G215 |dvvec| #9=#:G214 #10=#:G213 |vlst| #11=#:G212 #12=#:G211
         |rsum| |deg1| |f1| #13=#:G210 |fac| |u0| |nk| |dummy| |lfac|)
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
  (PROG (|res| |f2| |k2| #1=#:G289 |c| #2=#:G290 |ki| #3=#:G288 |u1| #4=#:G286
         |ui| #5=#:G287 #6=#:G285 |d| |cd| |sv| |su| |ulst| #7=#:G284 |kk|
         #8=#:G283 |dvvec| #9=#:G282 #10=#:G281 |vlst| #11=#:G280 #12=#:G279
         |lprod| |f1| |tc| |deg1| #13=#:G278 |fac| |v0| |nk| |dummy| |lfac|)
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

(DEFUN |INTDEN;decompose;Sup2L;6| (|nn| |dens| $)
  (PROG (|res| |cden| |cnum| |ct| |i| #1=#:G306 |fden| |nfacs| |pfr| |nd|
         |fdens| #2=#:G305 |nden| #3=#:G304)
    (RETURN
     (SEQ
      (LETT |fdens|
            (PROGN
             (LETT #3# NIL . #4=(|INTDEN;decompose;Sup2L;6|))
             (SEQ (LETT |nden| NIL . #4#) (LETT #2# |dens| . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |nden| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3# (CONS (SPADCALL |nden| 1 (QREFELT $ 80)) #3#)
                          . #4#)))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |nd| (SPADCALL (ELT $ 82) |fdens| (QREFELT $ 85)) . #4#)
      (LETT |pfr| (SPADCALL |nn| |nd| (QREFELT $ 87)) . #4#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pfr| (QREFELT $ 88)) (|spadConstant| $ 39)
                   (QREFELT $ 89))
         (|error| "decompose: wholePart(pfr) ~= 0"))
        ('T
         (SEQ (LETT |nfacs| (SPADCALL |pfr| (QREFELT $ 90)) . #4#)
              (LETT |res| NIL . #4#)
              (SEQ (LETT |fden| NIL . #4#) (LETT #1# |fdens| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fden| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #4#) G190
                          (COND ((|greater_SI| |i| |nfacs|) (GO G191)))
                          (SEQ
                           (LETT |ct| (SPADCALL |pfr| |i| (QREFELT $ 91))
                                 . #4#)
                           (LETT |cnum| (SPADCALL |ct| (QREFELT $ 92)) . #4#)
                           (LETT |cden| (SPADCALL |ct| (QREFELT $ 93)) . #4#)
                           (EXIT
                            (COND
                             ((SPADCALL |cden| |fden| (QREFELT $ 94))
                              (LETT |res| (CONS |cnum| |res|) . #4#)))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|)))))))))) 

(DEFUN |INTDEN;decompose1| (|nn| |elden| |lidens| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0 (QREFELT $ 53))
        (LETT |lidens| (CONS |elden| |lidens|) . #1=(|INTDEN;decompose1|)))
       ((SPADCALL |elden| (|spadConstant| $ 50) (QREFELT $ 89))
        (|error| "Impossible 5")))
      (LETT |res| (SPADCALL |nn| |lidens| (QREFELT $ 96)) . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |elden| (QREFELT $ 37)) 0 (QREFELT $ 53)) |res|)
        ('T (CONS (|spadConstant| $ 39) |res|)))))))) 

(DEFUN |INTDEN;p_power_in_q| (|p| |q| $)
  (PROG (|res| #1=#:G312 |qq|)
    (RETURN
     (SEQ (LETT |res| 0 . #2=(|INTDEN;p_power_in_q|))
          (SEQ G190
               (COND
                ((NULL
                  (QEQCAR (LETT |qq| (SPADCALL |q| |p| (QREFELT $ 99)) . #2#)
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
               (CONS #'|INTDEN;MP_to_MPF!1| $) |p| (QREFELT $ 109))))) 

(DEFUN |INTDEN;MP_to_MPF!1| (|c| $)
  (SPADCALL (SPADCALL |c| (QREFELT $ 77)) (QREFELT $ 105))) 

(DEFUN |INTDEN;MP_to_MPF!0| (|k| $$)
  (PROG (|lk| $)
    (LETT |lk| (QREFELT $$ 1) . #1=(|INTDEN;MP_to_MPF|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL |k| |lk| (QREFELT $ 101))
        (SPADCALL (|spadConstant| $ 102) |k| (|spadConstant| $ 103)
                  (QREFELT $ 104)))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 61)) (QREFELT $ 105)))))))) 

(DEFUN |INTDEN;solve_u;2ESU;10| (|f1| |u| |x| $)
  (PROG (#1=#:G379 |c| |j| #2=#:G378 #3=#:G368 #4=#:G377 |sl| |sl0| |eqsl|
         |eqs| #5=#:G375 |p1| #6=#:G376 |coef| |lpow| |pp| #7=#:G374 |lpow0|
         |coefs| #8=#:G373 |nf1| |cc| |ccru| |ccu| |dup| #9=#:G340 |nup|
         #10=#:G338 |m| |n| |qu| |degdu| |degnu| |degdf| |degnf| |du| |nu|
         |df1| |vk2| #11=#:G372 |k| #12=#:G371 |k1| |vk| #13=#:G370 #14=#:G369)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |vk|
              (PROGN
               (LETT #14# NIL . #15=(|INTDEN;solve_u;2ESU;10|))
               (SEQ (LETT |k| NIL . #15#)
                    (LETT #13# (SPADCALL |u| (QREFELT $ 111)) . #15#) G190
                    (COND
                     ((OR (ATOM #13#) (PROGN (LETT |k| (CAR #13#) . #15#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT $ 61)) |x|
                                   (QREFELT $ 41))
                         (|spadConstant| $ 42) (QREFELT $ 112))
                        (LETT #14# (CONS |k| #14#) . #15#)))))
                    (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                    (EXIT (NREVERSE #14#))))
              . #15#)
        (EXIT
         (COND ((NULL |vk|) (|error| "solve_u: constant u"))
               (#16='T
                (SEQ (LETT |k1| (SPADCALL |vk| (QREFELT $ 113)) . #15#)
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |f1| |x| (QREFELT $ 41))
                                  (|spadConstant| $ 42) (QREFELT $ 44))
                        (CONS 0 (LIST (LIST |f1| (|spadConstant| $ 42)))))
                       (#16#
                        (SEQ
                         (LETT |vk2|
                               (PROGN
                                (LETT #12# NIL . #15#)
                                (SEQ (LETT |k| NIL . #15#)
                                     (LETT #11# (SPADCALL |f1| (QREFELT $ 111))
                                           . #15#)
                                     G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN
                                            (LETT |k| (CAR #11#) . #15#)
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
                                          (QREFELT $ 112))
                                         (LETT #12# (CONS |k| #12#) . #15#)))))
                                     (LETT #11# (CDR #11#) . #15#) (GO G190)
                                     G191 (EXIT (NREVERSE #12#))))
                               . #15#)
                         (COND
                          ((NULL (SPADCALL |vk2| |vk| (QREFELT $ 114)))
                           (COND
                            ((NULL
                              (NULL (SPADCALL |vk| |vk2| (QREFELT $ 114))))
                             (EXIT
                              (PROGN
                               (LETT #3# (CONS 1 #17="failed") . #15#)
                               (GO #3#))))))
                          (#16#
                           (EXIT
                            (PROGN (LETT #3# (CONS 1 #17#) . #15#) (GO #3#)))))
                         (LETT |nf1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 115)) |vk| $)
                               . #15#)
                         (LETT |df1|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |f1| (QREFELT $ 116)) |vk| $)
                               . #15#)
                         (LETT |nu|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 115)) |vk| $)
                               . #15#)
                         (LETT |du|
                               (|INTDEN;MP_to_MPF|
                                (SPADCALL |u| (QREFELT $ 116)) |vk| $)
                               . #15#)
                         (LETT |degnf| (SPADCALL |nf1| |k1| (QREFELT $ 117))
                               . #15#)
                         (LETT |degdf| (SPADCALL |df1| |k1| (QREFELT $ 117))
                               . #15#)
                         (LETT |degnu| (SPADCALL |nu| |k1| (QREFELT $ 117))
                               . #15#)
                         (LETT |degdu| (SPADCALL |du| |k1| (QREFELT $ 117))
                               . #15#)
                         (COND
                          ((EQL |degdu| 0)
                           (SEQ
                            (LETT |qu|
                                  (SPADCALL |degdf| |degnu| (QREFELT $ 118))
                                  . #15#)
                            (EXIT
                             (COND
                              ((QEQCAR |qu| 1)
                               (PROGN
                                (LETT #3# (CONS 1 "failed") . #15#)
                                (GO #3#)))
                              (#16#
                               (SEQ (LETT |n| (QCDR |qu|) . #15#)
                                    (LETT |qu|
                                          (SPADCALL |degnf| |degnu|
                                                    (QREFELT $ 118))
                                          . #15#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed") . #15#)
                                        (GO #3#)))
                                      (#16#
                                       (LETT |m| (- (QCDR |qu|) |n|)
                                             . #15#))))))))))
                          ((EQL |degnu| 0)
                           (SEQ
                            (LETT |qu|
                                  (SPADCALL |degdf| |degdu| (QREFELT $ 118))
                                  . #15#)
                            (EXIT
                             (COND
                              ((QEQCAR |qu| 1)
                               (PROGN
                                (LETT #3# (CONS 1 "failed") . #15#)
                                (GO #3#)))
                              (#16#
                               (SEQ (LETT |m| (QCDR |qu|) . #15#)
                                    (LETT |qu|
                                          (SPADCALL |degnf| |degdu|
                                                    (QREFELT $ 118))
                                          . #15#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |qu| 1)
                                       (PROGN
                                        (LETT #3# (CONS 1 "failed") . #15#)
                                        (GO #3#)))
                                      (#16#
                                       (LETT |n| (- (QCDR |qu|) |m|)
                                             . #15#))))))))))
                          (#16#
                           (SEQ
                            (LETT |m| (|INTDEN;p_power_in_q| |du| |df1| $)
                                  . #15#)
                            (LETT |n| (|INTDEN;p_power_in_q| |nu| |df1| $)
                                  . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL (+ (* |m| |degdu|) (* |n| |degnu|))
                                         |degdf| (QREFELT $ 71))
                               (PROGN
                                (LETT #3# (CONS 1 "failed") . #15#)
                                (GO #3#))))))))
                         (LETT |n| (MAX |n| 0) . #15#)
                         (LETT |m| (MAX |m| 0) . #15#)
                         (LETT |nup|
                               (COND
                                ((SPADCALL |n| 0 (QREFELT $ 119))
                                 (SPADCALL |nu|
                                           (PROG1 (LETT #10# |n| . #15#)
                                             (|check_subtype| (>= #10# 0)
                                                              '(|NonNegativeInteger|)
                                                              #10#))
                                           (QREFELT $ 120)))
                                (#16# (|spadConstant| $ 102)))
                               . #15#)
                         (LETT |dup|
                               (COND
                                ((SPADCALL |m| 0 (QREFELT $ 119))
                                 (SPADCALL |du|
                                           (PROG1 (LETT #9# |m| . #15#)
                                             (|check_subtype| (>= #9# 0)
                                                              '(|NonNegativeInteger|)
                                                              #9#))
                                           (QREFELT $ 120)))
                                (#16# (|spadConstant| $ 102)))
                               . #15#)
                         (LETT |ccu|
                               (SPADCALL |df1|
                                         (SPADCALL |dup| |nup| (QREFELT $ 121))
                                         (QREFELT $ 99))
                               . #15#)
                         (EXIT
                          (COND
                           ((QEQCAR |ccu| 1)
                            (PROGN
                             (LETT #3# (CONS 1 "failed") . #15#)
                             (GO #3#)))
                           (#16#
                            (SEQ
                             (LETT |ccru|
                                   (SPADCALL (QCDR |ccu|) (QREFELT $ 123))
                                   . #15#)
                             (EXIT
                              (COND
                               ((QEQCAR |ccru| 1)
                                (PROGN
                                 (LETT #3# (CONS 1 "failed") . #15#)
                                 (GO #3#)))
                               (#16#
                                (SEQ (LETT |cc| (QCDR |ccru|) . #15#)
                                     (LETT |nf1|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 54)
                                                      |cc| (QREFELT $ 78))
                                            |nf1| (QREFELT $ 126))
                                           . #15#)
                                     (LETT |coefs|
                                           (PROGN
                                            (LETT #8# NIL . #15#)
                                            (SEQ (LETT |j| (- |n|) . #15#) G190
                                                 (COND ((> |j| |m|) (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8#
                                                         (CONS
                                                          (SPADCALL
                                                           (QREFELT $ 127))
                                                          #8#)
                                                         . #15#)))
                                                 (LETT |j| (+ |j| 1) . #15#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #8#))))
                                           . #15#)
                                     (LETT |eqs| |nf1| . #15#)
                                     (LETT |pp| (|spadConstant| $ 102) . #15#)
                                     (LETT |lpow0| (LIST |pp|) . #15#)
                                     (SEQ (LETT |j| (- 1 |n|) . #15#) G190
                                          (COND ((> |j| |m|) (GO G191)))
                                          (SEQ
                                           (LETT |pp|
                                                 (SPADCALL |nu| |pp|
                                                           (QREFELT $ 121))
                                                 . #15#)
                                           (EXIT
                                            (LETT |lpow0| (CONS |pp| |lpow0|)
                                                  . #15#)))
                                          (LETT |j| (+ |j| 1) . #15#) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |lpow| (LIST (|SPADfirst| |lpow0|))
                                           . #15#)
                                     (LETT |pp| (|spadConstant| $ 102) . #15#)
                                     (SEQ (LETT |p1| NIL . #15#)
                                          (LETT #7# (CDR |lpow0|) . #15#) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |p1| (CAR #7#) . #15#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |pp|
                                                 (SPADCALL |du| |pp|
                                                           (QREFELT $ 121))
                                                 . #15#)
                                           (EXIT
                                            (LETT |lpow|
                                                  (CONS
                                                   (SPADCALL |pp| |p1|
                                                             (QREFELT $ 121))
                                                   |lpow|)
                                                  . #15#)))
                                          (LETT #7# (CDR #7#) . #15#) (GO G190)
                                          G191 (EXIT NIL))
                                     (SEQ (LETT |coef| NIL . #15#)
                                          (LETT #6# |coefs| . #15#)
                                          (LETT |p1| NIL . #15#)
                                          (LETT #5# |lpow| . #15#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |p1| (CAR #5#) . #15#)
                                                 NIL)
                                                (ATOM #6#)
                                                (PROGN
                                                 (LETT |coef| (CAR #6#) . #15#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |eqs|
                                                  (SPADCALL |eqs|
                                                            (SPADCALL
                                                             (SPADCALL |coef|
                                                                       (QREFELT
                                                                        $ 128))
                                                             |p1|
                                                             (QREFELT $ 126))
                                                            (QREFELT $ 129))
                                                  . #15#)))
                                          (LETT #5#
                                                (PROG1 (CDR #5#)
                                                  (LETT #6# (CDR #6#) . #15#))
                                                . #15#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |eqsl|
                                           (SPADCALL |eqs| (QREFELT $ 130))
                                           . #15#)
                                     (LETT |sl0|
                                           (SPADCALL |eqsl| |coefs|
                                                     (QREFELT $ 134))
                                           . #15#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |sl0| 1) (CONS 1 "failed"))
                                       (#16#
                                        (SEQ (LETT |sl| (QCDR |sl0|) . #15#)
                                             (SEQ (LETT |c| NIL . #15#)
                                                  (LETT #4# |sl| . #15#) G190
                                                  (COND
                                                   ((OR (ATOM #4#)
                                                        (PROGN
                                                         (LETT |c| (CAR #4#)
                                                               . #15#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL
                                                       (SPADCALL |c| |x|
                                                                 (QREFELT $
                                                                          41))
                                                       (|spadConstant| $ 42)
                                                       (QREFELT $ 112))
                                                      (PROGN
                                                       (LETT #3#
                                                             (CONS 1 "failed")
                                                             . #15#)
                                                       (GO #3#))))))
                                                  (LETT #4# (CDR #4#) . #15#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (PROGN
                                                     (LETT #2# NIL . #15#)
                                                     (SEQ
                                                      (LETT |j| (- |n|) . #15#)
                                                      (LETT |c| NIL . #15#)
                                                      (LETT #1# |sl| . #15#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |c|
                                                                   (CAR #1#)
                                                                   . #15#)
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
                                                                             112))
                                                          (LETT #2#
                                                                (CONS
                                                                 (LIST |c|
                                                                       (SPADCALL
                                                                        |j|
                                                                        (QREFELT
                                                                         $
                                                                         48)))
                                                                 #2#)
                                                                . #15#)))))
                                                      (LETT #1#
                                                            (PROG1 (CDR #1#)
                                                              (LETT |j|
                                                                    (+ |j| 1)
                                                                    . #15#))
                                                            . #15#)
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE
                                                        #2#))))))))))))))))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |INTDEN;li_int1| (|f| |u| |x| $)
  (PROG (|deru|)
    (RETURN
     (SEQ (LETT |deru| (SPADCALL |u| |x| (QREFELT $ 41)) |INTDEN;li_int1|)
          (EXIT
           (COND
            ((SPADCALL |deru| (|spadConstant| $ 42) (QREFELT $ 44))
             (|error| "li_int1: constant log"))
            ('T
             (SPADCALL (SPADCALL |f| |deru| (QREFELT $ 78)) |u| |x|
                       (QREFELT $ 136))))))))) 

(DEFUN |INTDEN;mk_li| (|c| |j| |u| |s| $)
  (PROG (|es|)
    (RETURN
     (SEQ
      (COND
       ((EQL |j| -1)
        (SPADCALL |c|
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 137)) |s| (QREFELT $ 75))
                   (QREFELT $ 137))
                  (QREFELT $ 52)))
       ('T
        (SEQ (LETT |es| (SPADCALL |s| (QREFELT $ 138)) |INTDEN;mk_li|)
             (EXIT
              (SPADCALL
               (SPADCALL |c|
                         (SPADCALL
                          (SPADCALL (SPADCALL |u| |es| (QREFELT $ 52))
                                    (+ |j| 1) (QREFELT $ 72))
                          (QREFELT $ 139))
                         (QREFELT $ 52))
               (SPADCALL |es| (+ |j| 1) (QREFELT $ 72)) (QREFELT $ 78)))))))))) 

(DEFUN |INTDEN;UP2UPR| (|p| $)
  (SPADCALL (CONS #'|INTDEN;UP2UPR!0| $) |p| (QREFELT $ 145))) 

(DEFUN |INTDEN;UP2UPR!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 56)) (QREFELT $ 141))) 

(DEFUN |INTDEN;li_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G424 |zz| |lle| |logs| #2=#:G423 |e| |zzl| |rf1k| |elpart|
         |lli| #3=#:G418 |liu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1| |u1|
         |cfac| |liden| #4=#:G421 |ldr| #5=#:G422 |linum| |u0| |dummy| |linums|
         |dn| |elden| |lidens| #6=#:G420 #7=#:G419 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;li_factors| (SPADCALL |f| (QREFELT $ 116)) |k| |lk| |x|
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
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 146))
                                 (SPADCALL (ELT $ 81) |lidens| (QREFELT $ 148))
                                 (QREFELT $ 149))
                       . #8#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Impossible 2"))
                        (#9#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose1|
                                 (SPADCALL |rf| (QREFELT $ 150)) (QCDR |elden|)
                                 |lidens| $)
                                . #8#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                          (QREFELT $ 151))
                                . #8#)
                          (LETT |linums| (CDR |dn|) . #8#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #8#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                          (QREFELT $ 32))
                                . #8#)
                          (LETT |res| (|spadConstant| $ 42) . #8#)
                          (LETT |logs| NIL . #8#)
                          (SEQ (LETT |linum| NIL . #8#)
                               (LETT #5# |linums| . #8#) (LETT |ldr| NIL . #8#)
                               (LETT #4# |ldrs| . #8#) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ldr| (CAR #4#) . #8#) NIL)
                                     (ATOM #5#)
                                     (PROGN
                                      (LETT |linum| (CAR #5#) . #8#)
                                      NIL))
                                 (GO G191)))
                               (SEQ (LETT |liden| (QVELT |ldr| 0) . #8#)
                                    (LETT |cfac| (QVELT |ldr| 1) . #8#)
                                    (LETT |u1| (QVELT |ldr| 2) . #8#)
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
                                                  2 (QREFELT $ 32))
                                                 (SPADCALL
                                                  (|spadConstant| $ 54)
                                                  (QREFELT $ 153))
                                                 (QREFELT $ 44))
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
                                                                (QREFELT $ 32))
                                                               (QREFELT $ 56))
                                                              (QREFELT $ 141))
                                                             (QREFELT $ 164))
                                                            (QREFELT $ 165))
                                                           (SPADCALL
                                                            (SPADCALL |liden|
                                                                      (QREFELT
                                                                       $ 141))
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
                                                                             151))
                                                                   (QREFELT $
                                                                            166))
                                                         . #8#))))))))
                                            (COND
                                             ((SPADCALL |deg1| 1
                                                        (QREFELT $ 53))
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
                                                                (QREFELT $ 32))
                                                      (SPADCALL
                                                       (|spadConstant| $ 54)
                                                       (QREFELT $ 153))
                                                      (QREFELT $ 44))
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
                                                                              32))
                                                                    (QREFELT $
                                                                             56))
                                                                   (QREFELT $
                                                                            141))
                                                                  (QREFELT $
                                                                           164))
                                                                 (QREFELT $
                                                                          165))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  |liden|
                                                                  (QREFELT $
                                                                           141))
                                                                 (QREFELT $
                                                                          164)))
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
                                                           (QREFELT $ 170))
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
                                                                           171))
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
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5# (CDR #5#) . #8#))
                                     . #8#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (CONS 0
                                 (VECTOR
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                            (QREFELT $ 141))
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
                             (SPADCALL (SPADCALL |u| (QREFELT $ 138))
                                       (SPADCALL (|spadConstant| $ 54) |s|
                                                 (QREFELT $ 78))
                                       (QREFELT $ 75))
                             (QREFELT $ 137))
                            (QREFELT $ 154))
                  (QREFELT $ 52)))
       ('T
        (SEQ
         (LETT |eu|
               (SPADCALL |s| (SPADCALL |u| (QREFELT $ 138)) (QREFELT $ 52))
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
                                    (QREFELT $ 137))
                                   (QREFELT $ 52))
                         (QREFELT $ 154))
               . #1#)
         (LETT |ifac|
               (SPADCALL
                (SPADCALL (SPADCALL |j| (QREFELT $ 76)) (QREFELT $ 77))
                (QREFELT $ 153))
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
                                     (SPADCALL |eu| (QREFELT $ 153))
                                     (QREFELT $ 179))
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
                           (QREFELT $ 153))
                          . #1#)))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT (SPADCALL |c| |res| (QREFELT $ 52)))))))))) 

(DEFUN |INTDEN;poly_int3| (|f| |rf| |k| |lk| |x| $)
  (PROG (|res| #1=#:G463 |zz| |lle| #2=#:G455 |ii| #3=#:G462 |e| |zzl| |rf1k|
         |elpart| |lpoly| |polyu| |tf| |c_shift| |ddf| |rf1| |rfc| |deg1|
         |polynum| |v1| |cfac| |polyden| #4=#:G460 |ldr| #5=#:G461 |polynum1|
         |logs| |u0| |dummy| |polynums1| |dn| |elden| |polydens1| #6=#:G459 |p|
         #7=#:G458 |polydens| #8=#:G457 #9=#:G456 |ldrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ldrs|
              (|INTDEN;poly_factors| (SPADCALL |f| (QREFELT $ 116)) |k| |lk|
               |x| $)
              . #10=(|INTDEN;poly_int3|))
        (LETT |polydens|
              (PROGN
               (LETT #9# NIL . #10#)
               (SEQ (LETT |ldr| NIL . #10#) (LETT #8# |ldrs| . #10#) G190
                    (COND
                     ((OR (ATOM #8#) (PROGN (LETT |ldr| (CAR #8#) . #10#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #9# (CONS (QVELT |ldr| 0) #9#) . #10#)))
                    (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                    (EXIT (NREVERSE #9#))))
              . #10#)
        (EXIT
         (COND ((NULL |polydens|) (CONS 1 "failed"))
               (#11='T
                (SEQ
                 (LETT |polydens1|
                       (PROGN
                        (LETT #7# NIL . #10#)
                        (SEQ (LETT |p| NIL . #10#) (LETT #6# |polydens| . #10#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |p| (CAR #6#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 33))
                                                 (QREFELT $ 34))
                                       |p| (QREFELT $ 35))
                                      #7#)
                                     . #10#)))
                             (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #10#)
                 (LETT |elden|
                       (SPADCALL (SPADCALL |rf| (QREFELT $ 146))
                                 (SPADCALL (ELT $ 81) |polydens1|
                                           (QREFELT $ 148))
                                 (QREFELT $ 149))
                       . #10#)
                 (EXIT
                  (COND ((QEQCAR |elden| 1) (|error| "Impossible 4"))
                        (#11#
                         (SEQ
                          (LETT |dn|
                                (|INTDEN;decompose1|
                                 (SPADCALL |rf| (QREFELT $ 150)) (QCDR |elden|)
                                 |polydens1| $)
                                . #10#)
                          (LETT |elpart|
                                (SPADCALL (|SPADfirst| |dn|) (QCDR |elden|)
                                          (QREFELT $ 151))
                                . #10#)
                          (LETT |polynums1| (CDR |dn|) . #10#)
                          (LETT |dummy| (SPADCALL (QREFELT $ 28)) . #10#)
                          (LETT |u0|
                                (SPADCALL (SPADCALL |k| (QREFELT $ 30)) 1
                                          (QREFELT $ 32))
                                . #10#)
                          (LETT |res| (|spadConstant| $ 42) . #10#)
                          (LETT |logs| NIL . #10#)
                          (SEQ (LETT |polynum1| NIL . #10#)
                               (LETT #5# |polynums1| . #10#)
                               (LETT |ldr| NIL . #10#) (LETT #4# |ldrs| . #10#)
                               G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ldr| (CAR #4#) . #10#) NIL)
                                     (ATOM #5#)
                                     (PROGN
                                      (LETT |polynum1| (CAR #5#) . #10#)
                                      NIL))
                                 (GO G191)))
                               (SEQ (LETT |polyden| (QVELT |ldr| 0) . #10#)
                                    (LETT |cfac| (QVELT |ldr| 1) . #10#)
                                    (LETT |v1| (QVELT |ldr| 3) . #10#)
                                    (LETT |polynum|
                                          (SPADCALL
                                           (SPADCALL |polyden| (QREFELT $ 33))
                                           |polynum1| (QREFELT $ 35))
                                          . #10#)
                                    (SEQ
                                     (LETT |deg1|
                                           (SPADCALL |polyden| (QREFELT $ 37))
                                           . #10#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                        (SEQ
                                         (LETT |rfc|
                                               (SPADCALL |cfac|
                                                         (QREFELT $ 152))
                                               . #10#)
                                         (LETT |rf1|
                                               (SPADCALL |rfc| (QVELT |ldr| 2)
                                                         (QREFELT $ 78))
                                               . #10#)
                                         (LETT |c_shift|
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| $ 54)
                                                          |rfc| (QREFELT $ 78))
                                                (QREFELT $ 153))
                                               . #10#)
                                         (LETT |ddf|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |cfac|
                                                           (QREFELT $ 155))
                                                 |dummy| |rfc| (QREFELT $ 156))
                                                (QREFELT $ 157))
                                               . #10#)
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
                                                            (QREFELT $ 52))
                                                  (QREFELT $ 78))
                                                 (QREFELT $ 153))
                                                . #10#))))
                                       ('T
                                        (SEQ
                                         (LETT |c_shift|
                                               (SPADCALL |cfac| 1
                                                         (QREFELT $ 51))
                                               . #10#)
                                         (EXIT
                                          (LETT |tf|
                                                (SPADCALL |polynum|
                                                          (QREFELT $ 157))
                                                . #10#)))))))
                                    (LETT |polyu|
                                          (|INTDEN;li_int1| |tf| |v1| |x| $)
                                          . #10#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |polyu| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #10#)
                                        (GO #2#)))
                                      ('T
                                       (SEQ
                                        (LETT |lpoly| (QCDR |polyu|) . #10#)
                                        (COND
                                         ((EQL (LENGTH |lpoly|) 1)
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |lpoly| 1
                                                        (QREFELT $ 159))
                                              2 (QREFELT $ 32))
                                             (|spadConstant| $ 42)
                                             (QREFELT $ 44))
                                            (EXIT
                                             (LETT |elpart|
                                                   (SPADCALL |elpart|
                                                             (SPADCALL
                                                              |polynum|
                                                              |polyden|
                                                              (QREFELT $ 151))
                                                             (QREFELT $ 166))
                                                   . #10#))))))
                                        (COND
                                         ((SPADCALL |deg1| 1 (QREFELT $ 53))
                                          (SEQ
                                           (LETT |rf1k|
                                                 (SPADCALL |rfc|
                                                           (QREFELT $ 167))
                                                 . #10#)
                                           (EXIT
                                            (LETT |zzl|
                                                  (SPADCALL |cfac|
                                                            (QREFELT $ 169))
                                                  . #10#)))))
                                        (EXIT
                                         (SEQ (LETT |e| NIL . #10#)
                                              (LETT #3# |lpoly| . #10#) G190
                                              (COND
                                               ((OR (ATOM #3#)
                                                    (PROGN
                                                     (LETT |e| (CAR #3#)
                                                           . #10#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |ii|
                                                     (SPADCALL
                                                      (SPADCALL |e| 2
                                                                (QREFELT $ 32))
                                                      (QREFELT $ 170))
                                                     . #10#)
                                               (EXIT
                                                (COND
                                                 ((< |ii| 0)
                                                  (PROGN
                                                   (LETT #2# (CONS 1 "failed")
                                                         . #10#)
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
                                                         . #10#)
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |deg1| 1
                                                                (QREFELT $ 53))
                                                      (SEQ
                                                       (LETT |zz| NIL . #10#)
                                                       (LETT #1# |zzl| . #10#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |zz|
                                                                    (CAR #1#)
                                                                    . #10#)
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
                                                                          75))
                                                               . #10#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #10#)
                                                       (GO G190) G191
                                                       (EXIT NIL)))
                                                     ('T
                                                      (LETT |res|
                                                            (SPADCALL |res|
                                                                      |lle|
                                                                      (QREFELT
                                                                       $ 75))
                                                            . #10#)))))))))
                                              (LETT #3# (CDR #3#) . #10#)
                                              (GO G190) G191 (EXIT NIL))))))))
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5# (CDR #5#) . #10#))
                                     . #10#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (CONS 0
                                 (VECTOR
                                  (SPADCALL (SPADCALL |res| (QREFELT $ 56))
                                            (QREFELT $ 141))
                                  |elpart|
                                  (SPADCALL (|spadConstant| $ 172) |logs| NIL
                                            (QREFELT $ 178)))))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTDEN;li_int;FKSR;17| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G471 |kk| #2=#:G470 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
            . #3=(|INTDEN;li_int;FKSR;17|))
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
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 59))
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

(DEFUN |INTDEN;poly_int;FKSR;18| (|rf| |k| |x| $)
  (PROG (|res| |lk| #1=#:G478 |kk| #2=#:G477 |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |rf| |k| (QREFELT $ 181))
            . #3=(|INTDEN;poly_int;FKSR;18|))
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
                      ((COND ((SPADCALL |kk| '|exp| (QREFELT $ 59)) 'T)
                             ((SPADCALL |kk| '|log| (QREFELT $ 59))
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

(DECLAIM (NOTINLINE |DenominatorIntegration;|)) 

(DEFUN |DenominatorIntegration| (#1=#:G479)
  (PROG ()
    (RETURN
     (PROG (#2=#:G480)
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
      (LETT $ (GETREFV 190) . #1#)
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
              '#:G103 (|Factored| 9)
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
              (|IntegerLinearDependence| 12) (178 . |particularSolutionOverQ|)
              (|Record| (|:| |num| (|List| 31)) (|:| |den| 31)) (|Vector| 160)
              (|InnerCommonDenominator| 31 160 (|List| 31) 68)
              (184 . |splitDenominator|) (189 . ~=) (195 . ^)
              (|Mapping| 12 12 12) (201 . |reduce|) (207 . +) (213 . |coerce|)
              (218 . |coerce|) (223 . /) (|Factored| 14) (229 . |nilFactor|)
              (235 . *) (241 . *) (|Mapping| 79 79 79) (|List| 79)
              (247 . |reduce|) (|PartialFraction| 14) (253 . |partialFraction|)
              (259 . |wholePart|) (264 . ~=) (270 . |numberOfFractionalTerms|)
              (275 . |nthFractionalTerm|) (281 . |firstNumer|)
              (286 . |firstDenom|) (291 . =) (|List| 14)
              |INTDEN;decompose;Sup2L;6| (|Union| $ '"failed")
              (|SparseMultivariatePolynomial| 12 8) (297 . |exquo|) (|List| 8)
              (303 . |member?|) (309 . |One|) (313 . |One|) (317 . |monomial|)
              (324 . |coerce|) (|Mapping| 98 8) (|Mapping| 98 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 6 9 98)
              (329 . |map|) (|List| 60) (336 . |kernels|) (341 . ~=)
              (347 . |last|) (352 . |setDifference|) (358 . |numer|)
              (363 . |denom|) (368 . |degree|) (374 . |exquo|) (380 . >)
              (386 . ^) (392 . *) (|Union| 12 '"failed") (398 . |retractIfCan|)
              (403 . /) (409 . |One|) (413 . *) (419 . |new|) (423 . |coerce|)
              (428 . -) (434 . |coefficients|) (|Union| 29 '"failed")
              (|List| 40) (|ExpressionLinearSolve| 6) (439 . |lin_sol|)
              (|Union| 158 '"failed") |INTDEN;solve_u;2ESU;10| (445 . |log|)
              (450 . |exp|) (455 . |li|) (|Fraction| 14) (460 . |coerce|)
              (|SparseUnivariatePolynomial| 140) (|Mapping| 140 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 14 140 142)
              (465 . |map|) (471 . |denom|) (|Mapping| 14 14 14)
              (476 . |reduce|) (482 . |exquo|) (488 . |numer|) (493 . /)
              (499 . |rootOf|) (504 . -) (509 . -) (515 . |differentiate|)
              (520 . |eval|) (527 . |retract|) (|List| 29) (532 . |elt|)
              (|Fraction| 31) (538 . |One|) (542 . |One|) (546 . |monomial|)
              (552 . |coerce|) (557 . -) (563 . +) (569 . |retract|) (|List| $)
              (574 . |zerosOf|) (579 . |retract|) (584 . |eval|) (591 . |Zero|)
              (|Record| (|:| |scalar| 160) (|:| |coeff| 142)
                        (|:| |logand| 142))
              (|List| 173) (|Record| (|:| |integrand| 140) (|:| |intvar| 140))
              (|List| 175) (|IntegrationResult| 140) (595 . |mkAnswer|)
              (602 . |polylog|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 8) 8 6
                                                     9 12)
              (608 . |multivariate|) (614 . |tower|) (619 . ~=)
              (|IntegrationTools| 6 12) (625 . |varselect|) (631 . |Zero|)
              (|Record| (|:| |answer| 140) (|:| |logpart| 140) (|:| |ir| 177))
              |INTDEN;li_int;FKSR;17| |INTDEN;poly_int;FKSR;18|)
           '#(|solve_u| 635 |poly_int| 642 |li_int| 649 |factor| 656
              |decompose| 661)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 189
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
                                                   79 0 93 2 79 43 0 0 94 2 98
                                                   97 0 0 99 2 100 43 8 0 101 0
                                                   98 0 102 0 36 0 103 3 98 0 0
                                                   8 36 104 1 98 0 12 105 3 108
                                                   98 106 107 9 109 1 12 110 0
                                                   111 2 12 43 0 0 112 1 100 8
                                                   0 113 2 100 0 0 0 114 1 12
                                                   11 0 115 1 12 11 0 116 2 98
                                                   36 0 8 117 2 36 97 0 0 118 2
                                                   31 43 0 0 119 2 98 0 0 36
                                                   120 2 98 0 0 0 121 1 98 122
                                                   0 123 2 98 0 0 12 124 0 9 0
                                                   125 2 98 0 12 0 126 0 40 0
                                                   127 1 12 0 40 128 2 98 0 0 0
                                                   129 1 98 29 0 130 2 133 131
                                                   29 132 134 1 12 0 0 137 1 12
                                                   0 0 138 1 12 0 0 139 1 140 0
                                                   14 141 2 144 142 143 14 145
                                                   1 140 14 0 146 2 95 14 147 0
                                                   148 2 14 97 0 0 149 1 140 14
                                                   0 150 2 140 0 14 14 151 1 12
                                                   0 7 152 1 12 0 0 153 2 12 0
                                                   0 0 154 1 14 0 0 155 3 14 0
                                                   0 27 12 156 1 14 12 0 157 2
                                                   158 29 0 31 159 0 160 0 161
                                                   0 140 0 162 2 142 0 140 36
                                                   163 1 142 0 140 164 2 142 0
                                                   0 0 165 2 140 0 0 0 166 1 12
                                                   60 0 167 1 12 168 7 169 1 12
                                                   31 0 170 3 12 0 0 60 0 171 0
                                                   140 0 172 3 177 0 140 174
                                                   176 178 2 12 0 0 0 179 2 180
                                                   12 140 8 181 1 12 110 0 182
                                                   2 8 43 0 0 183 2 184 100 100
                                                   40 185 0 177 0 186 3 0 135
                                                   12 12 40 136 3 0 187 140 8
                                                   40 189 3 0 187 140 8 40 188
                                                   1 0 20 9 23 2 0 95 14 95
                                                   96)))))
           '|lookupComplete|)) 
