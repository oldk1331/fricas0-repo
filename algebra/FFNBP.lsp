
(SDEFUN |FFNBP;coerce;GF$;1| ((|v| GF) ($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL |v| (QREFELT $ 45) (QREFELT $ 50)))) 

(PUT '|FFNBP;represents;V$;2| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |FFNBP;represents;V$;2| ((|v| |Vector| GF) ($ $)) |v|) 

(SDEFUN |FFNBP;degree;$Pi;3| ((|a| $) ($ |PositiveInteger|))
        (SPROG ((|d| (|PositiveInteger|)) (|b| ($)))
               (SEQ (LETT |d| 1 . #1=(|FFNBP;degree;$Pi;3|))
                    (LETT |b| (SPADCALL |a| 1 (QREFELT $ 53)) . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |b| |a| (QREFELT $ 55))) (GO G191)))
                         (SEQ (LETT |b| (SPADCALL |b| 1 (QREFELT $ 53)) . #1#)
                              (EXIT (LETT |d| (+ |d| 1) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |d|)))) 

(SDEFUN |FFNBP;linearAssociatedExp;$Sup$;4|
        ((|x| $) (|f| |SparseUnivariatePolynomial| GF) ($ $))
        (SPROG
         ((|r| (|SparseUnivariatePolynomial| GF))
          (|xm| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (LETT |xm|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17) (QREFELT $ 58))
                 (|spadConstant| $ 21) (QREFELT $ 59))
                . #1=(|FFNBP;linearAssociatedExp;$Sup$;4|))
          (LETT |r|
                (SPADCALL
                 (SPADCALL |f| (SPADCALL |x| (QREFELT $ 60)) (QREFELT $ 61))
                 |xm| (QREFELT $ 62))
                . #1#)
          (EXIT (SPADCALL |r| (QREFELT $ 17) (QREFELT $ 63)))))) 

(SDEFUN |FFNBP;linearAssociatedLog;$Sup;5|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPADCALL |x| (QREFELT $ 60))) 

(SDEFUN |FFNBP;linearAssociatedOrder;$Sup;6|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPROG ((|xm| (|SparseUnivariatePolynomial| GF)))
               (SEQ
                (LETT |xm|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17)
                                 (QREFELT $ 58))
                       (|spadConstant| $ 21) (QREFELT $ 59))
                      |FFNBP;linearAssociatedOrder;$Sup;6|)
                (EXIT
                 (SPADCALL |xm|
                           (SPADCALL |xm| (SPADCALL |x| (QREFELT $ 60))
                                     (QREFELT $ 66))
                           (QREFELT $ 67)))))) 

(SDEFUN |FFNBP;linearAssociatedLog;2$U;7|
        ((|b| $) (|x| $)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|e1|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| GF))
                     (|:| |coef2| (|SparseUnivariatePolynomial| GF))))
          (#1=#:G138 NIL)
          (|e|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| GF))
                      (|:| |coef2| (|SparseUnivariatePolynomial| GF)))
            #2="failed"))
          (|xm| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 69)) (CONS 0 (|spadConstant| $ 19)))
                (#3='T
                 (SEQ
                  (LETT |xm|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17)
                                   (QREFELT $ 58))
                         (|spadConstant| $ 21) (QREFELT $ 59))
                        . #4=(|FFNBP;linearAssociatedLog;2$U;7|))
                  (LETT |e|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 60)) |xm|
                                  (SPADCALL |x| (QREFELT $ 60)) (QREFELT $ 72))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |e| (CONS 1 "failed") (QREFELT $ 75))
                     (CONS 1 "failed"))
                    (#3#
                     (SEQ
                      (LETT |e1|
                            (PROG2 (LETT #1# |e| . #4#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|Record|
                                               (|:| |coef1|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 6)))
                                               (|:| |coef2|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 6))))
                                              (|Union|
                                               (|Record|
                                                (|:| |coef1|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 6)))
                                                (|:| |coef2|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 6))))
                                               #2#)
                                              #1#))
                            . #4#)
                      (EXIT (CONS 0 (QCAR |e1|))))))))))))) 

(SDEFUN |FFNBP;getMultiplicationTable;V;8|
        (($ |Vector|
          (|List|
           (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|))))))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (QREFELT $ 23)))) 

(SDEFUN |FFNBP;getMultiplicationMatrix;M;9| (($ |Matrix| GF))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (SPADCALL (QREFELT $ 23) (QREFELT $ 81))))) 

(SDEFUN |FFNBP;sizeMultiplication;Nni;10| (($ |NonNegativeInteger|))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (SPADCALL (QREFELT $ 23) (QREFELT $ 83))))) 

(SDEFUN |FFNBP;trace;$GF;11| ((|a| $) ($ GF))
        (SPADCALL (SPADCALL |a| 1 (QREFELT $ 85)) (QREFELT $ 86))) 

(SDEFUN |FFNBP;norm;$GF;12| ((|a| $) ($ GF))
        (SPADCALL (SPADCALL |a| 1 (QREFELT $ 88)) (QREFELT $ 86))) 

(SDEFUN |FFNBP;generator;$;13| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 90))) 

(SDEFUN |FFNBP;basis;PiV;14| ((|n| |PositiveInteger|) ($ |Vector| $))
        (SPROG ((#1=#:G163 NIL) (|i| NIL) (#2=#:G162 NIL))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT $ 17) |n|) 0 (QREFELT $ 92))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (PROGN
                   (LETT #2# (GETREFV |n|) . #3=(|FFNBP;basis;PiV;14|))
                   (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #2# |i|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL (QREFELT $ 93)) |n|
                                             (QREFELT $ 85))
                                   |i| (QREFELT $ 94)))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   #2#)))))) 

(SDEFUN |FFNBP;*;GF2$;15| ((|a| GF) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 97))) 

(SDEFUN |FFNBP;/;$GF$;16| ((|x| $) (|a| GF) ($ $))
        (SPADCALL |x| (SPADCALL |a| (QREFELT $ 51)) (QREFELT $ 99))) 

(PUT '|FFNBP;coordinates;$V;17| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FFNBP;coordinates;$V;17| ((|x| $) ($ |Vector| GF)) |x|) 

(SDEFUN |FFNBP;Frobenius;2$;18| ((|e| $) ($ $)) (SPADCALL |e| 1 (QREFELT $ 53))) 

(SDEFUN |FFNBP;Frobenius;$Nni$;19| ((|e| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |e| |n| (QREFELT $ 53))) 

(SDEFUN |FFNBP;retractIfCan;$U;20| ((|x| $) ($ |Union| GF "failed"))
        (COND
         ((SPADCALL |x| (QREFELT $ 103))
          (CONS 0
                (SPADCALL (SPADCALL |x| 1 (QREFELT $ 104)) (QREFELT $ 45)
                          (QREFELT $ 105))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FFNBP;retract;$GF;21| ((|x| $) ($ GF))
        (COND
         ((SPADCALL |x| (QREFELT $ 103))
          (SPADCALL (SPADCALL |x| 1 (QREFELT $ 104)) (QREFELT $ 45)
                    (QREFELT $ 105)))
         ('T (|error| "element not in ground field")))) 

(SDEFUN |FFNBP;coerce;$Of;22| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|l| (|List| (|OutputForm|)))
          (|mon| (|OutputForm|)) (|i| NIL) (#1=#:G189 NIL) (|b| NIL)
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |l| NIL . #2=(|FFNBP;coerce;$Of;22|))
              (LETT |n| (QREFELT $ 17) . #2#)
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL |x| 1 (QREFELT $ 104)) (QREFELT $ 108)))
                (#3='T
                 (SEQ
                  (SEQ (LETT |b| NIL . #2#) (LETT #1# (QREFELT $ 41) . #2#)
                       (LETT |i| 1 . #2#) G190
                       (COND
                        ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                             (PROGN (LETT |b| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |x| |i| (QREFELT $ 104))
                                      (QREFELT $ 109)))
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |x| |i| (QREFELT $ 104))
                                     (|spadConstant| $ 27) (QREFELT $ 110))
                                    |b|)
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |x| |i| (QREFELT $ 104))
                                      (QREFELT $ 108))
                                     |b| (QREFELT $ 111))))
                                  . #2#)
                            (EXIT (LETT |l| (CONS |mon| |l|) . #2#)))))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                             . #2#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 19) (QREFELT $ 114)))
                    (#3#
                     (SEQ
                      (LETT |r| (SPADCALL (ELT $ 115) |l| (QREFELT $ 118))
                            . #2#)
                      (EXIT |r|)))))))))))) 

(SDEFUN |FFNBP;initializeElt| (($ |Void|))
        (SEQ
         (SETELT $ 42
                 (SPADCALL
                  (SPADCALL
                   (-
                    (SPADCALL (SPADCALL (QREFELT $ 120)) (QREFELT $ 17)
                              (QREFELT $ 121))
                    1)
                   (QREFELT $ 123))
                  (QREFELT $ 127)))
         (SETELT $ 46 (SPADCALL (SPADCALL (QREFELT $ 128)) (QREFELT $ 129)))
         (SETELT $ 15 'NIL) (EXIT (SPADCALL (QREFELT $ 130))))) 

(SDEFUN |FFNBP;initializeMult| (($ |Void|))
        (SEQ (SETELT $ 23 (SPADCALL (QREFELT $ 20) (QREFELT $ 131)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (SETELT $ 16 'NIL) (EXIT (SPADCALL (QREFELT $ 130))))) 

(SDEFUN |FFNBP;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G202 NIL) (|a| ($)) (#2=#:G208 NIL) (#3=#:G196 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G207 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
              (LETT |limit| 30 . #5=(|FFNBP;initializeLog|))
              (SEQ (LETT |f| NIL . #5#) (LETT #4# (QREFELT $ 42) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|) . #5#)
                        (LETT |base|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 46) (QREFELT $ 132))
                               (QUOTIENT2
                                (-
                                 (SPADCALL (SPADCALL (QREFELT $ 120))
                                           (QREFELT $ 17) (QREFELT $ 121))
                                 1)
                                |fac|)
                               (QREFELT $ 133))
                              . #5#)
                        (LETT |l| (INTEGER-LENGTH |fac|) . #5#)
                        (LETT |n| 0 . #5#)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2))) . #5#))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #5#)))
                        (COND
                         ((< |n| |limit|)
                          (SEQ
                           (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1)
                                 . #5#)
                           (EXIT
                            (LETT |n| (+ (QUOTIENT2 (- |fac| 1) |d|) 1)
                                  . #5#)))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 135)) . #5#)
                        (LETT |a| (|spadConstant| $ 22) . #5#)
                        (SEQ (LETT |i| 0 . #5#)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1) . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   . #5#)
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 129)) |i|) |tbl|
                               (QREFELT $ 137))
                              (EXIT
                               (LETT |a| (SPADCALL |a| |base| (QREFELT $ 138))
                                     . #5#)))
                             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac| . #5#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 139)))
                          (QREFELT $ 49) (QREFELT $ 141))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SETELT $ 14 'NIL) (EXIT (SPADCALL (QREFELT $ 130)))))) 

(SDEFUN |FFNBP;tableForDiscreteLogarithm;IT;26|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G210 NIL))
         (SEQ (COND ((QREFELT $ 14) (|FFNBP;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1
                         (LETT #1# |fac|
                               . #2=(|FFNBP;tableForDiscreteLogarithm;IT;26|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 49) (QREFELT $ 143))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFNBP;primitiveElement;$;27| (($ $))
        (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 46) (QREFELT $ 132))))) 

(SDEFUN |FFNBP;factorsOfCyclicGroupSize;L;28|
        (($ |List|
          (|Record| (|:| |factor| . #1=((|Integer|))) (|:| |exponent| . #1#))))
        (SEQ (COND ((NULL (QREFELT $ 42)) (|FFNBP;initializeElt| $)))
             (EXIT (QREFELT $ 42)))) 

(SDEFUN |FFNBP;extensionDegree;Pi;29| (($ |PositiveInteger|)) (QREFELT $ 17)) 

(SDEFUN |FFNBP;definingPolynomial;Sup;30| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 20)) 

(SDEFUN |FFNBP;trace;$Pi$;31| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SPROG ((|erg| ($)) (#1=#:G226 NIL) (|i| NIL) (|v| ($)))
               (SEQ
                (LETT |v| (SPADCALL |a| |d| (QREFELT $ 149))
                      . #2=(|FFNBP;trace;$Pi$;31|))
                (LETT |erg| |v| . #2#)
                (SEQ (LETT |i| 2 . #2#)
                     (LETT #1# (QUOTIENT2 (QREFELT $ 17) |d|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |erg| (SPADCALL |erg| |v| (QREFELT $ 150))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |erg|)))) 

(SDEFUN |FFNBP;characteristic;Nni;32| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 151))) 

(SDEFUN |FFNBP;random;$;33| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 153))) 

(SDEFUN |FFNBP;*;3$;34| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 155))))) 

(SDEFUN |FFNBP;One;$;35| (($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL (QREFELT $ 45) (QREFELT $ 156)))) 

(SDEFUN |FFNBP;Zero;$;36| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 157))) 

(SDEFUN |FFNBP;size;Nni;37| (($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL (QREFELT $ 120)) (QREFELT $ 17) (QREFELT $ 121))) 

(SDEFUN |FFNBP;index;Pi$;38| ((|n| |PositiveInteger|) ($ $))
        (SPADCALL (QREFELT $ 17) |n| (QREFELT $ 159))) 

(SDEFUN |FFNBP;lookup;$Pi;39| ((|x| $) ($ |PositiveInteger|))
        (SPADCALL |x| (QREFELT $ 160))) 

(SDEFUN |FFNBP;basis;V;40| (($ |Vector| $))
        (SPROG
         ((#1=#:G240 NIL) (|e| NIL) (#2=#:G239 NIL)
          (|a| (|Vector| (|Vector| GF))))
         (SEQ
          (LETT |a| (SPADCALL (QREFELT $ 17) (QREFELT $ 162))
                . #3=(|FFNBP;basis;V;40|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |e| NIL . #3#)
                  (LETT #1# (SPADCALL |a| (QREFELT $ 164)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |e| #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 167)))))) 

(SDEFUN |FFNBP;^;$I$;41| ((|x| $) (|e| |Integer|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |e| (QREFELT $ 169))))) 

(SDEFUN |FFNBP;normal?;$B;42| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 170))) 

(SDEFUN |FFNBP;-;2$;43| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 172))) 

(SDEFUN |FFNBP;+;3$;44| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 174))) 

(SDEFUN |FFNBP;-;3$;45| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 176))) 

(SDEFUN |FFNBP;=;2$B;46| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 178))) 

(SDEFUN |FFNBP;*;I2$;47| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |x| (SPADCALL |n| (QREFELT $ 180)) (QREFELT $ 181))) 

(PUT '|FFNBP;representationType;U;48| '|SPADreplace|
     '(XLAM NIL (CONS 2 "normal"))) 

(SDEFUN |FFNBP;representationType;U;48|
        (($ |Union| "prime" "polynomial" "normal" "cyclic")) (CONS 2 "normal")) 

(SDEFUN |FFNBP;minimalPolynomial;$Sup;49|
        ((|a| $) ($ |SparseUnivariatePolynomial| GF))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |a| (QREFELT $ 36))))) 

(SDEFUN |FFNBP;inGroundField?;$B;50| ((|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G266 NIL) (|erg| (|Boolean|)) (#2=#:G267 NIL) (|i| NIL))
               (SEQ (LETT |erg| 'T . #3=(|FFNBP;inGroundField?;$B;50|))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| 2 . #3#) (LETT #2# (QREFELT $ 17) . #3#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| (QREFELT $ 104))
                                          (SPADCALL |x| 1 (QREFELT $ 104))
                                          (QREFELT $ 110)))
                               (PROGN
                                (LETT #1# (LETT |erg| 'NIL . #3#) . #3#)
                                (GO #4=#:G263))))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #4# (EXIT #1#))
                    (EXIT |erg|)))) 

(SDEFUN |FFNBP;/;3$;51| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 186))))) 

(SDEFUN |FFNBP;inv;2$;52| ((|a| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |a| (QREFELT $ 187))))) 

(SDEFUN |FFNBP;norm;$Pi$;53| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 45) (QREFELT $ 34))
             (EXIT (SPADCALL |a| |d| (QREFELT $ 189))))) 

(SDEFUN |FFNBP;normalElement;$;54| (($ $))
        (SPADCALL (QREFELT $ 17) (QREFELT $ 90))) 

(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial| (&REST #1=#:G295)
  (SPROG NIL
         (PROG (#2=#:G296)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtensionByPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasisExtensionByPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |FiniteFieldNormalBasisExtensionByPolynomial;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G121 NIL) (#2=#:G294 NIL) (|i| NIL) (#3=#:G293 NIL) (|qs| NIL)
    (|pv$| NIL) (#4=#:G292 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|)
           . #5=(|FiniteFieldNormalBasisExtensionByPolynomial|))
     (LETT DV$2 (|devaluate| |#2|) . #5#)
     (LETT |dv$|
           (LIST '|FiniteFieldNormalBasisExtensionByPolynomial| DV$1 DV$2)
           . #5#)
     (LETT $ (GETREFV 209) . #5#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (LETT #4#
                                               (|HasCategory| |#1| '(|Finite|))
                                               . #5#)
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          #4#)))
                     . #5#))
     (|haddProp| |$ConstructorCache|
                 '|FiniteFieldNormalBasisExtensionByPolynomial|
                 (LIST DV$1 DV$2) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 8 (|Vector| |#1|))
     (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
     (QSETREFV $ 14 'T)
     (QSETREFV $ 15 'T)
     (QSETREFV $ 16 'T)
     (QSETREFV $ 17 1)
     (QSETREFV $ 20 (|spadConstant| $ 19))
     (QSETREFV $ 23 (MAKEARR1 1 NIL))
     (COND
      ((QEQCAR |#2| 1)
       (PROGN
        (SETELT $ 23 (QCDR |#2|))
        (SETELT $ 17 (QVSIZE (QREFELT $ 23)))
        (QSETREFV $ 26 (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 25)))
        (SPADCALL (QREFELT $ 26) 1 (|spadConstant| $ 27) (QREFELT $ 29))
        (SPADCALL (QREFELT $ 23) (|spadConstant| $ 27) (QREFELT $ 34))
        (SETELT $ 20 (SPADCALL (QREFELT $ 26) (QREFELT $ 36)))
        (SETELT $ 16 'NIL)))
      ('T
       (PROGN
        (SETELT $ 20 (QCDR |#2|))
        (SETELT $ 17 (SPADCALL (QREFELT $ 20) (QREFELT $ 38)))
        (SETELT $ 23 (MAKEARR1 (QREFELT $ 17) NIL)))))
     (QSETREFV $ 41
               (SEQ (LETT |qs| (SPADCALL '|q| (QREFELT $ 12)) . #5#)
                    (EXIT
                     (APPEND
                      (LIST (QREFELT $ 13)
                            (SPADCALL (QREFELT $ 13) |qs| (QREFELT $ 39)))
                      (PROGN
                       (LETT #3# NIL . #5#)
                       (SEQ (LETT |i| 2 . #5#)
                            (LETT #2# (- (QREFELT $ 17) 1) . #5#) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL (QREFELT $ 13)
                                               (SPADCALL |qs|
                                                         (SPADCALL |i|
                                                                   (QREFELT $
                                                                            40))
                                                         (QREFELT $ 39))
                                               (QREFELT $ 39))
                                     #3#)
                                    . #5#)))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))))))
     (QSETREFV $ 42 NIL)
     (QSETREFV $ 45
               (SPADCALL
                (SPADCALL (QREFELT $ 20)
                          (PROG1
                              (LETT #1#
                                    (- (SPADCALL (QREFELT $ 20) (QREFELT $ 38))
                                       1)
                                    . #5#)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 43))
                (QREFELT $ 44)))
     (QSETREFV $ 46 1)
     (QSETREFV $ 49 (SPADCALL (QREFELT $ 48)))
     $)))) 

(MAKEPROP '|FiniteFieldNormalBasisExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Symbol|) (0 . |new|) (|OutputForm|) (4 . |coerce|) '|alpha|
              '|initlog?| '|initelt?| '|initmult?| '|extdeg|
              (|SparseUnivariatePolynomial| 6) (9 . |Zero|) '|defpol|
              (13 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFNBP;One;$;35|) $))
              '|multTable|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FFNBP;Zero;$;36|) $))
              (17 . |Zero|) '|vv| (21 . |One|) (|Integer|) (25 . |setelt!|)
              (|Void|) (|Record| (|:| |value| 6) (|:| |index| 208))
              (|Vector| (|List| 31)) (|InnerNormalBasisFieldFunctions| 6)
              (32 . |setFieldInfo|) (|Vector| 6) (38 . |minimalPolynomial|)
              (|NonNegativeInteger|) (43 . |degree|) (48 . ^) (54 . |coerce|)
              '|basisOutput| '|facOfGroupSize| (59 . |coefficient|) (65 . -)
              '|traceAlpha| '|primitiveElt| (|Table| 56 134) (70 . |table|)
              '|discLogTable| (74 . /) |FFNBP;coerce;GF$;1|
              |FFNBP;represents;V$;2| (80 . |qPot|) (|Boolean|) (86 . ~=)
              (|PositiveInteger|) |FFNBP;degree;$Pi;3| (92 . |monomial|)
              (98 . -) (104 . |pol|) (109 . *) (115 . |rem|)
              (121 . |vectorise|) |FFNBP;linearAssociatedExp;$Sup$;4|
              |FFNBP;linearAssociatedLog;$Sup;5| (127 . |gcd|) (133 . |quo|)
              |FFNBP;linearAssociatedOrder;$Sup;6| (139 . |zero?|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 70 '#1="failed") (144 . |extendedEuclidean|)
              (|Record| (|:| |coef1| 18) (|:| |coef2| 18)) (|Union| 73 '#1#)
              (151 . =) (|Union| 18 '"failed")
              |FFNBP;linearAssociatedLog;2$U;7|
              |FFNBP;getMultiplicationTable;V;8| (|Matrix| 6)
              (|FiniteFieldFunctions| 6) (157 . |createMultiplicationMatrix|)
              |FFNBP;getMultiplicationMatrix;M;9| (162 . |sizeMultiplication|)
              |FFNBP;sizeMultiplication;Nni;10| |FFNBP;trace;$Pi$;31|
              |FFNBP;retract;$GF;21| |FFNBP;trace;$GF;11| |FFNBP;norm;$Pi$;53|
              |FFNBP;norm;$GF;12| (167 . |normalElement|)
              |FFNBP;generator;$;13| (172 . ~=) |FFNBP;normalElement;$;54|
              |FFNBP;Frobenius;$Nni$;19| (|Vector| $) |FFNBP;basis;PiV;14|
              (178 . *) |FFNBP;*;GF2$;15| |FFNBP;/;3$;51| |FFNBP;/;$GF$;16|
              |FFNBP;coordinates;$V;17| |FFNBP;Frobenius;2$;18|
              |FFNBP;inGroundField?;$B;50| (184 . |elt|) (190 . *)
              (|Union| 6 '"failed") |FFNBP;retractIfCan;$U;20| (196 . |coerce|)
              (201 . |zero?|) (206 . =) (212 . *) (|Fraction| 18)
              (218 . |Zero|) (222 . |coerce|) (227 . +) (|Mapping| 11 11 11)
              (|List| 11) (233 . |reduce|) |FFNBP;coerce;$Of;22| (239 . |size|)
              (243 . ^) (|Factored| $) (249 . |factor|)
              (|Record| (|:| |factor| 28) (|:| |exponent| 28)) (|List| 124)
              (|Factored| 28) (254 . |factors|)
              (259 . |createPrimitiveElement|) |FFNBP;lookup;$Pi;39|
              (263 . |void|) (267 . |createMultiplicationTable|)
              |FFNBP;index;Pi$;38| |FFNBP;^;$I$;41| (|Table| 56 37)
              (272 . |table|) (|Record| (|:| |key| 56) (|:| |entry| 37))
              (276 . |insert!|) |FFNBP;*;3$;34| (282 . |copy|)
              (|Record| (|:| |key| 56) (|:| |entry| 134)) (287 . |insert!|)
              (|Union| 134 '"failed") (293 . |search|)
              |FFNBP;tableForDiscreteLogarithm;IT;26|
              |FFNBP;primitiveElement;$;27|
              |FFNBP;factorsOfCyclicGroupSize;L;28|
              |FFNBP;extensionDegree;Pi;29| |FFNBP;definingPolynomial;Sup;30|
              (299 . |trace|) (305 . |concat|) (311 . |characteristic|)
              |FFNBP;characteristic;Nni;32| (315 . |random|)
              |FFNBP;random;$;33| (320 . *) (326 . |inv|) (331 . |zero|)
              |FFNBP;size;Nni;37| (336 . |index|) (342 . |lookup|)
              (|Vector| 35) (347 . |basis|) (|List| 35) (352 . |entries|)
              (|List| $$) (|Vector| $$) (357 . |vector|) |FFNBP;basis;V;40|
              (362 . ^) (368 . |normal?|) |FFNBP;normal?;$B;42| (373 . -)
              |FFNBP;-;2$;43| (378 . +) |FFNBP;+;3$;44| (384 . -)
              |FFNBP;-;3$;45| (390 . =) |FFNBP;=;2$B;46| (396 . |coerce|)
              (401 . *) |FFNBP;*;I2$;47|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFNBP;representationType;U;48| |FFNBP;minimalPolynomial;$Sup;49|
              (407 . /) (413 . |inv|) |FFNBP;inv;2$;52| (418 . |norm|)
              (|OnePointCompletion| 56) (|Union| $ '"failed")
              (|Union| 37 '"failed") (|List| $) (|InputForm|)
              (|Union| 95 '"failed") (|Matrix| $)
              (|SparseUnivariatePolynomial| $) (|CardinalNumber|)
              (|Fraction| 28) (|Union| 193 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 193) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 424 |zero?| 430 |unitNormal| 435 |unitCanonical| 440 |unit?|
              445 |transcendent?| 450 |transcendenceDegree| 455 |trace| 459
              |tableForDiscreteLogarithm| 470 |subtractIfCan| 475
              |squareFreePart| 481 |squareFree| 486 |sizeMultiplication| 491
              |sizeLess?| 495 |size| 501 |sample| 505 |retractIfCan| 509
              |retract| 514 |represents| 519 |representationType| 524 |rem| 528
              |recip| 534 |random| 539 |quo| 543 |principalIdeal| 549
              |primitiveElement| 554 |primitive?| 558 |primeFrobenius| 563
              |prime?| 574 |order| 579 |opposite?| 589 |one?| 595
              |normalElement| 600 |normal?| 604 |norm| 609 |nextItem| 620
              |multiEuclidean| 625 |minimalPolynomial| 631 |lookup| 642
              |linearAssociatedOrder| 647 |linearAssociatedLog| 652
              |linearAssociatedExp| 663 |lcmCoef| 669 |lcm| 675 |latex| 686
              |inv| 691 |init| 696 |index| 700 |inGroundField?| 705
              |hashUpdate!| 710 |hash| 716 |getMultiplicationTable| 721
              |getMultiplicationMatrix| 725 |generator| 729 |gcdPolynomial| 733
              |gcd| 739 |factorsOfCyclicGroupSize| 750 |factor| 754
              |extensionDegree| 759 |extendedEuclidean| 767 |exquo| 780
              |expressIdealMember| 786 |euclideanSize| 792 |enumerate| 797
              |divide| 801 |discreteLog| 807 |dimension| 818 |differentiate|
              822 |degree| 833 |definingPolynomial| 843
              |createPrimitiveElement| 847 |createNormalElement| 851
              |coordinates| 855 |convert| 865 |conditionP| 870 |coerce| 875
              |charthRoot| 900 |characteristic| 910 |basis| 914 |associates?|
              923 |annihilate?| 929 |algebraic?| 935 ^ 940 |Zero| 958 |One| 962
              |Frobenius| 966 D 977 = 988 / 994 - 1006 + 1017 * 1023)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 0 0
                                  0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |VectorSpace&| |Algebra&| NIL
                |Algebra&| |Module&| |Module&| NIL |EntireRing&| |Module&| NIL
                NIL |DifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |Rng&| NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&|
                NIL |SemiGroup&| |AbelianSemiGroup&| |Finite&| NIL
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|VectorSpace| 6) (|Algebra| 199)
                 (|LeftOreRing|) (|Algebra| $$) (|Module| 6) (|Module| 199)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 199 199)
                 (|BiModule| $$ $$) (|Ring|) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| 199) (|LeftModule| 199) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Finite|) (|StepThrough|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 11) (|ConvertibleTo| 194))
              (|makeByteWordVec2| 208
                                  '(0 9 0 10 1 9 11 0 12 0 18 0 19 0 18 0 21 0
                                    6 0 25 0 6 0 27 3 8 6 0 28 6 29 2 33 30 32
                                    6 34 1 33 18 35 36 1 18 37 0 38 2 11 0 0 0
                                    39 1 37 11 0 40 2 18 6 0 37 43 1 6 0 0 44 0
                                    47 0 48 2 6 0 0 0 50 2 33 35 35 28 53 2 0
                                    54 0 0 55 2 18 0 6 37 58 2 18 0 0 0 59 1 33
                                    18 35 60 2 18 0 0 0 61 2 18 0 0 0 62 2 18
                                    35 0 37 63 2 18 0 0 0 66 2 18 0 0 0 67 1 0
                                    54 0 69 3 18 71 0 0 0 72 2 74 54 0 0 75 1
                                    80 79 32 81 1 80 37 32 83 1 33 35 56 90 2
                                    37 54 0 0 92 2 8 0 6 0 97 2 8 6 0 28 104 2
                                    6 0 0 0 105 1 6 11 0 108 1 6 54 0 109 2 6
                                    54 0 0 110 2 11 0 0 0 111 0 112 0 113 1 18
                                    11 0 114 2 11 0 0 0 115 2 117 11 116 0 118
                                    0 6 37 120 2 37 0 0 56 121 1 28 122 0 123 1
                                    126 125 0 127 0 0 0 128 0 30 0 130 1 80 32
                                    18 131 0 134 0 135 2 134 0 136 0 137 1 134
                                    0 0 139 2 47 0 140 0 141 2 47 142 56 0 143
                                    2 33 35 35 56 149 2 8 0 0 0 150 0 6 37 151
                                    1 33 35 56 153 2 33 35 35 35 155 1 6 0 0
                                    156 1 8 0 37 157 2 33 35 56 56 159 1 33 56
                                    35 160 1 33 161 56 162 1 161 163 0 164 1
                                    166 0 165 167 2 33 35 35 28 169 1 33 54 35
                                    170 1 8 0 0 172 2 8 0 0 0 174 2 8 0 0 0 176
                                    2 8 54 0 0 178 1 6 0 28 180 2 8 0 0 6 181 2
                                    33 35 35 35 186 1 33 35 35 187 2 33 35 35
                                    56 189 2 0 54 0 0 55 1 0 54 0 69 1 0 205 0
                                    1 1 0 0 0 1 1 0 54 0 1 1 0 54 0 1 0 0 37 1
                                    2 2 0 0 56 85 1 0 6 0 87 1 2 134 28 144 2 0
                                    191 0 0 1 1 0 0 0 1 1 0 122 0 1 0 0 37 84 2
                                    0 54 0 0 1 0 2 37 158 0 0 0 1 1 0 106 0 107
                                    1 0 6 0 86 1 0 0 35 52 0 2 183 184 2 0 0 0
                                    0 1 1 0 191 0 1 0 2 0 154 2 0 0 0 0 1 1 0
                                    203 193 1 0 2 0 145 1 2 54 0 1 1 3 0 0 1 2
                                    3 0 0 37 1 1 0 54 0 1 1 3 190 0 1 1 2 56 0
                                    1 2 0 54 0 0 1 1 0 54 0 1 0 2 0 93 1 2 54 0
                                    171 2 2 0 0 56 88 1 0 6 0 89 1 2 191 0 1 2
                                    0 200 193 0 1 2 2 197 0 56 1 1 0 18 0 185 1
                                    2 56 0 129 1 2 18 0 68 2 2 76 0 0 77 1 2 18
                                    0 65 2 2 0 0 18 64 2 0 204 0 0 1 1 0 0 193
                                    1 2 0 0 0 0 1 1 0 207 0 1 1 0 0 0 188 0 2 0
                                    1 1 2 0 56 132 1 0 54 0 103 2 0 206 206 0 1
                                    1 0 208 0 1 0 0 32 78 0 0 79 82 0 2 0 91 2
                                    0 197 197 197 1 1 0 0 193 1 2 0 0 0 0 1 0 2
                                    125 146 1 0 122 0 1 0 0 56 147 0 0 190 1 3
                                    0 71 0 0 0 1 2 0 201 0 0 1 2 0 191 0 0 1 2
                                    0 200 193 0 1 1 0 37 0 1 0 2 193 1 2 0 202
                                    0 0 1 2 3 192 0 0 1 1 2 37 0 1 0 0 198 1 2
                                    2 0 0 37 1 1 2 0 0 1 1 0 56 0 57 1 0 190 0
                                    1 0 0 18 148 0 2 0 128 0 2 0 1 1 0 35 0 101
                                    1 0 79 95 1 1 2 194 0 1 1 2 195 196 1 1 0 0
                                    6 51 1 0 0 199 1 1 0 0 0 1 1 0 0 28 1 1 0
                                    11 0 119 1 3 191 0 1 1 2 0 0 1 0 0 37 152 0
                                    0 95 168 1 0 95 56 96 2 0 54 0 0 1 2 0 54 0
                                    0 1 1 0 54 0 1 2 0 0 0 28 133 2 0 0 0 37 1
                                    2 0 0 0 56 1 0 0 0 24 0 0 0 22 1 2 0 0 102
                                    2 2 0 0 37 94 2 2 0 0 37 1 1 2 0 0 1 2 0 54
                                    0 0 179 2 0 0 0 6 100 2 0 0 0 0 99 1 0 0 0
                                    173 2 0 0 0 0 177 2 0 0 0 0 175 2 0 0 0 6 1
                                    2 0 0 6 0 98 2 0 0 0 199 1 2 0 0 199 0 1 2
                                    0 0 28 0 182 2 0 0 0 0 138 2 0 0 37 0 1 2 0
                                    0 56 0 1)))))
           '|lookupComplete|)) 
