
(SDEFUN |CKP;setSimpMode;2Nni;1|
        ((|i| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPADCALL |i| (QREFELT $ 19))) 

(SDEFUN |CKP;setRedMode;2Nni;2|
        ((|i| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT $ 14) |CKP;setRedMode;2Nni;2|)
                    (SETELT $ 14 |i|) (EXIT |j|)))) 

(SDEFUN |CKP;setOutMode;2Nni;3|
        ((|i| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|j| (|NonNegativeInteger|)))
               (SEQ (LETT |j| (QREFELT $ 16) . #1=(|CKP;setOutMode;2Nni;3|))
                    (COND ((QREFELT $ 15) (LETT |j| (+ |j| 10) . #1#)))
                    (SETELT $ 15 (SPADCALL |i| 10 (QREFELT $ 23)))
                    (COND ((QREFELT $ 15) (SETELT $ 16 (REM |i| 10)))
                          ('T (SETELT $ 16 |i|)))
                    (EXIT |j|)))) 

(SDEFUN |CKP;write| ((|str| |OutputForm|) ($ |Void|))
        (SEQ
         (COND
          ((QREFELT $ 15)
           (SPADCALL (SPADCALL |str| (QREFELT $ 27)) (QREFELT $ 29)))
          ('T (SPADCALL |str| (QREFELT $ 30))))
         (EXIT (SPADCALL (QREFELT $ 31))))) 

(SDEFUN |CKP;outR|
        ((|q| |NonNegativeInteger|) (|s| |NonNegativeInteger|)
         ($ |OutputForm|))
        (COND
         ((ZEROP |s|)
          (SPADCALL (SPADCALL "R" (QREFELT $ 33)) (SPADCALL |q| (QREFELT $ 34))
                    (QREFELT $ 35)))
         ('T
          (SPADCALL (SPADCALL "R" (QREFELT $ 33))
                    (LIST (SPADCALL |q| (QREFELT $ 34))
                          (SPADCALL (SPADCALL |s| (QREFELT $ 34))
                                    (QREFELT $ 36)))
                    (QREFELT $ 38))))) 

(SDEFUN |CKP;outM|
        ((|q| |NonNegativeInteger|) (|s| |NonNegativeInteger|)
         ($ |OutputForm|))
        (COND
         ((ZEROP |s|)
          (SPADCALL (SPADCALL "M" (QREFELT $ 33)) (SPADCALL |q| (QREFELT $ 34))
                    (QREFELT $ 35)))
         ('T
          (SPADCALL (SPADCALL "M" (QREFELT $ 33))
                    (LIST (SPADCALL |q| (QREFELT $ 34))
                          (SPADCALL (SPADCALL |s| (QREFELT $ 34))
                                    (QREFELT $ 36)))
                    (QREFELT $ 38))))) 

(SDEFUN |CKP;info|
        ((|flag| |NonNegativeInteger|) (|q| |NonNegativeInteger|)
         (|s| |NonNegativeInteger|) (|dim| |NonNegativeInteger|) ($ |Void|))
        (SEQ
         (COND ((< (QREFELT $ 16) 4) (SPADCALL (QREFELT $ 31)))
               (#1='T
                (SEQ (|CKP;write| " " $)
                     (COND
                      ((EQL |flag| 1)
                       (|CKP;write|
                        (SPADCALL
                         (LIST "Symbol " (|CKP;outM| |q| |s| $) " involutive! "
                               "Dimension: " (SPADCALL |dim| (QREFELT $ 34)))
                         (QREFELT $ 41))
                        $))
                      ((EQL |flag| 2)
                       (|CKP;write|
                        (SPADCALL
                         (LIST "Symbol " (|CKP;outM| |q| |s| $)
                               " not involutive! " "Dimension: "
                               (SPADCALL |dim| (QREFELT $ 34)))
                         (QREFELT $ 41))
                        $))
                      (#1#
                       (|CKP;write|
                        (SPADCALL
                         (LIST "Equation " (|CKP;outR| |q| |s| $)
                               " not involutive! " "Dimension: "
                               (SPADCALL |dim| (QREFELT $ 34)))
                         (QREFELT $ 41))
                        $)))
                     (EXIT (SPADCALL (QREFELT $ 31)))))))) 

(SDEFUN |CKP;display|
        ((|q| |NonNegativeInteger|) (|s| |NonNegativeInteger|) (|Sys| |List| D)
         (|Symb| |SparseEchelonMatrix| JB D) (|DimRq| |NonNegativeInteger|)
         (|DimMq| |NonNegativeInteger|) ($ |Void|))
        (SEQ
         (COND ((< (QREFELT $ 16) 5) (SPADCALL (QREFELT $ 31)))
               ('T
                (SEQ (|CKP;write| " " $)
                     (|CKP;write| "****************************************" $)
                     (|CKP;write| " " $)
                     (|CKP;write|
                      (SPADCALL "Order: " (SPADCALL |q| (QREFELT $ 34))
                                (QREFELT $ 42))
                      $)
                     (|CKP;write|
                      (SPADCALL "Projections: " (SPADCALL |s| (QREFELT $ 34))
                                (QREFELT $ 42))
                      $)
                     (|CKP;write|
                      (SPADCALL
                       "System without prolonged equations. Dimension: "
                       (SPADCALL |DimRq| (QREFELT $ 34)) (QREFELT $ 42))
                      $)
                     (|CKP;write| (SPADCALL |Sys| (QREFELT $ 44)) $)
                     (COND
                      ((SPADCALL (QREFELT $ 16) 5 (QREFELT $ 23))
                       (SEQ (|CKP;write| " " $)
                            (|CKP;write|
                             (SPADCALL "Symbol. Dimension: "
                                       (SPADCALL |DimMq| (QREFELT $ 34))
                                       (QREFELT $ 42))
                             $)
                            (EXIT
                             (|CKP;write| (SPADCALL |Symb| (QREFELT $ 46))
                              $)))))
                     (EXIT (SPADCALL (QREFELT $ 31)))))))) 

(SDEFUN |CKP;displayIntCond|
        ((|s| |NonNegativeInteger|) (|Cond| |List| D) ($ |Void|))
        (SEQ
         (COND ((< (QREFELT $ 16) 3) (SPADCALL (QREFELT $ 31)))
               ('T
                (SEQ (|CKP;write| " " $)
                     (|CKP;write|
                      (SPADCALL
                       (LIST "======= " (SPADCALL |s| (QREFELT $ 34))
                             ". Projection =======")
                       (QREFELT $ 41))
                      $)
                     (|CKP;write| "Integrability condition(s)" $)
                     (|CKP;write| (SPADCALL |Cond| (QREFELT $ 44)) $)
                     (|CKP;write| "=============================" $)
                     (EXIT (SPADCALL (QREFELT $ 31)))))))) 

(SDEFUN |CKP;displayCartan|
        ((|Sys| |List| D) (|dim| |NonNegativeInteger|)
         (|q| |NonNegativeInteger|) (|s| |NonNegativeInteger|)
         (|CarChar| |List| (|NonNegativeInteger|)) ($ |Void|))
        (SPROG ((#1=#:G153 NIL) (|cc| NIL) (#2=#:G152 NIL))
               (SEQ
                (COND ((EQL (QREFELT $ 16) 0) (SPADCALL (QREFELT $ 31)))
                      (#3='T
                       (SEQ (|CKP;write| " " $)
                            (|CKP;write|
                             "*************** Final Result ***************" $)
                            (|CKP;write| " " $)
                            (|CKP;write|
                             (SPADCALL
                              (LIST "Equation " (|CKP;outR| |q| |s| $)
                                    " involutive!")
                              (QREFELT $ 41))
                             $)
                            (|CKP;write|
                             (SPADCALL
                              "System without prolonged equations. Dimension: "
                              (SPADCALL |dim| (QREFELT $ 34)) (QREFELT $ 42))
                             $)
                            (|CKP;write| (SPADCALL |Sys| (QREFELT $ 44)) $)
                            (COND
                             ((SPADCALL (QREFELT $ 16) 1 (QREFELT $ 23))
                              (SEQ (|CKP;write| " " $)
                                   (EXIT
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (ELT $ 49) |CarChar| 0
                                                 (QREFELT $ 52)))
                                      (|CKP;write| "System of finite type." $))
                                     (#3#
                                      (|CKP;write|
                                       (SPADCALL "Cartan characters: "
                                                 (SPADCALL
                                                  (PROGN
                                                   (LETT #2# NIL
                                                         . #4=(|CKP;displayCartan|))
                                                   (SEQ (LETT |cc| NIL . #4#)
                                                        (LETT #1# |CarChar|
                                                              . #4#)
                                                        G190
                                                        (COND
                                                         ((OR (ATOM #1#)
                                                              (PROGN
                                                               (LETT |cc|
                                                                     (CAR #1#)
                                                                     . #4#)
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (LETT #2#
                                                                (CONS
                                                                 (SPADCALL |cc|
                                                                           (QREFELT
                                                                            $
                                                                            34))
                                                                 #2#)
                                                                . #4#)))
                                                        (LETT #1# (CDR #1#)
                                                              . #4#)
                                                        (GO G190) G191
                                                        (EXIT (NREVERSE #2#))))
                                                  (QREFELT $ 53))
                                                 (QREFELT $ 42))
                                       $)))))))
                            (EXIT (SPADCALL (QREFELT $ 31))))))))) 

(SDEFUN |CKP;stirling;4Nni;11|
        ((|i| |NonNegativeInteger|) (|k| |NonNegativeInteger|)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|res| (|NonNegativeInteger|)) (#1=#:G184 NIL) (#2=#:G183 NIL)
          (#3=#:G182 NIL) (|j| NIL) (#4=#:G192 NIL) (#5=#:G191 NIL)
          (|ans| (|Union| (|NonNegativeInteger|) "failed")))
         (SEQ
          (COND
           ((SPADCALL |k| |i| (QREFELT $ 23))
            (|error| "Symmetric polynomial not defined"))
           ((OR (ZEROP |i|) (ZEROP |k|)) 1)
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (VECTOR |i| |k| |q|) (QREFELT $ 57)
                             (QREFELT $ 59))
                   . #6=(|CKP;stirling;4Nni;11|))
             (EXIT
              (COND ((QEQCAR |ans| 0) (QCDR |ans|))
                    (#7='T
                     (SEQ
                      (COND
                       ((EQL |k| 1)
                        (LETT |res|
                              (SPADCALL (ELT $ 49)
                                        (PROGN
                                         (LETT #5# NIL . #6#)
                                         (SEQ (LETT |j| 1 . #6#) G190
                                              (COND
                                               ((|greater_SI| |j| |i|)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #5#
                                                      (CONS (+ |q| |j|) #5#)
                                                      . #6#)))
                                              (LETT |j| (|inc_SI| |j|) . #6#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #5#))))
                                        (QREFELT $ 60))
                              . #6#))
                       ((EQL |k| |i|)
                        (LETT |res|
                              (SPADCALL (ELT $ 61)
                                        (PROGN
                                         (LETT #4# NIL . #6#)
                                         (SEQ (LETT |j| 1 . #6#) G190
                                              (COND
                                               ((|greater_SI| |j| |i|)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS (+ |q| |j|) #4#)
                                                      . #6#)))
                                              (LETT |j| (|inc_SI| |j|) . #6#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#))))
                                        (QREFELT $ 60))
                              . #6#))
                       (#7#
                        (LETT |res|
                              (+
                               (SPADCALL
                                (PROG1 (LETT #3# (- |i| 1) . #6#)
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                |k| |q| (QREFELT $ 62))
                               (* (+ |q| |i|)
                                  (SPADCALL
                                   (PROG1 (LETT #2# (- |i| 1) . #6#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (PROG1 (LETT #1# (- |k| 1) . #6#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   |q| (QREFELT $ 62))))
                              . #6#)))
                      (EXIT
                       (SPADCALL (QREFELT $ 57) (VECTOR |i| |k| |q|) |res|
                                 (QREFELT $ 63))))))))))))) 

(SDEFUN |CKP;alpha;Nni2L;12|
        ((|q| |NonNegativeInteger|) (|beta| |List| (|NonNegativeInteger|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G193 NIL) (#2=#:G197 NIL) (|bi| NIL) (#3=#:G198 NIL) (|i| NIL)
          (#4=#:G196 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|CKP;alpha;Nni2L;12|))
           (SEQ (LETT |i| 1 . #5#) (LETT #3# (QREFELT $ 10) . #5#)
                (LETT |bi| NIL . #5#) (LETT #2# |beta| . #5#) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |bi| (CAR #2#) . #5#) NIL)
                      (|greater_SI| |i| #3#))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #4#
                        (CONS
                         (PROG1
                             (LETT #1#
                                   (-
                                    (SPADCALL (QREFELT $ 12)
                                              (SPADCALL
                                               (-
                                                (- (+ |q| (QREFELT $ 10)) |i|)
                                                1)
                                               (- |q| 1) (QREFELT $ 65))
                                              (QREFELT $ 66))
                                    |bi|)
                                   . #5#)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         #4#)
                        . #5#)))
                (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #5#))
                      . #5#)
                (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |CKP;hilbert;LSup;13|
        ((|CarChar| |List| (|NonNegativeInteger|))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|ifac| #1=(|Integer|))
          (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|coeff| (|Fraction| (|Integer|))) (#2=#:G199 NIL) (|kfac| #1#)
          (#3=#:G207 NIL) (|k| NIL) (#4=#:G206 NIL) (|i| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 69) . #5=(|CKP;hilbert;LSup;13|))
              (LETT |ifac| 1 . #5#)
              (SEQ (LETT |i| 0 . #5#) (LETT #4# (- (QREFELT $ 10) 1) . #5#)
                   G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (LETT |coeff| (|spadConstant| $ 71) . #5#)
                        (LETT |kfac| |ifac| . #5#)
                        (SEQ (LETT |k| |i| . #5#)
                             (LETT #3# (- (QREFELT $ 10) 1) . #5#) G190
                             (COND ((> |k| #3#) (GO G191)))
                             (SEQ
                              (COND
                               ((SPADCALL |k| 0 (QREFELT $ 23))
                                (LETT |kfac|
                                      (SPADCALL |k| |kfac| (QREFELT $ 72))
                                      . #5#)))
                              (EXIT
                               (LETT |coeff|
                                     (SPADCALL |coeff|
                                               (SPADCALL
                                                (*
                                                 (SPADCALL |CarChar| (+ |k| 1)
                                                           (QREFELT $ 73))
                                                 (SPADCALL |k|
                                                           (PROG1
                                                               (LETT #2#
                                                                     (- |k|
                                                                        |i|)
                                                                     . #5#)
                                                             (|check_subtype2|
                                                              (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                                           0 (QREFELT $ 62)))
                                                |kfac| (QREFELT $ 74))
                                               (QREFELT $ 75))
                                     . #5#)))
                             (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |coeff| (QREFELT $ 76)) |i|
                                         (QREFELT $ 77))
                                        (QREFELT $ 78))
                              . #5#)
                        (EXIT
                         (COND
                          ((SPADCALL |i| 0 (QREFELT $ 23))
                           (LETT |ifac| (SPADCALL |i| |ifac| (QREFELT $ 72))
                                 . #5#)))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CKP;alphaHilbert;SupL;14|
        ((|hilp| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G293 NIL)
          (|ai| (|Integer|)) (#2=#:G291 NIL) (|kfac| #3=(|Integer|))
          (|sum| (|Fraction| (|Integer|))) (#4=#:G211 NIL) (#5=#:G210 NIL)
          (#6=#:G298 NIL) (|k| NIL) (|ifac| #3#) (|i| NIL))
         (SEQ (LETT |res| NIL . #7=(|CKP;alphaHilbert;SupL;14|))
              (LETT |ifac| (SPADCALL (QREFELT $ 10) (QREFELT $ 82)) . #7#)
              (SEQ (LETT |i| (QREFELT $ 10) . #7#) G190
                   (COND ((< |i| 1) (GO G191)))
                   (SEQ (LETT |sum| (|spadConstant| $ 71) . #7#)
                        (LETT |kfac| |ifac| . #7#)
                        (LETT |ifac| (QUOTIENT2 |ifac| |i|) . #7#)
                        (SEQ (LETT |k| (+ |i| 1) . #7#)
                             (LETT #6# (QREFELT $ 10) . #7#) G190
                             (COND ((> |k| #6#) (GO G191)))
                             (SEQ
                              (LETT |sum|
                                    (SPADCALL |sum|
                                              (SPADCALL
                                               (*
                                                (SPADCALL
                                                 (PROG1
                                                     (LETT #5# (- |k| 1) . #7#)
                                                   (|check_subtype2| (>= #5# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #5#))
                                                 (PROG1
                                                     (LETT #4# (- |k| |i|)
                                                           . #7#)
                                                   (|check_subtype2| (>= #4# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #4#))
                                                 0 (QREFELT $ 62))
                                                (SPADCALL |res| (- |k| |i|)
                                                          (QREFELT $ 73)))
                                               |kfac| (QREFELT $ 74))
                                              (QREFELT $ 75))
                                    . #7#)
                              (EXIT
                               (LETT |kfac|
                                     (SPADCALL |k| |kfac| (QREFELT $ 72))
                                     . #7#)))
                             (LETT |k| (+ |k| 1) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |ai|
                              (SPADCALL
                               (SPADCALL |ifac|
                                         (SPADCALL
                                          (SPADCALL |hilp|
                                                    (PROG1
                                                        (LETT #2# (- |i| 1)
                                                              . #7#)
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 83))
                                          |sum| (QREFELT $ 84))
                                         (QREFELT $ 85))
                               (QREFELT $ 86))
                              . #7#)
                        (EXIT
                         (LETT |res|
                               (CONS
                                (PROG1 (LETT #1# |ai| . #7#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                |res|)
                               . #7#)))
                   (LETT |i| (+ |i| -1) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CKP;arbFunctions;NniILL;15|
        ((|q| |NonNegativeInteger|) (|j| |Integer|)
         (|CarChar| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPROG
         ((|res| (|List| (|Integer|))) (|t| (|Fraction| (|Integer|)))
          (#1=#:G322 NIL) (#2=#:G321 NIL) (#3=#:G315 NIL) (|kfac| (|Integer|))
          (|ki| (|NonNegativeInteger|)) (#4=#:G299 NIL) (#5=#:G329 NIL)
          (|k| NIL) (|ifac| (|Integer|)) (|i| NIL))
         (SEQ
          (LETT |res| (LIST (SPADCALL |CarChar| (QREFELT $ 10) (QREFELT $ 88)))
                . #6=(|CKP;arbFunctions;NniILL;15|))
          (LETT |ifac| (SPADCALL (- (QREFELT $ 10) 1) (QREFELT $ 82)) . #6#)
          (SEQ (LETT |i| (- (QREFELT $ 10) 1) . #6#) G190
               (COND ((< |i| 1) (GO G191)))
               (SEQ (LETT |t| (|spadConstant| $ 71) . #6#)
                    (LETT |ifac| (QUOTIENT2 |ifac| |i|) . #6#)
                    (LETT |kfac| |ifac| . #6#)
                    (SEQ (LETT |k| |i| . #6#)
                         (LETT #5# (- (QREFELT $ 10) 1) . #6#) G190
                         (COND ((> |k| #5#) (GO G191)))
                         (SEQ
                          (LETT |ki|
                                (PROG1 (LETT #4# (+ (- |k| |i|) 1) . #6#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                . #6#)
                          (LETT |kfac| (* |k| |kfac|) . #6#)
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL
                                            (-
                                             (*
                                              (SPADCALL |CarChar| (+ |k| 1)
                                                        (QREFELT $ 73))
                                              (SPADCALL
                                               (PROG1 (LETT #3# |k| . #6#)
                                                 (|check_subtype2| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #3#))
                                               |ki| 0 (QREFELT $ 62)))
                                             (*
                                              (SPADCALL |res| |ki|
                                                        (QREFELT $ 90))
                                              (SPADCALL
                                               (PROG1 (LETT #2# |k| . #6#)
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               |ki|
                                               (PROG1
                                                   (LETT #1# (+ |q| |j|) . #6#)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               (QREFELT $ 62))))
                                            |kfac| (QREFELT $ 74))
                                           (QREFELT $ 75))
                                 . #6#)))
                         (LETT |k| (+ |k| 1) . #6#) (GO G190) G191 (EXIT NIL))
                    (LETT |t|
                          (SPADCALL
                           (SPADCALL (SPADCALL |CarChar| |i| (QREFELT $ 73))
                                     (QREFELT $ 91))
                           (SPADCALL |t| |ifac| (QREFELT $ 92)) (QREFELT $ 75))
                          . #6#)
                    (EXIT
                     (LETT |res| (CONS (SPADCALL |t| (QREFELT $ 86)) |res|)
                           . #6#)))
               (LETT |i| (+ |i| -1) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |CKP;gauge;NniILL;16|
        ((|q| |NonNegativeInteger|) (|j| |Integer|)
         (|gamma| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPROG
         ((|res| (|List| (|Integer|))) (|t| (|Fraction| (|Integer|)))
          (#1=#:G346 NIL) (#2=#:G345 NIL) (|kfac| (|Integer|))
          (|ki| (|NonNegativeInteger|)) (#3=#:G339 NIL) (|k| NIL)
          (|ifac| (|Integer|)) (#4=#:G337 NIL) (#5=#:G336 NIL) (#6=#:G354 NIL)
          (|l| NIL) (#7=#:G355 NIL) (|g| NIL) (|i| NIL)
          (|rnf| (|Fraction| (|Integer|))) (|n1| (|Integer|))
          (|gp| (|NonNegativeInteger|)))
         (SEQ
          (LETT |gp| (SPADCALL |gamma| (QREFELT $ 94))
                . #8=(|CKP;gauge;NniILL;16|))
          (EXIT
           (COND ((ZEROP |gp|) (SPADCALL (QREFELT $ 10) 0 (QREFELT $ 95)))
                 ('T
                  (SEQ
                   (LETT |res|
                         (LIST (SPADCALL (ELT $ 49) |gamma| (QREFELT $ 60)))
                         . #8#)
                   (LETT |n1| (- (QREFELT $ 10) 1) . #8#)
                   (LETT |ifac| (SPADCALL |n1| (QREFELT $ 82)) . #8#)
                   (LETT |rnf| (SPADCALL 1 |ifac| (QREFELT $ 74)) . #8#)
                   (SEQ (LETT |i| |n1| . #8#) G190 (COND ((< |i| 1) (GO G191)))
                        (SEQ (LETT |t| (|spadConstant| $ 71) . #8#)
                             (SEQ (LETT |g| NIL . #8#) (LETT #7# |gamma| . #8#)
                                  (LETT |l| 0 . #8#)
                                  (LETT #6# (- |gp| 1) . #8#) G190
                                  (COND
                                   ((OR (|greater_SI| |l| #6#) (ATOM #7#)
                                        (PROGN (LETT |g| (CAR #7#) . #8#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |t|
                                          (SPADCALL |t|
                                                    (SPADCALL
                                                     (* |g|
                                                        (SPADCALL
                                                         (PROG1
                                                             (LETT #5# |n1|
                                                                   . #8#)
                                                           (|check_subtype2|
                                                            (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                                         (PROG1
                                                             (LETT #4#
                                                                   (-
                                                                    (QREFELT $
                                                                             10)
                                                                    |i|)
                                                                   . #8#)
                                                           (|check_subtype2|
                                                            (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                                         (+ |q| |l|)
                                                         (QREFELT $ 62)))
                                                     (QREFELT $ 91))
                                                    (QREFELT $ 75))
                                          . #8#)))
                                  (LETT |l|
                                        (PROG1 (|inc_SI| |l|)
                                          (LETT #7# (CDR #7#) . #8#))
                                        . #8#)
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |t| (SPADCALL |t| |rnf| (QREFELT $ 96))
                                   . #8#)
                             (LETT |ifac| (QUOTIENT2 |ifac| |i|) . #8#)
                             (LETT |kfac| |ifac| . #8#)
                             (SEQ (LETT |k| |i| . #8#) G190
                                  (COND ((> |k| |n1|) (GO G191)))
                                  (SEQ
                                   (LETT |ki|
                                         (PROG1
                                             (LETT #3# (+ (- |k| |i|) 1) . #8#)
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         . #8#)
                                   (LETT |kfac| (* |k| |kfac|) . #8#)
                                   (EXIT
                                    (LETT |t|
                                          (SPADCALL |t|
                                                    (SPADCALL
                                                     (*
                                                      (SPADCALL |res| |ki|
                                                                (QREFELT $ 90))
                                                      (SPADCALL
                                                       (PROG1
                                                           (LETT #2# |k| . #8#)
                                                         (|check_subtype2|
                                                          (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                                       |ki|
                                                       (PROG1
                                                           (LETT #1#
                                                                 (+ |q| |j|)
                                                                 . #8#)
                                                         (|check_subtype2|
                                                          (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                                       (QREFELT $ 62)))
                                                     |kfac| (QREFELT $ 74))
                                                    (QREFELT $ 84))
                                          . #8#)))
                                  (LETT |k| (+ |k| 1) . #8#) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |t| (SPADCALL |t| |ifac| (QREFELT $ 92))
                                   . #8#)
                             (EXIT
                              (LETT |res|
                                    (CONS (SPADCALL |t| (QREFELT $ 86)) |res|)
                                    . #8#)))
                        (LETT |i| (+ |i| -1) . #8#) (GO G190) G191 (EXIT NIL))
                   (EXIT |res|)))))))) 

(SDEFUN |CKP;gaugeHilbert;NniLSup;17|
        ((|q| |NonNegativeInteger|) (|gamma| |List| (|NonNegativeInteger|))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|t| (|NonNegativeInteger|)) (#1=#:G357 NIL) (#2=#:G356 NIL)
          (#3=#:G365 NIL) (|l| NIL) (#4=#:G366 NIL) (|g| NIL) (#5=#:G364 NIL)
          (|k| NIL) (|rnf| (|Fraction| (|Integer|)))
          (|gp| (|NonNegativeInteger|)))
         (SEQ
          (LETT |gp| (SPADCALL |gamma| (QREFELT $ 94))
                . #6=(|CKP;gaugeHilbert;NniLSup;17|))
          (EXIT
           (COND ((ZEROP |gp|) (|spadConstant| $ 69))
                 ('T
                  (SEQ (LETT |res| (|spadConstant| $ 69) . #6#)
                       (LETT |rnf|
                             (SPADCALL 1
                                       (SPADCALL (- (QREFELT $ 10) 1)
                                                 (QREFELT $ 82))
                                       (QREFELT $ 74))
                             . #6#)
                       (SEQ (LETT |k| 0 . #6#)
                            (LETT #5# (- (QREFELT $ 10) 1) . #6#) G190
                            (COND ((|greater_SI| |k| #5#) (GO G191)))
                            (SEQ (LETT |t| 0 . #6#)
                                 (SEQ (LETT |g| NIL . #6#)
                                      (LETT #4# |gamma| . #6#)
                                      (LETT |l| 0 . #6#)
                                      (LETT #3# (- |gp| 1) . #6#) G190
                                      (COND
                                       ((OR (|greater_SI| |l| #3#) (ATOM #4#)
                                            (PROGN
                                             (LETT |g| (CAR #4#) . #6#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |t|
                                              (+ |t|
                                                 (* |g|
                                                    (SPADCALL
                                                     (PROG1
                                                         (LETT #2#
                                                               (-
                                                                (QREFELT $ 10)
                                                                1)
                                                               . #6#)
                                                       (|check_subtype2|
                                                        (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                                     (PROG1
                                                         (LETT #1#
                                                               (-
                                                                (-
                                                                 (QREFELT $ 10)
                                                                 |k|)
                                                                1)
                                                               . #6#)
                                                       (|check_subtype2|
                                                        (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                                     (+ |q| |l|)
                                                     (QREFELT $ 62))))
                                              . #6#)))
                                      (LETT |l|
                                            (PROG1 (|inc_SI| |l|)
                                              (LETT #4# (CDR #4#) . #6#))
                                            . #6#)
                                      (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL
                                                   (SPADCALL |t| |rnf|
                                                             (QREFELT $ 98))
                                                   |k| (QREFELT $ 77))
                                                  (QREFELT $ 78))
                                        . #6#)))
                            (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |res|)))))))) 

(SDEFUN |CKP;bound;4Nni;18|
        ((|nn| |NonNegativeInteger|) (|mm| |NonNegativeInteger|)
         (|qq| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G371 NIL) (#2=#:G368 NIL) (|tmp| (|NonNegativeInteger|))
          (#3=#:G367 NIL))
         (SEQ
          (COND
           ((EQL |qq| 1)
            (COND ((ZEROP |nn|) 0)
                  (#4='T
                   (SEQ
                    (LETT |tmp|
                          (SPADCALL
                           (PROG1
                               (LETT #3# (- |nn| 1) . #5=(|CKP;bound;4Nni;18|))
                             (|check_subtype2| (>= #3# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #3#))
                           |mm| 1 (QREFELT $ 100))
                          . #5#)
                    (EXIT
                     (PROG1
                         (LETT #2#
                               (+ (+ 1 |tmp|)
                                  (SPADCALL |mm|
                                            (SPADCALL (+ |nn| |tmp|) (- |nn| 1)
                                                      (QREFELT $ 65))
                                            (QREFELT $ 72)))
                               . #5#)
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#)))))))
           (#4#
            (SPADCALL |nn|
                      (PROG1
                          (LETT #1#
                                (SPADCALL |mm|
                                          (SPADCALL (- (+ |qq| |nn|) 1) |nn|
                                                    (QREFELT $ 65))
                                          (QREFELT $ 72))
                                . #5#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#))
                      1 (QREFELT $ 100))))))) 

(SDEFUN |CKP;complete;JdeV;19|
        ((|De| |JetDifferentialEquation| JB D) ($ |Void|))
        (SPROG
         ((|tmp|
           (|Record| (|:| |IDe| (|JetDifferentialEquation| JB D))
                     (|:| |ISys| (|List| D))
                     (|:| |Order| (|NonNegativeInteger|))
                     (|:| |NumProj| (|NonNegativeInteger|))
                     (|:| |Dim| (|NonNegativeInteger|))
                     (|:| |CarChar| (|List| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |tmp| (SPADCALL |De| (QREFELT $ 102)) |CKP;complete;JdeV;19|)
          (EXIT (SPADCALL (QREFELT $ 31)))))) 

(SDEFUN |CKP;complete2;JdeR;20|
        ((|De| |JetDifferentialEquation| JB D)
         ($ |Record| (|:| |IDe| (|JetDifferentialEquation| JB D))
          (|:| |ISys| (|List| D)) (|:| |Order| (|NonNegativeInteger|))
          (|:| |NumProj| (|NonNegativeInteger|))
          (|:| |Dim| (|NonNegativeInteger|))
          (|:| |CarChar| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|Cartan| (|List| (|NonNegativeInteger|)))
          (|PrevSymb| (|SparseEchelonMatrix| JB D)) (|ICs| (|List| D))
          (|CurDe| #1=(|JetDifferentialEquation| JB D))
          (PD
           (|Record| (|:| |SDe| (|JetDifferentialEquation| JB D))
                     (|:| IC (|List| D))))
          (|PrevDe| #1#) (|CompSys| (|List| D)) (|s| #2=(|NonNegativeInteger|))
          (|InvDe| (|Boolean|)) (|ProjDeDim| #3=(|NonNegativeInteger|))
          (#4=#:G396 NIL) (|ProjDe| (|JetDifferentialEquation| JB D))
          (|InvSymb| (|Boolean|)) (|CurDeDim| #3#) (|CurSymbDim| #2#)
          (#5=#:G388 NIL)
          (|CurMV|
           (|Record| (|:| |Rank| (|NonNegativeInteger|))
                     (|:| |NumMultVar| (|NonNegativeInteger|))
                     (|:| |Betas| (|List| (|NonNegativeInteger|)))))
          (|CurSymb| (|SparseEchelonMatrix| JB D))
          (|PrevSymbDim| (|NonNegativeInteger|)) (|PrevDeDim| #3#)
          (|PrevMV|
           (|Record| (|:| |Rank| (|NonNegativeInteger|))
                     (|:| |NumMultVar| (|NonNegativeInteger|))
                     (|:| |Betas| (|List| (|NonNegativeInteger|)))))
          (|dimSq1| #6=(|NonNegativeInteger|)) (|dimSq| #6#)
          (|q1| (|NonNegativeInteger|)) (|q| (|NonNegativeInteger|))
          (#7=#:G383 NIL) (#8=#:G381 NIL) (#9=#:G405 NIL)
          (|solved?| (|Boolean|)))
         (SEQ
          (LETT |PrevDe| (QCAR (SPADCALL |De| (QREFELT $ 105)))
                . #10=(|CKP;complete2;JdeR;20|))
          (LETT |CompSys| (SPADCALL |PrevDe| (QREFELT $ 106)) . #10#)
          (COND
           ((SPADCALL (QREFELT $ 14) 0 (QREFELT $ 23))
            (LETT |CompSys| (SPADCALL |CompSys| (QREFELT $ 107)) . #10#)))
          (LETT PD (SPADCALL |PrevDe| (QREFELT $ 108)) . #10#)
          (LETT |CurDe| (QCAR PD) . #10#) (LETT |ICs| (QCDR PD) . #10#)
          (COND
           ((SPADCALL (QREFELT $ 14) 0 (QREFELT $ 23))
            (COND
             ((NULL (NULL |ICs|))
              (LETT |ICs|
                    (SPADCALL (SPADCALL |ICs| |CompSys| (QREFELT $ 109))
                              (QREFELT $ 107))
                    . #10#)))))
          (LETT |q| (SPADCALL |De| (QREFELT $ 110)) . #10#) (LETT |s| 0 . #10#)
          (LETT |q1| (+ |q| 1) . #10#)
          (LETT |dimSq| (SPADCALL |q| (QREFELT $ 111)) . #10#)
          (LETT |dimSq1| (SPADCALL |q1| (QREFELT $ 111)) . #10#)
          (LETT |InvDe| 'NIL . #10#) (LETT |InvSymb| (QREFELT $ 13) . #10#)
          (LETT |solved?| (SPADCALL (QREFELT $ 16) 5 (QREFELT $ 23)) . #10#)
          (SEQ (LETT #9# NIL . #10#) G190 (COND (#9# (GO G191)))
               (SEQ
                (LETT |PrevDeDim| (SPADCALL |PrevDe| |q| (QREFELT $ 112))
                      . #10#)
                (LETT |CurDeDim| (SPADCALL |CurDe| |q1| (QREFELT $ 112))
                      . #10#)
                (COND
                 ((NULL (QREFELT $ 13))
                  (SEQ
                   (LETT |PrevSymb|
                         (SPADCALL |PrevDe| |solved?| (QREFELT $ 113)) . #10#)
                   (LETT |PrevMV| (SPADCALL |PrevSymb| (QREFELT $ 115)) . #10#)
                   (LETT |PrevSymbDim|
                         (PROG1
                             (LETT #8# (- |dimSq| (QVELT |PrevMV| 0)) . #10#)
                           (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #8#))
                         . #10#)
                   (COND
                    ((ZEROP |PrevSymbDim|)
                     (SEQ
                      (LETT |CurSymb| (SPADCALL |PrevSymb| (QREFELT $ 116))
                            . #10#)
                      (LETT |CurMV| (SPADCALL |PrevMV| (QREFELT $ 117)) . #10#)
                      (EXIT (LETT |CurSymbDim| 0 . #10#))))
                    ('T
                     (SEQ
                      (LETT |CurSymb|
                            (SPADCALL |CurDe| |solved?| (QREFELT $ 113))
                            . #10#)
                      (LETT |CurMV| (SPADCALL |CurSymb| (QREFELT $ 115))
                            . #10#)
                      (EXIT
                       (LETT |CurSymbDim|
                             (PROG1
                                 (LETT #7# (- |dimSq1| (QVELT |CurMV| 0))
                                       . #10#)
                               (|check_subtype2| (>= #7# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #7#))
                             . #10#)))))
                   (EXIT
                    (LETT |InvSymb| (EQL (QVELT |PrevMV| 1) (QVELT |CurMV| 0))
                          . #10#)))))
                (|CKP;display| |q| |s| |CompSys| |PrevSymb| |PrevDeDim|
                 |PrevSymbDim| $)
                (SEQ G190
                     (COND ((NULL (COND (|InvSymb| 'NIL) ('T 'T))) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((< (QVELT |CurMV| 0) (QVELT |PrevMV| 1))
                         (|error|
                          "independent equations lost during prolongation!!!"))
                        ('T
                         (SEQ (|CKP;info| 2 |q| |s| |PrevSymbDim| $)
                              (LETT |q| |q1| . #10#)
                              (LETT |q1| (+ |q1| 1) . #10#)
                              (LETT |dimSq| |dimSq1| . #10#)
                              (LETT |dimSq1| (SPADCALL |q1| (QREFELT $ 111))
                                    . #10#)
                              (LETT |PrevDe| |CurDe| . #10#)
                              (LETT |PrevSymb| |CurSymb| . #10#)
                              (LETT |PrevMV| |CurMV| . #10#)
                              (LETT |PrevDeDim| |CurDeDim| . #10#)
                              (LETT |PrevSymbDim| |CurSymbDim| . #10#)
                              (LETT PD (SPADCALL |PrevDe| (QREFELT $ 108))
                                    . #10#)
                              (LETT |CurDe| (QCAR PD) . #10#)
                              (COND
                               ((ZEROP |PrevSymbDim|)
                                (SEQ
                                 (LETT |CurSymb|
                                       (SPADCALL |PrevSymb| (QREFELT $ 116))
                                       . #10#)
                                 (LETT |CurMV|
                                       (SPADCALL |PrevMV| (QREFELT $ 117))
                                       . #10#)
                                 (EXIT (LETT |CurSymbDim| 0 . #10#))))
                               ('T
                                (SEQ
                                 (LETT |CurSymb|
                                       (SPADCALL |CurDe| |solved?|
                                                 (QREFELT $ 113))
                                       . #10#)
                                 (LETT |CurMV|
                                       (SPADCALL |CurSymb| (QREFELT $ 115))
                                       . #10#)
                                 (EXIT
                                  (LETT |CurSymbDim|
                                        (PROG1
                                            (LETT #5#
                                                  (- |dimSq1|
                                                     (QVELT |CurMV| 0))
                                                  . #10#)
                                          (|check_subtype2| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #5#))
                                        . #10#)))))
                              (LETT |CurDeDim|
                                    (SPADCALL |CurDe| |q1| (QREFELT $ 112))
                                    . #10#)
                              (COND
                               ((NULL (NULL (QCDR PD)))
                                (COND
                                 ((SPADCALL (QREFELT $ 14) 0 (QREFELT $ 23))
                                  (LETT |ICs|
                                        (SPADCALL
                                         (SPADCALL |ICs|
                                                   (SPADCALL (QCDR PD)
                                                             |CompSys|
                                                             (QREFELT $ 109))
                                                   (QREFELT $ 118))
                                         (QREFELT $ 107))
                                        . #10#))
                                 ('T
                                  (LETT |ICs|
                                        (SPADCALL |ICs| (QCDR PD)
                                                  (QREFELT $ 118))
                                        . #10#)))))
                              (EXIT
                               (LETT |InvSymb|
                                     (EQL (QVELT |PrevMV| 1) (QVELT |CurMV| 0))
                                     . #10#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((QREFELT $ 13)
                  (SEQ
                   (LETT |ProjDe| (SPADCALL |CurDe| |q| (QREFELT $ 119))
                         . #10#)
                   (EXIT
                    (LETT |ProjDeDim| (SPADCALL |ProjDe| |q| (QREFELT $ 112))
                          . #10#))))
                 ('T
                  (SEQ (|CKP;info| 1 |q| |s| |PrevSymbDim| $)
                       (EXIT
                        (LETT |ProjDeDim|
                              (PROG1
                                  (LETT #4# (- |CurDeDim| |CurSymbDim|) . #10#)
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              . #10#)))))
                (LETT |InvDe| (EQL |ProjDeDim| |PrevDeDim|) . #10#)
                (EXIT
                 (COND
                  ((NULL |InvDe|)
                   (SEQ (|CKP;info| 3 |q| |s| |PrevDeDim| $)
                        (LETT |s| (+ |s| 1) . #10#)
                        (|CKP;displayIntCond| |s| |ICs| $)
                        (COND
                         ((SPADCALL (QREFELT $ 14) 0 (QREFELT $ 23))
                          (LETT |CompSys|
                                (SPADCALL
                                 (SPADCALL |CompSys| |ICs| (QREFELT $ 118))
                                 (QREFELT $ 107))
                                . #10#))
                         ('T
                          (LETT |CompSys|
                                (SPADCALL |CompSys| |ICs| (QREFELT $ 118))
                                . #10#)))
                        (COND ((QREFELT $ 13) (LETT |PrevDe| |ProjDe| . #10#))
                              ('T
                               (LETT |PrevDe|
                                     (SPADCALL |CurDe| |q| (QREFELT $ 119))
                                     . #10#)))
                        (LETT PD (SPADCALL |CurDe| |q1| (QREFELT $ 120))
                              . #10#)
                        (LETT |CurDe| (QCAR PD) . #10#)
                        (EXIT
                         (COND ((NULL (QCDR PD)) (LETT |ICs| NIL . #10#))
                               ((SPADCALL (QREFELT $ 14) 0 (QREFELT $ 23))
                                (LETT |ICs|
                                      (SPADCALL
                                       (SPADCALL (QCDR PD) |CompSys|
                                                 (QREFELT $ 109))
                                       (QREFELT $ 107))
                                      . #10#))
                               ('T (LETT |ICs| (QCDR PD) . #10#)))))))))
               (LETT #9# |InvDe| . #10#) (GO G190) G191 (EXIT NIL))
          (COND
           ((QREFELT $ 13)
            (SEQ
             (LETT |PrevSymb| (SPADCALL |PrevDe| 'NIL (QREFELT $ 113)) . #10#)
             (EXIT
              (LETT |Cartan|
                    (LIST (QVELT (SPADCALL |PrevSymb| (QREFELT $ 122)) 3))
                    . #10#))))
           ('T
            (LETT |Cartan| (SPADCALL |q| (QVELT |PrevMV| 2) (QREFELT $ 67))
                  . #10#)))
          (|CKP;displayCartan| |CompSys| |PrevDeDim| |q| |s| |Cartan| $)
          (EXIT (VECTOR |PrevDe| |CompSys| |q| |s| |PrevDeDim| |Cartan|))))) 

(DECLAIM (NOTINLINE |CartanKuranishi;|)) 

(DEFUN |CartanKuranishi| (&REST #1=#:G406)
  (SPROG NIL
         (PROG (#2=#:G407)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CartanKuranishi|)
                                               '|domainEqualList|)
                    . #3=(|CartanKuranishi|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartanKuranishi;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CartanKuranishi|)))))))))) 

(DEFUN |CartanKuranishi;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|CartanKuranishi|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|CartanKuranishi| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 123) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|CartanKuranishi| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          (QSETREFV $ 13 (EQL (QREFELT $ 10) 1))
          (QSETREFV $ 14 0)
          (QSETREFV $ 15 'NIL)
          (QSETREFV $ 16 0)
          (QSETREFV $ 57 (SPADCALL (QREFELT $ 56)))
          $))) 

(MAKEPROP '|CartanKuranishi| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|n| (4 . |numDepVar|) '|m|
              '|ode| '|redMode| '|TeX| '|Out| (|NonNegativeInteger|)
              (|JetDifferentialEquation| 6 7) (8 . |setSimpMode|)
              |CKP;setSimpMode;2Nni;1| |CKP;setRedMode;2Nni;2| (|Boolean|)
              (13 . >) |CKP;setOutMode;2Nni;3| (|OutputForm|) (|TexFormat|)
              (19 . |coerce|) (|Void|) (24 . |display|) (29 . |print|)
              (34 . |void|) (|String|) (38 . |message|) (43 . |coerce|)
              (48 . |sub|) (54 . |paren|) (|List| $) (59 . |supersub|)
              (65 . |One|) (69 . |One|) (73 . |hconcat|) (78 . |hconcat|)
              (|List| 7) (84 . |printSys|) (|SparseEchelonMatrix| 6 7)
              (89 . |coerce|) (94 . |Zero|) (98 . +) (104 . +)
              (|Mapping| 17 17 17) (|List| 17) (110 . |reduce|)
              (117 . |commaSeparate|)
              (|Record| (|:| (|Integer|) 17) (|:| K 17) (|:| Q 17))
              (|Table| 54 17) (122 . |dictionary|) '|remember|
              (|Union| 17 '"failed") (126 . |search|) (132 . |reduce|)
              (138 . *) |CKP;stirling;4Nni;11| (144 . |setelt!|) (|Integer|)
              (151 . |binomial|) (157 . *) |CKP;alpha;Nni2L;12|
              (|SparseUnivariatePolynomial| 70) (163 . |Zero|) (|Fraction| 64)
              (167 . |Zero|) (171 . *) (177 . |qelt|) (183 . /) (189 . +)
              (195 . |retract|) (200 . |monomial|) (206 . +)
              |CKP;hilbert;LSup;13| (212 . |empty|) (216 . |empty|)
              (220 . |factorial|) (225 . |coefficient|) (231 . -) (237 . *)
              (243 . |retract|) |CKP;alphaHilbert;SupL;14| (248 . |elt|)
              (|List| 64) (254 . |qelt|) (260 . |coerce|) (265 . *)
              |CKP;arbFunctions;NniILL;15| (271 . |#|) (276 . |new|) (282 . *)
              |CKP;gauge;NniILL;16| (288 . *) |CKP;gaugeHilbert;NniLSup;17|
              |CKP;bound;4Nni;18|
              (|Record| (|:| |IDe| 18) (|:| |ISys| 43) (|:| |Order| 17)
                        (|:| |NumProj| 17) (|:| |Dim| 17) (|:| |CarChar| 51))
              |CKP;complete2;JdeR;20| |CKP;complete;JdeV;19|
              (|Record| (|:| |SDe| $) (|:| IC 43)) (294 . |simplify|)
              (299 . |retract|) (304 . |autoReduce|) (309 . |prolong|)
              (314 . |reduceMod|) (320 . |order|) (325 . |dimS|)
              (330 . |dimension|) (336 . |extractSymbol|)
              (|Record| (|:| |Rank| 17) (|:| |NumMultVar| 17) (|:| |Betas| 51))
              (342 . |analyseSymbol|) (347 . |prolongSymbol|)
              (352 . |prolongMV|) (357 . |concat!|) (363 . |project|)
              (369 . |prolong|)
              (|Record| (|:| |Ech| $) (|:| |Lt| (|Matrix| 7)) (|:| |Pivots| 43)
                        (|:| |Rank| 17))
              (375 . |rowEchelon|))
           '#(|stirling| 380 |setSimpMode| 387 |setRedMode| 392 |setOutMode|
              397 |hilbert| 402 |gaugeHilbert| 407 |gauge| 413 |complete2| 420
              |complete| 425 |bound| 430 |arbFunctions| 437 |alphaHilbert| 444
              |alpha| 449)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 122
                                                 '(0 6 8 9 0 6 8 11 1 18 17 17
                                                   19 2 17 22 0 0 23 1 26 0 25
                                                   27 1 26 28 0 29 1 25 28 0 30
                                                   0 28 0 31 1 25 0 32 33 1 17
                                                   25 0 34 2 25 0 0 0 35 1 25 0
                                                   0 36 2 25 0 0 37 38 0 6 0 39
                                                   0 7 0 40 1 25 0 37 41 2 25 0
                                                   0 0 42 1 18 25 43 44 1 45 25
                                                   0 46 0 7 0 47 2 7 0 0 0 48 2
                                                   17 0 0 0 49 3 51 17 50 0 17
                                                   52 1 25 0 37 53 0 55 0 56 2
                                                   55 58 54 0 59 2 51 17 50 0
                                                   60 2 17 0 17 0 61 3 55 17 0
                                                   54 17 63 2 64 0 0 0 65 2 64
                                                   0 8 0 66 0 68 0 69 0 70 0 71
                                                   2 64 0 17 0 72 2 51 17 0 64
                                                   73 2 70 0 64 64 74 2 70 0 0
                                                   0 75 1 70 70 0 76 2 68 0 70
                                                   17 77 2 68 0 0 0 78 0 25 0
                                                   80 0 55 0 81 1 64 0 0 82 2
                                                   68 70 0 17 83 2 70 0 0 0 84
                                                   2 70 0 64 0 85 1 70 64 0 86
                                                   2 51 17 0 64 88 2 89 64 0 64
                                                   90 1 70 0 64 91 2 70 0 0 64
                                                   92 1 51 17 0 94 2 89 0 17 64
                                                   95 2 70 0 0 0 96 2 70 0 17 0
                                                   98 1 18 104 0 105 1 18 43 0
                                                   106 1 7 37 37 107 1 18 104 0
                                                   108 2 7 37 37 37 109 1 18 17
                                                   0 110 1 6 17 17 111 2 18 17
                                                   0 17 112 2 18 45 0 22 113 1
                                                   18 114 45 115 1 18 45 45 116
                                                   1 18 114 114 117 2 43 0 0 0
                                                   118 2 18 0 0 17 119 2 18 104
                                                   0 17 120 1 45 121 0 122 3 0
                                                   17 17 17 17 62 1 0 17 17 20
                                                   1 0 17 17 21 1 0 17 17 24 1
                                                   0 68 51 79 2 0 68 17 51 99 3
                                                   0 89 17 64 51 97 1 0 101 18
                                                   102 1 0 28 18 103 3 0 17 17
                                                   17 17 100 3 0 89 17 64 51 93
                                                   1 0 51 68 87 2 0 51 17 51
                                                   67)))))
           '|lookupComplete|)) 
