
(SDEFUN |FFPOLY;revListToSUP|
        ((|l| |List|
          (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|newl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G166 NIL) (|t| NIL))
         (SEQ (LETT |newl| NIL . #2=(|FFPOLY;revListToSUP|))
              (SEQ (LETT |t| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |newl| (CONS (CONS (CAR |t|) (CDR |t|)) |newl|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |newl|)))) 

(SDEFUN |FFPOLY;listToSUP|
        ((|l| |List|
          (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|newl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G172 NIL) (|t| NIL) (#2=#:G171 NIL))
         (SEQ
          (LETT |newl|
                (PROGN
                 (LETT #2# NIL . #3=(|FFPOLY;listToSUP|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (CONS (CAR |t|) (CDR |t|)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT |newl|)))) 

(SDEFUN |FFPOLY;reducedQPowers;SupPa;3|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|h| (|SparseUnivariatePolynomial| GF))
          (|g| (|SparseUnivariatePolynomial| GF)) (#1=#:G183 NIL) (|i| NIL)
          (|qexp| #2=(|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|w| (MM)) (#3=#:G182 NIL) (|qpow| #2#) (|e| (MM)) (|m1| (|Integer|))
          (|m| (|PositiveInteger|)))
         (SEQ
          (LETT |m| (SPADCALL |f| (QREFELT $ 12))
                . #4=(|FFPOLY;reducedQPowers;SupPa;3|))
          (LETT |m1| (- |m| 1) . #4#) (SPADCALL |f| (QREFELT $ 15))
          (LETT |e|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                           (QREFELT $ 17))
                 (QREFELT $ 10) (QREFELT $ 18))
                . #4#)
          (LETT |w| (|spadConstant| $ 14) . #4#)
          (LETT |qpow| (MAKEARR1 |m| (|spadConstant| $ 21)) . #4#)
          (QSETAREF1 |qpow| 0 (|spadConstant| $ 22))
          (SEQ (LETT |i| 1 . #4#) (LETT #3# |m1| . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |qpow| |i|
                            (SPADCALL
                             (LETT |w| (SPADCALL |w| |e| (QREFELT $ 23)) . #4#)
                             (QREFELT $ 24)))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |qexp| (MAKEARR1 |m| (|spadConstant| $ 21)) . #4#)
          (EXIT
           (COND
            ((EQL |m| 1)
             (SEQ
              (QSETAREF1 |qexp| 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                                    (QREFELT $ 26))
                          (QREFELT $ 27)))
              (EXIT |qexp|)))
            ('T
             (SEQ
              (QSETAREF1 |qexp| 0
                         (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16)))
              (LETT |h| (QAREF1 |qpow| 1) . #4#) (QSETAREF1 |qexp| 1 |h|)
              (SEQ (LETT |i| 2 . #4#) (LETT #1# |m1| . #4#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |g| (|spadConstant| $ 21) . #4#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |h| (|spadConstant| $ 21)
                                          (QREFELT $ 29)))
                               (GO G191)))
                             (SEQ
                              (LETT |g|
                                    (SPADCALL |g|
                                              (SPADCALL
                                               (SPADCALL |h| (QREFELT $ 30))
                                               (QAREF1 |qpow|
                                                       (SPADCALL |h|
                                                                 (QREFELT $
                                                                          12)))
                                               (QREFELT $ 31))
                                              (QREFELT $ 32))
                                    . #4#)
                              (EXIT
                               (LETT |h| (SPADCALL |h| (QREFELT $ 33)) . #4#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (QSETAREF1 |qexp| |i| (LETT |h| |g| . #4#))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |qexp|)))))))) 

(SDEFUN |FFPOLY;leastAffineMultiple;2Sup;4|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G191 NIL) (#2=#:G190 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G192 #3#) (#5=#:G194 NIL) (#6=#:G200 NIL) (|k| NIL)
          (|ns| (|List| (|Vector| GF))) (|coeffVector| #7=(|Vector| GF))
          (|dim| (|NonNegativeInteger|)) (|i| (|PositiveInteger|))
          (|newCoeffVector| #7#) (#8=#:G199 NIL) (|col1| (|Matrix| GF))
          (|b| (|Matrix| GF)) (#9=#:G198 NIL) (#10=#:G197 NIL)
          (|n| (|NonNegativeInteger|))
          (|qexp| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF))))
         (SEQ
          (LETT |qexp| (SPADCALL |f| (QREFELT $ 35))
                . #11=(|FFPOLY;leastAffineMultiple;2Sup;4|))
          (LETT |n| (SPADCALL |f| (QREFELT $ 12)) . #11#)
          (LETT |b|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #10# NIL . #11#)
                   (SEQ (LETT |i| 0 . #11#) (LETT #9# (- |n| 1) . #11#) G190
                        (COND ((|greater_SI| |i| #9#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QAREF1 |qexp| |i|) |n|
                                            (QREFELT $ 37))
                                  (QREFELT $ 39))
                                 #10#)
                                . #11#)))
                        (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  (QREFELT $ 42))
                 (QREFELT $ 43))
                . #11#)
          (LETT |col1| (MAKE_MATRIX1 |n| 1 (|spadConstant| $ 19)) . #11#)
          (SPADCALL |col1| 1 1 (|spadConstant| $ 13) (QREFELT $ 45))
          (LETT |ns|
                (SPADCALL (SPADCALL |col1| |b| (QREFELT $ 46)) (QREFELT $ 48))
                . #11#)
          (LETT |dim| (+ |n| 2) . #11#)
          (SEQ (LETT #8# NIL . #11#) G190 (COND (#8# (GO G191)))
               (SEQ
                (LETT |newCoeffVector| (SPADCALL |ns| 1 (QREFELT $ 49)) . #11#)
                (LETT |i| (+ |n| 1) . #11#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (SPADCALL |newCoeffVector| |i| (QREFELT $ 50))
                         (|spadConstant| $ 19) (QREFELT $ 51)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |i| (- |i| 1) . #11#))) NIL (GO G190)
                     G191 (EXIT NIL))
                (COND
                 ((< |i| |dim|)
                  (SEQ (LETT |dim| |i| . #11#)
                       (EXIT (LETT |coeffVector| |newCoeffVector| . #11#)))))
                (EXIT (LETT |ns| (CDR |ns|) . #11#)))
               (LETT #8# (NULL |ns|) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |coeffVector| 1 (QREFELT $ 50)) (QREFELT $ 27))
            (PROGN
             (LETT #1# NIL . #11#)
             (SEQ (LETT |k| 2 . #11#) (LETT #6# |dim| . #11#) G190
                  (COND ((|greater_SI| |k| #6#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL
                            (SPADCALL |coeffVector| |k| (QREFELT $ 50))
                            (EXPT (QREFELT $ 10)
                                  (PROG1 (LETT #5# (- |k| 2) . #11#)
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#)))
                            (QREFELT $ 16))
                           . #11#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 32)) . #11#))
                      ('T
                       (PROGN (LETT #2# #4# . #11#) (LETT #1# 'T . #11#)))))))
                  (LETT |k| (|inc_SI| |k|) . #11#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| $ 21))))
            (QREFELT $ 32)))))) 

(SDEFUN |FFPOLY;numberOfIrreduciblePoly;2Pi;5|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G203 NIL) (|lastd| (|PositiveInteger|)) (|sum| (|Integer|))
          (|qd| (|PositiveInteger|)) (#2=#:G206 NIL) (|d| NIL)
          (|divisorsOfn| (|List| (|PositiveInteger|))))
         (SEQ
          (COND ((EQL |n| 1) (QREFELT $ 10))
                ('T
                 (SEQ
                  (LETT |lastd| 1
                        . #3=(|FFPOLY;numberOfIrreduciblePoly;2Pi;5|))
                  (LETT |qd| (QREFELT $ 10) . #3#)
                  (LETT |sum| (* (SPADCALL |n| (QREFELT $ 54)) |qd|) . #3#)
                  (LETT |divisorsOfn| (CDR (SPADCALL |n| (QREFELT $ 56)))
                        . #3#)
                  (SEQ (LETT |d| NIL . #3#) (LETT #2# |divisorsOfn| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |qd|
                              (* |qd|
                                 (SPADCALL (QREFELT $ 10) (- |d| |lastd|)
                                           (QREFELT $ 58)))
                              . #3#)
                        (LETT |sum|
                              (+ |sum|
                                 (*
                                  (SPADCALL (QUOTIENT2 |n| |d|) (QREFELT $ 54))
                                  |qd|))
                              . #3#)
                        (EXIT (LETT |lastd| |d| . #3#)))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (PROG1 (LETT #1# (QUOTIENT2 |sum| |n|) . #3#)
                     (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                       '(|Integer|) #1#))))))))) 

(SDEFUN |FFPOLY;numberOfPrimitivePoly;2Pi;6|
        ((|n| |PositiveInteger|) ($ |PositiveInteger|))
        (SPROG ((#1=#:G207 NIL))
               (PROG1
                   (LETT #1#
                         (QUOTIENT2
                          (SPADCALL
                           (- (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 58)) 1)
                           (QREFELT $ 60))
                          |n|)
                         |FFPOLY;numberOfPrimitivePoly;2Pi;6|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FFPOLY;numberOfNormalPoly;2Pi;7|
        ((|n| . #1=(|PositiveInteger|)) ($ |PositiveInteger|))
        (SPROG
         ((|prod| (|Integer|)) (|qe| #2=(|PositiveInteger|))
          (|e| (|PositiveInteger|)) (#3=#:G455 NIL) (|d| NIL)
          (|divisorsOfm| (|List| (|PositiveInteger|))) (#4=#:G447 NIL)
          (#5=#:G446 NIL) (|m| #1#) (#6=#:G213 NIL) (|q| #2#)
          (|p| (|PositiveInteger|)) (#7=#:G212 NIL) (#8=#:G211 NIL)
          (#9=#:G210 NIL))
         (SEQ
          (COND
           ((EQL |n| 1)
            (PROG1
                (LETT #8#
                      (PROG1
                          (LETT #9# (- (QREFELT $ 10) 1)
                                . #10=(|FFPOLY;numberOfNormalPoly;2Pi;7|))
                        (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #9#))
                      . #10#)
              (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                '(|NonNegativeInteger|) #8#)))
           (#11='T
            (SEQ (LETT |m| |n| . #10#)
                 (LETT |p|
                       (PROG1 (LETT #7# (SPADCALL (QREFELT $ 62)) . #10#)
                         (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                           '(|NonNegativeInteger|) #7#))
                       . #10#)
                 (LETT |q| (QREFELT $ 10) . #10#)
                 (SEQ G190 (COND ((NULL (EQL (REM |m| |p|) 0)) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |m|
                              (PROG1 (LETT #6# (QUOTIENT2 |m| |p|) . #10#)
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|) #6#))
                              . #10#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((EQL |m| 1)
                    (PROG1
                        (LETT #4#
                              (QUOTIENT2
                               (SPADCALL
                                (EXPT |q|
                                      (PROG1 (LETT #5# (- |n| 1) . #10#)
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#)))
                                (- |q| 1) (QREFELT $ 63))
                               |n|)
                              . #10#)
                      (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                        '(|Integer|) #4#)))
                   (#11#
                    (SEQ (LETT |prod| (- |q| 1) . #10#)
                         (LETT |divisorsOfm|
                               (CDR (SPADCALL |m| (QREFELT $ 56))) . #10#)
                         (SEQ (LETT |d| NIL . #10#)
                              (LETT #3# |divisorsOfm| . #10#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |d| (CAR #3#) . #10#) NIL))
                                (GO G191)))
                              (SEQ (LETT |e| 1 . #10#) (LETT |qe| |q| . #10#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL (REM |qe| |d|) 1
                                                     (QREFELT $ 64)))
                                          (GO G191)))
                                        (SEQ (LETT |e| (+ |e| 1) . #10#)
                                             (EXIT
                                              (LETT |qe| (* |qe| |q|) . #10#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |prod|
                                          (* |prod|
                                             (EXPT (- |qe| 1)
                                                   (QUOTIENT2
                                                    (SPADCALL |d|
                                                              (QREFELT $ 60))
                                                    |e|)))
                                          . #10#)))
                              (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (QUOTIENT2
                           (SPADCALL (EXPT |q| (- |n| |m|)) |prod|
                                     (QREFELT $ 63))
                           |n|)))))))))))) 

(SDEFUN |FFPOLY;primitive?;SupB;8|
        ((|f| |SparseUnivariatePolynomial| GF) ($ |Boolean|))
        (SPROG
         ((#1=#:G471 NIL) (#2=#:G472 NIL) (|expt| (|NonNegativeInteger|))
          (#3=#:G474 NIL) (|d| NIL) (|lfact| (|List| (|PositiveInteger|)))
          (#4=#:G460 NIL) (#5=#:G473 NIL) (|rec| NIL)
          (|lrec|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|x| (MM)) (|qn1| (|PositiveInteger|)) (#6=#:G458 NIL)
          (#7=#:G457 NIL) (|q| (|PositiveInteger|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                  . #8=(|FFPOLY;primitive?;SupB;8|))
            (EXIT
             (COND
              ((OR (EQL |n| 0)
                   (OR
                    (SPADCALL (SPADCALL |f| (QREFELT $ 30))
                              (|spadConstant| $ 13) (QREFELT $ 66))
                    (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                              (|spadConstant| $ 19) (QREFELT $ 51))))
               NIL)
              ('T
               (SEQ (LETT |q| (QREFELT $ 10) . #8#)
                    (LETT |qn1|
                          (PROG1
                              (LETT #6#
                                    (PROG1
                                        (LETT #7# (- (EXPT |q| |n|) 1) . #8#)
                                      (|check_subtype2| (>= #7# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #7#))
                                    . #8#)
                            (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                              '(|NonNegativeInteger|) #6#))
                          . #8#)
                    (SPADCALL |f| (QREFELT $ 15))
                    (LETT |x|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                           (QREFELT $ 17))
                          . #8#)
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL (SPADCALL |x| |qn1| (QREFELT $ 67))
                                  (QREFELT $ 24))
                        (|spadConstant| $ 22) (QREFELT $ 29))
                       NIL)
                      ('T
                       (SEQ
                        (LETT |lrec|
                              (SPADCALL (SPADCALL |qn1| (QREFELT $ 69))
                                        (QREFELT $ 74))
                              . #8#)
                        (LETT |lfact| NIL . #8#)
                        (SEQ (LETT |rec| NIL . #8#) (LETT #5# |lrec| . #8#)
                             G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |rec| (CAR #5#) . #8#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |lfact|
                                     (CONS
                                      (PROG1 (LETT #4# (QVELT |rec| 1) . #8#)
                                        (|check_subtype2| (> #4# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #4#))
                                      |lfact|)
                                     . #8#)))
                             (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                             (EXIT NIL))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |d| NIL . #8#) (LETT #3# |lfact| . #8#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |d| (CAR #3#) . #8#) NIL))
                                 (GO G191)))
                               (SEQ (LETT |expt| (QUOTIENT2 |qn1| |d|) . #8#)
                                    (EXIT
                                     (COND
                                      ((>= |expt| |n|)
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL
                                           (SPADCALL |x| |expt| (QREFELT $ 18))
                                           (QREFELT $ 24))
                                          (|spadConstant| $ 22) (QREFELT $ 75))
                                         (PROGN
                                          (LETT #1#
                                                (PROGN
                                                 (LETT #2# NIL . #8#)
                                                 (GO #9=#:G470))
                                                . #8#)
                                          (GO #10=#:G464))))))))
                               (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                               (EXIT NIL)))
                         #10# (EXIT #1#))
                        (EXIT 'T)))))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |FFPOLY;normal?;SupB;9|
        ((|f| |SparseUnivariatePolynomial| GF) ($ |Boolean|))
        (SPROG
         ((|l| (|List| (|List| GF))) (#1=#:G485 NIL) (#2=#:G477 NIL) (|i| NIL)
          (#3=#:G484 NIL)
          (|g| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                . #4=(|FFPOLY;normal?;SupB;9|))
          (EXIT
           (COND
            ((OR (EQL |n| 0)
                 (OR
                  (SPADCALL (SPADCALL |f| (QREFELT $ 30)) (|spadConstant| $ 13)
                            (QREFELT $ 66))
                  (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25))
                            (|spadConstant| $ 19) (QREFELT $ 51))))
             NIL)
            ((EQL |n| 1) 'T)
            (#5='T
             (COND ((NULL (SPADCALL |f| (QREFELT $ 78))) NIL)
                   ('T
                    (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 35)) . #4#)
                         (LETT |l|
                               (PROGN
                                (LETT #3# NIL . #4#)
                                (SEQ (LETT |i| 0 . #4#)
                                     (LETT #1#
                                           (PROG1 (LETT #2# (- |n| 1) . #4#)
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           . #4#)
                                     G190
                                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL (QAREF1 |g| |i|) |n|
                                                         (QREFELT $ 37))
                                               (QREFELT $ 39))
                                              #3#)
                                             . #4#)))
                                     (LETT |i| (|inc_SI| |i|) . #4#) (GO G190)
                                     G191 (EXIT (NREVERSE #3#))))
                               . #4#)
                         (EXIT
                          (COND
                           ((EQL
                             (SPADCALL (SPADCALL |l| (QREFELT $ 42))
                                       (QREFELT $ 79))
                             |n|)
                            'T)
                           (#5# NIL)))))))))))) 

(SDEFUN |FFPOLY;nextSubset|
        ((|s| |List| (|NonNegativeInteger|)) (|bound| |NonNegativeInteger|)
         ($ |Union| (|List| (|NonNegativeInteger|)) "failed"))
        (SPROG
         ((|j| NIL) (#1=#:G500 NIL) (|i| (|NonNegativeInteger|))
          (|firstOfs| #2=(|NonNegativeInteger|)) (|noGap| (|Boolean|))
          (|firstOfsPlus1| (|NonNegativeInteger|)) (|secondOfs| #2#)
          (|restOfs| (|List| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m| (SPADCALL |s| (QREFELT $ 82)) . #3=(|FFPOLY;nextSubset|))
            (EXIT
             (COND ((EQL |m| 0) (CONS 0 (LIST 1)))
                   (#4='T
                    (SEQ (LETT |noGap| 'T . #3#) (LETT |i| 0 . #3#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  (|noGap|
                                   (NULL
                                    (NULL (LETT |restOfs| (CDR |s|) . #3#))))
                                  ('T NIL)))
                                (GO G191)))
                              (SEQ
                               (LETT |secondOfs| (|SPADfirst| |restOfs|) . #3#)
                               (LETT |firstOfsPlus1| (+ (|SPADfirst| |s|) 1)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((EQL |secondOfs| |firstOfsPlus1|)
                                  (SEQ (LETT |s| |restOfs| . #3#)
                                       (EXIT (LETT |i| (+ |i| 1) . #3#))))
                                 ('T
                                  (SEQ
                                   (SPADCALL |s| |firstOfsPlus1|
                                             (QREFELT $ 83))
                                   (EXIT (LETT |noGap| NIL . #3#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (COND
                          (|noGap|
                           (SEQ (LETT |firstOfs| (|SPADfirst| |s|) . #3#)
                                (EXIT
                                 (COND
                                  ((< |firstOfs| |bound|)
                                   (SPADCALL |s| (+ |firstOfs| 1)
                                             (QREFELT $ 83)))
                                  ((< |m| |bound|)
                                   (SEQ (SPADCALL |s| (+ |m| 1) (QREFELT $ 83))
                                        (EXIT (LETT |i| |m| . #3#))))
                                  (#4#
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #3#)
                                    (GO #5=#:G499))))))))
                         (SEQ (LETT |j| |i| . #3#) G190
                              (COND ((< |j| 1) (GO G191)))
                              (SEQ (EXIT (LETT |s| (CONS |j| |s|) . #3#)))
                              (LETT |j| (+ |j| -1) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 |s|))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |FFPOLY;nextIrreduciblePoly;SupU;11|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|headpol|
           (|List|
            #1=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|headlookuplist| (|List| (|NonNegativeInteger|))) (#2=#:G531 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#3=#:G529 NIL) (#4=#:G544 NIL)
          (#5=#:G546 NIL) (|entry| NIL)
          (|restfcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|pol| (|SparseUnivariatePolynomial| GF)) (#6=#:G519 NIL)
          (|j| (|NonNegativeInteger|))
          (|term|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|n1| (|NonNegativeInteger|)) (#7=#:G515 NIL) (#8=#:G514 NIL)
          (|fcopy| (|List| #1#)) (#9=#:G545 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                  . #10=(|FFPOLY;nextIrreduciblePoly;SupU;11|))
            (EXIT
             (COND
              ((EQL |n| 0) (|error| "polynomial must have positive degree"))
              ('T
               (SEQ
                (COND
                 ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #10#)
                            (|spadConstant| $ 13) (QREFELT $ 66))
                  (LETT |f|
                        (SPADCALL (SPADCALL |lcf| (QREFELT $ 84)) |f|
                                  (QREFELT $ 31))
                        . #10#)))
                (LETT |fRepr| |f| . #10#) (LETT |fcopy| NIL . #10#)
                (SEQ (LETT |term| NIL . #10#) (LETT #9# |fRepr| . #10#) G190
                     (COND
                      ((OR (ATOM #9#)
                           (PROGN (LETT |term| (CAR #9#) . #10#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |fcopy|
                             (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                             . #10#)))
                     (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (QCAR |term|) 0 (QREFELT $ 64))
                  (LETT |fcopy| (CONS (CONS 0 (|spadConstant| $ 19)) |fcopy|)
                        . #10#)))
                (LETT |tailpol| NIL . #10#) (LETT |headpol| |fcopy| . #10#)
                (LETT |fcopy| (REVERSE |fcopy|) . #10#)
                (LETT |weight|
                      (PROG1 (LETT #8# (- (LENGTH |fcopy|) 1) . #10#)
                        (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #8#))
                      . #10#)
                (LETT |taillookuplist| NIL . #10#)
                (LETT |headlookuplist| (SPADCALL |weight| 0 (QREFELT $ 85))
                      . #10#)
                (LETT |s| NIL . #10#)
                (LETT |n1|
                      (PROG1 (LETT #7# (- |n| 1) . #10#)
                        (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #7#))
                      . #10#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (SEQ G190
                            (COND
                             ((NULL (NULL (NULL |headlookuplist|))) (GO G191)))
                            (SEQ (LETT |term| (|SPADfirst| |headpol|) . #10#)
                                 (LETT |j| (|SPADfirst| |headlookuplist|)
                                       . #10#)
                                 (COND
                                  ((EQL |j| 0)
                                   (LETT |j|
                                         (SPADCALL (QCDR |term|)
                                                   (QREFELT $ 86))
                                         . #10#)))
                                 (LETT |j| (+ |j| 1) . #10#)
                                 (EXIT
                                  (COND
                                   ((EQL (REM |j| (QREFELT $ 10)) 0)
                                    (SEQ
                                     (LETT |tailpol| (CONS |term| |tailpol|)
                                           . #10#)
                                     (LETT |headpol| (CDR |headpol|) . #10#)
                                     (LETT |taillookuplist|
                                           (CONS |j| |taillookuplist|) . #10#)
                                     (EXIT
                                      (LETT |headlookuplist|
                                            (CDR |headlookuplist|) . #10#))))
                                   ('T
                                    (SEQ
                                     (PROGN
                                      (RPLACD (|SPADfirst| |headpol|)
                                              (SPADCALL
                                               (PROG1 (LETT #6# |j| . #10#)
                                                 (|check_subtype2| (> #6# 0)
                                                                   '(|PositiveInteger|)
                                                                   '(|NonNegativeInteger|)
                                                                   #6#))
                                               (QREFELT $ 87)))
                                      (QCDR (|SPADfirst| |headpol|)))
                                     (SPADCALL |headlookuplist| |j|
                                               (QREFELT $ 83))
                                     (EXIT
                                      (COND
                                       ((NULL |taillookuplist|)
                                        (SEQ
                                         (LETT |pol|
                                               (|FFPOLY;revListToSUP| |headpol|
                                                $)
                                               . #10#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |pol| (QREFELT $ 78))
                                            (PROGN
                                             (LETT #4# (CONS 0 |pol|) . #10#)
                                             (GO #11=#:G543)))))))
                                       ('T
                                        (SEQ
                                         (LETT |headpol|
                                               (CONS (|SPADfirst| |tailpol|)
                                                     |headpol|)
                                               . #10#)
                                         (LETT |tailpol| (CDR |tailpol|)
                                               . #10#)
                                         (LETT |headlookuplist|
                                               (CONS
                                                (|SPADfirst| |taillookuplist|)
                                                |headlookuplist|)
                                               . #10#)
                                         (EXIT
                                          (LETT |taillookuplist|
                                                (CDR |taillookuplist|)
                                                . #10#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (COND
                        ((NULL |s|)
                         (SEQ (LETT |restfcopy| (CDR |fcopy|) . #10#)
                              (EXIT
                               (SEQ (LETT |entry| NIL . #10#)
                                    (LETT #5# |restfcopy| . #10#) G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |entry| (CAR #5#) . #10#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |s| (CONS (QCAR |entry|) |s|)
                                            . #10#)))
                                    (LETT #5# (CDR #5#) . #10#) (GO G190) G191
                                    (EXIT NIL))))))
                       (EXIT
                        (COND
                         ((EQL |weight| |n|)
                          (PROGN
                           (LETT #4# (CONS 1 "failed") . #10#)
                           (GO #11#)))
                         ('T
                          (SEQ
                           (LETT |s1|
                                 (PROG2
                                     (LETT #3#
                                           (|FFPOLY;nextSubset| (CDR |s|) |n1|
                                            $)
                                           . #10#)
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|List|
                                                    (|NonNegativeInteger|))
                                                   (|Union|
                                                    (|List|
                                                     (|NonNegativeInteger|))
                                                    "failed")
                                                   #3#))
                                 . #10#)
                           (LETT |s| (CONS 0 |s1|) . #10#)
                           (LETT |weight| (SPADCALL |s| (QREFELT $ 82)) . #10#)
                           (LETT |taillookuplist| NIL . #10#)
                           (LETT |headlookuplist|
                                 (CONS (QREFELT $ 10)
                                       (SPADCALL
                                        (PROG1 (LETT #2# (- |weight| 1) . #10#)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        1 (QREFELT $ 85)))
                                 . #10#)
                           (LETT |tailpol| NIL . #10#)
                           (LETT |headpol| NIL . #10#)
                           (LETT |s1| (CONS |n| (REVERSE |s1|)) . #10#)
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |s1|))) (GO G191)))
                                (SEQ
                                 (LETT |headpol|
                                       (CONS
                                        (CONS (|SPADfirst| |s1|)
                                              (|spadConstant| $ 13))
                                        |headpol|)
                                       . #10#)
                                 (EXIT (LETT |s1| (CDR |s1|) . #10#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (LETT |headpol|
                                  (CONS (CONS 0 (|spadConstant| $ 19))
                                        |headpol|)
                                  . #10#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #11# (EXIT #4#)))) 

(SDEFUN |FFPOLY;nextPrimitivePoly;SupU;12|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|c| (GF)) (#1=#:G601 NIL) (|l| (|NonNegativeInteger|))
          (|headpol|
           #2=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|headlookuplist| (|List| (|NonNegativeInteger|))) (#3=#:G593 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#4=#:G591 NIL) (#5=#:G612 NIL)
          (|entry| NIL) (|restfcopy| #2#) (|notReady| #6=(|Boolean|))
          (#7=#:G610 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (#8=#:G581 NIL) (|j| (|NonNegativeInteger|))
          (|term|
           #9=(|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|constterm| #9#) (#10=#:G570 NIL) (|noGenerator| #6#)
          (|n1| (|NonNegativeInteger|)) (#11=#:G568 NIL) (#12=#:G567 NIL)
          (#13=#:G609 NIL) (#14=#:G558 NIL) (|q1| (|NonNegativeInteger|))
          (#15=#:G556 NIL) (|c0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#16=#:G611 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                  . #17=(|FFPOLY;nextPrimitivePoly;SupU;12|))
            (EXIT
             (COND
              ((EQL |n| 0) (|error| "polynomial must have positive degree"))
              (#18='T
               (SEQ
                (COND
                 ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #17#)
                            (|spadConstant| $ 13) (QREFELT $ 66))
                  (LETT |f|
                        (SPADCALL (SPADCALL |lcf| (QREFELT $ 84)) |f|
                                  (QREFELT $ 31))
                        . #17#)))
                (LETT |fRepr| |f| . #17#) (LETT |fcopy| NIL . #17#)
                (SEQ (LETT |term| NIL . #17#) (LETT #16# |fRepr| . #17#) G190
                     (COND
                      ((OR (ATOM #16#)
                           (PROGN (LETT |term| (CAR #16#) . #17#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |fcopy|
                             (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                             . #17#)))
                     (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (QCAR |term|) 0 (QREFELT $ 64))
                  (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #17#)
                       (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #17#)))))
                (LETT |fcopy| (REVERSE |fcopy|) . #17#)
                (LETT |xn| (|SPADfirst| |fcopy|) . #17#)
                (LETT |c0| (QCDR |term|) . #17#)
                (LETT |l| (REM (SPADCALL |c0| (QREFELT $ 86)) (QREFELT $ 10))
                      . #17#)
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SEQ
                    (LETT |q1|
                          (PROG1 (LETT #15# (- (QREFELT $ 10) 1) . #17#)
                            (|check_subtype2| (>= #15# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #15#))
                          . #17#)
                    (SEQ G190 (COND ((NULL (< |l| |q1|)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (+ |l| 1) . #17#)
                                (LETT |c|
                                      (SPADCALL
                                       (PROG1 (LETT #14# |l| . #17#)
                                         (|check_subtype2| (> #14# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #14#))
                                       (QREFELT $ 87))
                                      . #17#)
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                             (QREFELT $ 90))
                                   (PROGN
                                    (LETT #13#
                                          (PROGN
                                           (LETT #7#
                                                 (CONS 0
                                                       (LIST |xn|
                                                             (CONS 0 |c|)))
                                                 . #17#)
                                           (GO #19=#:G608))
                                          . #17#)
                                    (GO #20=#:G559)))))))
                          #20# (EXIT #13#))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 "failed"))))
                  (#18#
                   (SEQ
                    (LETT |weight|
                          (PROG1 (LETT #12# (- (LENGTH |fcopy|) 1) . #17#)
                            (|check_subtype2| (>= #12# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #12#))
                          . #17#)
                    (LETT |s| NIL . #17#)
                    (LETT |n1|
                          (PROG1 (LETT #11# (- |n| 1) . #17#)
                            (|check_subtype2| (>= #11# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #11#))
                          . #17#)
                    (LETT |c| |c0| . #17#)
                    (SEQ G190 (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                         (SEQ (LETT |noGenerator| 'T . #17#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       (|noGenerator| (< |l| (QREFELT $ 10)))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 13)
                                                    (QREFELT $ 26))
                                          |n| (QREFELT $ 91))
                                         |c| (QREFELT $ 92))
                                        (QREFELT $ 90))
                                       (LETT |noGenerator| NIL . #17#))
                                      ('T
                                       (SEQ (LETT |l| (+ |l| 1) . #17#)
                                            (EXIT
                                             (LETT |c|
                                                   (SPADCALL
                                                    (PROG1
                                                        (LETT #10# |l| . #17#)
                                                      (|check_subtype2|
                                                       (> #10# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #10#))
                                                    (QREFELT $ 87))
                                                   . #17#)))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                (|noGenerator|
                                 (PROGN
                                  (LETT #7# (CONS 1 "failed") . #17#)
                                  (GO #19#)))
                                ('T
                                 (SEQ (LETT |constterm| (CONS 0 |c|) . #17#)
                                      (COND
                                       ((SPADCALL |c| |c0| (QREFELT $ 51))
                                        (COND
                                         ((SPADCALL |weight| 1 (QREFELT $ 93))
                                          (SEQ
                                           (LETT |headpol|
                                                 (CDR (REVERSE |fcopy|))
                                                 . #17#)
                                           (EXIT
                                            (LETT |headlookuplist|
                                                  (SPADCALL |weight| 0
                                                            (QREFELT $ 85))
                                                  . #17#))))
                                         ('T
                                          (SEQ
                                           (LETT |headpol|
                                                 (LIST
                                                  (CONS 1
                                                        (|spadConstant| $ 19))
                                                  |xn|)
                                                 . #17#)
                                           (LETT |headlookuplist|
                                                 (LIST (QREFELT $ 10)) . #17#)
                                           (LETT |s| (LIST 0 1) . #17#)
                                           (EXIT (LETT |weight| 2 . #17#))))))
                                       ('T
                                        (SEQ
                                         (LETT |headpol|
                                               (LIST
                                                (CONS 1 (|spadConstant| $ 19))
                                                |xn|)
                                               . #17#)
                                         (LETT |headlookuplist|
                                               (LIST (QREFELT $ 10)) . #17#)
                                         (LETT |s| (LIST 0 1) . #17#)
                                         (EXIT (LETT |weight| 2 . #17#)))))
                                      (LETT |tailpol| NIL . #17#)
                                      (LETT |taillookuplist| NIL . #17#)
                                      (LETT |notReady| 'T . #17#)
                                      (SEQ G190
                                           (COND ((NULL |notReady|) (GO G191)))
                                           (SEQ
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (NULL
                                                     (NULL |headlookuplist|)))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |term|
                                                        (|SPADfirst| |headpol|)
                                                        . #17#)
                                                  (LETT |j|
                                                        (|SPADfirst|
                                                         |headlookuplist|)
                                                        . #17#)
                                                  (COND
                                                   ((EQL |j| 0)
                                                    (LETT |j|
                                                          (SPADCALL
                                                           (QCDR |term|)
                                                           (QREFELT $ 86))
                                                          . #17#)))
                                                  (LETT |j| (+ |j| 1) . #17#)
                                                  (EXIT
                                                   (COND
                                                    ((EQL
                                                      (REM |j| (QREFELT $ 10))
                                                      0)
                                                     (SEQ
                                                      (LETT |tailpol|
                                                            (CONS |term|
                                                                  |tailpol|)
                                                            . #17#)
                                                      (LETT |headpol|
                                                            (CDR |headpol|)
                                                            . #17#)
                                                      (LETT |taillookuplist|
                                                            (CONS |j|
                                                                  |taillookuplist|)
                                                            . #17#)
                                                      (EXIT
                                                       (LETT |headlookuplist|
                                                             (CDR
                                                              |headlookuplist|)
                                                             . #17#))))
                                                    ('T
                                                     (SEQ
                                                      (PROGN
                                                       (RPLACD
                                                        (|SPADfirst| |headpol|)
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #8# |j|
                                                                   . #17#)
                                                           (|check_subtype2|
                                                            (> #8# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #8#))
                                                         (QREFELT $ 87)))
                                                       (QCDR
                                                        (|SPADfirst|
                                                         |headpol|)))
                                                      (SPADCALL
                                                       |headlookuplist| |j|
                                                       (QREFELT $ 83))
                                                      (EXIT
                                                       (COND
                                                        ((NULL
                                                          |taillookuplist|)
                                                         (SEQ
                                                          (LETT |pol|
                                                                (|FFPOLY;revListToSUP|
                                                                 (CONS
                                                                  |constterm|
                                                                  |headpol|)
                                                                 $)
                                                                . #17#)
                                                          (EXIT
                                                           (COND
                                                            ((SPADCALL |pol|
                                                                       (QREFELT
                                                                        $ 76))
                                                             (PROGN
                                                              (LETT #7#
                                                                    (CONS 0
                                                                          |pol|)
                                                                    . #17#)
                                                              (GO #19#)))))))
                                                        ('T
                                                         (SEQ
                                                          (LETT |headpol|
                                                                (CONS
                                                                 (|SPADfirst|
                                                                  |tailpol|)
                                                                 |headpol|)
                                                                . #17#)
                                                          (LETT |tailpol|
                                                                (CDR |tailpol|)
                                                                . #17#)
                                                          (LETT
                                                           |headlookuplist|
                                                           (CONS
                                                            (|SPADfirst|
                                                             |taillookuplist|)
                                                            |headlookuplist|)
                                                           . #17#)
                                                          (EXIT
                                                           (LETT
                                                            |taillookuplist|
                                                            (CDR
                                                             |taillookuplist|)
                                                            . #17#)))))))))))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((EQL |weight| |n|)
                                               (LETT |notReady| NIL . #17#))
                                              ('T
                                               (SEQ
                                                (COND
                                                 ((NULL |s|)
                                                  (SEQ
                                                   (LETT |restfcopy|
                                                         (CDR |fcopy|) . #17#)
                                                   (EXIT
                                                    (SEQ
                                                     (LETT |entry| NIL . #17#)
                                                     (LETT #5# |restfcopy|
                                                           . #17#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #5#)
                                                           (PROGN
                                                            (LETT |entry|
                                                                  (CAR #5#)
                                                                  . #17#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |s|
                                                             (CONS
                                                              (QCAR |entry|)
                                                              |s|)
                                                             . #17#)))
                                                     (LETT #5# (CDR #5#)
                                                           . #17#)
                                                     (GO G190) G191
                                                     (EXIT NIL))))))
                                                (LETT |s1|
                                                      (PROG2
                                                          (LETT #4#
                                                                (|FFPOLY;nextSubset|
                                                                 (CDR |s|) |n1|
                                                                 $)
                                                                . #17#)
                                                          (QCDR #4#)
                                                        (|check_union2|
                                                         (QEQCAR #4# 0)
                                                         (|List|
                                                          (|NonNegativeInteger|))
                                                         (|Union|
                                                          (|List|
                                                           (|NonNegativeInteger|))
                                                          "failed")
                                                         #4#))
                                                      . #17#)
                                                (LETT |s| (CONS 0 |s1|) . #17#)
                                                (LETT |weight|
                                                      (SPADCALL |s|
                                                                (QREFELT $ 82))
                                                      . #17#)
                                                (LETT |taillookuplist| NIL
                                                      . #17#)
                                                (LETT |headlookuplist|
                                                      (CONS (QREFELT $ 10)
                                                            (SPADCALL
                                                             (PROG1
                                                                 (LETT #3#
                                                                       (-
                                                                        |weight|
                                                                        2)
                                                                       . #17#)
                                                               (|check_subtype2|
                                                                (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                                             1 (QREFELT $ 85)))
                                                      . #17#)
                                                (LETT |tailpol| NIL . #17#)
                                                (LETT |headpol|
                                                      (LIST
                                                       (CONS (|SPADfirst| |s1|)
                                                             (|spadConstant| $
                                                                             19)))
                                                      . #17#)
                                                (SEQ G190
                                                     (COND
                                                      ((NULL
                                                        (NULL
                                                         (NULL
                                                          (LETT |s1| (CDR |s1|)
                                                                . #17#))))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |headpol|
                                                             (CONS
                                                              (CONS
                                                               (|SPADfirst|
                                                                |s1|)
                                                               (|spadConstant|
                                                                $ 13))
                                                              |headpol|)
                                                             . #17#)))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (EXIT
                                                 (LETT |headpol|
                                                       (REVERSE
                                                        (CONS
                                                         (CONS |n|
                                                               (|spadConstant|
                                                                $ 13))
                                                         |headpol|))
                                                       . #17#)))))))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (LETT |l| (+ |l| 1) . #17#)
                                      (EXIT
                                       (LETT |c|
                                             (SPADCALL
                                              (PROG1 (LETT #1# |l| . #17#)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT $ 87))
                                             . #17#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 "failed"))))))))))))
          #19# (EXIT #7#)))) 

(SDEFUN |FFPOLY;nextNormalPoly;SupU;13|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|a| (GF)) (#1=#:G659 NIL) (|l| (|NonNegativeInteger|))
          (|middlepol|
           #2=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|middlelookuplist| (|List| (|NonNegativeInteger|))) (#3=#:G651 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#4=#:G649 NIL) (#5=#:G668 NIL)
          (|entry| NIL) (|restfcopy| #2#) (|notReady| (|Boolean|))
          (#6=#:G666 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (#7=#:G637 NIL) (|j| (|NonNegativeInteger|))
          (|term|
           #8=(|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|headpol| (|List| #8#)) (|n2| (|NonNegativeInteger|))
          (#9=#:G628 NIL) (|n1| (|NonNegativeInteger|)) (#10=#:G627 NIL)
          (#11=#:G625 NIL) (|a0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#12=#:G667 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                  . #13=(|FFPOLY;nextNormalPoly;SupU;13|))
            (EXIT
             (COND
              ((EQL |n| 0) (|error| "polynomial must have positive degree"))
              (#14='T
               (SEQ
                (COND
                 ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #13#)
                            (|spadConstant| $ 13) (QREFELT $ 66))
                  (LETT |f|
                        (SPADCALL (SPADCALL |lcf| (QREFELT $ 84)) |f|
                                  (QREFELT $ 31))
                        . #13#)))
                (LETT |fRepr| |f| . #13#) (LETT |fcopy| NIL . #13#)
                (SEQ (LETT |term| NIL . #13#) (LETT #12# |fRepr| . #13#) G190
                     (COND
                      ((OR (ATOM #12#)
                           (PROGN (LETT |term| (CAR #12#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |fcopy|
                             (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                             . #13#)))
                     (LETT #12# (CDR #12#) . #13#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (QCAR |term|) 0 (QREFELT $ 64))
                  (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #13#)
                       (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #13#)))))
                (LETT |fcopy| (REVERSE |fcopy|) . #13#)
                (LETT |xn| (|SPADfirst| |fcopy|) . #13#)
                (LETT |middlepol| (CDR |fcopy|) . #13#)
                (LETT |a0| (QCDR (|SPADfirst| |middlepol|)) . #13#)
                (LETT |l| (REM (SPADCALL |a0| (QREFELT $ 86)) (QREFELT $ 10))
                      . #13#)
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (COND ((EQL |l| (- (QREFELT $ 10) 1)) (CONS 1 "failed"))
                         (#14#
                          (CONS 0
                                (LIST |xn|
                                      (CONS 0
                                            (SPADCALL
                                             (PROG1
                                                 (LETT #11# (+ |l| 1) . #13#)
                                               (|check_subtype2| (> #11# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #11#))
                                             (QREFELT $ 87))))))))
                  (#14#
                   (SEQ
                    (LETT |n1|
                          (PROG1 (LETT #10# (- |n| 1) . #13#)
                            (|check_subtype2| (>= #10# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #10#))
                          . #13#)
                    (LETT |n2|
                          (PROG1 (LETT #9# (- |n1| 1) . #13#)
                            (|check_subtype2| (>= #9# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #9#))
                          . #13#)
                    (LETT |a| |a0| . #13#)
                    (COND
                     ((EQL |l| 0)
                      (SEQ (LETT |l| 1 . #13#)
                           (EXIT (LETT |a| (|spadConstant| $ 13) . #13#)))))
                    (SEQ G190 (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                         (SEQ
                          (COND
                           ((SPADCALL |a| |a0| (QREFELT $ 51))
                            (SEQ
                             (LETT |middlepol| (REVERSE (CDR |middlepol|))
                                   . #13#)
                             (LETT |weight| (LENGTH |middlepol|) . #13#)
                             (LETT |middlelookuplist|
                                   (SPADCALL |weight| 0 (QREFELT $ 85)) . #13#)
                             (EXIT (LETT |s| NIL . #13#))))
                           ('T
                            (SEQ
                             (LETT |middlepol|
                                   (LIST (CONS 0 (|spadConstant| $ 19)))
                                   . #13#)
                             (LETT |middlelookuplist| (LIST (QREFELT $ 10))
                                   . #13#)
                             (LETT |s| (LIST 0) . #13#)
                             (EXIT (LETT |weight| 1 . #13#)))))
                          (LETT |headpol| (LIST |xn| (CONS |n1| |a|)) . #13#)
                          (LETT |tailpol| NIL . #13#)
                          (LETT |taillookuplist| NIL . #13#)
                          (LETT |notReady| 'T . #13#)
                          (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                               (SEQ
                                (SEQ G190
                                     (COND
                                      ((NULL (NULL (NULL |middlelookuplist|)))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |term| (|SPADfirst| |middlepol|)
                                            . #13#)
                                      (LETT |j|
                                            (|SPADfirst| |middlelookuplist|)
                                            . #13#)
                                      (COND
                                       ((EQL |j| 0)
                                        (LETT |j|
                                              (SPADCALL (QCDR |term|)
                                                        (QREFELT $ 86))
                                              . #13#)))
                                      (LETT |j| (+ |j| 1) . #13#)
                                      (EXIT
                                       (COND
                                        ((EQL (REM |j| (QREFELT $ 10)) 0)
                                         (SEQ
                                          (LETT |tailpol|
                                                (CONS |term| |tailpol|) . #13#)
                                          (LETT |middlepol| (CDR |middlepol|)
                                                . #13#)
                                          (LETT |taillookuplist|
                                                (CONS |j| |taillookuplist|)
                                                . #13#)
                                          (EXIT
                                           (LETT |middlelookuplist|
                                                 (CDR |middlelookuplist|)
                                                 . #13#))))
                                        ('T
                                         (SEQ
                                          (PROGN
                                           (RPLACD (|SPADfirst| |middlepol|)
                                                   (SPADCALL
                                                    (PROG1
                                                        (LETT #7# |j| . #13#)
                                                      (|check_subtype2|
                                                       (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #7#))
                                                    (QREFELT $ 87)))
                                           (QCDR (|SPADfirst| |middlepol|)))
                                          (SPADCALL |middlelookuplist| |j|
                                                    (QREFELT $ 83))
                                          (EXIT
                                           (COND
                                            ((NULL |taillookuplist|)
                                             (SEQ
                                              (LETT |pol|
                                                    (|FFPOLY;listToSUP|
                                                     (SPADCALL |headpol|
                                                               (REVERSE
                                                                |middlepol|)
                                                               (QREFELT $ 97))
                                                     $)
                                                    . #13#)
                                              (EXIT
                                               (COND
                                                ((SPADCALL |pol|
                                                           (QREFELT $ 80))
                                                 (PROGN
                                                  (LETT #6# (CONS 0 |pol|)
                                                        . #13#)
                                                  (GO #15=#:G665)))))))
                                            ('T
                                             (SEQ
                                              (LETT |middlepol|
                                                    (CONS
                                                     (|SPADfirst| |tailpol|)
                                                     |middlepol|)
                                                    . #13#)
                                              (LETT |tailpol| (CDR |tailpol|)
                                                    . #13#)
                                              (LETT |middlelookuplist|
                                                    (CONS
                                                     (|SPADfirst|
                                                      |taillookuplist|)
                                                     |middlelookuplist|)
                                                    . #13#)
                                              (EXIT
                                               (LETT |taillookuplist|
                                                     (CDR |taillookuplist|)
                                                     . #13#)))))))))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((EQL |weight| |n1|)
                                   (LETT |notReady| NIL . #13#))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((NULL |s|)
                                      (SEQ
                                       (LETT |restfcopy| (CDR (CDR |fcopy|))
                                             . #13#)
                                       (EXIT
                                        (SEQ (LETT |entry| NIL . #13#)
                                             (LETT #5# |restfcopy| . #13#) G190
                                             (COND
                                              ((OR (ATOM #5#)
                                                   (PROGN
                                                    (LETT |entry| (CAR #5#)
                                                          . #13#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |s|
                                                     (CONS (QCAR |entry|) |s|)
                                                     . #13#)))
                                             (LETT #5# (CDR #5#) . #13#)
                                             (GO G190) G191 (EXIT NIL))))))
                                    (LETT |s1|
                                          (PROG2
                                              (LETT #4#
                                                    (|FFPOLY;nextSubset|
                                                     (CDR |s|) |n2| $)
                                                    . #13#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|List|
                                                             (|NonNegativeInteger|))
                                                            (|Union|
                                                             (|List|
                                                              (|NonNegativeInteger|))
                                                             "failed")
                                                            #4#))
                                          . #13#)
                                    (LETT |s| (CONS 0 |s1|) . #13#)
                                    (LETT |weight|
                                          (SPADCALL |s| (QREFELT $ 82)) . #13#)
                                    (LETT |taillookuplist| NIL . #13#)
                                    (LETT |middlelookuplist|
                                          (CONS (QREFELT $ 10)
                                                (SPADCALL
                                                 (PROG1
                                                     (LETT #3# (- |weight| 1)
                                                           . #13#)
                                                   (|check_subtype2| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #3#))
                                                 1 (QREFELT $ 85)))
                                          . #13#)
                                    (LETT |tailpol| NIL . #13#)
                                    (LETT |middlepol| NIL . #13#)
                                    (LETT |s1| (REVERSE |s1|) . #13#)
                                    (SEQ G190
                                         (COND
                                          ((NULL (NULL (NULL |s1|)))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |middlepol|
                                                (CONS
                                                 (CONS (|SPADfirst| |s1|)
                                                       (|spadConstant| $ 13))
                                                 |middlepol|)
                                                . #13#)
                                          (EXIT (LETT |s1| (CDR |s1|) . #13#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (LETT |middlepol|
                                           (CONS (CONS 0 (|spadConstant| $ 19))
                                                 |middlepol|)
                                           . #13#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |l| (+ |l| 1) . #13#)
                          (EXIT
                           (LETT |a|
                                 (SPADCALL
                                  (PROG1 (LETT #1# |l| . #13#)
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                  (QREFELT $ 87))
                                 . #13#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 "failed"))))))))))))
          #15# (EXIT #6#)))) 

(SDEFUN |FFPOLY;nextNormalPrimitivePoly;SupU;14|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|a| (GF)) (|la| #1=(|NonNegativeInteger|)) (|c| (GF))
          (#2=#:G731 NIL) (|lc| #1#) (#3=#:G727 NIL)
          (|middlepol|
           #4=(|List|
               (|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|s1| (|List| (|NonNegativeInteger|)))
          (|tailpol|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|middlelookuplist| (|List| (|NonNegativeInteger|))) (#5=#:G719 NIL)
          (|taillookuplist| (|List| (|NonNegativeInteger|)))
          (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|))) (#6=#:G717 NIL) (#7=#:G743 NIL)
          (|entry| NIL) (|restfcopy| #4#) (|notReady| #8=(|Boolean|))
          (#9=#:G740 NIL) (#10=#:G741 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF)) (#11=#:G705 NIL)
          (|j| (|NonNegativeInteger|))
          (|term|
           #12=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF)))
          (#13=#:G694 NIL) (|headpol| (|List| #12#)) (|constterm| #12#)
          (#14=#:G688 NIL) (|noGenerator| #8#) (|a0| (GF))
          (|n2| (|NonNegativeInteger|)) (#15=#:G685 NIL)
          (|n1| (|NonNegativeInteger|)) (#16=#:G684 NIL) (#17=#:G739 NIL)
          (#18=#:G680 NIL) (|q1| (|NonNegativeInteger|)) (#19=#:G678 NIL)
          (|c0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|fcopy|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#20=#:G742 NIL)
          (|fRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |f| (QREFELT $ 12))
                  . #21=(|FFPOLY;nextNormalPrimitivePoly;SupU;14|))
            (EXIT
             (COND
              ((EQL |n| 0) (|error| "polynomial must have positive degree"))
              (#22='T
               (SEQ
                (COND
                 ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #21#)
                            (|spadConstant| $ 13) (QREFELT $ 66))
                  (LETT |f|
                        (SPADCALL (SPADCALL |lcf| (QREFELT $ 84)) |f|
                                  (QREFELT $ 31))
                        . #21#)))
                (LETT |fRepr| |f| . #21#) (LETT |fcopy| NIL . #21#)
                (SEQ (LETT |term| NIL . #21#) (LETT #20# |fRepr| . #21#) G190
                     (COND
                      ((OR (ATOM #20#)
                           (PROGN (LETT |term| (CAR #20#) . #21#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |fcopy|
                             (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                             . #21#)))
                     (LETT #20# (CDR #20#) . #21#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (QCAR |term|) 0 (QREFELT $ 64))
                  (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #21#)
                       (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #21#)))))
                (LETT |fcopy| (REVERSE |fcopy|) . #21#)
                (LETT |xn| (|SPADfirst| |fcopy|) . #21#)
                (LETT |c0| (QCDR |term|) . #21#)
                (LETT |lc| (REM (SPADCALL |c0| (QREFELT $ 86)) (QREFELT $ 10))
                      . #21#)
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SEQ
                    (LETT |q1|
                          (PROG1 (LETT #19# (- (QREFELT $ 10) 1) . #21#)
                            (|check_subtype2| (>= #19# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #19#))
                          . #21#)
                    (SEQ G190 (COND ((NULL (< |lc| |q1|)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |lc| (+ |lc| 1) . #21#)
                                (LETT |c|
                                      (SPADCALL
                                       (PROG1 (LETT #18# |lc| . #21#)
                                         (|check_subtype2| (> #18# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #18#))
                                       (QREFELT $ 87))
                                      . #21#)
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                             (QREFELT $ 90))
                                   (PROGN
                                    (LETT #17#
                                          (PROGN
                                           (LETT #10#
                                                 (CONS 0
                                                       (LIST |xn|
                                                             (CONS 0 |c|)))
                                                 . #21#)
                                           (GO #23=#:G738))
                                          . #21#)
                                    (GO #24=#:G681)))))))
                          #24# (EXIT #17#))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 "failed"))))
                  (#22#
                   (SEQ
                    (LETT |n1|
                          (PROG1 (LETT #16# (- |n| 1) . #21#)
                            (|check_subtype2| (>= #16# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #16#))
                          . #21#)
                    (LETT |n2|
                          (PROG1 (LETT #15# (- |n1| 1) . #21#)
                            (|check_subtype2| (>= #15# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #15#))
                          . #21#)
                    (LETT |middlepol| (CDR |fcopy|) . #21#)
                    (LETT |a0| (QCDR (|SPADfirst| |middlepol|)) . #21#)
                    (LETT |la|
                          (REM (SPADCALL |a0| (QREFELT $ 86)) (QREFELT $ 10))
                          . #21#)
                    (LETT |c| |c0| . #21#) (LETT |a| |a0| . #21#)
                    (COND
                     ((EQL |la| 0)
                      (SEQ (LETT |la| 1 . #21#)
                           (EXIT (LETT |a| (|spadConstant| $ 13) . #21#)))))
                    (SEQ G190 (COND ((NULL (< |lc| (QREFELT $ 10))) (GO G191)))
                         (SEQ (LETT |noGenerator| 'T . #21#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       (|noGenerator| (< |lc| (QREFELT $ 10)))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 13)
                                                    (QREFELT $ 26))
                                          |n| (QREFELT $ 91))
                                         |c| (QREFELT $ 92))
                                        (QREFELT $ 90))
                                       (LETT |noGenerator| NIL . #21#))
                                      ('T
                                       (SEQ (LETT |lc| (+ |lc| 1) . #21#)
                                            (EXIT
                                             (LETT |c|
                                                   (SPADCALL
                                                    (PROG1
                                                        (LETT #14# |lc| . #21#)
                                                      (|check_subtype2|
                                                       (> #14# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #14#))
                                                    (QREFELT $ 87))
                                                   . #21#)))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                (|noGenerator|
                                 (PROGN
                                  (LETT #10# (CONS 1 "failed") . #21#)
                                  (GO #23#)))
                                ('T
                                 (SEQ (LETT |constterm| (CONS 0 |c|) . #21#)
                                      (SEQ G190
                                           (COND
                                            ((NULL (< |la| (QREFELT $ 10)))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |headpol|
                                                  (LIST |xn| (CONS |n1| |a|))
                                                  . #21#)
                                            (COND
                                             ((SPADCALL |c| |c0|
                                                        (QREFELT $ 51))
                                              (COND
                                               ((SPADCALL |a| |a0|
                                                          (QREFELT $ 51))
                                                (SEQ
                                                 (LETT |middlepol|
                                                       (CDR
                                                        (REVERSE
                                                         (CDR |middlepol|)))
                                                       . #21#)
                                                 (LETT |weight|
                                                       (+ (LENGTH |middlepol|)
                                                          1)
                                                       . #21#)
                                                 (LETT |middlelookuplist|
                                                       (SPADCALL
                                                        (PROG1
                                                            (LETT #13#
                                                                  (- |weight|
                                                                     1)
                                                                  . #21#)
                                                          (|check_subtype2|
                                                           (>= #13# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #13#))
                                                        0 (QREFELT $ 85))
                                                       . #21#)
                                                 (EXIT (LETT |s| NIL . #21#))))
                                               ('T
                                                (SEQ
                                                 (LETT |pol|
                                                       (|FFPOLY;listToSUP|
                                                        (SPADCALL |headpol|
                                                                  (LIST
                                                                   |constterm|)
                                                                  (QREFELT $
                                                                           97))
                                                        $)
                                                       . #21#)
                                                 (COND
                                                  ((SPADCALL |pol|
                                                             (QREFELT $ 80))
                                                   (COND
                                                    ((SPADCALL |pol|
                                                               (QREFELT $ 76))
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #10#
                                                             (CONS 0 |pol|)
                                                             . #21#)
                                                       (GO #23#)))))))
                                                 (LETT |middlepol|
                                                       (LIST
                                                        (CONS 1
                                                              (|spadConstant| $
                                                                              19)))
                                                       . #21#)
                                                 (LETT |middlelookuplist|
                                                       (LIST (QREFELT $ 10))
                                                       . #21#)
                                                 (LETT |s| (LIST 0 1) . #21#)
                                                 (EXIT
                                                  (LETT |weight| 2 . #21#))))))
                                             ('T
                                              (SEQ
                                               (LETT |pol|
                                                     (|FFPOLY;listToSUP|
                                                      (SPADCALL |headpol|
                                                                (LIST
                                                                 |constterm|)
                                                                (QREFELT $ 97))
                                                      $)
                                                     . #21#)
                                               (COND
                                                ((SPADCALL |pol|
                                                           (QREFELT $ 80))
                                                 (COND
                                                  ((SPADCALL |pol|
                                                             (QREFELT $ 76))
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #10# (CONS 0 |pol|)
                                                           . #21#)
                                                     (GO #23#)))))))
                                               (LETT |middlepol|
                                                     (LIST
                                                      (CONS 1
                                                            (|spadConstant| $
                                                                            19)))
                                                     . #21#)
                                               (LETT |middlelookuplist|
                                                     (LIST (QREFELT $ 10))
                                                     . #21#)
                                               (LETT |s| (LIST 0 1) . #21#)
                                               (EXIT
                                                (LETT |weight| 2 . #21#)))))
                                            (LETT |tailpol| NIL . #21#)
                                            (LETT |taillookuplist| NIL . #21#)
                                            (LETT |notReady| 'T . #21#)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL |notReady|)
                                                   (GO G191)))
                                                 (SEQ
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (NULL
                                                           (NULL
                                                            |middlelookuplist|)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |term|
                                                              (|SPADfirst|
                                                               |middlepol|)
                                                              . #21#)
                                                        (LETT |j|
                                                              (|SPADfirst|
                                                               |middlelookuplist|)
                                                              . #21#)
                                                        (COND
                                                         ((EQL |j| 0)
                                                          (LETT |j|
                                                                (SPADCALL
                                                                 (QCDR |term|)
                                                                 (QREFELT $
                                                                          86))
                                                                . #21#)))
                                                        (LETT |j| (+ |j| 1)
                                                              . #21#)
                                                        (EXIT
                                                         (COND
                                                          ((EQL
                                                            (REM |j|
                                                                 (QREFELT $
                                                                          10))
                                                            0)
                                                           (SEQ
                                                            (LETT |tailpol|
                                                                  (CONS |term|
                                                                        |tailpol|)
                                                                  . #21#)
                                                            (LETT |middlepol|
                                                                  (CDR
                                                                   |middlepol|)
                                                                  . #21#)
                                                            (LETT
                                                             |taillookuplist|
                                                             (CONS |j|
                                                                   |taillookuplist|)
                                                             . #21#)
                                                            (EXIT
                                                             (LETT
                                                              |middlelookuplist|
                                                              (CDR
                                                               |middlelookuplist|)
                                                              . #21#))))
                                                          ('T
                                                           (SEQ
                                                            (PROGN
                                                             (RPLACD
                                                              (|SPADfirst|
                                                               |middlepol|)
                                                              (SPADCALL
                                                               (PROG1
                                                                   (LETT #11#
                                                                         |j|
                                                                         . #21#)
                                                                 (|check_subtype2|
                                                                  (> #11# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #11#))
                                                               (QREFELT $ 87)))
                                                             (QCDR
                                                              (|SPADfirst|
                                                               |middlepol|)))
                                                            (SPADCALL
                                                             |middlelookuplist|
                                                             |j|
                                                             (QREFELT $ 83))
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                |taillookuplist|)
                                                               (SEQ
                                                                (LETT |pol|
                                                                      (|FFPOLY;listToSUP|
                                                                       (SPADCALL
                                                                        |headpol|
                                                                        (REVERSE
                                                                         (CONS
                                                                          |constterm|
                                                                          |middlepol|))
                                                                        (QREFELT
                                                                         $ 97))
                                                                       $)
                                                                      . #21#)
                                                                (EXIT
                                                                 (COND
                                                                  ((SPADCALL
                                                                    |pol|
                                                                    (QREFELT $
                                                                             80))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (COND
                                                                      ((SPADCALL
                                                                        |pol|
                                                                        (QREFELT
                                                                         $ 76))
                                                                       (PROGN
                                                                        (LETT
                                                                         #9#
                                                                         (PROGN
                                                                          (LETT
                                                                           #10#
                                                                           (CONS
                                                                            0
                                                                            |pol|)
                                                                           . #21#)
                                                                          (GO
                                                                           #23#))
                                                                         . #21#)
                                                                        (GO
                                                                         #25=#:G707)))))
                                                                    #25#
                                                                    (EXIT
                                                                     #9#)))))))
                                                              ('T
                                                               (SEQ
                                                                (LETT
                                                                 |middlepol|
                                                                 (CONS
                                                                  (|SPADfirst|
                                                                   |tailpol|)
                                                                  |middlepol|)
                                                                 . #21#)
                                                                (LETT |tailpol|
                                                                      (CDR
                                                                       |tailpol|)
                                                                      . #21#)
                                                                (LETT
                                                                 |middlelookuplist|
                                                                 (CONS
                                                                  (|SPADfirst|
                                                                   |taillookuplist|)
                                                                  |middlelookuplist|)
                                                                 . #21#)
                                                                (EXIT
                                                                 (LETT
                                                                  |taillookuplist|
                                                                  (CDR
                                                                   |taillookuplist|)
                                                                  . #21#)))))))))))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (EXIT
                                                   (COND
                                                    ((EQL |weight| |n1|)
                                                     (LETT |notReady| NIL
                                                           . #21#))
                                                    ('T
                                                     (SEQ
                                                      (COND
                                                       ((NULL |s|)
                                                        (SEQ
                                                         (LETT |restfcopy|
                                                               (CDR
                                                                (CDR |fcopy|))
                                                               . #21#)
                                                         (EXIT
                                                          (SEQ
                                                           (LETT |entry| NIL
                                                                 . #21#)
                                                           (LETT #7#
                                                                 |restfcopy|
                                                                 . #21#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #7#)
                                                                 (PROGN
                                                                  (LETT |entry|
                                                                        (CAR
                                                                         #7#)
                                                                        . #21#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT |s|
                                                                   (CONS
                                                                    (QCAR
                                                                     |entry|)
                                                                    |s|)
                                                                   . #21#)))
                                                           (LETT #7# (CDR #7#)
                                                                 . #21#)
                                                           (GO G190) G191
                                                           (EXIT NIL))))))
                                                      (LETT |s1|
                                                            (PROG2
                                                                (LETT #6#
                                                                      (|FFPOLY;nextSubset|
                                                                       (CDR
                                                                        |s|)
                                                                       |n2| $)
                                                                      . #21#)
                                                                (QCDR #6#)
                                                              (|check_union2|
                                                               (QEQCAR #6# 0)
                                                               (|List|
                                                                (|NonNegativeInteger|))
                                                               (|Union|
                                                                (|List|
                                                                 (|NonNegativeInteger|))
                                                                "failed")
                                                               #6#))
                                                            . #21#)
                                                      (LETT |s| (CONS 0 |s1|)
                                                            . #21#)
                                                      (LETT |weight|
                                                            (SPADCALL |s|
                                                                      (QREFELT
                                                                       $ 82))
                                                            . #21#)
                                                      (LETT |taillookuplist|
                                                            NIL . #21#)
                                                      (LETT |middlelookuplist|
                                                            (CONS
                                                             (QREFELT $ 10)
                                                             (SPADCALL
                                                              (PROG1
                                                                  (LETT #5#
                                                                        (-
                                                                         |weight|
                                                                         2)
                                                                        . #21#)
                                                                (|check_subtype2|
                                                                 (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                                              1
                                                              (QREFELT $ 85)))
                                                            . #21#)
                                                      (LETT |tailpol| NIL
                                                            . #21#)
                                                      (LETT |middlepol|
                                                            (LIST
                                                             (CONS
                                                              (|SPADfirst|
                                                               |s1|)
                                                              (|spadConstant| $
                                                                              19)))
                                                            . #21#)
                                                      (SEQ G190
                                                           (COND
                                                            ((NULL
                                                              (NULL
                                                               (NULL
                                                                (LETT |s1|
                                                                      (CDR
                                                                       |s1|)
                                                                      . #21#))))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT |middlepol|
                                                                   (CONS
                                                                    (CONS
                                                                     (|SPADfirst|
                                                                      |s1|)
                                                                     (|spadConstant|
                                                                      $ 13))
                                                                    |middlepol|)
                                                                   . #21#)))
                                                           NIL (GO G190) G191
                                                           (EXIT NIL))
                                                      (EXIT
                                                       (LETT |middlepol|
                                                             (REVERSE
                                                              |middlepol|)
                                                             . #21#)))))))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (LETT |la| (+ |la| 1) . #21#)
                                            (EXIT
                                             (LETT |a|
                                                   (SPADCALL
                                                    (PROG1
                                                        (LETT #3# |la| . #21#)
                                                      (|check_subtype2|
                                                       (> #3# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                                    (QREFELT $ 87))
                                                   . #21#)))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (LETT |lc| (+ |lc| 1) . #21#)
                                      (LETT |c|
                                            (SPADCALL
                                             (PROG1 (LETT #2# |lc| . #21#)
                                               (|check_subtype2| (> #2# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                             (QREFELT $ 87))
                                            . #21#)
                                      (LETT |la| 1 . #21#)
                                      (EXIT
                                       (LETT |a| (|spadConstant| $ 13)
                                             . #21#)))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS 1 "failed"))))))))))))
          #23# (EXIT #10#)))) 

(SDEFUN |FFPOLY;nextPrimitiveNormalPoly;SupU;15|
        ((|f| |SparseUnivariatePolynomial| GF)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPADCALL |f| (QREFELT $ 99))) 

(SDEFUN |FFPOLY;createIrreduciblePoly;PiSup;16|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G749 NIL) (|xn| #2=(|SparseUnivariatePolynomial| GF))
          (|x| #2#))
         (SEQ
          (LETT |x| (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                . #3=(|FFPOLY;createIrreduciblePoly;PiSup;16|))
          (EXIT
           (COND ((EQL |n| 1) |x|)
                 (#4='T
                  (SEQ
                   (LETT |xn|
                         (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
                         . #3#)
                   (EXIT
                    (COND
                     ((>= |n| (QREFELT $ 10))
                      (PROG2
                          (LETT #1#
                                (SPADCALL (SPADCALL |xn| |x| (QREFELT $ 32))
                                          (QREFELT $ 89))
                                . #3#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 6))
                                        (|Union|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 6))
                                         #5="failed")
                                        #1#)))
                     ((ODDP |n|)
                      (PROG2
                          (LETT #1#
                                (SPADCALL
                                 (SPADCALL |xn| (|spadConstant| $ 22)
                                           (QREFELT $ 32))
                                 (QREFELT $ 89))
                                . #3#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 6))
                                        (|Union|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 6))
                                         #5#)
                                        #1#)))
                     (#4#
                      (PROG2 (LETT #1# (SPADCALL |xn| (QREFELT $ 89)) . #3#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0)
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 6))
                                        (|Union|
                                         (|SparseUnivariatePolynomial|
                                          (QREFELT $ 6))
                                         #5#)
                                        #1#)))))))))))) 

(SDEFUN |FFPOLY;createPrimitivePoly;PiSup;17|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G767 NIL) (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|)))
          (|s1| (|List| (|NonNegativeInteger|))) (#2=#:G761 NIL)
          (|notReady| (|Boolean|)) (#3=#:G772 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF))
          (|polRepr|
           (|List|
            #4=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|n1| (|NonNegativeInteger|)) (#5=#:G756 NIL) (|constterm| #4#)
          (|c0| (GF)) (|xn| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
                  . #6=(|FFPOLY;createPrimitivePoly;PiSup;17|))
            (EXIT
             (COND
              ((EQL |n| 1)
               (SPADCALL |xn|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 102)) (QREFELT $ 26))
                          0 (QREFELT $ 16))
                         (QREFELT $ 32)))
              ('T
               (SEQ
                (LETT |c0|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) |n|
                        (QREFELT $ 103))
                       (SPADCALL (QREFELT $ 102)) (QREFELT $ 92))
                      . #6#)
                (LETT |constterm| (CONS 0 |c0|) . #6#)
                (LETT |s| (LIST 0 1) . #6#) (LETT |weight| 2 . #6#)
                (LETT |s1| (LIST 1) . #6#)
                (LETT |n1|
                      (PROG1 (LETT #5# (- |n| 1) . #6#)
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#))
                      . #6#)
                (LETT |notReady| 'T . #6#)
                (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                     (SEQ (LETT |polRepr| (LIST |constterm|) . #6#)
                          (SEQ G190
                               (COND ((NULL (NULL (NULL |s1|))) (GO G191)))
                               (SEQ
                                (LETT |polRepr|
                                      (CONS
                                       (CONS (|SPADfirst| |s1|)
                                             (|spadConstant| $ 13))
                                       |polRepr|)
                                      . #6#)
                                (EXIT (LETT |s1| (CDR |s1|) . #6#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |polRepr|
                                (CONS (CONS |n| (|spadConstant| $ 13))
                                      |polRepr|)
                                . #6#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (LETT |pol| (|FFPOLY;listToSUP| |polRepr| $)
                                    . #6#)
                              (QREFELT $ 76))
                             (PROGN (LETT #3# |pol| . #6#) (GO #7=#:G771)))
                            ((EQL |weight| |n|) (LETT |notReady| NIL . #6#))
                            ('T
                             (SEQ
                              (LETT |s1|
                                    (PROG2
                                        (LETT #2#
                                              (|FFPOLY;nextSubset| (CDR |s|)
                                               |n1| $)
                                              . #6#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (|List|
                                                       (|NonNegativeInteger|))
                                                      (|Union|
                                                       (|List|
                                                        (|NonNegativeInteger|))
                                                       "failed")
                                                      #2#))
                                    . #6#)
                              (LETT |s| (CONS 0 |s1|) . #6#)
                              (EXIT
                               (LETT |weight| (SPADCALL |s| (QREFELT $ 82))
                                     . #6#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL |xn| (SPADCALL |c0| 0 (QREFELT $ 16))
                                      (QREFELT $ 32))
                            (QREFELT $ 94))
                           . #6#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 6))
                                    "failed")
                                   #1#)))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |FFPOLY;createNormalPoly;PiSup;18|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG ((#1=#:G776 NIL) (#2=#:G774 NIL))
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) 0
                            (QREFELT $ 16))
                           (QREFELT $ 32)))
                ('T
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 13) |n|
                                       (QREFELT $ 16))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                              (PROG1
                                  (LETT #2# (- |n| 1)
                                        . #3=(|FFPOLY;createNormalPoly;PiSup;18|))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 16))
                             (QREFELT $ 32))
                            (QREFELT $ 98))
                           . #3#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 6))
                                    "failed")
                                   #1#)))))) 

(SDEFUN |FFPOLY;createNormalPrimitivePoly;PiSup;19|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#1=#:G783 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (|res| (|Union| (|SparseUnivariatePolynomial| GF) #2="failed"))
          (|constterm| #3=(|SparseUnivariatePolynomial| GF)) (|c0| (GF))
          (|n1| (|NonNegativeInteger|)) (#4=#:G779 NIL) (|xn| #3#))
         (SEQ
          (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
                . #5=(|FFPOLY;createNormalPrimitivePoly;PiSup;19|))
          (EXIT
           (COND
            ((EQL |n| 1)
             (SPADCALL |xn|
                       (SPADCALL
                        (SPADCALL (SPADCALL (QREFELT $ 102)) (QREFELT $ 26)) 0
                        (QREFELT $ 16))
                       (QREFELT $ 32)))
            (#6='T
             (SEQ
              (LETT |n1|
                    (PROG1 (LETT #4# (- |n| 1) . #5#)
                      (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #4#))
                    . #5#)
              (LETT |c0|
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                               |n| (QREFELT $ 103))
                     (SPADCALL (QREFELT $ 102)) (QREFELT $ 92))
                    . #5#)
              (LETT |constterm| (SPADCALL |c0| 0 (QREFELT $ 16)) . #5#)
              (LETT |pol|
                    (SPADCALL
                     (SPADCALL |xn|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                                |n1| (QREFELT $ 16))
                               (QREFELT $ 32))
                     |constterm| (QREFELT $ 32))
                    . #5#)
              (COND
               ((SPADCALL |pol| (QREFELT $ 80))
                (COND ((SPADCALL |pol| (QREFELT $ 76)) (EXIT |pol|)))))
              (LETT |res| (SPADCALL |pol| (QREFELT $ 99)) . #5#)
              (EXIT
               (COND ((QEQCAR |res| 0) (QCDR |res|))
                     (#6#
                      (SEQ
                       (LETT |pol|
                             (SPADCALL
                              (SPADCALL |xn|
                                        (SPADCALL (|spadConstant| $ 13) |n1|
                                                  (QREFELT $ 16))
                                        (QREFELT $ 32))
                              |constterm| (QREFELT $ 32))
                             . #5#)
                       (COND
                        ((SPADCALL |pol| (QREFELT $ 80))
                         (COND
                          ((SPADCALL |pol| (QREFELT $ 76)) (EXIT |pol|)))))
                       (EXIT
                        (PROG2 (LETT #1# (SPADCALL |pol| (QREFELT $ 99)) . #5#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 6))
                                          (|Union|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT $ 6))
                                           #2#)
                                          #1#)))))))))))))) 

(SDEFUN |FFPOLY;createPrimitiveNormalPoly;PiSup;20|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPADCALL |n| (QREFELT $ 106))) 

(SDEFUN |FFPOLY;random;PiSup;21|
        ((|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((|polRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|c| (GF)) (#1=#:G798 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|))
          (#2=#:G793 NIL))
         (SEQ (LETT |polRepr| NIL . #3=(|FFPOLY;random;PiSup;21|))
              (LETT |n1|
                    (PROG1 (LETT #2# (- |n| 1) . #3#)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #1# |n1| . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |c| (SPADCALL (QREFELT $ 108)) . #3#)
                                 (|spadConstant| $ 19) (QREFELT $ 66))
                       (LETT |polRepr| (CONS (CONS |i| |c|) |polRepr|)
                             . #3#)))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (CONS |n| (|spadConstant| $ 13)) |polRepr|))))) 

(SDEFUN |FFPOLY;random;2PiSup;22|
        ((|m| . #1=(|PositiveInteger|)) (|n| . #2=(|PositiveInteger|))
         ($ |SparseUnivariatePolynomial| GF))
        (SPROG
         ((#3=#:G800 NIL) (|d| (|NonNegativeInteger|)) (#4=#:G799 NIL)
          (|#G65| #1#) (|#G64| #2#))
         (SEQ
          (COND
           ((SPADCALL |m| |n| (QREFELT $ 110))
            (PROGN
             (LETT |#G64| |n| . #5=(|FFPOLY;random;2PiSup;22|))
             (LETT |#G65| |m| . #5#)
             (LETT |m| |#G64| . #5#)
             (LETT |n| |#G65| . #5#))))
          (LETT |d|
                (PROG1 (LETT #4# (- |n| |m|) . #5#)
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#))
                . #5#)
          (COND
           ((SPADCALL |d| 1 (QREFELT $ 93))
            (LETT |n|
                  (PROG1 (LETT #3# (+ (RANDOM |d|) |m|) . #5#)
                    (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                      '(|Integer|) #3#))
                  . #5#)))
          (EXIT (SPADCALL |n| (QREFELT $ 109)))))) 

(DECLAIM (NOTINLINE |FiniteFieldPolynomialPackage;|)) 

(DEFUN |FiniteFieldPolynomialPackage| (#1=#:G803)
  (SPROG NIL
         (PROG (#2=#:G804)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldPolynomialPackage|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldPolynomialPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteFieldPolynomialPackage;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldPolynomialPackage|)))))))))) 

(DEFUN |FiniteFieldPolynomialPackage;| (|#1|)
  (SPROG ((#1=#:G161 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldPolynomialPackage|))
          (LETT |dv$| (LIST '|FiniteFieldPolynomialPackage| DV$1) . #2#)
          (LETT $ (GETREFV 112) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #2#))
          (|haddProp| |$ConstructorCache| '|FiniteFieldPolynomialPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|ModMonic| |#1| (|SparseUnivariatePolynomial| |#1|)))
          (QSETREFV $ 10
                    (PROG1 (LETT #1# (SPADCALL (QREFELT $ 9)) . #2#)
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #1#)))
          $))) 

(MAKEPROP '|FiniteFieldPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'MM (|NonNegativeInteger|)
              (0 . |size|) '|sizeGF| (|SparseUnivariatePolynomial| 6)
              (4 . |degree|) (9 . |One|) (13 . |One|) (17 . |setPoly|)
              (22 . |monomial|) (28 . |reduce|) (33 . ^) (39 . |Zero|)
              (43 . |Zero|) (47 . |Zero|) (51 . |One|) (55 . *) (61 . |lift|)
              (66 . |coefficient|) (72 . -) (77 . |coerce|) (|Boolean|)
              (82 . ~=) (88 . |leadingCoefficient|) (93 . *) (99 . +)
              (105 . |reductum|) (|PrimitiveArray| 11)
              |FFPOLY;reducedQPowers;SupPa;3| (|Vector| 6) (110 . |vectorise|)
              (|List| 6) (116 . |entries|) (|List| 38) (|Matrix| 6)
              (121 . |matrix|) (126 . |transpose|) (|Integer|)
              (131 . |setelt!|) (139 . |horizConcat|) (|List| 36)
              (145 . |nullSpace|) (150 . |elt|) (156 . |elt|) (162 . =)
              |FFPOLY;leastAffineMultiple;2Sup;4|
              (|IntegerNumberTheoryFunctions|) (168 . |moebiusMu|) (|List| 44)
              (173 . |divisors|) (|PositiveInteger|) (178 . ^)
              |FFPOLY;numberOfIrreduciblePoly;2Pi;5| (184 . |eulerPhi|)
              |FFPOLY;numberOfPrimitivePoly;2Pi;6| (189 . |characteristic|)
              (193 . *) (199 . ~=) |FFPOLY;numberOfNormalPoly;2Pi;7| (205 . ~=)
              (211 . ^) (|Factored| $) (217 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 70) (|:| |factor| 44) (|:| |exponent| 8))
              (|List| 71) (|Factored| 44) (222 . |factorList|) (227 . =)
              |FFPOLY;primitive?;SupB;8| (|DistinctDegreeFactorize| 6 11)
              (233 . |irreducible?|) (238 . |rank|) |FFPOLY;normal?;SupB;9|
              (|List| 8) (243 . |#|) (248 . |setfirst!|) (254 . |inv|)
              (259 . |new|) (265 . |lookup|) (270 . |index|)
              (|Union| 11 '"failed") |FFPOLY;nextIrreduciblePoly;SupU;11|
              (275 . |primitive?|) (280 . ^) (286 . *) (292 . >)
              |FFPOLY;nextPrimitivePoly;SupU;12|
              (|Record| (|:| |expnt| 8) (|:| |coeff| 6)) (|List| 95)
              (298 . |append|) |FFPOLY;nextNormalPoly;SupU;13|
              |FFPOLY;nextNormalPrimitivePoly;SupU;14|
              |FFPOLY;nextPrimitiveNormalPoly;SupU;15|
              |FFPOLY;createIrreduciblePoly;PiSup;16|
              (304 . |primitiveElement|) (308 . ^)
              |FFPOLY;createPrimitivePoly;PiSup;17|
              |FFPOLY;createNormalPoly;PiSup;18|
              |FFPOLY;createNormalPrimitivePoly;PiSup;19|
              |FFPOLY;createPrimitiveNormalPoly;PiSup;20| (314 . |random|)
              |FFPOLY;random;PiSup;21| (318 . >) |FFPOLY;random;2PiSup;22|)
           '#(|reducedQPowers| 324 |random| 329 |primitive?| 340
              |numberOfPrimitivePoly| 345 |numberOfNormalPoly| 350
              |numberOfIrreduciblePoly| 355 |normal?| 360 |nextPrimitivePoly|
              365 |nextPrimitiveNormalPoly| 370 |nextNormalPrimitivePoly| 375
              |nextNormalPoly| 380 |nextIrreduciblePoly| 385
              |leastAffineMultiple| 390 |createPrimitivePoly| 395
              |createPrimitiveNormalPoly| 400 |createNormalPrimitivePoly| 405
              |createNormalPoly| 410 |createIrreduciblePoly| 415)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(0 6 8 9 1 11 8 0 12 0 6 0 13
                                                   0 7 0 14 1 7 11 11 15 2 11 0
                                                   6 8 16 1 7 0 11 17 2 7 0 0 8
                                                   18 0 6 0 19 0 7 0 20 0 11 0
                                                   21 0 11 0 22 2 7 0 0 0 23 1
                                                   7 11 0 24 2 11 6 0 8 25 1 6
                                                   0 0 26 1 11 0 6 27 2 11 28 0
                                                   0 29 1 11 6 0 30 2 11 0 6 0
                                                   31 2 11 0 0 0 32 1 11 0 0 33
                                                   2 11 36 0 8 37 1 36 38 0 39
                                                   1 41 0 40 42 1 41 0 0 43 4
                                                   41 6 0 44 44 6 45 2 41 0 0 0
                                                   46 1 41 47 0 48 2 47 36 0 44
                                                   49 2 36 6 0 44 50 2 6 28 0 0
                                                   51 1 53 44 44 54 1 53 55 44
                                                   56 2 57 0 0 57 58 1 53 44 44
                                                   60 0 6 8 62 2 44 0 8 0 63 2
                                                   8 28 0 0 64 2 6 28 0 0 66 2
                                                   7 0 0 57 67 1 44 68 0 69 1
                                                   73 72 0 74 2 11 28 0 0 75 1
                                                   77 28 11 78 1 41 8 0 79 1 81
                                                   8 0 82 2 81 8 0 8 83 1 6 0 0
                                                   84 2 81 0 8 8 85 1 6 57 0 86
                                                   1 6 0 57 87 1 6 28 0 90 2 6
                                                   0 0 8 91 2 6 0 0 0 92 2 8 28
                                                   0 0 93 2 96 0 0 0 97 0 6 0
                                                   102 2 6 0 0 57 103 0 6 0 108
                                                   2 57 28 0 0 110 1 0 34 11 35
                                                   1 0 11 57 109 2 0 11 57 57
                                                   111 1 0 28 11 76 1 0 57 57
                                                   61 1 0 57 57 65 1 0 57 57 59
                                                   1 0 28 11 80 1 0 88 11 94 1
                                                   0 88 11 100 1 0 88 11 99 1 0
                                                   88 11 98 1 0 88 11 89 1 0 11
                                                   11 52 1 0 11 57 104 1 0 11
                                                   57 107 1 0 11 57 106 1 0 11
                                                   57 105 1 0 11 57 101)))))
           '|lookupComplete|)) 
