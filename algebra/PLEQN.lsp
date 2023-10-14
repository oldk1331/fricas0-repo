
(/VERSIONCHECK 2) 

(DEFUN |PLEQN;inconsistent?;LB;1| (|pl| $)
  (PROG (#1=#:G138 #2=#:G140 #3=#:G141 |p|)
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
  (PROG (#1=#:G143 #2=#:G145 #3=#:G146 |p|)
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
  (PROG (|pbas| |pb| #1=#:G171 |j| |j1| #2=#:G170 |i| |i1| #3=#:G169 #4=#:G168
         |augmat| #5=#:G167 #6=#:G166 #7=#:G165 |p| |w| |frcols| |n| |cmat| |k|
         |nss| |rss|)
    (RETURN
     (SEQ (LETT |rss| (QVELT |sys| 3) . #8=(|PLEQN;B1solve;RR;3|))
          (LETT |nss| (QVELT |sys| 4) . #8#) (LETT |k| (QVELT |sys| 2) . #8#)
          (LETT |cmat| (QVELT |sys| 0) . #8#) (LETT |n| (ANCOLS |cmat|) . #8#)
          (LETT |frcols|
                (SPADCALL
                 (SPADCALL (SPADCALL 1 |n| (QREFELT $ 22)) (QREFELT $ 24))
                 |nss| (QREFELT $ 25))
                . #8#)
          (LETT |w| (QVELT |sys| 1) . #8#)
          (LETT |p| (MAKEARR1 |n| (|spadConstant| $ 29)) . #8#)
          (LETT |pbas| NIL . #8#)
          (COND
           ((SPADCALL |k| 0 (QREFELT $ 31))
            (SEQ (LETT |augmat| (SPADCALL |k| (+ |n| 1) (QREFELT $ 33)) . #8#)
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
                                                  (QREFELT $ 34))
                                        (QREFELT $ 35))))
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
                                                   (QREFELT $ 34))
                                         (QREFELT $ 36))
                                        (QREFELT $ 35))))
                            (LETT #5#
                                  (PROG1 (CDR #5#)
                                    (LETT |j1| (+ |j1| 1) . #8#))
                                  . #8#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL |augmat| |i1| (+ |n| 1)
                                  (SPADCALL |w| |i| (QREFELT $ 38))
                                  (QREFELT $ 35))))
                      (LETT #7#
                            (PROG1 (CDR #7#) (LETT |i1| (|inc_SI| |i1|) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (LETT |augmat| (SPADCALL |augmat| (QREFELT $ 39)) . #8#)
                 (SEQ (LETT |i1| 1 . #8#) (LETT |i| NIL . #8#)
                      (LETT #4# |nss| . #8#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |p| |i|
                                  (SPADCALL |augmat| |i1| (+ |n| 1)
                                            (QREFELT $ 34))
                                  (QREFELT $ 41))))
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
                        (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 29)) . #8#)
                        (SPADCALL |pb| |j| (|spadConstant| $ 42)
                                  (QREFELT $ 41))
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
                                                   (QREFELT $ 34))
                                         (QREFELT $ 41))))
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
                 (SEQ (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 29)) . #8#)
                      (SPADCALL |pb| |j| (|spadConstant| $ 42) (QREFELT $ 41))
                      (EXIT (LETT |pbas| (CONS |pb| |pbas|) . #8#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |j1| (+ |j1| 1) . #8#))
                       . #8#)
                 (GO G190) G191 (EXIT NIL))))
          (EXIT (CONS |p| |pbas|)))))) 

(DEFUN |PLEQN;regime;RMLL2NniIR;4|
       (|y| |coef| |w| |psbf| |rk| |rkmax| |mode| $)
  (PROG (|test| |yzero| #1=#:G206 |pw| #2=#:G205 |wcd| #3=#:G197 |wnum| |weqn|
         #4=#:G183 #5=#:G182 #6=#:G184 #7=#:G204 |j| #8=#:G203 |i| |frows| |pp|
         |pps| |sys| |nss| |rss| |nc| #9=#:G176 #10=#:G175 #11=#:G177
         #12=#:G202 #13=#:G103 #14=#:G201 |x| #15=#:G200 #16=#:G199 #17=#:G198
         |ydetf|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ydetf| (SPADCALL (QVELT |y| 0) (QREFELT $ 46))
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
                                                     (QREFELT $ 47))
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
                                                                           48))
                                                        . #18#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #10# #11# . #18#)
                                                   (LETT #9# 'T . #18#)))))))
                                             (LETT #12# (CDR #12#) . #18#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#9# #10#)
                                              ('T (|spadConstant| $ 19))))
                                       #15#)
                                      . #18#)))
                              (LETT #14# (CDR #14#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        (QREFELT $ 50))))))
              . #18#)
        (LETT |nc|
              (SPADCALL (SPADCALL |coef| |yzero| (QREFELT $ 52))
                        (QREFELT $ 53))
              . #18#)
        (LETT |rss| (QVELT |y| 1) . #18#) (LETT |nss| (QVELT |y| 2) . #18#)
        (LETT |sys| (VECTOR |nc| |w| |rk| |rss| |nss|) . #18#)
        (LETT |pps| (SPADCALL |sys| (QREFELT $ 45)) . #18#)
        (LETT |pp| (QCAR |pps|) . #18#)
        (LETT |frows|
              (SPADCALL
               (SPADCALL (SPADCALL 1 (ANROWS |coef|) (QREFELT $ 22))
                         (QREFELT $ 24))
               |rss| (QREFELT $ 25))
              . #18#)
        (LETT |wcd| NIL . #18#)
        (EXIT
         (COND
          ((SPADCALL |mode| (LIST 3 6 9 12) (QREFELT $ 54))
           (VECTOR |yzero| |ydetf| |wcd|
                   (SPADCALL |pps| |yzero| (QREFELT $ 55))))
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
                                        (SPADCALL |nc| |i| |j| (QREFELT $ 34))
                                        (SPADCALL |pp| |j| (QREFELT $ 56))
                                        (QREFELT $ 57))
                                       . #18#)
                                 (COND
                                  (#4#
                                   (LETT #5# (SPADCALL #5# #6# (QREFELT $ 58))
                                         . #18#))
                                  ('T
                                   (PROGN
                                    (LETT #5# #6# . #18#)
                                    (LETT #4# 'T . #18#)))))))
                              (LETT #7# (CDR #7#) . #18#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#4# #5#) ('T (|spadConstant| $ 29))))
                        . #18#)
                  (LETT |wnum|
                        (SPADCALL
                         (SPADCALL (SPADCALL |w| |i| (QREFELT $ 38)) |weqn|
                                   (QREFELT $ 59))
                         (QREFELT $ 60))
                        . #18#)
                  (EXIT
                   (COND
                    ((SPADCALL |wnum| (|spadConstant| $ 61) (QREFELT $ 62))
                     "trivially satisfied")
                    ((SPADCALL |wnum| (QREFELT $ 15))
                     (PROGN
                      (LETT #3#
                            (VECTOR |yzero| |ydetf|
                                    (LIST (|spadConstant| $ 63)) |pps|)
                            . #18#)
                      (GO #3#)))
                    ('T (LETT |wcd| (CONS |wnum| |wcd|) . #18#)))))
                 (LETT #8# (CDR #8#) . #18#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |mode| (LIST 2 5 8 11) (QREFELT $ 54))
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
                                                (SPADCALL |pw| (QREFELT $ 64))
                                                #2#)
                                               . #18#)))
                                       (LETT #1# (CDR #1#) . #18#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#)))))
                         (QREFELT $ 65))
                        . #18#)))
                (LETT |test| (SPADCALL |yzero| |ydetf| (QREFELT $ 67)) . #18#)
                (COND
                 ((NULL (QVELT |test| 0))
                  (EXIT
                   (VECTOR (QVELT |test| 1) (QVELT |test| 2)
                           (LIST (|spadConstant| $ 63)) |pps|))))
                (EXIT
                 (VECTOR (QVELT |test| 1) (QVELT |test| 2) NIL
                         (SPADCALL |pps| (QVELT |test| 1)
                                   (QREFELT $ 55))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |PLEQN;bsolve;MLNniSIR;5| (|coeff| |w| |h| |outname| |mode| $)
  (PROG (|count| |lrec3| |rec3| #1=#:G227 |y| |psbf| #2=#:G226 |x| #3=#:G225
         |psb| |pc| |rk| |k| |rkmin| |rkmax| |rrcl| #4=#:G213 |rksoln|
         |newfile| |filemode| |r|)
    (RETURN
     (SEQ (LETT |r| (ANROWS |coeff|) . #5=(|PLEQN;bsolve;MLNniSIR;5|))
          (EXIT
           (COND
            ((SPADCALL |r| (LENGTH |w|) (QREFELT $ 31))
             (|error| "number of rows unequal on lhs and rhs"))
            (#6='T
             (SEQ (LETT |count| 0 . #5#) (LETT |lrec3| NIL . #5#)
                  (LETT |filemode|
                        (SPADCALL |mode| (LIST 7 8 9 10 11 12) (QREFELT $ 54))
                        . #5#)
                  (COND
                   (|filemode|
                    (SEQ
                     (LETT |newfile|
                           (SPADCALL "" |outname| "regime" (QREFELT $ 74))
                           . #5#)
                     (EXIT
                      (LETT |rksoln| (SPADCALL |newfile| (QREFELT $ 76))
                            . #5#)))))
                  (LETT |rrcl|
                        (COND
                         ((SPADCALL |mode| (LIST 1 2 3 7 8 9) (QREFELT $ 54))
                          (SPADCALL |coeff| 0 (QREFELT $ 79)))
                         (#6#
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |mode| (LIST 4 5 6 10 11 12)
                                        (QREFELT $ 54))
                              (PROGN
                               (LETT #4# (SPADCALL |coeff| |h| (QREFELT $ 79))
                                     . #5#)
                               (GO #4#)))))
                           #4# (EXIT #4#))))
                        . #5#)
                  (LETT |rkmax| (SPADCALL |rrcl| (QREFELT $ 80)) . #5#)
                  (LETT |rkmin| (SPADCALL |rrcl| (QREFELT $ 81)) . #5#)
                  (SEQ (LETT |k| (+ (- |rkmax| |rkmin|) 1) . #5#) G190
                       (COND ((< |k| 1) (GO G191)))
                       (SEQ
                        (LETT |rk|
                              (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 82)) 0)
                              . #5#)
                        (LETT |pc|
                              (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 82)) 1)
                              . #5#)
                        (LETT |psb|
                              (COND ((EQL |rk| |rkmax|) NIL)
                                    ('T
                                     (QVELT
                                      (SPADCALL |rrcl| (+ |k| 1)
                                                (QREFELT $ 82))
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
                                            (CONS (SPADCALL |x| (QREFELT $ 46))
                                                  #3#)
                                            . #5#)))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              . #5#)
                        (LETT |psbf| (SPADCALL |psbf| (QREFELT $ 83)) . #5#)
                        (EXIT
                         (SEQ (LETT |y| NIL . #5#) (LETT #1# |pc| . #5#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |y| (CAR #1#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |rec3|
                                     (SPADCALL |y| |coeff| |w| |psbf| |rk|
                                               |rkmax| |mode| (QREFELT $ 71))
                                     . #5#)
                               (EXIT
                                (COND
                                 ((SPADCALL (QVELT |rec3| 2) (QREFELT $ 17))
                                  "incompatible system")
                                 ('T
                                  (SEQ
                                   (COND
                                    (|filemode|
                                     (SPADCALL |rksoln| |rec3| (QREFELT $ 84)))
                                    ('T
                                     (LETT |lrec3| (CONS |rec3| |lrec3|)
                                           . #5#)))
                                   (EXIT
                                    (LETT |count| (+ |count| 1) . #5#)))))))
                              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |k| (+ |k| -1) . #5#) (GO G190) G191 (EXIT NIL))
                  (COND (|filemode| (SPADCALL |rksoln| (QREFELT $ 85))))
                  (EXIT (CONS |lrec3| |count|)))))))))) 

(DEFUN |PLEQN;factorset;GRL;6| (|y| $)
  (PROG (#1=#:G233 |j| #2=#:G232)
    (RETURN
     (SEQ
      (COND ((SPADCALL |y| (QREFELT $ 11)) NIL)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|PLEQN;factorset;GRL;6|))
              (SEQ (LETT |j| NIL . #3#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |y| (QREFELT $ 90))
                                   (QREFELT $ 93))
                         . #3#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |j| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (QCAR |j|) #2#) . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |PLEQN;ParCondList;MNniL;7| (|mat| |h| $)
  (PROG (|rcl| |pcl| |ps| |done| |covered| |npc| |zro| |test| |p| #1=#:G250
         |rc| #2=#:G251 |maxrk| |pc| |k| #3=#:G249 |n| |r| |psbf|)
    (RETURN
     (SEQ (LETT |rcl| NIL . #4=(|PLEQN;ParCondList;MNniL;7|))
          (LETT |ps| NIL . #4#) (LETT |pc| NIL . #4#) (LETT |npc| NIL . #4#)
          (LETT |psbf| NIL . #4#) (LETT |done| 'NIL . #4#)
          (LETT |r| (ANROWS |mat|) . #4#) (LETT |n| (ANCOLS |mat|) . #4#)
          (LETT |maxrk| (MIN |r| |n|) . #4#)
          (SEQ (LETT #3# NIL . #4#) (LETT |k| (MIN |r| |n|) . #4#) G190
               (COND ((OR (< |k| |h|) #3#) (GO G191)))
               (SEQ (LETT |pc| (SPADCALL |mat| |k| (QREFELT $ 95)) . #4#)
                    (LETT |npc| NIL . #4#)
                    (COND
                     ((NULL |pc|)
                      (COND
                       ((>= |k| 1) (EXIT (LETT |maxrk| (- |k| 1) . #4#))))))
                    (COND
                     ((SPADCALL (QVELT (SPADCALL |pc| 1 (QREFELT $ 96)) 0)
                                (QREFELT $ 11))
                      (SEQ (LETT |npc| |pc| . #4#) (LETT |done| 'T . #4#)
                           (EXIT
                            (LETT |ps| (LIST (|spadConstant| $ 19)) . #4#))))
                     ('T
                      (SEQ
                       (LETT |zro|
                             (COND ((EQL |k| |maxrk|) NIL)
                                   ('T
                                    (QVELT (SPADCALL |rcl| 1 (QREFELT $ 82))
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
                                             (QREFELT $ 97))
                                   . #4#)
                             (EXIT
                              (COND
                               ((SPADCALL |p| (|spadConstant| $ 98)
                                          (QREFELT $ 99))
                                "incompatible or covered subdeterminant")
                               ('T
                                (SEQ
                                 (LETT |test|
                                       (SPADCALL |zro| (LIST (QVELT |rc| 0))
                                                 (QREFELT $ 67))
                                       . #4#)
                                 (COND
                                  ((NULL (QVELT |test| 0))
                                   (EXIT "incompatible or covered")))
                                 (LETT |zro|
                                       (SPADCALL (CONS |p| |zro|)
                                                 (QREFELT $ 50))
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
          (LETT |nummat| (SPADCALL |r| |n| (QREFELT $ 100)) . #1#)
          (LETT |denmat| (SPADCALL |r| |n| (QREFELT $ 100)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (SPADCALL |nummat| |i| 1
                          (SPADCALL
                           (SPADCALL (SPADCALL |pv| |i| (QREFELT $ 56))
                                     (QREFELT $ 60))
                           (QREFELT $ 64))
                          (QREFELT $ 101))
                (EXIT
                 (SPADCALL |denmat| |i| 1
                           (SPADCALL
                            (SPADCALL (SPADCALL |pv| |i| (QREFELT $ 56))
                                      (QREFELT $ 102))
                            (QREFELT $ 64))
                           (QREFELT $ 101))))
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
                                    (SPADCALL |pb| (- |j| 1) (QREFELT $ 104))
                                    |i| (QREFELT $ 56))
                                   (QREFELT $ 60))
                                  (QREFELT $ 64))
                                 (QREFELT $ 101))
                       (EXIT
                        (SPADCALL |denmat| |i| |j|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |pb| (- |j| 1) (QREFELT $ 104))
                                     |i| (QREFELT $ 56))
                                    (QREFELT $ 102))
                                   (QREFELT $ 64))
                                  (QREFELT $ 101))))
                      (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |nummat| (SPADCALL |nummat| |zz| (QREFELT $ 52)) . #1#)
          (LETT |denmat| (SPADCALL |denmat| |zz| (QREFELT $ 52)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |pv| |i|
                           (SPADCALL
                            (SPADCALL (SPADCALL |nummat| |i| 1 (QREFELT $ 105))
                                      (QREFELT $ 106))
                            (SPADCALL (SPADCALL |denmat| |i| 1 (QREFELT $ 105))
                                      (QREFELT $ 106))
                            (QREFELT $ 107))
                           (QREFELT $ 41))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| 2 . #1#) G190
               (COND ((|greater_SI| |j| |n|) (GO G191)))
               (SEQ (LETT |pbj| (MAKEARR1 |r| (|spadConstant| $ 29)) . #1#)
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| |r|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |pbj| |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |nummat| |i| |j|
                                                 (QREFELT $ 105))
                                       (QREFELT $ 106))
                                      (SPADCALL
                                       (SPADCALL |denmat| |i| |j|
                                                 (QREFELT $ 105))
                                       (QREFELT $ 106))
                                      (QREFELT $ 107))
                                     (QREFELT $ 41))))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SPADCALL |pb| (- |j| 1) |pbj| (QREFELT $ 108))))
               (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |pv| |pb|)))))) 

(DEFUN |PLEQN;dmp2rfi;MM;9| (|mat| $)
  (PROG (|j| |i| |nmat| |n| |r|)
    (RETURN
     (SEQ (LETT |r| (ANROWS |mat|) . #1=(|PLEQN;dmp2rfi;MM;9|))
          (LETT |n| (ANCOLS |mat|) . #1#)
          (LETT |nmat| (SPADCALL |r| |n| (QREFELT $ 33)) . #1#)
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
                                   (SPADCALL |mat| |i| |j| (QREFELT $ 105))
                                   (QREFELT $ 106))
                                  (QREFELT $ 35))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |nmat|))))) 

(DEFUN |PLEQN;dmp2rfi;LL;10| (|vl| $)
  (PROG (#1=#:G271 |v| #2=#:G270)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|PLEQN;dmp2rfi;LL;10|))
       (SEQ (LETT |v| NIL . #3#) (LETT #1# |vl| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 106)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |PLEQN;psolve;MLL;11| (|mat| |w| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) 1 "nofile" 1 (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MLL;12| (|mat| |w| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) 1 "nofile" 2 (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;ML;13| (|mat| $)
  (PROG (#1=#:G285 |i| #2=#:G284)
    (RETURN
     (SEQ
      (QCAR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;ML;13|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (ANROWS |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 29) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 1 "nofile" 3 (QREFELT $ 87))))))) 

(DEFUN |PLEQN;psolve;MLPiL;14| (|mat| |w| |h| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) |h| "nofile" 4
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MLPiL;15| (|mat| |w| |h| $)
  (QCAR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) |h| "nofile" 5
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MPiL;16| (|mat| |h| $)
  (PROG (#1=#:G298 |i| #2=#:G297)
    (RETURN
     (SEQ
      (QCAR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MPiL;16|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (ANROWS |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 29) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |h| "nofile" 6 (QREFELT $ 87))))))) 

(DEFUN |PLEQN;psolve;MLSI;17| (|mat| |w| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) 1 |outname| 7
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MLSI;18| (|mat| |w| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) 1 |outname| 8
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MSI;19| (|mat| |outname| $)
  (PROG (#1=#:G308 |i| #2=#:G307)
    (RETURN
     (SEQ
      (QCDR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MSI;19|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (ANROWS |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 29) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 1 |outname| 9 (QREFELT $ 87))))))) 

(DEFUN |PLEQN;nextSublist;2IL;20| (|n| |k| $)
  (PROG (|mslist| #1=#:G312 |ms|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |n| 0 (QREFELT $ 123)) NIL)
            ((SPADCALL |k| 0 (QREFELT $ 123)) (LIST NIL))
            ((SPADCALL |k| |n| (QREFELT $ 124)) NIL)
            ('T
             (SEQ
              (COND ((EQL |n| 1) (COND ((EQL |k| 1) (EXIT (LIST (LIST 1)))))))
              (LETT |mslist| NIL . #2=(|PLEQN;nextSublist;2IL;20|))
              (SEQ (LETT |ms| NIL . #2#)
                   (LETT #1# (SPADCALL (- |n| 1) (- |k| 1) (QREFELT $ 126))
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
               (APPEND (SPADCALL (- |n| 1) |k| (QREFELT $ 126))
                       |mslist|))))))))) 

(DEFUN |PLEQN;psolve;MLPiSI;21| (|mat| |w| |h| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) |h| |outname| 10
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MLPiSI;22| (|mat| |w| |h| |outname| $)
  (QCDR
   (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) |h| |outname| 11
             (QREFELT $ 87)))) 

(DEFUN |PLEQN;psolve;MPiSI;23| (|mat| |h| |outname| $)
  (PROG (#1=#:G322 |i| #2=#:G321)
    (RETURN
     (SEQ
      (QCDR
       (SPADCALL |mat|
                 (PROGN
                  (LETT #2# NIL . #3=(|PLEQN;psolve;MPiSI;23|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (ANROWS |mat|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|spadConstant| $ 29) #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |h| |outname| 12 (QREFELT $ 87))))))) 

(DEFUN |PLEQN;hasoln;2LR;24| (|zro| |nzro| $)
  (PROG (#1=#:G355 |p| #2=#:G354 #3=#:G353 #4=#:G352 #5=#:G330 #6=#:G329
         #7=#:G331 #8=#:G351 #9=#:G105 #10=#:G350 |x| #11=#:G349 |psbf|
         #12=#:G348 #13=#:G347 #14=#:G346 #15=#:G345 |pnzro| #16=#:G325
         #17=#:G324 #18=#:G326 #19=#:G344 #20=#:G104)
    (RETURN
     (SEQ
      (COND ((NULL |zro|) (VECTOR 'T |zro| |nzro|))
            (#21='T
             (SEQ
              (LETT |zro| (SPADCALL |zro| (QREFELT $ 50))
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
                                          (SPADCALL #17# #18# (QREFELT $ 48))
                                          . #22#))
                                   ('T
                                    (PROGN
                                     (LETT #17# #18# . #22#)
                                     (LETT #16# 'T . #22#)))))))
                               (LETT #19# (CDR #19#) . #22#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#16# #17#) (#21# (|spadConstant| $ 19))))
                         |zro| (QREFELT $ 97))
                        . #22#)
                  (EXIT
                   (COND
                    ((SPADCALL |pnzro| (|spadConstant| $ 98) (QREFELT $ 99))
                     (VECTOR 'NIL |zro| |nzro|))
                    (#21#
                     (SEQ
                      (LETT |nzro| (SPADCALL |pnzro| (QREFELT $ 46)) . #22#)
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
                                           (CONS (SPADCALL |p| (QREFELT $ 46))
                                                 #15#)
                                           . #22#)))
                                   (LETT #14# (CDR #14#) . #22#) (GO G190) G191
                                   (EXIT (NREVERSE #15#))))
                             (QREFELT $ 83))
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
                                           (SPADCALL |x| |nzro| (QREFELT $ 47))
                                           #13#)
                                          . #22#)))
                                  (LETT #12# (CDR #12#) . #22#) (GO G190) G191
                                  (EXIT (NREVERSE #13#))))
                            . #22#)
                      (EXIT
                       (COND
                        ((SPADCALL NIL |psbf| (QREFELT $ 130))
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
                                                                            48))
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
                                                                        19))))
                                                #11#)
                                               . #22#)))
                                       (LETT #10# (CDR #10#) . #22#) (GO G190)
                                       G191 (EXIT (NREVERSE #11#))))
                                 (QREFELT $ 50))
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
                                                             (QREFELT $ 97))
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
  (PROG (#1=#:G359 |wi| #2=#:G358)
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
                      (SPADCALL (|spadConstant| $ 63) |wi| 1 (QREFELT $ 132))
                      (QREFELT $ 133))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |PLEQN;pr2dmp;PGR;26| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 15))
    (SPADCALL (SPADCALL |p| (QREFELT $ 134)) (QREFELT $ 135)))
   ('T
    (|algCoerceInteractive| |p| (|Polynomial| (QREFELT $ 6)) (QREFELT $ 9))))) 

(DEFUN |PLEQN;wrregime;LSI;27| (|lrec3| |outname| $)
  (PROG (|count| #1=#:G367 |rec3| |rksoln| |newfile|)
    (RETURN
     (SEQ
      (LETT |newfile| (SPADCALL "" |outname| "regime" (QREFELT $ 74))
            . #2=(|PLEQN;wrregime;LSI;27|))
      (LETT |rksoln| (SPADCALL |newfile| (QREFELT $ 76)) . #2#)
      (LETT |count| 0 . #2#)
      (SEQ (LETT |rec3| NIL . #2#) (LETT #1# |lrec3| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |rec3| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (SPADCALL |rksoln| |rec3| (QREFELT $ 84))
                (EXIT (LETT |count| (+ |count| 1) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |rksoln| (QREFELT $ 85)) (EXIT |count|))))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28| (|p| $)
  (SPADCALL (CONS #'|PLEQN;dmp2rfi;GRF;28!0| $)
            (CONS #'|PLEQN;dmp2rfi;GRF;28!1| $) |p| (QREFELT $ 143))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28!1| (|r1| $)
  (SPADCALL (SPADCALL |r1| (QREFELT $ 139)) (QREFELT $ 133))) 

(DEFUN |PLEQN;dmp2rfi;GRF;28!0| (|v1| $)
  (SPADCALL (SPADCALL |v1| (QREFELT $ 137)) (QREFELT $ 138))) 

(DEFUN |PLEQN;rdregime;SL;29| (|inname| $)
  (PROG (|rec3| |rksoln| #1=#:G373 |infile| |infilename|)
    (RETURN
     (SEQ
      (LETT |infilename| (SPADCALL "" |inname| "regime" (QREFELT $ 144))
            . #2=(|PLEQN;rdregime;SL;29|))
      (LETT |infile| (SPADCALL |infilename| "input" (QREFELT $ 145)) . #2#)
      (LETT |rksoln| NIL . #2#)
      (LETT |rec3| (SPADCALL |infile| (QREFELT $ 147)) . #2#)
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
            (EXIT (LETT |rec3| (SPADCALL |infile| (QREFELT $ 147)) . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (SPADCALL |infile| (QREFELT $ 85)) (EXIT |rksoln|))))) 

(DEFUN |PLEQN;maxrank;LNni;30| (|rcl| $)
  (PROG (#1=#:G381 #2=#:G380 #3=#:G382 #4=#:G385 |j|)
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
  (PROG (#1=#:G388 #2=#:G387 #3=#:G389 #4=#:G392 |j|)
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
  (PROG (#1=#:G398 |x| #2=#:G397)
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
                      ((COND ((SPADCALL |x| |lset| (QREFELT $ 149)) 'NIL)
                             (#3# 'T))
                       (LETT #2# (CONS |x| #2#) . #4#)))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |PLEQN;sqfree;2GR;33| (|p| $)
  (PROG (#1=#:G401 #2=#:G400 #3=#:G402 #4=#:G404 |j|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|PLEQN;sqfree;2GR;33|))
       (SEQ (LETT |j| NIL . #5#)
            (LETT #4# (SPADCALL (SPADCALL |p| (QREFELT $ 151)) (QREFELT $ 93))
                  . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (QCAR |j|) . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 48)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 19)))))))) 

(DEFUN |PLEQN;ParCond;MNniL;34| (|mat| |k| $)
  (PROG (|DetEqn| |neweqn| |detmat| |found| |matsub| #1=#:G416 |nss| #2=#:G417
         #3=#:G414 |rss| #4=#:G415 |n| |r| |j|)
    (RETURN
     (SEQ
      (COND ((EQL |k| 0) (LIST (VECTOR (|spadConstant| $ 19) NIL NIL)))
            (#5='T
             (SEQ (LETT |j| |k| . #6=(|PLEQN;ParCond;MNniL;34|))
                  (LETT |DetEqn| NIL . #6#) (LETT |r| (ANROWS |mat|) . #6#)
                  (LETT |n| (ANCOLS |mat|) . #6#)
                  (EXIT
                   (COND
                    ((SPADCALL |k| (MIN |r| |n|) (QREFELT $ 124))
                     (|error| "k exceeds maximum possible rank "))
                    (#5#
                     (SEQ (LETT |found| 'NIL . #6#)
                          (SEQ (LETT #4# NIL . #6#) (LETT |rss| NIL . #6#)
                               (LETT #3# (SPADCALL |r| |k| (QREFELT $ 126))
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
                                            (SPADCALL |n| |k| (QREFELT $ 126))
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
                                                       (QREFELT $ 153))
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
                                                    (|spadConstant| $ 98)
                                                    (QREFELT $ 154))
                                          (SEQ
                                           (LETT |found|
                                                 (SPADCALL |detmat|
                                                           (QREFELT $ 11))
                                                 . #6#)
                                           (LETT |detmat|
                                                 (SPADCALL |detmat|
                                                           (QREFELT $ 152))
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
                                   |DetEqn| (QREFELT $ 158)))))))))))))))) 

(DEFUN |PLEQN;ParCond;MNniL;34!0| (|z1| |z2| $)
  (SPADCALL (SPADCALL (QVELT |z1| 0) (QREFELT $ 155))
            (SPADCALL (QVELT |z2| 0) (QREFELT $ 155)) (QREFELT $ 156))) 

(DEFUN |PLEQN;overset?;LLB;35| (|p| |qlist| $)
  (PROG (#1=#:G419 #2=#:G418 #3=#:G420 #4=#:G423 |q|)
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
                            (SPADCALL (SPADCALL |q| (QREFELT $ 160))
                                      (SPADCALL |p| (QREFELT $ 160))
                                      (QREFELT $ 161))
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
     (SEQ (LETT |r| (ANROWS |mat|) . #1=(|PLEQN;redmat;MLM;36|))
          (LETT |n| (ANCOLS |mat|) . #1#)
          (LETT |newmat| (SPADCALL |r| |n| (QREFELT $ 100)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |r|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |n|) (GO G191)))
                      (SEQ
                       (LETT |p| (SPADCALL |mat| |i| |j| (QREFELT $ 105))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |p| (QREFELT $ 11))
                          (SPADCALL |newmat| |i| |j| |p| (QREFELT $ 101)))
                         ('T
                          (SPADCALL |newmat| |i| |j|
                                    (SPADCALL |p| |psb| (QREFELT $ 97))
                                    (QREFELT $ 101))))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |newmat|))))) 

(DECLAIM (NOTINLINE |ParametricLinearEquations;|)) 

(DEFUN |ParametricLinearEquations| (&REST #1=#:G429)
  (PROG ()
    (RETURN
     (PROG (#2=#:G430)
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
      (LETT $ (GETREFV 162) . #1#)
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
              (10 . |One|) (14 . |One|) (|Integer|) (|Segment| 20)
              (18 . SEGMENT) (|List| 20) (24 . |expand|) (29 . |setDifference|)
              (35 . |Zero|) (39 . |Zero|) (|Fraction| 14) (43 . |Zero|)
              (|NonNegativeInteger|) (47 . ~=) (|Matrix| 28) (53 . |zero|)
              (59 . |elt|) (66 . |setelt|) (74 . -) (|List| 28) (79 . |elt|)
              (85 . |rowEchelon|) (|Vector| 28) (90 . |setelt|) (97 . |One|)
              (|Record| (|:| |partsol| 40) (|:| |basis| 103))
              (|Record| (|:| |mat| 32) (|:| |vec| 37) (|:| |rank| 30)
                        (|:| |rows| 23) (|:| |cols| 23))
              |PLEQN;B1solve;RR;3| |PLEQN;factorset;GRL;6|
              (101 . |setDifference|) (107 . *)
              (|EuclideanGroebnerBasisPackage| 6 8 7 9)
              (113 . |euclideanGroebner|) (|Matrix| 9) |PLEQN;redmat;MLM;36|
              |PLEQN;dmp2rfi;MM;9| (118 . |entry?|) |PLEQN;redpps;RLR;8|
              (124 . |elt|) (130 . *) (136 . +) (142 . -) (148 . |numer|)
              (153 . |Zero|) (157 . =) (163 . |One|) |PLEQN;pr2dmp;PGR;26|
              (167 . |removeDuplicates|)
              (|Record| (|:| |sysok| 10) (|:| |z0| 12) (|:| |n0| 12))
              |PLEQN;hasoln;2LR;24|
              (|Record| (|:| |eqzro| 12) (|:| |neqzro| 12) (|:| |wcond| 16)
                        (|:| |bsoln| 43))
              (|Record| (|:| |det| 9) (|:| |rows| 23) (|:| |cols| 23))
              (|List| 12) |PLEQN;regime;RMLL2NniIR;4| (|String|) (|FileName|)
              (172 . |new|) (|File| 68) (179 . |open|)
              (|Record| (|:| |rank| 30) (|:| |eqns| 94) (|:| |fgb| 12))
              (|List| 77) |PLEQN;ParCondList;MNniL;7| |PLEQN;maxrank;LNni;30|
              |PLEQN;minrank;LNni;31| (184 . |elt|) |PLEQN;minset;2L;32|
              (190 . |write!|) (196 . |close!|)
              (|Record| (|:| |rgl| 110) (|:| |rgsz| 20))
              |PLEQN;bsolve;MLNniSIR;5| (|Factored| 9)
              (|MultivariateFactorize| 7 8 6 9) (201 . |factor|)
              (|Record| (|:| |factor| 9) (|:| |exponent| 20)) (|List| 91)
              (206 . |factors|) (|List| 69) |PLEQN;ParCond;MNniL;34|
              (211 . |elt|) (217 . |euclideanNormalForm|) (223 . |Zero|)
              (227 . =) (233 . |zero|) (239 . |setelt|) (247 . |denom|)
              (|List| 40) (252 . |elt|) (258 . |elt|) |PLEQN;dmp2rfi;GRF;28|
              (265 . /) (271 . |setelt|) |PLEQN;dmp2rfi;LL;10| (|List| 68)
              |PLEQN;psolve;MLL;11| (|List| 131) |PLEQN;se2rfi;LL;25|
              |PLEQN;psolve;MLL;12| |PLEQN;psolve;ML;13| (|PositiveInteger|)
              |PLEQN;psolve;MLPiL;14| |PLEQN;psolve;MLPiL;15|
              |PLEQN;psolve;MPiL;16| |PLEQN;psolve;MLSI;17|
              |PLEQN;psolve;MLSI;18| |PLEQN;psolve;MSI;19| (278 . <=) (284 . >)
              (|List| 23) |PLEQN;nextSublist;2IL;20| |PLEQN;psolve;MLPiSI;21|
              |PLEQN;psolve;MLPiSI;22| |PLEQN;psolve;MPiSI;23| (290 . |entry?|)
              (|Symbol|) (296 . |monomial|) (303 . |coerce|) (308 . |ground|)
              (313 . |coerce|) |PLEQN;wrregime;LSI;27| (318 . |convert|)
              (323 . |coerce|) (328 . |coerce|) (|Mapping| 28 7)
              (|Mapping| 28 6) (|PolynomialCategoryLifting| 8 7 6 9 28)
              (333 . |map|) (340 . |filename|) (347 . |open|)
              (|Union| 68 '"failed") (353 . |readIfCan!|)
              |PLEQN;rdregime;SL;29| |PLEQN;overset?;LLB;35| (|Factored| $)
              (358 . |squareFree|) |PLEQN;sqfree;2GR;33| (363 . |elt|)
              (370 . ~=) (376 . |degree|) (381 . <) (|Mapping| 10 69 69)
              (387 . |sort|) (|Set| 9) (393 . |brace|) (398 . <))
           '#(|wrregime| 404 |sqfree| 410 |se2rfi| 415 |regime| 420 |redpps|
              431 |redmat| 437 |rdregime| 443 |psolve| 448 |pr2dmp| 528
              |overset?| 533 |nextSublist| 539 |minset| 545 |minrank| 550
              |maxrank| 555 |inconsistent?| 560 |hasoln| 570 |factorset| 576
              |dmp2rfi| 581 |bsolve| 596 |ParCondList| 605 |ParCond| 611
              |B1solve| 617)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 161
                                                 '(1 9 10 0 11 1 14 10 0 15 0 6
                                                   0 18 0 9 0 19 2 21 0 20 20
                                                   22 1 21 23 0 24 2 23 0 0 0
                                                   25 0 6 0 26 0 8 0 27 0 28 0
                                                   29 2 30 10 0 0 31 2 32 0 30
                                                   30 33 3 32 28 0 20 20 34 4
                                                   32 28 0 20 20 28 35 1 28 0 0
                                                   36 2 37 28 0 20 38 1 32 0 0
                                                   39 3 40 28 0 20 28 41 0 28 0
                                                   42 2 12 0 0 0 47 2 9 0 0 0
                                                   48 1 49 12 12 50 2 23 10 20
                                                   0 54 2 40 28 0 20 56 2 28 0
                                                   0 0 57 2 28 0 0 0 58 2 28 0
                                                   0 0 59 1 28 14 0 60 0 14 0
                                                   61 2 14 10 0 0 62 0 14 0 63
                                                   1 12 0 0 65 3 73 0 72 72 72
                                                   74 1 75 0 73 76 2 78 77 0 20
                                                   82 2 75 68 0 68 84 1 75 0 0
                                                   85 1 89 88 9 90 1 88 92 0 93
                                                   2 94 69 0 20 96 2 49 9 9 12
                                                   97 0 9 0 98 2 9 10 0 0 99 2
                                                   51 0 30 30 100 4 51 9 0 20
                                                   20 9 101 1 28 14 0 102 2 103
                                                   40 0 20 104 3 51 9 0 20 20
                                                   105 2 28 0 0 0 107 3 103 40
                                                   0 20 40 108 2 20 10 0 0 123
                                                   2 20 10 0 0 124 2 70 10 12 0
                                                   130 3 14 0 0 131 30 132 1 28
                                                   0 14 133 1 14 6 0 134 1 9 0
                                                   6 135 1 7 131 0 137 1 28 0
                                                   131 138 1 14 0 6 139 3 142
                                                   28 140 141 9 143 3 73 0 72
                                                   72 72 144 2 75 0 73 72 145 1
                                                   75 146 0 147 1 9 150 0 151 3
                                                   51 0 0 23 23 153 2 9 10 0 0
                                                   154 1 9 8 0 155 2 8 10 0 0
                                                   156 2 94 0 157 0 158 1 159 0
                                                   12 160 2 159 10 0 0 161 2 0
                                                   20 110 72 136 1 0 9 9 152 1
                                                   0 37 112 113 7 0 68 69 51 37
                                                   70 30 30 20 71 2 0 43 43 12
                                                   55 2 0 51 51 12 52 1 0 110
                                                   72 148 2 0 110 51 112 114 2
                                                   0 110 51 12 111 3 0 110 51
                                                   12 116 117 1 0 110 51 115 2
                                                   0 110 51 116 119 3 0 110 51
                                                   112 116 118 3 0 20 51 12 72
                                                   120 2 0 20 51 72 122 3 0 20
                                                   51 112 72 121 4 0 20 51 112
                                                   116 72 128 4 0 20 51 12 116
                                                   72 127 3 0 20 51 116 72 129
                                                   1 0 9 14 64 2 0 10 12 70 149
                                                   2 0 125 20 20 126 1 0 70 70
                                                   83 1 0 30 78 81 1 0 30 78 80
                                                   1 0 10 16 17 1 0 10 12 13 2
                                                   0 66 12 12 67 1 0 12 9 46 1
                                                   0 28 9 106 1 0 37 12 109 1 0
                                                   32 51 53 5 0 86 51 37 30 72
                                                   20 87 2 0 78 51 30 79 2 0 94
                                                   51 30 95 1 0 43 44 45)))))
           '|lookupComplete|)) 
