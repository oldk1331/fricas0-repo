
(SDEFUN |CARTEN;sample;%;1| ((% (%))) (SPADCALL (QREFELT % 13))) 

(SDEFUN |CARTEN;int2index|
        ((|n| (|Integer|)) (|indv| (|Vector| (|Integer|)))
         (% (|Vector| (|Integer|))))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (#1=#:G33 NIL) (|i| NIL) (|rnk| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |n| 0) (|error| "Index error (too small)"))
                (#2='T
                 (SEQ (LETT |rnk| (QVSIZE |indv|))
                      (SEQ (LETT |i| 1) (LETT #1# |rnk|) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |n| (QREFELT % 7)))
                                (LETT |n| (QCAR |qr|))
                                (EXIT
                                 (SPADCALL |indv| (+ (- |rnk| |i|) 1)
                                           (+ (QCDR |qr|) (QREFELT % 6))
                                           (QREFELT % 17))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |n| 0 (QREFELT % 19))
                         (|error| "Index error (too big)"))
                        (#2# |indv|))))))))) 

(SDEFUN |CARTEN;index2int| ((|indv| (|Vector| (|Integer|))) (% (|Integer|)))
        (SPROG ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G40 NIL) (|i| NIL))
               (SEQ (LETT |n| 0)
                    (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |indv|)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (LETT |ix|
                                (- (SPADCALL |indv| |i| (QREFELT % 20))
                                   (QREFELT % 6)))
                          (COND
                           ((OR (< |ix| 0) (> |ix| (- (QREFELT % 7) 1)))
                            (EXIT (|error| "Index error (out of range)"))))
                          (EXIT (LETT |n| (+ (* (QREFELT % 7) |n|) |ix|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |CARTEN;lengthRankOrElse|
        ((|v| (|Integer|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|rx| (|NonNegativeInteger|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |v| 1) 0) ((EQL |v| (QREFELT % 7)) 1)
                ((EQL |v| (QREFELT % 10)) 2) ((EQL |v| (QREFELT % 11)) 3)
                ((EQL |v| (QREFELT % 12)) 4)
                ('T
                 (SEQ (LETT |rx| 0)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |v| 0 (QREFELT % 19))) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |v| (QREFELT % 7)))
                                (LETT |v| (QCAR |qr|))
                                (EXIT
                                 (COND
                                  ((SPADCALL |v| 0 (QREFELT % 19))
                                   (COND
                                    ((SPADCALL (QCDR |qr|) 0 (QREFELT % 19))
                                     (|error| "Rank is not a whole number"))
                                    ('T (LETT |rx| (+ |rx| 1))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |rx|))))))) 

(SDEFUN |CARTEN;mkPerm|
        ((|n| (|NonNegativeInteger|)) (|l| (|List| (|Integer|)))
         (% (|Vector| (|Integer|))))
        (SPROG
         ((#1=#:G57 NIL) (#2=#:G60 NIL) (|e| NIL) (#3=#:G58 NIL) (|i| NIL)
          (#4=#:G59 NIL) (|seen| (|Vector| (|Boolean|)))
          (|p| (|Vector| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) |n| (QREFELT % 22))
            (|error| "The list is not a permutation."))
           ('T
            (SEQ (LETT |p| (MAKEARR1 |n| 0)) (LETT |seen| (MAKEARR1 |n| NIL))
                 (SEQ (LETT |e| NIL) (LETT #4# |l|) (LETT |i| 1) (LETT #3# |n|)
                      G190
                      (COND
                       ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                            (PROGN (LETT |e| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (< |e| 1) (> |e| |n|))
                          (|error| "The list is not a permutation."))
                         ('T
                          (SEQ (SPADCALL |p| |i| |e| (QREFELT % 17))
                               (EXIT
                                (SPADCALL |seen| |e| 'T (QREFELT % 24))))))))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                      (GO G190) G191 (EXIT NIL))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |e| 1) (LETT #2# |n|) G190
                        (COND ((|greater_SI| |e| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |seen| |e| (QREFELT % 25)))
                            (PROGN
                             (LETT #1#
                                   (|error| "The list is not a permutation."))
                             (GO #5=#:G53))))))
                        (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #1#))
                 (EXIT |p|))))))) 

(SDEFUN |CARTEN;permute!|
        ((|t| (|Vector| (|Integer|))) (|s| (|Vector| (|Integer|)))
         (|p| (|Vector| (|Integer|))) (% (|Vector| (|Integer|))))
        (SPROG ((#1=#:G65 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |p|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |t| |i|
                                 (SPADCALL |s|
                                           (SPADCALL |p| |i| (QREFELT % 20))
                                           (QREFELT % 20))
                                 (QREFELT % 17))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |t|)))) 

(SDEFUN |CARTEN;permsign!| ((|v| (|Vector| (|Integer|))) (% (|Integer|)))
        (SPROG
         ((#1=#:G84 NIL) (#2=#:G88 NIL) (|i| NIL) (|totTrans| (|Integer|))
          (|e| (|Integer|)) (|nTrans| (|Integer|)) (#3=#:G86 NIL)
          (#4=#:G87 NIL) (|j| NIL) (|n| (|Integer|)) (#5=#:G85 NIL)
          (|psum| (|Integer|)) (#6=#:G67 NIL) (|maxix| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |maxix| (- (+ (QREFELT % 6) (QVSIZE |v|)) 1))
                (LETT |psum|
                      (PROG2
                          (LETT #6#
                                (SPADCALL
                                 (- (* (+ |maxix| 1) |maxix|)
                                    (* (QREFELT % 6) (- (QREFELT % 6) 1)))
                                 2 (QREFELT % 27)))
                          (QCDR #6#)
                        (|check_union2| (QEQCAR #6# 0) (|Integer|)
                                        (|Union| (|Integer|) "failed") #6#)))
                (LETT |n| 0)
                (SEQ (LETT |i| 1) (LETT #5# (QVSIZE |v|)) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |n| (+ |n| (SPADCALL |v| |i| (QREFELT % 20))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n| |psum| (QREFELT % 19)) 0)
                       (#7='T
                        (SEQ (LETT |totTrans| 0) (LETT |nTrans| 1)
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |nTrans| 0 (QREFELT % 19)))
                                    (GO G191)))
                                  (SEQ (LETT |nTrans| 0)
                                       (SEQ (LETT |j| 2)
                                            (LETT #4# (QVSIZE |v|))
                                            (LETT |i| 1)
                                            (LETT #3# (- (QVSIZE |v|) 1)) G190
                                            (COND
                                             ((OR (|greater_SI| |i| #3#)
                                                  (|greater_SI| |j| #4#))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((>
                                                 (SPADCALL |v| |i|
                                                           (QREFELT % 20))
                                                 (SPADCALL |v| |j|
                                                           (QREFELT % 20)))
                                                (SEQ
                                                 (LETT |nTrans| (+ |nTrans| 1))
                                                 (LETT |e|
                                                       (SPADCALL |v| |i|
                                                                 (QREFELT %
                                                                          20)))
                                                 (SPADCALL |v| |i|
                                                           (SPADCALL |v| |j|
                                                                     (QREFELT %
                                                                              20))
                                                           (QREFELT % 17))
                                                 (EXIT
                                                  (SPADCALL |v| |j| |e|
                                                            (QREFELT %
                                                                     17))))))))
                                            (LETT |i|
                                                  (PROG1 (|inc_SI| |i|)
                                                    (LETT |j| (|inc_SI| |j|))))
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (LETT |totTrans|
                                              (+ |totTrans| |nTrans|))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |i| (QREFELT % 20))
                                       (- (+ (QREFELT % 6) |i|) 1)
                                       (QREFELT % 19))
                                      (PROGN (LETT #1# 0) (GO #8=#:G83))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (COND ((ODDP |totTrans|) -1) (#7# 1)))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |CARTEN;ravel;%L;8| ((|x| (%)) (% (|List| R)))
        (SPROG ((#1=#:G93 NIL) (|i| NIL) (#2=#:G92 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0)
                      (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT % 29)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |CARTEN;unravel;L%;9| ((|l| (|List| R)) (% (%)))
        (SPROG
         ((#1=#:G98 NIL) (|i| NIL) (#2=#:G99 NIL) (|r| NIL) (|z| (%))
          (|nz| (|NonNegativeInteger|)))
         (SEQ (LETT |nz| (LENGTH |l|)) (|CARTEN;lengthRankOrElse| |nz| %)
              (LETT |z| (SPADCALL |nz| (|spadConstant| % 32) (QREFELT % 33)))
              (SEQ (LETT |r| NIL) (LETT #2# |l|) (LETT |i| 0)
                   (LETT #1# (- |nz| 1)) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;kroneckerDelta;%;10| ((% (%)))
        (SPROG ((#1=#:G104 NIL) (|i| NIL) (#2=#:G105 NIL) (|zi| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT % 10) (|spadConstant| % 32)
                                (QREFELT % 33)))
                (SEQ (LETT |zi| 0) (LETT #2# (+ (QREFELT % 7) 1)) (LETT |i| 1)
                     (LETT #1# (QREFELT % 7)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |zi| (|spadConstant| % 36)
                                 (QREFELT % 34))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|)
                             (LETT |zi| (|add_SI| |zi| #2#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;leviCivitaSymbol;%;11| ((% (%)))
        (SPROG
         ((#1=#:G110 NIL) (|i| NIL) (|indv| (|Vector| (|Integer|))) (|z| (%))
          (|nz| (|NonNegativeInteger|)))
         (SEQ (LETT |nz| (EXPT (QREFELT % 7) (QREFELT % 7)))
              (LETT |z| (SPADCALL |nz| (|spadConstant| % 32) (QREFELT % 33)))
              (LETT |indv| (MAKEARR1 (QREFELT % 7) 0))
              (SEQ (LETT |i| 0) (LETT #1# (- |nz| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |z| |i|
                               (SPADCALL
                                (|CARTEN;permsign!|
                                 (|CARTEN;int2index| |i| |indv| %) %)
                                (QREFELT % 37))
                               (QREFELT % 34))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;degree;%Nni;12| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 39))) 

(SDEFUN |CARTEN;rank;%Nni;13| ((|x| (%)) (% (|NonNegativeInteger|)))
        (|CARTEN;lengthRankOrElse| (SPADCALL |x| (QREFELT % 28)) %)) 

(SDEFUN |CARTEN;elt;%R;14| ((|x| (%)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 28)) 1 (QREFELT % 22))
          (|error| "Index error (the rank is not 0)"))
         ('T (SPADCALL |x| 0 (QREFELT % 29))))) 

(SDEFUN |CARTEN;elt;%IR;15| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 28)) (QREFELT % 7) (QREFELT % 22))
          (|error| "Index error (the rank is not 1)"))
         ('T (SPADCALL |x| (- |i| (QREFELT % 6)) (QREFELT % 29))))) 

(SDEFUN |CARTEN;elt;%2IR;16|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 28)) (QREFELT % 10)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 2)"))
         ('T
          (SPADCALL |x|
                    (+ (* (QREFELT % 7) (- |i| (QREFELT % 6)))
                       (- |j| (QREFELT % 6)))
                    (QREFELT % 29))))) 

(SDEFUN |CARTEN;elt;%3IR;17|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 28)) (QREFELT % 11)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 3)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+ (* (QREFELT % 10) (- |i| (QREFELT % 6)))
                        (* (QREFELT % 7) (- |j| (QREFELT % 6))))
                     (- |k| (QREFELT % 6)))
                    (QREFELT % 29))))) 

(SDEFUN |CARTEN;elt;%4IR;18|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|l| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 28)) (QREFELT % 12)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 4)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (+ (* (QREFELT % 11) (- |i| (QREFELT % 6)))
                         (* (QREFELT % 10) (- |j| (QREFELT % 6))))
                      (* (QREFELT % 7) (- |k| (QREFELT % 6))))
                     (- |l| (QREFELT % 6)))
                    (QREFELT % 29))))) 

(SDEFUN |CARTEN;elt;%LR;19| ((|x| (%)) (|i| (|List| (|Integer|))) (% (R)))
        (SPROG
         ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G130 NIL) (|ii| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |i|) (SPADCALL |x| (QREFELT % 39))
                      (QREFELT % 22))
            (|error| "Index error (wrong rank)"))
           ('T
            (SEQ (LETT |n| 0)
                 (SEQ (LETT |ii| NIL) (LETT #1# |i|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ii| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |ix| (- |ii| (QREFELT % 6)))
                           (COND
                            ((OR (< |ix| 0) (> |ix| (- (QREFELT % 7) 1)))
                             (EXIT (|error| "Index error (out of range)"))))
                           (EXIT (LETT |n| (+ (* (QREFELT % 7) |n|) |ix|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |x| |n| (QREFELT % 29))))))))) 

(SDEFUN |CARTEN;coerce;L%;20| ((|lr| (|List| R)) (% (%)))
        (SPROG ((#1=#:G136 NIL) (|r| NIL) (#2=#:G137 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL (LENGTH |lr|) (QREFELT % 7) (QREFELT % 22))
                  (|error| "Incorrect number of components"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (QREFELT % 7) (|spadConstant| % 32)
                                   (QREFELT % 33)))
                   (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 7) 1))
                        (LETT |r| NIL) (LETT #1# |lr|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL)
                              (|greater_SI| |i| #2#))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT % 34))))
                        (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;coerce;L%;21| ((|lx| (|List| %)) (% (%)))
        (SPROG
         ((#1=#:G152 NIL) (|i| NIL) (#2=#:G150 NIL) (|x| NIL) (#3=#:G151 NIL)
          (|offz| NIL) (|z| (%)) (|nx| (|NonNegativeInteger|)) (#4=#:G148 NIL)
          (#5=#:G149 NIL) (|rx| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |lx| (QREFELT % 50)) (QREFELT % 7)
                      (QREFELT % 22))
            (|error| "Incorrect number of slices"))
           ('T
            (SEQ
             (LETT |rx|
                   (SPADCALL (SPADCALL |lx| (QREFELT % 51)) (QREFELT % 39)))
             (SEQ
              (EXIT
               (SEQ (LETT |x| NIL) (LETT #5# |lx|) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT % 39)) |rx|
                                  (QREFELT % 22))
                        (PROGN
                         (LETT #4# (|error| "Inhomogeneous slice ranks"))
                         (GO #6=#:G140))))))
                    (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #4#))
             (LETT |nx|
                   (SPADCALL (SPADCALL |lx| (QREFELT % 51)) (QREFELT % 28)))
             (LETT |z|
                   (SPADCALL (* (QREFELT % 7) |nx|) (|spadConstant| % 32)
                             (QREFELT % 33)))
             (SEQ (LETT |offz| 0) (LETT #3# |nx|) (LETT |x| NIL)
                  (LETT #2# |lx|) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- |nx| 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| (+ |offz| |i|)
                                     (SPADCALL |x| |i| (QREFELT % 29))
                                     (QREFELT % 34))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
                  (LETT #2#
                        (PROG1 (CDR #2#) (LETT |offz| (|add_SI| |offz| #3#))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT |z|))))))) 

(SDEFUN |CARTEN;retractIfCan;%U;22| ((|x| (%)) (% (|Union| R "failed")))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT % 39)))
          (CONS 0 (SPADCALL |x| (QREFELT % 41))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |CARTEN;mkOutf|
        ((|x| (%)) (|i0| (|Integer|)) (|rnk| (|NonNegativeInteger|))
         (% (|OutputForm|)))
        (SPROG
         ((#1=#:G177 NIL) (|j| NIL) (#2=#:G176 NIL) (#3=#:G175 NIL) (|i| NIL)
          (#4=#:G174 NIL) (|nskip| (|NonNegativeInteger|))
          (|rnk1| (|NonNegativeInteger|)) (#5=#:G173 NIL) (#6=#:G172 NIL))
         (SEQ
          (COND
           ((ODDP |rnk|)
            (SEQ (LETT |rnk1| (- |rnk| 1))
                 (LETT |nskip| (EXPT (QREFELT % 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #6# NIL)
                    (SEQ (LETT |i| 0) (LETT #5# (- (QREFELT % 7) 1)) G190
                         (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (|CARTEN;mkOutf| |x| (+ |i0| (* |nskip| |i|))
                                   |rnk1| %)
                                  #6#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   (QREFELT % 58)))))
           ((EQL |rnk| 0)
            (SPADCALL (SPADCALL |x| |i0| (QREFELT % 29)) (QREFELT % 59)))
           ('T
            (SEQ (LETT |rnk1| (- |rnk| 2))
                 (LETT |nskip| (EXPT (QREFELT % 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT % 7) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |j| 0)
                                        (LETT #1# (- (QREFELT % 7) 1)) G190
                                        (COND
                                         ((|greater_SI| |j| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (|CARTEN;mkOutf| |x|
                                                  (+ |i0|
                                                     (* |nskip|
                                                        (+
                                                         (* (QREFELT % 7) |i|)
                                                         |j|)))
                                                  |rnk1| %)
                                                 #2#))))
                                        (LETT |j| (|inc_SI| |j|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  #4#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   (QREFELT % 61))))))))) 

(SDEFUN |CARTEN;coerce;%Of;24| ((|x| (%)) (% (|OutputForm|)))
        (|CARTEN;mkOutf| |x| 0 (SPADCALL |x| (QREFELT % 39)) %)) 

(SDEFUN |CARTEN;Zero;%;25| ((% (%)))
        (SPADCALL (|spadConstant| % 32) (QREFELT % 63))) 

(SDEFUN |CARTEN;One;%;26| ((% (%)))
        (SPADCALL (|spadConstant| % 36) (QREFELT % 63))) 

(SDEFUN |CARTEN;coerce;R%;27| ((|r| (R)) (% (%)))
        (SPADCALL 1 |r| (QREFELT % 33))) 

(SDEFUN |CARTEN;coerce;Dp%;28| ((|v| (|DirectProduct| |dim| R)) (% (%)))
        (SPROG ((#1=#:G186 NIL) (|i| NIL) (#2=#:G187 NIL) (|j| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT % 7) (|spadConstant| % 32)
                                (QREFELT % 33)))
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 67)))
                     (LETT #2# (SPADCALL |v| (QREFELT % 68))) (LETT |i| 0)
                     (LETT #1# (- (QREFELT % 7) 1)) G190
                     (COND ((OR (|greater_SI| |i| #1#) (> |j| #2#)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i| (SPADCALL |v| |j| (QREFELT % 69))
                                 (QREFELT % 34))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;coerce;Sm%;29| ((|m| (|SquareMatrix| |dim| R)) (% (%)))
        (SPROG
         ((|offz| (|NonNegativeInteger|)) (#1=#:G196 NIL) (|j| NIL)
          (#2=#:G195 NIL) (|i| NIL) (|z| (%)))
         (SEQ
          (LETT |z|
                (SPADCALL (EXPT (QREFELT % 7) 2) (|spadConstant| % 32)
                          (QREFELT % 33)))
          (LETT |offz| 0)
          (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 7) 1)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 0) (LETT #1# (- (QREFELT % 7) 1)) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| (+ |offz| |j|)
                                 (SPADCALL |m| (+ |i| 1) (+ |j| 1)
                                           (QREFELT % 72))
                                 (QREFELT % 34))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |offz| (+ |offz| (QREFELT % 7)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;=;2%B;30| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G203 NIL) (#2=#:G204 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT % 28))
                             (SPADCALL |y| (QREFELT % 28)) (QREFELT % 22))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 0)
                         (LETT #2# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| (QREFELT % 29))
                                       (SPADCALL |y| |i| (QREFELT % 29))
                                       (QREFELT % 74))
                             (PROGN (LETT #1# NIL) (GO #3=#:G202))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))
                #3# (EXIT #1#)))) 

(SDEFUN |CARTEN;+;3%;31| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G210 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 28))
                            (SPADCALL |y| (QREFELT % 28)) (QREFELT % 22))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                   (|spadConstant| % 32) (QREFELT % 33)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT % 29))
                                              (SPADCALL |y| |i| (QREFELT % 29))
                                              (QREFELT % 76))
                                    (QREFELT % 34))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;3%;32| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G216 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 28))
                            (SPADCALL |y| (QREFELT % 28)) (QREFELT % 22))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                   (|spadConstant| % 32) (QREFELT % 33)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT % 29))
                                              (SPADCALL |y| |i| (QREFELT % 29))
                                              (QREFELT % 78))
                                    (QREFELT % 34))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;2%;33| ((|x| (%)) (% (%)))
        (SPROG ((#1=#:G221 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                (|spadConstant| % 32) (QREFELT % 33)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL (SPADCALL |x| |i| (QREFELT % 29))
                                           (QREFELT % 80))
                                 (QREFELT % 34))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;I2%;34| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G226 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                (|spadConstant| % 32) (QREFELT % 33)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT % 29))
                                           (QREFELT % 82))
                                 (QREFELT % 34))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;%I%;35| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G231 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                (|spadConstant| % 32) (QREFELT % 33)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT % 29))
                                           (QREFELT % 82))
                                 (QREFELT % 34))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;R2%;36| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G236 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                (|spadConstant| % 32) (QREFELT % 33)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT % 29))
                                           (QREFELT % 85))
                                 (QREFELT % 34))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;%R%;37| ((|x| (%)) (|r| (R)) (% (%)))
        (SPROG ((#1=#:G241 NIL) (|i| NIL) (|z| (%)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 28))
                                (|spadConstant| % 32) (QREFELT % 33)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT % 29))
                                           (QREFELT % 85))
                                 (QREFELT % 34))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;product;3%;38| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G250 NIL) (|j| NIL) (#2=#:G248 NIL) (|i| NIL) (#3=#:G249 NIL)
          (|ioff| NIL) (|z| (%)) (|ny| #4=(|NonNegativeInteger|)) (|nx| #4#))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT % 28)))
              (LETT |ny| (SPADCALL |y| (QREFELT % 28)))
              (LETT |z|
                    (SPADCALL (* |nx| |ny|) (|spadConstant| % 32)
                              (QREFELT % 33)))
              (SEQ (LETT |ioff| 0) (LETT #3# |ny|) (LETT |i| 0)
                   (LETT #2# (- |nx| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (- |ny| 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |z| (+ |ioff| |j|)
                                      (SPADCALL
                                       (SPADCALL |x| |i| (QREFELT % 29))
                                       (SPADCALL |y| |j| (QREFELT % 29))
                                       (QREFELT % 85))
                                      (QREFELT % 34))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|)
                           (LETT |ioff| (|add_SI| |ioff| #3#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;*;3%;39| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|ry| #1=(|NonNegativeInteger|)) (|rx| #1#))
               (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 39)))
                    (LETT |ry| (SPADCALL |y| (QREFELT % 39)))
                    (EXIT
                     (COND
                      ((EQL |rx| 0)
                       (SPADCALL (SPADCALL |x| 0 (QREFELT % 29)) |y|
                                 (QREFELT % 86)))
                      ((EQL |ry| 0)
                       (SPADCALL |x| (SPADCALL |y| 0 (QREFELT % 29))
                                 (QREFELT % 87)))
                      ('T (SPADCALL |x| |rx| |y| 1 (QREFELT % 89)))))))) 

(SDEFUN |CARTEN;contract;%2I%;40|
        ((|x| (%)) (|i| #1=(|Integer|)) (|j| #2=(|Integer|)) (% (%)))
        (SPROG
         ((#3=#:G273 NIL) (|k| NIL) (#4=#:G274 NIL) (|xk| NIL) (#5=#:G270 NIL)
          (|l| NIL) (#6=#:G271 NIL) (|xl| NIL) (#7=#:G272 NIL) (|zl| NIL)
          (#8=#:G267 NIL) (|m| NIL) (#9=#:G268 NIL) (|xm| NIL) (#10=#:G269 NIL)
          (|zm| NIL) (#11=#:G264 NIL) (|h| NIL) (#12=#:G265 NIL) (|xh| NIL)
          (#13=#:G266 NIL) (|zh| NIL) (|z| (%))
          (|xok| #14=(|NonNegativeInteger|)) (|xoh| #14#) (|zoh| #14#)
          (|nh| #15=(|NonNegativeInteger|)) (|rh| (|NonNegativeInteger|))
          (|xom| #14#) (|zom| #15#) (|nm| #15#) (|rm| (|NonNegativeInteger|))
          (|xol| #16=(|PositiveInteger|)) (|zol| #16#) (|nl| #15#)
          (|rl| (|NonNegativeInteger|)) (|#G111| #1#) (|#G110| #2#)
          (|rx| (|NonNegativeInteger|)))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 39)))
              (COND
               ((OR
                 (OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |rx|))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper index for contraction"))))
              (COND
               ((> |i| |j|)
                (PROGN
                 (LETT |#G110| |j|)
                 (LETT |#G111| |i|)
                 (LETT |i| |#G110|)
                 (LETT |j| |#G111|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT % 7) |rl|))
              (LETT |zol| 1) (LETT |xol| |zol|) (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT % 7) |rm|)) (LETT |zom| |nl|)
              (LETT |xom| (* |zom| (QREFELT % 7))) (LETT |rh| (- |i| 1))
              (LETT |nh| (EXPT (QREFELT % 7) |rh|)) (LETT |zoh| (* |nl| |nm|))
              (LETT |xoh| (* |zoh| (EXPT (QREFELT % 7) 2)))
              (LETT |xok| (* |nl| (+ 1 (* |nm| (QREFELT % 7)))))
              (LETT |z|
                    (SPADCALL (* (* |nl| |nm|) |nh|) (|spadConstant| % 32)
                              (QREFELT % 33)))
              (SEQ (LETT |zh| 0) (LETT #13# |zoh|) (LETT |xh| 0)
                   (LETT #12# |xoh|) (LETT |h| 1) (LETT #11# |nh|) G190
                   (COND ((|greater_SI| |h| #11#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zm| |zh|) (LETT #10# |zom|) (LETT |xm| |xh|)
                          (LETT #9# |xom|) (LETT |m| 1) (LETT #8# |nm|) G190
                          (COND ((|greater_SI| |m| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zl| |zm|) (LETT #7# |zol|)
                                 (LETT |xl| |xm|) (LETT #6# |xol|) (LETT |l| 1)
                                 (LETT #5# |nl|) G190
                                 (COND ((|greater_SI| |l| #5#) (GO G191)))
                                 (SEQ
                                  (SPADCALL |z| |zl| (|spadConstant| % 32)
                                            (QREFELT % 34))
                                  (EXIT
                                   (SEQ (LETT |xk| |xl|) (LETT #4# |xok|)
                                        (LETT |k| 1) (LETT #3# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |z| |zl|
                                                    (SPADCALL
                                                     (SPADCALL |z| |zl|
                                                               (QREFELT % 29))
                                                     (SPADCALL |x| |xk|
                                                               (QREFELT % 29))
                                                     (QREFELT % 76))
                                                    (QREFELT % 34))))
                                        (LETT |k|
                                              (PROG1 (|inc_SI| |k|)
                                                (LETT |xk| (+ |xk| #4#))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |l|
                                       (PROG1 (|inc_SI| |l|)
                                         (LETT |xl|
                                               (PROG1 (+ |xl| #6#)
                                                 (LETT |zl| (+ |zl| #7#))))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |m|
                                (PROG1 (|inc_SI| |m|)
                                  (LETT |xm|
                                        (PROG1 (+ |xm| #9#)
                                          (LETT |zm| (+ |zm| #10#))))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |h|
                         (PROG1 (|inc_SI| |h|)
                           (LETT |xh|
                                 (PROG1 (|add_SI| |xh| #12#)
                                   (LETT |zh| (|add_SI| |zh| #13#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;contract;%I%I%;41|
        ((|x| (%)) (|i| (|Integer|)) (|y| (%)) (|j| (|Integer|)) (% (%)))
        (SPROG
         ((#1=#:G300 NIL) (|k| NIL) (#2=#:G301 NIL) (|xk| NIL) (#3=#:G302 NIL)
          (|yk| NIL) (#4=#:G297 NIL) (|dyl| NIL) (#5=#:G298 NIL) (|yl| NIL)
          (#6=#:G299 NIL) (|zly| NIL) (#7=#:G294 NIL) (|dyh| NIL)
          (#8=#:G295 NIL) (|yh| NIL) (#9=#:G296 NIL) (|zhy| NIL)
          (#10=#:G291 NIL) (|dxl| NIL) (#11=#:G292 NIL) (|xl| NIL)
          (#12=#:G293 NIL) (|zlx| NIL) (#13=#:G288 NIL) (|dxh| NIL)
          (#14=#:G289 NIL) (|xh| NIL) (#15=#:G290 NIL) (|zhx| NIL) (|z| (%))
          (|zohx| #16=(|NonNegativeInteger|)) (|ohx| #16#)
          (|nhx| #17=(|NonNegativeInteger|)) (|rhx| (|NonNegativeInteger|))
          (|zolx| #16#) (|olx| #18=(|PositiveInteger|)) (|nlx| #17#)
          (|rlx| (|NonNegativeInteger|)) (|zohy| (|NonNegativeInteger|))
          (|ohy| #16#) (|nhy| #17#) (|rhy| (|NonNegativeInteger|))
          (|zoly| #18#) (|oly| #18#) (|nly| #17#)
          (|rly| (|NonNegativeInteger|)) (|ry| #19=(|NonNegativeInteger|))
          (|rx| #19#))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 39)))
              (LETT |ry| (SPADCALL |y| (QREFELT % 39)))
              (COND
               ((OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |ry|))
                (EXIT (|error| "Improper index for contraction"))))
              (LETT |rly| (- |ry| |j|)) (LETT |nly| (EXPT (QREFELT % 7) |rly|))
              (LETT |oly| 1) (LETT |zoly| 1) (LETT |rhy| (- |j| 1))
              (LETT |nhy| (EXPT (QREFELT % 7) |rhy|))
              (LETT |ohy| (* |nly| (QREFELT % 7)))
              (LETT |zohy| (* |zoly| |nly|)) (LETT |rlx| (- |rx| |i|))
              (LETT |nlx| (EXPT (QREFELT % 7) |rlx|)) (LETT |olx| 1)
              (LETT |zolx| (* |zohy| |nhy|)) (LETT |rhx| (- |i| 1))
              (LETT |nhx| (EXPT (QREFELT % 7) |rhx|))
              (LETT |ohx| (* |nlx| (QREFELT % 7)))
              (LETT |zohx| (* |zolx| |nlx|))
              (LETT |z|
                    (SPADCALL (* (* (* |nlx| |nhx|) |nly|) |nhy|)
                              (|spadConstant| % 32) (QREFELT % 33)))
              (SEQ (LETT |zhx| 0) (LETT #15# |zohx|) (LETT |xh| 0)
                   (LETT #14# |ohx|) (LETT |dxh| 1) (LETT #13# |nhx|) G190
                   (COND ((|greater_SI| |dxh| #13#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zlx| |zhx|) (LETT #12# |zolx|)
                          (LETT |xl| |xh|) (LETT #11# |olx|) (LETT |dxl| 1)
                          (LETT #10# |nlx|) G190
                          (COND ((|greater_SI| |dxl| #10#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zhy| |zlx|) (LETT #9# |zohy|)
                                 (LETT |yh| 0) (LETT #8# |ohy|) (LETT |dyh| 1)
                                 (LETT #7# |nhy|) G190
                                 (COND ((|greater_SI| |dyh| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |zly| |zhy|) (LETT #6# |zoly|)
                                        (LETT |yl| |yh|) (LETT #5# |oly|)
                                        (LETT |dyl| 1) (LETT #4# |nly|) G190
                                        (COND
                                         ((|greater_SI| |dyl| #4#) (GO G191)))
                                        (SEQ
                                         (SPADCALL |z| |zly|
                                                   (|spadConstant| % 32)
                                                   (QREFELT % 34))
                                         (EXIT
                                          (SEQ (LETT |yk| |yl|)
                                               (LETT #3# |nly|)
                                               (LETT |xk| |xl|)
                                               (LETT #2# |nlx|) (LETT |k| 1)
                                               (LETT #1# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |k| #1#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zly|
                                                           (SPADCALL
                                                            (SPADCALL |z| |zly|
                                                                      (QREFELT
                                                                       % 29))
                                                            (SPADCALL
                                                             (SPADCALL |x| |xk|
                                                                       (QREFELT
                                                                        % 29))
                                                             (SPADCALL |y| |yk|
                                                                       (QREFELT
                                                                        % 29))
                                                             (QREFELT % 85))
                                                            (QREFELT % 76))
                                                           (QREFELT % 34))))
                                               (LETT |k|
                                                     (PROG1 (|inc_SI| |k|)
                                                       (LETT |xk|
                                                             (PROG1
                                                                 (+ |xk| #2#)
                                                               (LETT |yk|
                                                                     (+ |yk|
                                                                        #3#))))))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |dyl|
                                              (PROG1 (|inc_SI| |dyl|)
                                                (LETT |yl|
                                                      (PROG1 (+ |yl| #5#)
                                                        (LETT |zly|
                                                              (+ |zly|
                                                                 #6#))))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |dyh|
                                       (PROG1 (|inc_SI| |dyh|)
                                         (LETT |yh|
                                               (PROG1 (|add_SI| |yh| #8#)
                                                 (LETT |zhy| (+ |zhy| #9#))))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |dxl|
                                (PROG1 (|inc_SI| |dxl|)
                                  (LETT |xl|
                                        (PROG1 (+ |xl| #11#)
                                          (LETT |zlx| (+ |zlx| #12#))))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |dxh|
                         (PROG1 (|inc_SI| |dxh|)
                           (LETT |xh|
                                 (PROG1 (|add_SI| |xh| #14#)
                                   (LETT |zhx| (|add_SI| |zhx| #15#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;transpose;2%;42| ((|x| (%)) (% (%)))
        (SPADCALL |x| 1 (SPADCALL |x| (QREFELT % 39)) (QREFELT % 92))) 

(SDEFUN |CARTEN;transpose;%2I%;43|
        ((|x| (%)) (|i| #1=(|Integer|)) (|j| #2=(|Integer|)) (% (%)))
        (SPROG
         ((#3=#:G325 NIL) (|q| NIL) (#4=#:G326 NIL) (|zq| NIL) (#5=#:G327 NIL)
          (|xq| NIL) (#6=#:G322 NIL) (|p| NIL) (#7=#:G323 NIL) (|zp| NIL)
          (#8=#:G324 NIL) (|xp| NIL) (#9=#:G320 NIL) (|l| NIL) (#10=#:G321 NIL)
          (|zl| NIL) (#11=#:G318 NIL) (|m| NIL) (#12=#:G319 NIL) (|zm| NIL)
          (#13=#:G316 NIL) (|h| NIL) (#14=#:G317 NIL) (|zh| NIL) (|z| (%))
          (|zoh| #15=(|NonNegativeInteger|)) (|nh| #16=(|NonNegativeInteger|))
          (|rh| (|NonNegativeInteger|)) (|zoj| #15#) (|zom| #15#) (|nm| #16#)
          (|rm| (|NonNegativeInteger|)) (|zoi| (|NonNegativeInteger|))
          (|zol| (|PositiveInteger|)) (|nl| #16#) (|rl| (|NonNegativeInteger|))
          (|#G147| #1#) (|#G146| #2#) (|rx| (|NonNegativeInteger|)))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 39)))
              (COND
               ((OR
                 (OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |rx|))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper indices for transposition"))))
              (COND
               ((> |i| |j|)
                (PROGN
                 (LETT |#G146| |j|)
                 (LETT |#G147| |i|)
                 (LETT |i| |#G146|)
                 (LETT |j| |#G147|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT % 7) |rl|))
              (LETT |zol| 1) (LETT |zoi| (* |zol| |nl|))
              (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT % 7) |rm|))
              (LETT |zom| (* |nl| (QREFELT % 7))) (LETT |zoj| (* |zom| |nm|))
              (LETT |rh| (- |i| 1)) (LETT |nh| (EXPT (QREFELT % 7) |rh|))
              (LETT |zoh| (* (* |nl| |nm|) (EXPT (QREFELT % 7) 2)))
              (LETT |z|
                    (SPADCALL (SPADCALL |x| (QREFELT % 28))
                              (|spadConstant| % 32) (QREFELT % 33)))
              (SEQ (LETT |zh| 0) (LETT #14# |zoh|) (LETT |h| 1)
                   (LETT #13# |nh|) G190
                   (COND ((|greater_SI| |h| #13#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zm| |zh|) (LETT #12# |zom|) (LETT |m| 1)
                          (LETT #11# |nm|) G190
                          (COND ((|greater_SI| |m| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zl| |zm|) (LETT #10# |zol|)
                                 (LETT |l| 1) (LETT #9# |nl|) G190
                                 (COND ((|greater_SI| |l| #9#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |xp| |zl|) (LETT #8# |zoj|)
                                        (LETT |zp| |zl|) (LETT #7# |zoi|)
                                        (LETT |p| 1) (LETT #6# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |p| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |xq| |xp|)
                                               (LETT #5# |zoi|)
                                               (LETT |zq| |zp|)
                                               (LETT #4# |zoj|) (LETT |q| 1)
                                               (LETT #3# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |q| #3#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zq|
                                                           (SPADCALL |x| |xq|
                                                                     (QREFELT %
                                                                              29))
                                                           (QREFELT % 34))))
                                               (LETT |q|
                                                     (PROG1 (|inc_SI| |q|)
                                                       (LETT |zq|
                                                             (PROG1
                                                                 (+ |zq| #4#)
                                                               (LETT |xq|
                                                                     (+ |xq|
                                                                        #5#))))))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |p|
                                              (PROG1 (|inc_SI| |p|)
                                                (LETT |zp|
                                                      (PROG1 (+ |zp| #7#)
                                                        (LETT |xp|
                                                              (+ |xp| #8#))))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |l|
                                       (PROG1 (|inc_SI| |l|)
                                         (LETT |zl| (+ |zl| #10#))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |m|
                                (PROG1 (|inc_SI| |m|)
                                  (LETT |zm| (+ |zm| #12#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |h|
                         (PROG1 (|inc_SI| |h|)
                           (LETT |zh| (|add_SI| |zh| #14#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;reindex;%L%;44| ((|x| (%)) (|l| (|List| (|Integer|))) (% (%)))
        (SPROG
         ((|pi| (|Integer|)) (#1=#:G333 NIL) (|i| NIL)
          (|ziv| #2=(|Vector| (|Integer|))) (|xiv| #2#)
          (|p| (|Vector| (|Integer|))) (|rx| (|NonNegativeInteger|)) (|z| (%))
          (|nx| (|NonNegativeInteger|)))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT % 28)))
              (LETT |z| (SPADCALL |nx| (|spadConstant| % 32) (QREFELT % 33)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 39)))
              (LETT |p| (|CARTEN;mkPerm| |rx| |l| %))
              (LETT |xiv| (MAKEARR1 |rx| 0)) (LETT |ziv| (MAKEARR1 |rx| 0))
              (SEQ (LETT |i| 0) (LETT #1# (- (SPADCALL |x| (QREFELT % 28)) 1))
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |pi|
                          (|CARTEN;index2int|
                           (|CARTEN;permute!| |ziv|
                            (|CARTEN;int2index| |i| |xiv| %) |p| %)
                           %))
                    (EXIT
                     (SPADCALL |z| |pi| (SPADCALL |x| |i| (QREFELT % 29))
                               (QREFELT % 34))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(DECLAIM (NOTINLINE |CartesianTensor;|)) 

(DEFUN |CartesianTensor| (&REST #1=#:G334)
  (SPROG NIL
         (PROG (#2=#:G335)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL NIL T))
                     (HGET |$ConstructorCache| '|CartesianTensor|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartesianTensor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CartesianTensor|)))))))))) 

(DEFUN |CartesianTensor;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|CartesianTensor| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 96))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CartesianTensor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|IndexedVector| |#3| 0))
          (QSETREFV % 10 (EXPT |#2| 2))
          (QSETREFV % 11 (EXPT |#2| 3))
          (QSETREFV % 12 (EXPT |#2| 4))
          %))) 

(MAKEPROP '|CartesianTensor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| '|dim2| '|dim3| '|dim4|
              |CARTEN;kroneckerDelta;%;10| |CARTEN;sample;%;1| (|Integer|)
              (|Vector| 15) (0 . |setelt!|) (|Boolean|) (7 . ~=) (13 . |elt|)
              (|NonNegativeInteger|) (19 . ~=) (|Vector| 18) (25 . |setelt!|)
              (32 . |elt|) (|Union| % '"failed") (38 . |exquo|) (44 . |#|)
              (49 . |elt|) (|List| 8) |CARTEN;ravel;%L;8| (55 . |Zero|)
              (59 . |new|) (65 . |setelt!|) |CARTEN;unravel;L%;9| (72 . |One|)
              (76 . |coerce|) |CARTEN;leviCivitaSymbol;%;11|
              |CARTEN;rank;%Nni;13| |CARTEN;degree;%Nni;12| |CARTEN;elt;%R;14|
              |CARTEN;elt;%IR;15| |CARTEN;elt;%2IR;16| |CARTEN;elt;%3IR;17|
              |CARTEN;elt;%4IR;18| (|List| 15) |CARTEN;elt;%LR;19|
              |CARTEN;coerce;L%;20| (|List| $$) (81 . |#|) (86 . |first|)
              (|List| %) |CARTEN;coerce;L%;21| (|Union| 8 '"failed")
              |CARTEN;retractIfCan;%U;22| (|OutputForm|) (|List| 56)
              (91 . |coerce|) (96 . |coerce|) (|List| 52) (101 . |matrix|)
              |CARTEN;coerce;%Of;24| |CARTEN;coerce;R%;27|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;Zero;%;25|) %))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;One;%;26|) %))
              (|DirectProduct| (NRTEVAL (QREFELT % 7)) 8) (106 . |minIndex|)
              (111 . |maxIndex|) (116 . |elt|) |CARTEN;coerce;Dp%;28|
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 8) (122 . |elt|)
              |CARTEN;coerce;Sm%;29| (129 . ~=) |CARTEN;=;2%B;30| (135 . +)
              |CARTEN;+;3%;31| (141 . -) |CARTEN;-;3%;32| (147 . -)
              |CARTEN;-;2%;33| (152 . *) |CARTEN;*;I2%;34| |CARTEN;*;%I%;35|
              (158 . *) |CARTEN;*;R2%;36| |CARTEN;*;%R%;37|
              |CARTEN;product;3%;38| |CARTEN;contract;%I%I%;41|
              |CARTEN;*;3%;39| |CARTEN;contract;%2I%;40|
              |CARTEN;transpose;%2I%;43| |CARTEN;transpose;2%;42|
              |CARTEN;reindex;%L%;44| (|String|))
           '#(~= 164 |unravel| 170 |transpose| 175 |sample| 187 |retractIfCan|
              191 |retract| 196 |reindex| 201 |ravel| 207 |rank| 212 |product|
              217 |leviCivitaSymbol| 223 |latex| 227 |kroneckerDelta| 232 |elt|
              236 |degree| 277 |contract| 282 |coerce| 297 |Zero| 327 |One| 331
              = 335 - 341 + 352 * 358)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|GradedAlgebra&| |GradedModule&| |GradedModule&|
                     |RetractableTo&| |SetCategory&| NIL NIL |BasicType&|)
                  (CONS
                   '#((|GradedAlgebra| 8 21) (|GradedModule| 15 21)
                      (|GradedModule| 8 21) (|RetractableTo| 8) (|SetCategory|)
                      (|CoercibleTo| 56) (|CoercibleFrom| 8) (|BasicType|))
                   (|makeByteWordVec2| 95
                                       '(3 16 15 0 15 15 17 2 15 18 0 0 19 2 16
                                         15 0 15 20 2 21 18 0 0 22 3 23 18 0 15
                                         18 24 2 23 18 0 15 25 2 15 26 0 0 27 1
                                         9 21 0 28 2 9 8 0 15 29 0 8 0 32 2 9 0
                                         21 8 33 3 9 8 0 15 8 34 0 8 0 36 1 8 0
                                         15 37 1 49 21 0 50 1 49 2 0 51 1 57 56
                                         0 58 1 8 56 0 59 1 56 0 60 61 1 66 15
                                         0 67 1 66 15 0 68 2 66 8 0 15 69 3 71
                                         8 0 15 15 72 2 8 18 0 0 74 2 8 0 0 0
                                         76 2 8 0 0 0 78 1 8 0 0 80 2 8 0 15 0
                                         82 2 8 0 0 0 85 2 0 18 0 0 1 1 0 0 30
                                         35 1 0 0 0 93 3 0 0 0 15 15 92 0 0 0
                                         14 1 0 54 0 55 1 0 8 0 1 2 0 0 0 46 94
                                         1 0 30 0 31 1 0 21 0 39 2 0 0 0 0 88 0
                                         0 0 38 1 0 95 0 1 0 0 0 13 2 0 8 0 15
                                         42 1 0 8 0 41 4 0 8 0 15 15 15 44 3 0
                                         8 0 15 15 43 5 0 8 0 15 15 15 15 45 2
                                         0 8 0 46 47 1 0 21 0 40 3 0 0 0 15 15
                                         91 4 0 0 0 15 0 15 89 1 0 56 0 62 1 0
                                         0 8 63 1 0 0 71 73 1 0 0 66 70 1 0 0
                                         52 53 1 0 0 30 48 0 0 0 64 0 0 0 65 2
                                         0 18 0 0 75 1 0 0 0 81 2 0 0 0 0 79 2
                                         0 0 0 0 77 2 0 0 8 0 86 2 0 0 0 8 87 2
                                         0 0 0 15 84 2 0 0 15 0 83 2 0 0 0 0
                                         90)))))
           '|lookupComplete|)) 
