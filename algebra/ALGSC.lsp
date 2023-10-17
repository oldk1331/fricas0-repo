
(SDEFUN |ALGSC;recip;%U;1| ((|x| (%)) (% (|Union| % "failed")))
        (SPADCALL |x| (QREFELT % 13))) 

(SDEFUN |ALGSC;*;Sm2%;2| ((|m| (|SquareMatrix| |n| R)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |m| (QREFELT % 17)) |x| (QREFELT % 18))) 

(SDEFUN |ALGSC;coerce;V%;3| ((|v| (|Vector| R)) (% (%)))
        (SPADCALL |v| (QREFELT % 21))) 

(SDEFUN |ALGSC;structuralConstants;V;4| ((% (|Vector| (|Matrix| R))))
        (QREFELT % 9)) 

(SDEFUN |ALGSC;coordinates;%V;5| ((|x| (%)) (% (|Vector| R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 27))) 

(SDEFUN |ALGSC;coordinates;%VV;6|
        ((|x| (%)) (|b| (|Vector| %)) (% (|Vector| R)))
        (SPROG
         ((|res| (|Union| (|Vector| R) "failed")) (#1=#:G139 NIL) (|i| NIL)
          (|transitionMatrix| (|Matrix| R)) (|m| (|NonNegativeInteger|))
          (#2=#:G131 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #2# (SPADCALL |b| (QREFELT % 31)))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |transitionMatrix|
                (MAKE_MATRIX1 (QREFELT % 7) |m| (|spadConstant| % 32)))
          (SEQ (LETT |i| 1) (LETT #1# |m|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |transitionMatrix| |i|
                           (SPADCALL (SPADCALL |b| |i| (QREFELT % 33))
                                     (QREFELT % 28))
                           (QREFELT % 34))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (SPADCALL |transitionMatrix| (SPADCALL |x| (QREFELT % 28))
                          (QREFELT % 37)))
          (EXIT
           (COND
            ((QEQCAR |res| 1) (|error| "coordinates: solveUniquely failed"))
            ('T (QCDR |res|))))))) 

(SDEFUN |ALGSC;basis;V;7| ((% (|Vector| %)))
        (SPROG
         ((#1=#:G142 NIL) (#2=#:G145 NIL) (#3=#:G147 NIL) (|i| NIL)
          (#4=#:G146 NIL))
         (SEQ
          (PROGN
           (LETT #4# (GETREFV #5=(QREFELT % 7)))
           (SEQ (LETT |i| 1) (LETT #3# #5#) (LETT #2# 0) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #4# #2#
                          (SPADCALL
                           (PROG1 (LETT #1# |i|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|NonNegativeInteger|) #1#))
                           (QREFELT % 41)))))
                (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #4#)))) 

(SDEFUN |ALGSC;someBasis;V;8| ((% (|Vector| %))) (SPADCALL (QREFELT % 42))) 

(SDEFUN |ALGSC;rank;Pi;9| ((% (|PositiveInteger|))) (QREFELT % 7)) 

(SDEFUN |ALGSC;elt;%IR;10| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (SPADCALL |x| |i| (QREFELT % 45))) 

(SDEFUN |ALGSC;coerce;%Of;11| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G159 NIL) (|le| (|List| (|OutputForm|))) (|coef| (R))
          (#2=#:G160 NIL) (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 48))
            (SPADCALL (|spadConstant| % 32) (QREFELT % 50)))
           ('T
            (SEQ (LETT |le| NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT % 46)))
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |coef| (QREFELT % 51)))
                                (PROGN
                                 (LETT #1#
                                       (COND
                                        ((SPADCALL |coef| (|spadConstant| % 52)
                                                   (QREFELT % 53))
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL (QREFELT % 8) |i|
                                                           (QREFELT % 56))
                                                 (QREFELT % 57))
                                                |le|)))
                                        ('T
                                         (LETT |le|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |coef|
                                                           (QREFELT % 50))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 8) |i|
                                                            (QREFELT % 56))
                                                  (QREFELT % 57))
                                                 (QREFELT % 58))
                                                |le|)))))
                                 (GO #3=#:G152)))))))
                       #3# (EXIT #1#))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (ELT % 59) |le| (QREFELT % 62))))))))) 

(SDEFUN |ALGSC;*;3%;12| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|h| (R)) (#1=#:G172 NIL) (|j| NIL) (#2=#:G171 NIL) (|i| NIL)
          (#3=#:G170 NIL) (|k| NIL) (|v| (|Vector| R)))
         (SEQ (LETT |v| (MAKEARR1 (QREFELT % 7) (|spadConstant| % 32)))
              (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |h| (|spadConstant| % 32))
                        (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |j| 1) (LETT #1# (QREFELT % 7)) G190
                                    (COND ((|greater_SI| |j| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |h|
                                            (SPADCALL |h|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |x| |i|
                                                                  (QREFELT %
                                                                           46))
                                                        (SPADCALL |y| |j|
                                                                  (QREFELT %
                                                                           46))
                                                        (QREFELT % 64))
                                                       (SPADCALL
                                                        (SPADCALL (QREFELT % 9)
                                                                  |k|
                                                                  (QREFELT %
                                                                           65))
                                                        |i| |j| (QREFELT % 66))
                                                       (QREFELT % 64))
                                                      (QREFELT % 67)))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (SPADCALL |v| |k| |h| (QREFELT % 68))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |v| (QREFELT % 21)))))) 

(SDEFUN |ALGSC;alternative?;B;13| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G214 NIL) (#2=#:G218 NIL) (|res| (R)) (#3=#:G232 NIL) (|l| NIL)
          (#4=#:G231 NIL) (|r| NIL) (#5=#:G215 NIL) (#6=#:G230 NIL)
          (#7=#:G229 NIL) (#8=#:G228 NIL) (|k| NIL) (#9=#:G216 NIL)
          (#10=#:G227 NIL) (#11=#:G226 NIL) (#12=#:G225 NIL) (#13=#:G224 NIL)
          (|j| NIL) (#14=#:G217 NIL) (#15=#:G223 NIL) (#16=#:G222 NIL)
          (#17=#:G221 NIL) (#18=#:G220 NIL) (#19=#:G219 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #19# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #19#) (GO G191)))
                 (SEQ
                  (SEQ (LETT |j| 1) (LETT #18# (SPADCALL |i| 1 (QREFELT % 71)))
                       G190 (COND ((|greater_SI| |j| #18#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k| |j|) (LETT #17# (QREFELT % 7)) G190
                              (COND ((> |k| #17#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #16# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #16#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 32))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #15# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #15#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |j| |k|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |k| |j|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 65))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       % 66))
                                                                     (QREFELT %
                                                                              64))
                                                                    (QREFELT %
                                                                             72))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |i| |j|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |l| |k|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |i| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |l| |j|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67))
                                                          (QREFELT % 67)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 51)))
                                               (PROGN
                                                (LETT #14#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not right alternative"
                                                        (QREFELT % 75))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20=#:G213)))))
                                                (GO #21=#:G180)))))))
                                      #21# (EXIT #14#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #13# (QREFELT % 7)) G190
                        (COND ((> |j| #13#) (GO G191)))
                        (SEQ
                         (SEQ (LETT |k| 1)
                              (LETT #12# (SPADCALL |j| 1 (QREFELT % 71))) G190
                              (COND ((|greater_SI| |k| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |r| 1) (LETT #11# (QREFELT % 7))
                                     G190
                                     (COND ((|greater_SI| |r| #11#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 32))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #10# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #10#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 65))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 66))
                                                                     (QREFELT %
                                                                              64))
                                                                    (QREFELT %
                                                                             67))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |j| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |i| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |i| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |j| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67))
                                                          (QREFELT % 72)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 51)))
                                               (PROGN
                                                (LETT #9#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not left alternative"
                                                        (QREFELT % 75))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20#)))))
                                                (GO #22=#:G190)))))))
                                      #22# (EXIT #9#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))))
                              (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #8# (QREFELT % 7)) G190
                               (COND ((> |k| #8#) (GO G191)))
                               (SEQ
                                (SEQ (LETT |r| 1) (LETT #7# (QREFELT % 7)) G190
                                     (COND ((|greater_SI| |r| #7#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SEQ (LETT |res| (|spadConstant| % 32))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #6# (QREFELT % 7)) G190
                                                 (COND
                                                  ((|greater_SI| |l| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |res|
                                                         (SPADCALL
                                                          (SPADCALL |res|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |j| |i|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        % 65))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       % 66))
                                                                     (QREFELT %
                                                                              64))
                                                                    (QREFELT %
                                                                             67))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |j| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |i| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |i| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |j| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67))
                                                          (QREFELT % 72)))))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |res|
                                                          (QREFELT % 51)))
                                               (PROGN
                                                (LETT #5#
                                                      (SEQ
                                                       (SPADCALL
                                                        "algebra is not left alternative"
                                                        (QREFELT % 75))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #2# NIL)
                                                         (GO #20#)))))
                                                (GO #23=#:G198)))))))
                                      #23# (EXIT #5#))
                                     (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (QREFELT
                                                                        % 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              72))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |j|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |k|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |k|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |j|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (QREFELT % 67)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not right alternative"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #20#)))))
                                                 (GO #24=#:G204)))))))
                                       #24# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL
             "algebra satisfies 2*associator(a,b,b) = 0 = 2*associator(a,a,b) = 0"
             (QREFELT % 75))
            (EXIT 'T)))
          #20# (EXIT #2#)))) 

(SDEFUN |ALGSC;associative?;B;14| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G247 NIL) (#2=#:G248 NIL) (|res| (R)) (#3=#:G253 NIL) (|l| NIL)
          (#4=#:G252 NIL) (|r| NIL) (#5=#:G251 NIL) (|k| NIL) (#6=#:G250 NIL)
          (|j| NIL) (#7=#:G249 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |j| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |i| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 72)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not associative"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G246)))))
                                                 (GO #9=#:G240)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is associative" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiAssociative?;B;15| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G268 NIL) (#2=#:G269 NIL) (|res| (R)) (#3=#:G274 NIL) (|l| NIL)
          (#4=#:G273 NIL) (|r| NIL) (#5=#:G272 NIL) (|k| NIL) (#6=#:G271 NIL)
          (|j| NIL) (#7=#:G270 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |j|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |j| |k|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |i| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not anti-associative"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G267)))))
                                                 (GO #9=#:G261)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is anti-associative" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;commutative?;B;16| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G285 NIL) (#2=#:G286 NIL) (#3=#:G289 NIL) (|k| NIL)
          (#4=#:G288 NIL) (|j| NIL) (#5=#:G287 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (+ |i| 1)) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 65))
                                      |i| |j| (QREFELT % 66))
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 9) |k|
                                                (QREFELT % 65))
                                      |j| |i| (QREFELT % 66))
                                     (QREFELT % 53)))
                                   (PROGN
                                    (LETT #1#
                                          (SEQ
                                           (SPADCALL
                                            "algebra is not commutative"
                                            (QREFELT % 75))
                                           (EXIT
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #6=#:G284)))))
                                    (GO #7=#:G280))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is commutative" (QREFELT % 75)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;antiCommutative?;B;17| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G300 NIL) (#2=#:G301 NIL) (#3=#:G304 NIL) (|k| NIL)
          (#4=#:G303 NIL) (|j| NIL) (#5=#:G302 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #4# (QREFELT % 7)) G190
                        (COND ((> |j| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (COND
                                      ((EQL |i| |j|)
                                       (SPADCALL
                                        (SPADCALL (QREFELT % 9) |k|
                                                  (QREFELT % 65))
                                        |i| |i| (QREFELT % 66)))
                                      ('T
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 65))
                                         |i| |j| (QREFELT % 66))
                                        (SPADCALL
                                         (SPADCALL (QREFELT % 9) |k|
                                                   (QREFELT % 65))
                                         |j| |i| (QREFELT % 66))
                                        (QREFELT % 67))))
                                     (QREFELT % 51)))
                                   (PROGN
                                    (LETT #1#
                                          (SEQ
                                           (SPADCALL
                                            "algebra is not anti-commutative"
                                            (QREFELT % 75))
                                           (EXIT
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #6=#:G299)))))
                                    (GO #7=#:G295))))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL)))
                         #7# (EXIT #1#))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is anti-commutative" (QREFELT % 75)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |ALGSC;leftAlternative?;B;18| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G319 NIL) (#2=#:G320 NIL) (|res| (R)) (#3=#:G325 NIL) (|l| NIL)
          (#4=#:G324 NIL) (|r| NIL) (#5=#:G323 NIL) (|k| NIL) (#6=#:G322 NIL)
          (|j| NIL) (#7=#:G321 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| |i|) (LETT #6# (QREFELT % 7)) G190
                        (COND ((> |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |j| |i|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (QREFELT
                                                                        % 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |l| |k|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |j| |k|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |i| |l|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |k|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |j| |l|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (QREFELT % 72)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not left alternative"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G318)))))
                                                 (GO #9=#:G312)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is left alternative" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;rightAlternative?;B;19| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G340 NIL) (#2=#:G341 NIL) (|res| (R)) (#3=#:G346 NIL) (|l| NIL)
          (#4=#:G345 NIL) (|r| NIL) (#5=#:G344 NIL) (|k| NIL) (#6=#:G343 NIL)
          (|j| NIL) (#7=#:G342 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |j|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL |res|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (QREFELT
                                                                        % 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         % 65))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 66))
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              72))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |j|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |k|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |k|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |j|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (QREFELT % 67)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not right alternative"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G339)))))
                                                 (GO #9=#:G333)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is right alternative" (QREFELT % 75))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;flexible?;B;20| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G361 NIL) (#2=#:G362 NIL) (|res| (R)) (#3=#:G367 NIL) (|l| NIL)
          (#4=#:G366 NIL) (|r| NIL) (#5=#:G365 NIL) (|k| NIL) (#6=#:G364 NIL)
          (|j| NIL) (#7=#:G363 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| |i|) (LETT #5# (QREFELT % 7)) G190
                               (COND ((> |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |res|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (QREFELT
                                                                         % 64))
                                                                       (QREFELT
                                                                        % 67))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 65))
                                                               |j| |k|
                                                               (QREFELT % 66))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 65))
                                                               |i| |l|
                                                               (QREFELT % 66))
                                                              (QREFELT % 64))
                                                             (QREFELT % 72))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |k| |j|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |i|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |l|
                                                              (QREFELT % 65))
                                                             |j| |i|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |k| |l|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 72)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not flexible"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G360)))))
                                                 (GO #9=#:G354)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (+ |k| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is flexible" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;lieAdmissible?;B;21| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G382 NIL) (#2=#:G383 NIL) (|res| (R)) (#3=#:G388 NIL) (|l| NIL)
          (#4=#:G387 NIL) (|r| NIL) (#5=#:G386 NIL) (|k| NIL) (#6=#:G385 NIL)
          (|j| NIL) (#7=#:G384 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |l| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |i|
                                                                         |j|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |j|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (QREFELT
                                                                         % 72))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |l|
                                                                         |k|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |k|
                                                                         |l|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (QREFELT
                                                                         % 72))
                                                                       (QREFELT
                                                                        % 64))
                                                                      (QREFELT
                                                                       % 67))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 65))
                                                               |j| |k|
                                                               (QREFELT % 66))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |l|
                                                                (QREFELT % 65))
                                                               |k| |j|
                                                               (QREFELT % 66))
                                                              (QREFELT % 72))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 65))
                                                               |l| |i|
                                                               (QREFELT % 66))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT % 9)
                                                                |r|
                                                                (QREFELT % 65))
                                                               |i| |l|
                                                               (QREFELT % 66))
                                                              (QREFELT % 72))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |k| |i|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |l|
                                                               (QREFELT % 65))
                                                              |i| |k|
                                                              (QREFELT % 66))
                                                             (QREFELT % 72))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |l| |j|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |j| |l|
                                                              (QREFELT % 66))
                                                             (QREFELT % 72))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "algebra is not Lie admissible"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G381)))))
                                                 (GO #9=#:G375)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "algebra is Lie admissible" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAdmissible?;B;22| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G412 NIL) (#2=#:G413 NIL) (|res| (R)) (#3=#:G420 NIL) (|r| NIL)
          (#4=#:G419 NIL) (|l| NIL) (#5=#:G418 NIL) (|t| NIL) (#6=#:G417 NIL)
          (|w| NIL) (#7=#:G416 NIL) (|k| NIL) (#8=#:G415 NIL) (|j| NIL)
          (#9=#:G414 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 52) (QREFELT % 85))
                        (QREFELT % 86))
              1)
             (SEQ
              (SPADCALL
               "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
               (QREFELT % 75))
              (EXIT NIL)))
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |w| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |w| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |res|
                                                        (|spadConstant| % 32))
                                                  (SEQ (LETT |l| 1)
                                                       (LETT #4# (QREFELT % 7))
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |l| #4#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (SEQ (LETT |r| 1)
                                                              (LETT #3#
                                                                    (QREFELT %
                                                                             7))
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |r| #3#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  65))
                                                                                |i|
                                                                                |j|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  65))
                                                                                |j|
                                                                                |i|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (QREFELT
                                                                                %
                                                                                67))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  65))
                                                                                |w|
                                                                                |k|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (QREFELT
                                                                                  %
                                                                                  9)
                                                                                 |r|
                                                                                 (QREFELT
                                                                                  %
                                                                                  65))
                                                                                |k|
                                                                                |w|
                                                                                (QREFELT
                                                                                 %
                                                                                 66))
                                                                               (QREFELT
                                                                                %
                                                                                67))
                                                                              (QREFELT
                                                                               %
                                                                               64))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |l|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |t|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |r|
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (QREFELT
                                                                               %
                                                                               67))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (QREFELT
                                                                             %
                                                                             67))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |w|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |k|
                                                                               |w|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (QREFELT
                                                                               %
                                                                               67))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |j|
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |r|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (QREFELT
                                                                               %
                                                                               67))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |i|
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |l|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (QREFELT
                                                                              %
                                                                              67))
                                                                            (QREFELT
                                                                             %
                                                                             64))
                                                                           (QREFELT
                                                                            %
                                                                            72))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |w|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |l|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |j|
                                                                              |w|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (QREFELT
                                                                              %
                                                                              67))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |k|
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |i|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (QREFELT
                                                                              %
                                                                              67))
                                                                            (QREFELT
                                                                             %
                                                                             64))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |l|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |r|
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             67))
                                                                           (QREFELT
                                                                            %
                                                                            64))
                                                                          (QREFELT
                                                                           %
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |k|
                                                                             |i|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             67))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |j|
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |l|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |r|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             67))
                                                                           (QREFELT
                                                                            %
                                                                            64))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |w|
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |l|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            67))
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |k|
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |j|
                                                                            |k|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            67))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |i|
                                                                            |w|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |w|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            67))
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |l|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |r|
                                                                           |l|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (QREFELT
                                                                           %
                                                                           67))
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                                        (QREFELT
                                                                         % 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |i|
                                                                           |w|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |w|
                                                                           |i|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (QREFELT
                                                                           %
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |j|
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |r|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (QREFELT
                                                                           %
                                                                           67))
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            65))
                                                                          |k|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            65))
                                                                          |l|
                                                                          |k|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (QREFELT
                                                                          %
                                                                          67))
                                                                        (QREFELT
                                                                         % 64))
                                                                       (QREFELT
                                                                        %
                                                                        72)))))
                                                              (LETT |r|
                                                                    (|inc_SI|
                                                                     |r|))
                                                              (GO G190) G191
                                                              (EXIT NIL))))
                                                       (LETT |l|
                                                             (|inc_SI| |l|))
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |res|
                                                                (QREFELT %
                                                                         51)))
                                                     (PROGN
                                                      (LETT #1#
                                                            (SEQ
                                                             (SPADCALL
                                                              "algebra is not Jordan admissible"
                                                              (QREFELT % 75))
                                                             (EXIT
                                                              (PROGN
                                                               (LETT #2# NIL)
                                                               (GO
                                                                #10=#:G411)))))
                                                      (GO #11=#:G403)))))))
                                                #11# (EXIT #1#))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |w| (|inc_SI| |w|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL "algebra is Jordan admissible" (QREFELT % 75))
              (EXIT 'T)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jordanAlgebra?;B;23| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G446 NIL) (#2=#:G447 NIL) (|res| (R)) (#3=#:G454 NIL) (|s| NIL)
          (#4=#:G453 NIL) (|r| NIL) (#5=#:G452 NIL) (|t| NIL) (#6=#:G451 NIL)
          (|l| NIL) (#7=#:G450 NIL) (|k| NIL) (#8=#:G449 NIL) (|j| NIL)
          (#9=#:G448 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL (SPADCALL 2 (|spadConstant| % 52) (QREFELT % 85))
                        (QREFELT % 86))
              1)
             (SEQ
              (SPADCALL
               "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
               (QREFELT % 75))
              (EXIT NIL)))
            ((SPADCALL (QREFELT % 79))
             (SEQ
              (SEQ (LETT |i| 1) (LETT #9# (QREFELT % 7)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# (QREFELT % 7)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 7)) G190
                                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |l| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |l| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |t| 1)
                                               (LETT #5# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |t| #5#)
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |res|
                                                      (|spadConstant| % 32))
                                                (EXIT
                                                 (SEQ (LETT |r| 1)
                                                      (LETT #4# (QREFELT % 7))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |r| #4#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ (LETT |s| 1)
                                                             (LETT #3#
                                                                   (QREFELT %
                                                                            7))
                                                             G190
                                                             (COND
                                                              ((|greater_SI|
                                                                |s| #3#)
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (SEQ
                                                                (LETT |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |res|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |r|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |i|
                                                                               |j|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (QREFELT
                                                                                 %
                                                                                 9)
                                                                                |s|
                                                                                (QREFELT
                                                                                 %
                                                                                 65))
                                                                               |l|
                                                                               |k|
                                                                               (QREFELT
                                                                                %
                                                                                66))
                                                                              (QREFELT
                                                                               %
                                                                               64))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |t|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |r|
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (QREFELT
                                                                             %
                                                                             67))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |r|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |l|
                                                                              |k|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (QREFELT
                                                                                %
                                                                                9)
                                                                               |s|
                                                                               (QREFELT
                                                                                %
                                                                                65))
                                                                              |j|
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               66))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |t|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |i|
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             64))
                                                                           (QREFELT
                                                                            %
                                                                            72))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |r|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |l|
                                                                             |j|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (QREFELT
                                                                               %
                                                                               9)
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               65))
                                                                             |k|
                                                                             |k|
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             64))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |t|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |r|
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            64))
                                                                          (QREFELT
                                                                           %
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |k|
                                                                            |i|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             |s|
                                                                             (QREFELT
                                                                              %
                                                                              65))
                                                                            |j|
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             66))
                                                                           (QREFELT
                                                                            %
                                                                            64))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |l|
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |k|
                                                                           |j|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            |s|
                                                                            (QREFELT
                                                                             %
                                                                             65))
                                                                           |i|
                                                                           |k|
                                                                           (QREFELT
                                                                            %
                                                                            66))
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            %
                                                                            65))
                                                                          |r|
                                                                          |s|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                                        (QREFELT
                                                                         % 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            %
                                                                            65))
                                                                          |i|
                                                                          |l|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            %
                                                                            9)
                                                                           |s|
                                                                           (QREFELT
                                                                            %
                                                                            65))
                                                                          |j|
                                                                          |r|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           % 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           %
                                                                           65))
                                                                         |k|
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          66))
                                                                        (QREFELT
                                                                         % 64))
                                                                       (QREFELT
                                                                        % 72)))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    (SPADCALL
                                                                     |res|
                                                                     (QREFELT %
                                                                              51)))
                                                                   (PROGN
                                                                    (LETT #1#
                                                                          (SEQ
                                                                           (SPADCALL
                                                                            "this is not a Jordan algebra"
                                                                            (QREFELT
                                                                             %
                                                                             75))
                                                                           (EXIT
                                                                            (PROGN
                                                                             (LETT
                                                                              #2#
                                                                              NIL)
                                                                             (GO
                                                                              #10=#:G445)))))
                                                                    (GO
                                                                     #11=#:G433)))))))
                                                              #11# (EXIT #1#))
                                                             (LETT |s|
                                                                   (|inc_SI|
                                                                    |s|))
                                                             (GO G190) G191
                                                             (EXIT NIL))))
                                                      (LETT |r| (|inc_SI| |r|))
                                                      (GO G190) G191
                                                      (EXIT NIL))))
                                               (LETT |t| (|inc_SI| |t|))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |l| (|inc_SI| |l|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SPADCALL "this is a Jordan algebra" (QREFELT % 75)) (EXIT 'T)))
            ('T
             (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT % 75))
                  (EXIT NIL)))))
          #10# (EXIT #2#)))) 

(SDEFUN |ALGSC;jacobiIdentity?;B;24| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G469 NIL) (#2=#:G470 NIL) (|res| (R)) (#3=#:G475 NIL) (|s| NIL)
          (#4=#:G474 NIL) (|r| NIL) (#5=#:G473 NIL) (|k| NIL) (#6=#:G472 NIL)
          (|j| NIL) (#7=#:G471 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 1) (LETT #7# (QREFELT % 7)) G190
                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 7)) G190
                        (COND ((|greater_SI| |j| #6#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k| 1) (LETT #5# (QREFELT % 7)) G190
                               (COND ((|greater_SI| |k| #5#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |r| 1) (LETT #4# (QREFELT % 7))
                                      G190
                                      (COND ((|greater_SI| |r| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ (LETT |res| (|spadConstant| % 32))
                                             (SEQ (LETT |s| 1)
                                                  (LETT #3# (QREFELT % 7)) G190
                                                  (COND
                                                   ((|greater_SI| |s| #3#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |res|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |res|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |s|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |i| |j|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          % 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          %
                                                                          65))
                                                                        |s| |k|
                                                                        (QREFELT
                                                                         % 66))
                                                                       (QREFELT
                                                                        % 64))
                                                                      (QREFELT
                                                                       % 67))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |s|
                                                               (QREFELT % 65))
                                                              |j| |k|
                                                              (QREFELT % 66))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 9)
                                                               |r|
                                                               (QREFELT % 65))
                                                              |s| |i|
                                                              (QREFELT % 66))
                                                             (QREFELT % 64))
                                                            (QREFELT % 67))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |s|
                                                              (QREFELT % 65))
                                                             |k| |i|
                                                             (QREFELT % 66))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 9) |r|
                                                              (QREFELT % 65))
                                                             |s| |j|
                                                             (QREFELT % 66))
                                                            (QREFELT % 64))
                                                           (QREFELT % 67)))))
                                                  (LETT |s| (|inc_SI| |s|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |res|
                                                           (QREFELT % 51)))
                                                (PROGN
                                                 (LETT #1#
                                                       (SEQ
                                                        (SPADCALL
                                                         "Jacobi identity does not hold"
                                                         (QREFELT % 75))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #2# NIL)
                                                          (GO #8=#:G468)))))
                                                 (GO #9=#:G462)))))))
                                       #9# (EXIT #1#))
                                      (LETT |r| (|inc_SI| |r|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (SPADCALL "Jacobi identity holds" (QREFELT % 75)) (EXIT 'T)))
          #8# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |AlgebraGivenByStructuralConstants;|)) 

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G480)
  (SPROG NIL
         (PROG (#2=#:G481)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL NIL))
                     (HGET |$ConstructorCache|
                           '|AlgebraGivenByStructuralConstants|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |AlgebraGivenByStructuralConstants;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|AlgebraGivenByStructuralConstants|)))))))))) 

(DEFUN |AlgebraGivenByStructuralConstants;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$|
          (LIST '|AlgebraGivenByStructuralConstants| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 100))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|AlgebraGivenByStructuralConstants|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|DirectProduct| |#2| |#1|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 39
                 (CONS (|dispatchFunction| |ALGSC;coordinates;%VV;6|) %)))))
    %))) 

(MAKEPROP '|AlgebraGivenByStructuralConstants| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 7)) 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Union| % '"failed")
              (|FiniteRankNonAssociativeAlgebra&| $$ 6) (0 . |recip|)
              |ALGSC;recip;%U;1| (|Matrix| 6)
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 6) (5 . |coerce|)
              (10 . |apply|) |ALGSC;*;Sm2%;2| (|Vector| 6)
              (16 . |directProduct|) |ALGSC;coerce;V%;3| (|Vector| 15)
              |ALGSC;structuralConstants;V;4| (|List| 6) (21 . |entries|)
              (26 . |vector|) |ALGSC;coordinates;%V;5| (|Integer|)
              (|Vector| $$) (31 . |maxIndex|) (36 . |Zero|) (40 . |elt|)
              (46 . |setColumn!|) (|Union| 20 '"failed")
              (|LinearSystemMatrixPackage2| 6) (53 . |solveUniquely|)
              (|Vector| %) (59 . |coordinates|) (|PositiveInteger|)
              (65 . |unitVector|) |ALGSC;basis;V;7| |ALGSC;someBasis;V;8|
              |ALGSC;rank;Pi;9| (70 . |elt|) |ALGSC;elt;%IR;10| (|Boolean|)
              (76 . |zero?|) (|OutputForm|) (81 . |coerce|) (86 . |zero?|)
              (91 . |One|) (95 . =) (|Symbol|) (|List| 54) (101 . |elt|)
              (107 . |coerce|) (112 . *) (118 . +) (|Mapping| 49 49 49)
              (|List| 49) (124 . |reduce|) |ALGSC;coerce;%Of;11| (130 . *)
              (136 . |elt|) (142 . |elt|) (149 . +) (155 . |setelt!|)
              |ALGSC;*;3%;12| (|NonNegativeInteger|) (162 . -) (168 . -)
              (|Void|) (|String|) (174 . |messagePrint|)
              |ALGSC;alternative?;B;13| |ALGSC;associative?;B;14|
              |ALGSC;antiAssociative?;B;15| |ALGSC;commutative?;B;16|
              |ALGSC;antiCommutative?;B;17| |ALGSC;leftAlternative?;B;18|
              |ALGSC;rightAlternative?;B;19| |ALGSC;flexible?;B;20|
              |ALGSC;lieAdmissible?;B;21| (179 . *) (185 . |recip|)
              |ALGSC;jordanAdmissible?;B;22| |ALGSC;jordanAlgebra?;B;23|
              |ALGSC;jacobiIdentity?;B;24|
              (|SparseUnivariatePolynomial| (|Polynomial| 6)) (|List| %)
              (|InputForm|) (|HashState|) (|SingleInteger|)
              (|Record| (|:| |particular| %) (|:| |basis| 91))
              (|Union| 95 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 20) (|List| (|Polynomial| 6)))
           '#(~= 190 |zero?| 196 |unit| 201 |subtractIfCan| 205
              |structuralConstants| 211 |someBasis| 220 |smaller?| 224 |size|
              230 |sample| 234 |rightUnits| 238 |rightUnit| 242
              |rightTraceMatrix| 246 |rightTrace| 255
              |rightRegularRepresentation| 260 |rightRecip| 271
              |rightRankPolynomial| 276 |rightPower| 280 |rightNorm| 286
              |rightMinimalPolynomial| 291 |rightDiscriminant| 296
              |rightCharacteristicPolynomial| 305 |rightAlternative?| 310
              |represents| 314 |recip| 325 |rank| 330 |random| 334
              |powerAssociative?| 338 |plenaryPower| 342 |opposite?| 348
              |noncommutativeJordanAlgebra?| 354 |lookup| 358 |lieAlgebra?| 363
              |lieAdmissible?| 367 |leftUnits| 371 |leftUnit| 375
              |leftTraceMatrix| 379 |leftTrace| 388 |leftRegularRepresentation|
              393 |leftRecip| 404 |leftRankPolynomial| 409 |leftPower| 413
              |leftNorm| 419 |leftMinimalPolynomial| 424 |leftDiscriminant| 429
              |leftCharacteristicPolynomial| 438 |leftAlternative?| 443 |latex|
              447 |jordanAlgebra?| 452 |jordanAdmissible?| 456
              |jacobiIdentity?| 460 |index| 464 |hashUpdate!| 469 |hash| 475
              |flexible?| 480 |enumerate| 484 |elt| 488 |coordinates| 494
              |convert| 516 |conditionsForIdempotents| 531 |commutator| 540
              |commutative?| 546 |coerce| 550 |basis| 560
              |associatorDependence| 564 |associator| 568 |associative?| 575
              |apply| 579 |antiCommutator| 585 |antiCommutative?| 591
              |antiAssociative?| 595 |alternative?| 599 ^ 603 |Zero| 609 = 613
              - 619 + 630 * 636)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 3 0 2 0 0 1
                                  3))
            (CONS
             '#(|FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| |FramedModule&| NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |AbelianSemiGroup&| |Magma&| NIL |SetCategory&|
                |Hashable&| |BasicType&| NIL NIL NIL)
             (CONS
              '#((|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6) (|Module| 6) (|FramedModule| 6)
                 (|BiModule| 6 6) (|NonAssociativeRng|)
                 (|LeftModule| (|SquareMatrix| 7 6)) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|SetCategory|) (|Hashable|) (|BasicType|)
                 (|CoercibleTo| 49) (|unitsKnown|) (|ConvertibleTo| 92))
              (|makeByteWordVec2| 99
                                  '(1 12 11 0 13 1 16 15 0 17 2 0 0 15 0 18 1
                                    10 0 20 21 1 10 25 0 26 1 20 0 25 27 1 30
                                    29 0 31 0 6 0 32 2 30 2 0 29 33 3 15 0 0 29
                                    20 34 2 36 35 15 20 37 2 0 20 0 38 39 1 10
                                    0 40 41 2 10 6 0 29 45 1 10 47 0 48 1 6 49
                                    0 50 1 6 47 0 51 0 6 0 52 2 6 47 0 0 53 2
                                    55 54 0 29 56 1 54 49 0 57 2 49 0 0 0 58 2
                                    49 0 0 0 59 2 61 49 60 0 62 2 6 0 0 0 64 2
                                    23 15 0 29 65 3 15 6 0 29 29 66 2 6 0 0 0
                                    67 3 20 6 0 29 6 68 2 70 0 0 0 71 2 6 0 0 0
                                    72 1 49 73 74 75 2 6 0 40 0 85 1 6 11 0 86
                                    2 0 47 0 0 1 1 0 47 0 1 0 1 11 1 2 0 11 0 0
                                    1 0 0 23 24 1 0 23 38 1 0 0 38 43 2 3 47 0
                                    0 1 0 3 70 1 0 0 0 1 0 1 96 1 0 1 11 1 0 0
                                    15 1 1 0 15 38 1 1 0 6 0 1 1 0 15 0 1 2 0
                                    15 0 38 1 1 1 11 0 1 0 4 90 1 2 0 0 0 40 1
                                    1 0 6 0 1 1 1 97 0 1 0 0 6 1 1 0 6 38 1 1 0
                                    97 0 1 0 0 47 82 1 0 0 20 1 2 0 0 20 38 1 1
                                    1 11 0 14 0 0 40 44 0 3 0 1 0 0 47 1 2 0 0
                                    0 40 1 2 0 47 0 0 1 0 0 47 1 1 3 40 0 1 0 0
                                    47 1 0 0 47 84 0 1 96 1 0 1 11 1 0 0 15 1 1
                                    0 15 38 1 1 0 6 0 1 1 0 15 0 1 2 0 15 0 38
                                    1 1 1 11 0 1 0 4 90 1 2 0 0 0 40 1 1 0 6 0
                                    1 1 1 97 0 1 0 0 6 1 1 0 6 38 1 1 0 97 0 1
                                    0 0 47 81 1 0 74 0 1 0 0 47 88 0 0 47 87 0
                                    0 47 89 1 3 0 40 1 2 2 93 93 0 1 1 2 94 0 1
                                    0 0 47 83 0 3 91 1 2 0 6 0 29 46 1 0 20 0
                                    28 1 0 15 38 1 2 0 20 0 38 39 2 0 15 38 38
                                    1 1 3 92 0 1 1 0 20 0 1 1 0 0 20 1 0 0 99 1
                                    1 0 99 38 1 2 0 0 0 0 1 0 0 47 79 1 0 0 20
                                    22 1 0 49 0 63 0 0 38 42 0 1 98 1 3 0 0 0 0
                                    0 1 0 0 47 77 2 0 0 15 0 18 2 0 0 0 0 1 0 0
                                    47 80 0 0 47 78 0 0 47 76 2 0 0 0 40 1 0 0
                                    0 1 2 0 47 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 16 0 19 2 0 0 0 6 1 2 0 0 6 0
                                    1 2 0 0 70 0 1 2 0 0 29 0 1 2 0 0 0 0 69 2
                                    0 0 40 0 1)))))
           '|lookupComplete|)) 
