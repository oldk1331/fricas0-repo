
(/VERSIONCHECK 2) 

(DEFUN |PLEQN;inconsistent?;LB;1| (|pl| $)
  (PROG (#1=#:G162 #2=#:G164 #3=#:G165 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |p| NIL . #4=(|PLEQN;inconsistent?;LB;1|))
               (LETT #3# |pl| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |p| (QREFELT $ 11))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |PLEQN;inconsistent?;LB;2| (|pl| $)
  (PROG (#1=#:G167 #2=#:G169 #3=#:G170 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |p| NIL . #4=(|PLEQN;inconsistent?;LB;2|))
               (LETT #3# |pl| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |p| (QREFELT $ 15))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |PLEQN;B1solve;RR;3| (|sys| $)
  (PROG (|pbas| |pb| #1=#:G195 |j| |j1| #2=#:G194 |i| |i1| #3=#:G193 #4=#:G192
         |augmat| #5=#:G191 #6=#:G190 #7=#:G189 |p| |w| |frcols| |n| |cmat| |k|
         |nss| |rss|)
    (RETURN
     (SEQ (LETT |rss| (QVELT |sys| 3) . #8=(|PLEQN;B1solve;RR;3|))
          (LETT |nss| (QVELT |sys| 4) . #8#) (LETT |k| (QVELT |sys| 2) . #8#)
          (LETT |cmat| (QVELT |sys| 0) . #8#)
          (LETT |n| (SPADCALL |cmat| (QREFELT $ 20)) . #8#)
          (LETT |frcols|
                (SPADCALL
                 (SPADCALL (SPADCALL 1 |n| (QREFELT $ 25)) (QREFELT $ 27))
                 |nss| (QREFELT $ 28))
                . #8#)
          (LETT |w| (QVELT |sys| 1) . #8#)
          (LETT |p| (MAKEARR1 |n| (|spadConstant| $ 32)) . #8#)
          (LETT |pbas| NIL . #8#)
          (COND
           ((SPADCALL |k| 0 (QREFELT $ 33))
            (SEQ (LETT |augmat| (SPADCALL |k| (+ |n| 1) (QREFELT $ 34)) . #8#)
                 (SEQ (LETT |i1| 1 . #8#) (LETT |i| NIL . #8#)
                      (LETT #7# |rss| . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |j1| 1 . #8#) (LETT |j| NIL . #8#)
                            (LETT #6# |nss| . #8#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |j| (CAR #6#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |augmat| |i1| |j1|
                                        (SPADCALL |cmat| |i| |j|
                                                  (QREFELT $ 35))
                                        (QREFELT $ 36))))
                            (LETT #6#
                                  (PROG1 (CDR #6#)
                                    (LETT |j1| (|inc_SI| |j1|) . #8#))
                                  . #8#)
                            (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |j1| (+ |k| 1) . #8#) (LETT |j| NIL . #8#)
                            (LETT #5# |frcols| . #8#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |j| (CAR #5#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |augmat| |i1| |j1|
                                        (SPADCALL
                                         (SPADCALL |cmat| |i| |j|
                                                   (QREFELT $ 35))
                                         (QREFELT $ 37))
                                        (QREFELT $ 36))))
                            (LETT #5#
                                  (PROG1 (CDR #5#)
                                    (LETT |j1| (+ |j1| 1) . #8#))
                                  . #8#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL |augmat| |i1| (+ |n| 1)
                                  (SPADCALL |w| |i| (QREFELT $ 39))
                                  (QREFELT $ 36))))
                      (LETT #7#
                            (PROG1 (CDR #7#) (LETT |i1| (|inc_SI| |i1|) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (LETT |augmat| (SPADCALL |augmat| (QREFELT $ 40)) . #8#)
                 (SEQ (LETT |i1| 1 . #8#) (LETT |i| NIL . #8#)
                      (LETT #4# |nss| . #8#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |p| |i|
                                  (SPADCALL |augmat| |i1| (+ |n| 1)
                                            (QREFELT $ 35))
                                  (QREFELT $ 42))))
                      (LETT #4#
                            (PROG1 (CDR #4#) (LETT |i1| (|inc_SI| |i1|) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SEQ (LETT |j1| (+ |k| 1) . #8#) (LETT |j| NIL . #8#)
                       (LETT #3# |frcols| . #8#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |j| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 32)) . #8#)
                        (SPADCALL |pb| |j| (|spadConstant| $ 43)
                                  (QREFELT $ 42))
                        (SEQ (LETT |i1| 1 . #8#) (LETT |i| NIL . #8#)
                             (LETT #2# |nss| . #8#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |i| (CAR #2#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |pb| |i|
                                         (SPADCALL |augmat| |i1| |j1|
                                                   (QREFELT $ 35))
                                         (QREFELT $ 42))))
                             (LETT #2#
                                   (PROG1 (CDR #2#)
                                     (LETT |i1| (|inc_SI| |i1|) . #8#))
                                   . #8#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |pbas| (CONS |pb| |pbas|) . #8#)))
                       (LETT #3# (PROG1 (CDR #3#) (LETT |j1| (+ |j1| 1) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |j1| (+ |k| 1) . #8#) (LETT |j| NIL . #8#)
                 (LETT #1# |frcols| . #8#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |j| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 32)) . #8#)
                      (SPADCALL |pb| |j| (|spadConstant| $ 43) (QREFELT $ 42))
                      (EXIT (LETT |pbas| (CONS |pb| |pbas|) . #8#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |j1| (+ |j1| 1) . #8#))
                       . #8#)
                 (GO G190) G191 (EXIT NIL))))
          (EXIT (CONS |p| |pbas|)))))) 

(DEFUN |PLEQN;regime;RMLL2NniIR;4|
       (|y| |coef| |w| |psbf| |rk| |rkmax| |mode| $)
  (PROG (|test| |yzero| #1=#:G230 |pw| #2=#:G229 |wcd| #3=#:G221 |wnum| |weqn|
         #4=#:G207 #5=#:G206 #6=#:G208 #7=#:G228 |j| #8=#:G227 |i| |frows| |pp|
         |pps| |sys| |nss| |rss| |nc| #9=#:G200 #10=#:G199 #11=#:G201
         #12=#:G226 #13=#:G127 #14=#:G225 |x| #15=#:G224 #16=#:G223 #17=#:G222
         |ydetf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ydetf| (SPADCALL (QVELT |y| 0) (QREFELT $ 47))
              . #18=(|PLEQN;regime;RMLL2NniIR;4|))
        (LETT |yzero|
              (COND ((EQL |rk| |rkmax|) NIL)
                    (#19='T
                     (SEQ
                      (LETT |psbf|
                            (PROGN
                             (LETT #17# NIL . #18#)
                             (SEQ (LETT |x| NIL . #18#)
                                  (LETT #16# |psbf| . #18#) G190
                                  (COND
                                   ((OR (ATOM #16#)
                                        (PROGN
                                         (LETT |x| (CAR #16#) . #18#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #17#
                                          (CONS
                                           (SPADCALL |x| |ydetf|
                                                     (QREFELT $ 48))
                                           #17#)
                                          . #18#)))
                                  (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                                  (EXIT (NREVERSE #17#))))
                            . #18#)
                      (EXIT
                       (SPADCALL
                        (PROGN
                         (LETT #15# NIL . #18#)
                         (SEQ (LETT |x| NIL . #18#) (LETT #14# |psbf| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |x| (CAR #14#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS
                                       (PROGN
                                        (LETT #9# NIL . #18#)
                                        (SEQ (LETT #13# NIL . #18#)
                                             (LETT #12# |x| . #18#) G190
                                             (COND
                                              ((OR (ATOM #12#)
                                                   (PROGN
                                                    (LETT #13# (CAR #12#)
                                                          . #18#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #11# #13# . #18#)
                                                (COND
                                                 (#9#
                                                  (LETT #10#
                                                        (SPADCALL #10# #11#
                                                                  (QREFELT $
                                                                           49))
                                                        . #18#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #10# #11# . #18#)
                                                   (LETT #9# 'T . #18#)))))))
                                             (LETT #12# (CDR #12#) . #18#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#9# #10#)
                                              ('T (|spadConstant| $ 22))))
                                       #15#)
                                      . #18#)))
                              (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        (QREFELT $ 51))))))
              . #18#)
        (LETT |nc|
              (SPADCALL (SPADCALL |coef| |yzero| (QREFELT $ 53))
                        (QREFELT $ 54))
              . #18#)
        (LETT |rss| (QVELT |y| 1) . #18#) (LETT |nss| (QVELT |y| 2) . #18#)
        (LETT |sys| (VECTOR |nc| |w| |rk| |rss| |nss|) . #18#)
        (LETT |pps| (SPADCALL |sys| (QREFELT $ 46)) . #18#)
        (LETT |pp| (QCAR |pps|) . #18#)
        (LETT |frows|
              (SPADCALL
               (SPADCALL (SPADCALL 1 (QVSIZE |coef|) (QREFELT $ 25))
                         (QREFELT $ 27))
               |rss| (QREFELT $ 28))
              . #18#)
        (LETT |wcd| NIL . #18#)
        (EXIT
         (COND
          ((SPADCALL |mode| (LIST 3 6 9 12) (QREFELT $ 55))
           (VECTOR |yzero| |ydetf| |wcd|
                   (SPADCALL |pps| |yzero| (QREFELT $ 56))))
          (#19#
           (SEQ
            (SEQ (LETT |i| NIL . #18#) (LETT #8# |frows| . #18#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #18#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |weqn|
                        (PROGN
                         (LETT #4# NIL . #18#)
                         (SEQ (LETT |j| NIL . #18#) (LETT #7# |nss| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |j| (CAR #7#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6#
                                       (SPADCALL
                                        (SPADCALL |nc| |i| |j| (QREFELT $ 35))
                                        (SPADCALL |pp| |j| (QREFELT $ 57))
                                        (QREFELT $ 58))
                                       . #18#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 59))
                                         . #18#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #18#)
                                    (LETT #4# 'T . #18#)))))))
                              (LETT #7# (CDR #7#) . #18#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) ('T (|spadConstant| $ 32))))
                        . #18#)
                  (LETT |wnum|
                        (SPADCALL
                         (SPADCALL (SPADCALL |w| |i| (QREFELT $ 39)) |weqn|
                                   (QREFELT $ 60))
                         (QREFELT $ 61))
                        . #18#)
                  (EXIT
                   (COND
                    ((SPADCALL |wnum| (|spadConstant| $ 62) (QREFELT $ 63))
                     "trivially satisfied")
                    ((SPADCALL |wnum| (QREFELT $ 15))
                     (PROGN
                      (LETT #3#
                            (VECTOR |yzero| |ydetf|
                                    (LIST (|spadConstant| $ 64)) |pps|)
                            . #18#)
                      (GO #3#)))
                    ('T (LETT |wcd| (CONS |wnum| |wcd|) . #18#)))))
                 (LETT #8# (CDR #8#) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |mode| (LIST 2 5 8 11) (QREFELT $ 55))
               (VECTOR |yzero| |ydetf| |wcd| |pps|))
              (#19#
               (SEQ
                (COND
                 ((NULL (NULL |wcd|))
                  (LETT |yzero|
                        (SPADCALL
                         (APPEND |yzero|
                                 (PROGN
                                  (LETT #2# NIL . #18#)
                                  (SEQ (LETT |pw| NIL . #18#)
                                       (LETT #1# |wcd| . #18#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |pw| (CAR #1#) . #18#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |pw| (QREFELT $ 65))
                                                #2#)
                                               . #18#)))
                                       (LETT #1# (CDR #1#) . #18#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#)))))
                         (QREFELT $ 66))
                        . #18#)))
                (LETT |test| (SPADCALL |yzero| |ydetf| (QREFELT $ 68)) . #18#)
                (COND
                 ((NULL (QVELT |test| 0))
                  (EXIT
                   (VECTOR (QVELT |test| 1) (QVELT |test| 2)
                           (LIST (|spadConstant| $ 64)) |pps|))))
                (EXIT
                 (VECTOR (QVELT |test| 1) (QVELT |test| 2) NIL
                         (SPADCALL |pps| (QVELT |test| 1)
                                   (QREFELT $ 56))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |PLEQN;bsolve;MLNniSIR;5| (|coeff| |w| |h| |outname| |mode| $)
  (PROG (|count| |lrec3| |rec3| #1=#:G251 |y| |psbf| #2=#:G250 |x| #3=#:G249
         |psb| |pc| |rk| |k| |rkmin| |rkmax| |rrcl| #4=#:G237 |rksoln|
         |newfile| |filemode| |r|)
    (RETURN
     (SEQ (LETT |r| (QVSIZE |coeff|) . #5=(|PLEQN;bsolve;MLNniSIR;5|))
          (EXIT
           (COND
            ((SPADCALL |r| (LENGTH |w|) (QREFELT $ 33))
             (|error| "number of rows unequal on lhs and rhs"))
            (#6='T
             (SEQ (LETT |count| 0 . #5#) (LETT |lrec3| NIL . #5#)
                  (LETT |filemode|
                        (SPADCALL |mode| (LIST 7 8 9 10 11 12) (QREFELT $ 55))
                        . #5#)
                  (COND
                   (|filemode|
                    (SEQ
                     (LETT |newfile|
                           (SPADCALL "" |outname| "regime" (QREFELT $ 75))
                           . #5#)
                     (EXIT
                      (LETT |rksoln| (SPADCALL |newfile| (QREFELT $ 77))
                            . #5#)))))
                  (LETT |rrcl|
                        (COND
                         ((SPADCALL |mode| (LIST 1 2 3 7 8 9) (QREFELT $ 55))
                          (SPADCALL |coeff| 0 (QREFELT $ 80)))
                         (#6#
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |mode| (LIST 4 5 6 10 11 12)
                                        (QREFELT $ 55))
                              (PROGN
                               (LETT #4# (SPADCALL |coeff| |h| (QREFELT $ 80))
                                     . #5#)
                               (GO #4#)))))
                           #4# (EXIT #4#))))
                        . #5#)
                  (LETT |rkmax| (SPADCALL |rrcl| (QREFELT $ 81)) . #5#)
                  (LETT |rkmin| (SPADCALL |rrcl| (QREFELT $ 82)) . #5#)
                  (SEQ (LETT |k| (+ (- |rkmax| |rkmin|) 1) . #5#) G190
                       (COND ((< |k| 1) (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 83)) 0)
                              . #5#)
                        (LETT |pc|
                              (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 83)) 1)
                              . #5#)
                        (LETT |psb|
                              (COND ((EQL |rk| |rkmax|) NIL)
                                    ('T
                                     (QVELT
                                      (SPADCALL |rrcl| (+ |k| 1)
                                                (QREFELT $ 83))
                                      2)))
                              . #5#)
                        (LETT |psbf|
                              (PROGN
                               (LETT #3# NIL . #5#)
                               (SEQ (LETT |x| NIL . #5#) (LETT #2# |psb| . #5#)
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |x| (CAR #2#) . #5#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS (SPADCALL |x| (QREFELT $ 47))
                                                  #3#)
                                            . #5#)))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              . #5#)
                        (LETT |psbf| (SPADCALL |psbf| (QREFELT $ 84)) . #5#)
                        (EXIT
                         (SEQ (LETT |y| NIL . #5#) (LETT #1# |pc| . #5#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |rec3|
                                     (SPADCALL |y| |coeff| |w| |psbf| |rk|
                                               |rkmax| |mode| (QREFELT $ 72))
                                     . #5#)
                               (EXIT
                                (COND
                                 ((SPADCALL (QVELT |rec3| 2) (QREFELT $ 17))
                                  "incompatible system")
                                 ('T
                                  (SEQ
                                   (COND
                                    (|filemode|
                                     (SPADCALL |rksoln| |rec3| (QREFELT $ 85)))
                                    ('T
                                     (LETT |lrec3| (CONS |rec3| |lrec3|)
                                           . #5#)))
                                   (EXIT
                                    (LETT |count| (+ |count| 1) . #5#)))))))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |k| (+ |k| -1) . #5#) (GO G190) G191 (EXIT NIL))
                  (COND (|filemode| (SPADCALL |rksoln| (QREFELT $ 86))))
                  (EXIT (CONS |lrec3| |count|)))))))))) 

(DEFUN |PLEQN;factorset;GRL;6| (|y| $)
  (PROG (#1=#:G257 |j| #2=#:G256)
    (RETURN
     (SEQ
      (COND ((SPADCALL |y| (QREFELT $ 11)) NIL)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|PLEQN;factorset;GRL;6|))
              (SEQ (LETT |j| NIL . #3#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |y| (QREFELT $ 91))
                                   (QREFELT $ 94))
                         . #3#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |j| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (QCAR |j|) #2#) . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |PLEQN;ParCondList;MNniL;7| (|mat| |h| $)
  (PROG (|rcl| |pcl| |ps| |done| |covered| |npc| |zro| |test| |p| #1=#:G274
         |rc| #2=#:G275 |maxrk| |pc| |k| #3=#:G273 |n| |r| |psbf|)
    (RETURN
     (SEQ (LETT |rcl| NIL . #4=(|PLEQN;ParCondList;MNniL;7|))
          (LETT |ps| NIL . #4#) (LETT |pc| NIL . #4#) (LETT |npc| NIL . #4#)
          (LETT |psbf| NIL . #4#) (LETT |done| 'NIL . #4#)
          (LETT |r| (QVSIZE |mat|) . #4#)
          (LETT |n| (SPADCALL |mat| (QREFELT $ 95)) . #4#)
          (LETT |maxrk| (MIN |r| |n|) . #4#)
          (SEQ (LETT #3# NIL . #4#) (LETT |k| (MIN |r| |n|) . #4#) G190
               (COND ((OR (< |k| |h|) #3#) (GO G191)))
               (SEQ (LETT |pc| (SPADCALL |mat| |k| (QREFELT $ 97)) . #4#)
                    (LETT |npc| NIL . #4#)
                    (COND
                     ((NULL |pc|)
                      (COND
                       ((>= |k| 1) (EXIT (LETT |maxrk| (- |k| 1) . #4#))))))
                    (COND
                     ((SPADCALL (QVELT (SPADCALL |pc| 1 (QREFELT $ 98)) 0)
                                (QREFELT $ 11))
                      (SEQ (LETT |npc| |pc| . #4#) (LETT |done| 'T . #4#)
                           (EXIT
                            (LETT |ps| (LIST (|spadConstant| $ 22)) . #4#))))
                     ('T
                      (SEQ
                       (LETT |zro|
                             (COND ((EQL |k| |maxrk|) NIL)
                                   ('T
                                    (QVELT (SPADCALL |rcl| 1 (QREFELT $ 83))
                                           2)))
                             . #4#)
                       (LETT |covered| 'NIL . #4#)
                       (SEQ (LETT #2# NIL . #4#) (LETT |rc| NIL . #4#)
                            (LETT #1# |pc| . #4#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rc| (CAR #1#) . #4#) NIL) #2#)
                              (GO G191)))
                            (SEQ
                             (LETT |p|
                                   (SPADCALL (QVELT |rc| 0) |zro|
                                             (QREFELT $ 99))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |p| (|spadConstant| $ 100)
                                          (QREFELT $ 101))
                                "incompatible or covered subdeterminant")
                               ('T
                                (SEQ
                                 (LETT |test|
                                       (SPADCALL |zro| (LIST (QVELT |rc| 0))
                                                 (QREFELT $ 68))
                                       . #4#)
                                 (COND
                                  ((NULL (QVELT |test| 0))
                                   (EXIT "incompatible or covered")))
                                 (LETT |zro|
                                       (SPADCALL (CONS |p| |zro|)
                                                 (QREFELT $ 51))
                                       . #4#)
                                 (LETT |npc| (CONS |rc| |npc|) . #4#)
                                 (EXIT
                                  (LETT |done|
                                        (LETT |covered|
                                              (SPADCALL |zro| (QREFELT $ 13))
                                              . #4#)
                                        . #4#)))))))
                            (LETT #1#
                                  (PROG1 (CDR #1#) (LETT #2# |covered| . #4#))
                                  . #4#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LETT |ps| |zro| . #4#)))))
                    (LETT |pcl| (VECTOR |k| |npc| |ps|) . #4#)
                    (EXIT (LETT |rcl| (CONS |pcl| |rcl|) . #4#)))
               (LETT |k| (PROG1 (+ |k| -1) (LETT #3# |done| . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |rcl|))))) 

(DEFUN |PLEQN;redpps;RLR;8| (|pps| |zz| $)
  (PROG (|i| |pbj| |j| |denmat| |nummat| |n| |pb| |r| |pv|)
    (RETURN
     (SEQ (LETT |pv| (QCAR |pps|) . #1=(|PLEQN;redpps;RLR;8|))
          (LETT |r| (QVSIZE |pv|) . #1#) (LETT |pb| (QCDR |pps|) . #1#)
          (LETT |n| (+ (LENGTH |pb|) 1) . #1#)
          (LETT |nummat| (SPADCALL |r| |n| (QREFELT $ 102)) . #1#)
          (LETT |denmat| (SPADCALL |r| |n| (QREFELT $ 102)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (SPADCALL |nummat| |i| 1
                          (SPADCALL
                           (SPADCALL (SPADCALL |pv| |i| (QREFELT $ 57))
                                     (QREFELT $ 61))
                           (QREFELT $ 65))
                          (QREFELT $ 103))
                (EXIT
                 (SPADCALL |denmat| |i| 1
                           (SPADCALL
                            (SPADCALL (SPADCALL |pv| |i| (QREFELT $ 57))
                                      (QREFELT $ 104))
                            (QREFELT $ 65))
                           (QREFELT $ 103))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| 2 . #1#) G190
               (COND ((|greater_SI| |j| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1 . #1#) G190
                      (COND ((|greater_SI| |i| |r|) (GO G191)))
                      (SEQ
                       (SPADCALL |nummat| |i| |j|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |pb| (- |j| 1) (QREFELT $ 106))
                                    |i| (QREFELT $ 57))
                                   (QREFELT $ 61))
                                  (QREFELT $ 65))
                                 (QREFELT $ 103))
                       (EXIT
                        (SPADCALL |denmat| |i| |j|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |pb| (- |j| 1) (QREFELT $ 106))
                                     |i| (QREFELT $ 57))
                                    (QREFELT $ 104))
                                   (QREFELT $ 65))
                                  (QREFELT $ 103))))
                      (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |nummat| (SPADCALL |nummat| |zz| (QREFELT $ 53)) . #1#)
          (LETT |denmat| (SPADCALL |denmat| |zz| (QREFELT $ 53)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |pv| |i|
                           (SPADCALL
                            (SPADCALL (SPADCALL |nummat| |i| 1 (QREFELT $ 107))
                                      (QREFELT $ 108))
                            (SPADCALL (SPADCALL |denmat| |i| 1 (QREFELT $ 107))
                                      (QREFELT $ 108))
                            (QREFELT $ 109))
                           (QREFELT $ 42))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| 2 . #1#) G190
               (COND ((|greater_SI| |j| |n|) (GO G191)))
               (SEQ (LETT |pbj| (MAKEARR1 |r| (|spadConstant| $ 32)) . #1#)
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| |r|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |pbj| |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |nummat| |i| |j|
                                                 (QREFELT $ 107))
                                       (QREFELT $ 108))
                                      (SPADCALL
                                       (SPADCALL |denmat| |i| |j|
                                                 (QREFELT $ 107))
                                       (QREFELT $ 108))
                                      (QREFELT $ 109))
                                     (QREFELT $ 42))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SPADCALL |pb| (- |j| 1) |pbj| (QREFELT $ 110))))
               (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |pv| |pb|)))))) 

(DEFUN |PLEQN;dmp2rfi;MM;9| (|mat| $)
  (PROG (|j| |i| |nmat| |n| |r|)
    (RETURN
     (SEQ (LETT |r| (QVSIZE |mat|) . #1=(|PLEQN;dmp2rfi;MM;9|))
          (LETT |n| (SPADCALL |mat| (QREFELT $ 95)) . #1#)
          (LETT |nmat| (SPADCALL |r| |n| (QREFELT $ 34)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |nmat| |i| |j|
                                  (SPADCALL
                                   (SPADCALL |mat| |i| |j| (QREFELT $ 107))
                                   (QREFELT $ 108))
                                  (QREFELT $ 36))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |nmat|))))) 

(DEFUN |PLEQN;dmp2rfi;LL;10| (|vl| $)
  (PROG (#1=#:G295 |v| #2=#:G294)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|PLEQN;dmp2rfi;LL;10|))
       (SEQ (LETT |v| NIL . #3#) (LETT #1# |vl| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 108)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |PLEQN;psolve;MLL;11| (|mat| |w| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 111)) 1 "nofile" 1 (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MLL;12| (|mat| |w| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 115)) 1 "nofile" 2 (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;ML;13| (|mat| $)
  (PROG (#1=#:G309 |i| #2=#:G308)
    (RETURN
     (SEQ
      (QCAR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;ML;13|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 32) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 1 "nofile" 3 (QREFELT $ 88))))))) 

(DEFUN |PLEQN;psolve;MLPiL;14| (|mat| |w| |h| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 111)) |h| "nofile" 4
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MLPiL;15| (|mat| |w| |h| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 115)) |h| "nofile" 5
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MPiL;16| (|mat| |h| $)
  (PROG (#1=#:G322 |i| #2=#:G321)
    (RETURN
     (SEQ
      (QCAR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MPiL;16|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 32) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |h| "nofile" 6 (QREFELT $ 88))))))) 

(DEFUN |PLEQN;psolve;MLSI;17| (|mat| |w| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 111)) 1 |outname| 7
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MLSI;18| (|mat| |w| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 115)) 1 |outname| 8
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MSI;19| (|mat| |outname| $)
  (PROG (#1=#:G332 |i| #2=#:G331)
    (RETURN
     (SEQ
      (QCDR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MSI;19|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 32) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 1 |outname| 9 (QREFELT $ 88))))))) 

(DEFUN |PLEQN;nextSublist;2IL;20| (|n| |k| $)
  (PROG (|mslist| #1=#:G336 |ms|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |n| 0 (QREFELT $ 125)) NIL)
            ((SPADCALL |k| 0 (QREFELT $ 125)) (LIST NIL))
            ((SPADCALL |k| |n| (QREFELT $ 126)) NIL)
            ('T
             (SEQ
              (COND ((EQL |n| 1) (COND ((EQL |k| 1) (EXIT (LIST (LIST 1)))))))
              (LETT |mslist| NIL . #2=(|PLEQN;nextSublist;2IL;20|))
              (SEQ (LETT |ms| NIL . #2#)
                   (LETT #1# (SPADCALL (- |n| 1) (- |k| 1) (QREFELT $ 128))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ms| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |mslist| (CONS (APPEND |ms| (LIST |n|)) |mslist|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (APPEND (SPADCALL (- |n| 1) |k| (QREFELT $ 128))
                       |mslist|))))))))) 

(DEFUN |PLEQN;psolve;MLPiSI;21| (|mat| |w| |h| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 111)) |h| |outname| 10
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MLPiSI;22| (|mat| |w| |h| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 115)) |h| |outname| 11
             (QREFELT $ 88)))) 

(DEFUN |PLEQN;psolve;MPiSI;23| (|mat| |h| |outname| $)
  (PROG (#1=#:G346 |i| #2=#:G345)
    (RETURN
     (SEQ
      (QCDR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MPiSI;23|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 32) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |h| |outname| 12 (QREFELT $ 88))))))) 

(DEFUN |PLEQN;hasoln;2LR;24| (|zro| |nzro| $)
  (PROG (#1=#:G379 |p| #2=#:G378 #3=#:G377 #4=#:G376 #5=#:G354 #6=#:G353
         #7=#:G355 #8=#:G375 #9=#:G129 #10=#:G374 |x| #11=#:G373 |psbf|
         #12=#:G372 #13=#:G371 #14=#:G370 #15=#:G369 |pnzro| #16=#:G349
         #17=#:G348 #18=#:G350 #19=#:G368 #20=#:G128)
    (RETURN
     (SEQ
      (COND ((NULL |zro|) (VECTOR 'T |zro| |nzro|))
            (#21='T
             (SEQ
              (LETT |zro| (SPADCALL |zro| (QREFELT $ 51))
                    . #22=(|PLEQN;hasoln;2LR;24|))
              (EXIT
               (COND
                ((SPADCALL |zro| (QREFELT $ 13)) (VECTOR 'NIL |zro| |nzro|))
                ((NULL |nzro|) (VECTOR 'T |zro| |nzro|))
                (#21#
                 (SEQ
                  (LETT |pnzro|
                        (SPADCALL
                         (PROGN
                          (LETT #16# NIL . #22#)
                          (SEQ (LETT #20# NIL . #22#) (LETT #19# |nzro| . #22#)
                               G190
                               (COND
                                ((OR (ATOM #19#)
                                     (PROGN (LETT #20# (CAR #19#) . #22#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #18# #20# . #22#)
                                  (COND
                                   (#16#
                                    (LETT #17#
                                          (SPADCALL #17# #18# (QREFELT $ 49))
                                          . #22#))
                                   ('T
                                    (PROGN
                                     (LETT #17# #18# . #22#)
                                     (LETT #16# 'T . #22#)))))))
                               (LETT #19# (CDR #19#) . #22#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#16# #17#) (#21# (|spadConstant| $ 22))))
                         |zro| (QREFELT $ 99))
                        . #22#)
                  (EXIT
                   (COND
                    ((SPADCALL |pnzro| (|spadConstant| $ 100) (QREFELT $ 101))
                     (VECTOR 'NIL |zro| |nzro|))
                    (#21#
                     (SEQ
                      (LETT |nzro| (SPADCALL |pnzro| (QREFELT $ 47)) . #22#)
                      (LETT |psbf|
                            (SPADCALL
                             (PROGN
                              (LETT #15# NIL . #22#)
                              (SEQ (LETT |p| NIL . #22#)
                                   (LETT #14# |zro| . #22#) G190
                                   (COND
                                    ((OR (ATOM #14#)
                                         (PROGN
                                          (LETT |p| (CAR #14#) . #22#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #15#
                                           (CONS (SPADCALL |p| (QREFELT $ 47))
                                                 #15#)
                                           . #22#)))
                                   (LETT #14# (CDR #14#) . #22#) (GO G190) G191
                                   (EXIT (NREVERSE #15#))))
                             (QREFELT $ 84))
                            . #22#)
                      (LETT |psbf|
                            (PROGN
                             (LETT #13# NIL . #22#)
                             (SEQ (LETT |x| NIL . #22#)
                                  (LETT #12# |psbf| . #22#) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |x| (CAR #12#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (SPADCALL |x| |nzro| (QREFELT $ 48))
                                           #13#)
                                          . #22#)))
                                  (LETT #12# (CDR #12#) . #22#) (GO G190) G191
                                  (EXIT (NREVERSE #13#))))
                            . #22#)
                      (EXIT
                       (COND
                        ((SPADCALL NIL |psbf| (QREFELT $ 132))
                         (VECTOR 'NIL |zro| |nzro|))
                        (#21#
                         (SEQ
                          (LETT |zro|
                                (SPADCALL
                                 (PROGN
                                  (LETT #11# NIL . #22#)
                                  (SEQ (LETT |x| NIL . #22#)
                                       (LETT #10# |psbf| . #22#) G190
                                       (COND
                                        ((OR (ATOM #10#)
                                             (PROGN
                                              (LETT |x| (CAR #10#) . #22#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #11#
                                               (CONS
                                                (PROGN
                                                 (LETT #5# NIL . #22#)
                                                 (SEQ (LETT #9# NIL . #22#)
                                                      (LETT #8# |x| . #22#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #8#)
                                                            (PROGN
                                                             (LETT #9#
                                                                   (CAR #8#)
                                                                   . #22#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #7# #9# . #22#)
                                                         (COND
                                                          (#5#
                                                           (LETT #6#
                                                                 (SPADCALL #6#
                                                                           #7#
                                                                           (QREFELT
                                                                            $
                                                                            49))
                                                                 . #22#))
                                                          ('T
                                                           (PROGN
                                                            (LETT #6# #7#
                                                                  . #22#)
                                                            (LETT #5# 'T
                                                                  . #22#)))))))
                                                      (LETT #8# (CDR #8#)
                                                            . #22#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#5# #6#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        22))))
                                                #11#)
                                               . #22#)))
                                       (LETT #10# (CDR #10#) . #22#) (GO G190)
                                       G191 (EXIT (NREVERSE #11#))))
                                 (QREFELT $ 51))
                                . #22#)
                          (EXIT
                           (COND
                            ((SPADCALL |zro| (QREFELT $ 13))
                             (VECTOR 'NIL |zro| |nzro|))
                            (#21#
                             (SEQ
                              (LETT |nzro|
                                    (PROGN
                                     (LETT #4# NIL . #22#)
                                     (SEQ (LETT |p| NIL . #22#)
                                          (LETT #3# |nzro| . #22#) G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |p| (CAR #3#) . #22#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #4#
                                                  (CONS
                                                   (SPADCALL |p| |zro|
                                                             (QREFELT $ 99))
                                                   #4#)
                                                  . #22#)))
                                          (LETT #3# (CDR #3#) . #22#) (GO G190)
                                          G191 (EXIT (NREVERSE #4#))))
                                    . #22#)
                              (LETT |nzro|
                                    (PROGN
                                     (LETT #2# NIL . #22#)
                                     (SEQ (LETT |p| NIL . #22#)
                                          (LETT #1# |nzro| . #22#) G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |p| (CAR #1#) . #22#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((COND
                                               ((SPADCALL |p| (QREFELT $ 11))
                                                'NIL)
                                               (#21# 'T))
                                              (LETT #2# (CONS |p| #2#)
                                                    . #22#)))))
                                          (LETT #1# (CDR #1#) . #22#) (GO G190)
                                          G191 (EXIT (NREVERSE #2#))))
                                    . #22#)
                              (EXIT
                               (VECTOR 'T |zro| |nzro|))))))))))))))))))))))))) 

(DEFUN |PLEQN;se2rfi;LL;25| (|w| $)
  (PROG (#1=#:G383 |wi| #2=#:G382)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|PLEQN;se2rfi;LL;25|))
       (SEQ (LETT |wi| NIL . #3#) (LETT #1# |w| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |wi| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 64) |wi| 1 (QREFELT $ 134))
                      (QREFELT $ 135))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |PLEQN;pr2dmp;PGR;26| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 15))
    (SPADCALL (SPADCALL |p| (QREFELT $ 136)) (QREFELT $ 137)))
   ('T
    (|algCoerceInteractive| |p| (|Polynomial| (QREFELT $ 6)) (QREFELT $ 9))))) 

(DEFUN |PLEQN;wrregime;LSI;27| (|lrec3| |outname| $)
  (PROG (|count| #1=#:G391 |rec3| |rksoln| |newfile|)
    (RETURN
     (SEQ
      (LETT |newfile| (SPADCALL "" |outname| "regime" (QREFELT $ 75))
            . #2=(|PLEQN;wrregime;LSI;27|))
      (LETT |rksoln| (SPADCALL |newfile| (QREFELT $ 77)) . #2#)
      (LETT |count| 0 . #2#)
      (SEQ (LETT |rec3| NIL . #2#) (LETT #1# |lrec3| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |rec3| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (SPADCALL |rksoln| |rec3| (QREFELT $ 85))
                (EXIT (LETT |count| (+ |count| 1) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |rksoln| (QREFELT $ 86)) (EXIT |count|))))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28| (|p| $)
  (SPADCALL (CONS #'|PLEQN;dmp2rfi;GRF;28!0| $)
            (CONS #'|PLEQN;dmp2rfi;GRF;28!1| $) |p| (QREFELT $ 145))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28!1| (|r1| $)
  (SPADCALL (SPADCALL |r1| (QREFELT $ 141)) (QREFELT $ 135))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28!0| (|v1| $)
  (SPADCALL (SPADCALL |v1| (QREFELT $ 139)) (QREFELT $ 140))) 

(DEFUN |PLEQN;rdregime;SL;29| (|inname| $)
  (PROG (|rec3| |rksoln| #1=#:G397 |infile| |infilename|)
    (RETURN
     (SEQ
      (LETT |infilename| (SPADCALL "" |inname| "regime" (QREFELT $ 146))
            . #2=(|PLEQN;rdregime;SL;29|))
      (LETT |infile| (SPADCALL |infilename| "input" (QREFELT $ 147)) . #2#)
      (LETT |rksoln| NIL . #2#)
      (LETT |rec3| (SPADCALL |infile| (QREFELT $ 149)) . #2#)
      (SEQ G190 (COND ((NULL (QEQCAR |rec3| 0)) (GO G191)))
           (SEQ
            (LETT |rksoln|
                  (CONS
                   (PROG2 (LETT #1# |rec3| . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|Record|
                                     (|:| |eqzro| (|List| (QREFELT $ 9)))
                                     (|:| |neqzro| (|List| (QREFELT $ 9)))
                                     (|:| |wcond|
                                          (|List|
                                           (|Polynomial| (QREFELT $ 6))))
                                     (|:| |bsoln|
                                          (|Record|
                                           (|:| |partsol|
                                                (|Vector|
                                                 (|Fraction|
                                                  (|Polynomial|
                                                   (QREFELT $ 6)))))
                                           (|:| |basis|
                                                (|List|
                                                 (|Vector|
                                                  (|Fraction|
                                                   (|Polynomial|
                                                    (QREFELT $ 6)))))))))
                                    #1#))
                   |rksoln|)
                  . #2#)
            (EXIT (LETT |rec3| (SPADCALL |infile| (QREFELT $ 149)) . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (SPADCALL |infile| (QREFELT $ 86)) (EXIT |rksoln|))))) 

(DEFUN |PLEQN;maxrank;LNni;30| (|rcl| $)
  (PROG (#1=#:G405 #2=#:G404 #3=#:G406 #4=#:G409 |j|)
    (RETURN
     (SEQ
      (COND ((NULL |rcl|) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|PLEQN;maxrank;LNni;30|))
              (SEQ (LETT |j| NIL . #6#) (LETT #4# |rcl| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (QVELT |j| 0) . #6#)
                      (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|IdentityError| '|max|)))))))))) 

(DEFUN |PLEQN;minrank;LNni;31| (|rcl| $)
  (PROG (#1=#:G412 #2=#:G411 #3=#:G413 #4=#:G416 |j|)
    (RETURN
     (SEQ
      (COND ((NULL |rcl|) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|PLEQN;minrank;LNni;31|))
              (SEQ (LETT |j| NIL . #6#) (LETT #4# |rcl| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (QVELT |j| 0) . #6#)
                      (COND (#1# (LETT #2# (MIN #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|IdentityError| '|min|)))))))))) 

(DEFUN |PLEQN;minset;2L;32| (|lset| $)
  (PROG (#1=#:G422 |x| #2=#:G421)
    (RETURN
     (SEQ
      (COND ((NULL |lset|) |lset|)
            (#3='T
             (PROGN
              (LETT #2# NIL . #4=(|PLEQN;minset;2L;32|))
              (SEQ (LETT |x| NIL . #4#) (LETT #1# |lset| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((COND ((SPADCALL |x| |lset| (QREFELT $ 151)) 'NIL)
                             (#3# 'T))
                       (LETT #2# (CONS |x| #2#) . #4#)))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |PLEQN;sqfree;2GR;33| (|p| $)
  (PROG (#1=#:G425 #2=#:G424 #3=#:G426 #4=#:G428 |j|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|PLEQN;sqfree;2GR;33|))
       (SEQ (LETT |j| NIL . #5#)
            (LETT #4# (SPADCALL (SPADCALL |p| (QREFELT $ 153)) (QREFELT $ 94))
                  . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (QCAR |j|) . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 49)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 22)))))))) 

(DEFUN |PLEQN;ParCond;MNniL;34| (|mat| |k| $)
  (PROG (|DetEqn| |neweqn| |detmat| |found| |matsub| #1=#:G440 |nss| #2=#:G441
         #3=#:G438 |rss| #4=#:G439 |n| |r| |j|)
    (RETURN
     (SEQ
      (COND ((EQL |k| 0) (LIST (VECTOR (|spadConstant| $ 22) NIL NIL)))
            (#5='T
             (SEQ (LETT |j| |k| . #6=(|PLEQN;ParCond;MNniL;34|))
                  (LETT |DetEqn| NIL . #6#) (LETT |r| (QVSIZE |mat|) . #6#)
                  (LETT |n| (SPADCALL |mat| (QREFELT $ 95)) . #6#)
                  (EXIT
                   (COND
                    ((SPADCALL |k| (MIN |r| |n|) (QREFELT $ 126))
                     (|error| "k exceeds maximum possible rank "))
                    (#5#
                     (SEQ (LETT |found| 'NIL . #6#)
                          (SEQ (LETT #4# NIL . #6#) (LETT |rss| NIL . #6#)
                               (LETT #3# (SPADCALL |r| |k| (QREFELT $ 128))
                                     . #6#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |rss| (CAR #3#) . #6#) NIL)
                                     #4#)
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT #2# NIL . #6#)
                                      (LETT |nss| NIL . #6#)
                                      (LETT #1#
                                            (SPADCALL |n| |k| (QREFELT $ 128))
                                            . #6#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |nss| (CAR #1#) . #6#)
                                             NIL)
                                            #2#)
                                        (GO G191)))
                                      (SEQ
                                       (LETT |matsub|
                                             (SPADCALL |mat| |rss| |nss|
                                                       (QREFELT $ 155))
                                             . #6#)
                                       (LETT |detmat|
                                             (SPADCALL |matsub|
                                                       (|compiledLookupCheck|
                                                        '|determinant|
                                                        (LIST
                                                         (|devaluate|
                                                          (ELT $ 9))
                                                         '$)
                                                        (|SquareMatrix| |j|
                                                                        (ELT $
                                                                             9))))
                                             . #6#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |detmat|
                                                    (|spadConstant| $ 100)
                                                    (QREFELT $ 156))
                                          (SEQ
                                           (LETT |found|
                                                 (SPADCALL |detmat|
                                                           (QREFELT $ 11))
                                                 . #6#)
                                           (LETT |detmat|
                                                 (SPADCALL |detmat|
                                                           (QREFELT $ 154))
                                                 . #6#)
                                           (LETT |neweqn|
                                                 (VECTOR |detmat| |rss| |nss|)
                                                 . #6#)
                                           (EXIT
                                            (LETT |DetEqn|
                                                  (CONS |neweqn| |DetEqn|)
                                                  . #6#)))))))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT #2# |found| . #6#))
                                            . #6#)
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT #3#
                                     (PROG1 (CDR #3#) (LETT #4# |found| . #6#))
                                     . #6#)
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND (|found| (LIST (|SPADfirst| |DetEqn|)))
                                 (#5#
                                  (SPADCALL
                                   (CONS #'|PLEQN;ParCond;MNniL;34!0| $)
                                   |DetEqn| (QREFELT $ 160)))))))))))))))) 

(DEFUN |PLEQN;ParCond;MNniL;34!0| (|z1| |z2| $)
  (SPADCALL (SPADCALL (QVELT |z1| 0) (QREFELT $ 157))
            (SPADCALL (QVELT |z2| 0) (QREFELT $ 157)) (QREFELT $ 158))) 

(DEFUN |PLEQN;overset?;LLB;35| (|p| |qlist| $)
  (PROG (#1=#:G443 #2=#:G442 #3=#:G444 #4=#:G447 |q|)
    (RETURN
     (SEQ
      (COND ((NULL |qlist|) 'NIL)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|PLEQN;overset?;LLB;35|))
              (SEQ (LETT |q| NIL . #6#) (LETT #4# |qlist| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |q| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (SPADCALL |q| (QREFELT $ 162))
                                      (SPADCALL |p| (QREFELT $ 162))
                                      (QREFELT $ 163))
                            . #6#)
                      (COND (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# 'NIL))))))))) 

(DEFUN |PLEQN;redmat;MLM;36| (|mat| |psb| $)
  (PROG (|p| |j| |i| |newmat| |n| |r|)
    (RETURN
     (SEQ (LETT |r| (QVSIZE |mat|) . #1=(|PLEQN;redmat;MLM;36|))
          (LETT |n| (SPADCALL |mat| (QREFELT $ 95)) . #1#)
          (LETT |newmat| (SPADCALL |r| |n| (QREFELT $ 102)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                      (SEQ
                       (LETT |p| (SPADCALL |mat| |i| |j| (QREFELT $ 107))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |p| (QREFELT $ 11))
                          (SPADCALL |newmat| |i| |j| |p| (QREFELT $ 103)))
                         ('T
                          (SPADCALL |newmat| |i| |j|
                                    (SPADCALL |p| |psb| (QREFELT $ 99))
                                    (QREFELT $ 103))))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |newmat|))))) 

(DEFUN |ParametricLinearEquations| (&REST #1=#:G453)
  (PROG ()
    (RETURN
     (PROG (#2=#:G454)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ParametricLinearEquations|)
                                           '|domainEqualList|)
                . #3=(|ParametricLinearEquations|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ParametricLinearEquations;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ParametricLinearEquations|))))))))))) 

(DEFUN |ParametricLinearEquations;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricLinearEquations|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|ParametricLinearEquations| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 164) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ParametricLinearEquations|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ParametricLinearEquations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |ground?|)
              (|List| 9) |PLEQN;inconsistent?;LB;1| (|Polynomial| 6)
              (5 . |ground?|) (|List| 14) |PLEQN;inconsistent?;LB;2|
              (|NonNegativeInteger|) (|Matrix| 31) (10 . |ncols|) (15 . |One|)
              (19 . |One|) (|Integer|) (|Segment| 23) (23 . SEGMENT)
              (|List| 23) (29 . |expand|) (34 . |setDifference|) (40 . |Zero|)
              (44 . |Zero|) (|Fraction| 14) (48 . |Zero|) (52 . ~=)
              (58 . |zero|) (64 . |elt|) (71 . |setelt|) (79 . -) (|List| 31)
              (84 . |elt|) (90 . |rowEchelon|) (|Vector| 31) (95 . |setelt|)
              (102 . |One|) (|Record| (|:| |partsol| 41) (|:| |basis| 105))
              (|Record| (|:| |mat| 19) (|:| |vec| 38) (|:| |rank| 18)
                        (|:| |rows| 26) (|:| |cols| 26))
              |PLEQN;B1solve;RR;3| |PLEQN;factorset;GRL;6|
              (106 . |setDifference|) (112 . *)
              (|EuclideanGroebnerBasisPackage| 6 8 7 9)
              (118 . |euclideanGroebner|) (|Matrix| 9) |PLEQN;redmat;MLM;36|
              |PLEQN;dmp2rfi;MM;9| (123 . |entry?|) |PLEQN;redpps;RLR;8|
              (129 . |elt|) (135 . *) (141 . +) (147 . -) (153 . |numer|)
              (158 . |Zero|) (162 . =) (168 . |One|) |PLEQN;pr2dmp;PGR;26|
              (172 . |removeDuplicates|)
              (|Record| (|:| |sysok| 10) (|:| |z0| 12) (|:| |n0| 12))
              |PLEQN;hasoln;2LR;24|
              (|Record| (|:| |eqzro| 12) (|:| |neqzro| 12) (|:| |wcond| 16)
                        (|:| |bsoln| 44))
              (|Record| (|:| |det| 9) (|:| |rows| 26) (|:| |cols| 26))
              (|List| 12) |PLEQN;regime;RMLL2NniIR;4| (|String|) (|FileName|)
              (177 . |new|) (|File| 69) (184 . |open|)
              (|Record| (|:| |rank| 18) (|:| |eqns| 96) (|:| |fgb| 12))
              (|List| 78) |PLEQN;ParCondList;MNniL;7| |PLEQN;maxrank;LNni;30|
              |PLEQN;minrank;LNni;31| (189 . |elt|) |PLEQN;minset;2L;32|
              (195 . |write!|) (201 . |close!|)
              (|Record| (|:| |rgl| 112) (|:| |rgsz| 23))
              |PLEQN;bsolve;MLNniSIR;5| (|Factored| 9)
              (|MultivariateFactorize| 7 8 6 9) (206 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 23)) (|List| 92)
              (211 . |factors|) (216 . |ncols|) (|List| 70)
              |PLEQN;ParCond;MNniL;34| (221 . |elt|)
              (227 . |euclideanNormalForm|) (233 . |Zero|) (237 . =)
              (243 . |zero|) (249 . |setelt|) (257 . |denom|) (|List| 41)
              (262 . |elt|) (268 . |elt|) |PLEQN;dmp2rfi;GRF;28| (275 . /)
              (281 . |setelt|) |PLEQN;dmp2rfi;LL;10| (|List| 69)
              |PLEQN;psolve;MLL;11| (|List| 133) |PLEQN;se2rfi;LL;25|
              |PLEQN;psolve;MLL;12| |PLEQN;psolve;ML;13| (|PositiveInteger|)
              |PLEQN;psolve;MLPiL;14| |PLEQN;psolve;MLPiL;15|
              |PLEQN;psolve;MPiL;16| |PLEQN;psolve;MLSI;17|
              |PLEQN;psolve;MLSI;18| |PLEQN;psolve;MSI;19| (288 . <=) (294 . >)
              (|List| 26) |PLEQN;nextSublist;2IL;20| |PLEQN;psolve;MLPiSI;21|
              |PLEQN;psolve;MLPiSI;22| |PLEQN;psolve;MPiSI;23| (300 . |entry?|)
              (|Symbol|) (306 . |monomial|) (313 . |coerce|) (318 . |ground|)
              (323 . |coerce|) |PLEQN;wrregime;LSI;27| (328 . |convert|)
              (333 . |coerce|) (338 . |coerce|) (|Mapping| 31 7)
              (|Mapping| 31 6) (|PolynomialCategoryLifting| 8 7 6 9 31)
              (343 . |map|) (350 . |filename|) (357 . |open|)
              (|Union| 69 '"failed") (363 . |readIfCan!|)
              |PLEQN;rdregime;SL;29| |PLEQN;overset?;LLB;35| (|Factored| $)
              (368 . |squareFree|) |PLEQN;sqfree;2GR;33| (373 . |elt|)
              (380 . ~=) (386 . |degree|) (391 . <) (|Mapping| 10 70 70)
              (397 . |sort|) (|Set| 9) (403 . |brace|) (408 . <))
           '#(|wrregime| 414 |sqfree| 420 |se2rfi| 425 |regime| 430 |redpps|
              441 |redmat| 447 |rdregime| 453 |psolve| 458 |pr2dmp| 538
              |overset?| 543 |nextSublist| 549 |minset| 555 |minrank| 560
              |maxrank| 565 |inconsistent?| 570 |hasoln| 580 |factorset| 586
              |dmp2rfi| 591 |bsolve| 606 |ParCondList| 615 |ParCond| 621
              |B1solve| 627)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(1 9 10 0 11 1 14 10 0 15 1
                                                   19 18 0 20 0 6 0 21 0 9 0 22
                                                   2 24 0 23 23 25 1 24 26 0 27
                                                   2 26 0 0 0 28 0 6 0 29 0 8 0
                                                   30 0 31 0 32 2 18 10 0 0 33
                                                   2 19 0 18 18 34 3 19 31 0 23
                                                   23 35 4 19 31 0 23 23 31 36
                                                   1 31 0 0 37 2 38 31 0 23 39
                                                   1 19 0 0 40 3 41 31 0 23 31
                                                   42 0 31 0 43 2 12 0 0 0 48 2
                                                   9 0 0 0 49 1 50 12 12 51 2
                                                   26 10 23 0 55 2 41 31 0 23
                                                   57 2 31 0 0 0 58 2 31 0 0 0
                                                   59 2 31 0 0 0 60 1 31 14 0
                                                   61 0 14 0 62 2 14 10 0 0 63
                                                   0 14 0 64 1 12 0 0 66 3 74 0
                                                   73 73 73 75 1 76 0 74 77 2
                                                   79 78 0 23 83 2 76 69 0 69
                                                   85 1 76 0 0 86 1 90 89 9 91
                                                   1 89 93 0 94 1 52 18 0 95 2
                                                   96 70 0 23 98 2 50 9 9 12 99
                                                   0 9 0 100 2 9 10 0 0 101 2
                                                   52 0 18 18 102 4 52 9 0 23
                                                   23 9 103 1 31 14 0 104 2 105
                                                   41 0 23 106 3 52 9 0 23 23
                                                   107 2 31 0 0 0 109 3 105 41
                                                   0 23 41 110 2 23 10 0 0 125
                                                   2 23 10 0 0 126 2 71 10 12 0
                                                   132 3 14 0 0 133 18 134 1 31
                                                   0 14 135 1 14 6 0 136 1 9 0
                                                   6 137 1 7 133 0 139 1 31 0
                                                   133 140 1 14 0 6 141 3 144
                                                   31 142 143 9 145 3 74 0 73
                                                   73 73 146 2 76 0 74 73 147 1
                                                   76 148 0 149 1 9 152 0 153 3
                                                   52 0 0 26 26 155 2 9 10 0 0
                                                   156 1 9 8 0 157 2 8 10 0 0
                                                   158 2 96 0 159 0 160 1 161 0
                                                   12 162 2 161 10 0 0 163 2 0
                                                   23 112 73 138 1 0 9 9 154 1
                                                   0 38 114 115 7 0 69 70 52 38
                                                   71 18 18 23 72 2 0 44 44 12
                                                   56 2 0 52 52 12 53 1 0 112
                                                   73 150 2 0 112 52 114 116 2
                                                   0 112 52 12 113 3 0 112 52
                                                   12 118 119 1 0 112 52 117 2
                                                   0 112 52 118 121 3 0 112 52
                                                   114 118 120 3 0 23 52 12 73
                                                   122 2 0 23 52 73 124 3 0 23
                                                   52 114 73 123 4 0 23 52 114
                                                   118 73 130 4 0 23 52 12 118
                                                   73 129 3 0 23 52 118 73 131
                                                   1 0 9 14 65 2 0 10 12 71 151
                                                   2 0 127 23 23 128 1 0 71 71
                                                   84 1 0 18 79 82 1 0 18 79 81
                                                   1 0 10 16 17 1 0 10 12 13 2
                                                   0 67 12 12 68 1 0 12 9 47 1
                                                   0 31 9 108 1 0 38 12 111 1 0
                                                   19 52 54 5 0 87 52 38 18 73
                                                   23 88 2 0 79 52 18 80 2 0 96
                                                   52 18 97 1 0 44 45 46)))))
           '|lookupComplete|)) 
