
(SDEFUN |OREMAT;rowEchelon;2M;1| ((|m| |Matrix| LO) ($ |Matrix| LO))
        (QCAR (SPADCALL |m| (|spadConstant| $ 8) NIL (QREFELT $ 13)))) 

(SDEFUN |OREMAT;rowEchelon;MFLR;2|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         ($ |Record| (|:| |mat| (|Matrix| LO))
          (|:| |vecs| (|List| (|Vector| F)))))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G156 NIL) (|w| NIL) (#2=#:G155 NIL)
          (|k1| NIL) (|r| (LO)) (|q| (LO))
          (|#G18| (|Record| (|:| |quotient| LO) (|:| |remainder| LO)))
          (|mkj| (LO)) (#3=#:G154 NIL) (|k| NIL) (|elf2| (F)) (|elf1| (F))
          (#4=#:G153 NIL) (|el2| (LO)) (|el1| (LO)) (#5=#:G152 NIL) (|v| (LO))
          (|u| (LO)) (|d| (LO)) (|c| (LO)) (|mij| (LO))
          (|#G14|
           (|Record| (|:| |generator| LO) (|:| |coef1| LO) (|:| |coef2| LO)
                     (|:| |coefu| LO) (|:| |coefv| LO)))
          (#6=#:G151 NIL) (#7=#:G150 NIL) (|mm| (|Matrix| LO))
          (|dpiv| (|Integer|)) (|pivk| (|Integer|))
          (|dp1| (|NonNegativeInteger|)) (#8=#:G149 NIL) (#9=#:G144 NIL)
          (#10=#:G148 NIL) (|j| NIL) (#11=#:G147 NIL)
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (|lw| (|List| (|Vector| F))) (#12=#:G146 NIL) (|vv| NIL)
          (#13=#:G145 NIL))
         (SEQ (LETT |mm| (SPADCALL |m| (QREFELT $ 15)))
              (LETT |lw|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #12# |lv|) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |vv| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |vv| (QREFELT $ 17)) #13#))))
                          (LETT #12# (CDR #12#)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (LETT |nc| (ANCOLS |mm|)) (LETT |nr| (ANROWS |mm|))
              (SEQ (LETT |w| NIL) (LETT #11# |lw|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |w| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVSIZE |w|) |nc| (QREFELT $ 20))
                       (|error|
                        "rowEchelon: elements of lv must have size = ncols(m)")))))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (LETT |i| 1)
              (SEQ
               (EXIT
                (SEQ (LETT |j| 1) (LETT #10# |nc|) G190
                     (COND ((|greater_SI| |j| #10#) (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL |i| |nr| (QREFELT $ 22))
                        (PROGN (LETT #9# |$NoValue|) (GO #14=#:G141))))
                      (LETT |pivk| -1) (LETT |dpiv| -1)
                      (SEQ (LETT |k| |i|) (LETT #8# |nr|) G190
                           (COND ((> |k| #8#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL
                                 (LETT |mkj|
                                       (SPADCALL |mm| |k| |j| (QREFELT $ 25)))
                                 (QREFELT $ 26)))
                               (SEQ
                                (LETT |dp1| (SPADCALL |mkj| (QREFELT $ 27)))
                                (EXIT
                                 (COND
                                  ((OR (EQL |dpiv| -1) (< |dp1| |dpiv|))
                                   (SEQ (LETT |mij| |mkj|) (LETT |pivk| |k|)
                                        (EXIT (LETT |dpiv| |dp1|)))))))))))
                           (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |dpiv| -1) "iterate")
                             ('T
                              (SEQ
                               (LETT |mm|
                                     (SPADCALL |mm| |i| |pivk| (QREFELT $ 28)))
                               (SEQ (LETT |w| NIL) (LETT #7# |lw|) G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN (LETT |w| (CAR #7#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |w| |i| |pivk|
                                                (QREFELT $ 30))))
                                    (LETT #7# (CDR #7#)) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k| (+ |i| 1)) (LETT #6# |nr|) G190
                                    (COND ((> |k| #6#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((NULL
                                         (SPADCALL
                                          (LETT |mkj|
                                                (SPADCALL |mm| |k| |j|
                                                          (QREFELT $ 25)))
                                          (QREFELT $ 26)))
                                        (SEQ
                                         (PROGN
                                          (LETT |#G14|
                                                (SPADCALL |mij| |mkj|
                                                          (QREFELT $ 32)))
                                          (LETT |mij| (QVELT |#G14| 0))
                                          (LETT |c| (QVELT |#G14| 1))
                                          (LETT |d| (QVELT |#G14| 2))
                                          (LETT |u| (QVELT |#G14| 3))
                                          (LETT |v| (QVELT |#G14| 4))
                                          |#G14|)
                                         (SEQ (LETT |k1| (+ |j| 1))
                                              (LETT #5# |nc|) G190
                                              (COND ((> |k1| #5#) (GO G191)))
                                              (SEQ
                                               (LETT |el1|
                                                     (QAREF2O |mm| |i| |k1| 1
                                                              1))
                                               (LETT |el2|
                                                     (QAREF2O |mm| |k| |k1| 1
                                                              1))
                                               (QSETAREF2O |mm| |i| |k1|
                                                           (SPADCALL
                                                            (SPADCALL |c| |el1|
                                                                      (QREFELT
                                                                       $ 33))
                                                            (SPADCALL |d| |el2|
                                                                      (QREFELT
                                                                       $ 33))
                                                            (QREFELT $ 34))
                                                           1 1)
                                               (EXIT
                                                (QSETAREF2O |mm| |k| |k1|
                                                            (SPADCALL
                                                             (SPADCALL |u|
                                                                       |el1|
                                                                       (QREFELT
                                                                        $ 33))
                                                             (SPADCALL |v|
                                                                       |el2|
                                                                       (QREFELT
                                                                        $ 33))
                                                             (QREFELT $ 34))
                                                            1 1)))
                                              (LETT |k1| (+ |k1| 1)) (GO G190)
                                              G191 (EXIT NIL))
                                         (SEQ (LETT |w| NIL) (LETT #4# |lw|)
                                              G190
                                              (COND
                                               ((OR (ATOM #4#)
                                                    (PROGN
                                                     (LETT |w| (CAR #4#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |elf1|
                                                     (QAREF1O |w| |i| 1))
                                               (LETT |elf2|
                                                     (QAREF1O |w| |k| 1))
                                               (QSETAREF1O |w| |i|
                                                           (SPADCALL
                                                            (SPADCALL |c| |cc|
                                                                      |elf1|
                                                                      (QREFELT
                                                                       $ 35))
                                                            (SPADCALL |d| |cc|
                                                                      |elf2|
                                                                      (QREFELT
                                                                       $ 35))
                                                            (QREFELT $ 36))
                                                           1)
                                               (EXIT
                                                (QSETAREF1O |w| |k|
                                                            (SPADCALL
                                                             (SPADCALL |u| |cc|
                                                                       |elf1|
                                                                       (QREFELT
                                                                        $ 35))
                                                             (SPADCALL |v| |cc|
                                                                       |elf2|
                                                                       (QREFELT
                                                                        $ 35))
                                                             (QREFELT $ 36))
                                                            1)))
                                              (LETT #4# (CDR #4#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (QSETAREF2O |mm| |i| |j| |mij| 1 1)
                                         (EXIT
                                          (QSETAREF2O |mm| |k| |j|
                                                      (|spadConstant| $ 9) 1
                                                      1)))))))
                                    (LETT |k| (+ |k| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k| 1) (LETT #3# (- |i| 1)) G190
                                    (COND ((|greater_SI| |k| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |mkj|
                                               (SPADCALL |mm| |k| |j|
                                                         (QREFELT $ 25)))
                                         (QREFELT $ 26))
                                        "iterate")
                                       ('T
                                        (SEQ
                                         (PROGN
                                          (LETT |#G18|
                                                (SPADCALL |mkj| |mij|
                                                          (QREFELT $ 38)))
                                          (LETT |q| (QCAR |#G18|))
                                          (LETT |r| (QCDR |#G18|))
                                          |#G18|)
                                         (QSETAREF2O |mm| |k| |j| |r| 1 1)
                                         (SEQ (LETT |k1| (+ |j| 1))
                                              (LETT #2# |nc|) G190
                                              (COND ((> |k1| #2#) (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (QSETAREF2O |mm| |k| |k1|
                                                            (SPADCALL
                                                             (QAREF2O |mm| |k|
                                                                      |k1| 1 1)
                                                             (SPADCALL |q|
                                                                       (QAREF2O
                                                                        |mm|
                                                                        |i|
                                                                        |k1| 1
                                                                        1)
                                                                       (QREFELT
                                                                        $ 33))
                                                             (QREFELT $ 39))
                                                            1 1)))
                                              (LETT |k1| (+ |k1| 1)) (GO G190)
                                              G191 (EXIT NIL))
                                         (EXIT
                                          (SEQ (LETT |w| NIL) (LETT #1# |lw|)
                                               G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |w| (CAR #1#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (QSETAREF1O |w| |k|
                                                             (SPADCALL
                                                              (QAREF1O |w| |k|
                                                                       1)
                                                              (SPADCALL |q|
                                                                        |cc|
                                                                        (QAREF1O
                                                                         |w|
                                                                         |i| 1)
                                                                        (QREFELT
                                                                         $ 35))
                                                              (QREFELT $ 40))
                                                             1)))
                                               (LETT #1# (CDR #1#)) (GO G190)
                                               G191 (EXIT NIL))))))))
                                    (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))
               #14# (EXIT #9#))
              (EXIT (CONS |mm| |lw|))))) 

(SDEFUN |OREMAT;triangular_solve|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          #1=(|Record|
              (|:| |particular|
                   #2=(|List|
                       (|Record| (|:| |ratpart| F)
                                 (|:| |coeffs| #3=(|Vector| F)))))
              (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Union|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((#4=#:G235 NIL) (|ba| NIL) (#5=#:G236 NIL) (|bv| #6=(|Vector| F))
          (#7=#:G234 NIL) (|bvl| (|List| (|Vector| F))) (|cba| (|List| #6#))
          (|cb| (|List| #6#)) (|ncba| (|List| (|Vector| F)))
          (|na| (|Vector| F)) (|ncb| (|List| (|Vector| F))) (#8=#:G233 NIL)
          (|k| NIL) (|nbcv2| #6#) (#9=#:G232 NIL) (|nbcv1| #6#)
          (#10=#:G230 NIL) (|j| NIL) (#11=#:G231 NIL) (|slj| NIL)
          (|nsl2| (|List| F)) (|nbvl| (|List| (|Vector| F))) (#12=#:G229 NIL)
          (|nbcv| #6#) (#13=#:G201 NIL) (#14=#:G200 NIL)
          (|nrl1| (|NonNegativeInteger|)) (#15=#:G228 NIL) (#16=#:G227 NIL)
          (|ss| (F)) (#17=#:G226 NIL) (|slk| NIL) (#18=#:G225 NIL)
          (|noff| (|NonNegativeInteger|)) (|cm2| (|Matrix| F))
          (|cm1| (|Matrix| F)) (#19=#:G224 NIL) (|ncv| NIL) (#20=#:G223 NIL)
          (|nsl1| (|List| F)) (#21=#:G222 NIL) (|pr| NIL) (#22=#:G221 NIL)
          (|ncvl| (|List| #3#)) (#23=#:G220 NIL) (#24=#:G219 NIL)
          (|nrl| (|NonNegativeInteger|)) (|prl| #2#) (#25=#:G218 NIL)
          (|be| NIL) (|resi| #1#) (|lvi| (|List| F)) (|lvi2| (|List| F))
          (|vvi| (F)) (#26=#:G217 NIL) (#27=#:G215 NIL) (#28=#:G216 NIL)
          (|lvi1| (|List| F)) (#29=#:G214 NIL) (#30=#:G213 NIL)
          (|nbas| #31=(|NonNegativeInteger|)) (|nlvi| (|NonNegativeInteger|))
          (#32=#:G212 NIL) (#33=#:G211 NIL) (|lvi0| (|List| F))
          (#34=#:G210 NIL) (|v| NIL) (#35=#:G209 NIL) (#36=#:G202 NIL)
          (|i| NIL) (#37=#:G207 NIL) (#38=#:G208 NIL) (#39=#:G206 NIL)
          (#40=#:G205 NIL) (#41=#:G204 NIL) (#42=#:G203 NIL) (|n| #31#)
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (ANCOLS |m|)) (LETT |nr| (ANROWS |m|))
                (EXIT
                 (COND ((SPADCALL |nc| |nr| (QREFELT $ 41)) (CONS 1 "failed"))
                       ('T
                        (SEQ (LETT |n| (LENGTH |lv|)) (LETT |bvl| NIL)
                             (LETT |cb|
                                   (PROGN
                                    (LETT #42# NIL)
                                    (SEQ (LETT |i| 1) (LETT #41# |n|) G190
                                         (COND
                                          ((|greater_SI| |i| #41#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #42#
                                                 (CONS
                                                  (MAKEARR1 |n|
                                                            (|spadConstant| $
                                                                            8))
                                                  #42#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #42#)))))
                             (LETT |cba|
                                   (PROGN
                                    (LETT #40# NIL)
                                    (SEQ (LETT |bv| NIL) (LETT #39# |cb|) G190
                                         (COND
                                          ((OR (ATOM #39#)
                                               (PROGN
                                                (LETT |bv| (CAR #39#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #40#
                                                 (CONS
                                                  (MAKEARR1 |nc|
                                                            (|spadConstant| $
                                                                            8))
                                                  #40#))))
                                         (LETT #39# (CDR #39#)) (GO G190) G191
                                         (EXIT (NREVERSE #40#)))))
                             (SEQ (LETT |bv| NIL) (LETT #38# |cb|) (LETT |i| 1)
                                  (LETT #37# |n|) G190
                                  (COND
                                   ((OR (|greater_SI| |i| #37#) (ATOM #38#)
                                        (PROGN (LETT |bv| (CAR #38#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |bv| |i| (|spadConstant| $ 23)
                                              (QREFELT $ 42))))
                                  (LETT |i|
                                        (PROG1 (|inc_SI| |i|)
                                          (LETT #38# (CDR #38#))))
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| |nc|) G190
                                  (COND ((< |i| 1) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |m| |i| |i| (QREFELT $ 25))
                                       (|spadConstant| $ 9) (QREFELT $ 43))
                                      (PROGN
                                       (LETT #36# (CONS 1 "failed"))
                                       (GO #43=#:G199)))
                                     ('T
                                      (SEQ
                                       (LETT |lvi0|
                                             (PROGN
                                              (LETT #35# NIL)
                                              (SEQ (LETT |v| NIL)
                                                   (LETT #34# |lv|) G190
                                                   (COND
                                                    ((OR (ATOM #34#)
                                                         (PROGN
                                                          (LETT |v| (CAR #34#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #35#
                                                           (CONS
                                                            (SPADCALL |v| |i|
                                                                      (QREFELT
                                                                       $ 44))
                                                            #35#))))
                                                   (LETT #34# (CDR #34#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #35#)))))
                                       (LETT |lvi1|
                                             (PROGN
                                              (LETT #33# NIL)
                                              (SEQ (LETT |bv| NIL)
                                                   (LETT #32# |cb|) G190
                                                   (COND
                                                    ((OR (ATOM #32#)
                                                         (PROGN
                                                          (LETT |bv|
                                                                (CAR #32#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #33#
                                                           (CONS
                                                            (SPADCALL |bv|
                                                                      |lvi0|
                                                                      (QREFELT
                                                                       $ 47))
                                                            #33#))))
                                                   (LETT #32# (CDR #32#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #33#)))))
                                       (LETT |nlvi| (LENGTH |lvi1|))
                                       (LETT |nbas| (LENGTH |bvl|))
                                       (LETT |lvi1|
                                             (SPADCALL |lvi1|
                                                       (PROGN
                                                        (LETT #30# NIL)
                                                        (SEQ (LETT |bv| NIL)
                                                             (LETT #29# |bvl|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #29#)
                                                                   (PROGN
                                                                    (LETT |bv|
                                                                          (CAR
                                                                           #29#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #30#
                                                                     (CONS
                                                                      (|spadConstant|
                                                                       $ 8)
                                                                      #30#))))
                                                             (LETT #29#
                                                                   (CDR #29#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #30#))))
                                                       (QREFELT $ 48)))
                                       (LETT |lvi2| NIL)
                                       (SEQ (LETT |vvi| NIL) (LETT #28# |lvi1|)
                                            (LETT |bv| NIL)
                                            (LETT #27#
                                                  (SPADCALL |cba| |bvl|
                                                            (QREFELT $ 49)))
                                            G190
                                            (COND
                                             ((OR (ATOM #27#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #27#))
                                                   NIL)
                                                  (ATOM #28#)
                                                  (PROGN
                                                   (LETT |vvi| (CAR #28#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (SEQ (LETT |j| (+ |i| 1))
                                                  (LETT #26# |nc|) G190
                                                  (COND
                                                   ((> |j| #26#) (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |vvi|
                                                          (SPADCALL |vvi|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |m| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       $ 25))
                                                                     |cc|
                                                                     (SPADCALL
                                                                      |bv| |j|
                                                                      (QREFELT
                                                                       $ 44))
                                                                     (QREFELT $
                                                                              35))
                                                                    (QREFELT $
                                                                             40)))))
                                                  (LETT |j| (+ |j| 1))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |lvi2|
                                                    (CONS |vvi| |lvi2|))))
                                            (LETT #27#
                                                  (PROG1 (CDR #27#)
                                                    (LETT #28# (CDR #28#))))
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |lvi| (NREVERSE |lvi2|))
                                       (LETT |resi|
                                             (SPADCALL
                                              (SPADCALL |m| |i| |i|
                                                        (QREFELT $ 25))
                                              |lvi| |solf|))
                                       (LETT |nbvl| NIL)
                                       (SEQ (LETT |be| NIL)
                                            (LETT #25# (QCDR |resi|)) G190
                                            (COND
                                             ((OR (ATOM #25#)
                                                  (PROGN
                                                   (LETT |be| (CAR #25#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |bv|
                                                   (MAKEARR1 |nc|
                                                             (|spadConstant| $
                                                                             8)))
                                             (SPADCALL |bv| |i| |be|
                                                       (QREFELT $ 42))
                                             (EXIT
                                              (LETT |nbvl|
                                                    (CONS |bv| |nbvl|))))
                                            (LETT #25# (CDR #25#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |prl| (QCAR |resi|))
                                       (LETT |nrl| (LENGTH |prl|))
                                       (LETT |ncvl|
                                             (PROGN
                                              (LETT #24# NIL)
                                              (SEQ (LETT |pr| NIL)
                                                   (LETT #23# |prl|) G190
                                                   (COND
                                                    ((OR (ATOM #23#)
                                                         (PROGN
                                                          (LETT |pr|
                                                                (CAR #23#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #24#
                                                           (CONS (QCDR |pr|)
                                                                 #24#))))
                                                   (LETT #23# (CDR #23#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #24#)))))
                                       (LETT |nsl1|
                                             (PROGN
                                              (LETT #22# NIL)
                                              (SEQ (LETT |pr| NIL)
                                                   (LETT #21# |prl|) G190
                                                   (COND
                                                    ((OR (ATOM #21#)
                                                         (PROGN
                                                          (LETT |pr|
                                                                (CAR #21#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #22#
                                                           (CONS (QCAR |pr|)
                                                                 #22#))))
                                                   (LETT #21# (CDR #21#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #22#)))))
                                       (LETT |cm1|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #20# NIL)
                                               (SEQ (LETT |ncv| NIL)
                                                    (LETT #19# |ncvl|) G190
                                                    (COND
                                                     ((OR (ATOM #19#)
                                                          (PROGN
                                                           (LETT |ncv|
                                                                 (CAR #19#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #20#
                                                            (CONS
                                                             (SPADCALL |ncv|
                                                                       (QREFELT
                                                                        $ 50))
                                                             #20#))))
                                                    (LETT #19# (CDR #19#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #20#))))
                                              (QREFELT $ 53)))
                                       (LETT |cm2|
                                             (SPADCALL
                                              (SPADCALL |cm1|
                                                        (SPADCALL |nrl|
                                                                  (|spadConstant|
                                                                   $ 23)
                                                                  (QREFELT $
                                                                           55))
                                                        (QREFELT $ 56))
                                              (QREFELT $ 57)))
                                       (LETT |nsl2| NIL)
                                       (LETT |noff| (+ (+ |nlvi| |nbas|) 1))
                                       (SEQ (LETT |j| 1) (LETT #18# |nrl|) G190
                                            (COND
                                             ((|greater_SI| |j| #18#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ss| (|spadConstant| $ 8))
                                             (SEQ (LETT |slk| NIL)
                                                  (LETT #17# |nsl1|)
                                                  (LETT |k| |noff|) G190
                                                  (COND
                                                   ((OR (ATOM #17#)
                                                        (PROGN
                                                         (LETT |slk|
                                                               (CAR #17#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |ss|
                                                          (SPADCALL |ss|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |cm2| |j|
                                                                      |k|
                                                                      (QREFELT
                                                                       $ 58))
                                                                     |slk|
                                                                     (QREFELT $
                                                                              59))
                                                                    (QREFELT $
                                                                             36)))))
                                                  (LETT |k|
                                                        (PROG1 (+ |k| 1)
                                                          (LETT #17#
                                                                (CDR #17#))))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |nsl2|
                                                    (CONS |ss| |nsl2|))))
                                            (LETT |j| (|inc_SI| |j|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |nrl1| 0)
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |slj| NIL)
                                              (LETT #16# |nsl2|)
                                              (LETT |j| |nrl|) G190
                                              (COND
                                               ((OR (< |j| 1) (ATOM #16#)
                                                    (PROGN
                                                     (LETT |slj| (CAR #16#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ
                                                (EXIT
                                                 (SEQ (LETT |k| 1)
                                                      (LETT #15# |nlvi|) G190
                                                      (COND
                                                       ((|greater_SI| |k| #15#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL
                                                           (SPADCALL |cm2| |j|
                                                                     |k|
                                                                     (QREFELT $
                                                                              58))
                                                           (|spadConstant| $ 8)
                                                           (QREFELT $ 60))
                                                          (SEQ
                                                           (LETT |nrl1| |j|)
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #14#
                                                                   |$NoValue|)
                                                             (GO
                                                              #44=#:G183))))))))
                                                      (LETT |k| (|inc_SI| |k|))
                                                      (GO G190) G191
                                                      (EXIT NIL)))
                                                #44# (EXIT #14#))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |nrl1| 0
                                                            (QREFELT $ 20))
                                                  (PROGN
                                                   (LETT #13# |$NoValue|)
                                                   (GO #45=#:G187)))
                                                 ('T
                                                  (SEQ
                                                   (LETT |nbcv|
                                                         (MAKEARR1 |nbas|
                                                                   (|spadConstant|
                                                                    $ 8)))
                                                   (SEQ (LETT |k| 1)
                                                        (LETT #12# |nbas|) G190
                                                        (COND
                                                         ((|greater_SI| |k|
                                                                        #12#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (SPADCALL |nbcv| |k|
                                                                    (SPADCALL
                                                                     |cm2| |j|
                                                                     (+ |k|
                                                                        |nlvi|)
                                                                     (QREFELT $
                                                                              58))
                                                                    (QREFELT $
                                                                             42))))
                                                        (LETT |k|
                                                              (|inc_SI| |k|))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (LETT |bv|
                                                         (SPADCALL |nbcv| |bvl|
                                                                   (QREFELT $
                                                                            61)))
                                                   (SPADCALL |bv| |i| |slj|
                                                             (QREFELT $ 42))
                                                   (EXIT
                                                    (LETT |nbvl|
                                                          (CONS |bv|
                                                                |nbvl|))))))))
                                              (LETT |j|
                                                    (PROG1 (+ |j| -1)
                                                      (LETT #16# (CDR #16#))))
                                              (GO G190) G191 (EXIT NIL)))
                                        #45# (EXIT #13#))
                                       (LETT |nsl2| (NREVERSE |nsl2|))
                                       (LETT |ncb| NIL) (LETT |ncba| NIL)
                                       (SEQ (LETT |slj| NIL) (LETT #11# |nsl2|)
                                            (LETT |j| 1) (LETT #10# |nrl1|)
                                            G190
                                            (COND
                                             ((OR (|greater_SI| |j| #10#)
                                                  (ATOM #11#)
                                                  (PROGN
                                                   (LETT |slj| (CAR #11#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |nbcv1|
                                                   (MAKEARR1 |nbas|
                                                             (|spadConstant| $
                                                                             8)))
                                             (SEQ (LETT |k| 1)
                                                  (LETT #9# |nbas|) G190
                                                  (COND
                                                   ((|greater_SI| |k| #9#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv1| |k|
                                                              (SPADCALL |cm2|
                                                                        |j|
                                                                        (+ |k|
                                                                           |nlvi|)
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 42))))
                                                  (LETT |k| (|inc_SI| |k|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |nbcv2|
                                                   (MAKEARR1 |nlvi|
                                                             (|spadConstant| $
                                                                             8)))
                                             (SEQ (LETT |k| 1)
                                                  (LETT #8# |nlvi|) G190
                                                  (COND
                                                   ((|greater_SI| |k| #8#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv2| |k|
                                                              (SPADCALL |cm2|
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         $ 58))
                                                              (QREFELT $ 42))))
                                                  (LETT |k| (|inc_SI| |k|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |bv|
                                                   (SPADCALL |nbcv2| |cb|
                                                             (QREFELT $ 61)))
                                             (LETT |ncb| (CONS |bv| |ncb|))
                                             (LETT |na|
                                                   (SPADCALL |nbcv2| |cba|
                                                             (QREFELT $ 61)))
                                             (LETT |na|
                                                   (SPADCALL |nbcv1| |na| |bvl|
                                                             (QREFELT $ 62)))
                                             (SPADCALL |na| |i| |slj|
                                                       (QREFELT $ 42))
                                             (EXIT
                                              (LETT |ncba|
                                                    (CONS |na| |ncba|))))
                                            (LETT |j|
                                                  (PROG1 (|inc_SI| |j|)
                                                    (LETT #11# (CDR #11#))))
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |cb| (NREVERSE |ncb|))
                                       (LETT |cba| (NREVERSE |ncba|))
                                       (EXIT (LETT |bvl| |nbvl|)))))))
                                  (LETT |i| (+ |i| -1)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (PROGN
                                      (LETT #7# NIL)
                                      (SEQ (LETT |bv| NIL) (LETT #5# |cb|)
                                           (LETT |ba| NIL) (LETT #4# |cba|)
                                           G190
                                           (COND
                                            ((OR (ATOM #4#)
                                                 (PROGN
                                                  (LETT |ba| (CAR #4#))
                                                  NIL)
                                                 (ATOM #5#)
                                                 (PROGN
                                                  (LETT |bv| (CAR #5#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #7#
                                                   (CONS (CONS |ba| |bv|)
                                                         #7#))))
                                           (LETT #4#
                                                 (PROG1 (CDR #4#)
                                                   (LETT #5# (CDR #5#))))
                                           (GO G190) G191
                                           (EXIT (NREVERSE #7#))))
                                     |bvl|)))))))))
          #43# (EXIT #36#)))) 

(SDEFUN |OREMAT;solve;MFLMU;4|
        ((|m| |Matrix| LO) (|cc| F) (|lv| |List| (|Vector| F))
         (|solf| |Mapping|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| F)))
          LO (|List| F))
         ($ |Union|
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))
          "failed"))
        (SPROG
         ((|rec|
           (|Record| (|:| |mat| (|Matrix| LO))
                     (|:| |vecs| (|List| (|Vector| F))))))
         (SEQ (LETT |rec| (SPADCALL |m| |cc| |lv| (QREFELT $ 13)))
              (EXIT
               (|OREMAT;triangular_solve| (QCAR |rec|) |cc| (QCDR |rec|) |solf|
                $))))) 

(DECLAIM (NOTINLINE |OrePolynomialMatrixOperations;|)) 

(DEFUN |OrePolynomialMatrixOperations| (&REST #1=#:G251)
  (SPROG NIL
         (PROG (#2=#:G252)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrePolynomialMatrixOperations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |OrePolynomialMatrixOperations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrePolynomialMatrixOperations|)))))))))) 

(DEFUN |OrePolynomialMatrixOperations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OrePolynomialMatrixOperations| DV$1 DV$2))
          (LETT $ (GETREFV 70))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrePolynomialMatrixOperations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OrePolynomialMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|)
              (|Record| (|:| |mat| 11) (|:| |vecs| 12)) (|Matrix| 7)
              (|List| 16) |OREMAT;rowEchelon;MFLR;2| |OREMAT;rowEchelon;2M;1|
              (8 . |copy|) (|Vector| 6) (13 . |copy|) (|Boolean|)
              (|NonNegativeInteger|) (18 . ~=) (|Integer|) (24 . >)
              (30 . |One|) (34 . |One|) (38 . |elt|) (45 . |zero?|)
              (50 . |degree|) (55 . |swapRows!|) (|Void|) (62 . |swap!|)
              (|Record| (|:| |generator| $) (|:| |coef1| $) (|:| |coef2| $)
                        (|:| |coefu| $) (|:| |coefv| $))
              (69 . |right_ext_ext_GCD|) (75 . *) (81 . +) (87 . |apply|)
              (94 . +) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (100 . |rightDivide|) (106 . -) (112 . -) (118 . >)
              (124 . |setelt!|) (131 . =) (137 . |elt|) (|List| 6)
              (|LinearCombinationUtilities| 6 (|SparseUnivariatePolynomial| 6))
              (143 . |lin_comb|) (149 . |concat|) (155 . |concat|)
              (161 . |parts|) (|List| 45) (|Matrix| 6) (166 . |matrix|)
              (171 . |scalarMatrix|) (177 . |scalarMatrix|)
              (183 . |horizConcat|) (189 . |rowEchelon|) (194 . |elt|)
              (201 . *) (207 . ~=) (213 . |lin_comb|) (219 . |lin_comb!|)
              (|Record| (|:| |ratpart| 16) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 63)) (|:| |basis| 12))
              (|Union| 64 '"failed")
              (|Record| (|:| |ratpart| 6) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 66)) (|:| |basis| 45))
              (|Mapping| 67 7 45) |OREMAT;solve;MFLMU;4|)
           '#(|solve| 226 |rowEchelon| 234) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(0 6 0 8 0 7 0 9 1 11 0 0 15
                                                   1 16 0 0 17 2 19 18 0 0 20 2
                                                   21 18 0 0 22 0 6 0 23 0 7 0
                                                   24 3 11 7 0 21 21 25 1 7 18
                                                   0 26 1 7 19 0 27 3 11 0 0 21
                                                   21 28 3 16 29 0 21 21 30 2 7
                                                   31 0 0 32 2 7 0 0 0 33 2 7 0
                                                   0 0 34 3 7 6 0 6 6 35 2 6 0
                                                   0 0 36 2 7 37 0 0 38 2 7 0 0
                                                   0 39 2 6 0 0 0 40 2 19 18 0
                                                   0 41 3 16 6 0 21 6 42 2 7 18
                                                   0 0 43 2 16 6 0 21 44 2 46 6
                                                   16 45 47 2 45 0 0 0 48 2 12
                                                   0 0 0 49 1 16 45 0 50 1 52 0
                                                   51 53 2 11 0 19 7 54 2 52 0
                                                   19 6 55 2 52 0 0 0 56 1 52 0
                                                   0 57 3 52 6 0 21 21 58 2 6 0
                                                   0 0 59 2 6 18 0 0 60 2 46 16
                                                   16 12 61 3 46 16 16 16 12 62
                                                   4 0 65 11 6 12 68 69 1 0 11
                                                   11 14 3 0 10 11 6 12 13)))))
           '|lookupComplete|)) 
