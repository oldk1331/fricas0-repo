
(/VERSIONCHECK 2) 

(DEFUN |MRVLIM;var_kers| (|e| $)
  (PROG (#1=#:G164 |kk| #2=#:G163)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MRVLIM;var_kers|))
       (SEQ (LETT |kk| NIL . #3#)
            (LETT #1# (SPADCALL |e| (QREFELT $ 13)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL
                 (SPADCALL (SPADCALL |kk| (QREFELT $ 15)) (QREFELT $ 11)
                           (QREFELT $ 16))
                 (|spadConstant| $ 7) (QREFELT $ 18))
                (LETT #2# (CONS |kk| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MRVLIM;mrv_normalize;ESRE;2| (|f| |x| |state| $)
  (PROG (#1=#:G179 |l_ts| |l_tan| |nk| |ns| |need_subst| |ss| |la| |l_as|
         |l_atan| |lau| |arg1| |nm| |ntf| |rtf| |nargs| #2=#:G188 |arg|
         #3=#:G187 |args| |op| #4=#:G186 |k| |tf|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |f| (QREFELT $ 20))
            . #5=(|MRVLIM;mrv_normalize;ESRE;2|))
      (LETT |tf| (SPADCALL |f| (QREFELT $ 13)) . #5#) (LETT |rtf| NIL . #5#)
      (LETT |ntf| NIL . #5#) (LETT |l_atan| NIL . #5#) (LETT |l_as| NIL . #5#)
      (LETT |l_tan| NIL . #5#) (LETT |l_ts| NIL . #5#)
      (SEQ (LETT |k| NIL . #5#) (LETT #4# |tf| . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL
                (SPADCALL (SPADCALL |k| (QREFELT $ 15)) |x| (QREFELT $ 16))
                (|spadConstant| $ 7) (QREFELT $ 21))
               "iterate")
              ('T
               (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 24)) . #5#)
                    (LETT |args| (SPADCALL |k| (QREFELT $ 26)) . #5#)
                    (LETT |nargs|
                          (PROGN
                           (LETT #3# NIL . #5#)
                           (SEQ (LETT |arg| NIL . #5#) (LETT #2# |args| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |arg| (CAR #2#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL |arg| |rtf| |ntf|
                                                   (QREFELT $ 28))
                                         #3#)
                                        . #5#)))
                                (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          . #5#)
                    (LETT |nk|
                          (COND
                           ((SPADCALL |args| |nargs| (QREFELT $ 29))
                            (SPADCALL |op| |nargs| (QREFELT $ 30)))
                           ('T (SPADCALL |k| (QREFELT $ 15))))
                          . #5#)
                    (LETT |rtf| (CONS |k| |rtf|) . #5#)
                    (LETT |ntf| (CONS |nk| |ntf|) . #5#)
                    (LETT |nm| (SPADCALL |op| (QREFELT $ 31)) . #5#)
                    (EXIT
                     (COND
                      ((OR (EQUAL |nm| '|exp|) (EQUAL |nm| '|log|)) "iterate")
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (LENGTH |args|) 1)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (LETT |lau|
                                         (SPADCALL
                                          (LETT |arg1|
                                                (SPADCALL |args| 1
                                                          (QREFELT $ 34))
                                                . #5#)
                                          |x| |state| (QREFELT $ 37))
                                         . #5#)
                                   (EXIT
                                    (COND
                                     ((EQUAL |nm| '|atan|)
                                      (COND
                                       ((QEQCAR |lau| 1)
                                        (SEQ
                                         (LETT |ns| (SPADCALL (QREFELT $ 10))
                                               . #5#)
                                         (LETT |nk|
                                               (SPADCALL |ns| (QREFELT $ 38))
                                               . #5#)
                                         (LETT |l_atan|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |nk| (QREFELT $ 39))
                                                 1 (QREFELT $ 41))
                                                |l_atan|)
                                               . #5#)
                                         (LETT |l_as| (CONS |ns| |l_as|) . #5#)
                                         (EXIT
                                          (SPADCALL |ntf| 1 |nk|
                                                    (QREFELT $ 42)))))
                                       ('T
                                        (SEQ (LETT |la| (QCDR |lau|) . #5#)
                                             (LETT |ss|
                                                   (SPADCALL |la|
                                                             (QREFELT $ 45))
                                                   . #5#)
                                             (EXIT
                                              (COND ((EQL |ss| 0) "iterate")
                                                    ('T
                                                     (SEQ
                                                      (LETT |nk|
                                                            (COND
                                                             ((EQL |ss| 1)
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $
                                                                          46))
                                                                (SPADCALL 2
                                                                          (QREFELT
                                                                           $
                                                                           47))
                                                                (QREFELT $ 48))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 32)
                                                                 |arg1|
                                                                 (QREFELT $
                                                                          48))
                                                                (QREFELT $ 49))
                                                               (QREFELT $ 50)))
                                                             ('T
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $
                                                                           46))
                                                                 (SPADCALL 2
                                                                           (QREFELT
                                                                            $
                                                                            47))
                                                                 (QREFELT $
                                                                          48))
                                                                (QREFELT $ 51))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (|spadConstant|
                                                                  $ 32)
                                                                 |arg1|
                                                                 (QREFELT $
                                                                          48))
                                                                (QREFELT $ 49))
                                                               (QREFELT $
                                                                        50))))
                                                            . #5#)
                                                      (EXIT
                                                       (SPADCALL |ntf| 1 |nk|
                                                                 (QREFELT $
                                                                          42)))))))))))
                                     ((EQUAL |nm| '|tan|)
                                      (SEQ
                                       (LETT |need_subst|
                                             (COND ((QEQCAR |lau| 1) 'T)
                                                   ('T
                                                    (SEQ
                                                     (LETT |la| (QCDR |lau|)
                                                           . #5#)
                                                     (LETT |ss|
                                                           (SPADCALL |la|
                                                                     (QREFELT $
                                                                              45))
                                                           . #5#)
                                                     (EXIT
                                                      (COND ((EQL |ss| 0) 'NIL)
                                                            ('T 'T))))))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         (|need_subst|
                                          (SEQ
                                           (LETT |ns| (SPADCALL (QREFELT $ 10))
                                                 . #5#)
                                           (LETT |nk|
                                                 (SPADCALL |ns| (QREFELT $ 38))
                                                 . #5#)
                                           (LETT |l_tan|
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |nk|
                                                             (QREFELT $ 39))
                                                   1 (QREFELT $ 41))
                                                  |l_tan|)
                                                 . #5#)
                                           (LETT |l_ts| (CONS |ns| |l_ts|)
                                                 . #5#)
                                           (EXIT
                                            (SPADCALL |ntf| 1 |nk|
                                                      (QREFELT $ 42)))))
                                         ('T "iterate"))))))))
                                  . #5#)
                            (GO #1#)))))
                        #1# (EXIT #1#))))))))))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (QSETVELT |state| 0 |l_ts|) (QSETVELT |state| 1 |l_as|)
      (QSETVELT |state| 2 |l_tan|) (QSETVELT |state| 3 |l_atan|)
      (EXIT (SPADCALL |f| |rtf| |ntf| (QREFELT $ 28))))))) 

(DEFUN |MRVLIM;mrv_bounded1| (|e| |state| $)
  (PROG (|vde| |sde| |kk| |de| |ne| |ke|)
    (RETURN
     (SEQ
      (LETT |ke| (SPADCALL |e| (QREFELT $ 39)) . #1=(|MRVLIM;mrv_bounded1|))
      (LETT |ne| (SPADCALL |e| (QREFELT $ 59)) . #1#)
      (LETT |de| (SPADCALL |e| (QREFELT $ 60)) . #1#)
      (EXIT
       (COND
        ((EQL (LENGTH |ke|) 1)
         (SEQ (LETT |kk| (|SPADfirst| |ke|) . #1#)
              (EXIT
               (COND
                ((SPADCALL |kk| (QVELT |state| 2) (QREFELT $ 61))
                 (COND
                  ((SPADCALL (SPADCALL |ne| |kk| (QREFELT $ 64))
                             (SPADCALL |de| |kk| (QREFELT $ 64))
                             (QREFELT $ 65))
                   'NIL)
                  (#2='T
                   (SEQ
                    (LETT |sde|
                          (SPADCALL (SPADCALL |de| (QREFELT $ 66))
                                    (QREFELT $ 69))
                          . #1#)
                    (EXIT
                     (COND
                      ((QEQCAR |sde| 0)
                       (SPADCALL (QCDR |sde|) 0 (QREFELT $ 71)))
                      (#2# 'NIL)))))))
                ((SPADCALL |kk| (QVELT |state| 3) (QREFELT $ 61))
                 (SEQ
                  (LETT |sde|
                        (SPADCALL
                         (SPADCALL (SPADCALL |de| (QREFELT $ 66)) |kk|
                                   (SPADCALL (SPADCALL |kk| (QREFELT $ 15))
                                             (QREFELT $ 49))
                                   (QREFELT $ 72))
                         (QREFELT $ 69))
                        . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |sde| 0) (SPADCALL (QCDR |sde|) 0 (QREFELT $ 71)))
                    (#2# 'NIL)))))
                (#2# 'T)))))
        (#2#
         (SEQ
          (LETT |vde| (SPADCALL (SPADCALL |de| (QREFELT $ 66)) (QREFELT $ 74))
                . #1#)
          (COND
           ((NULL (SPADCALL |vde| (QVELT |state| 0) (QREFELT $ 75)))
            (COND
             ((NULL (NULL (SPADCALL |vde| (QVELT |state| 1) (QREFELT $ 75))))
              (EXIT 'NIL))))
           (#2# (EXIT 'NIL)))
          (EXIT
           (NULL
            (SPADCALL (SPADCALL (SPADCALL |ne| (QREFELT $ 66)) (QREFELT $ 39))
                      (QVELT |state| 2) (QREFELT $ 76)))))))))))) 

(DEFUN |MRVLIM;mrv_bounded| (|state| $)
  (PROG () (RETURN (CONS #'|MRVLIM;mrv_bounded!0| (VECTOR $ |state|))))) 

(DEFUN |MRVLIM;mrv_bounded!0| (|e| $$)
  (PROG (|state| $)
    (LETT |state| (QREFELT $$ 1) . #1=(|MRVLIM;mrv_bounded|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MRVLIM;mrv_bounded1| |e| |state| $))))) 

(DEFUN |MRVLIM;mrv_invertible| (|state| $)
  (PROG (|var_syms|)
    (RETURN
     (SEQ
      (LETT |var_syms|
            (SPADCALL (QVELT |state| 0) (QVELT |state| 1) (QREFELT $ 77))
            |MRVLIM;mrv_invertible|)
      (EXIT
       (CONS #'|MRVLIM;mrv_invertible!0| (VECTOR |state| |var_syms| $))))))) 

(DEFUN |MRVLIM;mrv_invertible!0| (|e| $$)
  (PROG ($ |var_syms| |state|)
    (LETT $ (QREFELT $$ 2) . #1=(|MRVLIM;mrv_invertible|))
    (LETT |var_syms| (QREFELT $$ 1) . #1#)
    (LETT |state| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|sde| |de| |ne| |kk| |ke|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL (SPADCALL |e| (QREFELT $ 74)) |var_syms| (QREFELT $ 75))
             (QREFELT $ 78))
            (|spadConstant| $ 79))
           ('T
            (SEQ (LETT |ke| (SPADCALL |e| (QREFELT $ 39)) NIL)
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |ke| (QREFELT $ 80))
                              (|spadConstant| $ 81) (QREFELT $ 82))
                    (|spadConstant| $ 83))
                   ('T
                    (SEQ (LETT |kk| (SPADCALL |ke| (QREFELT $ 84)) NIL)
                         (LETT |ne| (SPADCALL |e| (QREFELT $ 59)) NIL)
                         (LETT |de| (SPADCALL |e| (QREFELT $ 60)) NIL)
                         (EXIT
                          (COND
                           ((SPADCALL |kk| (QVELT |state| 2) (QREFELT $ 61))
                            (COND
                             ((SPADCALL (SPADCALL |ne| |kk| (QREFELT $ 64))
                                        (SPADCALL |de| |kk| (QREFELT $ 64))
                                        (QREFELT $ 85))
                              (|spadConstant| $ 83))
                             ('T
                              (SEQ
                               (LETT |sde|
                                     (SPADCALL (SPADCALL |de| (QREFELT $ 66))
                                               (QREFELT $ 69))
                                     NIL)
                               (EXIT
                                (COND
                                 ((QEQCAR |sde| 0)
                                  (SPADCALL (QCDR |sde|) (|spadConstant| $ 86)
                                            (QREFELT $ 71)))
                                 ('T (|spadConstant| $ 83))))))))
                           ((SPADCALL |kk| (QVELT |state| 3) (QREFELT $ 61))
                            (SEQ
                             (LETT |sde|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |de| (QREFELT $ 66))
                                              |kk|
                                              (SPADCALL
                                               (SPADCALL |kk| (QREFELT $ 15))
                                               (QREFELT $ 49))
                                              (QREFELT $ 72))
                                    (QREFELT $ 69))
                                   NIL)
                             (EXIT
                              (COND
                               ((QEQCAR |sde| 0)
                                (SPADCALL (QCDR |sde|) (|spadConstant| $ 86)
                                          (QREFELT $ 71)))
                               ('T (|spadConstant| $ 83))))))
                           ('T (|spadConstant| $ 83)))))))))))))))))) 

(DEFUN |MRVLIM;expr_to_series;EKRU;6| (|e| |k| |state| $)
  (PROG (#1=#:G252 |vkers| |ssl| |kk| #2=#:G245 |lc| |ssll| |deg| |ssl0|
         #3=#:G240 |ss| |h| |ex|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ex|
              (SPADCALL |e| (LIST |k|)
                        (LIST (SPADCALL (QREFELT $ 11) (QREFELT $ 38)))
                        (QREFELT $ 28))
              . #4=(|MRVLIM;expr_to_series;EKRU;6|))
        (COND
         ((NULL (SPADCALL |k| '|exp| (QREFELT $ 87)))
          (EXIT (|error| "Can only expand with respect to exp"))))
        (LETT |h| (SPADCALL (SPADCALL |k| (QREFELT $ 26)) 1 (QREFELT $ 34))
              . #4#)
        (LETT |ss|
              (SPADCALL |ex| 'NIL (CONS 0 "complex") 'T |h|
                        (|MRVLIM;mrv_bounded| |state| $)
                        (|MRVLIM;mrv_invertible| |state| $) (QREFELT $ 92))
              . #4#)
        (EXIT
         (COND ((QEQCAR |ss| 1) (CONS 1 "failed"))
               (#5='T
                (SEQ
                 (LETT |ssl|
                       (PROG2 (LETT #3# |ss| . #4#)
                           (QCDR #3#)
                         (|check_union| (QEQCAR #3# 0) (QREFELT $ 54) #3#))
                       . #4#)
                 (LETT |kk| 0 . #4#) (LETT |ssl0| |ssl| . #4#)
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ (LETT |deg| (SPADCALL |ssl| (QREFELT $ 93)) . #4#)
                             (LETT |ssll| (SPADCALL |ssl| |deg| (QREFELT $ 94))
                                   . #4#)
                             (LETT |lc|
                                   (SPADCALL (SPADCALL |ssll| (QREFELT $ 95))
                                             (QREFELT $ 20))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |lc| (|spadConstant| $ 7)
                                          (QREFELT $ 18))
                                (PROGN (LETT #2# |$NoValue| . #4#) (GO #2#)))
                               ('T
                                (SEQ (LETT |kk| (+ |kk| 1) . #4#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| 100 (QREFELT $ 97))
                                        (SEQ
                                         (SPADCALL
                                          (SPADCALL |ssl0| (QREFELT $ 99))
                                          (QREFELT $ 102))
                                         (EXIT
                                          (|error|
                                           "Series with many zero terms"))))
                                       ('T
                                        (LETT |ssl|
                                              (SPADCALL |ssl| (QREFELT $ 103))
                                              . #4#)))))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #2# (EXIT #2#))
                 (LETT |vkers| (|MRVLIM;var_kers| |lc| $) . #4#)
                 (EXIT
                  (COND
                   ((NULL |vkers|)
                    (PROGN
                     (LETT #1# (CONS 0 (CONS |deg| |lc|)) . #4#)
                     (GO #1#)))
                   (#5# (|error| "Too many variable kernels"))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MRVLIM;mrv_cmp;2KSRU;7| (|x| |y| |v| |state| $)
  (PROG (|pp1| |ppu| |y1| |x1|)
    (RETURN
     (SEQ
      (LETT |x1|
            (COND
             ((SPADCALL |x| '|exp| (QREFELT $ 87))
              (SPADCALL (SPADCALL |x| (QREFELT $ 26)) 1 (QREFELT $ 34)))
             (#1='T (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 107))))
            . #2=(|MRVLIM;mrv_cmp;2KSRU;7|))
      (LETT |y1|
            (COND
             ((SPADCALL |y| '|exp| (QREFELT $ 87))
              (SPADCALL (SPADCALL |y| (QREFELT $ 26)) 1 (QREFELT $ 34)))
             (#1# (SPADCALL (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 107))))
            . #2#)
      (LETT |ppu|
            (SPADCALL (SPADCALL |x1| |y1| (QREFELT $ 48)) |v| |state|
                      (QREFELT $ 37))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |ppu| 0)
         (SEQ (LETT |pp1| (QCDR |ppu|) . #2#)
              (EXIT
               (COND
                ((SPADCALL |pp1| (|spadConstant| $ 108) (QREFELT $ 109))
                 (CONS 0 (CONS -1 (|spadConstant| $ 7))))
                ((SPADCALL |pp1| (QREFELT $ 110))
                 (CONS 0 (CONS 0 (SPADCALL |pp1| (QREFELT $ 111)))))
                (#1# (CONS 0 (CONS 1 (|spadConstant| $ 7))))))))
        (#1# (CONS 1 "failed")))))))) 

(DEFUN |MRVLIM;mrv_set;ESRU;8| (|e| |x| |state| $)
  (PROG (|res_c| |res| |res_k| |c| |i| |ic| #1=#:G291 |icu| #2=#:G292 |y|
         |kers|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |kers| (SPADCALL |e| (QREFELT $ 13))
              . #3=(|MRVLIM;mrv_set;ESRU;8|))
        (LETT |res_k|
              (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 38)) (QREFELT $ 39))
                        1 (QREFELT $ 41))
              . #3#)
        (LETT |res| (LIST |res_k|) . #3#)
        (LETT |res_c| (LIST (|spadConstant| $ 32)) . #3#)
        (SEQ (LETT |y| NIL . #3#) (LETT #2# |kers| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |y| '|exp| (QREFELT $ 87))
                 (SEQ
                  (LETT |icu|
                        (SPADCALL |y| |res_k| |x| |state| (QREFELT $ 114))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |icu| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                    ('T
                     (SEQ (LETT |ic| (QCDR |icu|) . #3#)
                          (LETT |i| (QCAR |ic|) . #3#)
                          (LETT |c| (QCDR |ic|) . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL |i| 0 (QREFELT $ 97))
                             (SEQ (LETT |res_k| |y| . #3#)
                                  (LETT |res| (LIST |y|) . #3#)
                                  (EXIT
                                   (LETT |res_c| (LIST (|spadConstant| $ 32))
                                         . #3#))))
                            ((EQL |i| 0)
                             (SEQ (LETT |res| (CONS |y| |res|) . #3#)
                                  (EXIT
                                   (LETT |res_c| (CONS |c| |res_c|)
                                         . #3#))))))))))))
                ('T (|spadConstant| $ 7)))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 (CONS (REVERSE |res|) (REVERSE |res_c|))))))
      #1# (EXIT #1#))))) 

(DEFUN |MRVLIM;mrv_rewrite1| (|e| |lx| |ly| $)
  (PROG (#1=#:G296 |x| #2=#:G297 |y| |rly| |rlx|)
    (RETURN
     (SEQ (LETT |rlx| (REVERSE |lx|) . #3=(|MRVLIM;mrv_rewrite1|))
          (LETT |rly| (REVERSE |ly|) . #3#)
          (SEQ (LETT |y| NIL . #3#) (LETT #2# |rly| . #3#) (LETT |x| NIL . #3#)
               (LETT #1# |rlx| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |e| (SPADCALL |e| (LIST |x|) (LIST |y|) (QREFELT $ 28))
                       . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |e|))))) 

(DEFUN |MRVLIM;mrv_rewrite0;ELL2E;10| (|e| |lx| |lc| |x00| $)
  (PROG (|lxx| |ly| |yi| |ei| #1=#:G304 |xi| #2=#:G305 |ci| |e0| |c0|)
    (RETURN
     (SEQ (LETT |c0| (|SPADfirst| |lc|) . #3=(|MRVLIM;mrv_rewrite0;ELL2E;10|))
          (COND
           ((EQL (LENGTH |lx|) 1)
            (COND
             ((SPADCALL |c0| (|spadConstant| $ 32) (QREFELT $ 21))
              (EXIT |e|)))))
          (LETT |e0|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x00| (QREFELT $ 39)) 1 (QREFELT $ 41))
                  (QREFELT $ 26))
                 1 (QREFELT $ 34))
                . #3#)
          (LETT |ly| NIL . #3#)
          (SEQ (LETT |ci| NIL . #3#) (LETT #2# (CDR |lc|) . #3#)
               (LETT |xi| NIL . #3#) (LETT #1# (CDR |lx|) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |xi| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |ci| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |ei|
                      (SPADCALL (SPADCALL |xi| (QREFELT $ 26)) 1
                                (QREFELT $ 34))
                      . #3#)
                (LETT |yi|
                      (SPADCALL (SPADCALL |x00| |ci| (QREFELT $ 118))
                                (SPADCALL
                                 (SPADCALL |ei|
                                           (SPADCALL |ci| |e0| (QREFELT $ 119))
                                           (QREFELT $ 50))
                                 (QREFELT $ 120))
                                (QREFELT $ 119))
                      . #3#)
                (EXIT (LETT |ly| (CONS |yi| |ly|) . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (LETT |ly| (REVERSE |ly|) . #3#)
          (COND
           ((SPADCALL |c0| (|spadConstant| $ 32) (QREFELT $ 21))
            (LETT |lxx| (CDR |lx|) . #3#))
           ('T
            (SEQ
             (LETT |ly| (CONS (SPADCALL |x00| |c0| (QREFELT $ 118)) |ly|)
                   . #3#)
             (EXIT (LETT |lxx| |lx| . #3#)))))
          (EXIT (|MRVLIM;mrv_rewrite1| |e| |lxx| |ly| $)))))) 

(DEFUN |MRVLIM;mrv_rewrite;ELLSRU;11| (|e| |lx| |lc| |v| |state| $)
  (PROG (|lxx| |x00| |lcc| #1=#:G328 |ci| #2=#:G327 |ss| |lipp| |lip| |e0|
         #3=#:G326 |ei| #4=#:G325 |x0|)
    (RETURN
     (SEQ (LETT |x0| (|SPADfirst| |lx|) . #5=(|MRVLIM;mrv_rewrite;ELLSRU;11|))
          (EXIT
           (COND
            ((SPADCALL |x0| |v| (QREFELT $ 87))
             (SEQ
              (LETT |lxx|
                    (PROGN
                     (LETT #4# NIL . #5#)
                     (SEQ (LETT |ei| NIL . #5#) (LETT #3# |lx| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |ei| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |ei| (QREFELT $ 15))
                                               (LIST |x0|)
                                               (LIST
                                                (SPADCALL
                                                 (SPADCALL |v| (QREFELT $ 38))
                                                 (QREFELT $ 120)))
                                               (QREFELT $ 28))
                                     (QREFELT $ 39))
                                    1 (QREFELT $ 41))
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL |e| (LIST |x0|)
                          (LIST
                           (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                     (QREFELT $ 120)))
                          (QREFELT $ 28))
                |lxx| |lc| |v| |state| (QREFELT $ 122)))))
            ((NOT (SPADCALL |x0| '|exp| (QREFELT $ 87)))
             (|error| "mrv is not exp, need substitution"))
            (#6='T
             (SEQ
              (LETT |e0|
                    (SPADCALL (SPADCALL |x0| (QREFELT $ 26)) 1 (QREFELT $ 34))
                    . #5#)
              (LETT |lip|
                    (COND
                     ((SPADCALL |e0| (SPADCALL |v| (QREFELT $ 38))
                                (QREFELT $ 21))
                      (CONS 0 (SPADCALL (QREFELT $ 123))))
                     (#6# (SPADCALL |e0| |v| |state| (QREFELT $ 37))))
                    . #5#)
              (EXIT
               (COND
                ((QEQCAR |lip| 0)
                 (SEQ (LETT |lipp| (QCDR |lip|) . #5#)
                      (LETT |ss| (SPADCALL |lipp| (QREFELT $ 45)) . #5#)
                      (EXIT
                       (COND ((EQL |ss| 0) (|error| "Wrong mrv element"))
                             (#6#
                              (SEQ
                               (COND
                                ((SPADCALL |ss| 0 (QREFELT $ 97))
                                 (SEQ
                                  (LETT |lcc|
                                        (CONS (|spadConstant| $ 32)
                                              (PROGN
                                               (LETT #2# NIL . #5#)
                                               (SEQ (LETT |ci| NIL . #5#)
                                                    (LETT #1# |lc| . #5#) G190
                                                    (COND
                                                     ((OR (ATOM #1#)
                                                          (PROGN
                                                           (LETT |ci| (CAR #1#)
                                                                 . #5#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #2#
                                                            (CONS
                                                             (SPADCALL |ci|
                                                                       (QREFELT
                                                                        $ 51))
                                                             #2#)
                                                            . #5#)))
                                                    (LETT #1# (CDR #1#) . #5#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #2#)))))
                                        . #5#)
                                  (LETT |x00|
                                        (SPADCALL
                                         (SPADCALL |e0| (QREFELT $ 51))
                                         (QREFELT $ 120))
                                        . #5#)
                                  (EXIT
                                   (LETT |lxx|
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |x00| (QREFELT $ 39)) 1
                                           (QREFELT $ 41))
                                          |lx|)
                                         . #5#))))
                                (#6#
                                 (SEQ (LETT |lcc| |lc| . #5#)
                                      (LETT |x00|
                                            (SPADCALL |x0| (QREFELT $ 15))
                                            . #5#)
                                      (EXIT (LETT |lxx| |lx| . #5#)))))
                               (LETT |e|
                                     (SPADCALL |e| |lxx| |lcc| |x00|
                                               (QREFELT $ 121))
                                     . #5#)
                               (EXIT
                                (SPADCALL |e|
                                          (SPADCALL
                                           (SPADCALL |x00| (QREFELT $ 39)) 1
                                           (QREFELT $ 41))
                                          |state| (QREFELT $ 106)))))))))
                (#6# (|error| "limit failed")))))))))))) 

(DEFUN |MRVLIM;mrv_sign;ESRU;12| (|e| |v| |state| $)
  (PROG (|ss| |ssu| |lcc| |lx| |rkc| |rkcu|)
    (RETURN
     (SEQ
      (COND
       ((NOT (SPADCALL |v| (SPADCALL |e| (QREFELT $ 74)) (QREFELT $ 124)))
        (SPADCALL |e| (QREFELT $ 69)))
       (#1='T
        (SEQ
         (LETT |rkcu| (SPADCALL |e| |v| |state| (QREFELT $ 117))
               . #2=(|MRVLIM;mrv_sign;ESRU;12|))
         (EXIT
          (COND ((QEQCAR |rkcu| 1) (CONS 1 "failed"))
                (#1#
                 (SEQ (LETT |rkc| (QCDR |rkcu|) . #2#)
                      (LETT |lx| (QCAR |rkc|) . #2#)
                      (LETT |lcc| (QCDR |rkc|) . #2#)
                      (LETT |ssu|
                            (SPADCALL |e| |lx| |lcc| |v| |state|
                                      (QREFELT $ 122))
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |ssu| 1) (CONS 1 "failed"))
                             (#1#
                              (SEQ (LETT |ss| (QCDR |ssu|) . #2#)
                                   (EXIT
                                    (SPADCALL (QCDR |ss|) |v| |state|
                                              (QREFELT $ 125)))))))))))))))))) 

(DEFUN |MRVLIM;mrv_limit;ESRU;13| (|e| |v| |state| $)
  (PROG (|s| |su| |deg| |ss| |ssu| |lcc| |lx| |rkc| |rkcu| |ve|)
    (RETURN
     (SEQ
      (COND
       ((NOT
         (SPADCALL |v|
                   (LETT |ve| (SPADCALL |e| (QREFELT $ 74))
                         . #1=(|MRVLIM;mrv_limit;ESRU;13|))
                   (QREFELT $ 124)))
        (SEQ
         (COND
          ((NULL (SPADCALL |ve| (QVELT |state| 0) (QREFELT $ 75)))
           (COND
            ((NULL (SPADCALL |ve| (QVELT |state| 1) (QREFELT $ 75)))
             (EXIT (CONS 0 (SPADCALL |e| (QREFELT $ 126))))))))
         (EXIT (CONS 1 "failed"))))
       (#2='T
        (SEQ (LETT |rkcu| (SPADCALL |e| |v| |state| (QREFELT $ 117)) . #1#)
             (EXIT
              (COND ((QEQCAR |rkcu| 1) (CONS 1 "failed"))
                    (#2#
                     (SEQ (LETT |rkc| (QCDR |rkcu|) . #1#)
                          (LETT |lx| (QCAR |rkc|) . #1#)
                          (LETT |lcc| (QCDR |rkc|) . #1#)
                          (LETT |ssu|
                                (SPADCALL |e| |lx| |lcc| |v| |state|
                                          (QREFELT $ 122))
                                . #1#)
                          (EXIT
                           (COND ((QEQCAR |ssu| 1) (CONS 1 "failed"))
                                 (#2#
                                  (SEQ (LETT |ss| (QCDR |ssu|) . #1#)
                                       (LETT |deg| (QCAR |ss|) . #1#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |deg|
                                                    (|spadConstant| $ 127)
                                                    (QREFELT $ 128))
                                          (CONS 0 (|spadConstant| $ 108)))
                                         ((SPADCALL |deg|
                                                    (|spadConstant| $ 127)
                                                    (QREFELT $ 129))
                                          (SPADCALL (QCDR |ss|) |v| |state|
                                                    (QREFELT $ 37)))
                                         ((SPADCALL |deg|
                                                    (|spadConstant| $ 127)
                                                    (QREFELT $ 130))
                                          (SEQ
                                           (LETT |su|
                                                 (SPADCALL (QCDR |ss|) |v|
                                                           |state|
                                                           (QREFELT $ 125))
                                                 . #1#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |su| 1)
                                              (CONS 1 "failed"))
                                             (#2#
                                              (SEQ (LETT |s| (QCDR |su|) . #1#)
                                                   (EXIT
                                                    (COND
                                                     ((EQL |s| 1)
                                                      (CONS 0
                                                            (SPADCALL
                                                             (QREFELT $ 123))))
                                                     ((EQL |s| -1)
                                                      (CONS 0
                                                            (SPADCALL
                                                             (QREFELT $ 131))))
                                                     (#2#
                                                      (|error|
                                                       "Nonzero term has no sign"))))))))))))))))))))))))))) 

(DEFUN |MRVLIM;mrv_limit1;ESU;14| (|e| |x| $)
  (PROG (|state|)
    (RETURN
     (SEQ
      (LETT |state| (VECTOR NIL NIL NIL NIL) . #1=(|MRVLIM;mrv_limit1;ESU;14|))
      (LETT |e| (SPADCALL |e| |x| |state| (QREFELT $ 52)) . #1#)
      (EXIT (SPADCALL |e| |x| |state| (QREFELT $ 37))))))) 

(DEFUN |MRVLIM;mrv_limit;EEU;15| (|e| |eq| $)
  (PROG (|lr| |et| |ll| |vK| |resu| |ii| |a| |v| |var| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 134)) (QREFELT $ 136))
            . #1=(|MRVLIM;mrv_limit;EEU;15|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#2='T
         (SEQ (LETT |var| (SPADCALL (QCDR |f|) (QREFELT $ 138)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |var| 1)
                 (|error| "limit:left hand side must be a variable"))
                (#2#
                 (SEQ (LETT |v| (QCDR |var|) . #1#)
                      (LETT |a| (SPADCALL |eq| (QREFELT $ 139)) . #1#)
                      (LETT |ii| (SPADCALL |a| (QREFELT $ 45)) . #1#)
                      (EXIT
                       (COND
                        ((|eql_SI| |ii| 1)
                         (SEQ
                          (LETT |resu| (SPADCALL |e| |v| (QREFELT $ 132))
                                . #1#)
                          (EXIT
                           (COND ((QEQCAR |resu| 1) (CONS 2 "failed"))
                                 (#2# (CONS 0 (QCDR |resu|)))))))
                        ((|eql_SI| |ii| -1)
                         (SEQ
                          (LETT |vK|
                                (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                          (QREFELT $ 140))
                                . #1#)
                          (LETT |et|
                                (SPADCALL |e| |vK|
                                          (SPADCALL
                                           (SPADCALL |vK| (QREFELT $ 15))
                                           (QREFELT $ 51))
                                          (QREFELT $ 72))
                                . #1#)
                          (LETT |resu| (SPADCALL |et| |v| (QREFELT $ 132))
                                . #1#)
                          (EXIT
                           (COND ((QEQCAR |resu| 1) (CONS 2 "failed"))
                                 (#2# (CONS 0 (QCDR |resu|)))))))
                        ((|eql_SI| |ii| 0)
                         (SEQ
                          (LETT |vK|
                                (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                          (QREFELT $ 140))
                                . #1#)
                          (LETT |et|
                                (SPADCALL |e| |vK|
                                          (SPADCALL
                                           (SPADCALL |a| (QREFELT $ 111))
                                           (SPADCALL
                                            (SPADCALL |vK| (QREFELT $ 15))
                                            (QREFELT $ 141))
                                           (QREFELT $ 50))
                                          (QREFELT $ 72))
                                . #1#)
                          (LETT |ll| (SPADCALL |et| |v| (QREFELT $ 132)) . #1#)
                          (LETT |et|
                                (SPADCALL |e| |vK|
                                          (SPADCALL
                                           (SPADCALL |a| (QREFELT $ 111))
                                           (SPADCALL
                                            (SPADCALL |vK| (QREFELT $ 15))
                                            (QREFELT $ 141))
                                           (QREFELT $ 142))
                                          (QREFELT $ 72))
                                . #1#)
                          (LETT |lr| (SPADCALL |et| |v| (QREFELT $ 132)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |ll| |lr| (QREFELT $ 143))
                             (COND ((QEQCAR |lr| 1) (CONS 2 "failed"))
                                   (#2# (CONS 0 (QCDR |lr|)))))
                            (#2# (CONS 1 (CONS |ll| |lr|))))))))))))))))))))) 

(DEFUN |MRVLIM;mrv_limit;EESU;16| (|e| |eq| |s| $)
  (PROG (#1=#:G413 |et| |vK| |a| |v| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (SPADCALL |eq| (QREFELT $ 148)) (QREFELT $ 138))
            . #2=(|MRVLIM;mrv_limit;EESU;16|))
      (EXIT
       (COND
        ((QEQCAR |f| 1) (|error| "limit:left hand side must be a variable"))
        (#3='T
         (SEQ (LETT |v| (QCDR |f|) . #2#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 149)) . #2#)
              (EXIT
               (COND
                ((EQL (SPADCALL |s| (QREFELT $ 152)) 1)
                 (SEQ
                  (LETT |vK|
                        (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                  (QREFELT $ 140))
                        . #2#)
                  (LETT |et|
                        (SPADCALL |e| |vK|
                                  (SPADCALL |a|
                                            (SPADCALL
                                             (SPADCALL |vK| (QREFELT $ 15))
                                             (QREFELT $ 141))
                                            (QREFELT $ 142))
                                  (QREFELT $ 72))
                        . #2#)
                  (EXIT (SPADCALL |et| |v| (QREFELT $ 132)))))
                (#3#
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |s| (QREFELT $ 152)) -1)
                     (PROGN
                      (LETT #1#
                            (SEQ
                             (LETT |vK|
                                   (SPADCALL (SPADCALL |v| (QREFELT $ 38))
                                             (QREFELT $ 140))
                                   . #2#)
                             (LETT |et|
                                   (SPADCALL |e| |vK|
                                             (SPADCALL |a|
                                                       (SPADCALL
                                                        (SPADCALL |vK|
                                                                  (QREFELT $
                                                                           15))
                                                        (QREFELT $ 141))
                                                       (QREFELT $ 50))
                                             (QREFELT $ 72))
                                   . #2#)
                             (EXIT (SPADCALL |et| |v| (QREFELT $ 132))))
                            . #2#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))))))))) 

(DEFUN |MrvLimitPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G418)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MrvLimitPackage|)
                . #2=(|MrvLimitPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MrvLimitPackage|
                         (LIST (CONS NIL (CONS 1 (|MrvLimitPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|MrvLimitPackage|))))))))))) 

(DEFUN |MrvLimitPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MrvLimitPackage|) . #1=(|MrvLimitPackage|))
      (LETT $ (GETREFV 154) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MrvLimitPackage| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|spadConstant| $ 7))
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      (QSETREFV $ 53
                (|UnivariateTaylorSeries| (|Expression| (|Integer|))
                                          (QREFELT $ 11) (QREFELT $ 8)))
      (QSETREFV $ 54
                (|GeneralizedUnivariatePowerSeries| (|Expression| (|Integer|))
                                                    (|OrderedExpression|)
                                                    (QREFELT $ 11)
                                                    (QREFELT $ 8)))
      (QSETREFV $ 57
                (|FunctionSpaceToUnivariatePowerSeries2| (|Integer|)
                                                         (|Expression|
                                                          (|Integer|))
                                                         (|OrderedExpression|)
                                                         (QREFELT $ 54)
                                                         (|ElementaryFunctionsGeneralizedUnivariatePowerSeries|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|OrderedExpression|)
                                                          (QREFELT $ 54))
                                                         (QREFELT $ 53)
                                                         (|TaylorSeriesExpansionGeneralized|
                                                          (|Expression|
                                                           (|Integer|))
                                                          (|OrderedExpression|)
                                                          (QREFELT $ 54)
                                                          (QREFELT $ 53))
                                                         (ELT $ 56)
                                                         (QREFELT $ 11)))
      $)))) 

(MAKEPROP '|MrvLimitPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Expression| 33) (0 . |Zero|) '|zeroFE|
              (|Symbol|) (4 . |new|) '|series_x| (|List| 14) (8 . |tower|)
              (|Kernel| $) (13 . |coerce|) (18 . |differentiate|) (|Boolean|)
              (24 . ~=) (|ElementaryFunctionStructurePackage| 33 6)
              (30 . |normalize|) (35 . =) (|BasicOperator|) (|Kernel| 6)
              (41 . |operator|) (|List| 6) (46 . |argument|) (|List| $)
              (51 . |eval|) (58 . ~=) (64 . |elt|) (70 . |name|) (75 . |One|)
              (|Integer|) (79 . |elt|) (|Union| 44 '"failed")
              (|Record| (|:| |tan_syms| 73) (|:| |atan_syms| 73)
                        (|:| |tan_kers| 40) (|:| |atan_kers| 40))
              |MRVLIM;mrv_limit;ESRU;13| (85 . |coerce|) (90 . |kernels|)
              (|List| 23) (95 . |elt|) (101 . |setelt|) (|SingleInteger|)
              (|OrderedCompletion| 6) (108 . |whatInfinity|) (113 . |pi|)
              (117 . |coerce|) (122 . /) (128 . |atan|) (133 . -) (139 . -)
              |MRVLIM;mrv_normalize;ESRE;2| '|Uts| '|Upg| (|OrderedExpression|)
              (144 . |coerce|) '|ppack| (|SparseMultivariatePolynomial| 33 14)
              (149 . |numer|) (154 . |denom|) (159 . |member?|)
              (|NonNegativeInteger|) (|SparseMultivariatePolynomial| 33 23)
              (165 . |degree|) (171 . >) (177 . |coerce|)
              (|Union| 33 '"failed") (|ElementaryFunctionSign| 33 6)
              (182 . |sign|) (187 . |Zero|) (191 . ~=) (197 . |eval|)
              (|List| 9) (204 . |variables|) (209 . |setIntersection|)
              (215 . |setIntersection|) (221 . |concat|) (227 . |empty?|)
              (232 . |true|) (236 . |#|) (241 . |One|) (245 . ~=)
              (251 . |false|) (255 . |first|) (260 . <) (266 . |Zero|)
              (270 . |is?|) (|Record| (|:| |func| 150) (|:| |prob| 150))
              (|Union| (|:| |%series| 54) (|:| |%problem| 88))
              (|Union| '"complex" '"real: two sides" '"real: left side"
                       '"real: right side" '"just do it")
              (|Mapping| 17 6) (276 . |exprToPS|) (287 . |order|)
              (292 . |removeZeros|) (298 . |leadingCoefficient|) (303 . |One|)
              (307 . >) (|OutputForm|) (313 . |coerce|) (|Void|)
              (|PrintPackage|) (318 . |print|) (323 . |reductum|)
              (|Record| (|:| |degree| 55) (|:| |coeff| 6))
              (|Union| 104 '"failed") |MRVLIM;expr_to_series;EKRU;6|
              (328 . |log|) (333 . |Zero|) (337 . =) (343 . |finite?|)
              (348 . |retract|) (|Record| (|:| |sign| 33) (|:| |coeff| 6))
              (|Union| 112 '"failed") |MRVLIM;mrv_cmp;2KSRU;7|
              (|Record| (|:| |lk| 40) (|:| |lc| 25)) (|Union| 115 '"failed")
              |MRVLIM;mrv_set;ESRU;8| (353 . ^) (359 . *) (365 . |exp|)
              |MRVLIM;mrv_rewrite0;ELL2E;10| |MRVLIM;mrv_rewrite;ELLSRU;11|
              (370 . |plusInfinity|) (374 . |member?|)
              |MRVLIM;mrv_sign;ESRU;12| (380 . |coerce|) (385 . |Zero|)
              (389 . >) (395 . =) (401 . <) (407 . |minusInfinity|)
              |MRVLIM;mrv_limit1;ESU;14| (|Equation| 44) (411 . |lhs|)
              (|Union| 6 '"failed") (416 . |retractIfCan|)
              (|Union| 9 '"failed") (421 . |retractIfCan|) (426 . |rhs|)
              (431 . |retract|) (436 . |inv|) (441 . +) (447 . =)
              (|Record| (|:| |leftHandLimit| 35) (|:| |rightHandLimit| 35))
              (|Union| 44 144 '"failed") |MRVLIM;mrv_limit;EEU;15|
              (|Equation| 6) (453 . |lhs|) (458 . |rhs|) (|String|)
              (|ToolsForSign| 33) (463 . |direction|)
              |MRVLIM;mrv_limit;EESU;16|)
           '#(|mrv_sign| 468 |mrv_set| 475 |mrv_rewrite0| 482 |mrv_rewrite| 490
              |mrv_normalize| 499 |mrv_limit1| 506 |mrv_limit| 512 |mrv_cmp|
              532 |expr_to_series| 540)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 153
                                                 '(0 6 0 7 0 9 0 10 1 6 12 0 13
                                                   1 6 0 14 15 2 6 0 0 9 16 2 6
                                                   17 0 0 18 1 19 6 6 20 2 6 17
                                                   0 0 21 1 23 22 0 24 1 23 25
                                                   0 26 3 6 0 0 12 27 28 2 25
                                                   17 0 0 29 2 6 0 22 27 30 1
                                                   22 9 0 31 0 6 0 32 2 25 6 0
                                                   33 34 1 6 0 9 38 1 6 12 0 39
                                                   2 40 23 0 33 41 3 25 6 0 33
                                                   6 42 1 44 43 0 45 0 6 0 46 1
                                                   6 0 33 47 2 6 0 0 0 48 1 6 0
                                                   0 49 2 6 0 0 0 50 1 6 0 0 51
                                                   1 55 6 0 56 1 6 58 0 59 1 6
                                                   58 0 60 2 40 17 23 0 61 2 63
                                                   62 0 23 64 2 62 17 0 0 65 1
                                                   6 0 58 66 1 68 67 6 69 0 53
                                                   0 70 2 33 17 0 0 71 3 6 0 0
                                                   14 0 72 1 6 73 0 74 2 73 0 0
                                                   0 75 2 40 0 0 0 76 2 73 0 0
                                                   0 77 1 73 17 0 78 0 17 0 79
                                                   1 40 62 0 80 0 62 0 81 2 62
                                                   17 0 0 82 0 17 0 83 1 40 23
                                                   0 84 2 62 17 0 0 85 0 62 0
                                                   86 2 23 17 0 9 87 7 57 89 6
                                                   17 90 17 6 91 91 92 1 54 55
                                                   0 93 2 54 0 0 55 94 1 54 6 0
                                                   95 0 53 0 96 2 33 17 0 0 97
                                                   1 54 98 0 99 1 101 100 98
                                                   102 1 54 0 0 103 1 6 0 0 107
                                                   0 44 0 108 2 44 17 0 0 109 1
                                                   44 17 0 110 1 44 6 0 111 2 6
                                                   0 0 0 118 2 6 0 0 0 119 1 6
                                                   0 0 120 0 44 0 123 2 73 17 9
                                                   0 124 1 44 0 6 126 0 55 0
                                                   127 2 55 17 0 0 128 2 55 17
                                                   0 0 129 2 55 17 0 0 130 0 44
                                                   0 131 1 133 44 0 134 1 44
                                                   135 0 136 1 6 137 0 138 1
                                                   133 44 0 139 1 6 14 0 140 1
                                                   6 0 0 141 2 6 0 0 0 142 2 35
                                                   17 0 0 143 1 147 6 0 148 1
                                                   147 6 0 149 1 151 33 150 152
                                                   3 0 67 6 9 36 125 3 0 116 6
                                                   9 36 117 4 0 6 6 40 25 6 121
                                                   5 0 105 6 40 25 9 36 122 3 0
                                                   6 6 9 36 52 2 0 35 6 9 132 3
                                                   0 35 6 147 150 153 2 0 145 6
                                                   133 146 3 0 35 6 9 36 37 4 0
                                                   113 23 23 9 36 114 3 0 105 6
                                                   23 36 106)))))
           '|lookupComplete|)) 

(MAKEPROP '|MrvLimitPackage| 'NILADIC T) 
