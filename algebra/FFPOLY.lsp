
(SDEFUN |FFPOLY;get_deg_GF| ((% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G51 NIL) (|n| (|PositiveInteger|))
          (|ss| (|NonNegativeInteger|)) (#2=#:G46 NIL))
         (SEQ
          (COND
           ((EQL (QREFELT % 12) 0)
            (SEQ (LETT |n| 1) (LETT |ss| (QREFELT % 9))
                 (SEQ G190 (COND ((NULL (> |ss| (QREFELT % 11))) (GO G191)))
                      (SEQ
                       (LETT |ss|
                             (PROG2
                                 (LETT #2# (|exquo_INT| |ss| (QREFELT % 11)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "failed")
                                               #2#)))
                       (EXIT (LETT |n| (+ |n| 1))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (SETELT % 12 |n|)))))
          (EXIT
           (PROG1 (LETT #1# (QREFELT % 12))
             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                               '(|NonNegativeInteger|) #1#)))))) 

(SDEFUN |FFPOLY;listToSUP|
        ((|l|
          (|List|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
         (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|newl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G65 NIL) (|t| NIL) (#2=#:G64 NIL))
         (SEQ
          (LETT |newl|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (CONS (CAR |t|) (CDR |t|)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT |newl|)))) 

(SDEFUN |FFPOLY;reducedQPowers;SupPa;3|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|PrimitiveArray| (|SparseUnivariatePolynomial| GF))))
        (SPROG
         ((|h| (|SparseUnivariatePolynomial| GF))
          (|g| (|SparseUnivariatePolynomial| GF)) (#1=#:G79 NIL) (|i| NIL)
          (|qexp| #2=(|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|w| (MM)) (#3=#:G78 NIL) (|qpow| #2#) (|e| (MM)) (|m1| (|Integer|))
          (|m| (|PositiveInteger|)))
         (SEQ (LETT |m| (SPADCALL |f| (QREFELT % 23))) (LETT |m1| (- |m| 1))
              (SPADCALL |f| (QREFELT % 24))
              (LETT |e|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 25))
                      (QREFELT % 26))
                     (QREFELT % 9) (QREFELT % 27)))
              (LETT |w| (|spadConstant| % 28))
              (LETT |qpow| (MAKEARR1 |m| (|spadConstant| % 29)))
              (QSETAREF1 |qpow| 0 (|spadConstant| % 30))
              (SEQ (LETT |i| 1) (LETT #3# |m1|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |qpow| |i|
                                (SPADCALL
                                 (LETT |w| (SPADCALL |w| |e| (QREFELT % 31)))
                                 (QREFELT % 32)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |qexp| (MAKEARR1 |m| (|spadConstant| % 29)))
              (EXIT
               (COND
                ((EQL |m| 1)
                 (SEQ
                  (QSETAREF1 |qexp| 0
                             (SPADCALL
                              (SPADCALL (SPADCALL |f| 0 (QREFELT % 33))
                                        (QREFELT % 34))
                              (QREFELT % 35)))
                  (EXIT |qexp|)))
                ('T
                 (SEQ
                  (QSETAREF1 |qexp| 0
                             (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 25)))
                  (LETT |h| (QAREF1 |qpow| 1)) (QSETAREF1 |qexp| 1 |h|)
                  (SEQ (LETT |i| 2) (LETT #1# |m1|) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |g| (|spadConstant| % 29))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |h| (|spadConstant| % 29)
                                              (QREFELT % 37)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |g|
                                                  (SPADCALL
                                                   (SPADCALL |h|
                                                             (QREFELT % 38))
                                                   (QAREF1 |qpow|
                                                           (SPADCALL |h|
                                                                     (QREFELT %
                                                                              23)))
                                                   (QREFELT % 39))
                                                  (QREFELT % 40)))
                                  (EXIT
                                   (LETT |h| (SPADCALL |h| (QREFELT % 41)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (QSETAREF1 |qexp| |i| (LETT |h| |g|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |qexp|)))))))) 

(SDEFUN |FFPOLY;leastAffineMultiple;2Sup;4|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#1=#:G92 NIL) (#2=#:G91 #3=(|SparseUnivariatePolynomial| GF))
          (#4=#:G93 #3#) (#5=#:G95 NIL) (#6=#:G101 NIL) (|k| NIL)
          (|coeffVector| #7=(|Vector| GF)) (|dim| (|NonNegativeInteger|))
          (|i| (|PositiveInteger|)) (#8=#:G100 NIL) (|nse| NIL)
          (|ns| (|List| #7#)) (|col1| (|Matrix| GF)) (|b| (|Matrix| GF))
          (#9=#:G99 NIL) (|ii| NIL) (#10=#:G98 NIL)
          (|n| (|NonNegativeInteger|))
          (|qexp| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|lcf| (GF)))
         (SEQ
          (COND
           ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT % 38)))
                      (|spadConstant| % 14) (QREFELT % 44))
            (LETT |f|
                  (SPADCALL (SPADCALL |lcf| (QREFELT % 45)) |f|
                            (QREFELT % 39)))))
          (LETT |qexp| (SPADCALL |f| (QREFELT % 43)))
          (LETT |n| (SPADCALL |f| (QREFELT % 23)))
          (LETT |b|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #10# NIL)
                   (SEQ (LETT |ii| 0) (LETT #9# (- |n| 1)) G190
                        (COND ((|greater_SI| |ii| #9#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10#
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QAREF1 |qexp| |ii|) |n|
                                            (QREFELT % 47))
                                  (QREFELT % 49))
                                 #10#))))
                        (LETT |ii| (|inc_SI| |ii|)) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  (QREFELT % 52))
                 (QREFELT % 53)))
          (LETT |col1| (MAKE_MATRIX1 |n| 1 (|spadConstant| % 13)))
          (SPADCALL |col1| 1 1 (|spadConstant| % 14) (QREFELT % 55))
          (LETT |ns|
                (SPADCALL (SPADCALL |col1| |b| (QREFELT % 56)) (QREFELT % 58)))
          (LETT |dim| (+ |n| 2))
          (SEQ (LETT |nse| NIL) (LETT #8# |ns|) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |nse| (CAR #8#)) NIL)) (GO G191)))
               (SEQ (LETT |i| (+ |n| 1))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |nse| |i| (QREFELT % 59))
                                      (|spadConstant| % 13) (QREFELT % 60)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (- |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((< |i| |dim|)
                       (SEQ (LETT |dim| |i|)
                            (EXIT (LETT |coeffVector| |nse|)))))))
               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |coeffVector| 1 (QREFELT % 59)) (QREFELT % 35))
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |k| 2) (LETT #6# |dim|) G190
                  (COND ((|greater_SI| |k| #6#) (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (SPADCALL
                            (SPADCALL |coeffVector| |k| (QREFELT % 59))
                            (EXPT (QREFELT % 9)
                                  (PROG1 (LETT #5# (- |k| 2))
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#)))
                            (QREFELT % 25)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 40))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|spadConstant| % 29))))
            (QREFELT % 40)))))) 

(SDEFUN |FFPOLY;numberOfIrreduciblePoly;2Pi;5|
        ((|n| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G105 NIL) (|lastd| (|PositiveInteger|)) (|sum| (|Integer|))
          (|qd| (|PositiveInteger|)) (#2=#:G108 NIL) (|d| NIL)
          (|divisorsOfn| (|List| (|PositiveInteger|))))
         (SEQ
          (COND ((EQL |n| 1) (QREFELT % 9))
                ('T
                 (SEQ (LETT |lastd| 1) (LETT |qd| (QREFELT % 9))
                      (LETT |sum| (* (SPADCALL |n| (QREFELT % 63)) |qd|))
                      (LETT |divisorsOfn| (CDR (SPADCALL |n| (QREFELT % 65))))
                      (SEQ (LETT |d| NIL) (LETT #2# |divisorsOfn|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |qd|
                                  (* |qd|
                                     (EXPT (QREFELT % 9) (- |d| |lastd|))))
                            (LETT |sum|
                                  (+ |sum|
                                     (*
                                      (SPADCALL (|quotient_INT| |n| |d|)
                                                (QREFELT % 63))
                                      |qd|)))
                            (EXIT (LETT |lastd| |d|)))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROG1 (LETT #1# (|quotient_INT| |sum| |n|))
                         (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                           '(|Integer|) #1#))))))))) 

(SDEFUN |FFPOLY;numberOfPrimitivePoly;2Pi;6|
        ((|n| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G109 NIL))
               (PROG1
                   (LETT #1#
                         (|quotient_INT|
                          (SPADCALL (- (EXPT (QREFELT % 9) |n|) 1)
                                    (QREFELT % 67))
                          |n|))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FFPOLY;numberOfNormalPoly;2Pi;7|
        ((|n| #1=(|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG
         ((|prod| (|Integer|)) (|qe| #2=(|PositiveInteger|))
          (|e| (|PositiveInteger|)) (#3=#:G233 NIL) (|d| NIL)
          (|divisorsOfm| (|List| (|PositiveInteger|))) (#4=#:G223 NIL)
          (#5=#:G222 NIL) (|m| #1#) (#6=#:G116 NIL) (|q| #2#)
          (|p| (|PositiveInteger|)) (#7=#:G114 NIL) (#8=#:G113 NIL)
          (#9=#:G112 NIL))
         (SEQ
          (COND
           ((EQL |n| 1)
            (PROG1
                (LETT #8#
                      (PROG1 (LETT #9# (- (QREFELT % 9) 1))
                        (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #9#)))
              (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                '(|NonNegativeInteger|) #8#)))
           (#10='T
            (SEQ (LETT |m| |n|)
                 (LETT |p|
                       (PROG1 (LETT #7# (SPADCALL (QREFELT % 10)))
                         (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                           '(|NonNegativeInteger|) #7#)))
                 (LETT |q| (QREFELT % 9))
                 (SEQ G190 (COND ((NULL (EQL (REM |m| |p|) 0)) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |m|
                              (PROG1 (LETT #6# (|quotient_INT| |m| |p|))
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|)
                                                  #6#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((EQL |m| 1)
                    (PROG1
                        (LETT #4#
                              (|quotient_INT|
                               (*
                                (EXPT |q|
                                      (PROG1 (LETT #5# (- |n| 1))
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#)))
                                (- |q| 1))
                               |n|))
                      (|check_subtype2| (> #4# 0) '(|PositiveInteger|)
                                        '(|Integer|) #4#)))
                   (#10#
                    (SEQ (LETT |prod| (- |q| 1))
                         (LETT |divisorsOfm|
                               (CDR (SPADCALL |m| (QREFELT % 65))))
                         (SEQ (LETT |d| NIL) (LETT #3# |divisorsOfm|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |d| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |e| 1) (LETT |qe| |q|)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL (REM |qe| |d|) 1
                                                     (QREFELT % 69)))
                                          (GO G191)))
                                        (SEQ (LETT |e| (+ |e| 1))
                                             (EXIT (LETT |qe| (* |qe| |q|))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |prod|
                                          (* |prod|
                                             (EXPT (- |qe| 1)
                                                   (|quotient_INT|
                                                    (SPADCALL |d|
                                                              (QREFELT % 67))
                                                    |e|))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (|quotient_INT| (* (EXPT |q| (- |n| |m|)) |prod|)
                                          |n|)))))))))))) 

(SDEFUN |FFPOLY;primitive_i?|
        ((|f| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G248 NIL) (#2=#:G249 NIL) (|expt| (|NonNegativeInteger|))
          (#3=#:G251 NIL) (|d| NIL) (|lfact| (|List| (|PositiveInteger|)))
          (#4=#:G239 NIL) (#5=#:G250 NIL) (|rec| NIL)
          (|lrec|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|x| (MM)) (|qn1| (|PositiveInteger|)) (#6=#:G236 NIL)
          (#7=#:G235 NIL) (|q| (|PositiveInteger|))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                (EXIT
                 (COND ((EQL |n| 0) NIL)
                       ('T
                        (SEQ (LETT |q| (QREFELT % 9))
                             (LETT |qn1|
                                   (PROG1
                                       (LETT #6#
                                             (PROG1
                                                 (LETT #7#
                                                       (- (EXPT |q| |n|) 1))
                                               (|check_subtype2| (>= #7# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #7#)))
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #6#)))
                             (SPADCALL |f| (QREFELT % 24))
                             (LETT |x|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 14) 1
                                              (QREFELT % 25))
                                    (QREFELT % 26)))
                             (LETT |lrec|
                                   (SPADCALL (SPADCALL |qn1| (QREFELT % 72))
                                             (QREFELT % 77)))
                             (LETT |lfact| NIL)
                             (SEQ (LETT |rec| NIL) (LETT #5# |lrec|) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |rec| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |lfact|
                                          (CONS
                                           (PROG1 (LETT #4# (QVELT |rec| 1))
                                             (|check_subtype2| (> #4# 0)
                                                               '(|PositiveInteger|)
                                                               '(|Integer|)
                                                               #4#))
                                           |lfact|))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT NIL))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |d| NIL) (LETT #3# |lfact|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |d| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |expt| (|quotient_INT| |qn1| |d|))
                                     (EXIT
                                      (COND
                                       ((>= |expt| |n|)
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL
                                            (SPADCALL |x| |expt|
                                                      (QREFELT % 27))
                                            (QREFELT % 32))
                                           (|spadConstant| % 30)
                                           (QREFELT % 78))
                                          (PROGN
                                           (LETT #1#
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (GO #8=#:G247)))
                                           (GO #9=#:G244))))))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL)))
                              #9# (EXIT #1#))
                             (EXIT 'T)))))))
          #8# (EXIT #2#)))) 

(SDEFUN |FFPOLY;primitive?;SupB;9|
        ((|f| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (COND
         ((OR (EQL (SPADCALL |f| (QREFELT % 23)) 0)
              (OR
               (SPADCALL (SPADCALL |f| (QREFELT % 38)) (|spadConstant| % 14)
                         (QREFELT % 44))
               (OR
                (SPADCALL (SPADCALL |f| 0 (QREFELT % 33)) (|spadConstant| % 13)
                          (QREFELT % 60))
                (NULL (SPADCALL |f| (QREFELT % 80))))))
          NIL)
         ('T (|FFPOLY;primitive_i?| |f| %)))) 

(SDEFUN |FFPOLY;normal?;SupB;10|
        ((|f| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG
         ((|l| (|List| (|List| GF))) (#1=#:G269 NIL) (#2=#:G261 NIL) (|i| NIL)
          (#3=#:G268 NIL)
          (|g| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
              (EXIT
               (COND
                ((OR (EQL |n| 0)
                     (OR
                      (SPADCALL (SPADCALL |f| (QREFELT % 38))
                                (|spadConstant| % 14) (QREFELT % 44))
                      (SPADCALL (SPADCALL |f| 0 (QREFELT % 33))
                                (|spadConstant| % 13) (QREFELT % 60))))
                 NIL)
                ((EQL |n| 1) 'T)
                (#4='T
                 (COND ((NULL (SPADCALL |f| (QREFELT % 80))) NIL)
                       ('T
                        (SEQ (LETT |g| (SPADCALL |f| (QREFELT % 43)))
                             (LETT |l|
                                   (PROGN
                                    (LETT #3# NIL)
                                    (SEQ (LETT |i| 0)
                                         (LETT #1#
                                               (PROG1 (LETT #2# (- |n| 1))
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#)))
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #1#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL (QAREF1 |g| |i|)
                                                             |n|
                                                             (QREFELT % 47))
                                                   (QREFELT % 49))
                                                  #3#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #3#)))))
                             (EXIT
                              (COND
                               ((EQL
                                 (SPADCALL (SPADCALL |l| (QREFELT % 52))
                                           (QREFELT % 82))
                                 |n|)
                                'T)
                               (#4# NIL)))))))))))) 

(SDEFUN |FFPOLY;normal_and_primitive?|
        ((|f| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (COND ((SPADCALL |f| (QREFELT % 83)) (|FFPOLY;primitive_i?| |f| %))
              ('T NIL))) 

(SDEFUN |FFPOLY;nextSubset|
        ((|s| (|List| (|NonNegativeInteger|))) (|bound| (|NonNegativeInteger|))
         (% (|Union| (|List| (|NonNegativeInteger|)) "failed")))
        (SPROG
         ((|j| NIL) (#1=#:G288 NIL) (|i| (|NonNegativeInteger|))
          (|firstOfs| #2=(|NonNegativeInteger|)) (|noGap| (|Boolean|))
          (|firstOfsPlus1| (|NonNegativeInteger|)) (|secondOfs| #2#)
          (|restOfs| (|List| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (SPADCALL |s| (QREFELT % 85)))
                (EXIT
                 (COND ((EQL |m| 0) (CONS 0 (LIST 1)))
                       (#3='T
                        (SEQ (LETT |noGap| 'T) (LETT |i| 0)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      (|noGap|
                                       (NULL
                                        (NULL (LETT |restOfs| (CDR |s|)))))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |secondOfs| (|SPADfirst| |restOfs|))
                                   (LETT |firstOfsPlus1|
                                         (+ (|SPADfirst| |s|) 1))
                                   (EXIT
                                    (COND
                                     ((EQL |secondOfs| |firstOfsPlus1|)
                                      (SEQ (LETT |s| |restOfs|)
                                           (EXIT (LETT |i| (+ |i| 1)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL |s| |firstOfsPlus1|
                                                 (QREFELT % 86))
                                       (EXIT (LETT |noGap| NIL)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (COND
                              (|noGap|
                               (SEQ (LETT |firstOfs| (|SPADfirst| |s|))
                                    (EXIT
                                     (COND
                                      ((< |firstOfs| |bound|)
                                       (SPADCALL |s| (+ |firstOfs| 1)
                                                 (QREFELT % 86)))
                                      ((< |m| |bound|)
                                       (SEQ
                                        (SPADCALL |s| (+ |m| 1) (QREFELT % 86))
                                        (EXIT (LETT |i| |m|))))
                                      (#3#
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #4=#:G287))))))))
                             (SEQ (LETT |j| |i|) G190
                                  (COND ((< |j| 1) (GO G191)))
                                  (SEQ (EXIT (LETT |s| (CONS |j| |s|))))
                                  (LETT |j| (+ |j| -1)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |s|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FFPOLY;lexSmaller?;2SupB;13|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (|g| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG
         ((|g1| #1=(|SparseUnivariatePolynomial| GF)) (|f1| #1#)
          (#2=#:G301 NIL) (|k2| #3=(|NonNegativeInteger|)) (|k1| #3#)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                (EXIT
                 (COND
                  ((SPADCALL |n| (SPADCALL |g| (QREFELT % 23)) (QREFELT % 69))
                   (|error| "polynomials must have equal degrees"))
                  ((< |n| 1) (|error| "polynomials must have positive degree"))
                  (#4='T
                   (SEQ (LETT |k1| (SPADCALL |f| (QREFELT % 87)))
                        (LETT |k2| (SPADCALL |g| (QREFELT % 87)))
                        (EXIT
                         (COND ((< |k1| |k2|) 'T) ((< |k2| |k1|) NIL)
                               (#4#
                                (SEQ (LETT |f1| (SPADCALL |f| (QREFELT % 41)))
                                     (LETT |g1| (SPADCALL |g| (QREFELT % 41)))
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL |f1|
                                                       (|spadConstant| % 29)
                                                       (QREFELT % 37)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |k1|
                                                 (SPADCALL |f1|
                                                           (QREFELT % 23)))
                                           (LETT |k2|
                                                 (SPADCALL |g1|
                                                           (QREFELT % 23)))
                                           (EXIT
                                            (COND
                                             ((< |k1| |k2|)
                                              (PROGN
                                               (LETT #2# 'T)
                                               (GO #5=#:G300)))
                                             ((< |k2| |k1|)
                                              (PROGN (LETT #2# NIL) (GO #5#)))
                                             ('T
                                              (SEQ
                                               (LETT |f1|
                                                     (SPADCALL |f1|
                                                               (QREFELT % 41)))
                                               (EXIT
                                                (LETT |g1|
                                                      (SPADCALL |g1|
                                                                (QREFELT %
                                                                         41)))))))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (LETT |f1| (SPADCALL |f| (QREFELT % 41)))
                                     (LETT |g1| (SPADCALL |g| (QREFELT % 41)))
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL |f1|
                                                       (|spadConstant| % 29)
                                                       (QREFELT % 37)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |k1|
                                                 (SPADCALL
                                                  (SPADCALL |f1|
                                                            (QREFELT % 38))
                                                  (QREFELT % 88)))
                                           (LETT |k2|
                                                 (SPADCALL
                                                  (SPADCALL |g1|
                                                            (QREFELT % 38))
                                                  (QREFELT % 88)))
                                           (EXIT
                                            (COND
                                             ((< |k1| |k2|)
                                              (PROGN (LETT #2# 'T) (GO #5#)))
                                             ((< |k2| |k1|)
                                              (PROGN (LETT #2# NIL) (GO #5#)))
                                             ('T
                                              (SEQ
                                               (LETT |f1|
                                                     (SPADCALL |f1|
                                                               (QREFELT % 41)))
                                               (EXIT
                                                (LETT |g1|
                                                      (SPADCALL |g1|
                                                                (QREFELT %
                                                                         41)))))))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT NIL)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FFPOLY;ll_cmp| ((|x1| (GF)) (|x2| (GF)) (% (|SingleInteger|)))
        (SPROG ((|k2| #1=(|PositiveInteger|)) (|k1| #1#))
               (SEQ
                (COND
                 ((SPADCALL |x1| (|spadConstant| % 13) (QREFELT % 60))
                  (COND
                   ((SPADCALL |x2| (|spadConstant| % 13) (QREFELT % 44))
                    (EXIT -1)))))
                (COND
                 ((SPADCALL |x1| (|spadConstant| % 13) (QREFELT % 44))
                  (COND
                   ((SPADCALL |x2| (|spadConstant| % 13) (QREFELT % 60))
                    (EXIT 1)))))
                (LETT |k1| (SPADCALL |x1| (QREFELT % 88)))
                (LETT |k2| (SPADCALL |x2| (QREFELT % 88)))
                (EXIT (COND ((< |k1| |k2|) -1) ((< |k2| |k2|) 1) ('T 0)))))) 

(SDEFUN |FFPOLY;clexSmaller?;2SupB;15|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (|g| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG ((|s| (|SingleInteger|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| (SPADCALL |g| (QREFELT % 23))
                                 (QREFELT % 69))
                       (|error| "polynomials must have equal degrees"))
                      ((< |n| 1)
                       (|error| "polynomials must have positive degree"))
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (|FFPOLY;ll_cmp| (SPADCALL |f| 0 (QREFELT % 33))
                               (SPADCALL |g| 0 (QREFELT % 33)) %))
                        (EXIT
                         (COND ((|less_SI| |s| 0) 'T) ((|less_SI| 0 |s|) NIL)
                               (#1# (SPADCALL |f| |g| (QREFELT % 89)))))))))))) 

(SDEFUN |FFPOLY;nlexSmaller?;2SupB;16|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (|g| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG
         ((|s| (|SingleInteger|)) (#1=#:G310 NIL) (#2=#:G309 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
              (EXIT
               (COND
                ((SPADCALL |n| (SPADCALL |g| (QREFELT % 23)) (QREFELT % 69))
                 (|error| "polynomials must have equal degrees"))
                ((< |n| 1) (|error| "polynomials must have positive degree"))
                (#3='T
                 (SEQ
                  (LETT |s|
                        (|FFPOLY;ll_cmp|
                         (SPADCALL |f|
                                   (PROG1 (LETT #2# (- |n| 1))
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT % 33))
                         (SPADCALL |g|
                                   (PROG1 (LETT #1# (- |n| 1))
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT % 33))
                         %))
                  (EXIT
                   (COND ((|less_SI| |s| 0) 'T) ((|less_SI| 0 |s|) NIL)
                         (#3# (SPADCALL |f| |g| (QREFELT % 89)))))))))))) 

(SDEFUN |FFPOLY;cnlexSmaller?;2SupB;17|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (|g| (|SparseUnivariatePolynomial| GF)) (% (|Boolean|)))
        (SPROG ((|s| (|SingleInteger|)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                    (EXIT
                     (COND
                      ((SPADCALL |n| (SPADCALL |g| (QREFELT % 23))
                                 (QREFELT % 69))
                       (|error| "polynomials must have equal degrees"))
                      ((< |n| 1)
                       (|error| "polynomials must have positive degree"))
                      (#1='T
                       (SEQ
                        (LETT |s|
                              (|FFPOLY;ll_cmp| (SPADCALL |f| 0 (QREFELT % 33))
                               (SPADCALL |g| 0 (QREFELT % 33)) %))
                        (EXIT
                         (COND ((|less_SI| |s| 0) 'T) ((|less_SI| 0 |s|) NIL)
                               (#1# (SPADCALL |f| |g| (QREFELT % 91)))))))))))) 

(SDEFUN |FFPOLY;vecs_to_pol|
        ((|exp_v| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|coeff_v| (|PrimitiveArray| GF)) (|w| (|NonNegativeInteger|))
         (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|resl|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (#1=#:G322 NIL) (|i| NIL))
         (SEQ (LETT |resl| NIL)
              (SEQ (LETT |i| 0) (LETT #1# |w|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |resl|
                           (CONS
                            (CONS (QAREF1 |exp_v| |i|) (QAREF1 |coeff_v| |i|))
                            |resl|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |FFPOLY;do_weight|
        ((|exp_v| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|ind_v| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|coeff_v| (|PrimitiveArray| GF)) (|min_i| #1=(|NonNegativeInteger|))
         (|max_i| (|NonNegativeInteger|)) (|w| (|NonNegativeInteger|))
         (|tp?| (|Mapping| (|Boolean|) (|SparseUnivariatePolynomial| GF)))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((#2=#:G351 NIL) (#3=#:G352 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF)) (#4=#:G349 NIL) (|i| #1#)
          (|j| (|NonNegativeInteger|)) (#5=#:G350 NIL) (#6=#:G335 NIL)
          (#7=#:G353 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL (QREFELT % 9) 2)
              (COND
               ((ODDP |w|)
                (SEQ
                 (SEQ (LETT |i| |min_i|) (LETT #7# (- |max_i| 1)) G190
                      (COND ((> |i| #7#) (GO G191)))
                      (SEQ (QSETAREF1 |exp_v| |i| |i|)
                           (QSETAREF1 |coeff_v| |i| (QREFELT % 17))
                           (EXIT (QSETAREF1 |ind_v| |i| 1)))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (PROGN (LETT #3# (CONS 1 "failed")) (GO #8=#:G348))))))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| |min_i|)
                         (SEQ
                          (EXIT
                           (SEQ G190 (COND ((NULL (< |i| |max_i|)) (GO G191)))
                                (SEQ (LETT |j| (QAREF1 |ind_v| |i|))
                                     (LETT |j| (+ |j| 1))
                                     (EXIT
                                      (COND
                                       ((EQL |j| (QREFELT % 9))
                                        (SEQ (QSETAREF1 |ind_v| |i| 1)
                                             (QSETAREF1 |coeff_v| |i|
                                                        (QREFELT % 17))
                                             (EXIT (LETT |i| (+ |i| 1)))))
                                       ('T
                                        (SEQ (QSETAREF1 |ind_v| |i| |j|)
                                             (QSETAREF1 |coeff_v| |i|
                                                        (SPADCALL
                                                         (PROG1 (LETT #6# |j|)
                                                           (|check_subtype2|
                                                            (> #6# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #6#))
                                                         (QREFELT % 16)))
                                             (EXIT
                                              (PROGN
                                               (LETT #5# |$NoValue|)
                                               (GO #9=#:G338))))))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #9# (EXIT #5#))
                         (COND
                          ((EQL |i| |max_i|)
                           (SEQ (LETT |i| (MAX |min_i| 1))
                                (SEQ
                                 (EXIT
                                  (SEQ G190
                                       (COND
                                        ((NULL (< |i| |max_i|)) (GO G191)))
                                       (SEQ (LETT |j| (QAREF1 |exp_v| |i|))
                                            (LETT |j| (+ |j| 1))
                                            (EXIT
                                             (COND
                                              ((EQL |j|
                                                    (QAREF1 |exp_v| (+ |i| 1)))
                                               (SEQ
                                                (QSETAREF1 |exp_v| |i|
                                                           (+
                                                            (QAREF1 |exp_v|
                                                                    (- |i| 1))
                                                            1))
                                                (EXIT (LETT |i| (+ |i| 1)))))
                                              ('T
                                               (SEQ (QSETAREF1 |exp_v| |i| |j|)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #4# |$NoValue|)
                                                      (GO #10=#:G343))))))))
                                       NIL (GO G190) G191 (EXIT NIL)))
                                 #10# (EXIT #4#))
                                (EXIT
                                 (COND
                                  ((EQL |i| |max_i|)
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed"))
                                    (GO #8#))))))))
                         (LETT |pol|
                               (|FFPOLY;vecs_to_pol| |exp_v| |coeff_v| |w| %))
                         (EXIT
                          (COND
                           ((SPADCALL |pol| |tp?|)
                            (PROGN
                             (LETT #2#
                                   (PROGN (LETT #3# (CONS 0 |pol|)) (GO #8#)))
                             (GO #11=#:G345)))))))
                   #11# (EXIT #2#))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #3#)))) 

(SDEFUN |FFPOLY;do_weights|
        ((|exp_v| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|ind_v| (|PrimitiveArray| (|NonNegativeInteger|)))
         (|coeff_v| (|PrimitiveArray| GF)) (|min_i| (|NonNegativeInteger|))
         (|max_i| (|NonNegativeInteger|)) (|w| #1=(|NonNegativeInteger|))
         (|tp?| (|Mapping| (|Boolean|) (|SparseUnivariatePolynomial| GF)))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#2=#:G366 NIL) (|i1| NIL) (|w1| #1#)
          (#3=#:G365 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| GF) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QAREF1 |exp_v| |w|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (COND
                        ((> |max_i| |min_i|)
                         (SEQ
                          (LETT |resu|
                                (|FFPOLY;do_weight| |exp_v| |ind_v| |coeff_v|
                                 |min_i| |max_i| |w| |tp?| %))
                          (EXIT
                           (COND
                            ((QEQCAR |resu| 0)
                             (PROGN
                              (LETT #3# (CONS 0 (QCDR |resu|)))
                              (GO #4=#:G364))))))))
                       (EXIT
                        (COND
                         ((EQL |w| |n|)
                          (PROGN (LETT #3# (CONS 1 "failed")) (GO #4#)))
                         ('T
                          (SEQ (LETT |w1| |w|) (LETT |w| (+ |w| 1))
                               (LETT |i| |w|)
                               (SEQ (LETT |i1| |w1|) (LETT #2# |max_i|) G190
                                    (COND ((< |i1| #2#) (GO G191)))
                                    (SEQ
                                     (QSETAREF1 |exp_v| |i|
                                                (QAREF1 |exp_v| |i1|))
                                     (QSETAREF1 |coeff_v| |i|
                                                (QAREF1 |coeff_v| |i1|))
                                     (EXIT (LETT |i| |i1|)))
                                    (LETT |i1| (+ |i1| -1)) (GO G190) G191
                                    (EXIT NIL))
                               (QSETAREF1 |exp_v| |max_i| |max_i|)
                               (QSETAREF1 |ind_v| |max_i| 1)
                               (QSETAREF1 |coeff_v| |max_i| (QREFELT % 17))
                               (LETT |max_i| (+ |max_i| 1))
                               (EXIT (QSETAREF1 |ind_v| |min_i| 0)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #3#)))) 

(SDEFUN |FFPOLY;nextIrreduciblePoly;SupU;21|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((|ci| (GF)) (#1=#:G400 NIL) (|term| NIL) (|i| NIL)
          (|coeff_v| (|PrimitiveArray| GF))
          (|ind_v| #2=(|PrimitiveArray| (|NonNegativeInteger|))) (|exp_v| #2#)
          (|w| (|NonNegativeInteger|)) (|good_binomials| (|Boolean|))
          (#3=#:G398 NIL) (#4=#:G399 NIL) (|fac| NIL)
          (|facs|
           (|List|
            (|Record| (|:| |factor| (|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G377 NIL) (|c| (GF)) (#6=#:G369 NIL)
          (|lc| (|NonNegativeInteger|))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|c0| (GF))
          (|f_rep|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
              (EXIT
               (COND
                ((EQL |n| 0) (|error| "polynomial must have positive degree"))
                (#7='T
                 (SEQ
                  (COND
                   ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT % 38)))
                              (|spadConstant| % 14) (QREFELT % 44))
                    (LETT |f|
                          (SPADCALL (SPADCALL |lcf| (QREFELT % 45)) |f|
                                    (QREFELT % 39)))))
                  (LETT |f_rep| |f|)
                  (LETT |c0| (SPADCALL |f| 0 (QREFELT % 33)))
                  (EXIT
                   (COND
                    ((EQL |n| 1)
                     (SEQ (LETT |xn| (|SPADfirst| |f_rep|))
                          (LETT |lc|
                                (COND
                                 ((SPADCALL |c0| (|spadConstant| % 13)
                                            (QREFELT % 60))
                                  0)
                                 (#7# (SPADCALL |c0| (QREFELT % 88)))))
                          (EXIT
                           (COND
                            ((EQL |lc| (- (QREFELT % 9) 1)) (CONS 1 "failed"))
                            (#7#
                             (SEQ
                              (LETT |c|
                                    (SPADCALL
                                     (PROG1 (LETT #6# (+ |lc| 1))
                                       (|check_subtype2| (> #6# 0)
                                                         '(|PositiveInteger|)
                                                         '(|NonNegativeInteger|)
                                                         #6#))
                                     (QREFELT % 16)))
                              (EXIT (CONS 0 (LIST |xn| (CONS 0 |c|))))))))))
                    (#7#
                     (SEQ
                      (LETT |w|
                            (PROG1 (LETT #5# (- (LENGTH |f_rep|) 1))
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#)))
                      (COND
                       ((SPADCALL |c0| (|spadConstant| % 13) (QREFELT % 60))
                        (LETT |w| (+ |w| 1))))
                      (LETT |good_binomials| 'T)
                      (COND
                       ((> |n| 1)
                        (COND
                         ((EQL |w| 1)
                          (SEQ
                           (LETT |facs|
                                 (SPADCALL (SPADCALL |n| (QREFELT % 72))
                                           (QREFELT % 95)))
                           (LETT |good_binomials| (ODDP (QREFELT % 11)))
                           (SEQ (LETT |fac| NIL) (LETT #4# |facs|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |fac| (CAR #4#)) NIL)
                                      (NULL |good_binomials|))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((EQL (QCAR |fac|) 2)
                                     (COND
                                      ((> (QCDR |fac|) 1)
                                       (EXIT
                                        (COND
                                         ((SPADCALL (REM (- (QREFELT % 9) 1) 4)
                                                    0 (QREFELT % 96))
                                          (PROGN
                                           (LETT #3#
                                                 (LETT |good_binomials| NIL))
                                           (GO #8=#:G383)))))))))
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (REM (- (QREFELT % 9) 1) (QCAR |fac|)) 0
                                       (QREFELT % 96))
                                      (LETT |good_binomials| NIL))))))
                                 #8# (EXIT #3#))
                                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND ((NULL |good_binomials|) (LETT |w| 2)))))))))
                      (LETT |exp_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                      (LETT |ind_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                      (LETT |coeff_v|
                            (MAKEARR1 (+ |n| 1) (|spadConstant| % 13)))
                      (SEQ (LETT |i| 0) (LETT |term| NIL) (LETT #1# |f_rep|)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |term| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (QSETAREF1 |exp_v| (- |w| |i|) (QCAR |term|))
                                (LETT |ci| (QCDR |term|))
                                (QSETAREF1 |coeff_v| (- |w| |i|) |ci|)
                                (EXIT
                                 (QSETAREF1 |ind_v| (- |w| |i|)
                                            (SPADCALL |ci| (QREFELT % 88)))))
                           (LETT #1#
                                 (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       ((NULL |good_binomials|)
                        (SEQ (QSETAREF1 |exp_v| 1 1)
                             (QSETAREF1 |coeff_v| 1 (QREFELT % 17))
                             (EXIT (QSETAREF1 |ind_v| 1 1)))))
                      (EXIT
                       (|FFPOLY;do_weights| |exp_v| |ind_v| |coeff_v| 0 |w| |w|
                        (ELT % 80) %))))))))))))) 

(SDEFUN |FFPOLY;get_next_GF_generator|
        ((|l| (|NonNegativeInteger|)) (|m1_to_n| (GF))
         (%
          (|Union| (|Record| (|:| |nl| (|PositiveInteger|)) (|:| |nc| GF))
                   "failed")))
        (SPROG
         ((|l1| (|PositiveInteger|)) (#1=#:G411 NIL) (|c| (GF))
          (#2=#:G405 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l1|
                  (PROG1 (LETT #2# |l|)
                    (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                      '(|NonNegativeInteger|) #2#)))
            (SEQ G190 (COND ((NULL (< |l1| (QREFELT % 9))) (GO G191)))
                 (SEQ (LETT |c| (SPADCALL |l1| (QREFELT % 16)))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |m1_to_n| |c| (QREFELT % 101))
                                   (QREFELT % 102))
                         (PROGN
                          (LETT #1# (CONS 0 (CONS |l1| |c|)))
                          (GO #3=#:G410)))
                        ('T (LETT |l1| (+ |l1| 1))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |FFPOLY;nextPrimitivePoly;SupU;23|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((#1=#:G436 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| GF) "failed"))
          (|w| (|NonNegativeInteger|)) (|c| (GF)) (|lc| (|NonNegativeInteger|))
          (|lcr| (|Record| (|:| |nl| (|PositiveInteger|)) (|:| |nc| GF)))
          (|lcu|
           (|Union| (|Record| (|:| |nl| (|PositiveInteger|)) (|:| |nc| GF))
                    "failed"))
          (|m1_to_n| (GF)) (|ci| (GF)) (#2=#:G437 NIL) (|term| NIL) (|i| NIL)
          (|coeff_v| (|PrimitiveArray| GF))
          (|ind_v| #3=(|PrimitiveArray| (|NonNegativeInteger|))) (|exp_v| #3#)
          (#4=#:G421 NIL) (|c0| (GF))
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|f_rep|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  (#5='T
                   (SEQ
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT % 38)))
                                (|spadConstant| % 14) (QREFELT % 44))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT % 45)) |f|
                                      (QREFELT % 39)))))
                    (LETT |f_rep| |f|) (LETT |xn| (|SPADfirst| |f_rep|))
                    (LETT |c0| (SPADCALL |f| 0 (QREFELT % 33)))
                    (LETT |lc| (SPADCALL |c0| (QREFELT % 88)))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ
                        (LETT |m1_to_n|
                              (SPADCALL (|spadConstant| % 14) (QREFELT % 34)))
                        (LETT |lcu|
                              (|FFPOLY;get_next_GF_generator| (+ |lc| 1)
                               |m1_to_n| %))
                        (EXIT
                         (COND ((QEQCAR |lcu| 1) (CONS 1 "failed"))
                               (#5#
                                (SEQ (LETT |c| (QCDR (QCDR |lcu|)))
                                     (EXIT
                                      (CONS 0 (LIST |xn| (CONS 0 |c|))))))))))
                      (#5#
                       (SEQ
                        (LETT |w|
                              (PROG1 (LETT #4# (- (LENGTH |f_rep|) 1))
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#)))
                        (COND
                         ((SPADCALL |c0| (|spadConstant| % 13) (QREFELT % 60))
                          (LETT |w| (+ |w| 1))))
                        (LETT |exp_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                        (LETT |ind_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                        (LETT |coeff_v|
                              (MAKEARR1 (+ |n| 1) (|spadConstant| % 13)))
                        (SEQ (LETT |i| 0) (LETT |term| NIL) (LETT #2# |f_rep|)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |term| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ (QSETAREF1 |exp_v| (- |w| |i|) (QCAR |term|))
                                  (LETT |ci| (QCDR |term|))
                                  (QSETAREF1 |coeff_v| (- |w| |i|) |ci|)
                                  (EXIT
                                   (QSETAREF1 |ind_v| (- |w| |i|)
                                              (SPADCALL |ci| (QREFELT % 88)))))
                             (LETT #2#
                                   (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |c| |c0|)
                        (LETT |m1_to_n|
                              (SPADCALL (EXPT -1 |n|) (QREFELT % 103)))
                        (COND
                         ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 60))
                          (LETT |lc| 1)))
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (LETT |lcu|
                                     (|FFPOLY;get_next_GF_generator| |lc|
                                      |m1_to_n| %))
                               (EXIT
                                (COND
                                 ((QEQCAR |lcu| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed"))
                                   (GO #6=#:G435)))
                                 ('T
                                  (SEQ (LETT |lcr| (QCDR |lcu|))
                                       (LETT |lc| (+ (QCAR |lcr|) 1))
                                       (QSETAREF1 |ind_v| 0 (QCAR |lcr|))
                                       (QSETAREF1 |coeff_v| 0
                                                  (LETT |c| (QCDR |lcr|)))
                                       (COND
                                        ((SPADCALL |c| |c0| (QREFELT % 60))
                                         (COND
                                          ((NULL (> |w| 1))
                                           (SEQ (LETT |w| 2)
                                                (QSETAREF1 |exp_v| 1 1)
                                                (QSETAREF1 |ind_v| 1 0)
                                                (QSETAREF1 |coeff_v| 1
                                                           (|spadConstant| %
                                                                           13))
                                                (QSETAREF1 |exp_v| |w| |n|)
                                                (QSETAREF1 |ind_v| |w| 1)
                                                (EXIT
                                                 (QSETAREF1 |coeff_v| |w|
                                                            (|spadConstant| %
                                                                            14)))))))
                                        ('T
                                         (SEQ (LETT |w| 2)
                                              (QSETAREF1 |exp_v| 1 1)
                                              (QSETAREF1 |ind_v| 1 0)
                                              (QSETAREF1 |coeff_v| 1
                                                         (|spadConstant| % 13))
                                              (QSETAREF1 |exp_v| |w| |n|)
                                              (QSETAREF1 |ind_v| |w| 1)
                                              (EXIT
                                               (QSETAREF1 |coeff_v| |w|
                                                          (|spadConstant| %
                                                                          14))))))
                                       (LETT |resu|
                                             (|FFPOLY;do_weights| |exp_v|
                                              |ind_v| |coeff_v| 1 |w| |w|
                                              (ELT % 81) %))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |resu| 0)
                                          (PROGN
                                           (LETT #1# (CONS 0 (QCDR |resu|)))
                                           (GO #6#))))))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |FFPOLY;nextNormalPoly;SupU;24|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((|a| (GF)) (#1=#:G462 NIL) (|la| (|NonNegativeInteger|))
          (#2=#:G470 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| GF) "failed"))
          (#3=#:G459 NIL) (|w| (|NonNegativeInteger|)) (|ci| (GF))
          (#4=#:G471 NIL) (|term| NIL) (|i| NIL)
          (|coeff_v| (|PrimitiveArray| GF))
          (|ind_v| #5=(|PrimitiveArray| (|NonNegativeInteger|))) (|exp_v| #5#)
          (#6=#:G452 NIL) (#7=#:G444 NIL)
          (|xn|
           (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF)))
          (|a0| (GF))
          (|f_rep|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n1| (|NonNegativeInteger|)) (#8=#:G438 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                (EXIT
                 (COND
                  ((EQL |n| 0)
                   (|error| "polynomial must have positive degree"))
                  (#9='T
                   (SEQ
                    (LETT |n1|
                          (PROG1 (LETT #8# (- |n| 1))
                            (|check_subtype2| (>= #8# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #8#)))
                    (COND
                     ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT % 38)))
                                (|spadConstant| % 14) (QREFELT % 44))
                      (LETT |f|
                            (SPADCALL (SPADCALL |lcf| (QREFELT % 45)) |f|
                                      (QREFELT % 39)))))
                    (LETT |f_rep| |f|)
                    (LETT |a0| (SPADCALL |f| |n1| (QREFELT % 33)))
                    (LETT |la|
                          (REM (SPADCALL |a0| (QREFELT % 88)) (QREFELT % 9)))
                    (EXIT
                     (COND
                      ((EQL |n| 1)
                       (SEQ (LETT |xn| (|SPADfirst| |f_rep|))
                            (EXIT
                             (COND
                              ((EQL |la| (- (QREFELT % 9) 1))
                               (CONS 1 "failed"))
                              (#9#
                               (CONS 0
                                     (LIST |xn|
                                           (CONS 0
                                                 (SPADCALL
                                                  (PROG1 (LETT #7# (+ |la| 1))
                                                    (|check_subtype2| (> #7# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #7#))
                                                  (QREFELT % 16))))))))))
                      (#9#
                       (SEQ (LETT |a| |a0|)
                            (COND
                             ((EQL |la| 0)
                              (SEQ (LETT |la| 1)
                                   (EXIT (LETT |a| (QREFELT % 17))))))
                            (LETT |w|
                                  (PROG1 (LETT #6# (- (LENGTH |f_rep|) 1))
                                    (|check_subtype2| (>= #6# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #6#)))
                            (COND
                             ((SPADCALL (SPADCALL |f| 0 (QREFELT % 33))
                                        (|spadConstant| % 13) (QREFELT % 60))
                              (LETT |w| (+ |w| 1))))
                            (LETT |exp_v|
                                  (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                            (LETT |ind_v|
                                  (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                            (LETT |coeff_v|
                                  (MAKEARR1 (+ |n| 1) (|spadConstant| % 13)))
                            (SEQ (LETT |i| 0) (LETT |term| NIL)
                                 (LETT #4# |f_rep|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |term| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (QSETAREF1 |exp_v| (- |w| |i|) (QCAR |term|))
                                  (LETT |ci| (QCDR |term|))
                                  (QSETAREF1 |coeff_v| (- |w| |i|) |ci|)
                                  (EXIT
                                   (QSETAREF1 |ind_v| (- |w| |i|)
                                              (SPADCALL |ci| (QREFELT % 88)))))
                                 (LETT #4#
                                       (PROG1 (CDR #4#)
                                         (LETT |i| (|inc_SI| |i|))))
                                 (GO G190) G191 (EXIT NIL))
                            (SEQ G190
                                 (COND
                                  ((NULL (< |la| (QREFELT % 9))) (GO G191)))
                                 (SEQ
                                  (COND
                                   ((NULL (SPADCALL |a| |a0| (QREFELT % 60)))
                                    (SEQ (LETT |w| 2) (QSETAREF1 |ind_v| 0 0)
                                         (QSETAREF1 |coeff_v| 0
                                                    (|spadConstant| % 13))
                                         (QSETAREF1 |exp_v| (- |w| 1) |n1|)
                                         (QSETAREF1 |ind_v| (- |w| 1) |la|)
                                         (QSETAREF1 |coeff_v| (- |w| 1) |a|)
                                         (QSETAREF1 |exp_v| |w| |n|)
                                         (QSETAREF1 |ind_v| |w| 1)
                                         (EXIT
                                          (QSETAREF1 |coeff_v| |w|
                                                     (|spadConstant| % 14))))))
                                  (LETT |resu|
                                        (|FFPOLY;do_weights| |exp_v| |ind_v|
                                         |coeff_v| 0
                                         (PROG1 (LETT #3# (- |w| 1))
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         |w| (ELT % 83) %))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |resu| 0)
                                     (PROGN
                                      (LETT #2# (CONS 0 (QCDR |resu|)))
                                      (GO #10=#:G469)))
                                    ('T
                                     (SEQ (LETT |la| (+ |la| 1))
                                          (EXIT
                                           (LETT |a|
                                                 (SPADCALL
                                                  (PROG1 (LETT #1# |la|)
                                                    (|check_subtype2| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #1#))
                                                  (QREFELT % 16)))))))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS 1 "failed"))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |FFPOLY;nextNormalPrimitivePoly;SupU;25|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPROG
         ((|lc| (|NonNegativeInteger|)) (|a| (GF))
          (|la| (|NonNegativeInteger|)) (#1=#:G494 NIL) (#2=#:G505 NIL)
          (|resu| (|Union| (|SparseUnivariatePolynomial| GF) "failed"))
          (#3=#:G491 NIL) (#4=#:G504 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF))
          (|w| (|NonNegativeInteger|)) (|first_pass| (|Boolean|)) (|c| (GF))
          (|lcr| (|Record| (|:| |nl| (|PositiveInteger|)) (|:| |nc| GF)))
          (|lcu|
           (|Union| (|Record| (|:| |nl| (|PositiveInteger|)) (|:| |nc| GF))
                    "failed"))
          (|ci| (GF)) (#5=#:G506 NIL) (|term| NIL) (|i| NIL)
          (|coeff_v| (|PrimitiveArray| GF))
          (|ind_v| #6=(|PrimitiveArray| (|NonNegativeInteger|))) (|exp_v| #6#)
          (#7=#:G481 NIL) (|m1_to_n| (GF)) (|a0| (GF)) (|c0| (GF))
          (|f_rep|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|lcf| (GF)) (|n1| (|NonNegativeInteger|)) (#8=#:G472 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |f| (QREFELT % 23)))
                (EXIT
                 (COND ((EQL |n| 1) (SPADCALL |f| (QREFELT % 104)))
                       ((EQL |n| 0)
                        (|error| "polynomial must have positive degree"))
                       ('T
                        (SEQ
                         (LETT |n1|
                               (PROG1 (LETT #8# (- |n| 1))
                                 (|check_subtype2| (>= #8# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #8#)))
                         (COND
                          ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT % 38)))
                                     (|spadConstant| % 14) (QREFELT % 44))
                           (LETT |f|
                                 (SPADCALL (SPADCALL |lcf| (QREFELT % 45)) |f|
                                           (QREFELT % 39)))))
                         (LETT |f_rep| |f|)
                         (LETT |c0| (SPADCALL |f| 0 (QREFELT % 33)))
                         (LETT |lc| (SPADCALL |c0| (QREFELT % 88)))
                         (LETT |a0| (SPADCALL |f| |n1| (QREFELT % 33)))
                         (LETT |la| (SPADCALL |a0| (QREFELT % 88)))
                         (LETT |c| |c0|) (LETT |a| |a0|)
                         (COND
                          ((SPADCALL |a| (|spadConstant| % 13) (QREFELT % 60))
                           (SEQ (LETT |la| 1)
                                (EXIT (LETT |a| (QREFELT % 17))))))
                         (LETT |m1_to_n|
                               (SPADCALL (EXPT -1 |n|) (QREFELT % 103)))
                         (LETT |w|
                               (PROG1 (LETT #7# (- (LENGTH |f_rep|) 1))
                                 (|check_subtype2| (>= #7# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #7#)))
                         (COND
                          ((SPADCALL |c| (|spadConstant| % 13) (QREFELT % 60))
                           (SEQ (LETT |lc| 1) (EXIT (LETT |w| (+ |w| 1))))))
                         (LETT |exp_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                         (LETT |ind_v| (SPADCALL (+ |n| 1) 0 (QREFELT % 98)))
                         (LETT |coeff_v|
                               (MAKEARR1 (+ |n| 1) (|spadConstant| % 13)))
                         (SEQ (LETT |i| 0) (LETT |term| NIL) (LETT #5# |f_rep|)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |term| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (QSETAREF1 |exp_v| (- |w| |i|) (QCAR |term|))
                               (LETT |ci| (QCDR |term|))
                               (QSETAREF1 |coeff_v| (- |w| |i|) |ci|)
                               (EXIT
                                (QSETAREF1 |ind_v| (- |w| |i|)
                                           (SPADCALL |ci| (QREFELT % 88)))))
                              (LETT #5#
                                    (PROG1 (CDR #5#)
                                      (LETT |i| (|inc_SI| |i|))))
                              (GO G190) G191 (EXIT NIL))
                         (LETT |first_pass| 'T)
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (LETT |lcu|
                                      (|FFPOLY;get_next_GF_generator| |lc|
                                       |m1_to_n| %))
                                (EXIT
                                 (COND
                                  ((QEQCAR |lcu| 1)
                                   (PROGN
                                    (LETT #2# (CONS 1 "failed"))
                                    (GO #9=#:G503)))
                                  ('T
                                   (SEQ (LETT |lcr| (QCDR |lcu|))
                                        (LETT |lc| (QCAR |lcr|))
                                        (LETT |c| (QCDR |lcr|))
                                        (SEQ G190
                                             (COND
                                              ((NULL (< |la| (QREFELT % 9)))
                                               (GO G191)))
                                             (SEQ
                                              (COND
                                               ((SPADCALL |a| |a0|
                                                          (QREFELT % 60))
                                                (COND
                                                 ((NULL
                                                   (SPADCALL |c| |c0|
                                                             (QREFELT % 60)))
                                                  (SEQ (LETT |first_pass| NIL)
                                                       (LETT |w| 2)
                                                       (QSETAREF1 |ind_v| 0
                                                                  |lc|)
                                                       (QSETAREF1 |coeff_v| 0
                                                                  |c|)
                                                       (QSETAREF1 |exp_v|
                                                                  (- |w| 1)
                                                                  |n1|)
                                                       (QSETAREF1 |ind_v|
                                                                  (- |w| 1)
                                                                  |la|)
                                                       (QSETAREF1 |coeff_v|
                                                                  (- |w| 1)
                                                                  |a|)
                                                       (QSETAREF1 |exp_v| |w|
                                                                  |n|)
                                                       (QSETAREF1 |ind_v| |w|
                                                                  1)
                                                       (EXIT
                                                        (QSETAREF1 |coeff_v|
                                                                   |w|
                                                                   (|spadConstant|
                                                                    % 14)))))))
                                               ('T
                                                (SEQ (LETT |first_pass| NIL)
                                                     (LETT |w| 2)
                                                     (QSETAREF1 |ind_v| 0 |lc|)
                                                     (QSETAREF1 |coeff_v| 0
                                                                |c|)
                                                     (QSETAREF1 |exp_v|
                                                                (- |w| 1) |n1|)
                                                     (QSETAREF1 |ind_v|
                                                                (- |w| 1) |la|)
                                                     (QSETAREF1 |coeff_v|
                                                                (- |w| 1) |a|)
                                                     (QSETAREF1 |exp_v| |w|
                                                                |n|)
                                                     (QSETAREF1 |ind_v| |w| 1)
                                                     (EXIT
                                                      (QSETAREF1 |coeff_v| |w|
                                                                 (|spadConstant|
                                                                  % 14))))))
                                              (COND
                                               ((EQL |w| 2)
                                                (COND
                                                 ((NULL |first_pass|)
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ
                                                     (LETT |pol|
                                                           (|FFPOLY;vecs_to_pol|
                                                            |exp_v| |coeff_v|
                                                            |w| %))
                                                     (EXIT
                                                      (COND
                                                       ((|FFPOLY;normal_and_primitive?|
                                                         |pol| %)
                                                        (PROGN
                                                         (LETT #4#
                                                               (PROGN
                                                                (LETT #2#
                                                                      (CONS 0
                                                                            |pol|))
                                                                (GO #9#)))
                                                         (GO #10=#:G490)))))))
                                                   #10# (EXIT #4#))))))
                                              (LETT |resu|
                                                    (|FFPOLY;do_weights|
                                                     |exp_v| |ind_v| |coeff_v|
                                                     1
                                                     (PROG1
                                                         (LETT #3# (- |w| 1))
                                                       (|check_subtype2|
                                                        (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                                     |w|
                                                     (CONS
                                                      (|function|
                                                       |FFPOLY;normal_and_primitive?|)
                                                      %)
                                                     %))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |resu| 0)
                                                 (PROGN
                                                  (LETT #2#
                                                        (CONS 0 (QCDR |resu|)))
                                                  (GO #9#)))
                                                ('T
                                                 (SEQ (LETT |la| (+ |la| 1))
                                                      (EXIT
                                                       (LETT |a|
                                                             (SPADCALL
                                                              (PROG1
                                                                  (LETT #1#
                                                                        |la|)
                                                                (|check_subtype2|
                                                                 (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                                              (QREFELT %
                                                                       16)))))))))
                                             NIL (GO G190) G191 (EXIT NIL))
                                        (LETT |la| 1)
                                        (LETT |a| (|spadConstant| % 14))
                                        (EXIT (LETT |lc| (+ |lc| 1))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |FFPOLY;nextPrimitiveNormalPoly;SupU;26|
        ((|f| (|SparseUnivariatePolynomial| GF))
         (% (|Union| (|SparseUnivariatePolynomial| GF) "failed")))
        (SPADCALL |f| (QREFELT % 106))) 

(SDEFUN |FFPOLY;createIrreduciblePoly;PiSup;27|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#1=#:G324 NIL) (|kg| (GF)) (#2=#:G511 NIL) (#3=#:G509 NIL)
          (|l| (|PositiveInteger|)) (|dg| (|PositiveInteger|))
          (|xn| #4=(|SparseUnivariatePolynomial| GF)) (|x| #4#))
         (SEQ (LETT |x| (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 25)))
              (EXIT
               (COND ((EQL |n| 1) |x|)
                     (#5='T
                      (SEQ
                       (LETT |xn|
                             (SPADCALL (|spadConstant| % 14) |n|
                                       (QREFELT % 25)))
                       (EXIT
                        (COND
                         ((>= |n| (QREFELT % 9))
                          (PROG2
                              (LETT #1#
                                    (SPADCALL
                                     (SPADCALL |xn| |x| (QREFELT % 40))
                                     (QREFELT % 100)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT % 6))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 6))
                                             #6="failed")
                                            #1#)))
                         (#5#
                          (SEQ (LETT |dg| (|FFPOLY;get_deg_GF| %))
                               (LETT |kg|
                                     (COND
                                      ((QREFELT % 20)
                                       (SEQ (LETT |l| (GCD |n| |dg|))
                                            (EXIT
                                             (COND
                                              ((> |l| 1)
                                               (SPADCALL
                                                (PROG1
                                                    (LETT #2#
                                                          (-
                                                           (EXPT (QREFELT % 11)
                                                                 (PROG2
                                                                     (LETT #3#
                                                                           (|exquo_INT|
                                                                            |dg|
                                                                            |l|))
                                                                     (QCDR #3#)
                                                                   (|check_union2|
                                                                    (QEQCAR #3#
                                                                            0)
                                                                    (|NonNegativeInteger|)
                                                                    (|Union|
                                                                     (|NonNegativeInteger|)
                                                                     "failed")
                                                                    #3#)))
                                                           1))
                                                  (|check_subtype2| (> #2# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (QREFELT % 16)))
                                              ((ODDP |n|)
                                               (|spadConstant| % 14))
                                              (#5# (|spadConstant| % 13))))))
                                      (#5# (|spadConstant| % 13))))
                               (EXIT
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL
                                           (SPADCALL |xn|
                                                     (SPADCALL |kg|
                                                               (QREFELT % 35))
                                                     (QREFELT % 40))
                                           (QREFELT % 100)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 6))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 6))
                                                   #6#)
                                                  #1#)))))))))))))) 

(SDEFUN |FFPOLY;createPrimitivePoly;PiSup;28|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#1=#:G324 NIL) (|weight| (|NonNegativeInteger|))
          (|s| (|List| (|NonNegativeInteger|)))
          (|s1| (|List| (|NonNegativeInteger|))) (#2=#:G526 NIL)
          (|notReady| (|Boolean|)) (#3=#:G534 NIL)
          (|pol| (|SparseUnivariatePolynomial| GF))
          (|polRepr|
           (|List|
            #4=(|Record| (|:| |expnt| (|NonNegativeInteger|))
                         (|:| |coeff| GF))))
          (|n1| (|NonNegativeInteger|)) (#5=#:G519 NIL) (|constterm| #4#)
          (|c0| (GF)) (|xn| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (EXIT
           (SEQ (LETT |xn| (SPADCALL (|spadConstant| % 14) |n| (QREFELT % 25)))
                (EXIT
                 (COND
                  ((EQL |n| 1)
                   (SPADCALL |xn|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QREFELT % 109))
                                        (QREFELT % 34))
                              0 (QREFELT % 25))
                             (QREFELT % 40)))
                  ('T
                   (SEQ
                    (LETT |c0|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 14) (QREFELT % 34)) |n|
                            (QREFELT % 110))
                           (SPADCALL (QREFELT % 109)) (QREFELT % 101)))
                    (LETT |constterm| (CONS 0 |c0|)) (LETT |s| (LIST 0 1))
                    (LETT |weight| 2) (LETT |s1| (LIST 1))
                    (LETT |n1|
                          (PROG1 (LETT #5# (- |n| 1))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (LETT |notReady| 'T)
                    (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                         (SEQ (LETT |polRepr| (LIST |constterm|))
                              (SEQ G190
                                   (COND ((NULL (NULL (NULL |s1|))) (GO G191)))
                                   (SEQ
                                    (LETT |polRepr|
                                          (CONS
                                           (CONS (|SPADfirst| |s1|)
                                                 (|spadConstant| % 14))
                                           |polRepr|))
                                    (EXIT (LETT |s1| (CDR |s1|))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |polRepr|
                                    (CONS (CONS |n| (|spadConstant| % 14))
                                          |polRepr|))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |pol| (|FFPOLY;listToSUP| |polRepr| %))
                                  (QREFELT % 81))
                                 (PROGN (LETT #3# |pol|) (GO #6=#:G533)))
                                ((EQL |weight| |n|) (LETT |notReady| NIL))
                                ('T
                                 (SEQ
                                  (LETT |s1|
                                        (PROG2
                                            (LETT #2#
                                                  (|FFPOLY;nextSubset|
                                                   (CDR |s|) |n1| %))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (|List|
                                                           (|NonNegativeInteger|))
                                                          (|Union|
                                                           (|List|
                                                            (|NonNegativeInteger|))
                                                           "failed")
                                                          #2#)))
                                  (LETT |s| (CONS 0 |s1|))
                                  (EXIT
                                   (LETT |weight|
                                         (SPADCALL |s| (QREFELT % 85)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROG2
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL |xn| (SPADCALL |c0| 0 (QREFELT % 25))
                                          (QREFELT % 40))
                                (QREFELT % 104)))
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 6))
                                       (|Union|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT % 6))
                                        "failed")
                                       #1#)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |FFPOLY;createNormalPoly;PiSup;29|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG ((#1=#:G324 NIL) (#2=#:G536 NIL))
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 25))
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 14) (QREFELT % 34)) 0
                            (QREFELT % 25))
                           (QREFELT % 40)))
                ('T
                 (PROG2
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 14) |n|
                                       (QREFELT % 25))
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 14) (QREFELT % 34))
                              (PROG1 (LETT #2# (- |n| 1))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT % 25))
                             (QREFELT % 40))
                            (QREFELT % 105)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT % 6))
                                   (|Union|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT % 6))
                                    "failed")
                                   #1#)))))) 

(SDEFUN |FFPOLY;createNormalPrimitivePoly;PiSup;30|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#1=#:G324 NIL) (|pol| (|SparseUnivariatePolynomial| GF))
          (|res| (|Union| (|SparseUnivariatePolynomial| GF) "failed"))
          (|constterm| #2=(|SparseUnivariatePolynomial| GF)) (|c0| (GF))
          (|n1| (|NonNegativeInteger|)) (#3=#:G538 NIL) (|xn| #2#))
         (SEQ (LETT |xn| (SPADCALL (|spadConstant| % 14) |n| (QREFELT % 25)))
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SPADCALL |xn|
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT % 109))
                                      (QREFELT % 34))
                            0 (QREFELT % 25))
                           (QREFELT % 40)))
                (#4='T
                 (SEQ
                  (LETT |n1|
                        (PROG1 (LETT #3# (- |n| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                  (LETT |c0|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 14) (QREFELT % 34)) |n|
                          (QREFELT % 110))
                         (SPADCALL (QREFELT % 109)) (QREFELT % 101)))
                  (LETT |constterm| (SPADCALL |c0| 0 (QREFELT % 25)))
                  (LETT |pol|
                        (SPADCALL
                         (SPADCALL |xn|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 14)
                                              (QREFELT % 34))
                                    |n1| (QREFELT % 25))
                                   (QREFELT % 40))
                         |constterm| (QREFELT % 40)))
                  (COND
                   ((SPADCALL |pol| (QREFELT % 83))
                    (COND ((SPADCALL |pol| (QREFELT % 81)) (EXIT |pol|)))))
                  (LETT |res| (SPADCALL |pol| (QREFELT % 106)))
                  (EXIT
                   (COND ((QEQCAR |res| 0) (QCDR |res|))
                         (#4#
                          (SEQ
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              "weird, can not find normal and primitive"
                              "poly with a{n-1} = -1" (QREFELT % 114))
                             (QREFELT % 116))
                            (QREFELT % 118))
                           (LETT |pol|
                                 (SPADCALL
                                  (SPADCALL |xn|
                                            (SPADCALL (|spadConstant| % 14)
                                                      |n1| (QREFELT % 25))
                                            (QREFELT % 40))
                                  |constterm| (QREFELT % 40)))
                           (COND
                            ((SPADCALL |pol| (QREFELT % 83))
                             (COND
                              ((SPADCALL |pol| (QREFELT % 81)) (EXIT |pol|)))))
                           (EXIT
                            (PROG2 (LETT #1# (SPADCALL |pol| (QREFELT % 106)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 6))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT % 6))
                                               "failed")
                                              #1#)))))))))))))) 

(SDEFUN |FFPOLY;createPrimitiveNormalPoly;PiSup;31|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPADCALL |n| (QREFELT % 119))) 

(SDEFUN |FFPOLY;random;PiSup;32|
        ((|n| (|PositiveInteger|)) (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((|polRepr|
           (|List|
            (|Record| (|:| |expnt| (|NonNegativeInteger|)) (|:| |coeff| GF))))
          (|c| (GF)) (#1=#:G555 NIL) (|i| NIL) (|n1| (|NonNegativeInteger|))
          (#2=#:G549 NIL))
         (SEQ (LETT |polRepr| NIL)
              (LETT |n1|
                    (PROG1 (LETT #2# (- |n| 1))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (SEQ (LETT |i| 0) (LETT #1# |n1|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LETT |c| (SPADCALL (QREFELT % 121)))
                                 (|spadConstant| % 13) (QREFELT % 44))
                       (LETT |polRepr| (CONS (CONS |i| |c|) |polRepr|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (CONS |n| (|spadConstant| % 14)) |polRepr|))))) 

(SDEFUN |FFPOLY;random;2PiSup;33|
        ((|m| #1=(|PositiveInteger|)) (|n| #2=(|PositiveInteger|))
         (% (|SparseUnivariatePolynomial| GF)))
        (SPROG
         ((#3=#:G557 NIL) (|d| (|NonNegativeInteger|)) (#4=#:G556 NIL)
          (|#G88| #1#) (|#G87| #2#))
         (SEQ
          (COND
           ((> |m| |n|)
            (PROGN
             (LETT |#G87| |n|)
             (LETT |#G88| |m|)
             (LETT |m| |#G87|)
             (LETT |n| |#G88|))))
          (LETT |d|
                (PROG1 (LETT #4# (- |n| |m|))
                  (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #4#)))
          (COND
           ((> |d| 1)
            (LETT |n|
                  (PROG1 (LETT #3# (+ (RANDOM |d|) |m|))
                    (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                      '(|Integer|) #3#)))))
          (EXIT (SPADCALL |n| (QREFELT % 122)))))) 

(DECLAIM (NOTINLINE |FiniteFieldPolynomialPackage;|)) 

(DEFUN |FiniteFieldPolynomialPackage;| (|#1|)
  (SPROG
   ((#1=#:G43 NIL) (#2=#:G42 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|FiniteFieldPolynomialPackage| DV$1))
    (LETT % (GETREFV 124))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|FiniteFieldPolynomialPackage| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9
              (PROG1 (LETT #2# (SPADCALL (QREFELT % 8)))
                (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                  '(|NonNegativeInteger|) #2#)))
    (QSETREFV % 11
              (PROG1 (LETT #1# (SPADCALL (QREFELT % 10)))
                (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                  '(|NonNegativeInteger|) #1#)))
    (QSETREFV % 12 0)
    (QSETREFV % 17 (SPADCALL 1 (QREFELT % 16)))
    (QSETREFV % 20
              (COND ((QEQCAR (SPADCALL (QREFELT % 19)) 1) 'T)
                    ('T (QEQCAR (SPADCALL (QREFELT % 19)) 0))))
    (QSETREFV % 21 (|ModMonic| |#1| (|SparseUnivariatePolynomial| |#1|)))
    %))) 

(DEFUN |FiniteFieldPolynomialPackage| (#1=#:G560)
  (SPROG NIL
         (PROG (#2=#:G561)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldPolynomialPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteFieldPolynomialPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldPolynomialPackage|)))))))))) 

(MAKEPROP '|FiniteFieldPolynomialPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |size|) '|sizeGF| (4 . |characteristic|) '|char_GF|
              '|deg_GF| (8 . |Zero|) (12 . |One|) (|PositiveInteger|)
              (16 . |index|) '|elem1|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (21 . |representationType|) '|poly_or_prime_rep| 'MM
              (|SparseUnivariatePolynomial| 6) (25 . |degree|) (30 . |setPoly|)
              (35 . |monomial|) (41 . |reduce|) (46 . ^) (52 . |One|)
              (56 . |Zero|) (60 . |One|) (64 . *) (70 . |lift|)
              (75 . |coefficient|) (81 . -) (86 . |coerce|) (|Boolean|)
              (91 . ~=) (97 . |leadingCoefficient|) (102 . *) (108 . +)
              (114 . |reductum|) (|PrimitiveArray| 22)
              |FFPOLY;reducedQPowers;SupPa;3| (119 . ~=) (125 . |inv|)
              (|Vector| 6) (130 . |vectorise|) (|List| 6) (136 . |entries|)
              (|List| 48) (|Matrix| 6) (141 . |matrix|) (146 . |transpose|)
              (|Integer|) (151 . |setelt!|) (159 . |horizConcat|) (|List| 46)
              (165 . |nullSpace|) (170 . |elt|) (176 . =)
              |FFPOLY;leastAffineMultiple;2Sup;4|
              (|IntegerNumberTheoryFunctions|) (182 . |moebiusMu|) (|List| 54)
              (187 . |divisors|) |FFPOLY;numberOfIrreduciblePoly;2Pi;5|
              (192 . |eulerPhi|) |FFPOLY;numberOfPrimitivePoly;2Pi;6|
              (197 . ~=) |FFPOLY;numberOfNormalPoly;2Pi;7| (|Factored| %)
              (203 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 73) (|:| |factor| 54) (|:| |exponent| 7))
              (|List| 74) (|Factored| 54) (208 . |factorList|) (213 . =)
              (|UnivariateFiniteFieldFactorize| 6 22) (219 . |irreducible?|)
              |FFPOLY;primitive?;SupB;9| (224 . |rank|)
              |FFPOLY;normal?;SupB;10| (|List| 7) (229 . |#|)
              (234 . |setfirst!|) (240 . |numberOfMonomials|) (245 . |lookup|)
              |FFPOLY;lexSmaller?;2SupB;13| |FFPOLY;clexSmaller?;2SupB;15|
              |FFPOLY;nlexSmaller?;2SupB;16| |FFPOLY;cnlexSmaller?;2SupB;17|
              (|Record| (|:| |factor| 54) (|:| |exponent| 7)) (|List| 93)
              (250 . |factors|) (255 . ~=) (|PrimitiveArray| 7) (261 . |new|)
              (|Union| 22 '#1="failed") |FFPOLY;nextIrreduciblePoly;SupU;21|
              (267 . *) (273 . |primitive?|) (278 . |coerce|)
              |FFPOLY;nextPrimitivePoly;SupU;23|
              |FFPOLY;nextNormalPoly;SupU;24|
              |FFPOLY;nextNormalPrimitivePoly;SupU;25|
              |FFPOLY;nextPrimitiveNormalPoly;SupU;26|
              |FFPOLY;createIrreduciblePoly;PiSup;27|
              (283 . |primitiveElement|) (287 . ^)
              |FFPOLY;createPrimitivePoly;PiSup;28|
              |FFPOLY;createNormalPoly;PiSup;29| (|String|) (293 . |elt|)
              (|OutputForm|) (299 . |message|) (|Void|) (304 . |print|)
              |FFPOLY;createNormalPrimitivePoly;PiSup;30|
              |FFPOLY;createPrimitiveNormalPoly;PiSup;31| (309 . |random|)
              |FFPOLY;random;PiSup;32| |FFPOLY;random;2PiSup;33|)
           '#(|reducedQPowers| 313 |random| 318 |primitive?| 329
              |numberOfPrimitivePoly| 334 |numberOfNormalPoly| 339
              |numberOfIrreduciblePoly| 344 |normal?| 349 |nlexSmaller?| 354
              |nextPrimitivePoly| 360 |nextPrimitiveNormalPoly| 365
              |nextNormalPrimitivePoly| 370 |nextNormalPoly| 375
              |nextIrreduciblePoly| 380 |lexSmaller?| 385 |leastAffineMultiple|
              391 |createPrimitivePoly| 396 |createPrimitiveNormalPoly| 401
              |createNormalPrimitivePoly| 406 |createNormalPoly| 411
              |createIrreduciblePoly| 416 |cnlexSmaller?| 421 |clexSmaller?|
              427)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|primitive?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|normal?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|numberOfIrreduciblePoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfPrimitivePoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfNormalPoly|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|createIrreduciblePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createPrimitivePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createNormalPoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createNormalPrimitivePoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|createPrimitiveNormalPoly|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|lexSmaller?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|clexSmaller?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nlexSmaller?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|cnlexSmaller?|
                                 ((|Boolean|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextIrreduciblePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           #1#)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextPrimitivePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextNormalPoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextNormalPrimitivePoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|nextPrimitiveNormalPoly|
                                 ((|Union| (|SparseUnivariatePolynomial| |#1|)
                                           "failed")
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|random|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|)))
                                T)
                              '((|random|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|leastAffineMultiple|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|reducedQPowers|
                                 ((|PrimitiveArray|
                                   (|SparseUnivariatePolynomial| |#1|))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 123
                                            '(0 6 7 8 0 6 7 10 0 6 0 13 0 6 0
                                              14 1 6 0 15 16 0 6 18 19 1 22 7 0
                                              23 1 21 22 22 24 2 22 0 6 7 25 1
                                              21 0 22 26 2 21 0 0 7 27 0 21 0
                                              28 0 22 0 29 0 22 0 30 2 21 0 0 0
                                              31 1 21 22 0 32 2 22 6 0 7 33 1 6
                                              0 0 34 1 22 0 6 35 2 22 36 0 0 37
                                              1 22 6 0 38 2 22 0 6 0 39 2 22 0
                                              0 0 40 1 22 0 0 41 2 6 36 0 0 44
                                              1 6 0 0 45 2 22 46 0 7 47 1 46 48
                                              0 49 1 51 0 50 52 1 51 0 0 53 4
                                              51 6 0 54 54 6 55 2 51 0 0 0 56 1
                                              51 57 0 58 2 46 6 0 54 59 2 6 36
                                              0 0 60 1 62 54 54 63 1 62 64 54
                                              65 1 62 54 54 67 2 7 36 0 0 69 1
                                              54 71 0 72 1 76 75 0 77 2 22 36 0
                                              0 78 1 79 36 22 80 1 51 7 0 82 1
                                              84 7 0 85 2 84 7 0 7 86 1 22 7 0
                                              87 1 6 15 0 88 1 76 94 0 95 2 54
                                              36 0 0 96 2 97 0 7 7 98 2 6 0 0 0
                                              101 1 6 36 0 102 1 6 0 54 103 0 6
                                              0 109 2 6 0 0 15 110 2 113 0 0 0
                                              114 1 115 0 113 116 1 115 117 0
                                              118 0 6 0 121 1 0 42 22 43 2 0 22
                                              15 15 123 1 0 22 15 122 1 0 36 22
                                              81 1 0 15 15 68 1 0 15 15 70 1 0
                                              15 15 66 1 0 36 22 83 2 0 36 22
                                              22 91 1 0 99 22 104 1 0 99 22 107
                                              1 0 99 22 106 1 0 99 22 105 1 0
                                              99 22 100 2 0 36 22 22 89 1 0 22
                                              22 61 1 0 22 15 111 1 0 22 15 120
                                              1 0 22 15 119 1 0 22 15 112 1 0
                                              22 15 108 2 0 36 22 22 92 2 0 36
                                              22 22 90)))))
           '|lookupComplete|)) 
