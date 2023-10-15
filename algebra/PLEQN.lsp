
(SDEFUN |PLEQN;inconsistent?;LB;1| ((|pl| |List| GR) ($ |Boolean|))
        (SPROG ((#1=#:G142 NIL) (#2=#:G143 NIL) (#3=#:G144 NIL) (|p| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |p| NIL . #4=(|PLEQN;inconsistent?;LB;1|))
                         (LETT #3# |pl| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |p| (QREFELT $ 11))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G141))
                                    . #4#)
                              (GO #6=#:G139))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |PLEQN;inconsistent?;LB;2|
        ((|pl| |List| (|Polynomial| R)) ($ |Boolean|))
        (SPROG ((#1=#:G149 NIL) (#2=#:G150 NIL) (#3=#:G151 NIL) (|p| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |p| NIL . #4=(|PLEQN;inconsistent?;LB;2|))
                         (LETT #3# |pl| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |p| (QREFELT $ 15))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# 'T . #4#) (GO #5=#:G148))
                                    . #4#)
                              (GO #6=#:G146))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |PLEQN;B1solve;RR;3|
        ((|sys| |Record| (|:| |mat| (|Matrix| (|Fraction| (|Polynomial| R))))
          (|:| |vec| (|List| (|Fraction| (|Polynomial| R))))
          (|:| |rank| (|NonNegativeInteger|)) (|:| |rows| (|List| (|Integer|)))
          (|:| |cols| (|List| (|Integer|))))
         ($ |Record| (|:| |partsol| (|Vector| (|Fraction| (|Polynomial| R))))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
        (SPROG
         ((|pbas| (|List| (|Vector| (|Fraction| (|Polynomial| R)))))
          (|pb| #1=(|Vector| (|Fraction| (|Polynomial| R)))) (#2=#:G176 NIL)
          (|j| NIL) (|j1| NIL) (#3=#:G175 NIL) (|i| NIL) (|i1| NIL)
          (#4=#:G174 NIL) (#5=#:G173 NIL)
          (|augmat| (|Matrix| (|Fraction| (|Polynomial| R)))) (#6=#:G172 NIL)
          (#7=#:G171 NIL) (#8=#:G170 NIL) (|p| #1#)
          (|w| (|List| (|Fraction| (|Polynomial| R))))
          (|frcols| (|List| (|Integer|))) (|n| (|NonNegativeInteger|))
          (|cmat| (|Matrix| (|Fraction| (|Polynomial| R))))
          (|k| (|NonNegativeInteger|)) (|nss| (|List| (|Integer|)))
          (|rss| (|List| (|Integer|))))
         (SEQ (LETT |rss| (QVELT |sys| 3) . #9=(|PLEQN;B1solve;RR;3|))
              (LETT |nss| (QVELT |sys| 4) . #9#)
              (LETT |k| (QVELT |sys| 2) . #9#)
              (LETT |cmat| (QVELT |sys| 0) . #9#)
              (LETT |n| (ANCOLS |cmat|) . #9#)
              (LETT |frcols|
                    (SPADCALL
                     (SPADCALL (SPADCALL 1 |n| (QREFELT $ 22)) (QREFELT $ 24))
                     |nss| (QREFELT $ 25))
                    . #9#)
              (LETT |w| (QVELT |sys| 1) . #9#)
              (LETT |p| (MAKEARR1 |n| (|spadConstant| $ 29)) . #9#)
              (LETT |pbas| NIL . #9#)
              (COND
               ((SPADCALL |k| 0 (QREFELT $ 31))
                (SEQ
                 (LETT |augmat| (SPADCALL |k| (+ |n| 1) (QREFELT $ 33)) . #9#)
                 (SEQ (LETT |i1| 1 . #9#) (LETT |i| NIL . #9#)
                      (LETT #8# |rss| . #9#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |j1| 1 . #9#) (LETT |j| NIL . #9#)
                            (LETT #7# |nss| . #9#) G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |j| (CAR #7#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |augmat| |i1| |j1|
                                        (SPADCALL |cmat| |i| |j|
                                                  (QREFELT $ 34))
                                        (QREFELT $ 35))))
                            (LETT #7#
                                  (PROG1 (CDR #7#)
                                    (LETT |j1| (|inc_SI| |j1|) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |j1| (+ |k| 1) . #9#) (LETT |j| NIL . #9#)
                            (LETT #6# |frcols| . #9#) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |j| (CAR #6#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |augmat| |i1| |j1|
                                        (SPADCALL
                                         (SPADCALL |cmat| |i| |j|
                                                   (QREFELT $ 34))
                                         (QREFELT $ 36))
                                        (QREFELT $ 35))))
                            (LETT #6#
                                  (PROG1 (CDR #6#)
                                    (LETT |j1| (+ |j1| 1) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL |augmat| |i1| (+ |n| 1)
                                  (SPADCALL |w| |i| (QREFELT $ 38))
                                  (QREFELT $ 35))))
                      (LETT #8#
                            (PROG1 (CDR #8#) (LETT |i1| (|inc_SI| |i1|) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 (LETT |augmat| (SPADCALL |augmat| (QREFELT $ 39)) . #9#)
                 (SEQ (LETT |i1| 1 . #9#) (LETT |i| NIL . #9#)
                      (LETT #5# |nss| . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |p| |i|
                                  (SPADCALL |augmat| |i1| (+ |n| 1)
                                            (QREFELT $ 34))
                                  (QREFELT $ 41))))
                      (LETT #5#
                            (PROG1 (CDR #5#) (LETT |i1| (|inc_SI| |i1|) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SEQ (LETT |j1| (+ |k| 1) . #9#) (LETT |j| NIL . #9#)
                       (LETT #4# |frcols| . #9#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 29)) . #9#)
                        (SPADCALL |pb| |j| (|spadConstant| $ 42)
                                  (QREFELT $ 41))
                        (SEQ (LETT |i1| 1 . #9#) (LETT |i| NIL . #9#)
                             (LETT #3# |nss| . #9#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |i| (CAR #3#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |pb| |i|
                                         (SPADCALL |augmat| |i1| |j1|
                                                   (QREFELT $ 34))
                                         (QREFELT $ 41))))
                             (LETT #3#
                                   (PROG1 (CDR #3#)
                                     (LETT |i1| (|inc_SI| |i1|) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |pbas| (CONS |pb| |pbas|) . #9#)))
                       (LETT #4# (PROG1 (CDR #4#) (LETT |j1| (+ |j1| 1) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |j1| (+ |k| 1) . #9#) (LETT |j| NIL . #9#)
                     (LETT #2# |frcols| . #9#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |pb| (MAKEARR1 |n| (|spadConstant| $ 29)) . #9#)
                      (SPADCALL |pb| |j| (|spadConstant| $ 42) (QREFELT $ 41))
                      (EXIT (LETT |pbas| (CONS |pb| |pbas|) . #9#)))
                     (LETT #2# (PROG1 (CDR #2#) (LETT |j1| (+ |j1| 1) . #9#))
                           . #9#)
                     (GO G190) G191 (EXIT NIL))))
              (EXIT (CONS |p| |pbas|))))) 

(SDEFUN |PLEQN;regime;RMLL2NniIR;4|
        ((|y| |Record| (|:| |det| GR) (|:| |rows| #1=(|List| (|Integer|)))
          (|:| |cols| #2=(|List| (|Integer|))))
         (|coef| |Matrix| GR) (|w| |List| (|Fraction| (|Polynomial| R)))
         (|psbf| |List| (|List| GR)) (|rk| |NonNegativeInteger|)
         (|rkmax| |NonNegativeInteger|) (|mode| |Integer|)
         ($ |Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
          (|:| |wcond| (|List| (|Polynomial| R)))
          (|:| |bsoln|
               (|Record|
                (|:| |partsol| (|Vector| (|Fraction| (|Polynomial| R))))
                (|:| |basis|
                     (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))))
        (SPROG
         ((|test|
           (|Record| (|:| |sysok| (|Boolean|)) (|:| |z0| (|List| GR))
                     (|:| |n0| (|List| GR))))
          (|yzero| (|List| GR)) (#3=#:G212 NIL) (|pw| NIL) (#4=#:G211 NIL)
          (|wcd| (|List| (|Polynomial| R))) (#5=#:G203 NIL)
          (|wnum| (|Polynomial| R)) (|weqn| #6=(|Fraction| (|Polynomial| R)))
          (#7=#:G188 NIL) (#8=#:G187 #6#) (#9=#:G189 #6#) (#10=#:G210 NIL)
          (|j| NIL) (#11=#:G209 NIL) (|i| NIL) (|frows| (|List| (|Integer|)))
          (|pp| #12=(|Vector| (|Fraction| (|Polynomial| R))))
          (|pps|
           (|Record| (|:| |partsol| #12#)
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
          (|sys|
           (|Record| (|:| |mat| (|Matrix| (|Fraction| (|Polynomial| R))))
                     (|:| |vec| (|List| (|Fraction| (|Polynomial| R))))
                     (|:| |rank| (|NonNegativeInteger|))
                     (|:| |rows| (|List| (|Integer|)))
                     (|:| |cols| (|List| (|Integer|)))))
          (|nss| #2#) (|rss| #1#)
          (|nc| (|Matrix| (|Fraction| (|Polynomial| R)))) (#13=#:G181 NIL)
          (#14=#:G180 (GR)) (#15=#:G182 (GR)) (#16=#:G208 NIL) (#17=#:G104 NIL)
          (#18=#:G207 NIL) (|x| NIL) (#19=#:G206 NIL) (#20=#:G205 NIL)
          (#21=#:G204 NIL) (|ydetf| (|List| GR)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ydetf| (SPADCALL (QVELT |y| 0) (QREFELT $ 46))
                  . #22=(|PLEQN;regime;RMLL2NniIR;4|))
            (LETT |yzero|
                  (COND ((EQL |rk| |rkmax|) NIL)
                        (#23='T
                         (SEQ
                          (LETT |psbf|
                                (PROGN
                                 (LETT #21# NIL . #22#)
                                 (SEQ (LETT |x| NIL . #22#)
                                      (LETT #20# |psbf| . #22#) G190
                                      (COND
                                       ((OR (ATOM #20#)
                                            (PROGN
                                             (LETT |x| (CAR #20#) . #22#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #21#
                                              (CONS
                                               (SPADCALL |x| |ydetf|
                                                         (QREFELT $ 47))
                                               #21#)
                                              . #22#)))
                                      (LETT #20# (CDR #20#) . #22#) (GO G190)
                                      G191 (EXIT (NREVERSE #21#))))
                                . #22#)
                          (EXIT
                           (SPADCALL
                            (PROGN
                             (LETT #19# NIL . #22#)
                             (SEQ (LETT |x| NIL . #22#)
                                  (LETT #18# |psbf| . #22#) G190
                                  (COND
                                   ((OR (ATOM #18#)
                                        (PROGN
                                         (LETT |x| (CAR #18#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #19#
                                          (CONS
                                           (PROGN
                                            (LETT #13# NIL . #22#)
                                            (SEQ (LETT #17# NIL . #22#)
                                                 (LETT #16# |x| . #22#) G190
                                                 (COND
                                                  ((OR (ATOM #16#)
                                                       (PROGN
                                                        (LETT #17# (CAR #16#)
                                                              . #22#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (PROGN
                                                    (LETT #15# #17# . #22#)
                                                    (COND
                                                     (#13#
                                                      (LETT #14#
                                                            (SPADCALL #14# #15#
                                                                      (QREFELT
                                                                       $ 48))
                                                            . #22#))
                                                     ('T
                                                      (PROGN
                                                       (LETT #14# #15# . #22#)
                                                       (LETT #13# 'T
                                                             . #22#)))))))
                                                 (LETT #16# (CDR #16#) . #22#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (COND (#13# #14#)
                                                  ('T (|spadConstant| $ 19))))
                                           #19#)
                                          . #22#)))
                                  (LETT #18# (CDR #18#) . #22#) (GO G190) G191
                                  (EXIT (NREVERSE #19#))))
                            (QREFELT $ 50))))))
                  . #22#)
            (LETT |nc|
                  (SPADCALL (SPADCALL |coef| |yzero| (QREFELT $ 52))
                            (QREFELT $ 53))
                  . #22#)
            (LETT |rss| (QVELT |y| 1) . #22#) (LETT |nss| (QVELT |y| 2) . #22#)
            (LETT |sys| (VECTOR |nc| |w| |rk| |rss| |nss|) . #22#)
            (LETT |pps| (SPADCALL |sys| (QREFELT $ 45)) . #22#)
            (LETT |pp| (QCAR |pps|) . #22#)
            (LETT |frows|
                  (SPADCALL
                   (SPADCALL (SPADCALL 1 (ANROWS |coef|) (QREFELT $ 22))
                             (QREFELT $ 24))
                   |rss| (QREFELT $ 25))
                  . #22#)
            (LETT |wcd| NIL . #22#)
            (EXIT
             (COND
              ((SPADCALL |mode| (LIST 3 6 9 12) (QREFELT $ 54))
               (VECTOR |yzero| |ydetf| |wcd|
                       (SPADCALL |pps| |yzero| (QREFELT $ 55))))
              (#23#
               (SEQ
                (SEQ (LETT |i| NIL . #22#) (LETT #11# |frows| . #22#) G190
                     (COND
                      ((OR (ATOM #11#)
                           (PROGN (LETT |i| (CAR #11#) . #22#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |weqn|
                            (PROGN
                             (LETT #7# NIL . #22#)
                             (SEQ (LETT |j| NIL . #22#)
                                  (LETT #10# |nss| . #22#) G190
                                  (COND
                                   ((OR (ATOM #10#)
                                        (PROGN
                                         (LETT |j| (CAR #10#) . #22#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #9#
                                           (SPADCALL
                                            (SPADCALL |nc| |i| |j|
                                                      (QREFELT $ 34))
                                            (SPADCALL |pp| |j| (QREFELT $ 56))
                                            (QREFELT $ 57))
                                           . #22#)
                                     (COND
                                      (#7#
                                       (LETT #8#
                                             (SPADCALL #8# #9# (QREFELT $ 58))
                                             . #22#))
                                      ('T
                                       (PROGN
                                        (LETT #8# #9# . #22#)
                                        (LETT #7# 'T . #22#)))))))
                                  (LETT #10# (CDR #10#) . #22#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#7# #8#) ('T (|spadConstant| $ 29))))
                            . #22#)
                      (LETT |wnum|
                            (SPADCALL
                             (SPADCALL (SPADCALL |w| |i| (QREFELT $ 38)) |weqn|
                                       (QREFELT $ 59))
                             (QREFELT $ 60))
                            . #22#)
                      (EXIT
                       (COND
                        ((SPADCALL |wnum| (|spadConstant| $ 61) (QREFELT $ 62))
                         "trivially satisfied")
                        ((SPADCALL |wnum| (QREFELT $ 15))
                         (PROGN
                          (LETT #5#
                                (VECTOR |yzero| |ydetf|
                                        (LIST (|spadConstant| $ 63)) |pps|)
                                . #22#)
                          (GO #24=#:G202)))
                        ('T (LETT |wcd| (CONS |wnum| |wcd|) . #22#)))))
                     (LETT #11# (CDR #11#) . #22#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |mode| (LIST 2 5 8 11) (QREFELT $ 54))
                   (VECTOR |yzero| |ydetf| |wcd| |pps|))
                  (#23#
                   (SEQ
                    (COND
                     ((NULL (NULL |wcd|))
                      (LETT |yzero|
                            (SPADCALL
                             (APPEND |yzero|
                                     (PROGN
                                      (LETT #4# NIL . #22#)
                                      (SEQ (LETT |pw| NIL . #22#)
                                           (LETT #3# |wcd| . #22#) G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |pw| (CAR #3#) . #22#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL |pw|
                                                              (QREFELT $ 64))
                                                    #4#)
                                                   . #22#)))
                                           (LETT #3# (CDR #3#) . #22#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #4#)))))
                             (QREFELT $ 65))
                            . #22#)))
                    (LETT |test| (SPADCALL |yzero| |ydetf| (QREFELT $ 67))
                          . #22#)
                    (COND
                     ((NULL (QVELT |test| 0))
                      (EXIT
                       (VECTOR (QVELT |test| 1) (QVELT |test| 2)
                               (LIST (|spadConstant| $ 63)) |pps|))))
                    (EXIT
                     (VECTOR (QVELT |test| 1) (QVELT |test| 2) NIL
                             (SPADCALL |pps| (QVELT |test| 1)
                                       (QREFELT $ 55))))))))))))))
          #24# (EXIT #5#)))) 

(SDEFUN |PLEQN;bsolve;MLNniSIR;5|
        ((|coeff| |Matrix| GR) (|w| |List| (|Fraction| (|Polynomial| R)))
         (|h| |NonNegativeInteger|) (|outname| |String|) (|mode| |Integer|)
         ($ |Record|
          (|:| |rgl|
               (|List|
                (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                          (|:| |wcond| (|List| (|Polynomial| R)))
                          (|:| |bsoln|
                               (|Record|
                                (|:| |partsol|
                                     (|Vector| (|Fraction| (|Polynomial| R))))
                                (|:| |basis|
                                     (|List|
                                      (|Vector|
                                       (|Fraction| (|Polynomial| R))))))))))
          (|:| |rgsz| (|Integer|))))
        (SPROG
         ((|count| (|Integer|))
          (|lrec3|
           (|List|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector|
                                   (|Fraction| (|Polynomial| R))))))))))
          (|rec3|
           (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                     (|:| |wcond| (|List| (|Polynomial| R)))
                     (|:| |bsoln|
                          (|Record|
                           (|:| |partsol|
                                (|Vector| (|Fraction| (|Polynomial| R))))
                           (|:| |basis|
                                (|List|
                                 (|Vector| (|Fraction| (|Polynomial| R)))))))))
          (#1=#:G234 NIL) (|y| NIL) (|psbf| (|List| (|List| GR)))
          (#2=#:G233 NIL) (|x| NIL) (#3=#:G232 NIL) (|psb| #4=(|List| GR))
          (|pc|
           #5=(|List|
               (|Record| (|:| |det| GR) (|:| |rows| (|List| (|Integer|)))
                         (|:| |cols| (|List| (|Integer|))))))
          (|rk| #6=(|NonNegativeInteger|)) (|k| NIL)
          (|rkmin| (|NonNegativeInteger|)) (|rkmax| (|NonNegativeInteger|))
          (|rrcl|
           (|List|
            (|Record| (|:| |rank| #6#) (|:| |eqns| #5#) (|:| |fgb| #4#))))
          (#7=#:G231 NIL)
          (|rksoln|
           (|File|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector|
                                   (|Fraction| (|Polynomial| R))))))))))
          (|newfile| (|FileName|)) (|filemode| (|Boolean|))
          (|r| (|NonNegativeInteger|)))
         (SEQ (LETT |r| (ANROWS |coeff|) . #8=(|PLEQN;bsolve;MLNniSIR;5|))
              (EXIT
               (COND
                ((SPADCALL |r| (LENGTH |w|) (QREFELT $ 31))
                 (|error| "number of rows unequal on lhs and rhs"))
                (#9='T
                 (SEQ (LETT |count| 0 . #8#) (LETT |lrec3| NIL . #8#)
                      (LETT |filemode|
                            (SPADCALL |mode| (LIST 7 8 9 10 11 12)
                                      (QREFELT $ 54))
                            . #8#)
                      (COND
                       (|filemode|
                        (SEQ
                         (LETT |newfile|
                               (SPADCALL "" |outname| "regime" (QREFELT $ 74))
                               . #8#)
                         (EXIT
                          (LETT |rksoln| (SPADCALL |newfile| (QREFELT $ 76))
                                . #8#)))))
                      (LETT |rrcl|
                            (COND
                             ((SPADCALL |mode| (LIST 1 2 3 7 8 9)
                                        (QREFELT $ 54))
                              (SPADCALL |coeff| 0 (QREFELT $ 79)))
                             (#9#
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |mode| (LIST 4 5 6 10 11 12)
                                            (QREFELT $ 54))
                                  (PROGN
                                   (LETT #7#
                                         (SPADCALL |coeff| |h| (QREFELT $ 79))
                                         . #8#)
                                   (GO #10=#:G219)))))
                               #10# (EXIT #7#))))
                            . #8#)
                      (LETT |rkmax| (SPADCALL |rrcl| (QREFELT $ 80)) . #8#)
                      (LETT |rkmin| (SPADCALL |rrcl| (QREFELT $ 81)) . #8#)
                      (SEQ (LETT |k| (+ (- |rkmax| |rkmin|) 1) . #8#) G190
                           (COND ((< |k| 1) (GO G191)))
                           (SEQ
                            (LETT |rk|
                                  (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 82))
                                         0)
                                  . #8#)
                            (LETT |pc|
                                  (QVELT (SPADCALL |rrcl| |k| (QREFELT $ 82))
                                         1)
                                  . #8#)
                            (LETT |psb|
                                  (COND ((EQL |rk| |rkmax|) NIL)
                                        ('T
                                         (QVELT
                                          (SPADCALL |rrcl| (+ |k| 1)
                                                    (QREFELT $ 82))
                                          2)))
                                  . #8#)
                            (LETT |psbf|
                                  (PROGN
                                   (LETT #3# NIL . #8#)
                                   (SEQ (LETT |x| NIL . #8#)
                                        (LETT #2# |psb| . #8#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |x| (CAR #2#) . #8#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL |x| (QREFELT $ 46))
                                                 #3#)
                                                . #8#)))
                                        (LETT #2# (CDR #2#) . #8#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  . #8#)
                            (LETT |psbf| (SPADCALL |psbf| (QREFELT $ 83))
                                  . #8#)
                            (EXIT
                             (SEQ (LETT |y| NIL . #8#) (LETT #1# |pc| . #8#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |y| (CAR #1#) . #8#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |rec3|
                                         (SPADCALL |y| |coeff| |w| |psbf| |rk|
                                                   |rkmax| |mode|
                                                   (QREFELT $ 71))
                                         . #8#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QVELT |rec3| 2)
                                                (QREFELT $ 17))
                                      "incompatible system")
                                     ('T
                                      (SEQ
                                       (COND
                                        (|filemode|
                                         (SPADCALL |rksoln| |rec3|
                                                   (QREFELT $ 84)))
                                        ('T
                                         (LETT |lrec3| (CONS |rec3| |lrec3|)
                                               . #8#)))
                                       (EXIT
                                        (LETT |count| (+ |count| 1)
                                              . #8#)))))))
                                  (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |k| (+ |k| -1) . #8#) (GO G190) G191
                           (EXIT NIL))
                      (COND (|filemode| (SPADCALL |rksoln| (QREFELT $ 85))))
                      (EXIT (CONS |lrec3| |count|))))))))) 

(SDEFUN |PLEQN;factorset;GRL;6| ((|y| GR) ($ |List| GR))
        (SPROG ((#1=#:G240 NIL) (|j| NIL) (#2=#:G239 NIL))
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
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |j| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT (LETT #2# (CONS (QCAR |j|) #2#) . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |PLEQN;ParCondList;MNniL;7|
        ((|mat| |Matrix| GR) (|h| |NonNegativeInteger|)
         ($ |List|
          #1=(|Record| (|:| |rank| (|NonNegativeInteger|))
                       (|:| |eqns|
                            (|List|
                             (|Record| (|:| |det| GR)
                                       (|:| |rows| (|List| (|Integer|)))
                                       (|:| |cols| (|List| (|Integer|))))))
                       (|:| |fgb| #2=(|List| GR)))))
        (SPROG
         ((|rcl|
           (|List|
            (|Record| (|:| |rank| (|NonNegativeInteger|))
                      (|:| |eqns|
                           (|List|
                            (|Record| (|:| |det| GR)
                                      (|:| |rows| (|List| (|Integer|)))
                                      (|:| |cols| (|List| (|Integer|))))))
                      (|:| |fgb| (|List| GR)))))
          (|pcl| #1#) (|ps| (|List| GR)) (|done| #3=(|Boolean|))
          (|covered| #3#)
          (|npc|
           (|List|
            (|Record| (|:| |det| GR) (|:| |rows| (|List| (|Integer|)))
                      (|:| |cols| (|List| (|Integer|))))))
          (|zro| #2#)
          (|test|
           (|Record| (|:| |sysok| (|Boolean|)) (|:| |z0| (|List| GR))
                     (|:| |n0| (|List| GR))))
          (|p| (GR)) (#4=#:G258 NIL) (|rc| NIL) (#5=#:G259 NIL)
          (|maxrk| (|Integer|))
          (|pc|
           (|List|
            (|Record| (|:| |det| GR) (|:| |rows| (|List| (|Integer|)))
                      (|:| |cols| (|List| (|Integer|))))))
          (#6=#:G256 NIL) (|k| NIL) (#7=#:G257 NIL)
          (|n| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
          (|psbf| (|List| GR)))
         (SEQ (LETT |rcl| NIL . #8=(|PLEQN;ParCondList;MNniL;7|))
              (LETT |ps| NIL . #8#) (LETT |pc| NIL . #8#)
              (LETT |npc| NIL . #8#) (LETT |psbf| NIL . #8#)
              (LETT |done| NIL . #8#) (LETT |r| (ANROWS |mat|) . #8#)
              (LETT |n| (ANCOLS |mat|) . #8#)
              (LETT |maxrk| (MIN |r| |n|) . #8#)
              (SEQ (LETT #7# NIL . #8#) (LETT |k| (MIN |r| |n|) . #8#)
                   (LETT #6# |h| . #8#) G190
                   (COND ((OR (< |k| #6#) #7#) (GO G191)))
                   (SEQ (LETT |pc| (SPADCALL |mat| |k| (QREFELT $ 95)) . #8#)
                        (LETT |npc| NIL . #8#)
                        (COND
                         ((NULL |pc|)
                          (COND
                           ((>= |k| 1)
                            (EXIT (LETT |maxrk| (- |k| 1) . #8#))))))
                        (COND
                         ((SPADCALL (QVELT (SPADCALL |pc| 1 (QREFELT $ 96)) 0)
                                    (QREFELT $ 11))
                          (SEQ (LETT |npc| |pc| . #8#) (LETT |done| 'T . #8#)
                               (EXIT
                                (LETT |ps| (LIST (|spadConstant| $ 19))
                                      . #8#))))
                         ('T
                          (SEQ
                           (LETT |zro|
                                 (COND ((EQL |k| |maxrk|) NIL)
                                       ('T
                                        (QVELT
                                         (SPADCALL |rcl| 1 (QREFELT $ 82)) 2)))
                                 . #8#)
                           (LETT |covered| NIL . #8#)
                           (SEQ (LETT #5# NIL . #8#) (LETT |rc| NIL . #8#)
                                (LETT #4# |pc| . #8#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |rc| (CAR #4#) . #8#) NIL)
                                      #5#)
                                  (GO G191)))
                                (SEQ
                                 (LETT |p|
                                       (SPADCALL (QVELT |rc| 0) |zro|
                                                 (QREFELT $ 97))
                                       . #8#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |p| (|spadConstant| $ 98)
                                              (QREFELT $ 99))
                                    "incompatible or covered subdeterminant")
                                   ('T
                                    (SEQ
                                     (LETT |test|
                                           (SPADCALL |zro|
                                                     (LIST (QVELT |rc| 0))
                                                     (QREFELT $ 67))
                                           . #8#)
                                     (COND
                                      ((NULL (QVELT |test| 0))
                                       (EXIT "incompatible or covered")))
                                     (LETT |zro|
                                           (SPADCALL (CONS |p| |zro|)
                                                     (QREFELT $ 50))
                                           . #8#)
                                     (LETT |npc| (CONS |rc| |npc|) . #8#)
                                     (EXIT
                                      (LETT |done|
                                            (LETT |covered|
                                                  (SPADCALL |zro|
                                                            (QREFELT $ 13))
                                                  . #8#)
                                            . #8#)))))))
                                (LETT #4#
                                      (PROG1 (CDR #4#)
                                        (LETT #5# |covered| . #8#))
                                      . #8#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |ps| |zro| . #8#)))))
                        (LETT |pcl| (VECTOR |k| |npc| |ps|) . #8#)
                        (EXIT (LETT |rcl| (CONS |pcl| |rcl|) . #8#)))
                   (LETT |k| (PROG1 (+ |k| -1) (LETT #7# |done| . #8#)) . #8#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |rcl|)))) 

(SDEFUN |PLEQN;redpps;RLR;8|
        ((|pps| |Record|
          (|:| |partsol| (|Vector| (|Fraction| (|Polynomial| R))))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Polynomial| R))))))
         (|zz| |List| GR)
         ($ |Record|
          (|:| |partsol| #1=(|Vector| (|Fraction| (|Polynomial| R))))
          (|:| |basis| #2=(|List| (|Vector| (|Fraction| (|Polynomial| R)))))))
        (SPROG
         ((#3=#:G277 NIL) (|i| NIL)
          (|pbj| (|Vector| (|Fraction| (|Polynomial| R)))) (#4=#:G276 NIL)
          (|j| NIL) (#5=#:G275 NIL) (|denmat| #6=(|Matrix| GR)) (|nummat| #6#)
          (#7=#:G274 NIL) (#8=#:G273 NIL) (#9=#:G272 NIL)
          (|n| (|NonNegativeInteger|)) (|pb| #2#) (|r| (|NonNegativeInteger|))
          (|pv| #1#))
         (SEQ (LETT |pv| (QCAR |pps|) . #10=(|PLEQN;redpps;RLR;8|))
              (LETT |r| (QVSIZE |pv|) . #10#) (LETT |pb| (QCDR |pps|) . #10#)
              (LETT |n| (+ (LENGTH |pb|) 1) . #10#)
              (LETT |nummat| (SPADCALL |r| |n| (QREFELT $ 100)) . #10#)
              (LETT |denmat| (SPADCALL |r| |n| (QREFELT $ 100)) . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #9# |r| . #10#) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
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
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 2 . #10#) (LETT #8# |n| . #10#) G190
                   (COND ((|greater_SI| |j| #8#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1 . #10#) (LETT #7# |r| . #10#) G190
                          (COND ((|greater_SI| |i| #7#) (GO G191)))
                          (SEQ
                           (SPADCALL |nummat| |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |pb| (- |j| 1)
                                                  (QREFELT $ 104))
                                        |i| (QREFELT $ 56))
                                       (QREFELT $ 60))
                                      (QREFELT $ 64))
                                     (QREFELT $ 101))
                           (EXIT
                            (SPADCALL |denmat| |i| |j|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |pb| (- |j| 1)
                                                   (QREFELT $ 104))
                                         |i| (QREFELT $ 56))
                                        (QREFELT $ 102))
                                       (QREFELT $ 64))
                                      (QREFELT $ 101))))
                          (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |nummat| (SPADCALL |nummat| |zz| (QREFELT $ 52)) . #10#)
              (LETT |denmat| (SPADCALL |denmat| |zz| (QREFELT $ 52)) . #10#)
              (SEQ (LETT |i| 1 . #10#) (LETT #5# |r| . #10#) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |pv| |i|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |nummat| |i| 1 (QREFELT $ 105))
                                 (QREFELT $ 106))
                                (SPADCALL
                                 (SPADCALL |denmat| |i| 1 (QREFELT $ 105))
                                 (QREFELT $ 106))
                                (QREFELT $ 107))
                               (QREFELT $ 41))))
                   (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |j| 2 . #10#) (LETT #4# |n| . #10#) G190
                   (COND ((|greater_SI| |j| #4#) (GO G191)))
                   (SEQ
                    (LETT |pbj| (MAKEARR1 |r| (|spadConstant| $ 29)) . #10#)
                    (SEQ (LETT |i| 1 . #10#) (LETT #3# |r| . #10#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
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
                         (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (SPADCALL |pb| (- |j| 1) |pbj| (QREFELT $ 108))))
                   (LETT |j| (|inc_SI| |j|) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |pv| |pb|))))) 

(SDEFUN |PLEQN;dmp2rfi;MM;9|
        ((|mat| |Matrix| GR) ($ |Matrix| (|Fraction| (|Polynomial| R))))
        (SPROG
         ((#1=#:G283 NIL) (|j| NIL) (#2=#:G282 NIL) (|i| NIL)
          (|nmat| (|Matrix| (|Fraction| (|Polynomial| R))))
          (|n| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
         (SEQ (LETT |r| (ANROWS |mat|) . #3=(|PLEQN;dmp2rfi;MM;9|))
              (LETT |n| (ANCOLS |mat|) . #3#)
              (LETT |nmat| (SPADCALL |r| |n| (QREFELT $ 33)) . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |r| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# |n| . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |nmat| |i| |j|
                                      (SPADCALL
                                       (SPADCALL |mat| |i| |j| (QREFELT $ 105))
                                       (QREFELT $ 106))
                                      (QREFELT $ 35))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |nmat|)))) 

(SDEFUN |PLEQN;dmp2rfi;LL;10|
        ((|vl| |List| GR) ($ |List| (|Fraction| (|Polynomial| R))))
        (SPROG ((#1=#:G287 NIL) (|v| NIL) (#2=#:G286 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|PLEQN;dmp2rfi;LL;10|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |vl| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 106)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |PLEQN;psolve;MLL;11|
        ((|mat| |Matrix| GR) (|w| |List| GR)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (QCAR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) 1 "nofile" 1
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MLL;12|
        ((|mat| |Matrix| GR) (|w| |List| (|Symbol|))
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (QCAR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) 1 "nofile" 2
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;ML;13|
        ((|mat| |Matrix| GR)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (SPROG ((#1=#:G301 NIL) (|i| NIL) (#2=#:G300 NIL))
               (SEQ
                (QCAR
                 (SPADCALL |mat|
                           (PROGN
                            (LETT #2# NIL . #3=(|PLEQN;psolve;ML;13|))
                            (SEQ (LETT |i| 1 . #3#)
                                 (LETT #1# (ANROWS |mat|) . #3#) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|spadConstant| $ 29) #2#)
                                         . #3#)))
                                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           1 "nofile" 3 (QREFELT $ 87)))))) 

(SDEFUN |PLEQN;psolve;MLPiL;14|
        ((|mat| |Matrix| GR) (|w| |List| GR) (|h| |PositiveInteger|)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (QCAR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) |h| "nofile" 4
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MLPiL;15|
        ((|mat| |Matrix| GR) (|w| |List| (|Symbol|)) (|h| |PositiveInteger|)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (QCAR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) |h| "nofile" 5
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MPiL;16|
        ((|mat| |Matrix| GR) (|h| |PositiveInteger|)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (SPROG ((#1=#:G314 NIL) (|i| NIL) (#2=#:G313 NIL))
               (SEQ
                (QCAR
                 (SPADCALL |mat|
                           (PROGN
                            (LETT #2# NIL . #3=(|PLEQN;psolve;MPiL;16|))
                            (SEQ (LETT |i| 1 . #3#)
                                 (LETT #1# (ANROWS |mat|) . #3#) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|spadConstant| $ 29) #2#)
                                         . #3#)))
                                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |h| "nofile" 6 (QREFELT $ 87)))))) 

(SDEFUN |PLEQN;psolve;MLSI;17|
        ((|mat| |Matrix| GR) (|w| |List| GR) (|outname| |String|)
         ($ |Integer|))
        (QCDR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) 1 |outname| 7
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MLSI;18|
        ((|mat| |Matrix| GR) (|w| |List| (|Symbol|)) (|outname| |String|)
         ($ |Integer|))
        (QCDR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) 1 |outname| 8
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MSI;19|
        ((|mat| |Matrix| GR) (|outname| |String|) ($ |Integer|))
        (SPROG ((#1=#:G324 NIL) (|i| NIL) (#2=#:G323 NIL))
               (SEQ
                (QCDR
                 (SPADCALL |mat|
                           (PROGN
                            (LETT #2# NIL . #3=(|PLEQN;psolve;MSI;19|))
                            (SEQ (LETT |i| 1 . #3#)
                                 (LETT #1# (ANROWS |mat|) . #3#) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|spadConstant| $ 29) #2#)
                                         . #3#)))
                                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           1 |outname| 9 (QREFELT $ 87)))))) 

(SDEFUN |PLEQN;nextSublist;2IL;20|
        ((|n| |Integer|) (|k| |Integer|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|mslist| (|List| (|List| (|Integer|)))) (#1=#:G328 NIL) (|ms| NIL))
         (SEQ
          (COND ((SPADCALL |n| 0 (QREFELT $ 123)) NIL)
                ((SPADCALL |k| 0 (QREFELT $ 123)) (LIST NIL))
                ((SPADCALL |k| |n| (QREFELT $ 124)) NIL)
                ('T
                 (SEQ
                  (COND
                   ((EQL |n| 1) (COND ((EQL |k| 1) (EXIT (LIST (LIST 1)))))))
                  (LETT |mslist| NIL . #2=(|PLEQN;nextSublist;2IL;20|))
                  (SEQ (LETT |ms| NIL . #2#)
                       (LETT #1# (SPADCALL (- |n| 1) (- |k| 1) (QREFELT $ 126))
                             . #2#)
                       G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |ms| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |mslist|
                               (CONS (APPEND |ms| (LIST |n|)) |mslist|)
                               . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (APPEND (SPADCALL (- |n| 1) |k| (QREFELT $ 126))
                           |mslist|)))))))) 

(SDEFUN |PLEQN;psolve;MLPiSI;21|
        ((|mat| |Matrix| GR) (|w| |List| GR) (|h| |PositiveInteger|)
         (|outname| |String|) ($ |Integer|))
        (QCDR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 109)) |h| |outname| 10
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MLPiSI;22|
        ((|mat| |Matrix| GR) (|w| |List| (|Symbol|)) (|h| |PositiveInteger|)
         (|outname| |String|) ($ |Integer|))
        (QCDR
         (SPADCALL |mat| (SPADCALL |w| (QREFELT $ 113)) |h| |outname| 11
                   (QREFELT $ 87)))) 

(SDEFUN |PLEQN;psolve;MPiSI;23|
        ((|mat| |Matrix| GR) (|h| |PositiveInteger|) (|outname| |String|)
         ($ |Integer|))
        (SPROG ((#1=#:G338 NIL) (|i| NIL) (#2=#:G337 NIL))
               (SEQ
                (QCDR
                 (SPADCALL |mat|
                           (PROGN
                            (LETT #2# NIL . #3=(|PLEQN;psolve;MPiSI;23|))
                            (SEQ (LETT |i| 1 . #3#)
                                 (LETT #1# (ANROWS |mat|) . #3#) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (|spadConstant| $ 29) #2#)
                                         . #3#)))
                                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |h| |outname| 12 (QREFELT $ 87)))))) 

(SDEFUN |PLEQN;hasoln;2LR;24|
        ((|zro| |List| GR) (|nzro| |List| GR)
         ($ |Record| (|:| |sysok| (|Boolean|)) (|:| |z0| (|List| GR))
          (|:| |n0| (|List| GR))))
        (SPROG
         ((#1=#:G371 NIL) (|p| NIL) (#2=#:G370 NIL) (#3=#:G369 NIL)
          (#4=#:G368 NIL) (#5=#:G346 NIL) (#6=#:G345 (GR)) (#7=#:G347 (GR))
          (#8=#:G367 NIL) (#9=#:G106 NIL) (#10=#:G366 NIL) (|x| NIL)
          (#11=#:G365 NIL) (|psbf| (|List| (|List| GR))) (#12=#:G364 NIL)
          (#13=#:G363 NIL) (#14=#:G362 NIL) (#15=#:G361 NIL) (|pnzro| (GR))
          (#16=#:G341 NIL) (#17=#:G340 (GR)) (#18=#:G342 (GR)) (#19=#:G360 NIL)
          (#20=#:G105 NIL))
         (SEQ
          (COND ((NULL |zro|) (VECTOR 'T |zro| |nzro|))
                (#21='T
                 (SEQ
                  (LETT |zro| (SPADCALL |zro| (QREFELT $ 50))
                        . #22=(|PLEQN;hasoln;2LR;24|))
                  (EXIT
                   (COND
                    ((SPADCALL |zro| (QREFELT $ 13)) (VECTOR NIL |zro| |nzro|))
                    ((NULL |nzro|) (VECTOR 'T |zro| |nzro|))
                    (#21#
                     (SEQ
                      (LETT |pnzro|
                            (SPADCALL
                             (PROGN
                              (LETT #16# NIL . #22#)
                              (SEQ (LETT #20# NIL . #22#)
                                   (LETT #19# |nzro| . #22#) G190
                                   (COND
                                    ((OR (ATOM #19#)
                                         (PROGN
                                          (LETT #20# (CAR #19#) . #22#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (PROGN
                                      (LETT #18# #20# . #22#)
                                      (COND
                                       (#16#
                                        (LETT #17#
                                              (SPADCALL #17# #18#
                                                        (QREFELT $ 48))
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
                        ((SPADCALL |pnzro| (|spadConstant| $ 98)
                                   (QREFELT $ 99))
                         (VECTOR NIL |zro| |nzro|))
                        (#21#
                         (SEQ
                          (LETT |nzro| (SPADCALL |pnzro| (QREFELT $ 46))
                                . #22#)
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
                                               (CONS
                                                (SPADCALL |p| (QREFELT $ 46))
                                                #15#)
                                               . #22#)))
                                       (LETT #14# (CDR #14#) . #22#) (GO G190)
                                       G191 (EXIT (NREVERSE #15#))))
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
                                               (SPADCALL |x| |nzro|
                                                         (QREFELT $ 47))
                                               #13#)
                                              . #22#)))
                                      (LETT #12# (CDR #12#) . #22#) (GO G190)
                                      G191 (EXIT (NREVERSE #13#))))
                                . #22#)
                          (EXIT
                           (COND
                            ((SPADCALL NIL |psbf| (QREFELT $ 130))
                             (VECTOR NIL |zro| |nzro|))
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
                                                                       (CAR
                                                                        #8#)
                                                                       . #22#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #7# #9#
                                                                   . #22#)
                                                             (COND
                                                              (#5#
                                                               (LETT #6#
                                                                     (SPADCALL
                                                                      #6# #7#
                                                                      (QREFELT
                                                                       $ 48))
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
                                           (LETT #10# (CDR #10#) . #22#)
                                           (GO G190) G191
                                           (EXIT (NREVERSE #11#))))
                                     (QREFELT $ 50))
                                    . #22#)
                              (EXIT
                               (COND
                                ((SPADCALL |zro| (QREFELT $ 13))
                                 (VECTOR NIL |zro| |nzro|))
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
                                                     (LETT |p| (CAR #3#)
                                                           . #22#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (SPADCALL |p| |zro|
                                                                 (QREFELT $
                                                                          97))
                                                       #4#)
                                                      . #22#)))
                                              (LETT #3# (CDR #3#) . #22#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#))))
                                        . #22#)
                                  (LETT |nzro|
                                        (PROGN
                                         (LETT #2# NIL . #22#)
                                         (SEQ (LETT |p| NIL . #22#)
                                              (LETT #1# |nzro| . #22#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |p| (CAR #1#)
                                                           . #22#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL |p|
                                                             (QREFELT $ 11)))
                                                  (LETT #2# (CONS |p| #2#)
                                                        . #22#)))))
                                              (LETT #1# (CDR #1#) . #22#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        . #22#)
                                  (EXIT
                                   (VECTOR 'T |zro|
                                           |nzro|)))))))))))))))))))))))) 

(SDEFUN |PLEQN;se2rfi;LL;25|
        ((|w| |List| (|Symbol|)) ($ |List| (|Fraction| (|Polynomial| R))))
        (SPROG ((#1=#:G375 NIL) (|wi| NIL) (#2=#:G374 NIL))
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
                                (SPADCALL (|spadConstant| $ 63) |wi| 1
                                          (QREFELT $ 132))
                                (QREFELT $ 133))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |PLEQN;pr2dmp;PGR;26| ((|p| |Polynomial| R) ($ GR))
        (COND
         ((SPADCALL |p| (QREFELT $ 15))
          (SPADCALL (SPADCALL |p| (QREFELT $ 134)) (QREFELT $ 135)))
         ('T
          (|algCoerceInteractive| |p| (|Polynomial| (QREFELT $ 6))
                                  (QREFELT $ 9))))) 

(SDEFUN |PLEQN;wrregime;LSI;27|
        ((|lrec3| |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R)))))))))
         (|outname| |String|) ($ |Integer|))
        (SPROG
         ((|count| (|Integer|)) (#1=#:G383 NIL) (|rec3| NIL)
          (|rksoln|
           (|File|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector|
                                   (|Fraction| (|Polynomial| R))))))))))
          (|newfile| (|FileName|)))
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
          (SPADCALL |rksoln| (QREFELT $ 85)) (EXIT |count|)))) 

(SDEFUN |PLEQN;dmp2rfi;GRF;28| ((|p| GR) ($ |Fraction| (|Polynomial| R)))
        (SPADCALL (CONS #'|PLEQN;dmp2rfi;GRF;28!0| $)
                  (CONS #'|PLEQN;dmp2rfi;GRF;28!1| $) |p| (QREFELT $ 143))) 

(SDEFUN |PLEQN;dmp2rfi;GRF;28!1| ((|r1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |r1| (QREFELT $ 139)) (QREFELT $ 133))) 

(SDEFUN |PLEQN;dmp2rfi;GRF;28!0| ((|v1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |v1| (QREFELT $ 137)) (QREFELT $ 138))) 

(SDEFUN |PLEQN;rdregime;SL;29|
        ((|inname| |String|)
         ($ |List|
          (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                    (|:| |wcond| (|List| (|Polynomial| R)))
                    (|:| |bsoln|
                         (|Record|
                          (|:| |partsol|
                               (|Vector| (|Fraction| (|Polynomial| R))))
                          (|:| |basis|
                               (|List|
                                (|Vector| (|Fraction| (|Polynomial| R))))))))))
        (SPROG
         ((|rec3|
           (|Union|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector| (|Fraction| (|Polynomial| R))))))))
            "failed"))
          (|rksoln|
           (|List|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector|
                                   (|Fraction| (|Polynomial| R))))))))))
          (#1=#:G389 NIL)
          (|infile|
           (|File|
            (|Record| (|:| |eqzro| (|List| GR)) (|:| |neqzro| (|List| GR))
                      (|:| |wcond| (|List| (|Polynomial| R)))
                      (|:| |bsoln|
                           (|Record|
                            (|:| |partsol|
                                 (|Vector| (|Fraction| (|Polynomial| R))))
                            (|:| |basis|
                                 (|List|
                                  (|Vector|
                                   (|Fraction| (|Polynomial| R))))))))))
          (|infilename| (|FileName|)))
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
                         (|check_union2| (QEQCAR #1# 0)
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
                                         (|Union|
                                          (|Record|
                                           (|:| |eqzro| (|List| (QREFELT $ 9)))
                                           (|:| |neqzro|
                                                (|List| (QREFELT $ 9)))
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
                                          "failed")
                                         #1#))
                       |rksoln|)
                      . #2#)
                (EXIT (LETT |rec3| (SPADCALL |infile| (QREFELT $ 147)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SPADCALL |infile| (QREFELT $ 85)) (EXIT |rksoln|)))) 

(SDEFUN |PLEQN;maxrank;LNni;30|
        ((|rcl| |List|
          (|Record| (|:| |rank| #1=(|NonNegativeInteger|))
                    (|:| |eqns|
                         (|List|
                          (|Record| (|:| |det| GR)
                                    (|:| |rows| (|List| (|Integer|)))
                                    (|:| |cols| (|List| (|Integer|))))))
                    (|:| |fgb| (|List| GR))))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G397 NIL) (#3=#:G396 #1#) (#4=#:G398 #1#) (#5=#:G401 NIL)
          (|j| NIL))
         (SEQ
          (COND ((NULL |rcl|) 0)
                (#6='T
                 (PROGN
                  (LETT #2# NIL . #7=(|PLEQN;maxrank;LNni;30|))
                  (SEQ (LETT |j| NIL . #7#) (LETT #5# |rcl| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |j| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (QVELT |j| 0) . #7#)
                          (COND (#2# (LETT #3# (MAX #3# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #3# #4# . #7#)
                                  (LETT #2# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |PLEQN;minrank;LNni;31|
        ((|rcl| |List|
          (|Record| (|:| |rank| #1=(|NonNegativeInteger|))
                    (|:| |eqns|
                         (|List|
                          (|Record| (|:| |det| GR)
                                    (|:| |rows| (|List| (|Integer|)))
                                    (|:| |cols| (|List| (|Integer|))))))
                    (|:| |fgb| (|List| GR))))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#2=#:G404 NIL) (#3=#:G403 #1#) (#4=#:G405 #1#) (#5=#:G408 NIL)
          (|j| NIL))
         (SEQ
          (COND ((NULL |rcl|) 0)
                (#6='T
                 (PROGN
                  (LETT #2# NIL . #7=(|PLEQN;minrank;LNni;31|))
                  (SEQ (LETT |j| NIL . #7#) (LETT #5# |rcl| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |j| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (QVELT |j| 0) . #7#)
                          (COND (#2# (LETT #3# (MIN #3# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #3# #4# . #7#)
                                  (LETT #2# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) (#6# (|IdentityError| '|min|))))))))) 

(SDEFUN |PLEQN;minset;2L;32|
        ((|lset| |List| (|List| GR)) ($ |List| (|List| GR)))
        (SPROG ((#1=#:G414 NIL) (|x| NIL) (#2=#:G413 NIL))
               (SEQ
                (COND ((NULL |lset|) |lset|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|PLEQN;minset;2L;32|))
                        (SEQ (LETT |x| NIL . #3#) (LETT #1# |lset| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |x| |lset| (QREFELT $ 149)))
                                 (LETT #2# (CONS |x| #2#) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |PLEQN;sqfree;2GR;33| ((|p| GR) ($ GR))
        (SPROG
         ((#1=#:G417 NIL) (#2=#:G416 (GR)) (#3=#:G418 (GR)) (#4=#:G420 NIL)
          (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|PLEQN;sqfree;2GR;33|))
           (SEQ (LETT |j| NIL . #5#)
                (LETT #4#
                      (SPADCALL (SPADCALL |p| (QREFELT $ 151)) (QREFELT $ 93))
                      . #5#)
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# (QCAR |j|) . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 48)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 19))))))) 

(SDEFUN |PLEQN;ParCond;MNniL;34|
        ((|mat| |Matrix| GR) (|k| . #1=(|NonNegativeInteger|))
         ($ |List|
          #2=(|Record| (|:| |det| GR) (|:| |rows| (|List| (|Integer|)))
                       (|:| |cols| (|List| (|Integer|))))))
        (SPROG
         ((|DetEqn|
           (|List|
            (|Record| (|:| |det| GR) (|:| |rows| (|List| (|Integer|)))
                      (|:| |cols| (|List| (|Integer|))))))
          (|neweqn| #2#) (|detmat| (GR)) (|found| (|Boolean|))
          (|matsub| (|SquareMatrix| |j| GR)) (#3=#:G433 NIL) (|nss| NIL)
          (#4=#:G434 NIL) (#5=#:G431 NIL) (|rss| NIL) (#6=#:G432 NIL)
          (|n| (|Integer|)) (|r| (|Integer|)) (|j| #1#))
         (SEQ
          (COND ((EQL |k| 0) (LIST (VECTOR (|spadConstant| $ 19) NIL NIL)))
                (#7='T
                 (SEQ (LETT |j| |k| . #8=(|PLEQN;ParCond;MNniL;34|))
                      (LETT |DetEqn| NIL . #8#) (LETT |r| (ANROWS |mat|) . #8#)
                      (LETT |n| (ANCOLS |mat|) . #8#)
                      (EXIT
                       (COND
                        ((SPADCALL |k| (MIN |r| |n|) (QREFELT $ 124))
                         (|error| "k exceeds maximum possible rank "))
                        (#7#
                         (SEQ (LETT |found| NIL . #8#)
                              (SEQ (LETT #6# NIL . #8#) (LETT |rss| NIL . #8#)
                                   (LETT #5# (SPADCALL |r| |k| (QREFELT $ 126))
                                         . #8#)
                                   G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |rss| (CAR #5#) . #8#)
                                          NIL)
                                         #6#)
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT #4# NIL . #8#)
                                          (LETT |nss| NIL . #8#)
                                          (LETT #3#
                                                (SPADCALL |n| |k|
                                                          (QREFELT $ 126))
                                                . #8#)
                                          G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |nss| (CAR #3#) . #8#)
                                                 NIL)
                                                #4#)
                                            (GO G191)))
                                          (SEQ
                                           (LETT |matsub|
                                                 (SPADCALL |mat| |rss| |nss|
                                                           (QREFELT $ 153))
                                                 . #8#)
                                           (LETT |detmat|
                                                 (SPADCALL |matsub|
                                                           (|compiledLookupCheck|
                                                            '|determinant|
                                                            (LIST
                                                             (|devaluate|
                                                              (ELT $ 9))
                                                             '$)
                                                            (|SquareMatrix| |j|
                                                                            (ELT
                                                                             $
                                                                             9))))
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |detmat|
                                                        (|spadConstant| $ 98)
                                                        (QREFELT $ 154))
                                              (SEQ
                                               (LETT |found|
                                                     (SPADCALL |detmat|
                                                               (QREFELT $ 11))
                                                     . #8#)
                                               (LETT |detmat|
                                                     (SPADCALL |detmat|
                                                               (QREFELT $ 152))
                                                     . #8#)
                                               (LETT |neweqn|
                                                     (VECTOR |detmat| |rss|
                                                             |nss|)
                                                     . #8#)
                                               (EXIT
                                                (LETT |DetEqn|
                                                      (CONS |neweqn| |DetEqn|)
                                                      . #8#)))))))
                                          (LETT #3#
                                                (PROG1 (CDR #3#)
                                                  (LETT #4# |found| . #8#))
                                                . #8#)
                                          (GO G190) G191 (EXIT NIL))))
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# |found| . #8#))
                                         . #8#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND (|found| (LIST (|SPADfirst| |DetEqn|)))
                                     (#7#
                                      (SPADCALL
                                       (CONS #'|PLEQN;ParCond;MNniL;34!0| $)
                                       |DetEqn| (QREFELT $ 158))))))))))))))) 

(SDEFUN |PLEQN;ParCond;MNniL;34!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (SPADCALL (QVELT |z1| 0) (QREFELT $ 155))
                  (SPADCALL (QVELT |z2| 0) (QREFELT $ 155)) (QREFELT $ 156))) 

(SDEFUN |PLEQN;overset?;LLB;35|
        ((|p| |List| GR) (|qlist| |List| (|List| GR)) ($ |Boolean|))
        (SPROG
         ((#1=#:G436 NIL) (#2=#:G435 #3=(|Boolean|)) (#4=#:G437 #3#)
          (#5=#:G440 NIL) (|q| NIL))
         (SEQ
          (COND ((NULL |qlist|) NIL)
                (#6='T
                 (PROGN
                  (LETT #1# NIL . #7=(|PLEQN;overset?;LLB;35|))
                  (SEQ (LETT |q| NIL . #7#) (LETT #5# |qlist| . #7#) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL (SPADCALL |q| (QREFELT $ 160))
                                          (SPADCALL |p| (QREFELT $ 160))
                                          (QREFELT $ 161))
                                . #7#)
                          (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |PLEQN;redmat;MLM;36|
        ((|mat| |Matrix| GR) (|psb| |List| GR) ($ |Matrix| GR))
        (SPROG
         ((|p| (GR)) (#1=#:G447 NIL) (|j| NIL) (#2=#:G446 NIL) (|i| NIL)
          (|newmat| (|Matrix| GR)) (|n| (|NonNegativeInteger|))
          (|r| (|NonNegativeInteger|)))
         (SEQ (LETT |r| (ANROWS |mat|) . #3=(|PLEQN;redmat;MLM;36|))
              (LETT |n| (ANCOLS |mat|) . #3#)
              (LETT |newmat| (SPADCALL |r| |n| (QREFELT $ 100)) . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |r| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# |n| . #3#) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (LETT |p| (SPADCALL |mat| |i| |j| (QREFELT $ 105))
                                 . #3#)
                           (EXIT
                            (COND
                             ((SPADCALL |p| (QREFELT $ 11))
                              (SPADCALL |newmat| |i| |j| |p| (QREFELT $ 101)))
                             ('T
                              (SPADCALL |newmat| |i| |j|
                                        (SPADCALL |p| |psb| (QREFELT $ 97))
                                        (QREFELT $ 101))))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |newmat|)))) 

(DECLAIM (NOTINLINE |ParametricLinearEquations;|)) 

(DEFUN |ParametricLinearEquations| (&REST #1=#:G448)
  (SPROG NIL
         (PROG (#2=#:G449)
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
                  (HREM |$ConstructorCache|
                        '|ParametricLinearEquations|)))))))))) 

(DEFUN |ParametricLinearEquations;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricLinearEquations|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|ParametricLinearEquations| DV$1 DV$2 DV$3 DV$4) . #1#)
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
    $))) 

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
              (59 . |elt|) (66 . |setelt!|) (74 . -) (|List| 28) (79 . |elt|)
              (85 . |rowEchelon|) (|Vector| 28) (90 . |setelt!|) (97 . |One|)
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
              (227 . =) (233 . |zero|) (239 . |setelt!|) (247 . |denom|)
              (|List| 40) (252 . |elt|) (258 . |elt|) |PLEQN;dmp2rfi;GRF;28|
              (265 . /) (271 . |setelt!|) |PLEQN;dmp2rfi;LL;10| (|List| 68)
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
