
(SDEFUN |UNIFACT;factor;ZPF;1| ((|m| ZP) ($ |Factored| ZP))
        (SPROG
         ((#1=#:G142 NIL) (|u| NIL) (#2=#:G141 NIL)
          (|ctp|
           (|Record| (|:| |unit| (|Integer|)) (|:| |canonical| (|Integer|))
                     (|:| |associate| (|Integer|))))
          (|flist|
           (|Record| (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| ZP)
                                     (|:| |pow| (|Integer|))))))))
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
                       (SEQ (LETT |u| NIL . #3#)
                            (LETT #1# (QCDR |flist|) . #3#) G190
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
                     (QREFELT $ 19)))))) 

(SDEFUN |UNIFACT;factorSquareFree;ZPF;2| ((|m| ZP) ($ |Factored| ZP))
        (SPROG
         ((#1=#:G156 NIL) (|u| NIL) (#2=#:G155 NIL)
          (|ctp|
           (|Record| (|:| |unit| (|Integer|)) (|:| |canonical| (|Integer|))
                     (|:| |associate| (|Integer|))))
          (|flist|
           (|Record| (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| ZP)
                                     (|:| |pow| (|Integer|))))))))
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
                       (SEQ (LETT |u| NIL . #3#)
                            (LETT #1# (QCDR |flist|) . #3#) G190
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
                     (QREFELT $ 19)))))) 

(SDEFUN |UNIFACT;sqroot| ((|t| . #1=(|Integer|)) ($ |Integer|))
        (SPROG ((|s| #1#))
               (SEQ
                (COND ((SPADCALL |t| 0 (QREFELT $ 23)) 0)
                      ('T
                       (SEQ (LETT |s| |t| . #2=(|UNIFACT;sqroot|))
                            (LETT |s| (SPADCALL |s| (QREFELT $ 25)) . #2#)
                            (LETT |t| |s| . #2#) (EXIT |t|))))))) 

(SDEFUN |UNIFACT;eisenstein| ((|m| ZP) ($ |Boolean|))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G170 NIL) (|r| NIL)
          (|fc| (|Factored| (|Integer|))) (|trail| #3=(|Integer|)) (|lead| #3#)
          (|c| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL (SPADCALL |m| (QREFELT $ 26)) (QREFELT $ 27))
                  . #4=(|UNIFACT;eisenstein|))
            (EXIT
             (COND ((OR (EQL |c| 0) (EQL |c| 1)) 'NIL)
                   ('T
                    (SEQ (LETT |lead| (SPADCALL |m| (QREFELT $ 29)) . #4#)
                         (LETT |trail| |lead| . #4#)
                         (LETT |m| (SPADCALL |m| (QREFELT $ 26)) . #4#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |m| (|spadConstant| $ 22)
                                           (QREFELT $ 30)))
                                (GO G191)))
                              (SEQ
                               (LETT |trail| (SPADCALL |m| (QREFELT $ 29))
                                     . #4#)
                               (EXIT
                                (LETT |m| (SPADCALL |m| (QREFELT $ 26))
                                      . #4#)))
                              NIL (GO G190) G191 (EXIT NIL))
                         (LETT |fc| (SPADCALL |c| (QREFELT $ 32)) . #4#)
                         (SEQ (LETT |r| NIL . #4#)
                              (LETT #2# (SPADCALL |fc| (QREFELT $ 36)) . #4#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (QCDR |r|) 1)
                                  (COND
                                   ((SPADCALL 0 (REM |lead| (QCAR |r|))
                                              (QREFELT $ 37))
                                    (COND
                                     ((SPADCALL 0
                                                (REM |trail|
                                                     (EXPT (QCAR |r|) 2))
                                                (QREFELT $ 37))
                                      (PROGN
                                       (LETT #1# 'T . #4#)
                                       (GO #5=#:G168))))))))))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 'NIL)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |UNIFACT;negShiftz|
        ((|n| |Integer|) (|Modulus| |PositiveInteger|) ($ |Integer|))
        (SEQ
         (COND ((< |n| 0) (LETT |n| (+ |n| |Modulus|) |UNIFACT;negShiftz|)))
         (EXIT
          (COND
           ((SPADCALL |n| (QUOTIENT2 |Modulus| 2) (QREFELT $ 38))
            (- |n| |Modulus|))
           ('T |n|))))) 

(SDEFUN |UNIFACT;negShiftp| ((|pp| ZP) (|Modulus| |PositiveInteger|) ($ ZP))
        (SPROG NIL
               (SPADCALL (CONS #'|UNIFACT;negShiftp!0| (VECTOR $ |Modulus|))
                         |pp| (QREFELT $ 40)))) 

(SDEFUN |UNIFACT;negShiftp!0| ((|x| NIL) ($$ NIL))
        (PROG (|Modulus| $)
          (LETT |Modulus| (QREFELT $$ 1) . #1=(|UNIFACT;negShiftp|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|UNIFACT;negShiftz| |x| |Modulus| $))))) 

(SDEFUN |UNIFACT;bound| ((|m| ZP) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G188 NIL) (|cbound| (|PositiveInteger|))
          (|j| (|PositiveInteger|)) (#2=#:G185 NIL)
          (|bin0| #3=(|NonNegativeInteger|)) (#4=#:G184 NIL) (|bin1| #3#)
          (#5=#:G191 NIL) (#6=#:G183 NIL) (|i| NIL) (#7=#:G181 NIL)
          (|nm| (|NonNegativeInteger|)) (#8=#:G179 NIL) (|norm| (|Integer|))
          (#9=#:G177 NIL) (#10=#:G176 #11=(|Integer|)) (#12=#:G178 #11#)
          (|k| NIL) (|nmq2| (|NonNegativeInteger|))
          (|lcm| (|NonNegativeInteger|)) (#13=#:G175 NIL))
         (SEQ
          (LETT |lcm|
                (PROG1
                    (LETT #13# (ABS (SPADCALL |m| (QREFELT $ 29)))
                          . #14=(|UNIFACT;bound|))
                  (|check_subtype| (>= #13# 0) '(|NonNegativeInteger|) #13#))
                . #14#)
          (LETT |nm| (SPADCALL |m| (QREFELT $ 42)) . #14#)
          (LETT |nmq2| (QUOTIENT2 |nm| 2) . #14#)
          (LETT |norm|
                (|UNIFACT;sqroot|
                 (PROGN
                  (LETT #9# NIL . #14#)
                  (SEQ (LETT |k| 0 . #14#) G190
                       (COND ((|greater_SI| |k| |nm|) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #12# (EXPT (SPADCALL |m| |k| (QREFELT $ 43)) 2)
                                . #14#)
                          (COND (#9# (LETT #10# (+ #10# #12#) . #14#))
                                ('T
                                 (PROGN
                                  (LETT #10# #12# . #14#)
                                  (LETT #9# 'T . #14#)))))))
                       (LETT |k| (|inc_SI| |k|) . #14#) (GO G190) G191
                       (EXIT NIL))
                  (COND (#9# #10#) (#15='T 0)))
                 $)
                . #14#)
          (COND
           ((SPADCALL |nmq2| 1 (QREFELT $ 44))
            (LETT |nm|
                  (PROG1 (LETT #8# (- |nmq2| 1) . #14#)
                    (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|) #8#))
                  . #14#))
           (#15# (LETT |nm| |nmq2| . #14#)))
          (LETT |bin0| |nm| . #14#)
          (LETT |cbound|
                (PROG1
                    (LETT #7# (+ (SPADCALL |bin0| |norm| (QREFELT $ 45)) |lcm|)
                          . #14#)
                  (|check_subtype| (> #7# 0) '(|PositiveInteger|) #7#))
                . #14#)
          (SEQ (LETT |i| 2 . #14#)
               (LETT #5#
                     (PROG1 (LETT #6# (- |nm| 1) . #14#)
                       (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                        #6#))
                     . #14#)
               G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |bin1| |bin0| . #14#)
                    (LETT |bin0|
                          (QUOTIENT2
                           (* |bin0|
                              (PROG1 (LETT #4# (- (+ |nm| 1) |i|) . #14#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#)))
                           |i|)
                          . #14#)
                    (LETT |j|
                          (PROG1
                              (LETT #2#
                                    (+ (SPADCALL |bin0| |norm| (QREFELT $ 45))
                                       (* |bin1| |lcm|))
                                    . #14#)
                            (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                             #2#))
                          . #14#)
                    (EXIT
                     (COND ((< |cbound| |j|) (LETT |cbound| |j| . #14#)))))
               (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROG1 (LETT #1# (* (* 2 |cbound|) |lcm|) . #14#)
             (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))))) 

(SDEFUN |UNIFACT;remp| ((|t| |Integer|) (|q| |PositiveInteger|) ($ |Integer|))
        (SEQ (LETT |t| (REM |t| |q|) |UNIFACT;remp|)
             (EXIT (COND ((< |t| 0) (+ |t| |q|)) ('T |t|))))) 

(SDEFUN |UNIFACT;numFactors|
        ((|ddlist| |List|
          (|Record| (|:| |factor| ZP) (|:| |degree| (|Integer|))))
         ($ |Integer|))
        (SPROG
         ((|ans| (|Integer|)) (#1=#:G196 NIL) (|d| (|NonNegativeInteger|))
          (#2=#:G202 NIL) (|dd| NIL))
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
              (EXIT |ans|)))) 

(SDEFUN |UNIFACT;choose|
        ((|m| ZP)
         ($ |Record| (|:| |prime| (|PositiveInteger|))
          (|:| |factors|
               (|List|
                (|Record| (|:| |factor| ZP) (|:| |degree| (|Integer|)))))))
        (SPROG
         ((|numberOfFactors| (|Integer|)) (|qSave| (|PositiveInteger|))
          (|ddSave|
           (|List| (|Record| (|:| |factor| ZP) (|:| |degree| (|Integer|)))))
          (|k| (|Integer|)) (|n| (|Integer|))
          (|newdd|
           (|List| (|Record| (|:| |factor| ZP) (|:| |degree| (|Integer|)))))
          (|disc| (ZP)) (|rr| (|Integer|)) (|q| #1=(|PositiveInteger|))
          (|ddRep| #1#) (|lcm| (|Integer|)))
         (SEQ (LETT |qSave| 1 . #2=(|UNIFACT;choose|))
              (LETT |ddSave| NIL . #2#) (LETT |numberOfFactors| 0 . #2#)
              (LETT |lcm| (SPADCALL |m| (QREFELT $ 29)) . #2#)
              (LETT |k| 1 . #2#) (LETT |ddRep| 5 . #2#)
              (LETT |disc| (|spadConstant| $ 22) . #2#) (LETT |q| 2 . #2#)
              (SEQ G190 (COND ((NULL (< |k| |ddRep|)) (GO G191)))
                   (SEQ (LETT |q| (SPADCALL |q| (QREFELT $ 49)) . #2#)
                        (EXIT
                         (COND
                          ((EQL (LETT |rr| (REM |lcm| |q|) . #2#) 0)
                           "next prime")
                          ('T
                           (SEQ
                            (LETT |disc|
                                  (SPADCALL |m| (SPADCALL |m| (QREFELT $ 50))
                                            |q| (QREFELT $ 52))
                                  . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |disc| (QREFELT $ 42)) 0
                                         (QREFELT $ 44))
                               "next prime")
                              ('T
                               (SEQ (LETT |k| (+ |k| 1) . #2#)
                                    (LETT |newdd|
                                          (SPADCALL |m| |q| (QREFELT $ 55))
                                          . #2#)
                                    (LETT |n| (|UNIFACT;numFactors| |newdd| $)
                                          . #2#)
                                    (EXIT
                                     (COND
                                      ((< |n| 9)
                                       (SEQ (LETT |ddSave| |newdd| . #2#)
                                            (LETT |qSave| |q| . #2#)
                                            (EXIT (LETT |k| 5 . #2#))))
                                      ((OR (EQL |numberOfFactors| 0)
                                           (< |n| |numberOfFactors|))
                                       (SEQ (LETT |ddSave| |newdd| . #2#)
                                            (LETT |qSave| |q| . #2#)
                                            (EXIT
                                             (LETT |numberOfFactors| |n|
                                                   . #2#)))))))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |qSave| |ddSave|))))) 

(SDEFUN |UNIFACT;henselfact1| ((|m| ZP) ($ |List| ZP))
        (SPROG
         ((|cbound| (|PositiveInteger|)) (|fl| (|List| ZP))
          (|q| (|PositiveInteger|))
          (|selected|
           (|Record| (|:| |prime| (|PositiveInteger|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |factor| ZP)
                                     (|:| |degree| (|Integer|))))))))
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
              (COND
               ((EQL (|UNIFACT;numFactors| (QCDR |selected|) $) 1) (LIST |m|))
               (#1#
                (SEQ (LETT |q| (QCAR |selected|) . #2#)
                     (LETT |fl| (SPADCALL (QCDR |selected|) |q| (QREFELT $ 58))
                           . #2#)
                     (LETT |cbound| (|UNIFACT;bound| |m| $) . #2#)
                     (EXIT
                      (SPADCALL |m| |fl| |q| |cbound| (QREFELT $ 61))))))))))))) 

(SDEFUN |UNIFACT;henselfact| ((|m| ZP) ($ |List| ZP))
        (SPROG
         ((#1=#:G226 NIL) (#2=#:G225 #3=(|List| ZP)) (#4=#:G227 #3#)
          (#5=#:G232 NIL) (|mm| (ZP)) (|faclist| #3#) (#6=#:G223 NIL)
          (|deggcd| (|NonNegativeInteger|)))
         (SEQ
          (LETT |deggcd| (SPADCALL |m| (QREFELT $ 42))
                . #7=(|UNIFACT;henselfact|))
          (LETT |mm| |m| . #7#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |mm| (QREFELT $ 62)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (LETT |deggcd| (GCD |deggcd| (SPADCALL |mm| (QREFELT $ 42)))
                      . #7#)
                (EXIT (LETT |mm| (SPADCALL |mm| (QREFELT $ 26)) . #7#)))
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
                           (LETT #6# (SPADCALL |m| |deggcd| (QREFELT $ 64))
                                 . #7#)
                           (QCDR #6#)
                         (|check_union| (QEQCAR #6# 0) (QREFELT $ 6) #6#))
                       $)
                      . #7#)
                (EXIT
                 (PROGN
                  (LETT #1# NIL . #7#)
                  (SEQ (LETT |mm| NIL . #7#) (LETT #5# |faclist| . #7#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |mm| (CAR #5#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (|UNIFACT;henselfact1|
                                 (SPADCALL |mm| |deggcd| (QREFELT $ 65)) $)
                                . #7#)
                          (COND (#1# (LETT #2# (APPEND #2# #4#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #2# #4# . #7#)
                                  (LETT #1# 'T . #7#)))))))
                       (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) ('T NIL))))))))))
          (EXIT (|UNIFACT;henselfact1| |m| $))))) 

(SDEFUN |UNIFACT;quadratic| ((|m| ZP) ($ |List| ZP))
        (SPROG
         ((#1=#:G236 NIL) (|m0| (ZP)) (|beta| (|Integer|))
          (|alpha| (|Integer|)) (|d| (|Integer|)) (|d2| (|Integer|)))
         (SEQ
          (LETT |d|
                (- (EXPT (SPADCALL |m| 1 (QREFELT $ 43)) 2)
                   (*
                    (SPADCALL 4 (SPADCALL |m| 0 (QREFELT $ 43)) (QREFELT $ 66))
                    (SPADCALL |m| 2 (QREFELT $ 43))))
                . #2=(|UNIFACT;quadratic|))
          (LETT |d2| (|UNIFACT;sqroot| |d| $) . #2#)
          (EXIT
           (COND
            ((SPADCALL (- |d| (SPADCALL |d2| 2 (QREFELT $ 67))) 0
                       (QREFELT $ 37))
             (LIST |m|))
            ('T
             (SEQ (LETT |alpha| (+ (SPADCALL |m| 1 (QREFELT $ 43)) |d2|) . #2#)
                  (LETT |beta|
                        (SPADCALL 2 (SPADCALL |m| 2 (QREFELT $ 43))
                                  (QREFELT $ 66))
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
                              (LETT #1# (SPADCALL |m| |m0| (QREFELT $ 70))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                           #1#)))))))))))) 

(SDEFUN |UNIFACT;isPowerOf2| ((|n| |Integer|) ($ |Boolean|))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |n| 1) 'T)
                (#1='T
                 (SEQ (LETT |qr| (DIVIDE2 |n| 2) |UNIFACT;isPowerOf2|)
                      (EXIT
                       (COND ((EQL (QCDR |qr|) 1) 'NIL)
                             (#1# (|UNIFACT;isPowerOf2| (QCAR |qr|) $)))))))))) 

(SDEFUN |UNIFACT;subMinusX|
        ((|supPol| |SparseUnivariatePolynomial| (|Integer|)) ($ ZP))
        (SPROG ((|minusX| (|SparseUnivariatePolynomial| (|Integer|))))
               (SEQ
                (LETT |minusX| (SPADCALL -1 1 (QREFELT $ 72))
                      |UNIFACT;subMinusX|)
                (EXIT (SPADCALL |supPol| |minusX| (QREFELT $ 73)))))) 

(SDEFUN |UNIFACT;henselFact;ZPBR;16|
        ((|m| ZP) (|test| |Boolean|)
         ($ |Record| (|:| |contp| (|Integer|))
          (|:| |factors|
               (|List| (|Record| (|:| |irr| ZP) (|:| |pow| (|Integer|)))))))
        (SPROG
         ((|factorlist|
           (|List| (|Record| (|:| |irr| ZP) (|:| |pow| (|Integer|)))))
          (#1=#:G296 NIL) (|pf| NIL) (#2=#:G295 NIL) (|fln| (|List| ZP))
          (#3=#:G294 NIL) (#4=#:G293 NIL) (|pol| (ZP)) (|d1| #5=(|Integer|))
          (#6=#:G292 NIL) (|l1| NIL)
          (|llf| (|List| (|Record| (|:| |factor| ZP) (|:| |exponent| #5#))))
          (|irrFact| (|Factored| ZP)) (#7=#:G291 NIL) (#8=#:G290 NIL)
          (#9=#:G289 NIL) (|v| NIL) (#10=#:G288 NIL) (|lf1| (ZP)) (|lf0| (ZP))
          (|#G35| (ZP)) (|#G34| (ZP)) (|lfq| (|List| ZP)) (|fac| (ZP))
          (#11=#:G287 NIL) (|sfac| NIL) (#12=#:G286 NIL) (|lcPol| (ZP))
          (|d| (|NonNegativeInteger|)) (|c| (|Integer|)) (#13=#:G249 NIL))
         (SEQ (LETT |factorlist| NIL . #14=(|UNIFACT;henselFact;ZPBR;16|))
              (LETT |c| (SPADCALL |m| (QREFELT $ 27)) . #14#)
              (LETT |m|
                    (PROG2 (LETT #13# (SPADCALL |m| |c| (QREFELT $ 74)) . #14#)
                        (QCDR #13#)
                      (|check_union| (QEQCAR #13# 0) (QREFELT $ 6) #13#))
                    . #14#)
              (COND
               ((< (SPADCALL |m| (QREFELT $ 29)) 0)
                (SEQ (LETT |c| (- |c|) . #14#)
                     (EXIT (LETT |m| (SPADCALL |m| (QREFELT $ 75)) . #14#)))))
              (SEQ (LETT |d| (SPADCALL |m| (QREFELT $ 76)) . #14#)
                   (EXIT
                    (COND
                     ((SPADCALL |d| 0 (QREFELT $ 63))
                      (SEQ
                       (LETT |m|
                             (QCAR
                              (SPADCALL |m| (SPADCALL 1 |d| (QREFELT $ 68))
                                        (QREFELT $ 78)))
                             . #14#)
                       (EXIT
                        (LETT |factorlist|
                              (LIST (CONS (SPADCALL 1 1 (QREFELT $ 68)) |d|))
                              . #14#)))))))
              (LETT |d| (SPADCALL |m| (QREFELT $ 42)) . #14#)
              (EXIT
               (COND ((EQL |d| 0) (CONS |c| |factorlist|))
                     ((EQL |d| 1) (CONS |c| (CONS (CONS |m| 1) |factorlist|)))
                     (#15='T
                      (COND
                       ((|UNIFACT;eisenstein| |m| $)
                        (CONS |c| (CONS (CONS |m| 1) |factorlist|)))
                       (#15#
                        (SEQ
                         (LETT |lcPol|
                               (SPADCALL (SPADCALL |m| (QREFELT $ 29))
                                         (QREFELT $ 14))
                               . #14#)
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |lcPol| (QREFELT $ 75))
                                      (SPADCALL |m| (QREFELT $ 26))
                                      (QREFELT $ 56))
                            (SEQ
                             (SEQ (LETT |fac| NIL . #14#)
                                  (LETT #12#
                                        (SPADCALL (SPADCALL |m| (QREFELT $ 42))
                                                  (QREFELT $ 81))
                                        . #14#)
                                  G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN
                                         (LETT |fac| (CAR #12#) . #14#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |factorlist|
                                          (CONS (CONS |fac| 1) |factorlist|)
                                          . #14#)))
                                  (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS |c| |factorlist|))))
                           (#15#
                            (SEQ
                             (COND
                              ((ODDP |d|)
                               (COND
                                ((SPADCALL |lcPol|
                                           (SPADCALL |m| (QREFELT $ 26))
                                           (QREFELT $ 56))
                                 (EXIT
                                  (SEQ
                                   (SEQ (LETT |sfac| NIL . #14#)
                                        (LETT #11#
                                              (SPADCALL
                                               (SPADCALL |m| (QREFELT $ 42))
                                               (QREFELT $ 81))
                                              . #14#)
                                        G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |sfac| (CAR #11#) . #14#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |fac|
                                               (|UNIFACT;subMinusX| |sfac| $)
                                               . #14#)
                                         (COND
                                          ((< (SPADCALL |fac| (QREFELT $ 29))
                                              0)
                                           (LETT |fac|
                                                 (SPADCALL |fac|
                                                           (QREFELT $ 75))
                                                 . #14#)))
                                         (EXIT
                                          (LETT |factorlist|
                                                (CONS (CONS |fac| 1)
                                                      |factorlist|)
                                                . #14#)))
                                        (LETT #11# (CDR #11#) . #14#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (CONS |c| |factorlist|))))))))
                             (COND
                              ((|UNIFACT;isPowerOf2| |d| $)
                               (COND
                                ((SPADCALL |lcPol|
                                           (SPADCALL |m| (QREFELT $ 26))
                                           (QREFELT $ 56))
                                 (EXIT
                                  (SEQ
                                   (LETT |factorlist|
                                         (CONS (CONS |m| 1) |factorlist|)
                                         . #14#)
                                   (EXIT (CONS |c| |factorlist|))))))))
                             (EXIT
                              (COND
                               ((EQL |d| 2)
                                (SEQ
                                 (LETT |lfq| (|UNIFACT;quadratic| |m| $)
                                       . #14#)
                                 (EXIT
                                  (COND
                                   ((EQL (LENGTH |lfq|) 1)
                                    (CONS |c|
                                          (CONS (CONS (|SPADfirst| |lfq|) 1)
                                                |factorlist|)))
                                   (#15#
                                    (SEQ
                                     (PROGN
                                      (LETT |#G34| (|SPADfirst| |lfq|) . #14#)
                                      (LETT |#G35|
                                            (SPADCALL |lfq| (QREFELT $ 82))
                                            . #14#)
                                      (LETT |lf0| |#G34| . #14#)
                                      (LETT |lf1| |#G35| . #14#))
                                     (COND
                                      ((SPADCALL |lf0| |lf1| (QREFELT $ 56))
                                       (LETT |factorlist|
                                             (CONS (CONS |lf0| 2) |factorlist|)
                                             . #14#))
                                      (#15#
                                       (LETT |factorlist|
                                             (APPEND
                                              (PROGN
                                               (LETT #10# NIL . #14#)
                                               (SEQ (LETT |v| NIL . #14#)
                                                    (LETT #9# |lfq| . #14#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #9#)
                                                          (PROGN
                                                           (LETT |v| (CAR #9#)
                                                                 . #14#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #10#
                                                            (CONS (CONS |v| 1)
                                                                  #10#)
                                                            . #14#)))
                                                    (LETT #9# (CDR #9#) . #14#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #10#))))
                                              |factorlist|)
                                             . #14#)))
                                     (EXIT (CONS |c| |factorlist|))))))))
                               (|test|
                                (SEQ
                                 (LETT |fln| (|UNIFACT;henselfact| |m| $)
                                       . #14#)
                                 (EXIT
                                  (CONS |c|
                                        (APPEND |factorlist|
                                                (PROGN
                                                 (LETT #8# NIL . #14#)
                                                 (SEQ (LETT |pf| NIL . #14#)
                                                      (LETT #7# |fln| . #14#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #7#)
                                                            (PROGN
                                                             (LETT |pf|
                                                                   (CAR #7#)
                                                                   . #14#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #8#
                                                              (CONS
                                                               (CONS |pf| 1)
                                                               #8#)
                                                              . #14#)))
                                                      (LETT #7# (CDR #7#)
                                                            . #14#)
                                                      (GO G190) G191
                                                      (EXIT
                                                       (NREVERSE #8#)))))))))
                               (#15#
                                (SEQ
                                 (LETT |irrFact| (SPADCALL |m| (QREFELT $ 83))
                                       . #14#)
                                 (LETT |llf|
                                       (SPADCALL |irrFact| (QREFELT $ 86))
                                       . #14#)
                                 (SEQ (LETT |l1| NIL . #14#)
                                      (LETT #6# |llf| . #14#) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |l1| (CAR #6#) . #14#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ (LETT |d1| (QCDR |l1|) . #14#)
                                           (LETT |pol| (QCAR |l1|) . #14#)
                                           (EXIT
                                            (COND
                                             ((EQL
                                               (SPADCALL |pol| (QREFELT $ 42))
                                               1)
                                              (LETT |factorlist|
                                                    (CONS (CONS |pol| |d1|)
                                                          |factorlist|)
                                                    . #14#))
                                             ((EQL
                                               (SPADCALL |pol| (QREFELT $ 42))
                                               2)
                                              (SEQ
                                               (LETT |fln|
                                                     (|UNIFACT;quadratic| |pol|
                                                      $)
                                                     . #14#)
                                               (EXIT
                                                (LETT |factorlist|
                                                      (APPEND
                                                       (PROGN
                                                        (LETT #4# NIL . #14#)
                                                        (SEQ
                                                         (LETT |pf| NIL . #14#)
                                                         (LETT #3# |fln|
                                                               . #14#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #3#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #3#)
                                                                      . #14#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #4#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |d1|)
                                                                  #4#)
                                                                 . #14#)))
                                                         (LETT #3# (CDR #3#)
                                                               . #14#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #4#))))
                                                       |factorlist|)
                                                      . #14#))))
                                             ('T
                                              (SEQ
                                               (LETT |fln|
                                                     (|UNIFACT;henselfact|
                                                      |pol| $)
                                                     . #14#)
                                               (EXIT
                                                (LETT |factorlist|
                                                      (APPEND
                                                       (PROGN
                                                        (LETT #2# NIL . #14#)
                                                        (SEQ
                                                         (LETT |pf| NIL . #14#)
                                                         (LETT #1# |fln|
                                                               . #14#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #1#)
                                                               (PROGN
                                                                (LETT |pf|
                                                                      (CAR #1#)
                                                                      . #14#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #2#
                                                                 (CONS
                                                                  (CONS |pf|
                                                                        |d1|)
                                                                  #2#)
                                                                 . #14#)))
                                                         (LETT #1# (CDR #1#)
                                                               . #14#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #2#))))
                                                       |factorlist|)
                                                      . #14#)))))))
                                      (LETT #6# (CDR #6#) . #14#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (CONS |c| |factorlist|))))))))))))))))))) 

(DECLAIM (NOTINLINE |UnivariateFactorize;|)) 

(DEFUN |UnivariateFactorize| (#1=#:G297)
  (SPROG NIL
         (PROG (#2=#:G298)
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
                  (HREM |$ConstructorCache| '|UnivariateFactorize|)))))))))) 

(DEFUN |UnivariateFactorize;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
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
          $))) 

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
