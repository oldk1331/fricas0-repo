
(SDEFUN |MHROWRED;nonzero?| ((|v| |Vector| R) ($ |Boolean|))
        (SPADCALL (CONS #'|MHROWRED;nonzero?!0| $) |v| (QREFELT $ 12))) 

(SDEFUN |MHROWRED;nonzero?!0| ((|s| NIL) ($ NIL))
        (SPADCALL |s| (|spadConstant| $ 7) (QREFELT $ 9))) 

(SDEFUN |MHROWRED;non0|
        ((|v| |Vector| R) (|rown| |Integer|)
         ($ |Union|
          #1=(|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                       (|:| |rw| (|Integer|)))
          "failed"))
        (SPROG
         ((#2=#:G137 NIL) (|ans| #1#) (|allZero| (|Boolean|)) (#3=#:G138 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |allZero| 'T . #4=(|MHROWRED;non0|))
                (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 14)) . #4#)
                     (LETT #3# (QVSIZE |v|) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| $ 7)
                                   (QREFELT $ 9))
                         (COND
                          (|allZero|
                           (SEQ (LETT |allZero| 'NIL . #4#)
                                (EXIT
                                 (LETT |ans|
                                       (VECTOR (QAREF1O |v| |i| 1) |i| |rown|)
                                       . #4#))))
                          ('T
                           (PROGN
                            (LETT #2# (CONS 1 "failed") . #4#)
                            (GO #5=#:G136))))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND (|allZero| (CONS 1 "failed")) ('T (CONS 0 |ans|))))))
          #5# (EXIT #2#)))) 

(SDEFUN |MHROWRED;mkMat|
        ((|x| |Matrix| R) (|l| |List| (|Integer|)) ($ |Matrix| R))
        (SPROG
         ((|ll| (|List| (|List| R))) (#1=#:G156 NIL) (|i| NIL) (#2=#:G155 NIL))
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
           (#4# (SPADCALL |ll| (QREFELT $ 26))))))) 

(SDEFUN |MHROWRED;diagSubMatrix|
        ((|x| |Matrix| R)
         ($ |Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
          "failed"))
        (SPROG
         ((#1=#:G205 NIL) (#2=#:G206 NIL) (#3=#:G217 NIL) (|r| NIL)
          (#4=#:G216 NIL) (#5=#:G215 NIL) (|z| NIL) (#6=#:G214 NIL)
          (#7=#:G213 NIL) (#8=#:G212 NIL) (#9=#:G209 NIL) (#10=#:G211 NIL)
          (#11=#:G210 NIL) (|a| NIL)
          (|l|
           (|List|
            (|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                      (|:| |rw| (|Integer|)))))
          (#12=#:G163 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                      (|:| |rw| (|Integer|)))
            "failed"))
          (#13=#:G208 NIL) (|i| NIL) (#14=#:G207 NIL))
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
                           (SEQ (LETT |r| NIL . #15#) (LETT #10# |l| . #15#)
                                G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN (LETT |r| (CAR #10#) . #15#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11# (CONS (QVELT |r| 0) #11#)
                                        . #15#)))
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
                                   (LETT #8# (CONS (QVELT |r| 1) #8#)
                                         . #15#)))))
                               (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #8#))))
                         (QREFELT $ 30))
                        (SPADCALL
                         (PROGN
                          (LETT #6# NIL . #15#)
                          (SEQ (LETT |z| 1 . #15#)
                               (LETT #5# (SPADCALL |x| (QREFELT $ 31)) . #15#)
                               G190 (COND ((|greater_SI| |z| #5#) (GO G191)))
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
                                                        (LETT #3# |l| . #15#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #3#)
                                                              (PROGN
                                                               (LETT |r|
                                                                     (CAR #3#)
                                                                     . #15#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (COND
                                                           ((SPADCALL |a|
                                                                      (QVELT
                                                                       |r| 0)
                                                                      (QREFELT
                                                                       $ 28))
                                                            (LETT #4#
                                                                  (CONS
                                                                   (QVELT |r|
                                                                          2)
                                                                   #4#)
                                                                  . #15#)))))
                                                        (LETT #3# (CDR #3#)
                                                              . #15#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #4#))))
                                                  $)))
                                     . #15#)
                               (GO #16=#:G204))
                              . #15#)
                        (GO #17=#:G202))))))
                   (LETT #9# (CDR #9#) . #15#) (GO G190) G191 (EXIT NIL)))
             #17# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
          #16# (EXIT #2#)))) 

(SDEFUN |MHROWRED;determinantOfMinor| ((|x| |Matrix| R) ($ R))
        (SPROG
         ((#1=#:G226 NIL) (#2=#:G227 NIL) (|j| (|Integer|)) (|d| (R))
          (#3=#:G232 NIL) (|n| (|Integer|)) (|i| NIL)
          (|lr| (|List| (|Integer|))) (#4=#:G231 NIL) (#5=#:G230 NIL)
          (|lc| (|List| (|Integer|))) (#6=#:G229 NIL) (#7=#:G228 NIL)
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nr| (ANROWS |x|) . #8=(|MHROWRED;determinantOfMinor|))
                (LETT |nc| (ANCOLS |x|) . #8#)
                (EXIT
                 (COND
                  ((SPADCALL |nr| |nc| (QREFELT $ 33)) (|spadConstant| $ 7))
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
                                             (+ (+ |i| 1) (RANDOM (- |n| |i|)))
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
                                         (GO #9=#:G225))))
                                      . #8#)
                                (GO #10=#:G222))))))
                           (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                           (EXIT NIL)))
                     #10# (EXIT #1#))
                    (EXIT (|spadConstant| $ 7))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |MHROWRED;enumerateBinomial|
        ((|l| |List| (|Integer|)) (|m| |Integer|) (|i| |Integer|)
         ($ |List| (|Integer|)))
        (SPROG
         ((#1=#:G238 NIL) (|b| (|Integer|)) (#2=#:G239 NIL) (|n| (|Integer|))
          (|j| NIL) (|m1| (|Integer|)))
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
                      (LETT |b| (SPADCALL (- |n| |j|) |m| (QREFELT $ 34))
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |i| |b| (QREFELT $ 40))
                         (PROGN
                          (LETT #1#
                                (CONS
                                 (SPADCALL |l| (+ |m1| |j|) (QREFELT $ 39))
                                 (|MHROWRED;enumerateBinomial|
                                  (SPADCALL |l| |j| (QREFELT $ 41)) |m| |i| $))
                                . #3#)
                          (GO #4=#:G237)))
                        ('T (LETT |i| (- |i| |b|) . #3#)))))
                     (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (|error| "Should not happen"))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |MHROWRED;rowEch;2M;7| ((|x| |Matrix| R) ($ |Matrix| R))
        (SPROG
         ((|d| (R))
          (|u|
           (|Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
                    "failed")))
         (SEQ
          (LETT |u| (|MHROWRED;diagSubMatrix| |x| $)
                . #1=(|MHROWRED;rowEch;2M;7|))
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (COND
              ((SPADCALL (LETT |d| (|MHROWRED;determinantOfMinor| |x| $) . #1#)
                         (QREFELT $ 42))
               (SPADCALL |x| (QREFELT $ 43)))
              (#2='T (|MHROWRED;rowEchelon1| |x| |d| $))))
            (#2#
             (SPADCALL (QCDR (QCDR |u|)) (QCAR (QCDR |u|)) (QREFELT $ 44)))))))) 

(SDEFUN |MHROWRED;vconc| ((|y| |Matrix| R) (|m| R) ($ |Matrix| R))
        (SPROG NIL
               (SPADCALL (SPADCALL (MAKEARR1 (ANCOLS |y|) |m|) (QREFELT $ 46))
                         (SPADCALL (CONS #'|MHROWRED;vconc!0| (VECTOR $ |m|))
                                   |y| (QREFELT $ 49))
                         (QREFELT $ 50)))) 

(SDEFUN |MHROWRED;vconc!0| ((|s| NIL) ($$ NIL))
        (PROG (|m| $)
          (LETT |m| (QREFELT $$ 1) . #1=(|MHROWRED;vconc|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |m| (QREFELT $ 47)))))) 

(SDEFUN |MHROWRED;order| ((|m| R) (|p| R) ($ |Integer|))
        (SPROG ((#1=#:G256 NIL) (|mm| (|Union| R "failed")) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |m| (QREFELT $ 42)) -1)
                       ('T
                        (SEQ (LETT |i| 0 . #2=(|MHROWRED;order|)) G190 NIL
                             (SEQ
                              (LETT |mm| (SPADCALL |m| |p| (QREFELT $ 52))
                                    . #2#)
                              (EXIT
                               (COND
                                ((QEQCAR |mm| 1)
                                 (PROGN (LETT #1# |i| . #2#) (GO #3=#:G255)))
                                ('T (LETT |m| (QCDR |mm|) . #2#)))))
                             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                             (EXIT NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |MHROWRED;normalizedDivide;2RR;10|
        ((|n| R) (|d| R) ($ |Record| (|:| |quotient| R) (|:| |remainder| R)))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ
                (LETT |qr| (SPADCALL |n| |d| (QREFELT $ 54))
                      |MHROWRED;normalizedDivide;2RR;10|)
                (EXIT
                 (COND
                  ((SPADCALL (QCDR |qr|) (|spadConstant| $ 7) (QREFELT $ 55))
                   |qr|)
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
                    (EXIT |qr|)))))))) 

(SDEFUN |MHROWRED;normalizedDivide;2RR;11|
        ((|n| R) (|d| R) ($ |Record| (|:| |quotient| R) (|:| |remainder| R)))
        (SPADCALL |n| |d| (QREFELT $ 54))) 

(SDEFUN |MHROWRED;rowEchLocal;MRM;12| ((|x| |Matrix| R) (|p| R) ($ |Matrix| R))
        (SPROG
         ((|d| (R))
          (|u|
           (|Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
                    "failed")))
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
                       (QREFELT $ 61)))))))) 

(SDEFUN |MHROWRED;rowEchelonLocal;M2RM;13|
        ((|y| |Matrix| R) (|m| R) (|p| R) ($ |Matrix| R))
        (SPROG
         ((|i| #1=(|Integer|)) (#2=#:G302 NIL) (|k1| NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (#3=#:G301 NIL) (|k| NIL) (|v2| (R)) (|q| (R)) (#4=#:G282 NIL)
          (|pivot| (R)) (|d| (R)) (|b| (R)) (|a| (R))
          (|#G79|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|x| (|Matrix| R)) (#5=#:G299 NIL) (|pivord| #6=(|Integer|))
          (|rown| (|Integer|)) (|npivord| #6#) (#7=#:G300 NIL) (|j| NIL)
          (|minr| #1#) (|ncols| (|Integer|)) (|nrows| (|Integer|))
          (#8=#:G273 NIL))
         (SEQ
          (LETT |m|
                (SPADCALL |p|
                          (PROG1
                              (LETT #8# (|MHROWRED;order| |m| |p| $)
                                    . #9=(|MHROWRED;rowEchelonLocal;M2RM;13|))
                            (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|)
                                             #8#))
                          (QREFELT $ 63))
                . #9#)
          (LETT |x| (|MHROWRED;vconc| |y| |m| $) . #9#)
          (LETT |nrows| (SPADCALL |x| (QREFELT $ 16)) . #9#)
          (LETT |ncols| (SPADCALL |x| (QREFELT $ 31)) . #9#)
          (LETT |minr| (LETT |i| 1 . #9#) . #9#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 1 . #9#) G190
                 (COND ((|greater_SI| |j| |ncols|) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |i| |nrows| (QREFELT $ 64))
                    (PROGN (LETT #7# |$NoValue| . #9#) (GO #10=#:G296))))
                  (LETT |rown| (- |minr| 1) . #9#)
                  (SEQ (LETT |k| |i| . #9#) G190
                       (COND ((> |k| |nrows|) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                     (|spadConstant| $ 7) (QREFELT $ 28))
                           "next k")
                          ('T
                           (SEQ
                            (EXIT
                             (SEQ
                              (LETT |npivord|
                                    (|MHROWRED;order| (QAREF2O |x| |k| |j| 1 1)
                                     |p| $)
                                    . #9#)
                              (EXIT
                               (COND
                                ((OR (EQL |rown| (- |minr| 1))
                                     (< |npivord| |pivord|))
                                 (PROGN
                                  (LETT #5#
                                        (SEQ (LETT |rown| |k| . #9#)
                                             (EXIT
                                              (LETT |pivord| |npivord| . #9#)))
                                        . #9#)
                                  (GO #11=#:G276)))))))
                            #11# (EXIT #5#))))))
                       (LETT |k| (+ |k| 1) . #9#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |rown| (- |minr| 1)) "enuf")
                         ('T
                          (SEQ
                           (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT $ 65))
                                 . #9#)
                           (PROGN
                            (LETT |#G79|
                                  (SPADCALL (QAREF2O |x| |i| |j| 1 1) |m|
                                            (QREFELT $ 67))
                                  . #9#)
                            (LETT |a| (QVELT |#G79| 0) . #9#)
                            (LETT |b| (QVELT |#G79| 1) . #9#)
                            (LETT |d| (QVELT |#G79| 2) . #9#)
                            |#G79|)
                           (QSETAREF2O |x| |i| |j| |d| 1 1)
                           (LETT |pivot| |d| . #9#)
                           (SEQ (LETT |k| (+ |j| 1) . #9#) G190
                                (COND ((> |k| |ncols|) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |x| |i| |k|
                                              (SPADCALL
                                               (SPADCALL |a|
                                                         (QAREF2O |x| |i| |k| 1
                                                                  1)
                                                         (QREFELT $ 68))
                                               |m| (QREFELT $ 47))
                                              1 1)))
                                (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (SEQ (LETT |k| (+ |i| 1) . #9#) G190
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
                                               (LETT #4#
                                                     (SPADCALL
                                                      (QAREF2O |x| |k| |j| 1 1)
                                                      |pivot| (QREFELT $ 52))
                                                     . #9#)
                                               (QCDR #4#)
                                             (|check_union| (QEQCAR #4# 0)
                                                            (QREFELT $ 6) #4#))
                                           . #9#)
                                     (SEQ (LETT |k1| (+ |j| 1) . #9#) G190
                                          (COND ((> |k1| |ncols|) (GO G191)))
                                          (SEQ
                                           (LETT |v2|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (QAREF2O |x| |k| |k1| 1 1)
                                                   (SPADCALL |q|
                                                             (QAREF2O |x| |i|
                                                                      |k1| 1 1)
                                                             (QREFELT $ 68))
                                                   (QREFELT $ 58))
                                                  |m| (QREFELT $ 47))
                                                 . #9#)
                                           (EXIT
                                            (QSETAREF2O |x| |k| |k1| |v2| 1
                                                        1)))
                                          (LETT |k1| (+ |k1| 1) . #9#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (QSETAREF2O |x| |k| |j|
                                                  (|spadConstant| $ 7) 1
                                                  1)))))))
                                (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (SEQ (LETT |k| |minr| . #9#)
                                (LETT #3# (- |i| 1) . #9#) G190
                                (COND ((> |k| #3#) (GO G191)))
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
                                           . #9#)
                                     (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1 1)
                                     (EXIT
                                      (SEQ (LETT |k1| (+ |j| 1) . #9#)
                                           (LETT #2# (ANCOLS |x|) . #9#) G190
                                           (COND ((> |k1| #2#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |k1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (QAREF2O |x| |k|
                                                                    |k1| 1 1)
                                                           (SPADCALL
                                                            (QCAR |qr|)
                                                            (QAREF2O |x| |i|
                                                                     |k1| 1 1)
                                                            (QREFELT $ 68))
                                                           (QREFELT $ 58))
                                                          |m| (QREFELT $ 47))
                                                         1 1)))
                                           (LETT |k1| (+ |k1| 1) . #9#)
                                           (GO G190) G191 (EXIT NIL))))))))
                                (LETT |k| (+ |k| 1) . #9#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #9#)))))))
                 (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #7#))
          (EXIT |x|)))) 

(SDEFUN |MHROWRED;rowEchelon;MRM;14| ((|y| |Matrix| R) (|m| R) ($ |Matrix| R))
        (|MHROWRED;rowEchelon1| |y| |m| $)) 

(SDEFUN |MHROWRED;rowEchelon1| ((|y| |Matrix| R) (|m| R) ($ |Matrix| R))
        (SPADCALL (|MHROWRED;vconc| |y| |m| $) (QREFELT $ 43))) 

(SDEFUN |MHROWRED;rowEchelon;MRM;16| ((|y| |Matrix| R) (|m| R) ($ |Matrix| R))
        (SPROG
         ((|m1| (R)) (|d| (R)) (|nc| (|NonNegativeInteger|))
          (|nr| (|NonNegativeInteger|)))
         (SEQ (LETT |nr| (ANROWS |y|) . #1=(|MHROWRED;rowEchelon;MRM;16|))
              (LETT |nc| (ANCOLS |y|) . #1#)
              (EXIT
               (COND
                ((EQL |nr| |nc|)
                 (SEQ (LETT |d| (SPADCALL |y| (QREFELT $ 36)) . #1#)
                      (LETT |m1| (SPADCALL |d| |m| (QREFELT $ 37)) . #1#)
                      (EXIT (|MHROWRED;rowEchelon1| |y| |m1| $))))
                ('T (|MHROWRED;rowEchelon1| |y| |m| $))))))) 

(SDEFUN |MHROWRED;rowEchelon1| ((|y| |Matrix| R) (|m| R) ($ |Matrix| R))
        (SPROG
         ((|i| #1=(|Integer|)) (#2=#:G336 NIL) (|k1| NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R)))
          (#3=#:G335 NIL) (|k| NIL) (|xij| (R)) (|jj| NIL)
          (|un|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|v2| (R)) (|v1| (R)) (|a1| (R)) (|b1| (R)) (|#G98| (R))
          (#4=#:G314 NIL) (|#G97| (R)) (|d| (R)) (|b| (R)) (|a| (R))
          (|#G96|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|x| (|Matrix| R)) (|rown| (|Integer|)) (#5=#:G334 NIL) (|j| NIL)
          (|minr| #1#) (|ncols| (|Integer|)) (|nrows| (|Integer|)))
         (SEQ
          (LETT |x| (|MHROWRED;vconc| |y| |m| $) . #6=(|MHROWRED;rowEchelon1|))
          (LETT |nrows| (SPADCALL |x| (QREFELT $ 16)) . #6#)
          (LETT |ncols| (SPADCALL |x| (QREFELT $ 31)) . #6#)
          (LETT |minr| (LETT |i| 1 . #6#) . #6#)
          (SEQ
           (EXIT
            (SEQ (LETT |j| 1 . #6#) G190
                 (COND ((|greater_SI| |j| |ncols|) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |i| |nrows| (QREFELT $ 64))
                    (PROGN (LETT #5# |$NoValue| . #6#) (GO #7=#:G331))))
                  (LETT |rown| (- |minr| 1) . #6#)
                  (SEQ (LETT |k| |i| . #6#) G190
                       (COND ((> |k| |nrows|) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                     (|spadConstant| $ 7) (QREFELT $ 9))
                           (COND
                            ((OR (EQL |rown| (- |minr| 1))
                                 (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                           (QAREF2O |x| |rown| |j| 1 1)
                                           (QREFELT $ 69)))
                             (LETT |rown| |k| . #6#)))))))
                       (LETT |k| (+ |k| 1) . #6#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |rown| (- |minr| 1)) "next j")
                         ('T
                          (SEQ
                           (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT $ 65))
                                 . #6#)
                           (SEQ (LETT |k| (+ |i| 1) . #6#) G190
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
                                      (LETT |#G96|
                                            (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                                      (QAREF2O |x| |k| |j| 1 1)
                                                      (QREFELT $ 67))
                                            . #6#)
                                      (LETT |a| (QVELT |#G96| 0) . #6#)
                                      (LETT |b| (QVELT |#G96| 1) . #6#)
                                      (LETT |d| (QVELT |#G96| 2) . #6#)
                                      |#G96|)
                                     (PROGN
                                      (LETT |#G97|
                                            (PROG2
                                                (LETT #4#
                                                      (SPADCALL
                                                       (QAREF2O |x| |i| |j| 1
                                                                1)
                                                       |d| (QREFELT $ 52))
                                                      . #6#)
                                                (QCDR #4#)
                                              (|check_union| (QEQCAR #4# 0)
                                                             (QREFELT $ 6)
                                                             #4#))
                                            . #6#)
                                      (LETT |#G98|
                                            (PROG2
                                                (LETT #4#
                                                      (SPADCALL
                                                       (QAREF2O |x| |k| |j| 1
                                                                1)
                                                       |d| (QREFELT $ 52))
                                                      . #6#)
                                                (QCDR #4#)
                                              (|check_union| (QEQCAR #4# 0)
                                                             (QREFELT $ 6)
                                                             #4#))
                                            . #6#)
                                      (LETT |b1| |#G97| . #6#)
                                      (LETT |a1| |#G98| . #6#))
                                     (SEQ (LETT |k1| (+ |j| 1) . #6#) G190
                                          (COND ((> |k1| |ncols|) (GO G191)))
                                          (SEQ
                                           (LETT |v1|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |a|
                                                             (QAREF2O |x| |i|
                                                                      |k1| 1 1)
                                                             (QREFELT $ 68))
                                                   (SPADCALL |b|
                                                             (QAREF2O |x| |k|
                                                                      |k1| 1 1)
                                                             (QREFELT $ 68))
                                                   (QREFELT $ 57))
                                                  |m| (QREFELT $ 47))
                                                 . #6#)
                                           (LETT |v2|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |b1|
                                                             (QAREF2O |x| |k|
                                                                      |k1| 1 1)
                                                             (QREFELT $ 68))
                                                   (SPADCALL |a1|
                                                             (QAREF2O |x| |i|
                                                                      |k1| 1 1)
                                                             (QREFELT $ 68))
                                                   (QREFELT $ 58))
                                                  |m| (QREFELT $ 47))
                                                 . #6#)
                                           (QSETAREF2O |x| |i| |k1| |v1| 1 1)
                                           (EXIT
                                            (QSETAREF2O |x| |k| |k1| |v2| 1
                                                        1)))
                                          (LETT |k1| (+ |k1| 1) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (QSETAREF2O |x| |i| |j| |d| 1 1)
                                     (EXIT
                                      (QSETAREF2O |x| |k| |j|
                                                  (|spadConstant| $ 7) 1
                                                  1)))))))
                                (LETT |k| (+ |k| 1) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |un|
                                 (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                           (QREFELT $ 71))
                                 . #6#)
                           (QSETAREF2O |x| |i| |j| (QVELT |un| 1) 1 1)
                           (COND
                            ((SPADCALL (QVELT |un| 2) (|spadConstant| $ 22)
                                       (QREFELT $ 9))
                             (SEQ (LETT |jj| (+ |j| 1) . #6#) G190
                                  (COND ((> |jj| |ncols|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETAREF2O |x| |i| |jj|
                                                (SPADCALL (QVELT |un| 2)
                                                          (QAREF2O |x| |i| |jj|
                                                                   1 1)
                                                          (QREFELT $ 68))
                                                1 1)))
                                  (LETT |jj| (+ |jj| 1) . #6#) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |xij| (QAREF2O |x| |i| |j| 1 1) . #6#)
                           (SEQ (LETT |k| |minr| . #6#)
                                (LETT #3# (- |i| 1) . #6#) G190
                                (COND ((> |k| #3#) (GO G191)))
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
                                           . #6#)
                                     (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1 1)
                                     (EXIT
                                      (SEQ (LETT |k1| (+ |j| 1) . #6#)
                                           (LETT #2# (ANCOLS |x|) . #6#) G190
                                           (COND ((> |k1| #2#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |k1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (QAREF2O |x| |k|
                                                                    |k1| 1 1)
                                                           (SPADCALL
                                                            (QCAR |qr|)
                                                            (QAREF2O |x| |i|
                                                                     |k1| 1 1)
                                                            (QREFELT $ 68))
                                                           (QREFELT $ 58))
                                                          |m| (QREFELT $ 47))
                                                         1 1)))
                                           (LETT |k1| (+ |k1| 1) . #6#)
                                           (GO G190) G191 (EXIT NIL))))))))
                                (LETT |k| (+ |k| 1) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1) . #6#)))))))
                 (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL)))
           #7# (EXIT #5#))
          (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ModularHermitianRowReduction;|)) 

(DEFUN |ModularHermitianRowReduction| (#1=#:G337)
  (SPROG NIL
         (PROG (#2=#:G338)
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
                  (PROG1 (|ModularHermitianRowReduction;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularHermitianRowReduction|)))))))))) 

(DEFUN |ModularHermitianRowReduction;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
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
                      (CONS
                       (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;10|)
                       $)))
           ('T
            (QSETREFV $ 60
                      (CONS
                       (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;11|)
                       $))))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV $ 44
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;14|)
                             $))))
           ('T
            (PROGN
             (QSETREFV $ 44
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;16|)
                             $)))))
          $))) 

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
