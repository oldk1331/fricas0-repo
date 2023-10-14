
(SDEFUN |FFFG;ShiftAction;2NniVD;1|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V) ($ D))
        (SPADCALL (EXPT |k| |l|) (SPADCALL |f| |k| (QREFELT $ 9))
                  (QREFELT $ 10))) 

(SDEFUN |FFFG;ShiftC;NniL;2| ((|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((#1=#:G115 NIL) (|i| NIL) (#2=#:G114 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FFFG;ShiftC;NniL;2|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |total| 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 15)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FFFG;qShiftAction;D2NniVD;3|
        ((|q| D) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V)
         ($ D))
        (SPADCALL (SPADCALL |q| (* |k| |l|) (QREFELT $ 18))
                  (SPADCALL |f| |k| (QREFELT $ 9)) (QREFELT $ 19))) 

(SDEFUN |FFFG;qShiftC;DNniL;4|
        ((|q| D) (|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((#1=#:G120 NIL) (|i| NIL) (#2=#:G119 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FFFG;qShiftC;DNniL;4|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |total| 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 18)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FFFG;DiffAction;2NniVD;5|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V) ($ D))
        (SPROG ((#1=#:G121 NIL))
               (COND ((< |k| |l|) (|spadConstant| $ 22))
                     ('T
                      (SPADCALL |f|
                                (PROG1
                                    (LETT #1# (- |k| |l|)
                                          |FFFG;DiffAction;2NniVD;5|)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 9)))))) 

(SDEFUN |FFFG;DiffC;NniL;6| ((|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((|i| NIL) (#1=#:G125 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL . #2=(|FFFG;DiffC;NniL;6|))
                 (SEQ (LETT |i| 1 . #2#) G190
                      (COND ((|greater_SI| |i| |total|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (|spadConstant| $ 22) #1#) . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FFFG;generalCoefficient;MVNniVD;7|
        ((|coeffAction| |Mapping| D (|NonNegativeInteger|)
          (|NonNegativeInteger|) V)
         (|f| |Vector| V) (|k| |NonNegativeInteger|)
         (|p| |Vector| (|SparseUnivariatePolynomial| D)) ($ D))
        (SPROG
         ((|res| (D)) (#1=#:G134 NIL) (|l| NIL)
          (|b| (|SparseUnivariatePolynomial| D)) (|a| (V)) (#2=#:G133 NIL)
          (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 22)
                . #3=(|FFFG;generalCoefficient;MVNniVD;7|))
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |f|) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |a| (SPADCALL |f| |i| (QREFELT $ 26)) . #3#)
                    (LETT |b| (SPADCALL |p| |i| (QREFELT $ 29)) . #3#)
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |b| (QREFELT $ 30)) . #3#)
                          (LETT #1# (SPADCALL |b| (QREFELT $ 31)) . #3#) G190
                          (COND ((> |l| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |b| |l| (QREFELT $ 32))
                                         (QREFELT $ 34)))
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 32))
                                               (SPADCALL |k| |l| |a|
                                                         |coeffAction|)
                                               (QREFELT $ 19))
                                              (QREFELT $ 35))
                                    . #3#)))))
                          (LETT |l| (+ |l| 1) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FFFG;generalInterpolation;LMVLM;8|
        ((C |List| D)
         (|coeffAction| |Mapping| D (|NonNegativeInteger|)
          (|NonNegativeInteger|) V)
         (|f| |Vector| V) (|eta| |List| (|NonNegativeInteger|))
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|c|
           (|Mapping| D (|NonNegativeInteger|)
                      (|Vector| (|SparseUnivariatePolynomial| D)))))
         (SEQ
          (LETT |c|
                (CONS #'|FFFG;generalInterpolation;LMVLM;8!0|
                      (VECTOR $ |f| |coeffAction|))
                |FFFG;generalInterpolation;LMVLM;8|)
          (EXIT (SPADCALL C |c| |eta| (QREFELT $ 43)))))) 

(SDEFUN |FFFG;generalInterpolation;LMVLM;8!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|coeffAction| |f| $)
          (LETT |coeffAction| (QREFELT $$ 2)
                . #1=(|FFFG;generalInterpolation;LMVLM;8|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G138 NIL))
                   (SPADCALL |coeffAction| |f|
                             (PROG1
                                 (LETT #2#
                                       (SPADCALL |x| (|spadConstant| $ 38)
                                                 (QREFELT $ 39))
                                       NIL)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             |y| (QREFELT $ 37))))))) 

(SDEFUN |FFFG;nextVector!|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Union| "failed" (|List| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G157 NIL) (#2=#:G162 NIL) (|sum| (|Integer|)) (#3=#:G150 NIL)
          (#4=#:G163 NIL) (|j| NIL) (|i| NIL) (|pos| (|Integer|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |v| (QREFELT $ 45)) . #5=(|FFFG;nextVector!|))
            (LETT |pos|
                  (SPADCALL (CONS #'|FFFG;nextVector!!0| (VECTOR $ |p|)) |v|
                            (QREFELT $ 48))
                  . #5#)
            (EXIT
             (COND
              ((ZEROP |pos|)
               (PROGN (LETT #2# (CONS 0 "failed") . #5#) (GO #6=#:G161)))
              (#7='T
               (SEQ
                (COND
                 ((EQL |pos| 1)
                  (SEQ (LETT |sum| (SPADCALL |v| 1 (QREFELT $ 49)) . #5#)
                       (SEQ (LETT |i| 2 . #5#) G190
                            (COND ((|greater_SI| |i| |n|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((< (SPADCALL |v| |i| (QREFELT $ 49)) |p|)
                                (COND
                                 ((SPADCALL |sum| 0 (QREFELT $ 51))
                                  (SEQ
                                   (SPADCALL |v| |i|
                                             (+
                                              (SPADCALL |v| |i| (QREFELT $ 49))
                                              1)
                                             (QREFELT $ 52))
                                   (LETT |sum| (- |sum| 1) . #5#)
                                   (SEQ (LETT |j| 1 . #5#)
                                        (LETT #4# (- |i| 1) . #5#) G190
                                        (COND
                                         ((|greater_SI| |j| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |sum| |p| (QREFELT $ 51))
                                            (SEQ
                                             (SPADCALL |v| |j| |p|
                                                       (QREFELT $ 52))
                                             (EXIT
                                              (LETT |sum| (- |sum| |p|)
                                                    . #5#))))
                                           ('T
                                            (SEQ
                                             (SPADCALL |v| |j|
                                                       (PROG1
                                                           (LETT #3# |sum|
                                                                 . #5#)
                                                         (|check_subtype|
                                                          (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          #3#))
                                                       (QREFELT $ 52))
                                             (EXIT (LETT |sum| 0 . #5#)))))))
                                        (LETT |j| (|inc_SI| |j|) . #5#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (PROGN
                                     (LETT #2# (CONS 1 |v|) . #5#)
                                     (GO #6#)))))
                                 ('T
                                  (LETT |sum|
                                        (+ |sum|
                                           (SPADCALL |v| |i| (QREFELT $ 49)))
                                        . #5#))))
                               ('T
                                (LETT |sum|
                                      (+ |sum|
                                         (SPADCALL |v| |i| (QREFELT $ 49)))
                                      . #5#)))))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (PROGN (LETT #2# (CONS 0 "failed") . #5#) (GO #6#)))))
                 (#7#
                  (SEQ
                   (SPADCALL |v| |pos|
                             (+ (SPADCALL |v| |pos| (QREFELT $ 49)) 1)
                             (QREFELT $ 52))
                   (EXIT
                    (SPADCALL |v| (- |pos| 1)
                              (PROG1
                                  (LETT #1#
                                        (-
                                         (SPADCALL |v| (- |pos| 1)
                                                   (QREFELT $ 49))
                                         1)
                                        . #5#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 52))))))
                (EXIT (CONS 1 |v|))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |FFFG;nextVector!!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|FFFG;nextVector!|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 46)))))) 

(SDEFUN |FFFG;vectorStream|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|FFFG;vectorStream!0| (VECTOR $ |v| |p|))
                          (QREFELT $ 58))))) 

(SDEFUN |FFFG;vectorStream!0| (($$ NIL))
        (PROG (|p| |v| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|FFFG;vectorStream|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|next| NIL))
                   (SEQ
                    (LETT |next|
                          (|FFFG;nextVector!| |p| (SPADCALL |v| (QREFELT $ 53))
                           $)
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |next| 0) (SPADCALL (QREFELT $ 55)))
                           ('T
                            (SPADCALL (QCDR |next|)
                                      (|FFFG;vectorStream| |p| (QCDR |next|) $)
                                      (QREFELT $ 56))))))))))) 

(SDEFUN |FFFG;vectorStream2|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|FFFG;vectorStream2!0| (VECTOR $ |v| |p|))
                          (QREFELT $ 58))))) 

(SDEFUN |FFFG;vectorStream2!0| (($$ NIL))
        (PROG (|p| |v| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|FFFG;vectorStream2|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|next| NIL) (|next2| NIL))
                   (SEQ
                    (LETT |next|
                          (|FFFG;nextVector!| |p| (SPADCALL |v| (QREFELT $ 53))
                           $)
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |next| 0) (SPADCALL (QREFELT $ 55)))
                           ('T
                            (SEQ
                             (LETT |next2|
                                   (|FFFG;nextVector!| |p|
                                    (SPADCALL (QCDR |next|) (QREFELT $ 53)) $)
                                   NIL)
                             (EXIT
                              (COND
                               ((QEQCAR |next2| 0)
                                (SPADCALL (QCDR |next|)
                                          (SPADCALL (QREFELT $ 55))
                                          (QREFELT $ 56)))
                               ('T
                                (SPADCALL (QCDR |next2|)
                                          (|FFFG;vectorStream2| |p|
                                           (QCDR |next2|) $)
                                          (QREFELT $ 56))))))))))))))) 

(SDEFUN |FFFG;initialVector|
        ((|sum| |NonNegativeInteger|) (|maxEta| |NonNegativeInteger|)
         (|n| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G186 NIL) (#2=#:G184 NIL) (|entry| (|Integer|)) (|i| NIL)
          (#3=#:G191 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|FFFG;initialVector|))
           (SEQ (LETT |i| 1 . #4#) G190
                (COND ((|greater_SI| |i| |n|) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SEQ
                          (COND
                           ((< |sum| |maxEta|)
                            (SEQ (LETT |entry| |sum| . #4#)
                                 (EXIT (LETT |sum| 0 . #4#))))
                           ('T
                            (SEQ (LETT |entry| |maxEta| . #4#)
                                 (EXIT
                                  (LETT |sum|
                                        (PROG1
                                            (LETT #2# (- |sum| |maxEta|) . #4#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        . #4#)))))
                          (EXIT
                           (PROG1 (LETT #1# |entry| . #4#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))))
                         #3#)
                        . #4#)))
                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                (EXIT (NREVERSE #3#))))))) 

(SDEFUN |FFFG;genVectorStream;3NniS;13|
        ((|sum| |NonNegativeInteger|) (|max| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|)
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG ((|eta| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |eta| (|FFFG;initialVector| |sum| |max| |k| $)
                      |FFFG;genVectorStream;3NniS;13|)
                (EXIT
                 (SPADCALL |eta| (|FFFG;vectorStream| |max| |eta| $)
                           (QREFELT $ 56)))))) 

(SDEFUN |FFFG;genVectorStream2;3NniS;14|
        ((|sum| |NonNegativeInteger|) (|max| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|)
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG ((|eta| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |eta| (|FFFG;initialVector| |sum| |max| |k| $)
                      |FFFG;genVectorStream2;3NniS;14|)
                (EXIT
                 (SPADCALL |eta| (|FFFG;vectorStream2| |max| |eta| $)
                           (QREFELT $ 56)))))) 

(SDEFUN |FFFG;interpolate;2LNniF;15|
        ((|x| |List| (|Fraction| D)) (|y| |List| (|Fraction| D))
         (|d| |NonNegativeInteger|)
         ($ |Fraction| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|r| (|Fraction| (|SparseUnivariatePolynomial| D)))
          (|gy| #1=(|Record| (|:| |num| (|List| D)) (|:| |den| D))) (|gx| #1#))
         (SEQ
          (LETT |gx| (SPADCALL |x| (QREFELT $ 64))
                . #2=(|FFFG;interpolate;2LNniF;15|))
          (LETT |gy| (SPADCALL |y| (QREFELT $ 64)) . #2#)
          (LETT |r| (SPADCALL (QCAR |gx|) (QCAR |gy|) |d| (QREFELT $ 66))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |r| (QREFELT $ 67))
                      (SPADCALL (QCDR |gx|) 1 (QREFELT $ 68)) (QREFELT $ 69))
            (SPADCALL (QCDR |gy|)
                      (SPADCALL (SPADCALL |r| (QREFELT $ 70))
                                (SPADCALL (QCDR |gx|) 1 (QREFELT $ 68))
                                (QREFELT $ 69))
                      (QREFELT $ 71))
            (QREFELT $ 72)))))) 

(SDEFUN |FFFG;interpolate;2LNniF;16|
        ((|x| |List| D) (|y| |List| D) (|d| |NonNegativeInteger|)
         ($ |Fraction| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((M (|Matrix| (|SparseUnivariatePolynomial| D)))
          (|eta| (|List| (|NonNegativeInteger|))) (#1=#:G201 NIL)
          (|c|
           (|Mapping| D (|NonNegativeInteger|)
                      (|Vector| (|SparseUnivariatePolynomial| D))))
          (N (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (LETT N (LENGTH |x|) . #2=(|FFFG;interpolate;2LNniF;16|))
                      (LENGTH |y|) (QREFELT $ 74))
            (|error| "interpolate: number of points and values must match")))
          (COND
           ((SPADCALL N |d| (QREFELT $ 75))
            (|error|
             "interpolate: numerator degree must be smaller than number of data points")))
          (LETT |c| (CONS #'|FFFG;interpolate;2LNniF;16!0| (VECTOR |x| $ |y|))
                . #2#)
          (LETT |eta|
                (LIST |d|
                      (PROG1 (LETT #1# (- N |d|) . #2#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#)))
                . #2#)
          (LETT M (SPADCALL |x| |c| |eta| (QREFELT $ 43)) . #2#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL M 2 1 (QREFELT $ 81)) (QREFELT $ 82))
             (SPADCALL (SPADCALL M 1 2 (QREFELT $ 81))
                       (SPADCALL M 2 2 (QREFELT $ 81)) (QREFELT $ 72)))
            ('T
             (SPADCALL (SPADCALL M 1 1 (QREFELT $ 81))
                       (SPADCALL M 2 1 (QREFELT $ 81)) (QREFELT $ 72)))))))) 

(SDEFUN |FFFG;interpolate;2LNniF;16!0| ((|s| NIL) (|u| NIL) ($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|FFFG;interpolate;2LNniF;16|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |y| |s| (QREFELT $ 76))
                       (SPADCALL (SPADCALL |u| 2 (QREFELT $ 29))
                                 (SPADCALL |x| |s| (QREFELT $ 76))
                                 (QREFELT $ 77))
                       (QREFELT $ 19))
             (SPADCALL (SPADCALL |u| (|spadConstant| $ 79) (QREFELT $ 29))
                       (SPADCALL |x| |s| (QREFELT $ 76)) (QREFELT $ 77))
             (QREFELT $ 80)))))) 

(SDEFUN |FFFG;recurrence|
        ((M |Matrix| (|SparseUnivariatePolynomial| D))
         (|pi| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|r| |Vector| D) (|d| D) (|z| |SparseUnivariatePolynomial| D) (|Ck| D)
         (|p| |Vector| D) ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((#1=#:G207 NIL) (|newMiPi| (|SparseUnivariatePolynomial| D))
          (|pl| (D)) (|Mil| (|SparseUnivariatePolynomial| D)) (|rl| (D))
          (|l| NIL) (|MiPi| (|SparseUnivariatePolynomial| D)) (|i| NIL)
          (|polyf| (|SparseUnivariatePolynomial| D)) (|rPi| (D)))
         (SEQ (LETT |rPi| (QAREF1O |r| |pi| 1) . #2=(|FFFG;recurrence|))
              (LETT |polyf|
                    (SPADCALL |rPi|
                              (SPADCALL |z| (SPADCALL |Ck| (QREFELT $ 83))
                                        (QREFELT $ 84))
                              (QREFELT $ 71))
                    . #2#)
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |m|) (GO G191)))
                   (SEQ (LETT |MiPi| (QAREF2O M |i| |pi| 1 1) . #2#)
                        (LETT |newMiPi|
                              (SPADCALL |polyf| |MiPi| (QREFELT $ 85)) . #2#)
                        (SEQ (LETT |l| 1 . #2#) G190
                             (COND ((|greater_SI| |l| |m|) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |l| |pi| (QREFELT $ 74))
                                 (SEQ (LETT |rl| (QAREF1O |r| |l| 1) . #2#)
                                      (LETT |Mil|
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QAREF2O M |i| |l| 1
                                                                  1)
                                                         |rPi| (QREFELT $ 86))
                                                        (SPADCALL |MiPi| |rl|
                                                                  (QREFELT $
                                                                           86))
                                                        (QREFELT $ 84))
                                                       |d| (QREFELT $ 88))
                                                      . #2#)
                                                (QCDR #1#)
                                              (|check_union| (QEQCAR #1# 0)
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 6))
                                                             #1#))
                                            . #2#)
                                      (QSETAREF2O M |i| |l| |Mil| 1 1)
                                      (LETT |pl| (QAREF1O |p| |l| 1) . #2#)
                                      (EXIT
                                       (LETT |newMiPi|
                                             (SPADCALL |newMiPi|
                                                       (SPADCALL |pl| |Mil|
                                                                 (QREFELT $
                                                                          71))
                                                       (QREFELT $ 84))
                                             . #2#)))))))
                             (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (QSETAREF2O M |i| |pi|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |newMiPi| |d|
                                                         (QREFELT $ 88))
                                               . #2#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 6))
                                                      #1#))
                                     1 1)))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT M)))) 

(SDEFUN |FFFG;fffg;LMLM;18|
        ((C |List| D)
         (|c| |Mapping| D (|NonNegativeInteger|)
          (|Vector| (|SparseUnivariatePolynomial| D)))
         (|eta| |List| (|NonNegativeInteger|))
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|d| (D)) (M (|Matrix| (|SparseUnivariatePolynomial| D)))
          (#1=#:G227 NIL) (|l| NIL) (|lambda| (|NonNegativeInteger|))
          (|lambdaMax| (|Integer|)) (|Lambda| (|List| (|Integer|)))
          (#2=#:G235 NIL) (|k| NIL) (|p| #3=(|Vector| D)) (|r| #3#)
          (|etak| (|Vector| (|NonNegativeInteger|))) (K (|NonNegativeInteger|))
          (|m| (|NonNegativeInteger|)) (|z| (|SparseUnivariatePolynomial| D)))
         (SEQ
          (LETT |z| (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 68))
                . #4=(|FFFG;fffg;LMLM;18|))
          (LETT |m| (SPADCALL |eta| (QREFELT $ 45)) . #4#)
          (LETT M (SPADCALL |m| (|spadConstant| $ 89) (QREFELT $ 90)) . #4#)
          (LETT |d| (|spadConstant| $ 12) . #4#)
          (LETT K (SPADCALL (ELT $ 91) |eta| (QREFELT $ 93)) . #4#)
          (LETT |etak| (SPADCALL |m| (QREFELT $ 95)) . #4#)
          (LETT |r| (SPADCALL |m| (QREFELT $ 97)) . #4#)
          (LETT |p| (SPADCALL |m| (QREFELT $ 97)) . #4#)
          (SEQ (LETT |k| 1 . #4#) G190 (COND ((|greater_SI| |k| K) (GO G191)))
               (SEQ
                (SEQ (LETT |l| 1 . #4#) G190
                     (COND ((|greater_SI| |l| |m|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |r| |l|
                                 (SPADCALL |k| (SPADCALL M |l| (QREFELT $ 98))
                                           |c|)
                                 (QREFELT $ 99))))
                     (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |Lambda|
                      (PROGN
                       (LETT #2# NIL . #4#)
                       (SEQ (LETT |l| 1 . #4#) G190
                            (COND ((|greater_SI| |l| |m|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (SPADCALL |r| |l| (QREFELT $ 100))
                                          (|spadConstant| $ 22)
                                          (QREFELT $ 101))
                                (LETT #2#
                                      (CONS
                                       (- (SPADCALL |eta| |l| (QREFELT $ 49))
                                          (SPADCALL |etak| |l|
                                                    (QREFELT $ 102)))
                                       #2#)
                                      . #4#)))))
                            (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #4#)
                (EXIT
                 (COND ((NULL |Lambda|) "iterate")
                       ('T
                        (SEQ
                         (LETT |lambdaMax|
                               (SPADCALL (ELT $ 104) |Lambda| (QREFELT $ 107))
                               . #4#)
                         (LETT |lambda| 1 . #4#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((<
                                    (- (SPADCALL |eta| |lambda| (QREFELT $ 49))
                                       (SPADCALL |etak| |lambda|
                                                 (QREFELT $ 102)))
                                    |lambdaMax|)
                                   'T)
                                  ('T
                                   (SPADCALL
                                    (SPADCALL |r| |lambda| (QREFELT $ 100))
                                    (|spadConstant| $ 22) (QREFELT $ 108)))))
                                (GO G191)))
                              (SEQ (EXIT (LETT |lambda| (+ |lambda| 1) . #4#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (SEQ (LETT |l| 1 . #4#) G190
                              (COND ((|greater_SI| |l| |m|) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |l| |lambda| (QREFELT $ 74))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |etak| |l| (QREFELT $ 102)) 0
                                     (QREFELT $ 109))
                                    (SPADCALL |p| |l|
                                              (SPADCALL
                                               (SPADCALL M |l| |lambda|
                                                         (QREFELT $ 81))
                                               (PROG1
                                                   (LETT #1#
                                                         (-
                                                          (SPADCALL |etak| |l|
                                                                    (QREFELT $
                                                                             102))
                                                          1)
                                                         . #4#)
                                                 (|check_subtype| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                               (QREFELT $ 32))
                                              (QREFELT $ 99)))
                                   ('T
                                    (SPADCALL |p| |l| (|spadConstant| $ 22)
                                              (QREFELT $ 99))))))))
                              (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (LETT M
                               (|FFFG;recurrence| M |lambda| |m| |r| |d| |z|
                                (SPADCALL C |k| (QREFELT $ 76)) |p| $)
                               . #4#)
                         (LETT |d| (SPADCALL |r| |lambda| (QREFELT $ 100))
                               . #4#)
                         (EXIT
                          (SPADCALL |etak| |lambda|
                                    (+
                                     (SPADCALL |etak| |lambda| (QREFELT $ 102))
                                     1)
                                    (QREFELT $ 110))))))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT M)))) 

(DECLAIM (NOTINLINE |FractionFreeFastGaussian;|)) 

(DEFUN |FractionFreeFastGaussian| (&REST #1=#:G236)
  (SPROG NIL
         (PROG (#2=#:G237)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FractionFreeFastGaussian|)
                                               '|domainEqualList|)
                    . #3=(|FractionFreeFastGaussian|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FractionFreeFastGaussian;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FractionFreeFastGaussian|)))))))))) 

(DEFUN |FractionFreeFastGaussian;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FractionFreeFastGaussian|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FractionFreeFastGaussian| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 111) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FractionFreeFastGaussian|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FractionFreeFastGaussian| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |coefficient|) (6 . *)
              |FFFG;ShiftAction;2NniVD;1| (12 . |One|) (16 . |One|) (|Integer|)
              (20 . |coerce|) (|List| 6) |FFFG;ShiftC;NniL;2| (25 . ^) (31 . *)
              |FFFG;qShiftAction;D2NniVD;3| |FFFG;qShiftC;DNniL;4|
              (37 . |Zero|) |FFFG;DiffAction;2NniVD;5| |FFFG;DiffC;NniL;6|
              (|Vector| 7) (41 . |elt|) (|SparseUnivariatePolynomial| 6)
              (|Vector| 27) (47 . |elt|) (53 . |minimumDegree|) (58 . |degree|)
              (63 . |coefficient|) (|Boolean|) (69 . |zero?|) (74 . +)
              (|Mapping| 6 8 8 7) |FFFG;generalCoefficient;MVNniVD;7|
              (80 . |One|) (84 . -) (|Matrix| 27) (|Mapping| 6 8 28) (|List| 8)
              |FFFG;fffg;LMLM;18| |FFFG;generalInterpolation;LMVLM;8|
              (90 . |#|) (95 . <) (|Mapping| 33 8) (101 . |position|)
              (107 . |elt|) (113 . |Zero|) (117 . >) (123 . |setelt|)
              (130 . |copy|) (|Stream| 42) (135 . |empty|) (139 . |cons|)
              (|Mapping| $) (145 . |delay|) |FFFG;genVectorStream;3NniS;13|
              |FFFG;genVectorStream2;3NniS;14|
              (|Record| (|:| |num| 16) (|:| |den| 6)) (|List| (|Fraction| 6))
              (|InnerCommonDenominator| 6 (|Fraction| 6) 16 62)
              (150 . |splitDenominator|) (|Fraction| 27)
              |FFFG;interpolate;2LNniF;16| (155 . |numer|) (160 . |monomial|)
              (166 . |elt|) (172 . |denom|) (177 . *) (183 . /)
              |FFFG;interpolate;2LNniF;15| (189 . ~=) (195 . <=) (201 . |elt|)
              (207 . |elt|) (|PositiveInteger|) (213 . |One|) (217 . -)
              (223 . |elt|) (230 . |zero?|) (235 . |coerce|) (240 . -)
              (246 . *) (252 . *) (|Union| $ '"failed") (258 . |exquo|)
              (264 . |One|) (268 . |scalarMatrix|) (274 . +) (|Mapping| 8 8 8)
              (280 . |reduce|) (|Vector| 8) (286 . |zero|) (|Vector| 6)
              (291 . |zero|) (296 . |column|) (302 . |setelt|) (309 . |elt|)
              (315 . ~=) (321 . |elt|) (327 . |max|) (333 . |max|)
              (|Mapping| 14 14 14) (|List| 14) (339 . |reduce|) (345 . =)
              (351 . >) (357 . |setelt|))
           '#(|qShiftC| 364 |qShiftAction| 370 |interpolate| 378
              |generalInterpolation| 392 |generalCoefficient| 400
              |genVectorStream2| 408 |genVectorStream| 415 |fffg| 422 |ShiftC|
              429 |ShiftAction| 434 |DiffC| 441 |DiffAction| 446)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 110
                                                 '(2 7 6 0 8 9 2 6 0 8 0 10 0 6
                                                   0 12 0 7 0 13 1 6 0 14 15 2
                                                   6 0 0 8 18 2 6 0 0 0 19 0 6
                                                   0 22 2 25 7 0 14 26 2 28 27
                                                   0 14 29 1 27 8 0 30 1 27 8 0
                                                   31 2 27 6 0 8 32 1 6 33 0 34
                                                   2 6 0 0 0 35 0 8 0 38 2 14 0
                                                   0 0 39 1 42 8 0 45 2 8 33 0
                                                   0 46 2 42 14 47 0 48 2 42 8
                                                   0 14 49 0 7 0 50 2 14 33 0 0
                                                   51 3 42 8 0 14 8 52 1 42 0 0
                                                   53 0 54 0 55 2 54 0 42 0 56
                                                   1 54 0 57 58 1 63 61 62 64 1
                                                   65 27 0 67 2 27 0 6 8 68 2
                                                   27 0 0 0 69 1 65 27 0 70 2
                                                   27 0 6 0 71 2 65 0 27 27 72
                                                   2 8 33 0 0 74 2 8 33 0 0 75
                                                   2 16 6 0 14 76 2 27 6 0 6 77
                                                   0 78 0 79 2 6 0 0 0 80 3 40
                                                   27 0 14 14 81 1 27 33 0 82 1
                                                   27 0 6 83 2 27 0 0 0 84 2 27
                                                   0 0 0 85 2 27 0 0 6 86 2 27
                                                   87 0 6 88 0 27 0 89 2 40 0 8
                                                   27 90 2 8 0 0 0 91 2 42 8 92
                                                   0 93 1 94 0 8 95 1 96 0 8 97
                                                   2 40 28 0 14 98 3 96 6 0 14
                                                   6 99 2 96 6 0 14 100 2 6 33
                                                   0 0 101 2 94 8 0 14 102 2 8
                                                   0 0 0 103 2 14 0 0 0 104 2
                                                   106 14 105 0 107 2 6 33 0 0
                                                   108 2 8 33 0 0 109 3 94 8 0
                                                   14 8 110 2 0 16 6 8 21 4 0 6
                                                   6 8 8 7 20 3 0 65 62 62 8 73
                                                   3 0 65 16 16 8 66 4 0 40 16
                                                   36 25 42 44 4 0 6 36 25 8 28
                                                   37 3 0 54 8 8 8 60 3 0 54 8
                                                   8 8 59 3 0 40 16 41 42 43 1
                                                   0 16 8 17 3 0 6 8 8 7 11 1 0
                                                   16 8 24 3 0 6 8 8 7 23)))))
           '|lookupComplete|)) 
