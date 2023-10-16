
(SDEFUN |CARTEN;sample;$;1| (($ $)) (SPADCALL (QREFELT $ 16))) 

(SDEFUN |CARTEN;int2index|
        ((|n| |Integer|) (|indv| |Vector| (|Integer|))
         ($ |Vector| (|Integer|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (#1=#:G136 NIL) (|i| NIL) (|rnk| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |n| 0) (|error| "Index error (too small)"))
                (#2='T
                 (SEQ (LETT |rnk| (QVSIZE |indv|))
                      (SEQ (LETT |i| 1) (LETT #1# |rnk|) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |n| (QREFELT $ 7)))
                                (LETT |n| (QCAR |qr|))
                                (EXIT
                                 (SPADCALL |indv| (+ (- |rnk| |i|) 1)
                                           (+ (QCDR |qr|) (QREFELT $ 6))
                                           (QREFELT $ 20))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |n| 0 (QREFELT $ 22))
                         (|error| "Index error (too big)"))
                        (#2# |indv|))))))))) 

(SDEFUN |CARTEN;index2int| ((|indv| |Vector| (|Integer|)) ($ |Integer|))
        (SPROG ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G142 NIL) (|i| NIL))
               (SEQ (LETT |n| 0)
                    (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |indv|)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (LETT |ix|
                                (- (SPADCALL |indv| |i| (QREFELT $ 23))
                                   (QREFELT $ 6)))
                          (COND
                           ((OR (< |ix| 0)
                                (SPADCALL |ix| (- (QREFELT $ 7) 1)
                                          (QREFELT $ 24)))
                            (EXIT (|error| "Index error (out of range)"))))
                          (EXIT
                           (LETT |n|
                                 (+ (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25))
                                    |ix|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |CARTEN;lengthRankOrElse| ((|v| |Integer|) ($ |NonNegativeInteger|))
        (SPROG
         ((|rx| (|NonNegativeInteger|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |v| 1) 0) ((EQL |v| (QREFELT $ 7)) 1)
                ((EQL |v| (QREFELT $ 13)) 2) ((EQL |v| (QREFELT $ 14)) 3)
                ((EQL |v| (QREFELT $ 15)) 4)
                ('T
                 (SEQ (LETT |rx| 0)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |v| 0 (QREFELT $ 22))) (GO G191)))
                           (SEQ (LETT |qr| (DIVIDE2 |v| (QREFELT $ 7)))
                                (LETT |v| (QCAR |qr|))
                                (EXIT
                                 (COND
                                  ((SPADCALL |v| 0 (QREFELT $ 22))
                                   (COND
                                    ((SPADCALL (QCDR |qr|) 0 (QREFELT $ 22))
                                     (|error| "Rank is not a whole number"))
                                    ('T (LETT |rx| (+ |rx| 1))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |rx|))))))) 

(SDEFUN |CARTEN;mkPerm|
        ((|n| |NonNegativeInteger|) (|l| |List| (|Integer|))
         ($ |Vector| (|Integer|)))
        (SPROG
         ((#1=#:G156 NIL) (#2=#:G159 NIL) (|e| NIL) (#3=#:G157 NIL) (|i| NIL)
          (#4=#:G158 NIL) (|seen| (|Vector| (|Boolean|)))
          (|p| (|Vector| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) |n| (QREFELT $ 26))
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
                         ((OR (< |e| 1) (SPADCALL |e| |n| (QREFELT $ 24)))
                          (|error| "The list is not a permutation."))
                         ('T
                          (SEQ (SPADCALL |p| |i| |e| (QREFELT $ 20))
                               (EXIT
                                (SPADCALL |seen| |e| 'T (QREFELT $ 28))))))))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                      (GO G190) G191 (EXIT NIL))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |e| 1) (LETT #2# |n|) G190
                        (COND ((|greater_SI| |e| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |seen| |e| (QREFELT $ 29)))
                            (PROGN
                             (LETT #1#
                                   (|error| "The list is not a permutation."))
                             (GO #5=#:G152))))))
                        (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #1#))
                 (EXIT |p|))))))) 

(SDEFUN |CARTEN;permute!|
        ((|t| |Vector| (|Integer|)) (|s| |Vector| (|Integer|))
         (|p| |Vector| (|Integer|)) ($ |Vector| (|Integer|)))
        (SPROG ((#1=#:G163 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |p|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |t| |i|
                                 (SPADCALL |s|
                                           (SPADCALL |p| |i| (QREFELT $ 23))
                                           (QREFELT $ 23))
                                 (QREFELT $ 20))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |t|)))) 

(SDEFUN |CARTEN;permsign!| ((|v| |Vector| (|Integer|)) ($ |Integer|))
        (SPROG
         ((#1=#:G178 NIL) (#2=#:G182 NIL) (|i| NIL) (|totTrans| (|Integer|))
          (|e| (|Integer|)) (|nTrans| (|Integer|)) (#3=#:G180 NIL)
          (#4=#:G181 NIL) (|j| NIL) (|n| (|Integer|)) (#5=#:G179 NIL)
          (|psum| (|Integer|)) (#6=#:G165 NIL) (|maxix| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |maxix| (- (+ (QREFELT $ 6) (QVSIZE |v|)) 1))
                (LETT |psum|
                      (PROG2
                          (LETT #6#
                                (SPADCALL
                                 (- (* (+ |maxix| 1) |maxix|)
                                    (* (QREFELT $ 6) (- (QREFELT $ 6) 1)))
                                 2 (QREFELT $ 31)))
                          (QCDR #6#)
                        (|check_union2| (QEQCAR #6# 0) (|Integer|)
                                        (|Union| (|Integer|) "failed") #6#)))
                (LETT |n| 0)
                (SEQ (LETT |i| 1) (LETT #5# (QVSIZE |v|)) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |n| (+ |n| (SPADCALL |v| |i| (QREFELT $ 23))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n| |psum| (QREFELT $ 22)) 0)
                       (#7='T
                        (SEQ (LETT |totTrans| 0) (LETT |nTrans| 1)
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |nTrans| 0 (QREFELT $ 22)))
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
                                               ((SPADCALL
                                                 (SPADCALL |v| |i|
                                                           (QREFELT $ 23))
                                                 (SPADCALL |v| |j|
                                                           (QREFELT $ 23))
                                                 (QREFELT $ 24))
                                                (SEQ
                                                 (LETT |nTrans| (+ |nTrans| 1))
                                                 (LETT |e|
                                                       (SPADCALL |v| |i|
                                                                 (QREFELT $
                                                                          23)))
                                                 (SPADCALL |v| |i|
                                                           (SPADCALL |v| |j|
                                                                     (QREFELT $
                                                                              23))
                                                           (QREFELT $ 20))
                                                 (EXIT
                                                  (SPADCALL |v| |j| |e|
                                                            (QREFELT $
                                                                     20))))))))
                                            (LETT |i|
                                                  (PROG1 (|inc_SI| |i|)
                                                    (LETT |j| (|inc_SI| |j|))))
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (LETT |totTrans|
                                              (+ |totTrans| |nTrans|))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| 1) (LETT #2# (QREFELT $ 7)) G190
                                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |i| (QREFELT $ 23))
                                       (- (+ (QREFELT $ 6) |i|) 1)
                                       (QREFELT $ 22))
                                      (PROGN (LETT #1# 0) (GO #8=#:G177))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (COND ((ODDP |totTrans|) -1) (#7# 1)))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |CARTEN;ravel;$L;8| ((|x| $) ($ |List| R))
        (SPROG ((#1=#:G186 NIL) (|i| NIL) (#2=#:G185 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0)
                      (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |x| |i| (QREFELT $ 33)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |CARTEN;unravel;L$;9| ((|l| |List| R) ($ $))
        (SPROG
         ((#1=#:G190 NIL) (|i| NIL) (#2=#:G191 NIL) (|r| NIL) (|z| ($))
          (|nz| (|NonNegativeInteger|)))
         (SEQ (LETT |nz| (LENGTH |l|)) (|CARTEN;lengthRankOrElse| |nz| $)
              (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37)))
              (SEQ (LETT |r| NIL) (LETT #2# |l|) (LETT |i| 0)
                   (LETT #1# (- |nz| 1)) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;kroneckerDelta;$;10| (($ $))
        (SPROG ((#1=#:G195 NIL) (|i| NIL) (#2=#:G196 NIL) (|zi| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT $ 13) (|spadConstant| $ 36)
                                (QREFELT $ 37)))
                (SEQ (LETT |zi| 0) (LETT #2# (+ (QREFELT $ 7) 1)) (LETT |i| 1)
                     (LETT #1# (QREFELT $ 7)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |zi| (|spadConstant| $ 40)
                                 (QREFELT $ 38))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|)
                             (LETT |zi| (|add_SI| |zi| #2#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;leviCivitaSymbol;$;11| (($ $))
        (SPROG
         ((#1=#:G200 NIL) (|i| NIL) (|indv| (|Vector| (|Integer|))) (|z| ($))
          (|nz| (|NonNegativeInteger|)))
         (SEQ (LETT |nz| (EXPT (QREFELT $ 7) (QREFELT $ 7)))
              (LETT |z| (SPADCALL |nz| (|spadConstant| $ 36) (QREFELT $ 37)))
              (LETT |indv| (MAKEARR1 (QREFELT $ 7) 0))
              (SEQ (LETT |i| 0) (LETT #1# (- |nz| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |z| |i|
                               (SPADCALL
                                (|CARTEN;permsign!|
                                 (|CARTEN;int2index| |i| |indv| $) $)
                                (QREFELT $ 41))
                               (QREFELT $ 38))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;degree;$Nni;12| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 43))) 

(SDEFUN |CARTEN;rank;$Nni;13| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 32)))
                    (EXIT (|CARTEN;lengthRankOrElse| |n| $))))) 

(SDEFUN |CARTEN;elt;$R;14| ((|x| $) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) 1 (QREFELT $ 26))
          (|error| "Index error (the rank is not 0)"))
         ('T (SPADCALL |x| 0 (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$IR;15| ((|x| $) (|i| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 7) (QREFELT $ 26))
          (|error| "Index error (the rank is not 1)"))
         ('T (SPADCALL |x| (- |i| (QREFELT $ 6)) (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$2IR;16| ((|x| $) (|i| |Integer|) (|j| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 13)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 2)"))
         ('T
          (SPADCALL |x|
                    (+
                     (SPADCALL (QREFELT $ 7) (- |i| (QREFELT $ 6))
                               (QREFELT $ 25))
                     (- |j| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$3IR;17|
        ((|x| $) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 14)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 3)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (SPADCALL (QREFELT $ 13) (- |i| (QREFELT $ 6))
                                (QREFELT $ 25))
                      (SPADCALL (QREFELT $ 7) (- |j| (QREFELT $ 6))
                                (QREFELT $ 25)))
                     (- |k| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$4IR;18|
        ((|x| $) (|i| |Integer|) (|j| |Integer|) (|k| |Integer|)
         (|l| |Integer|) ($ R))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 15)
                    (QREFELT $ 26))
          (|error| "Index error (the rank is not 4)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (+
                       (SPADCALL (QREFELT $ 14) (- |i| (QREFELT $ 6))
                                 (QREFELT $ 25))
                       (SPADCALL (QREFELT $ 13) (- |j| (QREFELT $ 6))
                                 (QREFELT $ 25)))
                      (SPADCALL (QREFELT $ 7) (- |k| (QREFELT $ 6))
                                (QREFELT $ 25)))
                     (- |l| (QREFELT $ 6)))
                    (QREFELT $ 33))))) 

(SDEFUN |CARTEN;elt;$LR;19| ((|x| $) (|i| |List| (|Integer|)) ($ R))
        (SPROG
         ((|n| (|Integer|)) (|ix| (|Integer|)) (#1=#:G220 NIL) (|ii| NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |i|) (SPADCALL |x| (QREFELT $ 43))
                      (QREFELT $ 26))
            (|error| "Index error (wrong rank)"))
           ('T
            (SEQ (LETT |n| 0)
                 (SEQ (LETT |ii| NIL) (LETT #1# |i|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ii| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |ix| (- |ii| (QREFELT $ 6)))
                           (COND
                            ((OR (< |ix| 0)
                                 (SPADCALL |ix| (- (QREFELT $ 7) 1)
                                           (QREFELT $ 24)))
                             (EXIT (|error| "Index error (out of range)"))))
                           (EXIT
                            (LETT |n|
                                  (+
                                   (SPADCALL (QREFELT $ 7) |n| (QREFELT $ 25))
                                   |ix|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |x| |n| (QREFELT $ 33))))))))) 

(SDEFUN |CARTEN;coerce;L$;20| ((|lr| |List| R) ($ $))
        (SPROG ((#1=#:G225 NIL) (|r| NIL) (#2=#:G226 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (LENGTH |lr|) (QREFELT $ 7) (QREFELT $ 26))
                  (|error| "Incorrect number of components"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36)
                                   (QREFELT $ 37)))
                   (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 7) 1))
                        (LETT |r| NIL) (LETT #1# |lr|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL)
                              (|greater_SI| |i| #2#))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT $ 38))))
                        (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;coerce;L$;21| ((|lx| |List| $) ($ $))
        (SPROG
         ((#1=#:G238 NIL) (|i| NIL) (#2=#:G236 NIL) (|x| NIL) (#3=#:G237 NIL)
          (|offz| NIL) (|z| ($)) (|nx| (|NonNegativeInteger|)) (#4=#:G234 NIL)
          (#5=#:G235 NIL) (|rx| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |lx| (QREFELT $ 54)) (QREFELT $ 7)
                      (QREFELT $ 26))
            (|error| "Incorrect number of slices"))
           ('T
            (SEQ
             (LETT |rx|
                   (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 43)))
             (SEQ
              (EXIT
               (SEQ (LETT |x| NIL) (LETT #5# |lx|) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT $ 43)) |rx|
                                  (QREFELT $ 26))
                        (PROGN
                         (LETT #4# (|error| "Inhomogeneous slice ranks"))
                         (GO #6=#:G228))))))
                    (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #4#))
             (LETT |nx|
                   (SPADCALL (SPADCALL |lx| (QREFELT $ 55)) (QREFELT $ 32)))
             (LETT |z|
                   (SPADCALL (* (QREFELT $ 7) |nx|) (|spadConstant| $ 36)
                             (QREFELT $ 37)))
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
                                     (SPADCALL |x| |i| (QREFELT $ 33))
                                     (QREFELT $ 38))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
                  (LETT #2#
                        (PROG1 (CDR #2#) (LETT |offz| (|add_SI| |offz| #3#))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT |z|))))))) 

(SDEFUN |CARTEN;retractIfCan;$U;22| ((|x| $) ($ |Union| R "failed"))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT $ 43)))
          (CONS 0 (SPADCALL |x| (QREFELT $ 45))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |CARTEN;mkOutf|
        ((|x| $) (|i0| |Integer|) (|rnk| |NonNegativeInteger|)
         ($ |OutputForm|))
        (SPROG
         ((#1=#:G259 NIL) (|j| NIL) (#2=#:G258 NIL) (#3=#:G257 NIL) (|i| NIL)
          (#4=#:G256 NIL) (|nskip| (|NonNegativeInteger|))
          (|rnk1| (|NonNegativeInteger|)) (#5=#:G255 NIL) (#6=#:G254 NIL))
         (SEQ
          (COND
           ((ODDP |rnk|)
            (SEQ (LETT |rnk1| (- |rnk| 1))
                 (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #6# NIL)
                    (SEQ (LETT |i| 0) (LETT #5# (- (QREFELT $ 7) 1)) G190
                         (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (|CARTEN;mkOutf| |x| (+ |i0| (* |nskip| |i|))
                                   |rnk1| $)
                                  #6#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   (QREFELT $ 62)))))
           ((EQL |rnk| 0)
            (SPADCALL (SPADCALL |x| |i0| (QREFELT $ 33)) (QREFELT $ 63)))
           ('T
            (SEQ (LETT |rnk1| (- |rnk| 2))
                 (LETT |nskip| (EXPT (QREFELT $ 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT $ 7) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |j| 0)
                                        (LETT #1# (- (QREFELT $ 7) 1)) G190
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
                                                         (* (QREFELT $ 7) |i|)
                                                         |j|)))
                                                  |rnk1| $)
                                                 #2#))))
                                        (LETT |j| (|inc_SI| |j|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  #4#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   (QREFELT $ 65))))))))) 

(SDEFUN |CARTEN;coerce;$Of;24| ((|x| $) ($ |OutputForm|))
        (|CARTEN;mkOutf| |x| 0 (SPADCALL |x| (QREFELT $ 43)) $)) 

(SDEFUN |CARTEN;Zero;$;25| (($ $))
        (SPADCALL (|spadConstant| $ 36) (QREFELT $ 67))) 

(SDEFUN |CARTEN;One;$;26| (($ $))
        (SPADCALL (|spadConstant| $ 40) (QREFELT $ 67))) 

(SDEFUN |CARTEN;coerce;R$;27| ((|r| R) ($ $)) (SPADCALL 1 |r| (QREFELT $ 37))) 

(SDEFUN |CARTEN;coerce;Dp$;28| ((|v| |DirectProduct| |dim| R) ($ $))
        (SPROG ((#1=#:G267 NIL) (|i| NIL) (#2=#:G268 NIL) (|j| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT $ 7) (|spadConstant| $ 36)
                                (QREFELT $ 37)))
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 71)))
                     (LETT #2# (SPADCALL |v| (QREFELT $ 72))) (LETT |i| 0)
                     (LETT #1# (- (QREFELT $ 7) 1)) G190
                     (COND ((OR (|greater_SI| |i| #1#) (> |j| #2#)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i| (SPADCALL |v| |j| (QREFELT $ 73))
                                 (QREFELT $ 38))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;coerce;Sm$;29| ((|m| |SquareMatrix| |dim| R) ($ $))
        (SPROG
         ((|offz| (|NonNegativeInteger|)) (#1=#:G275 NIL) (|j| NIL)
          (#2=#:G274 NIL) (|i| NIL) (|z| ($)))
         (SEQ
          (LETT |z|
                (SPADCALL (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))
                          (|spadConstant| $ 36) (QREFELT $ 37)))
          (LETT |offz| 0)
          (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 7) 1)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 0) (LETT #1# (- (QREFELT $ 7) 1)) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| (+ |offz| |j|)
                                 (SPADCALL |m| (+ |i| 1) (+ |j| 1)
                                           (QREFELT $ 76))
                                 (QREFELT $ 38))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |offz| (+ |offz| (QREFELT $ 7)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G281 NIL) (#2=#:G282 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                             (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 0)
                         (LETT #2# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                       (SPADCALL |y| |i| (QREFELT $ 33))
                                       (QREFELT $ 78))
                             (PROGN (LETT #1# NIL) (GO #3=#:G280))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))
                #3# (EXIT #1#)))) 

(SDEFUN |CARTEN;+;3$;31| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G287 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                            (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                   (|spadConstant| $ 36) (QREFELT $ 37)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                              (SPADCALL |y| |i| (QREFELT $ 33))
                                              (QREFELT $ 80))
                                    (QREFELT $ 38))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;3$;32| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G292 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT $ 32))
                            (SPADCALL |y| (QREFELT $ 32)) (QREFELT $ 26))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                   (|spadConstant| $ 36) (QREFELT $ 37)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                              (SPADCALL |y| |i| (QREFELT $ 33))
                                              (QREFELT $ 82))
                                    (QREFELT $ 38))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;2$;33| ((|x| $) ($ $))
        (SPROG ((#1=#:G296 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 84))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;I2$;34| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((#1=#:G300 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 86))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;$I$;35| ((|x| $) (|n| |Integer|) ($ $))
        (SPROG ((#1=#:G304 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 86))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;R2$;36| ((|r| R) (|x| $) ($ $))
        (SPROG ((#1=#:G308 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 89))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;$R$;37| ((|x| $) (|r| R) ($ $))
        (SPROG ((#1=#:G312 NIL) (|i| NIL) (|z| ($)))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                                (|spadConstant| $ 36) (QREFELT $ 37)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT $ 33))
                                           (QREFELT $ 89))
                                 (QREFELT $ 38))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;product;3$;38| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G319 NIL) (|j| NIL) (#2=#:G317 NIL) (|i| NIL) (#3=#:G318 NIL)
          (|ioff| NIL) (|z| ($)) (|ny| #4=(|NonNegativeInteger|)) (|nx| #4#))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT $ 32)))
              (LETT |ny| (SPADCALL |y| (QREFELT $ 32)))
              (LETT |z|
                    (SPADCALL (* |nx| |ny|) (|spadConstant| $ 36)
                              (QREFELT $ 37)))
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
                                       (SPADCALL |x| |i| (QREFELT $ 33))
                                       (SPADCALL |y| |j| (QREFELT $ 33))
                                       (QREFELT $ 89))
                                      (QREFELT $ 38))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|)
                           (LETT |ioff| (|add_SI| |ioff| #3#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;*;3$;39| ((|x| $) (|y| $) ($ $))
        (SPROG ((|ry| #1=(|NonNegativeInteger|)) (|rx| #1#))
               (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 43)))
                    (LETT |ry| (SPADCALL |y| (QREFELT $ 43)))
                    (EXIT
                     (COND
                      ((EQL |rx| 0)
                       (SPADCALL (SPADCALL |x| 0 (QREFELT $ 33)) |y|
                                 (QREFELT $ 90)))
                      ((EQL |ry| 0)
                       (SPADCALL |x| (SPADCALL |y| 0 (QREFELT $ 33))
                                 (QREFELT $ 91)))
                      ('T (SPADCALL |x| |rx| |y| 1 (QREFELT $ 93)))))))) 

(SDEFUN |CARTEN;contract;$2I$;40|
        ((|x| $) (|i| . #1=(|Integer|)) (|j| . #2=(|Integer|)) ($ $))
        (SPROG
         ((#3=#:G338 NIL) (|k| NIL) (#4=#:G339 NIL) (|xk| NIL) (#5=#:G335 NIL)
          (|l| NIL) (#6=#:G336 NIL) (|xl| NIL) (#7=#:G337 NIL) (|zl| NIL)
          (#8=#:G332 NIL) (|m| NIL) (#9=#:G333 NIL) (|xm| NIL) (#10=#:G334 NIL)
          (|zm| NIL) (#11=#:G329 NIL) (|h| NIL) (#12=#:G330 NIL) (|xh| NIL)
          (#13=#:G331 NIL) (|zh| NIL) (|z| ($))
          (|xok| #14=(|NonNegativeInteger|)) (|xoh| #14#) (|zoh| #14#)
          (|nh| #15=(|NonNegativeInteger|)) (|rh| (|NonNegativeInteger|))
          (|xom| #14#) (|zom| #15#) (|nm| #15#) (|rm| (|NonNegativeInteger|))
          (|xol| #16=(|PositiveInteger|)) (|zol| #16#) (|nl| #15#)
          (|rl| (|NonNegativeInteger|)) (|#G111| #1#) (|#G110| #2#)
          (|rx| (|NonNegativeInteger|)))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 43)))
              (COND
               ((OR
                 (OR
                  (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24)))
                      (< |j| 1))
                  (SPADCALL |j| |rx| (QREFELT $ 24)))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper index for contraction"))))
              (COND
               ((SPADCALL |i| |j| (QREFELT $ 24))
                (PROGN
                 (LETT |#G110| |j|)
                 (LETT |#G111| |i|)
                 (LETT |i| |#G110|)
                 (LETT |j| |#G111|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT $ 7) |rl|))
              (LETT |zol| 1) (LETT |xol| |zol|) (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT $ 7) |rm|)) (LETT |zom| |nl|)
              (LETT |xom| (* |zom| (QREFELT $ 7))) (LETT |rh| (- |i| 1))
              (LETT |nh| (EXPT (QREFELT $ 7) |rh|)) (LETT |zoh| (* |nl| |nm|))
              (LETT |xoh| (* |zoh| (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))))
              (LETT |xok| (* |nl| (+ 1 (* |nm| (QREFELT $ 7)))))
              (LETT |z|
                    (SPADCALL (* (* |nl| |nm|) |nh|) (|spadConstant| $ 36)
                              (QREFELT $ 37)))
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
                                  (SPADCALL |z| |zl| (|spadConstant| $ 36)
                                            (QREFELT $ 38))
                                  (EXIT
                                   (SEQ (LETT |xk| |xl|) (LETT #4# |xok|)
                                        (LETT |k| 1) (LETT #3# (QREFELT $ 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |k| #3#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |z| |zl|
                                                    (SPADCALL
                                                     (SPADCALL |z| |zl|
                                                               (QREFELT $ 33))
                                                     (SPADCALL |x| |xk|
                                                               (QREFELT $ 33))
                                                     (QREFELT $ 80))
                                                    (QREFELT $ 38))))
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

(SDEFUN |CARTEN;contract;$I$I$;41|
        ((|x| $) (|i| |Integer|) (|y| $) (|j| |Integer|) ($ $))
        (SPROG
         ((#1=#:G360 NIL) (|k| NIL) (#2=#:G361 NIL) (|xk| NIL) (#3=#:G362 NIL)
          (|yk| NIL) (#4=#:G357 NIL) (|dyl| NIL) (#5=#:G358 NIL) (|yl| NIL)
          (#6=#:G359 NIL) (|zly| NIL) (#7=#:G354 NIL) (|dyh| NIL)
          (#8=#:G355 NIL) (|yh| NIL) (#9=#:G356 NIL) (|zhy| NIL)
          (#10=#:G351 NIL) (|dxl| NIL) (#11=#:G352 NIL) (|xl| NIL)
          (#12=#:G353 NIL) (|zlx| NIL) (#13=#:G348 NIL) (|dxh| NIL)
          (#14=#:G349 NIL) (|xh| NIL) (#15=#:G350 NIL) (|zhx| NIL) (|z| ($))
          (|zohx| #16=(|NonNegativeInteger|)) (|ohx| #16#)
          (|nhx| #17=(|NonNegativeInteger|)) (|rhx| (|NonNegativeInteger|))
          (|zolx| #16#) (|olx| #18=(|PositiveInteger|)) (|nlx| #17#)
          (|rlx| (|NonNegativeInteger|)) (|zohy| (|NonNegativeInteger|))
          (|ohy| #16#) (|nhy| #17#) (|rhy| (|NonNegativeInteger|))
          (|zoly| #18#) (|oly| #18#) (|nly| #17#)
          (|rly| (|NonNegativeInteger|)) (|ry| #19=(|NonNegativeInteger|))
          (|rx| #19#))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 43)))
              (LETT |ry| (SPADCALL |y| (QREFELT $ 43)))
              (COND
               ((OR
                 (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24)))
                     (< |j| 1))
                 (SPADCALL |j| |ry| (QREFELT $ 24)))
                (EXIT (|error| "Improper index for contraction"))))
              (LETT |rly| (- |ry| |j|)) (LETT |nly| (EXPT (QREFELT $ 7) |rly|))
              (LETT |oly| 1) (LETT |zoly| 1) (LETT |rhy| (- |j| 1))
              (LETT |nhy| (EXPT (QREFELT $ 7) |rhy|))
              (LETT |ohy| (* |nly| (QREFELT $ 7)))
              (LETT |zohy| (SPADCALL |zoly| |nly| (QREFELT $ 96)))
              (LETT |rlx| (- |rx| |i|)) (LETT |nlx| (EXPT (QREFELT $ 7) |rlx|))
              (LETT |olx| 1) (LETT |zolx| (* |zohy| |nhy|))
              (LETT |rhx| (- |i| 1)) (LETT |nhx| (EXPT (QREFELT $ 7) |rhx|))
              (LETT |ohx| (* |nlx| (QREFELT $ 7)))
              (LETT |zohx| (* |zolx| |nlx|))
              (LETT |z|
                    (SPADCALL (* (* (* |nlx| |nhx|) |nly|) |nhy|)
                              (|spadConstant| $ 36) (QREFELT $ 37)))
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
                                                   (|spadConstant| $ 36)
                                                   (QREFELT $ 38))
                                         (EXIT
                                          (SEQ (LETT |yk| |yl|)
                                               (LETT #3# |nly|)
                                               (LETT |xk| |xl|)
                                               (LETT #2# |nlx|) (LETT |k| 1)
                                               (LETT #1# (QREFELT $ 7)) G190
                                               (COND
                                                ((|greater_SI| |k| #1#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zly|
                                                           (SPADCALL
                                                            (SPADCALL |z| |zly|
                                                                      (QREFELT
                                                                       $ 33))
                                                            (SPADCALL
                                                             (SPADCALL |x| |xk|
                                                                       (QREFELT
                                                                        $ 33))
                                                             (SPADCALL |y| |yk|
                                                                       (QREFELT
                                                                        $ 33))
                                                             (QREFELT $ 89))
                                                            (QREFELT $ 80))
                                                           (QREFELT $ 38))))
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

(SDEFUN |CARTEN;transpose;2$;42| ((|x| $) ($ $))
        (SPADCALL |x| 1 (SPADCALL |x| (QREFELT $ 43)) (QREFELT $ 97))) 

(SDEFUN |CARTEN;transpose;$2I$;43|
        ((|x| $) (|i| . #1=(|Integer|)) (|j| . #2=(|Integer|)) ($ $))
        (SPROG
         ((#3=#:G380 NIL) (|q| NIL) (#4=#:G381 NIL) (|zq| NIL) (#5=#:G382 NIL)
          (|xq| NIL) (#6=#:G377 NIL) (|p| NIL) (#7=#:G378 NIL) (|zp| NIL)
          (#8=#:G379 NIL) (|xp| NIL) (#9=#:G375 NIL) (|l| NIL) (#10=#:G376 NIL)
          (|zl| NIL) (#11=#:G373 NIL) (|m| NIL) (#12=#:G374 NIL) (|zm| NIL)
          (#13=#:G371 NIL) (|h| NIL) (#14=#:G372 NIL) (|zh| NIL) (|z| ($))
          (|zoh| #15=(|NonNegativeInteger|)) (|nh| #16=(|NonNegativeInteger|))
          (|rh| (|NonNegativeInteger|)) (|zoj| #15#) (|zom| #15#) (|nm| #16#)
          (|rm| (|NonNegativeInteger|)) (|zoi| (|NonNegativeInteger|))
          (|zol| (|PositiveInteger|)) (|nl| #16#) (|rl| (|NonNegativeInteger|))
          (|#G147| #1#) (|#G146| #2#) (|rx| (|NonNegativeInteger|)))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 43)))
              (COND
               ((OR
                 (OR
                  (OR (OR (< |i| 1) (SPADCALL |i| |rx| (QREFELT $ 24)))
                      (< |j| 1))
                  (SPADCALL |j| |rx| (QREFELT $ 24)))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper indicies for transposition"))))
              (COND
               ((SPADCALL |i| |j| (QREFELT $ 24))
                (PROGN
                 (LETT |#G146| |j|)
                 (LETT |#G147| |i|)
                 (LETT |i| |#G146|)
                 (LETT |j| |#G147|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT $ 7) |rl|))
              (LETT |zol| 1) (LETT |zoi| (SPADCALL |zol| |nl| (QREFELT $ 96)))
              (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT $ 7) |rm|))
              (LETT |zom| (* |nl| (QREFELT $ 7))) (LETT |zoj| (* |zom| |nm|))
              (LETT |rh| (- |i| 1)) (LETT |nh| (EXPT (QREFELT $ 7) |rh|))
              (LETT |zoh|
                    (* (* |nl| |nm|)
                       (SPADCALL (QREFELT $ 7) 2 (QREFELT $ 12))))
              (LETT |z|
                    (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                              (|spadConstant| $ 36) (QREFELT $ 37)))
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
                                        (LETT |p| 1) (LETT #6# (QREFELT $ 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |p| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |xq| |xp|)
                                               (LETT #5# |zoi|)
                                               (LETT |zq| |zp|)
                                               (LETT #4# |zoj|) (LETT |q| 1)
                                               (LETT #3# (QREFELT $ 7)) G190
                                               (COND
                                                ((|greater_SI| |q| #3#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zq|
                                                           (SPADCALL |x| |xq|
                                                                     (QREFELT $
                                                                              33))
                                                           (QREFELT $ 38))))
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

(SDEFUN |CARTEN;reindex;$L$;44| ((|x| $) (|l| |List| (|Integer|)) ($ $))
        (SPROG
         ((|pi| (|Integer|)) (#1=#:G387 NIL) (|i| NIL)
          (|ziv| #2=(|Vector| (|Integer|))) (|xiv| #2#)
          (|p| (|Vector| (|Integer|))) (|rx| (|NonNegativeInteger|)) (|z| ($))
          (|nx| (|NonNegativeInteger|)))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT $ 32)))
              (LETT |z| (SPADCALL |nx| (|spadConstant| $ 36) (QREFELT $ 37)))
              (LETT |rx| (SPADCALL |x| (QREFELT $ 43)))
              (LETT |p| (|CARTEN;mkPerm| |rx| |l| $))
              (LETT |xiv| (MAKEARR1 |rx| 0)) (LETT |ziv| (MAKEARR1 |rx| 0))
              (SEQ (LETT |i| 0) (LETT #1# (- (SPADCALL |x| (QREFELT $ 32)) 1))
                   G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |pi|
                          (|CARTEN;index2int|
                           (|CARTEN;permute!| |ziv|
                            (|CARTEN;int2index| |i| |xiv| $) |p| $)
                           $))
                    (EXIT
                     (SPADCALL |z| |pi| (SPADCALL |x| |i| (QREFELT $ 33))
                               (QREFELT $ 38))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(DECLAIM (NOTINLINE |CartesianTensor;|)) 

(DEFUN |CartesianTensor| (&REST #1=#:G388)
  (SPROG NIL
         (PROG (#2=#:G389)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CartesianTensor|)
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
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|CartesianTensor| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 103))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CartesianTensor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (|IndexedVector| |#3| 0))
          (QSETREFV $ 13 (SPADCALL |#2| 2 (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL |#2| 3 (QREFELT $ 12)))
          (QSETREFV $ 15 (SPADCALL |#2| 4 (QREFELT $ 12)))
          $))) 

(MAKEPROP '|CartesianTensor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (|PositiveInteger|) (|NonNegativeInteger|)
              (0 . ^) '|dim2| '|dim3| '|dim4| |CARTEN;kroneckerDelta;$;10|
              |CARTEN;sample;$;1| (|Integer|) (|Vector| 18) (6 . |setelt!|)
              (|Boolean|) (13 . ~=) (19 . |elt|) (25 . >) (31 . *) (37 . ~=)
              (|Vector| 21) (43 . |setelt!|) (50 . |elt|) (|Union| $ '"failed")
              (56 . |exquo|) (62 . |#|) (67 . |elt|) (|List| 8)
              |CARTEN;ravel;$L;8| (73 . |Zero|) (77 . |new|) (83 . |setelt!|)
              |CARTEN;unravel;L$;9| (90 . |One|) (94 . |coerce|)
              |CARTEN;leviCivitaSymbol;$;11| |CARTEN;rank;$Nni;13|
              |CARTEN;degree;$Nni;12| |CARTEN;elt;$R;14| |CARTEN;elt;$IR;15|
              |CARTEN;elt;$2IR;16| |CARTEN;elt;$3IR;17| |CARTEN;elt;$4IR;18|
              (|List| 18) |CARTEN;elt;$LR;19| |CARTEN;coerce;L$;20| (|List| $$)
              (99 . |#|) (104 . |first|) (|List| $) |CARTEN;coerce;L$;21|
              (|Union| 8 '"failed") |CARTEN;retractIfCan;$U;22| (|OutputForm|)
              (|List| 60) (109 . |coerce|) (114 . |coerce|) (|List| 56)
              (119 . |matrix|) |CARTEN;coerce;$Of;24| |CARTEN;coerce;R$;27|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;Zero;$;25|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |CARTEN;One;$;26|) $))
              (|DirectProduct| (NRTEVAL (QREFELT $ 7)) 8) (124 . |minIndex|)
              (129 . |maxIndex|) (134 . |elt|) |CARTEN;coerce;Dp$;28|
              (|SquareMatrix| (NRTEVAL (QREFELT $ 7)) 8) (140 . |elt|)
              |CARTEN;coerce;Sm$;29| (147 . ~=) |CARTEN;=;2$B;30| (153 . +)
              |CARTEN;+;3$;31| (159 . -) |CARTEN;-;3$;32| (165 . -)
              |CARTEN;-;2$;33| (170 . *) |CARTEN;*;I2$;34| |CARTEN;*;$I$;35|
              (176 . *) |CARTEN;*;R2$;36| |CARTEN;*;$R$;37|
              |CARTEN;product;3$;38| |CARTEN;contract;$I$I$;41|
              |CARTEN;*;3$;39| |CARTEN;contract;$2I$;40| (182 . *)
              |CARTEN;transpose;$2I$;43| |CARTEN;transpose;2$;42|
              |CARTEN;reindex;$L$;44| (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 188 |unravel| 194 |transpose| 199 |sample| 211 |retractIfCan|
              215 |retract| 220 |reindex| 225 |ravel| 231 |rank| 236 |product|
              241 |leviCivitaSymbol| 247 |latex| 251 |kroneckerDelta| 256
              |hashUpdate!| 260 |hash| 266 |elt| 271 |degree| 312 |contract|
              317 |coerce| 332 |Zero| 362 |One| 366 = 370 - 376 + 387 * 393)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|GradedAlgebra&| |GradedModule&| |GradedModule&|
                     |SetCategory&| |BasicType&| |RetractableTo&| NIL)
                  (CONS
                   '#((|GradedAlgebra| 8 11) (|GradedModule| 8 11)
                      (|GradedModule| 18 11) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 8) (|CoercibleTo| 60))
                   (|makeByteWordVec2| 102
                                       '(2 11 0 0 10 12 3 19 18 0 18 18 20 2 18
                                         21 0 0 22 2 19 18 0 18 23 2 18 21 0 0
                                         24 2 18 0 11 0 25 2 11 21 0 0 26 3 27
                                         21 0 18 21 28 2 27 21 0 18 29 2 18 30
                                         0 0 31 1 9 11 0 32 2 9 8 0 18 33 0 8 0
                                         36 2 9 0 11 8 37 3 9 8 0 18 8 38 0 8 0
                                         40 1 8 0 18 41 1 53 11 0 54 1 53 2 0
                                         55 1 61 60 0 62 1 8 60 0 63 1 60 0 64
                                         65 1 70 18 0 71 1 70 18 0 72 2 70 8 0
                                         18 73 3 75 8 0 18 18 76 2 8 21 0 0 78
                                         2 8 0 0 0 80 2 8 0 0 0 82 1 8 0 0 84 2
                                         8 0 18 0 86 2 8 0 0 0 89 2 11 0 10 0
                                         96 2 0 21 0 0 1 1 0 0 34 39 3 0 0 0 18
                                         18 97 1 0 0 0 98 0 0 0 17 1 0 58 0 59
                                         1 0 8 0 1 2 0 0 0 50 99 1 0 34 0 35 1
                                         0 11 0 43 2 0 0 0 0 92 0 0 0 42 1 0
                                         100 0 1 0 0 0 16 2 0 102 102 0 1 1 0
                                         101 0 1 2 0 8 0 50 51 5 0 8 0 18 18 18
                                         18 49 3 0 8 0 18 18 47 4 0 8 0 18 18
                                         18 48 2 0 8 0 18 46 1 0 8 0 45 1 0 11
                                         0 44 4 0 0 0 18 0 18 93 3 0 0 0 18 18
                                         95 1 0 0 56 57 1 0 0 75 77 1 0 0 34 52
                                         1 0 0 70 74 1 0 0 8 67 1 0 60 0 66 0 0
                                         0 68 0 0 0 69 2 0 21 0 0 79 2 0 0 0 0
                                         83 1 0 0 0 85 2 0 0 0 0 81 2 0 0 0 0
                                         94 2 0 0 18 0 87 2 0 0 0 18 88 2 0 0 0
                                         8 91 2 0 0 8 0 90)))))
           '|lookupComplete|)) 
