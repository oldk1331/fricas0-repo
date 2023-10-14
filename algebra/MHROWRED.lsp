
(DEFUN |MHROWRED;nonzero?| (|v| $)
  (SPADCALL (CONS #'|MHROWRED;nonzero?!0| $) |v| (QREFELT $ 12))) 

(DEFUN |MHROWRED;nonzero?!0| (|s| $)
  (SPADCALL |s| (|spadConstant| $ 7) (QREFELT $ 9))) 

(DEFUN |MHROWRED;non0| (|v| |rown| $)
  (PROG (#1=#:G135 |ans| |allZero| #2=#:G136 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |allZero| 'T . #3=(|MHROWRED;non0|))
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 14)) . #3#)
                 (LETT #2# (QVSIZE |v|) . #3#) G190
                 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| $ 7)
                               (QREFELT $ 9))
                     (COND
                      (|allZero|
                       (SEQ (LETT |allZero| 'NIL . #3#)
                            (EXIT
                             (LETT |ans|
                                   (VECTOR (QAREF1O |v| |i| 1) |i| |rown|)
                                   . #3#))))
                      ('T
                       (PROGN
                        (LETT #1# (CONS 1 "failed") . #3#)
                        (GO #1#))))))))
                 (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (COND (|allZero| (CONS 1 "failed")) ('T (CONS 0 |ans|))))))
      #1# (EXIT #1#))))) 

(DEFUN |MHROWRED;mkMat| (|x| |l| $)
  (PROG (|ll| #1=#:G154 |i| #2=#:G153)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ll|
               (PROGN
                (LETT #2# NIL . #3=(|MHROWRED;mkMat|))
                (SEQ (LETT |i| 1 . #3#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 16)) . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((COND ((SPADCALL |i| |l| (QREFELT $ 18)) 'NIL)
                               (#4='T
                                (|MHROWRED;nonzero?|
                                 (SPADCALL |x| |i| (QREFELT $ 19)) $)))
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |x| |i| (QREFELT $ 19))
                                          (QREFELT $ 21))
                                #2#)
                               . #3#)))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #3#))
        (SPADCALL 1 (ANCOLS |x|) (QREFELT $ 24)))
       (#4# (SPADCALL |ll| (QREFELT $ 26)))))))) 

(DEFUN |MHROWRED;diagSubMatrix| (|x| $)
  (PROG (#1=#:G200 #2=#:G202 #3=#:G213 |r| #4=#:G212 #5=#:G211 |z| #6=#:G210
         #7=#:G209 #8=#:G208 #9=#:G205 #10=#:G207 #11=#:G206 |a| |l| #12=#:G161
         |u| #13=#:G204 |i| #14=#:G203)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |l|
              (PROGN
               (LETT #14# NIL . #15=(|MHROWRED;diagSubMatrix|))
               (SEQ (LETT |i| 1 . #15#)
                    (LETT #13# (SPADCALL |x| (QREFELT $ 16)) . #15#) G190
                    (COND ((|greater_SI| |i| #13#) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((QEQCAR
                         (LETT |u|
                               (|MHROWRED;non0|
                                (SPADCALL |x| |i| (QREFELT $ 19)) |i| $)
                               . #15#)
                         0)
                        (LETT #14#
                              (CONS
                               (PROG2 (LETT #12# |u| . #15#)
                                   (QCDR #12#)
                                 (|check_union| (QEQCAR #12# 0)
                                                (|Record|
                                                 (|:| |val| (QREFELT $ 6))
                                                 (|:| |cl| (|Integer|))
                                                 (|:| |rw| (|Integer|)))
                                                #12#))
                               #14#)
                              . #15#)))))
                    (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                    (EXIT (NREVERSE #14#))))
              . #15#)
        (SEQ
         (EXIT
          (SEQ (LETT |a| NIL . #15#)
               (LETT #9#
                     (SPADCALL
                      (PROGN
                       (LETT #11# NIL . #15#)
                       (SEQ (LETT |r| NIL . #15#) (LETT #10# |l| . #15#) G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT |r| (CAR #10#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #11# (CONS (QVELT |r| 0) #11#) . #15#)))
                            (LETT #10# (CDR #10#) . #15#) (GO G190) G191
                            (EXIT (NREVERSE #11#))))
                      (QREFELT $ 27))
                     . #15#)
               G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |a| (CAR #9#) . #15#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL
                     (PROGN
                      (LETT #8# NIL . #15#)
                      (SEQ (LETT |r| NIL . #15#) (LETT #7# |l| . #15#) G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |r| (CAR #7#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |r| 0) |a| (QREFELT $ 28))
                               (LETT #8# (CONS (QVELT |r| 1) #8#) . #15#)))))
                           (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                           (EXIT (NREVERSE #8#))))
                     (QREFELT $ 30))
                    (SPADCALL
                     (PROGN
                      (LETT #6# NIL . #15#)
                      (SEQ (LETT |z| 1 . #15#)
                           (LETT #5# (SPADCALL |x| (QREFELT $ 31)) . #15#) G190
                           (COND ((|greater_SI| |z| #5#) (GO G191)))
                           (SEQ (EXIT (LETT #6# (CONS |z| #6#) . #15#)))
                           (LETT |z| (|inc_SI| |z|) . #15#) (GO G190) G191
                           (EXIT (NREVERSE #6#))))
                     (QREFELT $ 30))
                    (QREFELT $ 32))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2#
                                 (CONS 0
                                       (CONS |a|
                                             (|MHROWRED;mkMat| |x|
                                              (PROGN
                                               (LETT #4# NIL . #15#)
                                               (SEQ (LETT |r| NIL . #15#)
                                                    (LETT #3# |l| . #15#) G190
                                                    (COND
                                                     ((OR (ATOM #3#)
                                                          (PROGN
                                                           (LETT |r| (CAR #3#)
                                                                 . #15#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL |a|
                                                                  (QVELT |r| 0)
                                                                  (QREFELT $
                                                                           28))
                                                        (LETT #4#
                                                              (CONS
                                                               (QVELT |r| 2)
                                                               #4#)
                                                              . #15#)))))
                                                    (LETT #3# (CDR #3#) . #15#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #4#))))
                                              $)))
                                 . #15#)
                           (GO #2#))
                          . #15#)
                    (GO #1#))))))
               (LETT #9# (CDR #9#) . #15#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |MHROWRED;determinantOfMinor| (|x| $)
  (PROG (#1=#:G218 #2=#:G221 |j| |d| #3=#:G226 |n| |i| |lr| #4=#:G225 #5=#:G224
         |lc| #6=#:G223 #7=#:G222 |nc| |nr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nr| (ANROWS |x|) . #8=(|MHROWRED;determinantOfMinor|))
            (LETT |nc| (ANCOLS |x|) . #8#)
            (EXIT
             (COND ((SPADCALL |nr| |nc| (QREFELT $ 33)) (|spadConstant| $ 7))
                   ('T
                    (SEQ
                     (LETT |lc|
                           (PROGN
                            (LETT #7# NIL . #8#)
                            (SEQ (LETT |i| 1 . #8#)
                                 (LETT #6# (SPADCALL |x| (QREFELT $ 31)) . #8#)
                                 G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
                                 (SEQ (EXIT (LETT #7# (CONS |i| #7#) . #8#)))
                                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                                 (EXIT (NREVERSE #7#))))
                           . #8#)
                     (LETT |lr|
                           (PROGN
                            (LETT #5# NIL . #8#)
                            (SEQ (LETT |i| 1 . #8#)
                                 (LETT #4# (SPADCALL |x| (QREFELT $ 16)) . #8#)
                                 G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                                 (SEQ (EXIT (LETT #5# (CONS |i| #5#) . #8#)))
                                 (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                                 (EXIT (NREVERSE #5#))))
                           . #8#)
                     (SEQ
                      (EXIT
                       (SEQ (LETT |i| 1 . #8#)
                            (LETT #3#
                                  (LETT |n| (SPADCALL |nr| |nc| (QREFELT $ 34))
                                        . #8#)
                                  . #8#)
                            G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (LETT |d|
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (|MHROWRED;enumerateBinomial|
                                                   |lr| |nc| |i| $)
                                                  |lc| (QREFELT $ 35))
                                        (QREFELT $ 36))
                                       . #8#)
                                 (|spadConstant| $ 7) (QREFELT $ 9))
                                (PROGN
                                 (LETT #1#
                                       (SEQ
                                        (LETT |j|
                                              (+ (+ |i| 1)
                                                 (RANDOM (- |n| |i|)))
                                              . #8#)
                                        (EXIT
                                         (PROGN
                                          (LETT #2#
                                                (SPADCALL |d|
                                                          (SPADCALL
                                                           (SPADCALL |x|
                                                                     (|MHROWRED;enumerateBinomial|
                                                                      |lr| |nc|
                                                                      |j| $)
                                                                     |lc|
                                                                     (QREFELT $
                                                                              35))
                                                           (QREFELT $ 36))
                                                          (QREFELT $ 37))
                                                . #8#)
                                          (GO #2#))))
                                       . #8#)
                                 (GO #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                            (EXIT NIL)))
                      #1# (EXIT #1#))
                     (EXIT (|spadConstant| $ 7))))))))
      #2# (EXIT #2#))))) 

(DEFUN |MHROWRED;enumerateBinomial| (|l| |m| |i| $)
  (PROG (#1=#:G231 |b| #2=#:G232 |n| |j| |m1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |m1| (- (SPADCALL |l| (QREFELT $ 38)) 1)
              . #3=(|MHROWRED;enumerateBinomial|))
        (EXIT
         (COND
          ((ZEROP (LETT |m| (- |m| 1) . #3#))
           (LIST (SPADCALL |l| (+ |m1| |i|) (QREFELT $ 39))))
          ('T
           (SEQ
            (SEQ (LETT |j| 1 . #3#)
                 (LETT #2# (LETT |n| (LENGTH |l|) . #3#) . #3#) G190
                 (COND ((|greater_SI| |j| #2#) (GO G191)))
                 (SEQ
                  (LETT |b| (SPADCALL (- |n| |j|) |m| (QREFELT $ 34)) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |i| |b| (QREFELT $ 40))
                     (PROGN
                      (LETT #1#
                            (CONS (SPADCALL |l| (+ |m1| |j|) (QREFELT $ 39))
                                  (|MHROWRED;enumerateBinomial|
                                   (SPADCALL |l| |j| (QREFELT $ 41)) |m| |i|
                                   $))
                            . #3#)
                      (GO #1#)))
                    ('T (LETT |i| (- |i| |b|) . #3#)))))
                 (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "Should not happen"))))))))
      #1# (EXIT #1#))))) 

(DEFUN |MHROWRED;rowEch;2M;7| (|x| $)
  (PROG (|d| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|MHROWRED;diagSubMatrix| |x| $) . #1=(|MHROWRED;rowEch;2M;7|))
      (EXIT
       (COND
        ((QEQCAR |u| 1)
         (COND
          ((SPADCALL (LETT |d| (|MHROWRED;determinantOfMinor| |x| $) . #1#)
                     (QREFELT $ 42))
           (SPADCALL |x| (QREFELT $ 43)))
          (#2='T (SPADCALL |x| |d| (QREFELT $ 44)))))
        (#2#
         (SPADCALL (QCDR (QCDR |u|)) (QCAR (QCDR |u|)) (QREFELT $ 44))))))))) 

(DEFUN |MHROWRED;vconc| (|y| |m| $)
  (PROG ()
    (RETURN
     (SPADCALL (SPADCALL (MAKEARR1 (ANCOLS |y|) |m|) (QREFELT $ 46))
               (SPADCALL (CONS #'|MHROWRED;vconc!0| (VECTOR $ |m|)) |y|
                         (QREFELT $ 49))
               (QREFELT $ 50))))) 

(DEFUN |MHROWRED;vconc!0| (|s| $$)
  (PROG (|m| $)
    (LETT |m| (QREFELT $$ 1) . #1=(|MHROWRED;vconc|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |m| (QREFELT $ 47)))))) 

(DEFUN |MHROWRED;order| (|m| |p| $)
  (PROG (#1=#:G248 |mm| |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |m| (QREFELT $ 42)) -1)
             ('T
              (SEQ (LETT |i| 0 . #2=(|MHROWRED;order|)) G190 NIL
                   (SEQ (LETT |mm| (SPADCALL |m| |p| (QREFELT $ 52)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |mm| 1)
                           (PROGN (LETT #1# |i| . #2#) (GO #1#)))
                          ('T (LETT |m| (QCDR |mm|) . #2#)))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                   (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |MHROWRED;normalizedDivide;2RR;10| (|n| |d| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr| (SPADCALL |n| |d| (QREFELT $ 54))
            |MHROWRED;normalizedDivide;2RR;10|)
      (EXIT
       (COND ((SPADCALL (QCDR |qr|) (|spadConstant| $ 7) (QREFELT $ 55)) |qr|)
             ((SPADCALL |d| (|spadConstant| $ 7) (QREFELT $ 56))
              (SEQ
               (PROGN
                (RPLACD |qr| (SPADCALL (QCDR |qr|) |d| (QREFELT $ 57)))
                (QCDR |qr|))
               (PROGN
                (RPLACA |qr|
                        (SPADCALL (QCAR |qr|) (|spadConstant| $ 22)
                                  (QREFELT $ 58)))
                (QCAR |qr|))
               (EXIT |qr|)))
             ('T
              (SEQ
               (PROGN
                (RPLACD |qr| (SPADCALL (QCDR |qr|) |d| (QREFELT $ 58)))
                (QCDR |qr|))
               (PROGN
                (RPLACA |qr|
                        (SPADCALL (QCAR |qr|) (|spadConstant| $ 22)
                                  (QREFELT $ 57)))
                (QCAR |qr|))
               (EXIT |qr|))))))))) 

(DEFUN |MHROWRED;normalizedDivide;2RR;11| (|n| |d| $)
  (SPADCALL |n| |d| (QREFELT $ 54))) 

(DEFUN |MHROWRED;rowEchLocal;MRM;12| (|x| |p| $)
  (PROG (|d| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|MHROWRED;diagSubMatrix| |x| $)
            . #1=(|MHROWRED;rowEchLocal;MRM;12|))
      (EXIT
       (COND
        ((QEQCAR |u| 1)
         (COND
          ((SPADCALL (LETT |d| (|MHROWRED;determinantOfMinor| |x| $) . #1#)
                     (QREFELT $ 42))
           (SPADCALL |x| (QREFELT $ 43)))
          (#2='T (SPADCALL |x| |d| |p| (QREFELT $ 61)))))
        (#2#
         (SPADCALL (QCDR (QCDR |u|)) (QCAR (QCDR |u|)) |p|
                   (QREFELT $ 61))))))))) 

(DEFUN |MHROWRED;rowEchelonLocal;M2RM;13| (|y| |m| |p| $)
  (PROG (|i| #1=#:G292 |k1| |qr| #2=#:G291 |k| |v2| |q| #3=#:G274 |pivot| |d|
         |b| |a| |#G79| |x| #4=#:G268 |pivord| |rown| |npivord| #5=#:G288 |j|
         |minr| |ncols| |nrows| #6=#:G265)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL |p|
                      (PROG1
                          (LETT #6# (|MHROWRED;order| |m| |p| $)
                                . #7=(|MHROWRED;rowEchelonLocal;M2RM;13|))
                        (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                         #6#))
                      (QREFELT $ 63))
            . #7#)
      (LETT |x| (|MHROWRED;vconc| |y| |m| $) . #7#)
      (LETT |nrows| (SPADCALL |x| (QREFELT $ 16)) . #7#)
      (LETT |ncols| (SPADCALL |x| (QREFELT $ 31)) . #7#)
      (LETT |minr| (LETT |i| 1 . #7#) . #7#)
      (SEQ
       (EXIT
        (SEQ (LETT |j| 1 . #7#) G190
             (COND ((|greater_SI| |j| |ncols|) (GO G191)))
             (SEQ
              (COND
               ((SPADCALL |i| |nrows| (QREFELT $ 64))
                (PROGN (LETT #5# |$NoValue| . #7#) (GO #5#))))
              (LETT |rown| (- |minr| 1) . #7#)
              (SEQ (LETT |k| |i| . #7#) G190 (COND ((> |k| |nrows|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF2O |x| |k| |j| 1 1) (|spadConstant| $ 7)
                                 (QREFELT $ 28))
                       "next k")
                      ('T
                       (SEQ
                        (EXIT
                         (SEQ
                          (LETT |npivord|
                                (|MHROWRED;order| (QAREF2O |x| |k| |j| 1 1) |p|
                                 $)
                                . #7#)
                          (EXIT
                           (COND
                            ((OR (EQL |rown| (- |minr| 1))
                                 (< |npivord| |pivord|))
                             (PROGN
                              (LETT #4#
                                    (SEQ (LETT |rown| |k| . #7#)
                                         (EXIT
                                          (LETT |pivord| |npivord| . #7#)))
                                    . #7#)
                              (GO #4#)))))))
                        #4# (EXIT #4#))))))
                   (LETT |k| (+ |k| 1) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |rown| (- |minr| 1)) "enuf")
                     ('T
                      (SEQ
                       (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT $ 65))
                             . #7#)
                       (PROGN
                        (LETT |#G79|
                              (SPADCALL (QAREF2O |x| |i| |j| 1 1) |m|
                                        (QREFELT $ 67))
                              . #7#)
                        (LETT |a| (QVELT |#G79| 0) . #7#)
                        (LETT |b| (QVELT |#G79| 1) . #7#)
                        (LETT |d| (QVELT |#G79| 2) . #7#)
                        |#G79|)
                       (QSETAREF2O |x| |i| |j| |d| 1 1)
                       (LETT |pivot| |d| . #7#)
                       (SEQ (LETT |k| (+ |j| 1) . #7#) G190
                            (COND ((> |k| |ncols|) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |x| |i| |k|
                                          (SPADCALL
                                           (SPADCALL |a|
                                                     (QAREF2O |x| |i| |k| 1 1)
                                                     (QREFELT $ 68))
                                           |m| (QREFELT $ 47))
                                          1 1)))
                            (LETT |k| (+ |k| 1) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |k| (+ |i| 1) . #7#) G190
                            (COND ((> |k| |nrows|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                          (QREFELT $ 42))
                                "next k")
                               ('T
                                (SEQ
                                 (LETT |q|
                                       (PROG2
                                           (LETT #3#
                                                 (SPADCALL
                                                  (QAREF2O |x| |k| |j| 1 1)
                                                  |pivot| (QREFELT $ 52))
                                                 . #7#)
                                           (QCDR #3#)
                                         (|check_union| (QEQCAR #3# 0)
                                                        (QREFELT $ 6) #3#))
                                       . #7#)
                                 (SEQ (LETT |k1| (+ |j| 1) . #7#) G190
                                      (COND ((> |k1| |ncols|) (GO G191)))
                                      (SEQ
                                       (LETT |v2|
                                             (SPADCALL
                                              (SPADCALL
                                               (QAREF2O |x| |k| |k1| 1 1)
                                               (SPADCALL |q|
                                                         (QAREF2O |x| |i| |k1|
                                                                  1 1)
                                                         (QREFELT $ 68))
                                               (QREFELT $ 58))
                                              |m| (QREFELT $ 47))
                                             . #7#)
                                       (EXIT
                                        (QSETAREF2O |x| |k| |k1| |v2| 1 1)))
                                      (LETT |k1| (+ |k1| 1) . #7#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT
                                  (QSETAREF2O |x| |k| |j| (|spadConstant| $ 7)
                                              1 1)))))))
                            (LETT |k| (+ |k| 1) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT |k| |minr| . #7#) (LETT #2# (- |i| 1) . #7#)
                            G190 (COND ((> |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                          (QREFELT $ 42))
                                "enuf")
                               ('T
                                (SEQ
                                 (LETT |qr|
                                       (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                 |pivot| (QREFELT $ 60))
                                       . #7#)
                                 (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1 1)
                                 (EXIT
                                  (SEQ (LETT |k1| (+ |j| 1) . #7#)
                                       (LETT #1# (ANCOLS |x|) . #7#) G190
                                       (COND ((> |k1| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF2O |x| |k| |k1|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (QAREF2O |x| |k| |k1| 1
                                                                1)
                                                       (SPADCALL (QCAR |qr|)
                                                                 (QAREF2O |x|
                                                                          |i|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT $
                                                                          68))
                                                       (QREFELT $ 58))
                                                      |m| (QREFELT $ 47))
                                                     1 1)))
                                       (LETT |k1| (+ |k1| 1) . #7#) (GO G190)
                                       G191 (EXIT NIL))))))))
                            (LETT |k| (+ |k| 1) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #7#)))))))
             (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL)))
       #5# (EXIT #5#))
      (EXIT |x|))))) 

(DEFUN |MHROWRED;rowEchelon;MRM;14| (|y| |m| $)
  (SPADCALL (|MHROWRED;vconc| |y| |m| $) (QREFELT $ 43))) 

(DEFUN |MHROWRED;rowEchelon;MRM;15| (|y| |m| $)
  (PROG (|i| #1=#:G321 |k1| |qr| #2=#:G320 |k| |xij| |jj| |un| |v2| |v1| |a1|
         |b1| |#G94| #3=#:G300 |#G93| |d| |b| |a| |#G92| |x| |rown| #4=#:G317
         |j| |minr| |ncols| |nrows|)
    (RETURN
     (SEQ
      (LETT |x| (|MHROWRED;vconc| |y| |m| $)
            . #5=(|MHROWRED;rowEchelon;MRM;15|))
      (LETT |nrows| (SPADCALL |x| (QREFELT $ 16)) . #5#)
      (LETT |ncols| (SPADCALL |x| (QREFELT $ 31)) . #5#)
      (LETT |minr| (LETT |i| 1 . #5#) . #5#)
      (SEQ
       (EXIT
        (SEQ (LETT |j| 1 . #5#) G190
             (COND ((|greater_SI| |j| |ncols|) (GO G191)))
             (SEQ
              (COND
               ((SPADCALL |i| |nrows| (QREFELT $ 64))
                (PROGN (LETT #4# |$NoValue| . #5#) (GO #4#))))
              (LETT |rown| (- |minr| 1) . #5#)
              (SEQ (LETT |k| |i| . #5#) G190 (COND ((> |k| |nrows|) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF2O |x| |k| |j| 1 1) (|spadConstant| $ 7)
                                 (QREFELT $ 9))
                       (COND
                        ((OR (EQL |rown| (- |minr| 1))
                             (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                       (QAREF2O |x| |rown| |j| 1 1)
                                       (QREFELT $ 69)))
                         (LETT |rown| |k| . #5#)))))))
                   (LETT |k| (+ |k| 1) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |rown| (- |minr| 1)) "next j")
                     ('T
                      (SEQ
                       (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT $ 65))
                             . #5#)
                       (SEQ (LETT |k| (+ |i| 1) . #5#) G190
                            (COND ((> |k| |nrows|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                          (QREFELT $ 42))
                                "next k")
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G92|
                                        (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                                  (QAREF2O |x| |k| |j| 1 1)
                                                  (QREFELT $ 67))
                                        . #5#)
                                  (LETT |a| (QVELT |#G92| 0) . #5#)
                                  (LETT |b| (QVELT |#G92| 1) . #5#)
                                  (LETT |d| (QVELT |#G92| 2) . #5#)
                                  |#G92|)
                                 (PROGN
                                  (LETT |#G93|
                                        (PROG2
                                            (LETT #3#
                                                  (SPADCALL
                                                   (QAREF2O |x| |i| |j| 1 1)
                                                   |d| (QREFELT $ 52))
                                                  . #5#)
                                            (QCDR #3#)
                                          (|check_union| (QEQCAR #3# 0)
                                                         (QREFELT $ 6) #3#))
                                        . #5#)
                                  (LETT |#G94|
                                        (PROG2
                                            (LETT #3#
                                                  (SPADCALL
                                                   (QAREF2O |x| |k| |j| 1 1)
                                                   |d| (QREFELT $ 52))
                                                  . #5#)
                                            (QCDR #3#)
                                          (|check_union| (QEQCAR #3# 0)
                                                         (QREFELT $ 6) #3#))
                                        . #5#)
                                  (LETT |b1| |#G93| . #5#)
                                  (LETT |a1| |#G94| . #5#))
                                 (SEQ (LETT |k1| (+ |j| 1) . #5#) G190
                                      (COND ((> |k1| |ncols|) (GO G191)))
                                      (SEQ
                                       (LETT |v1|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |a|
                                                         (QAREF2O |x| |i| |k1|
                                                                  1 1)
                                                         (QREFELT $ 68))
                                               (SPADCALL |b|
                                                         (QAREF2O |x| |k| |k1|
                                                                  1 1)
                                                         (QREFELT $ 68))
                                               (QREFELT $ 57))
                                              |m| (QREFELT $ 47))
                                             . #5#)
                                       (LETT |v2|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |b1|
                                                         (QAREF2O |x| |k| |k1|
                                                                  1 1)
                                                         (QREFELT $ 68))
                                               (SPADCALL |a1|
                                                         (QAREF2O |x| |i| |k1|
                                                                  1 1)
                                                         (QREFELT $ 68))
                                               (QREFELT $ 58))
                                              |m| (QREFELT $ 47))
                                             . #5#)
                                       (QSETAREF2O |x| |i| |k1| |v1| 1 1)
                                       (EXIT
                                        (QSETAREF2O |x| |k| |k1| |v2| 1 1)))
                                      (LETT |k1| (+ |k1| 1) . #5#) (GO G190)
                                      G191 (EXIT NIL))
                                 (QSETAREF2O |x| |i| |j| |d| 1 1)
                                 (EXIT
                                  (QSETAREF2O |x| |k| |j| (|spadConstant| $ 7)
                                              1 1)))))))
                            (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |un|
                             (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                       (QREFELT $ 71))
                             . #5#)
                       (QSETAREF2O |x| |i| |j| (QVELT |un| 1) 1 1)
                       (COND
                        ((SPADCALL (QVELT |un| 2) (|spadConstant| $ 22)
                                   (QREFELT $ 9))
                         (SEQ (LETT |jj| (+ |j| 1) . #5#) G190
                              (COND ((> |jj| |ncols|) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF2O |x| |i| |jj|
                                            (SPADCALL (QVELT |un| 2)
                                                      (QAREF2O |x| |i| |jj| 1
                                                               1)
                                                      (QREFELT $ 68))
                                            1 1)))
                              (LETT |jj| (+ |jj| 1) . #5#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT |xij| (QAREF2O |x| |i| |j| 1 1) . #5#)
                       (SEQ (LETT |k| |minr| . #5#) (LETT #2# (- |i| 1) . #5#)
                            G190 (COND ((> |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                          (QREFELT $ 42))
                                "next k")
                               ('T
                                (SEQ
                                 (LETT |qr|
                                       (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                 |xij| (QREFELT $ 60))
                                       . #5#)
                                 (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1 1)
                                 (EXIT
                                  (SEQ (LETT |k1| (+ |j| 1) . #5#)
                                       (LETT #1# (ANCOLS |x|) . #5#) G190
                                       (COND ((> |k1| #1#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF2O |x| |k| |k1|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (QAREF2O |x| |k| |k1| 1
                                                                1)
                                                       (SPADCALL (QCAR |qr|)
                                                                 (QAREF2O |x|
                                                                          |i|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT $
                                                                          68))
                                                       (QREFELT $ 58))
                                                      |m| (QREFELT $ 47))
                                                     1 1)))
                                       (LETT |k1| (+ |k1| 1) . #5#) (GO G190)
                                       G191 (EXIT NIL))))))))
                            (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (LETT |i| (+ |i| 1) . #5#)))))))
             (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL)))
       #4# (EXIT #4#))
      (EXIT |x|))))) 

(DECLAIM (NOTINLINE |ModularHermitianRowReduction;|)) 

(DEFUN |ModularHermitianRowReduction| (#1=#:G322)
  (PROG ()
    (RETURN
     (PROG (#2=#:G323)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|ModularHermitianRowReduction|)
                                           '|domainEqualList|)
                . #3=(|ModularHermitianRowReduction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|ModularHermitianRowReduction;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ModularHermitianRowReduction|))))))))))) 

(DEFUN |ModularHermitianRowReduction;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ModularHermitianRowReduction|))
      (LETT |dv$| (LIST '|ModularHermitianRowReduction| DV$1) . #1#)
      (LETT $ (GETREFV 72) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ModularHermitianRowReduction|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|IntegerNumberSystem|))
        (QSETREFV $ 60
                  (CONS (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;10|)
                        $)))
       ('T
        (QSETREFV $ 60
                  (CONS (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;11|)
                        $))))
      (COND
       ((|HasCategory| |#1| '(|Field|))
        (QSETREFV $ 44
                  (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;14|) $)))
       ('T
        (QSETREFV $ 44
                  (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;15|) $))))
      $)))) 

(MAKEPROP '|ModularHermitianRowReduction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Boolean|)
              (4 . ~=) (|Mapping| 8 6) (|Vector| 6) (10 . |any?|) (|Integer|)
              (16 . |minIndex|) (|Matrix| 6) (21 . |maxRowIndex|) (|List| 13)
              (26 . |member?|) (32 . |row|) (|List| 6) (38 . |parts|)
              (43 . |One|) (|NonNegativeInteger|) (47 . |zero|) (|List| 20)
              (53 . |matrix|) (58 . |removeDuplicates|) (63 . =) (|Set| 13)
              (69 . |set|) (74 . |maxColIndex|) (79 . =) (85 . <=)
              (91 . |binomial|) (97 . |elt|) (104 . |determinant|)
              (109 . |gcd|) (115 . |minIndex|) (120 . |elt|) (126 . <=)
              (132 . |rest|) (138 . |zero?|) (143 . |rowEchelon|)
              (148 . |rowEchelon|) |MHROWRED;rowEch;2M;7|
              (154 . |diagonalMatrix|) (159 . |rem|) (|Mapping| 6 6)
              (165 . |map|) (171 . |vertConcat|) (|Union| $ '"failed")
              (177 . |exquo|) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (183 . |divide|) (189 . >=) (195 . >) (201 . +) (207 . -)
              (|Record| (|:| |quotient| 6) (|:| |remainder| 6))
              (213 . |normalizedDivide|) |MHROWRED;rowEchelonLocal;M2RM;13|
              |MHROWRED;rowEchLocal;MRM;12| (219 . ^) (225 . >)
              (231 . |swapRows!|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (238 . |extendedEuclidean|) (244 . *) (250 . |sizeLess?|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (256 . |unitNormal|))
           '#(|rowEchelonLocal| 261 |rowEchelon| 268 |rowEchLocal| 274 |rowEch|
              280 |normalizedDivide| 285)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(0 6 0 7 2 6 8 0 0 9 2 11 8
                                                   10 0 12 1 11 13 0 14 1 15 13
                                                   0 16 2 17 8 13 0 18 2 15 11
                                                   0 13 19 1 11 20 0 21 0 6 0
                                                   22 2 15 0 23 23 24 1 15 0 25
                                                   26 1 20 0 0 27 2 6 8 0 0 28
                                                   1 29 0 17 30 1 15 13 0 31 2
                                                   29 8 0 0 32 2 23 8 0 0 33 2
                                                   13 0 0 0 34 3 15 0 0 17 17
                                                   35 1 15 6 0 36 2 6 0 0 0 37
                                                   1 17 13 0 38 2 17 13 0 13 39
                                                   2 13 8 0 0 40 2 17 0 0 23 41
                                                   1 6 8 0 42 1 15 0 0 43 2 0
                                                   15 15 6 44 1 15 0 11 46 2 6
                                                   0 0 0 47 2 15 0 48 0 49 2 15
                                                   0 0 0 50 2 6 51 0 0 52 2 6
                                                   53 0 0 54 2 6 8 0 0 55 2 6 8
                                                   0 0 56 2 6 0 0 0 57 2 6 0 0
                                                   0 58 2 0 59 6 6 60 2 6 0 0
                                                   23 63 2 13 8 0 0 64 3 15 0 0
                                                   13 13 65 2 6 66 0 0 67 2 6 0
                                                   0 0 68 2 6 8 0 0 69 1 6 70 0
                                                   71 3 0 15 15 6 6 61 2 0 15
                                                   15 6 44 2 0 15 15 6 62 1 0
                                                   15 15 45 2 0 59 6 6 60)))))
           '|lookupComplete|)) 
