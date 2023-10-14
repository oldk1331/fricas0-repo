
(DEFUN |FFPOLY;revListToSUP| (|l| $)
  (PROG (|newl| #1=#:G165 |t|)
    (RETURN
     (SEQ (LETT |newl| NIL . #2=(|FFPOLY;revListToSUP|))
          (SEQ (LETT |t| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |newl| (CONS (CONS (CAR |t|) (CDR |t|)) |newl|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |newl|))))) 

(DEFUN |FFPOLY;listToSUP| (|l| $)
  (PROG (|newl| #1=#:G171 |t| #2=#:G170)
    (RETURN
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
                    (LETT #2# (CONS (CONS (CAR |t|) (CDR |t|)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT |newl|))))) 

(DEFUN |FFPOLY;reducedQPowers;SupPa;3| (|f| $)
  (PROG (|h| |g| |i| |qexp| |w| |qpow| |e| |m1| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |f| (QREFELT $ 12))
            . #1=(|FFPOLY;reducedQPowers;SupPa;3|))
      (LETT |m1| (- |m| 1) . #1#) (SPADCALL |f| (QREFELT $ 15))
      (LETT |e|
            (SPADCALL
             (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                       (QREFELT $ 17))
             (QREFELT $ 10) (QREFELT $ 18))
            . #1#)
      (LETT |w| (|spadConstant| $ 14) . #1#)
      (LETT |qpow| (MAKEARR1 |m| (|spadConstant| $ 21)) . #1#)
      (QSETAREF1 |qpow| 0 (|spadConstant| $ 22))
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m1|) (GO G191)))
           (SEQ
            (EXIT
             (QSETAREF1 |qpow| |i|
                        (SPADCALL
                         (LETT |w| (SPADCALL |w| |e| (QREFELT $ 23)) . #1#)
                         (QREFELT $ 24)))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (LETT |qexp| (MAKEARR1 |m| (|spadConstant| $ 21)) . #1#)
      (EXIT
       (COND
        ((EQL |m| 1)
         (SEQ
          (QSETAREF1 |qexp| 0
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25)) (QREFELT $ 26))
                      (QREFELT $ 27)))
          (EXIT |qexp|)))
        ('T
         (SEQ
          (QSETAREF1 |qexp| 0
                     (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16)))
          (LETT |h| (QAREF1 |qpow| 1) . #1#) (QSETAREF1 |qexp| 1 |h|)
          (SEQ (LETT |i| 2 . #1#) G190
               (COND ((|greater_SI| |i| |m1|) (GO G191)))
               (SEQ (LETT |g| (|spadConstant| $ 21) . #1#)
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
                                                             (QREFELT $ 12)))
                                           (QREFELT $ 31))
                                          (QREFELT $ 32))
                                . #1#)
                          (EXIT
                           (LETT |h| (SPADCALL |h| (QREFELT $ 33)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (QSETAREF1 |qexp| |i| (LETT |h| |g| . #1#))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |qexp|))))))))) 

(DEFUN |FFPOLY;leastAffineMultiple;2Sup;4| (|f| $)
  (PROG (#1=#:G188 #2=#:G187 #3=#:G189 #4=#:G191 |k| |ns| |coeffVector| |dim|
         |i| |newCoeffVector| #5=#:G196 |col1| |b| #6=#:G195 #7=#:G194 |n|
         |qexp|)
    (RETURN
     (SEQ
      (LETT |qexp| (SPADCALL |f| (QREFELT $ 35))
            . #8=(|FFPOLY;leastAffineMultiple;2Sup;4|))
      (LETT |n| (SPADCALL |f| (QREFELT $ 12)) . #8#)
      (LETT |b|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #7# NIL . #8#)
               (SEQ (LETT |i| 0 . #8#) (LETT #6# (- |n| 1) . #8#) G190
                    (COND ((|greater_SI| |i| #6#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #7#
                            (CONS
                             (SPADCALL
                              (SPADCALL (QAREF1 |qexp| |i|) |n| (QREFELT $ 37))
                              (QREFELT $ 39))
                             #7#)
                            . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #7#))))
              (QREFELT $ 42))
             (QREFELT $ 43))
            . #8#)
      (LETT |col1| (MAKE_MATRIX1 |n| 1 (|spadConstant| $ 19)) . #8#)
      (SPADCALL |col1| 1 1 (|spadConstant| $ 13) (QREFELT $ 51))
      (LETT |ns| (SPADCALL (SPADCALL |col1| |b| (QREFELT $ 52)) (QREFELT $ 54))
            . #8#)
      (LETT |dim| (+ |n| 2) . #8#)
      (SEQ (LETT #5# NIL . #8#) G190 (COND (#5# (GO G191)))
           (SEQ (LETT |newCoeffVector| (SPADCALL |ns| 1 (QREFELT $ 55)) . #8#)
                (LETT |i| (+ |n| 1) . #8#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (SPADCALL |newCoeffVector| |i| (QREFELT $ 56))
                         (|spadConstant| $ 19) (QREFELT $ 57)))
                       (GO G191)))
                     (SEQ (EXIT (LETT |i| (- |i| 1) . #8#))) NIL (GO G190) G191
                     (EXIT NIL))
                (COND
                 ((< |i| |dim|)
                  (SEQ (LETT |dim| |i| . #8#)
                       (EXIT (LETT |coeffVector| |newCoeffVector| . #8#)))))
                (EXIT (LETT |ns| (CDR |ns|) . #8#)))
           (LETT #5# (NULL |ns|) . #8#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |coeffVector| 1 (QREFELT $ 56)) (QREFELT $ 27))
        (PROGN
         (LETT #1# NIL . #8#)
         (SEQ (LETT |k| 2 . #8#) G190
              (COND ((|greater_SI| |k| |dim|) (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (SPADCALL |coeffVector| |k| (QREFELT $ 56))
                                 (EXPT (QREFELT $ 10)
                                       (PROG1 (LETT #4# (- |k| 2) . #8#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#)))
                                 (QREFELT $ 16))
                       . #8#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 32)) . #8#))
                       ('T
                        (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
              (LETT |k| (|inc_SI| |k|) . #8#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) ('T (|spadConstant| $ 21))))
        (QREFELT $ 32))))))) 

(DEFUN |FFPOLY;numberOfIrreduciblePoly;2Pi;5| (|n| $)
  (PROG (#1=#:G199 |lastd| |sum| |qd| #2=#:G202 |d| |divisorsOfn|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) (QREFELT $ 10))
            ('T
             (SEQ
              (LETT |lastd| 1 . #3=(|FFPOLY;numberOfIrreduciblePoly;2Pi;5|))
              (LETT |qd| (QREFELT $ 10) . #3#)
              (LETT |sum| (* (SPADCALL |n| (QREFELT $ 60)) |qd|) . #3#)
              (LETT |divisorsOfn| (CDR (SPADCALL |n| (QREFELT $ 62))) . #3#)
              (SEQ (LETT |d| NIL . #3#) (LETT #2# |divisorsOfn| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |qd|
                          (* |qd|
                             (SPADCALL (QREFELT $ 10) (- |d| |lastd|)
                                       (QREFELT $ 64)))
                          . #3#)
                    (LETT |sum|
                          (+ |sum|
                             (* (SPADCALL (QUOTIENT2 |n| |d|) (QREFELT $ 60))
                                |qd|))
                          . #3#)
                    (EXIT (LETT |lastd| |d| . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (QUOTIENT2 |sum| |n|) . #3#)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))))))))) 

(DEFUN |FFPOLY;numberOfPrimitivePoly;2Pi;6| (|n| $)
  (PROG (#1=#:G203)
    (RETURN
     (PROG1
         (LETT #1#
               (QUOTIENT2
                (SPADCALL (- (SPADCALL (QREFELT $ 10) |n| (QREFELT $ 64)) 1)
                          (QREFELT $ 66))
                |n|)
               |FFPOLY;numberOfPrimitivePoly;2Pi;6|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |FFPOLY;numberOfNormalPoly;2Pi;7| (|n| $)
  (PROG (|prod| |qe| |e| #1=#:G435 |d| |divisorsOfm| #2=#:G427 #3=#:G426 |m|
         #4=#:G209 |q| |p| #5=#:G208 #6=#:G207 #7=#:G206)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 1)
        (PROG1
            (LETT #6#
                  (PROG1
                      (LETT #7# (- (QREFELT $ 10) 1)
                            . #8=(|FFPOLY;numberOfNormalPoly;2Pi;7|))
                    (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
                  . #8#)
          (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#)))
       (#9='T
        (SEQ (LETT |m| |n| . #8#)
             (LETT |p|
                   (PROG1 (LETT #5# (SPADCALL (QREFELT $ 68)) . #8#)
                     (|check_subtype| (> #5# 0) '(|PositiveInteger|) #5#))
                   . #8#)
             (LETT |q| (QREFELT $ 10) . #8#)
             (SEQ G190 (COND ((NULL (EQL (REM |m| |p|) 0)) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT |m|
                          (PROG1 (LETT #4# (QUOTIENT2 |m| |p|) . #8#)
                            (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                             #4#))
                          . #8#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND
               ((EQL |m| 1)
                (PROG1
                    (LETT #2#
                          (QUOTIENT2
                           (*
                            (EXPT |q|
                                  (PROG1 (LETT #3# (- |n| 1) . #8#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#)))
                            (- |q| 1))
                           |n|)
                          . #8#)
                  (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#)))
               (#9#
                (SEQ (LETT |prod| (- |q| 1) . #8#)
                     (LETT |divisorsOfm| (CDR (SPADCALL |m| (QREFELT $ 62)))
                           . #8#)
                     (SEQ (LETT |d| NIL . #8#) (LETT #1# |divisorsOfm| . #8#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |d| (CAR #1#) . #8#) NIL))
                            (GO G191)))
                          (SEQ (LETT |e| 1 . #8#) (LETT |qe| |q| . #8#)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (SPADCALL (REM |qe| |d|) 1
                                                 (QREFELT $ 69)))
                                      (GO G191)))
                                    (SEQ (LETT |e| (+ |e| 1) . #8#)
                                         (EXIT (LETT |qe| (* |qe| |q|) . #8#)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (LETT |prod|
                                      (* |prod|
                                         (EXPT (- |qe| 1)
                                               (QUOTIENT2
                                                (SPADCALL |d| (QREFELT $ 66))
                                                |e|)))
                                      . #8#)))
                          (LETT #1# (CDR #1#) . #8#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (QUOTIENT2 (* (EXPT |q| (- |n| |m|)) |prod|)
                                 |n|))))))))))))) 

(DEFUN |FFPOLY;primitive?;SupB;8| (|f| $)
  (PROG (#1=#:G444 #2=#:G450 |expt| #3=#:G452 |d| |lfact| #4=#:G440 #5=#:G451
         |rec| |lrec| |x| |qn1| #6=#:G438 #7=#:G437 |q| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |f| (QREFELT $ 12))
              . #8=(|FFPOLY;primitive?;SupB;8|))
        (EXIT
         (COND
          ((OR (EQL |n| 0)
               (OR
                (SPADCALL (SPADCALL |f| (QREFELT $ 30)) (|spadConstant| $ 13)
                          (QREFELT $ 71))
                (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25)) (|spadConstant| $ 19)
                          (QREFELT $ 57))))
           'NIL)
          ('T
           (SEQ (LETT |q| (QREFELT $ 10) . #8#)
                (LETT |qn1|
                      (PROG1
                          (LETT #6#
                                (PROG1 (LETT #7# (- (EXPT |q| |n|) 1) . #8#)
                                  (|check_subtype| (>= #7# 0)
                                                   '(|NonNegativeInteger|)
                                                   #7#))
                                . #8#)
                        (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
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
                    (SPADCALL (SPADCALL |x| |qn1| (QREFELT $ 72))
                              (QREFELT $ 24))
                    (|spadConstant| $ 22) (QREFELT $ 29))
                   'NIL)
                  ('T
                   (SEQ
                    (LETT |lrec|
                          (SPADCALL (SPADCALL |qn1| (QREFELT $ 74))
                                    (QREFELT $ 78))
                          . #8#)
                    (LETT |lfact| NIL . #8#)
                    (SEQ (LETT |rec| NIL . #8#) (LETT #5# |lrec| . #8#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |rec| (CAR #5#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |lfact|
                                 (CONS
                                  (PROG1 (LETT #4# (QCAR |rec|) . #8#)
                                    (|check_subtype| (> #4# 0)
                                                     '(|PositiveInteger|) #4#))
                                  |lfact|)
                                 . #8#)))
                         (LETT #5# (CDR #5#) . #8#) (GO G190) G191 (EXIT NIL))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |d| NIL . #8#) (LETT #3# |lfact| . #8#) G190
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
                                      (|spadConstant| $ 22) (QREFELT $ 79))
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# 'NIL . #8#)
                                             (GO #2#))
                                            . #8#)
                                      (GO #1#))))))))
                           (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                           (EXIT NIL)))
                     #1# (EXIT #1#))
                    (EXIT 'T)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |FFPOLY;normal?;SupB;9| (|f| $)
  (PROG (|l| #1=#:G463 #2=#:G455 |i| #3=#:G462 |g| |n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL |f| (QREFELT $ 12)) . #4=(|FFPOLY;normal?;SupB;9|))
      (EXIT
       (COND
        ((OR (EQL |n| 0)
             (OR
              (SPADCALL (SPADCALL |f| (QREFELT $ 30)) (|spadConstant| $ 13)
                        (QREFELT $ 71))
              (SPADCALL (SPADCALL |f| 0 (QREFELT $ 25)) (|spadConstant| $ 19)
                        (QREFELT $ 57))))
         'NIL)
        ((EQL |n| 1) 'T)
        (#5='T
         (COND ((NULL (SPADCALL |f| (QREFELT $ 82))) 'NIL)
               ('T
                (SEQ (LETT |g| (SPADCALL |f| (QREFELT $ 35)) . #4#)
                     (LETT |l|
                           (PROGN
                            (LETT #3# NIL . #4#)
                            (SEQ (LETT |i| 0 . #4#)
                                 (LETT #1#
                                       (PROG1 (LETT #2# (- |n| 1) . #4#)
                                         (|check_subtype| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          #2#))
                                       . #4#)
                                 G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
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
                                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           . #4#)
                     (EXIT
                      (COND
                       ((EQL
                         (SPADCALL (SPADCALL |l| (QREFELT $ 42))
                                   (QREFELT $ 83))
                         |n|)
                        'T)
                       (#5# 'NIL))))))))))))) 

(DEFUN |FFPOLY;nextSubset| (|s| |bound| $)
  (PROG (|j| #1=#:G477 |i| |firstOfs| |noGap| |firstOfsPlus1| |secondOfs|
         |restOfs| |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 86)) . #2=(|FFPOLY;nextSubset|))
            (EXIT
             (COND ((EQL |m| 0) (CONS 0 (LIST 1)))
                   (#3='T
                    (SEQ (LETT |noGap| 'T . #2#) (LETT |i| 0 . #2#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  (|noGap|
                                   (COND
                                    ((NULL (LETT |restOfs| (CDR |s|) . #2#))
                                     'NIL)
                                    ('T 'T)))
                                  ('T 'NIL)))
                                (GO G191)))
                              (SEQ
                               (LETT |secondOfs| (|SPADfirst| |restOfs|) . #2#)
                               (LETT |firstOfsPlus1| (+ (|SPADfirst| |s|) 1)
                                     . #2#)
                               (EXIT
                                (COND
                                 ((EQL |secondOfs| |firstOfsPlus1|)
                                  (SEQ (LETT |s| |restOfs| . #2#)
                                       (EXIT (LETT |i| (+ |i| 1) . #2#))))
                                 ('T
                                  (SEQ
                                   (SPADCALL |s| |firstOfsPlus1|
                                             (QREFELT $ 87))
                                   (EXIT (LETT |noGap| 'NIL . #2#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (COND
                          (|noGap|
                           (SEQ (LETT |firstOfs| (|SPADfirst| |s|) . #2#)
                                (EXIT
                                 (COND
                                  ((< |firstOfs| |bound|)
                                   (SPADCALL |s| (+ |firstOfs| 1)
                                             (QREFELT $ 87)))
                                  ((< |m| |bound|)
                                   (SEQ (SPADCALL |s| (+ |m| 1) (QREFELT $ 87))
                                        (EXIT (LETT |i| |m| . #2#))))
                                  (#3#
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #2#)
                                    (GO #1#))))))))
                         (SEQ (LETT |j| |i| . #2#) G190
                              (COND ((< |j| 1) (GO G191)))
                              (SEQ (EXIT (LETT |s| (CONS |j| |s|) . #2#)))
                              (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 |s|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FFPOLY;nextIrreduciblePoly;SupU;11| (|f| $)
  (PROG (|headpol| |s1| |tailpol| |headlookuplist| #1=#:G504 |taillookuplist|
         |weight| |s| #2=#:G502 #3=#:G516 #4=#:G518 |entry| |restfcopy| |pol|
         #5=#:G492 |j| |term| |n1| #6=#:G488 #7=#:G487 |fcopy| #8=#:G517
         |fRepr| |lcf| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |f| (QREFELT $ 12))
              . #9=(|FFPOLY;nextIrreduciblePoly;SupU;11|))
        (EXIT
         (COND ((EQL |n| 0) (|error| "polynomial must have positive degree"))
               ('T
                (SEQ
                 (COND
                  ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #9#)
                             (|spadConstant| $ 13) (QREFELT $ 71))
                   (LETT |f|
                         (SPADCALL (SPADCALL |lcf| (QREFELT $ 88)) |f|
                                   (QREFELT $ 31))
                         . #9#)))
                 (LETT |fRepr| |f| . #9#) (LETT |fcopy| NIL . #9#)
                 (SEQ (LETT |term| NIL . #9#) (LETT #8# |fRepr| . #9#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |term| (CAR #8#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |fcopy|
                              (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                              . #9#)))
                      (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((SPADCALL (QCAR |term|) 0 (QREFELT $ 69))
                   (LETT |fcopy| (CONS (CONS 0 (|spadConstant| $ 19)) |fcopy|)
                         . #9#)))
                 (LETT |tailpol| NIL . #9#) (LETT |headpol| |fcopy| . #9#)
                 (LETT |fcopy| (REVERSE |fcopy|) . #9#)
                 (LETT |weight|
                       (PROG1 (LETT #7# (- (LENGTH |fcopy|) 1) . #9#)
                         (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                          #7#))
                       . #9#)
                 (LETT |taillookuplist| NIL . #9#)
                 (LETT |headlookuplist| (SPADCALL |weight| 0 (QREFELT $ 89))
                       . #9#)
                 (LETT |s| NIL . #9#)
                 (LETT |n1|
                       (PROG1 (LETT #6# (- |n| 1) . #9#)
                         (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                          #6#))
                       . #9#)
                 (EXIT
                  (SEQ G190 NIL
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |headlookuplist|) 'NIL) ('T 'T)))
                               (GO G191)))
                             (SEQ (LETT |term| (|SPADfirst| |headpol|) . #9#)
                                  (LETT |j| (|SPADfirst| |headlookuplist|)
                                        . #9#)
                                  (COND
                                   ((EQL |j| 0)
                                    (LETT |j|
                                          (SPADCALL (QCDR |term|)
                                                    (QREFELT $ 90))
                                          . #9#)))
                                  (LETT |j| (+ |j| 1) . #9#)
                                  (EXIT
                                   (COND
                                    ((EQL (REM |j| (QREFELT $ 10)) 0)
                                     (SEQ
                                      (LETT |tailpol| (CONS |term| |tailpol|)
                                            . #9#)
                                      (LETT |headpol| (CDR |headpol|) . #9#)
                                      (LETT |taillookuplist|
                                            (CONS |j| |taillookuplist|) . #9#)
                                      (EXIT
                                       (LETT |headlookuplist|
                                             (CDR |headlookuplist|) . #9#))))
                                    ('T
                                     (SEQ
                                      (PROGN
                                       (RPLACD (|SPADfirst| |headpol|)
                                               (SPADCALL
                                                (PROG1 (LETT #5# |j| . #9#)
                                                  (|check_subtype| (> #5# 0)
                                                                   '(|PositiveInteger|)
                                                                   #5#))
                                                (QREFELT $ 91)))
                                       (QCDR (|SPADfirst| |headpol|)))
                                      (SPADCALL |headlookuplist| |j|
                                                (QREFELT $ 87))
                                      (EXIT
                                       (COND
                                        ((NULL |taillookuplist|)
                                         (SEQ
                                          (LETT |pol|
                                                (|FFPOLY;revListToSUP|
                                                 |headpol| $)
                                                . #9#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |pol| (QREFELT $ 82))
                                             (PROGN
                                              (LETT #3# (CONS 0 |pol|) . #9#)
                                              (GO #3#)))))))
                                        ('T
                                         (SEQ
                                          (LETT |headpol|
                                                (CONS (|SPADfirst| |tailpol|)
                                                      |headpol|)
                                                . #9#)
                                          (LETT |tailpol| (CDR |tailpol|)
                                                . #9#)
                                          (LETT |headlookuplist|
                                                (CONS
                                                 (|SPADfirst| |taillookuplist|)
                                                 |headlookuplist|)
                                                . #9#)
                                          (EXIT
                                           (LETT |taillookuplist|
                                                 (CDR |taillookuplist|)
                                                 . #9#)))))))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (COND
                         ((NULL |s|)
                          (SEQ (LETT |restfcopy| (CDR |fcopy|) . #9#)
                               (EXIT
                                (SEQ (LETT |entry| NIL . #9#)
                                     (LETT #4# |restfcopy| . #9#) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN
                                            (LETT |entry| (CAR #4#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |s| (CONS (QCAR |entry|) |s|)
                                             . #9#)))
                                     (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                                     (EXIT NIL))))))
                        (EXIT
                         (COND
                          ((EQL |weight| |n|)
                           (PROGN (LETT #3# (CONS 1 "failed") . #9#) (GO #3#)))
                          ('T
                           (SEQ
                            (LETT |s1|
                                  (PROG2
                                      (LETT #2#
                                            (|FFPOLY;nextSubset| (CDR |s|) |n1|
                                             $)
                                            . #9#)
                                      (QCDR #2#)
                                    (|check_union| (QEQCAR #2# 0)
                                                   (|List|
                                                    (|NonNegativeInteger|))
                                                   #2#))
                                  . #9#)
                            (LETT |s| (CONS 0 |s1|) . #9#)
                            (LETT |weight| (SPADCALL |s| (QREFELT $ 86)) . #9#)
                            (LETT |taillookuplist| NIL . #9#)
                            (LETT |headlookuplist|
                                  (CONS (QREFELT $ 10)
                                        (SPADCALL
                                         (PROG1 (LETT #1# (- |weight| 1) . #9#)
                                           (|check_subtype| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                         1 (QREFELT $ 89)))
                                  . #9#)
                            (LETT |tailpol| NIL . #9#)
                            (LETT |headpol| NIL . #9#)
                            (LETT |s1| (CONS |n| (REVERSE |s1|)) . #9#)
                            (SEQ G190
                                 (COND
                                  ((NULL (COND ((NULL |s1|) 'NIL) ('T 'T)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |headpol|
                                        (CONS
                                         (CONS (|SPADfirst| |s1|)
                                               (|spadConstant| $ 13))
                                         |headpol|)
                                        . #9#)
                                  (EXIT (LETT |s1| (CDR |s1|) . #9#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |headpol|
                                   (CONS (CONS 0 (|spadConstant| $ 19))
                                         |headpol|)
                                   . #9#)))))))
                       NIL (GO G190) G191 (EXIT NIL)))))))))
      #3# (EXIT #3#))))) 

(DEFUN |FFPOLY;nextPrimitivePoly;SupU;12| (|f| $)
  (PROG (|c| #1=#:G567 |l| |headpol| |s1| |tailpol| |headlookuplist| #2=#:G560
         |taillookuplist| |weight| |s| #3=#:G558 #4=#:G576 |entry| |restfcopy|
         |notReady| #5=#:G574 |pol| #6=#:G548 |j| |term| |constterm| #7=#:G538
         |noGenerator| |n1| #8=#:G536 #9=#:G535 #10=#:G530 #11=#:G529 |q1|
         #12=#:G527 |c0| |xn| |fcopy| #13=#:G575 |fRepr| |lcf| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |f| (QREFELT $ 12))
              . #14=(|FFPOLY;nextPrimitivePoly;SupU;12|))
        (EXIT
         (COND ((EQL |n| 0) (|error| "polynomial must have positive degree"))
               (#15='T
                (SEQ
                 (COND
                  ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #14#)
                             (|spadConstant| $ 13) (QREFELT $ 71))
                   (LETT |f|
                         (SPADCALL (SPADCALL |lcf| (QREFELT $ 88)) |f|
                                   (QREFELT $ 31))
                         . #14#)))
                 (LETT |fRepr| |f| . #14#) (LETT |fcopy| NIL . #14#)
                 (SEQ (LETT |term| NIL . #14#) (LETT #13# |fRepr| . #14#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |term| (CAR #13#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |fcopy|
                              (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                              . #14#)))
                      (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((SPADCALL (QCAR |term|) 0 (QREFELT $ 69))
                   (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #14#)
                        (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #14#)))))
                 (LETT |fcopy| (REVERSE |fcopy|) . #14#)
                 (LETT |xn| (|SPADfirst| |fcopy|) . #14#)
                 (LETT |c0| (QCDR |term|) . #14#)
                 (LETT |l| (REM (SPADCALL |c0| (QREFELT $ 90)) (QREFELT $ 10))
                       . #14#)
                 (EXIT
                  (COND
                   ((EQL |n| 1)
                    (SEQ
                     (LETT |q1|
                           (PROG1 (LETT #12# (- (QREFELT $ 10) 1) . #14#)
                             (|check_subtype| (>= #12# 0)
                                              '(|NonNegativeInteger|) #12#))
                           . #14#)
                     (SEQ G190 (COND ((NULL (< |l| |q1|)) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |l| (+ |l| 1) . #14#)
                                 (LETT |c|
                                       (SPADCALL
                                        (PROG1 (LETT #11# |l| . #14#)
                                          (|check_subtype| (> #11# 0)
                                                           '(|PositiveInteger|)
                                                           #11#))
                                        (QREFELT $ 91))
                                       . #14#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                              (QREFELT $ 94))
                                    (PROGN
                                     (LETT #10#
                                           (PROGN
                                            (LETT #5#
                                                  (CONS 0
                                                        (LIST |xn|
                                                              (CONS 0 |c|)))
                                                  . #14#)
                                            (GO #5#))
                                           . #14#)
                                     (GO #10#)))))))
                           #10# (EXIT #10#))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))
                   (#15#
                    (SEQ
                     (LETT |weight|
                           (PROG1 (LETT #9# (- (LENGTH |fcopy|) 1) . #14#)
                             (|check_subtype| (>= #9# 0)
                                              '(|NonNegativeInteger|) #9#))
                           . #14#)
                     (LETT |s| NIL . #14#)
                     (LETT |n1|
                           (PROG1 (LETT #8# (- |n| 1) . #14#)
                             (|check_subtype| (>= #8# 0)
                                              '(|NonNegativeInteger|) #8#))
                           . #14#)
                     (LETT |c| |c0| . #14#)
                     (SEQ G190 (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                          (SEQ (LETT |noGenerator| 'T . #14#)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        (|noGenerator| (< |l| (QREFELT $ 10)))
                                        ('T 'NIL)))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL (EXPT -1 |n|) |c|
                                                   (QREFELT $ 95))
                                         (QREFELT $ 94))
                                        (LETT |noGenerator| 'NIL . #14#))
                                       ('T
                                        (SEQ (LETT |l| (+ |l| 1) . #14#)
                                             (EXIT
                                              (LETT |c|
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #7# |l| . #14#)
                                                       (|check_subtype|
                                                        (> #7# 0)
                                                        '(|PositiveInteger|)
                                                        #7#))
                                                     (QREFELT $ 91))
                                                    . #14#)))))))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 (|noGenerator|
                                  (PROGN
                                   (LETT #5# (CONS 1 "failed") . #14#)
                                   (GO #5#)))
                                 ('T
                                  (SEQ (LETT |constterm| (CONS 0 |c|) . #14#)
                                       (COND
                                        ((SPADCALL |c| |c0| (QREFELT $ 57))
                                         (COND
                                          ((SPADCALL |weight| 1 (QREFELT $ 96))
                                           (SEQ
                                            (LETT |headpol|
                                                  (CDR (REVERSE |fcopy|))
                                                  . #14#)
                                            (EXIT
                                             (LETT |headlookuplist|
                                                   (SPADCALL |weight| 0
                                                             (QREFELT $ 89))
                                                   . #14#))))
                                          ('T
                                           (SEQ
                                            (LETT |headpol|
                                                  (LIST
                                                   (CONS 1
                                                         (|spadConstant| $ 19))
                                                   |xn|)
                                                  . #14#)
                                            (LETT |headlookuplist|
                                                  (LIST (QREFELT $ 10)) . #14#)
                                            (LETT |s| (LIST 0 1) . #14#)
                                            (EXIT (LETT |weight| 2 . #14#))))))
                                        ('T
                                         (SEQ
                                          (LETT |headpol|
                                                (LIST
                                                 (CONS 1 (|spadConstant| $ 19))
                                                 |xn|)
                                                . #14#)
                                          (LETT |headlookuplist|
                                                (LIST (QREFELT $ 10)) . #14#)
                                          (LETT |s| (LIST 0 1) . #14#)
                                          (EXIT (LETT |weight| 2 . #14#)))))
                                       (LETT |tailpol| NIL . #14#)
                                       (LETT |taillookuplist| NIL . #14#)
                                       (LETT |notReady| 'T . #14#)
                                       (SEQ G190
                                            (COND
                                             ((NULL |notReady|) (GO G191)))
                                            (SEQ
                                             (SEQ G190
                                                  (COND
                                                   ((NULL
                                                     (COND
                                                      ((NULL |headlookuplist|)
                                                       'NIL)
                                                      ('T 'T)))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |term|
                                                         (|SPADfirst|
                                                          |headpol|)
                                                         . #14#)
                                                   (LETT |j|
                                                         (|SPADfirst|
                                                          |headlookuplist|)
                                                         . #14#)
                                                   (COND
                                                    ((EQL |j| 0)
                                                     (LETT |j|
                                                           (SPADCALL
                                                            (QCDR |term|)
                                                            (QREFELT $ 90))
                                                           . #14#)))
                                                   (LETT |j| (+ |j| 1) . #14#)
                                                   (EXIT
                                                    (COND
                                                     ((EQL
                                                       (REM |j| (QREFELT $ 10))
                                                       0)
                                                      (SEQ
                                                       (LETT |tailpol|
                                                             (CONS |term|
                                                                   |tailpol|)
                                                             . #14#)
                                                       (LETT |headpol|
                                                             (CDR |headpol|)
                                                             . #14#)
                                                       (LETT |taillookuplist|
                                                             (CONS |j|
                                                                   |taillookuplist|)
                                                             . #14#)
                                                       (EXIT
                                                        (LETT |headlookuplist|
                                                              (CDR
                                                               |headlookuplist|)
                                                              . #14#))))
                                                     ('T
                                                      (SEQ
                                                       (PROGN
                                                        (RPLACD
                                                         (|SPADfirst|
                                                          |headpol|)
                                                         (SPADCALL
                                                          (PROG1
                                                              (LETT #6# |j|
                                                                    . #14#)
                                                            (|check_subtype|
                                                             (> #6# 0)
                                                             '(|PositiveInteger|)
                                                             #6#))
                                                          (QREFELT $ 91)))
                                                        (QCDR
                                                         (|SPADfirst|
                                                          |headpol|)))
                                                       (SPADCALL
                                                        |headlookuplist| |j|
                                                        (QREFELT $ 87))
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
                                                                 . #14#)
                                                           (EXIT
                                                            (COND
                                                             ((SPADCALL |pol|
                                                                        (QREFELT
                                                                         $ 80))
                                                              (PROGN
                                                               (LETT #5#
                                                                     (CONS 0
                                                                           |pol|)
                                                                     . #14#)
                                                               (GO #5#)))))))
                                                         ('T
                                                          (SEQ
                                                           (LETT |headpol|
                                                                 (CONS
                                                                  (|SPADfirst|
                                                                   |tailpol|)
                                                                  |headpol|)
                                                                 . #14#)
                                                           (LETT |tailpol|
                                                                 (CDR
                                                                  |tailpol|)
                                                                 . #14#)
                                                           (LETT
                                                            |headlookuplist|
                                                            (CONS
                                                             (|SPADfirst|
                                                              |taillookuplist|)
                                                             |headlookuplist|)
                                                            . #14#)
                                                           (EXIT
                                                            (LETT
                                                             |taillookuplist|
                                                             (CDR
                                                              |taillookuplist|)
                                                             . #14#)))))))))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((EQL |weight| |n|)
                                                (LETT |notReady| 'NIL . #14#))
                                               ('T
                                                (SEQ
                                                 (COND
                                                  ((NULL |s|)
                                                   (SEQ
                                                    (LETT |restfcopy|
                                                          (CDR |fcopy|) . #14#)
                                                    (EXIT
                                                     (SEQ
                                                      (LETT |entry| NIL . #14#)
                                                      (LETT #4# |restfcopy|
                                                            . #14#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #4#)
                                                            (PROGN
                                                             (LETT |entry|
                                                                   (CAR #4#)
                                                                   . #14#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT |s|
                                                              (CONS
                                                               (QCAR |entry|)
                                                               |s|)
                                                              . #14#)))
                                                      (LETT #4# (CDR #4#)
                                                            . #14#)
                                                      (GO G190) G191
                                                      (EXIT NIL))))))
                                                 (LETT |s1|
                                                       (PROG2
                                                           (LETT #3#
                                                                 (|FFPOLY;nextSubset|
                                                                  (CDR |s|)
                                                                  |n1| $)
                                                                 . #14#)
                                                           (QCDR #3#)
                                                         (|check_union|
                                                          (QEQCAR #3# 0)
                                                          (|List|
                                                           (|NonNegativeInteger|))
                                                          #3#))
                                                       . #14#)
                                                 (LETT |s| (CONS 0 |s1|)
                                                       . #14#)
                                                 (LETT |weight|
                                                       (SPADCALL |s|
                                                                 (QREFELT $
                                                                          86))
                                                       . #14#)
                                                 (LETT |taillookuplist| NIL
                                                       . #14#)
                                                 (LETT |headlookuplist|
                                                       (CONS (QREFELT $ 10)
                                                             (SPADCALL
                                                              (PROG1
                                                                  (LETT #2#
                                                                        (-
                                                                         |weight|
                                                                         2)
                                                                        . #14#)
                                                                (|check_subtype|
                                                                 (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                                              1
                                                              (QREFELT $ 89)))
                                                       . #14#)
                                                 (LETT |tailpol| NIL . #14#)
                                                 (LETT |headpol|
                                                       (LIST
                                                        (CONS
                                                         (|SPADfirst| |s1|)
                                                         (|spadConstant| $
                                                                         19)))
                                                       . #14#)
                                                 (SEQ G190
                                                      (COND
                                                       ((NULL
                                                         (COND
                                                          ((NULL
                                                            (LETT |s1|
                                                                  (CDR |s1|)
                                                                  . #14#))
                                                           'NIL)
                                                          ('T 'T)))
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
                                                              . #14#)))
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
                                                        . #14#)))))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (LETT |l| (+ |l| 1) . #14#)
                                       (EXIT
                                        (LETT |c|
                                              (SPADCALL
                                               (PROG1 (LETT #1# |l| . #14#)
                                                 (|check_subtype| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  #1#))
                                               (QREFELT $ 91))
                                              . #14#)))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))))))))))
      #5# (EXIT #5#))))) 

(DEFUN |FFPOLY;nextNormalPoly;SupU;13| (|f| $)
  (PROG (|a| #1=#:G619 |l| |middlepol| |s1| |tailpol| |middlelookuplist|
         #2=#:G611 |taillookuplist| |weight| |s| #3=#:G609 #4=#:G627 |entry|
         |restfcopy| |notReady| #5=#:G625 |pol| #6=#:G599 |j| |term| |headpol|
         |n2| #7=#:G591 |n1| #8=#:G590 #9=#:G588 |a0| |xn| |fcopy| #10=#:G626
         |fRepr| |lcf| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |f| (QREFELT $ 12))
              . #11=(|FFPOLY;nextNormalPoly;SupU;13|))
        (EXIT
         (COND ((EQL |n| 0) (|error| "polynomial must have positive degree"))
               (#12='T
                (SEQ
                 (COND
                  ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #11#)
                             (|spadConstant| $ 13) (QREFELT $ 71))
                   (LETT |f|
                         (SPADCALL (SPADCALL |lcf| (QREFELT $ 88)) |f|
                                   (QREFELT $ 31))
                         . #11#)))
                 (LETT |fRepr| |f| . #11#) (LETT |fcopy| NIL . #11#)
                 (SEQ (LETT |term| NIL . #11#) (LETT #10# |fRepr| . #11#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT |term| (CAR #10#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |fcopy|
                              (CONS (CONS (CAR |term|) (CDR |term|)) |fcopy|)
                              . #11#)))
                      (LETT #10# (CDR #10#) . #11#) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((SPADCALL (QCAR |term|) 0 (QREFELT $ 69))
                   (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #11#)
                        (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #11#)))))
                 (LETT |fcopy| (REVERSE |fcopy|) . #11#)
                 (LETT |xn| (|SPADfirst| |fcopy|) . #11#)
                 (LETT |middlepol| (CDR |fcopy|) . #11#)
                 (LETT |a0| (QCDR (|SPADfirst| |middlepol|)) . #11#)
                 (LETT |l| (REM (SPADCALL |a0| (QREFELT $ 90)) (QREFELT $ 10))
                       . #11#)
                 (EXIT
                  (COND
                   ((EQL |n| 1)
                    (COND ((EQL |l| (- (QREFELT $ 10) 1)) (CONS 1 "failed"))
                          (#12#
                           (CONS 0
                                 (LIST |xn|
                                       (CONS 0
                                             (SPADCALL
                                              (PROG1
                                                  (LETT #9# (+ |l| 1) . #11#)
                                                (|check_subtype| (> #9# 0)
                                                                 '(|PositiveInteger|)
                                                                 #9#))
                                              (QREFELT $ 91))))))))
                   (#12#
                    (SEQ
                     (LETT |n1|
                           (PROG1 (LETT #8# (- |n| 1) . #11#)
                             (|check_subtype| (>= #8# 0)
                                              '(|NonNegativeInteger|) #8#))
                           . #11#)
                     (LETT |n2|
                           (PROG1 (LETT #7# (- |n1| 1) . #11#)
                             (|check_subtype| (>= #7# 0)
                                              '(|NonNegativeInteger|) #7#))
                           . #11#)
                     (LETT |a| |a0| . #11#)
                     (COND
                      ((EQL |l| 0)
                       (SEQ (LETT |l| 1 . #11#)
                            (EXIT (LETT |a| (|spadConstant| $ 13) . #11#)))))
                     (SEQ G190 (COND ((NULL (< |l| (QREFELT $ 10))) (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL |a| |a0| (QREFELT $ 57))
                             (SEQ
                              (LETT |middlepol| (REVERSE (CDR |middlepol|))
                                    . #11#)
                              (LETT |weight| (LENGTH |middlepol|) . #11#)
                              (LETT |middlelookuplist|
                                    (SPADCALL |weight| 0 (QREFELT $ 89))
                                    . #11#)
                              (EXIT (LETT |s| NIL . #11#))))
                            ('T
                             (SEQ
                              (LETT |middlepol|
                                    (LIST (CONS 0 (|spadConstant| $ 19)))
                                    . #11#)
                              (LETT |middlelookuplist| (LIST (QREFELT $ 10))
                                    . #11#)
                              (LETT |s| (LIST 0) . #11#)
                              (EXIT (LETT |weight| 1 . #11#)))))
                           (LETT |headpol| (LIST |xn| (CONS |n1| |a|)) . #11#)
                           (LETT |tailpol| NIL . #11#)
                           (LETT |taillookuplist| NIL . #11#)
                           (LETT |notReady| 'T . #11#)
                           (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                                (SEQ
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND ((NULL |middlelookuplist|) 'NIL)
                                               ('T 'T)))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |term| (|SPADfirst| |middlepol|)
                                             . #11#)
                                       (LETT |j|
                                             (|SPADfirst| |middlelookuplist|)
                                             . #11#)
                                       (COND
                                        ((EQL |j| 0)
                                         (LETT |j|
                                               (SPADCALL (QCDR |term|)
                                                         (QREFELT $ 90))
                                               . #11#)))
                                       (LETT |j| (+ |j| 1) . #11#)
                                       (EXIT
                                        (COND
                                         ((EQL (REM |j| (QREFELT $ 10)) 0)
                                          (SEQ
                                           (LETT |tailpol|
                                                 (CONS |term| |tailpol|)
                                                 . #11#)
                                           (LETT |middlepol| (CDR |middlepol|)
                                                 . #11#)
                                           (LETT |taillookuplist|
                                                 (CONS |j| |taillookuplist|)
                                                 . #11#)
                                           (EXIT
                                            (LETT |middlelookuplist|
                                                  (CDR |middlelookuplist|)
                                                  . #11#))))
                                         ('T
                                          (SEQ
                                           (PROGN
                                            (RPLACD (|SPADfirst| |middlepol|)
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #6# |j| . #11#)
                                                       (|check_subtype|
                                                        (> #6# 0)
                                                        '(|PositiveInteger|)
                                                        #6#))
                                                     (QREFELT $ 91)))
                                            (QCDR (|SPADfirst| |middlepol|)))
                                           (SPADCALL |middlelookuplist| |j|
                                                     (QREFELT $ 87))
                                           (EXIT
                                            (COND
                                             ((NULL |taillookuplist|)
                                              (SEQ
                                               (LETT |pol|
                                                     (|FFPOLY;listToSUP|
                                                      (APPEND |headpol|
                                                              (REVERSE
                                                               |middlepol|))
                                                      $)
                                                     . #11#)
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |pol|
                                                            (QREFELT $ 84))
                                                  (PROGN
                                                   (LETT #5# (CONS 0 |pol|)
                                                         . #11#)
                                                   (GO #5#)))))))
                                             ('T
                                              (SEQ
                                               (LETT |middlepol|
                                                     (CONS
                                                      (|SPADfirst| |tailpol|)
                                                      |middlepol|)
                                                     . #11#)
                                               (LETT |tailpol| (CDR |tailpol|)
                                                     . #11#)
                                               (LETT |middlelookuplist|
                                                     (CONS
                                                      (|SPADfirst|
                                                       |taillookuplist|)
                                                      |middlelookuplist|)
                                                     . #11#)
                                               (EXIT
                                                (LETT |taillookuplist|
                                                      (CDR |taillookuplist|)
                                                      . #11#)))))))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((EQL |weight| |n1|)
                                    (LETT |notReady| 'NIL . #11#))
                                   ('T
                                    (SEQ
                                     (COND
                                      ((NULL |s|)
                                       (SEQ
                                        (LETT |restfcopy| (CDR (CDR |fcopy|))
                                              . #11#)
                                        (EXIT
                                         (SEQ (LETT |entry| NIL . #11#)
                                              (LETT #4# |restfcopy| . #11#)
                                              G190
                                              (COND
                                               ((OR (ATOM #4#)
                                                    (PROGN
                                                     (LETT |entry| (CAR #4#)
                                                           . #11#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |s|
                                                      (CONS (QCAR |entry|) |s|)
                                                      . #11#)))
                                              (LETT #4# (CDR #4#) . #11#)
                                              (GO G190) G191 (EXIT NIL))))))
                                     (LETT |s1|
                                           (PROG2
                                               (LETT #3#
                                                     (|FFPOLY;nextSubset|
                                                      (CDR |s|) |n2| $)
                                                     . #11#)
                                               (QCDR #3#)
                                             (|check_union| (QEQCAR #3# 0)
                                                            (|List|
                                                             (|NonNegativeInteger|))
                                                            #3#))
                                           . #11#)
                                     (LETT |s| (CONS 0 |s1|) . #11#)
                                     (LETT |weight|
                                           (SPADCALL |s| (QREFELT $ 86))
                                           . #11#)
                                     (LETT |taillookuplist| NIL . #11#)
                                     (LETT |middlelookuplist|
                                           (CONS (QREFELT $ 10)
                                                 (SPADCALL
                                                  (PROG1
                                                      (LETT #2# (- |weight| 1)
                                                            . #11#)
                                                    (|check_subtype| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #2#))
                                                  1 (QREFELT $ 89)))
                                           . #11#)
                                     (LETT |tailpol| NIL . #11#)
                                     (LETT |middlepol| NIL . #11#)
                                     (LETT |s1| (REVERSE |s1|) . #11#)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (COND ((NULL |s1|) 'NIL) ('T 'T)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |middlepol|
                                                 (CONS
                                                  (CONS (|SPADfirst| |s1|)
                                                        (|spadConstant| $ 13))
                                                  |middlepol|)
                                                 . #11#)
                                           (EXIT
                                            (LETT |s1| (CDR |s1|) . #11#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (LETT |middlepol|
                                            (CONS
                                             (CONS 0 (|spadConstant| $ 19))
                                             |middlepol|)
                                            . #11#)))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |l| (+ |l| 1) . #11#)
                           (EXIT
                            (LETT |a|
                                  (SPADCALL
                                   (PROG1 (LETT #1# |l| . #11#)
                                     (|check_subtype| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      #1#))
                                   (QREFELT $ 91))
                                  . #11#)))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))))))))))
      #5# (EXIT #5#))))) 

(DEFUN |FFPOLY;nextNormalPrimitivePoly;SupU;14| (|f| $)
  (PROG (|a| |la| |c| #1=#:G686 |lc| #2=#:G682 |middlepol| |s1| |tailpol|
         |middlelookuplist| #3=#:G675 |taillookuplist| |weight| |s| #4=#:G673
         #5=#:G695 |entry| |restfcopy| |notReady| #6=#:G663 #7=#:G693 |pol|
         #8=#:G662 |j| |term| #9=#:G651 |headpol| |constterm| #10=#:G646
         |noGenerator| |a0| |n2| #11=#:G643 |n1| #12=#:G642 #13=#:G639
         #14=#:G638 |q1| #15=#:G636 |c0| |xn| |fcopy| #16=#:G694 |fRepr| |lcf|
         |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL |f| (QREFELT $ 12))
              . #17=(|FFPOLY;nextNormalPrimitivePoly;SupU;14|))
        (EXIT
         (COND ((EQL |n| 0) (|error| "polynomial must have positive degree"))
               (#18='T
                (SEQ
                 (COND
                  ((SPADCALL (LETT |lcf| (SPADCALL |f| (QREFELT $ 30)) . #17#)
                             (|spadConstant| $ 13) (QREFELT $ 71))
                   (LETT |f|
                         (SPADCALL (SPADCALL |lcf| (QREFELT $ 88)) |f|
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
                  ((SPADCALL (QCAR |term|) 0 (QREFELT $ 69))
                   (SEQ (LETT |term| (CONS 0 (|spadConstant| $ 19)) . #17#)
                        (EXIT (LETT |fcopy| (CONS |term| |fcopy|) . #17#)))))
                 (LETT |fcopy| (REVERSE |fcopy|) . #17#)
                 (LETT |xn| (|SPADfirst| |fcopy|) . #17#)
                 (LETT |c0| (QCDR |term|) . #17#)
                 (LETT |lc| (REM (SPADCALL |c0| (QREFELT $ 90)) (QREFELT $ 10))
                       . #17#)
                 (EXIT
                  (COND
                   ((EQL |n| 1)
                    (SEQ
                     (LETT |q1|
                           (PROG1 (LETT #15# (- (QREFELT $ 10) 1) . #17#)
                             (|check_subtype| (>= #15# 0)
                                              '(|NonNegativeInteger|) #15#))
                           . #17#)
                     (SEQ G190 (COND ((NULL (< |lc| |q1|)) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |lc| (+ |lc| 1) . #17#)
                                 (LETT |c|
                                       (SPADCALL
                                        (PROG1 (LETT #14# |lc| . #17#)
                                          (|check_subtype| (> #14# 0)
                                                           '(|PositiveInteger|)
                                                           #14#))
                                        (QREFELT $ 91))
                                       . #17#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL (SPADCALL |c| (QREFELT $ 26))
                                              (QREFELT $ 94))
                                    (PROGN
                                     (LETT #13#
                                           (PROGN
                                            (LETT #7#
                                                  (CONS 0
                                                        (LIST |xn|
                                                              (CONS 0 |c|)))
                                                  . #17#)
                                            (GO #7#))
                                           . #17#)
                                     (GO #13#)))))))
                           #13# (EXIT #13#))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))
                   (#18#
                    (SEQ
                     (LETT |n1|
                           (PROG1 (LETT #12# (- |n| 1) . #17#)
                             (|check_subtype| (>= #12# 0)
                                              '(|NonNegativeInteger|) #12#))
                           . #17#)
                     (LETT |n2|
                           (PROG1 (LETT #11# (- |n1| 1) . #17#)
                             (|check_subtype| (>= #11# 0)
                                              '(|NonNegativeInteger|) #11#))
                           . #17#)
                     (LETT |middlepol| (CDR |fcopy|) . #17#)
                     (LETT |a0| (QCDR (|SPADfirst| |middlepol|)) . #17#)
                     (LETT |la|
                           (REM (SPADCALL |a0| (QREFELT $ 90)) (QREFELT $ 10))
                           . #17#)
                     (LETT |c| |c0| . #17#) (LETT |a| |a0| . #17#)
                     (COND
                      ((EQL |la| 0)
                       (SEQ (LETT |la| 1 . #17#)
                            (EXIT (LETT |a| (|spadConstant| $ 13) . #17#)))))
                     (SEQ G190
                          (COND ((NULL (< |lc| (QREFELT $ 10))) (GO G191)))
                          (SEQ (LETT |noGenerator| 'T . #17#)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        (|noGenerator| (< |lc| (QREFELT $ 10)))
                                        ('T 'NIL)))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL (EXPT -1 |n|) |c|
                                                   (QREFELT $ 95))
                                         (QREFELT $ 94))
                                        (LETT |noGenerator| 'NIL . #17#))
                                       ('T
                                        (SEQ (LETT |lc| (+ |lc| 1) . #17#)
                                             (EXIT
                                              (LETT |c|
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #10# |lc|
                                                               . #17#)
                                                       (|check_subtype|
                                                        (> #10# 0)
                                                        '(|PositiveInteger|)
                                                        #10#))
                                                     (QREFELT $ 91))
                                                    . #17#)))))))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 (|noGenerator|
                                  (PROGN
                                   (LETT #7# (CONS 1 "failed") . #17#)
                                   (GO #7#)))
                                 ('T
                                  (SEQ (LETT |constterm| (CONS 0 |c|) . #17#)
                                       (SEQ G190
                                            (COND
                                             ((NULL (< |la| (QREFELT $ 10)))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |headpol|
                                                   (LIST |xn| (CONS |n1| |a|))
                                                   . #17#)
                                             (COND
                                              ((SPADCALL |c| |c0|
                                                         (QREFELT $ 57))
                                               (COND
                                                ((SPADCALL |a| |a0|
                                                           (QREFELT $ 57))
                                                 (SEQ
                                                  (LETT |middlepol|
                                                        (CDR
                                                         (REVERSE
                                                          (CDR |middlepol|)))
                                                        . #17#)
                                                  (LETT |weight|
                                                        (+ (LENGTH |middlepol|)
                                                           1)
                                                        . #17#)
                                                  (LETT |middlelookuplist|
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #9#
                                                                   (- |weight|
                                                                      1)
                                                                   . #17#)
                                                           (|check_subtype|
                                                            (>= #9# 0)
                                                            '(|NonNegativeInteger|)
                                                            #9#))
                                                         0 (QREFELT $ 89))
                                                        . #17#)
                                                  (EXIT
                                                   (LETT |s| NIL . #17#))))
                                                ('T
                                                 (SEQ
                                                  (LETT |pol|
                                                        (|FFPOLY;listToSUP|
                                                         (APPEND |headpol|
                                                                 (LIST
                                                                  |constterm|))
                                                         $)
                                                        . #17#)
                                                  (COND
                                                   ((SPADCALL |pol|
                                                              (QREFELT $ 84))
                                                    (COND
                                                     ((SPADCALL |pol|
                                                                (QREFELT $ 80))
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #7#
                                                              (CONS 0 |pol|)
                                                              . #17#)
                                                        (GO #7#)))))))
                                                  (LETT |middlepol|
                                                        (LIST
                                                         (CONS 1
                                                               (|spadConstant|
                                                                $ 19)))
                                                        . #17#)
                                                  (LETT |middlelookuplist|
                                                        (LIST (QREFELT $ 10))
                                                        . #17#)
                                                  (LETT |s| (LIST 0 1) . #17#)
                                                  (EXIT
                                                   (LETT |weight| 2
                                                         . #17#))))))
                                              ('T
                                               (SEQ
                                                (LETT |pol|
                                                      (|FFPOLY;listToSUP|
                                                       (APPEND |headpol|
                                                               (LIST
                                                                |constterm|))
                                                       $)
                                                      . #17#)
                                                (COND
                                                 ((SPADCALL |pol|
                                                            (QREFELT $ 84))
                                                  (COND
                                                   ((SPADCALL |pol|
                                                              (QREFELT $ 80))
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #7# (CONS 0 |pol|)
                                                            . #17#)
                                                      (GO #7#)))))))
                                                (LETT |middlepol|
                                                      (LIST
                                                       (CONS 1
                                                             (|spadConstant| $
                                                                             19)))
                                                      . #17#)
                                                (LETT |middlelookuplist|
                                                      (LIST (QREFELT $ 10))
                                                      . #17#)
                                                (LETT |s| (LIST 0 1) . #17#)
                                                (EXIT
                                                 (LETT |weight| 2 . #17#)))))
                                             (LETT |tailpol| NIL . #17#)
                                             (LETT |taillookuplist| NIL . #17#)
                                             (LETT |notReady| 'T . #17#)
                                             (SEQ G190
                                                  (COND
                                                   ((NULL |notReady|)
                                                    (GO G191)))
                                                  (SEQ
                                                   (SEQ G190
                                                        (COND
                                                         ((NULL
                                                           (COND
                                                            ((NULL
                                                              |middlelookuplist|)
                                                             'NIL)
                                                            ('T 'T)))
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |term|
                                                               (|SPADfirst|
                                                                |middlepol|)
                                                               . #17#)
                                                         (LETT |j|
                                                               (|SPADfirst|
                                                                |middlelookuplist|)
                                                               . #17#)
                                                         (COND
                                                          ((EQL |j| 0)
                                                           (LETT |j|
                                                                 (SPADCALL
                                                                  (QCDR |term|)
                                                                  (QREFELT $
                                                                           90))
                                                                 . #17#)))
                                                         (LETT |j| (+ |j| 1)
                                                               . #17#)
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
                                                                   . #17#)
                                                             (LETT |middlepol|
                                                                   (CDR
                                                                    |middlepol|)
                                                                   . #17#)
                                                             (LETT
                                                              |taillookuplist|
                                                              (CONS |j|
                                                                    |taillookuplist|)
                                                              . #17#)
                                                             (EXIT
                                                              (LETT
                                                               |middlelookuplist|
                                                               (CDR
                                                                |middlelookuplist|)
                                                               . #17#))))
                                                           ('T
                                                            (SEQ
                                                             (PROGN
                                                              (RPLACD
                                                               (|SPADfirst|
                                                                |middlepol|)
                                                               (SPADCALL
                                                                (PROG1
                                                                    (LETT #8#
                                                                          |j|
                                                                          . #17#)
                                                                  (|check_subtype|
                                                                   (> #8# 0)
                                                                   '(|PositiveInteger|)
                                                                   #8#))
                                                                (QREFELT $
                                                                         91)))
                                                              (QCDR
                                                               (|SPADfirst|
                                                                |middlepol|)))
                                                             (SPADCALL
                                                              |middlelookuplist|
                                                              |j|
                                                              (QREFELT $ 87))
                                                             (EXIT
                                                              (COND
                                                               ((NULL
                                                                 |taillookuplist|)
                                                                (SEQ
                                                                 (LETT |pol|
                                                                       (|FFPOLY;listToSUP|
                                                                        (APPEND
                                                                         |headpol|
                                                                         (REVERSE
                                                                          (CONS
                                                                           |constterm|
                                                                           |middlepol|)))
                                                                        $)
                                                                       . #17#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((SPADCALL
                                                                     |pol|
                                                                     (QREFELT $
                                                                              84))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (COND
                                                                       ((SPADCALL
                                                                         |pol|
                                                                         (QREFELT
                                                                          $
                                                                          80))
                                                                        (PROGN
                                                                         (LETT
                                                                          #6#
                                                                          (PROGN
                                                                           (LETT
                                                                            #7#
                                                                            (CONS
                                                                             0
                                                                             |pol|)
                                                                            . #17#)
                                                                           (GO
                                                                            #7#))
                                                                          . #17#)
                                                                         (GO
                                                                          #6#)))))
                                                                     #6#
                                                                     (EXIT
                                                                      #6#)))))))
                                                               ('T
                                                                (SEQ
                                                                 (LETT
                                                                  |middlepol|
                                                                  (CONS
                                                                   (|SPADfirst|
                                                                    |tailpol|)
                                                                   |middlepol|)
                                                                  . #17#)
                                                                 (LETT
                                                                  |tailpol|
                                                                  (CDR
                                                                   |tailpol|)
                                                                  . #17#)
                                                                 (LETT
                                                                  |middlelookuplist|
                                                                  (CONS
                                                                   (|SPADfirst|
                                                                    |taillookuplist|)
                                                                   |middlelookuplist|)
                                                                  . #17#)
                                                                 (EXIT
                                                                  (LETT
                                                                   |taillookuplist|
                                                                   (CDR
                                                                    |taillookuplist|)
                                                                   . #17#)))))))))))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((EQL |weight| |n1|)
                                                      (LETT |notReady| 'NIL
                                                            . #17#))
                                                     ('T
                                                      (SEQ
                                                       (COND
                                                        ((NULL |s|)
                                                         (SEQ
                                                          (LETT |restfcopy|
                                                                (CDR
                                                                 (CDR |fcopy|))
                                                                . #17#)
                                                          (EXIT
                                                           (SEQ
                                                            (LETT |entry| NIL
                                                                  . #17#)
                                                            (LETT #5#
                                                                  |restfcopy|
                                                                  . #17#)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #5#)
                                                                  (PROGN
                                                                   (LETT
                                                                    |entry|
                                                                    (CAR #5#)
                                                                    . #17#)
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT |s|
                                                                    (CONS
                                                                     (QCAR
                                                                      |entry|)
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
                                                                        (CDR
                                                                         |s|)
                                                                        |n2| $)
                                                                       . #17#)
                                                                 (QCDR #4#)
                                                               (|check_union|
                                                                (QEQCAR #4# 0)
                                                                (|List|
                                                                 (|NonNegativeInteger|))
                                                                #4#))
                                                             . #17#)
                                                       (LETT |s| (CONS 0 |s1|)
                                                             . #17#)
                                                       (LETT |weight|
                                                             (SPADCALL |s|
                                                                       (QREFELT
                                                                        $ 86))
                                                             . #17#)
                                                       (LETT |taillookuplist|
                                                             NIL . #17#)
                                                       (LETT |middlelookuplist|
                                                             (CONS
                                                              (QREFELT $ 10)
                                                              (SPADCALL
                                                               (PROG1
                                                                   (LETT #3#
                                                                         (-
                                                                          |weight|
                                                                          2)
                                                                         . #17#)
                                                                 (|check_subtype|
                                                                  (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #3#))
                                                               1
                                                               (QREFELT $ 89)))
                                                             . #17#)
                                                       (LETT |tailpol| NIL
                                                             . #17#)
                                                       (LETT |middlepol|
                                                             (LIST
                                                              (CONS
                                                               (|SPADfirst|
                                                                |s1|)
                                                               (|spadConstant|
                                                                $ 19)))
                                                             . #17#)
                                                       (SEQ G190
                                                            (COND
                                                             ((NULL
                                                               (COND
                                                                ((NULL
                                                                  (LETT |s1|
                                                                        (CDR
                                                                         |s1|)
                                                                        . #17#))
                                                                 'NIL)
                                                                ('T 'T)))
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
                                                                    . #17#)))
                                                            NIL (GO G190) G191
                                                            (EXIT NIL))
                                                       (EXIT
                                                        (LETT |middlepol|
                                                              (REVERSE
                                                               |middlepol|)
                                                              . #17#)))))))
                                                  NIL (GO G190) G191
                                                  (EXIT NIL))
                                             (LETT |la| (+ |la| 1) . #17#)
                                             (EXIT
                                              (LETT |a|
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #2# |la| . #17#)
                                                       (|check_subtype|
                                                        (> #2# 0)
                                                        '(|PositiveInteger|)
                                                        #2#))
                                                     (QREFELT $ 91))
                                                    . #17#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (LETT |lc| (+ |lc| 1) . #17#)
                                       (LETT |c|
                                             (SPADCALL
                                              (PROG1 (LETT #1# |lc| . #17#)
                                                (|check_subtype| (> #1# 0)
                                                                 '(|PositiveInteger|)
                                                                 #1#))
                                              (QREFELT $ 91))
                                             . #17#)
                                       (LETT |la| 1 . #17#)
                                       (EXIT
                                        (LETT |a| (|spadConstant| $ 13)
                                              . #17#)))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 1 "failed"))))))))))))
      #7# (EXIT #7#))))) 

(DEFUN |FFPOLY;nextPrimitiveNormalPoly;SupU;15| (|f| $)
  (SPADCALL |f| (QREFELT $ 99))) 

(DEFUN |FFPOLY;createIrreduciblePoly;PiSup;16| (|n| $)
  (PROG (#1=#:G701 |xn| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
            . #2=(|FFPOLY;createIrreduciblePoly;PiSup;16|))
      (EXIT
       (COND ((EQL |n| 1) |x|)
             (#3='T
              (SEQ
               (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
                     . #2#)
               (EXIT
                (COND
                 ((>= |n| (QREFELT $ 10))
                  (PROG2
                      (LETT #1#
                            (SPADCALL (SPADCALL |xn| |x| (QREFELT $ 32))
                                      (QREFELT $ 93))
                            . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   #1#)))
                 ((ODDP |n|)
                  (PROG2
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL |xn| (|spadConstant| $ 22)
                                       (QREFELT $ 32))
                             (QREFELT $ 93))
                            . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   #1#)))
                 (#3#
                  (PROG2 (LETT #1# (SPADCALL |xn| (QREFELT $ 93)) . #2#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                   #1#))))))))))))) 

(DEFUN |FFPOLY;createPrimitivePoly;PiSup;17| (|n| $)
  (PROG (#1=#:G719 |weight| |s| |s1| #2=#:G713 |notReady| #3=#:G723 |pol|
         |polRepr| |n1| #4=#:G708 |constterm| |c0| |xn|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
              . #5=(|FFPOLY;createPrimitivePoly;PiSup;17|))
        (EXIT
         (COND
          ((EQL |n| 1)
           (SPADCALL |xn|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 102)) (QREFELT $ 26)) 0
                      (QREFELT $ 16))
                     (QREFELT $ 32)))
          ('T
           (SEQ
            (LETT |c0|
                  (SPADCALL (EXPT -1 |n|) (SPADCALL (QREFELT $ 102))
                            (QREFELT $ 95))
                  . #5#)
            (LETT |constterm| (CONS 0 |c0|) . #5#) (LETT |s| (LIST 0 1) . #5#)
            (LETT |weight| 2 . #5#) (LETT |s1| (LIST 1) . #5#)
            (LETT |n1|
                  (PROG1 (LETT #4# (- |n| 1) . #5#)
                    (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                  . #5#)
            (LETT |notReady| 'T . #5#)
            (SEQ G190 (COND ((NULL |notReady|) (GO G191)))
                 (SEQ (LETT |polRepr| (LIST |constterm|) . #5#)
                      (SEQ G190
                           (COND
                            ((NULL (COND ((NULL |s1|) 'NIL) ('T 'T)))
                             (GO G191)))
                           (SEQ
                            (LETT |polRepr|
                                  (CONS
                                   (CONS (|SPADfirst| |s1|)
                                         (|spadConstant| $ 13))
                                   |polRepr|)
                                  . #5#)
                            (EXIT (LETT |s1| (CDR |s1|) . #5#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |polRepr|
                            (CONS (CONS |n| (|spadConstant| $ 13)) |polRepr|)
                            . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL
                          (LETT |pol| (|FFPOLY;listToSUP| |polRepr| $) . #5#)
                          (QREFELT $ 80))
                         (PROGN (LETT #3# |pol| . #5#) (GO #3#)))
                        ((EQL |weight| |n|) (LETT |notReady| 'NIL . #5#))
                        ('T
                         (SEQ
                          (LETT |s1|
                                (PROG2
                                    (LETT #2#
                                          (|FFPOLY;nextSubset| (CDR |s|) |n1|
                                           $)
                                          . #5#)
                                    (QCDR #2#)
                                  (|check_union| (QEQCAR #2# 0)
                                                 (|List|
                                                  (|NonNegativeInteger|))
                                                 #2#))
                                . #5#)
                          (LETT |s| (CONS 0 |s1|) . #5#)
                          (EXIT
                           (LETT |weight| (SPADCALL |s| (QREFELT $ 86))
                                 . #5#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROG2
                 (LETT #1#
                       (SPADCALL
                        (SPADCALL |xn| (SPADCALL |c0| 0 (QREFELT $ 16))
                                  (QREFELT $ 32))
                        (QREFELT $ 97))
                       . #5#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0)
                              (|SparseUnivariatePolynomial| (QREFELT $ 6))
                              #1#)))))))))
      #3# (EXIT #3#))))) 

(DEFUN |FFPOLY;createNormalPoly;PiSup;18| (|n| $)
  (PROG (#1=#:G727 #2=#:G725)
    (RETURN
     (COND
      ((EQL |n| 1)
       (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 16))
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26)) 0
                           (QREFELT $ 16))
                 (QREFELT $ 32)))
      ('T
       (PROG2
           (LETT #1#
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                             (PROG1
                                 (LETT #2# (- |n| 1)
                                       . #3=(|FFPOLY;createNormalPoly;PiSup;18|))
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 16))
                            (QREFELT $ 32))
                  (QREFELT $ 98))
                 . #3#)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0)
                        (|SparseUnivariatePolynomial| (QREFELT $ 6)) #1#))))))) 

(DEFUN |FFPOLY;createNormalPrimitivePoly;PiSup;19| (|n| $)
  (PROG (#1=#:G734 |pol| |res| |constterm| |c0| |n1| #2=#:G730 |xn|)
    (RETURN
     (SEQ
      (LETT |xn| (SPADCALL (|spadConstant| $ 13) |n| (QREFELT $ 16))
            . #3=(|FFPOLY;createNormalPrimitivePoly;PiSup;19|))
      (EXIT
       (COND
        ((EQL |n| 1)
         (SPADCALL |xn|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 102)) (QREFELT $ 26)) 0
                    (QREFELT $ 16))
                   (QREFELT $ 32)))
        (#4='T
         (SEQ
          (LETT |n1|
                (PROG1 (LETT #2# (- |n| 1) . #3#)
                  (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                . #3#)
          (LETT |c0|
                (SPADCALL (EXPT -1 |n|) (SPADCALL (QREFELT $ 102))
                          (QREFELT $ 95))
                . #3#)
          (LETT |constterm| (SPADCALL |c0| 0 (QREFELT $ 16)) . #3#)
          (LETT |pol|
                (SPADCALL
                 (SPADCALL |xn|
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 13) (QREFELT $ 26))
                            |n1| (QREFELT $ 16))
                           (QREFELT $ 32))
                 |constterm| (QREFELT $ 32))
                . #3#)
          (COND
           ((SPADCALL |pol| (QREFELT $ 84))
            (COND ((SPADCALL |pol| (QREFELT $ 80)) (EXIT |pol|)))))
          (LETT |res| (SPADCALL |pol| (QREFELT $ 99)) . #3#)
          (EXIT
           (COND ((QEQCAR |res| 0) (QCDR |res|))
                 (#4#
                  (SEQ
                   (LETT |pol|
                         (SPADCALL
                          (SPADCALL |xn|
                                    (SPADCALL (|spadConstant| $ 13) |n1|
                                              (QREFELT $ 16))
                                    (QREFELT $ 32))
                          |constterm| (QREFELT $ 32))
                         . #3#)
                   (COND
                    ((SPADCALL |pol| (QREFELT $ 84))
                     (COND ((SPADCALL |pol| (QREFELT $ 80)) (EXIT |pol|)))))
                   (EXIT
                    (PROG2 (LETT #1# (SPADCALL |pol| (QREFELT $ 99)) . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 6))
                                     #1#))))))))))))))) 

(DEFUN |FFPOLY;createPrimitiveNormalPoly;PiSup;20| (|n| $)
  (SPADCALL |n| (QREFELT $ 105))) 

(DEFUN |FFPOLY;random;PiSup;21| (|n| $)
  (PROG (|polRepr| |c| |i| |n1| #1=#:G744)
    (RETURN
     (SEQ (LETT |polRepr| NIL . #2=(|FFPOLY;random;PiSup;21|))
          (LETT |n1|
                (PROG1 (LETT #1# (- |n| 1) . #2#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (SEQ (LETT |i| 0 . #2#) G190
               (COND ((|greater_SI| |i| |n1|) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (LETT |c| (SPADCALL (QREFELT $ 107)) . #2#)
                             (|spadConstant| $ 19) (QREFELT $ 71))
                   (LETT |polRepr| (CONS (CONS |i| |c|) |polRepr|) . #2#)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (CONS |n| (|spadConstant| $ 13)) |polRepr|)))))) 

(DEFUN |FFPOLY;random;2PiSup;22| (|m| |n| $)
  (PROG (#1=#:G750 |d| #2=#:G749 |#G65| |#G64|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| |n| (QREFELT $ 109))
        (PROGN
         (LETT |#G64| |n| . #3=(|FFPOLY;random;2PiSup;22|))
         (LETT |#G65| |m| . #3#)
         (LETT |m| |#G64| . #3#)
         (LETT |n| |#G65| . #3#))))
      (LETT |d|
            (PROG1 (LETT #2# (- |n| |m|) . #3#)
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (COND
       ((SPADCALL |d| 1 (QREFELT $ 96))
        (LETT |n|
              (PROG1 (LETT #1# (+ (RANDOM |d|) |m|) . #3#)
                (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
              . #3#)))
      (EXIT (SPADCALL |n| (QREFELT $ 108))))))) 

(DECLAIM (NOTINLINE |FiniteFieldPolynomialPackage;|)) 

(DEFUN |FiniteFieldPolynomialPackage| (#1=#:G753)
  (PROG ()
    (RETURN
     (PROG (#2=#:G754)
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
              (PROG1 (|FiniteFieldPolynomialPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|FiniteFieldPolynomialPackage|))))))))))) 

(DEFUN |FiniteFieldPolynomialPackage;| (|#1|)
  (PROG (#1=#:G160 |pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|FiniteFieldPolynomialPackage|))
      (LETT |dv$| (LIST '|FiniteFieldPolynomialPackage| DV$1) . #2#)
      (LETT $ (GETREFV 111) . #2#)
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
                  (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))
      $)))) 

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
              (121 . |matrix|) (126 . |transpose|) (|ModMonic| 6 11)
              (131 . |One|) (|Fraction| 7) (135 . |One|) (|Fraction| 11)
              (139 . |One|) (|Integer|) (143 . |setelt|) (151 . |horizConcat|)
              (|List| 36) (157 . |nullSpace|) (162 . |elt|) (168 . |elt|)
              (174 . =) |FFPOLY;leastAffineMultiple;2Sup;4|
              (|IntegerNumberTheoryFunctions|) (180 . |moebiusMu|) (|List| 50)
              (185 . |divisors|) (|PositiveInteger|) (190 . ^)
              |FFPOLY;numberOfIrreduciblePoly;2Pi;5| (196 . |eulerPhi|)
              |FFPOLY;numberOfPrimitivePoly;2Pi;6| (201 . |characteristic|)
              (205 . ~=) |FFPOLY;numberOfNormalPoly;2Pi;7| (211 . ~=) (217 . ^)
              (|Factored| $) (223 . |factor|)
              (|Record| (|:| |factor| 50) (|:| |exponent| 50)) (|List| 75)
              (|Factored| 50) (228 . |factors|) (233 . =)
              |FFPOLY;primitive?;SupB;8| (|DistinctDegreeFactorize| 6 11)
              (239 . |irreducible?|) (244 . |rank|) |FFPOLY;normal?;SupB;9|
              (|List| 8) (249 . |#|) (254 . |setfirst!|) (260 . |inv|)
              (265 . |new|) (271 . |lookup|) (276 . |index|)
              (|Union| 11 '"failed") |FFPOLY;nextIrreduciblePoly;SupU;11|
              (281 . |primitive?|) (286 . *) (292 . >)
              |FFPOLY;nextPrimitivePoly;SupU;12|
              |FFPOLY;nextNormalPoly;SupU;13|
              |FFPOLY;nextNormalPrimitivePoly;SupU;14|
              |FFPOLY;nextPrimitiveNormalPoly;SupU;15|
              |FFPOLY;createIrreduciblePoly;PiSup;16|
              (298 . |primitiveElement|) |FFPOLY;createPrimitivePoly;PiSup;17|
              |FFPOLY;createNormalPoly;PiSup;18|
              |FFPOLY;createNormalPrimitivePoly;PiSup;19|
              |FFPOLY;createPrimitiveNormalPoly;PiSup;20| (302 . |random|)
              |FFPOLY;random;PiSup;21| (306 . >) |FFPOLY;random;2PiSup;22|)
           '#(|reducedQPowers| 312 |random| 317 |primitive?| 328
              |numberOfPrimitivePoly| 333 |numberOfNormalPoly| 338
              |numberOfIrreduciblePoly| 343 |normal?| 348 |nextPrimitivePoly|
              353 |nextPrimitiveNormalPoly| 358 |nextNormalPrimitivePoly| 363
              |nextNormalPoly| 368 |nextIrreduciblePoly| 373
              |leastAffineMultiple| 378 |createPrimitivePoly| 383
              |createPrimitiveNormalPoly| 388 |createNormalPrimitivePoly| 393
              |createNormalPoly| 398 |createIrreduciblePoly| 403)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 110
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
                                                   1 41 0 40 42 1 41 0 0 43 0
                                                   44 0 45 0 46 0 47 0 48 0 49
                                                   4 41 6 0 50 50 6 51 2 41 0 0
                                                   0 52 1 41 53 0 54 2 53 36 0
                                                   50 55 2 36 6 0 50 56 2 6 28
                                                   0 0 57 1 59 50 50 60 1 59 61
                                                   50 62 2 63 0 0 63 64 1 59 50
                                                   50 66 0 6 8 68 2 8 28 0 0 69
                                                   2 6 28 0 0 71 2 7 0 0 63 72
                                                   1 50 73 0 74 1 77 76 0 78 2
                                                   11 28 0 0 79 1 81 28 11 82 1
                                                   41 8 0 83 1 85 8 0 86 2 85 8
                                                   0 8 87 1 6 0 0 88 2 85 0 8 8
                                                   89 1 6 63 0 90 1 6 0 63 91 1
                                                   6 28 0 94 2 6 0 50 0 95 2 8
                                                   28 0 0 96 0 6 0 102 0 6 0
                                                   107 2 63 28 0 0 109 1 0 34
                                                   11 35 1 0 11 63 108 2 0 11
                                                   63 63 110 1 0 28 11 80 1 0
                                                   63 63 67 1 0 63 63 70 1 0 63
                                                   63 65 1 0 28 11 84 1 0 92 11
                                                   97 1 0 92 11 100 1 0 92 11
                                                   99 1 0 92 11 98 1 0 92 11 93
                                                   1 0 11 11 58 1 0 11 63 103 1
                                                   0 11 63 106 1 0 11 63 105 1
                                                   0 11 63 104 1 0 11 63
                                                   101)))))
           '|lookupComplete|)) 
