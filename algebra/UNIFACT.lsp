
(/VERSIONCHECK 2) 

(DEFUN |UNIFACT;factor;ZPF;1| (|m| $)
  (PROG (#1=#:G164 |u| #2=#:G163 |ctp| |flist|)
    (RETURN
     (SEQ
      (LETT |flist| (SPADCALL |m| 'NIL (QREFELT $ 10))
            . #3=(|UNIFACT;factor;ZPF;1|))
      (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 13)) . #3#)
      (EXIT
       (SPADCALL (SPADCALL (QVELT |ctp| 0) (QREFELT $ 14))
                 (CONS
                  (VECTOR (CONS 0 "nil")
                          (SPADCALL (QVELT |ctp| 1) (QREFELT $ 14)) 1)
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |u| NIL . #3#) (LETT #1# (QCDR |flist|) . #3#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (VECTOR (CONS 3 "prime") (QCAR |u|)
                                         (QCDR |u|))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 19))))))) 

(DEFUN |UNIFACT;factorSquareFree;ZPF;2| (|m| $)
  (PROG (#1=#:G178 |u| #2=#:G177 |ctp| |flist|)
    (RETURN
     (SEQ
      (LETT |flist| (SPADCALL |m| 'T (QREFELT $ 10))
            . #3=(|UNIFACT;factorSquareFree;ZPF;2|))
      (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT $ 13)) . #3#)
      (EXIT
       (SPADCALL (SPADCALL (QVELT |ctp| 0) (QREFELT $ 14))
                 (CONS
                  (VECTOR (CONS 0 "nil")
                          (SPADCALL (QVELT |ctp| 1) (QREFELT $ 14)) 1)
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |u| NIL . #3#) (LETT #1# (QCDR |flist|) . #3#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (VECTOR (CONS 3 "prime") (QCAR |u|)
                                         (QCDR |u|))
                                 #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
                 (QREFELT $ 19))))))) 

(DEFUN |UNIFACT;sqroot| (|t| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |t| 0 (QREFELT $ 23)) 0)
            ('T
             (SEQ (LETT |s| |t| . #1=(|UNIFACT;sqroot|))
                  (LETT |s| (SPADCALL |s| (QREFELT $ 25)) . #1#)
                  (LETT |t| |s| . #1#) (EXIT |t|)))))))) 

(DEFUN |UNIFACT;eisenstein| (|m| $)
  (PROG (#1=#:G190 #2=#:G191 |r| |fc| |trail| |lead| |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c| (SPADCALL (SPADCALL |m| (QREFELT $ 26)) (QREFELT $ 27))
              . #3=(|UNIFACT;eisenstein|))
        (EXIT
         (COND ((OR (EQL |c| 0) (EQL |c| 1)) 'NIL)
               ('T
                (SEQ (LETT |lead| (SPADCALL |m| (QREFELT $ 29)) . #3#)
                     (LETT |trail| |lead| . #3#)
                     (LETT |m| (SPADCALL |m| (QREFELT $ 26)) . #3#)
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL |m| (|spadConstant| $ 22)
                                       (QREFELT $ 30)))
                            (GO G191)))
                          (SEQ
                           (LETT |trail| (SPADCALL |m| (QREFELT $ 29)) . #3#)
                           (EXIT
                            (LETT |m| (SPADCALL |m| (QREFELT $ 26)) . #3#)))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |fc| (SPADCALL |c| (QREFELT $ 32)) . #3#)
                     (SEQ (LETT |r| NIL . #3#)
                          (LETT #2# (SPADCALL |fc| (QREFELT $ 36)) . #3#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL (QCDR |r|) 1)
                              (COND
                               ((SPADCALL 0 (REM |lead| (QCAR |r|))
                                          (QREFELT $ 37))
                                (COND
                                 ((SPADCALL 0 (REM |trail| (EXPT (QCAR |r|) 2))
                                            (QREFELT $ 37))
                                  (PROGN (LETT #1# 'T . #3#) (GO #1#))))))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |UNIFACT;negShiftz| (|n| |Modulus| $)
  (SEQ (COND ((< |n| 0) (LETT |n| (+ |n| |Modulus|) |UNIFACT;negShiftz|)))
       (EXIT
        (COND
         ((SPADCALL |n| (QUOTIENT2 |Modulus| 2) (QREFELT $ 38))
          (- |n| |Modulus|))
         ('T |n|))))) 

(DEFUN |UNIFACT;negShiftp| (|pp| |Modulus| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|UNIFACT;negShiftp!0| (VECTOR $ |Modulus|)) |pp|
               (QREFELT $ 40))))) 

(DEFUN |UNIFACT;negShiftp!0| (|x| $$)
  (PROG (|Modulus| $)
    (LETT |Modulus| (QREFELT $$ 1) . #1=(|UNIFACT;negShiftp|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|UNIFACT;negShiftz| |x| |Modulus| $))))) 

(DEFUN |UNIFACT;bound| (|m| $)
  (PROG (#1=#:G209 |cbound| |j| #2=#:G206 |bin0| #3=#:G205 |bin1| #4=#:G212
         #5=#:G204 |i| #6=#:G202 |nm| #7=#:G200 |norm| #8=#:G198 #9=#:G197
         #10=#:G199 |k| |nmq2| |lcm| #11=#:G196)
    (RETURN
     (SEQ
      (LETT |lcm|
            (PROG1
                (LETT #11# (ABS (SPADCALL |m| (QREFELT $ 29)))
                      . #12=(|UNIFACT;bound|))
              (|check_subtype| (>= #11# 0) '(|NonNegativeInteger|) #11#))
            . #12#)
      (LETT |nm| (SPADCALL |m| (QREFELT $ 42)) . #12#)
      (LETT |nmq2| (QUOTIENT2 |nm| 2) . #12#)
      (LETT |norm|
            (|UNIFACT;sqroot|
             (PROGN
              (LETT #8# NIL . #12#)
              (SEQ (LETT |k| 0 . #12#) G190
                   (COND ((|greater_SI| |k| |nm|) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #10# (EXPT (SPADCALL |m| |k| (QREFELT $ 43)) 2)
                            . #12#)
                      (COND (#8# (LETT #9# (+ #9# #10#) . #12#))
                            ('T
                             (PROGN
                              (LETT #9# #10# . #12#)
                              (LETT #8# 'T . #12#)))))))
                   (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191 (EXIT NIL))
              (COND (#8# #9#) (#13='T 0)))
             $)
            . #12#)
      (COND
       ((SPADCALL |nmq2| 1 (QREFELT $ 44))
        (LETT |nm|
              (PROG1 (LETT #7# (- |nmq2| 1) . #12#)
                (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
              . #12#))
       (#13# (LETT |nm| |nmq2| . #12#)))
      (LETT |bin0| |nm| . #12#)
      (LETT |cbound|
            (PROG1
                (LETT #6# (+ (SPADCALL |bin0| |norm| (QREFELT $ 45)) |lcm|)
                      . #12#)
              (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
            . #12#)
      (SEQ (LETT |i| 2 . #12#)
           (LETT #4#
                 (PROG1 (LETT #5# (- |nm| 1) . #12#)
                   (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                 . #12#)
           G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
           (SEQ (LETT |bin1| |bin0| . #12#)
                (LETT |bin0|
                      (QUOTIENT2
                       (* |bin0|
                          (PROG1 (LETT #3# (- (+ |nm| 1) |i|) . #12#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#)))
                       |i|)
                      . #12#)
                (LETT |j|
                      (PROG1
                          (LETT #2#
                                (+ (SPADCALL |bin0| |norm| (QREFELT $ 45))
                                   (* |bin1| |lcm|))
                                . #12#)
                        (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                      . #12#)
                (EXIT (COND ((< |cbound| |j|) (LETT |cbound| |j| . #12#)))))
           (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROG1 (LETT #1# (* (* 2 |cbound|) |lcm|) . #12#)
         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DEFUN |UNIFACT;remp| (|t| |q| $)
  (SEQ (LETT |t| (REM |t| |q|) |UNIFACT;remp|)
       (EXIT (COND ((< |t| 0) (+ |t| |q|)) ('T |t|))))) 

(DEFUN |UNIFACT;numFactors| (|ddlist| $)
  (PROG (|ans| #1=#:G217 |d| #2=#:G223 |dd|)
    (RETURN
     (SEQ (LETT |ans| 0 . #3=(|UNIFACT;numFactors|))
          (SEQ (LETT |dd| NIL . #3#) (LETT #2# |ddlist| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |dd| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL (QCAR |dd|) (QREFELT $ 42)) . #3#)
                    (EXIT
                     (COND ((EQL |d| 0) NIL)
                           ('T
                            (LETT |ans|
                                  (+ |ans|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |d| (QCDR |dd|)
                                                         (QREFELT $ 47))
                                               . #3#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Integer|) #1#)))
                                  . #3#)))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |UNIFACT;choose| (|m| $)
  (PROG (|numberOfFactors| |qSave| |ddSave| |k| |n| |newdd| |disc| |rr| |q|
         |ddRep| |lcm|)
    (RETURN
     (SEQ (LETT |qSave| 1 . #1=(|UNIFACT;choose|)) (LETT |ddSave| NIL . #1#)
          (LETT |numberOfFactors| 0 . #1#)
          (LETT |lcm| (SPADCALL |m| (QREFELT $ 29)) . #1#) (LETT |k| 1 . #1#)
          (LETT |ddRep| 5 . #1#) (LETT |disc| (|spadConstant| $ 22) . #1#)
          (LETT |q| 2 . #1#)
          (SEQ G190 (COND ((NULL (< |k| |ddRep|)) (GO G191)))
               (SEQ (LETT |q| (SPADCALL |q| (QREFELT $ 49)) . #1#)
                    (LETT |rr| (REM |lcm| |q|) . #1#)
                    (EXIT
                     (COND ((EQL |rr| 0) "next prime")
                           ('T
                            (SEQ
                             (LETT |disc|
                                   (SPADCALL |m| (SPADCALL |m| (QREFELT $ 50))
                                             |q| (QREFELT $ 52))
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL (SPADCALL |disc| (QREFELT $ 42)) 0
                                          (QREFELT $ 44))
                                "next prime")
                               ('T
                                (SEQ (LETT |k| (+ |k| 1) . #1#)
                                     (LETT |newdd|
                                           (SPADCALL |m| |q| (QREFELT $ 55))
                                           . #1#)
                                     (LETT |n| (|UNIFACT;numFactors| |newdd| $)
                                           . #1#)
                                     (EXIT
                                      (COND
                                       ((< |n| 9)
                                        (SEQ (LETT |ddSave| |newdd| . #1#)
                                             (LETT |qSave| |q| . #1#)
                                             (EXIT (LETT |k| 5 . #1#))))
                                       ((OR (EQL |numberOfFactors| 0)
                                            (< |n| |numberOfFactors|))
                                        (SEQ (LETT |ddSave| |newdd| . #1#)
                                             (LETT |qSave| |q| . #1#)
                                             (EXIT
                                              (LETT |numberOfFactors| |n|
                                                    . #1#)))))))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |qSave| |ddSave|)))))) 

(DEFUN |UNIFACT;henselfact1| (|m| $)
  (PROG (|cbound| |fl| |q| |selected|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (SPADCALL |m| (QREFELT $ 42)))
        (COND ((SPADCALL |m| (|spadConstant| $ 28) (QREFELT $ 56)) NIL)
              (#1='T (LIST |m|))))
       (#1#
        (SEQ
         (LETT |selected| (|UNIFACT;choose| |m| $)
               . #2=(|UNIFACT;henselfact1|))
         (EXIT
          (COND ((EQL (|UNIFACT;numFactors| (QCDR |selected|) $) 1) (LIST |m|))
                (#1#
                 (SEQ (LETT |q| (QCAR |selected|) . #2#)
                      (LETT |fl|
                            (SPADCALL (QCDR |selected|) |q| (QREFELT $ 58))
                            . #2#)
                      (LETT |cbound| (|UNIFACT;bound| |m| $) . #2#)
                      (EXIT
                       (SPADCALL |m| |fl| |q| |cbound|
                                 (QREFELT $ 61)))))))))))))) 

(DEFUN |UNIFACT;henselfact| (|m| $)
  (PROG (#1=#:G247 #2=#:G246 #3=#:G248 #4=#:G253 |mm| |faclist| #5=#:G244
         |deggcd|)
    (RETURN
     (SEQ
      (LETT |deggcd| (SPADCALL |m| (QREFELT $ 42)) . #6=(|UNIFACT;henselfact|))
      (LETT |mm| |m| . #6#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |mm| (QREFELT $ 62)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ
            (LETT |deggcd| (GCD |deggcd| (SPADCALL |mm| (QREFELT $ 42))) . #6#)
            (EXIT (LETT |mm| (SPADCALL |mm| (QREFELT $ 26)) . #6#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL |deggcd| 1 (QREFELT $ 63))
        (COND
         ((< |deggcd| (SPADCALL |m| (QREFELT $ 42)))
          (EXIT
           (SEQ
            (LETT |faclist|
                  (|UNIFACT;henselfact1|
                   (PROG2
                       (LETT #5# (SPADCALL |m| |deggcd| (QREFELT $ 64)) . #6#)
                       (QCDR #5#)
                     (|check_union| (QEQCAR #5# 0) (QREFELT $ 6) #5#))
                   $)
                  . #6#)
            (EXIT
             (PROGN
              (LETT #1# NIL . #6#)
              (SEQ (LETT |mm| NIL . #6#) (LETT #4# |faclist| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |mm| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (|UNIFACT;henselfact1|
                             (SPADCALL |mm| |deggcd| (QREFELT $ 65)) $)
                            . #6#)
                      (COND (#1# (LETT #2# (APPEND #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T NIL))))))))))
      (EXIT (|UNIFACT;henselfact1| |m| $)))))) 

(DEFUN |UNIFACT;quadratic| (|m| $)
  (PROG (#1=#:G257 |m0| |beta| |alpha| |d| |d2|)
    (RETURN
     (SEQ
      (LETT |d|
            (- (EXPT (SPADCALL |m| 1 (QREFELT $ 43)) 2)
               (* (SPADCALL 4 (SPADCALL |m| 0 (QREFELT $ 43)) (QREFELT $ 66))
                  (SPADCALL |m| 2 (QREFELT $ 43))))
            . #2=(|UNIFACT;quadratic|))
      (LETT |d2| (|UNIFACT;sqroot| |d| $) . #2#)
      (EXIT
       (COND
        ((SPADCALL (- |d| (SPADCALL |d2| 2 (QREFELT $ 67))) 0 (QREFELT $ 37))
         (LIST |m|))
        ('T
         (SEQ (LETT |alpha| (+ (SPADCALL |m| 1 (QREFELT $ 43)) |d2|) . #2#)
              (LETT |beta|
                    (SPADCALL 2 (SPADCALL |m| 2 (QREFELT $ 43)) (QREFELT $ 66))
                    . #2#)
              (LETT |d| (GCD |alpha| |beta|) . #2#)
              (COND
               ((SPADCALL |d| 1 (QREFELT $ 37))
                (SEQ (LETT |alpha| (QUOTIENT2 |alpha| |d|) . #2#)
                     (EXIT (LETT |beta| (QUOTIENT2 |beta| |d|) . #2#)))))
              (LETT |m0|
                    (SPADCALL (SPADCALL |beta| 1 (QREFELT $ 68))
                              (SPADCALL |alpha| 0 (QREFELT $ 68))
                              (QREFELT $ 69))
                    . #2#)
              (EXIT
               (CONS |m0|
                     (LIST
                      (PROG2
                          (LETT #1# (SPADCALL |m| |m0| (QREFELT $ 70)) . #2#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                       #1#))))))))))))) 

(DEFUN |UNIFACT;isPowerOf2| (|n| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) 'T)
            (#1='T
             (SEQ (LETT |qr| (DIVIDE2 |n| 2) |UNIFACT;isPowerOf2|)
                  (EXIT
                   (COND ((EQL (QCDR |qr|) 1) 'NIL)
                         (#1# (|UNIFACT;isPowerOf2| (QCAR |qr|) $))))))))))) 

(DEFUN |UNIFACT;subMinusX| (|supPol| $)
  (PROG (|minusX|)
    (RETURN
     (SEQ (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 72)) |UNIFACT;subMinusX|)
          (EXIT (SPADCALL |supPol| |minusX| (QREFELT $ 73))))))) 

(DEFUN |UNIFACT;henselFact;ZPBR;16| (|m| |test| $)
  (PROG (|factorlist| #1=#:G317 |pf| #2=#:G316 |fln| #3=#:G315 #4=#:G314 |pol|
         |d1| #5=#:G313 |l1| |llf| |irrFact| #6=#:G312 #7=#:G311 #8=#:G310 |v|
         #9=#:G309 |lf1| |lf0| |#G35| |#G34| |lfq| |fac| #10=#:G308 |sfac|
         #11=#:G307 |lcPol| |d| |c| #12=#:G270)
    (RETURN
     (SEQ (LETT |factorlist| NIL . #13=(|UNIFACT;henselFact;ZPBR;16|))
          (LETT |c| (SPADCALL |m| (QREFELT $ 27)) . #13#)
          (LETT |m|
                (PROG2 (LETT #12# (SPADCALL |m| |c| (QREFELT $ 74)) . #13#)
                    (QCDR #12#)
                  (|check_union| (QEQCAR #12# 0) (QREFELT $ 6) #12#))
                . #13#)
          (COND
           ((< (SPADCALL |m| (QREFELT $ 29)) 0)
            (SEQ (LETT |c| (- |c|) . #13#)
                 (EXIT (LETT |m| (SPADCALL |m| (QREFELT $ 75)) . #13#)))))
          (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 76)) . #13#)
               (EXIT
                (COND
                 ((SPADCALL |d| 0 (QREFELT $ 63))
                  (SEQ
                   (LETT |m|
                         (QCAR
                          (SPADCALL |m| (SPADCALL 1 |d| (QREFELT $ 68))
                                    (QREFELT $ 78)))
                         . #13#)
                   (EXIT
                    (LETT |factorlist|
                          (LIST (CONS (SPADCALL 1 1 (QREFELT $ 68)) |d|))
                          . #13#)))))))
          (LETT |d| (SPADCALL |m| (QREFELT $ 42)) . #13#)
          (EXIT
           (COND ((EQL |d| 0) (CONS |c| |factorlist|))
                 ((EQL |d| 1) (CONS |c| (CONS (CONS |m| 1) |factorlist|)))
                 (#14='T
                  (COND
                   ((|UNIFACT;eisenstein| |m| $)
                    (CONS |c| (CONS (CONS |m| 1) |factorlist|)))
                   (#14#
                    (SEQ
                     (LETT |lcPol|
                           (SPADCALL (SPADCALL |m| (QREFELT $ 29))
                                     (QREFELT $ 14))
                           . #13#)
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 75))
                                  (SPADCALL |m| (QREFELT $ 26)) (QREFELT $ 56))
                        (SEQ
                         (SEQ (LETT |fac| NIL . #13#)
                              (LETT #11#
                                    (SPADCALL (SPADCALL |m| (QREFELT $ 42))
                                              (QREFELT $ 81))
                                    . #13#)
                              G190
                              (COND
                               ((OR (ATOM #11#)
                                    (PROGN (LETT |fac| (CAR #11#) . #13#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |factorlist|
                                      (CONS (CONS |fac| 1) |factorlist|)
                                      . #13#)))
                              (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS |c| |factorlist|))))
                       (#14#
                        (SEQ
                         (COND
                          ((ODDP |d|)
                           (COND
                            ((SPADCALL |lcPol| (SPADCALL |m| (QREFELT $ 26))
                                       (QREFELT $ 56))
                             (EXIT
                              (SEQ
                               (SEQ (LETT |sfac| NIL . #13#)
                                    (LETT #10#
                                          (SPADCALL
                                           (SPADCALL |m| (QREFELT $ 42))
                                           (QREFELT $ 81))
                                          . #13#)
                                    G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN
                                           (LETT |sfac| (CAR #10#) . #13#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |fac| (|UNIFACT;subMinusX| |sfac| $)
                                           . #13#)
                                     (COND
                                      ((< (SPADCALL |fac| (QREFELT $ 29)) 0)
                                       (LETT |fac|
                                             (SPADCALL |fac| (QREFELT $ 75))
                                             . #13#)))
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS (CONS |fac| 1) |factorlist|)
                                            . #13#)))
                                    (LETT #10# (CDR #10#) . #13#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT (CONS |c| |factorlist|))))))))
                         (COND
                          ((|UNIFACT;isPowerOf2| |d| $)
                           (COND
                            ((SPADCALL |lcPol| (SPADCALL |m| (QREFELT $ 26))
                                       (QREFELT $ 56))
                             (EXIT
                              (SEQ
                               (LETT |factorlist|
                                     (CONS (CONS |m| 1) |factorlist|) . #13#)
                               (EXIT (CONS |c| |factorlist|))))))))
                         (EXIT
                          (COND
                           ((EQL |d| 2)
                            (SEQ
                             (LETT |lfq| (|UNIFACT;quadratic| |m| $) . #13#)
                             (EXIT
                              (COND
                               ((EQL (LENGTH |lfq|) 1)
                                (CONS |c|
                                      (CONS (CONS (|SPADfirst| |lfq|) 1)
                                            |factorlist|)))
                               (#14#
                                (SEQ
                                 (PROGN
                                  (LETT |#G34| (|SPADfirst| |lfq|) . #13#)
                                  (LETT |#G35| (SPADCALL |lfq| (QREFELT $ 82))
                                        . #13#)
                                  (LETT |lf0| |#G34| . #13#)
                                  (LETT |lf1| |#G35| . #13#))
                                 (COND
                                  ((SPADCALL |lf0| |lf1| (QREFELT $ 56))
                                   (LETT |factorlist|
                                         (CONS (CONS |lf0| 2) |factorlist|)
                                         . #13#))
                                  (#14#
                                   (LETT |factorlist|
                                         (APPEND
                                          (PROGN
                                           (LETT #9# NIL . #13#)
                                           (SEQ (LETT |v| NIL . #13#)
                                                (LETT #8# |lfq| . #13#) G190
                                                (COND
                                                 ((OR (ATOM #8#)
                                                      (PROGN
                                                       (LETT |v| (CAR #8#)
                                                             . #13#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #9#
                                                        (CONS (CONS |v| 1) #9#)
                                                        . #13#)))
                                                (LETT #8# (CDR #8#) . #13#)
                                                (GO G190) G191
                                                (EXIT (NREVERSE #9#))))
                                          |factorlist|)
                                         . #13#)))
                                 (EXIT (CONS |c| |factorlist|))))))))
                           (|test|
                            (SEQ
                             (LETT |fln| (|UNIFACT;henselfact| |m| $) . #13#)
                             (EXIT
                              (CONS |c|
                                    (APPEND |factorlist|
                                            (PROGN
                                             (LETT #7# NIL . #13#)
                                             (SEQ (LETT |pf| NIL . #13#)
                                                  (LETT #6# |fln| . #13#) G190
                                                  (COND
                                                   ((OR (ATOM #6#)
                                                        (PROGN
                                                         (LETT |pf| (CAR #6#)
                                                               . #13#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #7#
                                                          (CONS (CONS |pf| 1)
                                                                #7#)
                                                          . #13#)))
                                                  (LETT #6# (CDR #6#) . #13#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #7#)))))))))
                           (#14#
                            (SEQ
                             (LETT |irrFact| (SPADCALL |m| (QREFELT $ 83))
                                   . #13#)
                             (LETT |llf| (SPADCALL |irrFact| (QREFELT $ 86))
                                   . #13#)
                             (SEQ (LETT |l1| NIL . #13#)
                                  (LETT #5# |llf| . #13#) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN
                                         (LETT |l1| (CAR #5#) . #13#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ (LETT |d1| (QCDR |l1|) . #13#)
                                       (LETT |pol| (QCAR |l1|) . #13#)
                                       (EXIT
                                        (COND
                                         ((EQL (SPADCALL |pol| (QREFELT $ 42))
                                               1)
                                          (LETT |factorlist|
                                                (CONS (CONS |pol| |d1|)
                                                      |factorlist|)
                                                . #13#))
                                         ((EQL (SPADCALL |pol| (QREFELT $ 42))
                                               2)
                                          (SEQ
                                           (LETT |fln|
                                                 (|UNIFACT;quadratic| |pol| $)
                                                 . #13#)
                                           (EXIT
                                            (LETT |factorlist|
                                                  (APPEND
                                                   (PROGN
                                                    (LETT #4# NIL . #13#)
                                                    (SEQ (LETT |pf| NIL . #13#)
                                                         (LETT #3# |fln|
                                                               . #13#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #3#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #3#)
                                                                      . #13#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #4#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |d1|)
                                                                  #4#)
                                                                 . #13#)))
                                                         (LETT #3# (CDR #3#)
                                                               . #13#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #4#))))
                                                   |factorlist|)
                                                  . #13#))))
                                         ('T
                                          (SEQ
                                           (LETT |fln|
                                                 (|UNIFACT;henselfact| |pol| $)
                                                 . #13#)
                                           (EXIT
                                            (LETT |factorlist|
                                                  (APPEND
                                                   (PROGN
                                                    (LETT #2# NIL . #13#)
                                                    (SEQ (LETT |pf| NIL . #13#)
                                                         (LETT #1# |fln|
                                                               . #13#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #1#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #1#)
                                                                      . #13#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #2#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |d1|)
                                                                  #2#)
                                                                 . #13#)))
                                                         (LETT #1# (CDR #1#)
                                                               . #13#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #2#))))
                                                   |factorlist|)
                                                  . #13#)))))))
                                  (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS |c| |factorlist|)))))))))))))))))))) 

(DECLAIM (NOTINLINE |UnivariateFactorize;|)) 

(DEFUN |UnivariateFactorize| (#1=#:G318)
  (PROG ()
    (RETURN
     (PROG (#2=#:G319)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|UnivariateFactorize|)
                                           '|domainEqualList|)
                . #3=(|UnivariateFactorize|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|UnivariateFactorize;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UnivariateFactorize|))))))))))) 

(DEFUN |UnivariateFactorize;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariateFactorize|))
      (LETT |dv$| (LIST '|UnivariateFactorize| DV$1) . #1#)
      (LETT $ (GETREFV 87) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnivariateFactorize| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|UnivariateFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |irr| 6) (|:| |pow| 12))
              (|Record| (|:| |contp| 12) (|:| |factors| (|List| 7)))
              (|Boolean|) |UNIFACT;henselFact;ZPBR;16|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Integer|) (0 . |unitNormal|) (5 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 15) (|:| |fctr| 6) (|:| |xpnt| 12))
              (|List| 16) (|Factored| 6) (10 . |makeFR|) |UNIFACT;factor;ZPF;1|
              |UNIFACT;factorSquareFree;ZPF;2| (16 . |Zero|) (20 . <=)
              (|IntegerRoots| 12) (26 . |approxSqrt|) (31 . |reductum|)
              (36 . |content|) (41 . |One|) (45 . |leadingCoefficient|)
              (50 . ~=) (|Factored| $) (56 . |factor|)
              (|Record| (|:| |factor| 12) (|:| |exponent| 12)) (|List| 33)
              (|Factored| 12) (61 . |factors|) (66 . ~=) (72 . >)
              (|Mapping| 12 12) (78 . |map|) (|NonNegativeInteger|)
              (84 . |degree|) (89 . |coefficient|) (95 . ~=) (101 . *)
              (|Union| $ '"failed") (107 . |exquo|) (|IntegerPrimesPackage| 12)
              (113 . |nextPrime|) (118 . |differentiate|)
              (|ModularDistinctDegreeFactorizer| 6) (123 . |gcd|)
              (|Record| (|:| |factor| 6) (|:| |degree| 12)) (|List| 53)
              (130 . |ddFact|) (136 . =) (|List| 6) (142 . |separateFactors|)
              (|PositiveInteger|) (|GeneralHenselPackage| 12 6)
              (148 . |completeHensel|) (156 . |zero?|) (161 . >)
              (167 . |divideExponents|) (173 . |multiplyExponents|) (179 . *)
              (185 . ^) (191 . |monomial|) (197 . +) (203 . |exquo|)
              (|SparseUnivariatePolynomial| 12) (209 . |monomial|)
              (215 . |elt|) (221 . |exquo|) (227 . -) (232 . |minimumDegree|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (237 . |monicDivide|) (|List| 71) (|CyclotomicPolynomialPackage|)
              (243 . |cyclotomicDecomposition|) (248 . |second|)
              (253 . |squareFree|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 12)) (|List| 84)
              (258 . |factors|))
           '#(|henselFact| 263 |factorSquareFree| 269 |factor| 274) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 86
                                                 '(1 12 11 0 13 1 6 0 12 14 2
                                                   18 0 6 17 19 0 6 0 22 2 12 9
                                                   0 0 23 1 24 12 12 25 1 6 0 0
                                                   26 1 6 12 0 27 0 6 0 28 1 6
                                                   12 0 29 2 6 9 0 0 30 1 12 31
                                                   0 32 1 35 34 0 36 2 12 9 0 0
                                                   37 2 12 9 0 0 38 2 6 0 39 0
                                                   40 1 6 41 0 42 2 6 12 0 41
                                                   43 2 41 9 0 0 44 2 12 0 41 0
                                                   45 2 12 46 0 0 47 1 48 12 12
                                                   49 1 6 0 0 50 3 51 6 6 6 12
                                                   52 2 51 54 6 12 55 2 6 9 0 0
                                                   56 2 51 57 54 12 58 4 60 57
                                                   6 57 12 59 61 1 6 9 0 62 2
                                                   41 9 0 0 63 2 6 46 0 41 64 2
                                                   6 0 0 41 65 2 12 0 59 0 66 2
                                                   12 0 0 59 67 2 6 0 12 41 68
                                                   2 6 0 0 0 69 2 6 46 0 0 70 2
                                                   71 0 12 41 72 2 71 0 0 0 73
                                                   2 6 46 0 12 74 1 6 0 0 75 1
                                                   6 41 0 76 2 6 77 0 0 78 1 80
                                                   79 12 81 1 57 6 0 82 1 6 31
                                                   0 83 1 18 85 0 86 2 0 8 6 9
                                                   10 1 0 18 6 21 1 0 18 6
                                                   20)))))
           '|lookupComplete|)) 
