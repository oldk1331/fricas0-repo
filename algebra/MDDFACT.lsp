
(SDEFUN |MDDFACT;reduction| ((|u| U) (|p| |Integer|) ($ U))
        (SPROG NIL
               (COND ((ZEROP |p|) |u|)
                     ('T
                      (SPADCALL (CONS #'|MDDFACT;reduction!0| (VECTOR $ |p|))
                                |u| (QREFELT $ 10)))))) 

(SDEFUN |MDDFACT;reduction!0| ((|i1| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|MDDFACT;reduction|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |i1| |p| (QREFELT $ 8)))))) 

(SDEFUN |MDDFACT;merge|
        ((|p| |Integer|) (|q| |Integer|) ($ |Union| (|Integer|) "failed"))
        (COND ((EQL |p| |q|) (CONS 0 |p|)) ((EQL |p| 0) (CONS 0 |q|))
              ((EQL |q| 0) (CONS 0 |p|)) ('T (CONS 1 "failed")))) 

(SDEFUN |MDDFACT;modInverse| ((|c| |Integer|) (|p| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G125 NIL))
               (QCAR
                (PROG2
                    (LETT #1# (SPADCALL |c| |p| 1 (QREFELT $ 15))
                          |MDDFACT;modInverse|)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|Record| (|:| |coef1| (|Integer|))
                                           (|:| |coef2| (|Integer|)))
                                 #1#))))) 

(SDEFUN |MDDFACT;exactquo|
        ((|u| U) (|v| U) (|p| |Integer|) ($ |Union| U "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| U) (|:| |remainder| U)))
          (|invlcv| (|Integer|)))
         (SEQ
          (LETT |invlcv|
                (|MDDFACT;modInverse| (SPADCALL |v| (QREFELT $ 16)) |p| $)
                . #1=(|MDDFACT;exactquo|))
          (LETT |r|
                (SPADCALL |u|
                          (|MDDFACT;reduction|
                           (SPADCALL |invlcv| |v| (QREFELT $ 17)) |p| $)
                          (QREFELT $ 19))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (|MDDFACT;reduction| (QCDR |r|) |p| $)
                       (|spadConstant| $ 11) (QREFELT $ 21))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (|MDDFACT;reduction|
                    (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 17)) |p| $)))))))) 

(SDEFUN |MDDFACT;lc| ((|u| EMR) ($ |Integer|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 23)) (QREFELT $ 16))) 

(SDEFUN |MDDFACT;degree| ((|u| EMR) ($ |Integer|))
        (SPADCALL (SPADCALL |u| (QREFELT $ 23)) (QREFELT $ 25))) 

(SDEFUN |MDDFACT;makeMonic| ((|u| EMR) ($ EMR))
        (SPADCALL
         (|MDDFACT;modInverse| (|MDDFACT;lc| |u| $)
          (SPADCALL |u| (QREFELT $ 26)) $)
         |u| (QREFELT $ 27))) 

(SDEFUN |MDDFACT;exptmod| ((|u1| EMR) (|i| |Integer|) (|u2| EMR) ($ EMR))
        (SPROG ((|ans| (EMR)))
               (SEQ
                (COND
                 ((< |i| 0)
                  (|error| "negative exponentiation not allowed for exptMod"))
                 ('T
                  (SEQ
                   (LETT |ans| (|spadConstant| $ 28) . #1=(|MDDFACT;exptmod|))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |i| 0 (QREFELT $ 29))) (GO G191)))
                        (SEQ
                         (COND
                          ((ODDP |i|)
                           (LETT |ans|
                                 (SPADCALL (SPADCALL |ans| |u1| (QREFELT $ 30))
                                           |u2| (QREFELT $ 31))
                                 . #1#)))
                         (LETT |i| (QUOTIENT2 |i| 2) . #1#)
                         (EXIT
                          (LETT |u1|
                                (SPADCALL (SPADCALL |u1| |u1| (QREFELT $ 30))
                                          |u2| (QREFELT $ 31))
                                . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |ans|))))))) 

(SDEFUN |MDDFACT;exptMod;UIUIU;9|
        ((|a| U) (|i| |Integer|) (|b| U) (|q| |Integer|) ($ U))
        (SPROG ((|ans| (EMR)))
               (SEQ
                (LETT |ans|
                      (|MDDFACT;exptmod| (SPADCALL |a| |q| (QREFELT $ 32)) |i|
                       (SPADCALL |b| |q| (QREFELT $ 32)) $)
                      |MDDFACT;exptMod;UIUIU;9|)
                (EXIT (SPADCALL |ans| (QREFELT $ 23)))))) 

(SDEFUN |MDDFACT;ddfactor| ((|u| EMR) ($ |List| EMR))
        (SPROG
         ((#1=#:G164 NIL) (|f| NIL) (#2=#:G163 NIL) (|ans| (|List| EMR))
          (|c| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |c| (|MDDFACT;lc| |u| $) . #3=(|MDDFACT;ddfactor|))
                      1 (QREFELT $ 34))
            (LETT |u| (|MDDFACT;makeMonic| |u| $) . #3#)))
          (LETT |ans| (|MDDFACT;sepfact| (|MDDFACT;ddfact| |u| $) $) . #3#)
          (EXIT
           (CONS (SPADCALL |c| (QREFELT $ 35))
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |f| NIL . #3#) (LETT #1# |ans| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (|MDDFACT;degree| |f| $) 0 (QREFELT $ 29))
                           (LETT #2# (CONS (|MDDFACT;makeMonic| |f| $) #2#)
                                 . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |MDDFACT;gcd;2UIU;11| ((|u| U) (|v| U) (|q| |Integer|) ($ U))
        (SPADCALL
         (SPADCALL (SPADCALL |u| |q| (QREFELT $ 32))
                   (SPADCALL |v| |q| (QREFELT $ 32)) (QREFELT $ 36))
         (QREFELT $ 23))) 

(SDEFUN |MDDFACT;factor;UIL;12| ((|u| U) (|q| |Integer|) ($ |List| U))
        (SPROG
         ((#1=#:G171 NIL) (|f| NIL) (#2=#:G170 NIL) (|ans| (|List| EMR))
          (|dv| (EMR)) (|v| (EMR)))
         (SEQ
          (LETT |v| (SPADCALL |u| |q| (QREFELT $ 32))
                . #3=(|MDDFACT;factor;UIL;12|))
          (LETT |dv|
                (SPADCALL (SPADCALL |u| (QREFELT $ 38)) |q| (QREFELT $ 32))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL (|MDDFACT;degree| (SPADCALL |v| |dv| (QREFELT $ 36)) $)
                       0 (QREFELT $ 29))
             (|error| "Modular factor: polynomial must be squarefree"))
            ('T
             (SEQ (LETT |ans| (|MDDFACT;ddfactor| |v| $) . #3#)
                  (EXIT
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |f| NIL . #3#) (LETT #1# |ans| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (SPADCALL |f| (QREFELT $ 23)) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |MDDFACT;ddfact|
        ((|u| EMR)
         ($ |List| (|Record| (|:| |factor| EMR) (|:| |degree| (|Integer|)))))
        (SPROG
         ((#1=#:G176 NIL) (#2=#:G180 NIL) (|d| (|Integer|))
          (|ans|
           (|List| (|Record| (|:| |factor| EMR) (|:| |degree| (|Integer|)))))
          (|g| (EMR)) (|w| (EMR)) (|c| (|Integer|)) (|m| (EMR))
          (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |p| (SPADCALL |u| (QREFELT $ 26)) . #3=(|MDDFACT;ddfact|))
            (LETT |w|
                  (SPADCALL (SPADCALL 1 1 (QREFELT $ 41)) |p| (QREFELT $ 32))
                  . #3#)
            (LETT |m| |w| . #3#) (LETT |d| 1 . #3#)
            (COND
             ((SPADCALL (LETT |c| (|MDDFACT;lc| |u| $) . #3#) 1 (QREFELT $ 34))
              (LETT |u| (|MDDFACT;makeMonic| |u| $) . #3#)))
            (LETT |ans| NIL . #3#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (LETT |w| (|MDDFACT;exptmod| |w| |p| |u| $) . #3#)
                       (LETT |g|
                             (SPADCALL (SPADCALL |w| |m| (QREFELT $ 42)) |u|
                                       (QREFELT $ 36))
                             . #3#)
                       (COND
                        ((SPADCALL (|MDDFACT;degree| |g| $) 0 (QREFELT $ 29))
                         (SEQ (LETT |g| (|MDDFACT;makeMonic| |g| $) . #3#)
                              (LETT |ans| (CONS (CONS |g| |d|) |ans|) . #3#)
                              (EXIT
                               (LETT |u| (SPADCALL |u| |g| (QREFELT $ 43))
                                     . #3#)))))
                       (EXIT
                        (COND
                         ((EQL (|MDDFACT;degree| |u| $) 0)
                          (PROGN
                           (LETT #2#
                                 (CONS (CONS (SPADCALL |c| (QREFELT $ 35)) 0)
                                       |ans|)
                                 . #3#)
                           (GO #2#)))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ (LETT |d| (+ |d| 1) . #3#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |d|
                                              (QUOTIENT2
                                               (|MDDFACT;degree| |u| $) 2)
                                              (QREFELT $ 29))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2#
                                                  (CONS
                                                   (CONS
                                                    (SPADCALL |c|
                                                              (QREFELT $ 35))
                                                    0)
                                                   (CONS
                                                    (CONS |u|
                                                          (|MDDFACT;degree| |u|
                                                           $))
                                                    |ans|))
                                                  . #3#)
                                            (GO #2#))
                                           . #3#)
                                     (GO #1#)))))))
                           #1# (EXIT #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #2#)))) 

(SDEFUN |MDDFACT;ddFact;UIL;14|
        ((|u| U) (|q| |Integer|)
         ($ |List| (|Record| (|:| |factor| U) (|:| |degree| (|Integer|)))))
        (SPROG
         ((#1=#:G189 NIL) (|dd| NIL) (#2=#:G188 NIL)
          (|ans|
           (|List| (|Record| (|:| |factor| EMR) (|:| |degree| (|Integer|))))))
         (SEQ
          (LETT |ans| (|MDDFACT;ddfact| (SPADCALL |u| |q| (QREFELT $ 32)) $)
                . #3=(|MDDFACT;ddFact;UIL;14|))
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |dd| NIL . #3#) (LETT #1# |ans| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS (SPADCALL (QCAR |dd|) (QREFELT $ 23))
                                (QCDR |dd|))
                          #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MDDFACT;linears;UIU;15| ((|u| U) (|q| |Integer|) ($ U))
        (SPROG ((|m| (EMR)) (|uu| (EMR)))
               (SEQ
                (LETT |uu| (SPADCALL |u| |q| (QREFELT $ 32))
                      . #1=(|MDDFACT;linears;UIU;15|))
                (LETT |m|
                      (SPADCALL (SPADCALL 1 1 (QREFELT $ 41)) |q|
                                (QREFELT $ 32))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|MDDFACT;exptmod| |m| |q| |uu| $) |m|
                             (QREFELT $ 42))
                   |uu| (QREFELT $ 36))
                  (QREFELT $ 23)))))) 

(SDEFUN |MDDFACT;sepfact|
        ((|factList| |List|
          (|Record| (|:| |factor| EMR) (|:| |degree| (|Integer|))))
         ($ |List| EMR))
        (SPROG
         ((#1=#:G194 NIL) (#2=#:G193 #3=(|List| EMR)) (#4=#:G195 #3#)
          (#5=#:G197 NIL) (|f| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|MDDFACT;sepfact|))
           (SEQ (LETT |f| NIL . #6#) (LETT #5# |factList| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (|MDDFACT;sepFact1| |f| $) . #6#)
                   (COND (#1# (LETT #2# (APPEND #2# #4#) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T NIL)))))) 

(SDEFUN |MDDFACT;separateFactors;LIL;17|
        ((|uddList| |List|
          (|Record| (|:| |factor| U) (|:| |degree| (|Integer|))))
         (|q| |Integer|) ($ |List| U))
        (SPROG
         ((#1=#:G207 NIL) (|f| NIL) (#2=#:G206 NIL) (|ans| (|List| EMR))
          (#3=#:G205 NIL) (|udd| NIL) (#4=#:G204 NIL))
         (SEQ
          (LETT |ans|
                (|MDDFACT;sepfact|
                 (PROGN
                  (LETT #4# NIL . #5=(|MDDFACT;separateFactors;LIL;17|))
                  (SEQ (LETT |udd| NIL . #5#) (LETT #3# |uddList| . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |udd| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (CONS
                                 (SPADCALL (QCAR |udd|) |q| (QREFELT $ 32))
                                 (QCDR |udd|))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 $)
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |f| NIL . #5#) (LETT #1# |ans| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |f| (QREFELT $ 23)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |MDDFACT;decode| ((|s| |Integer|) (|p| |Integer|) (|x| U) ($ U))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((< |s| |p|) (SPADCALL |s| (QREFELT $ 49)))
                ('T
                 (SEQ (LETT |qr| (DIVIDE2 |s| |p|) |MDDFACT;decode|)
                      (EXIT
                       (SPADCALL (SPADCALL (QCDR |qr|) (QREFELT $ 49))
                                 (SPADCALL |x|
                                           (|MDDFACT;decode| (QCAR |qr|) |p|
                                            |x| $)
                                           (QREFELT $ 50))
                                 (QREFELT $ 51))))))))) 

(SDEFUN |MDDFACT;sepFact1|
        ((|f| |Record| (|:| |factor| EMR) (|:| |degree| #1=(|Integer|)))
         ($ |List| EMR))
        (SPROG
         ((#2=#:G226 NIL) (|x| (U)) (|ss| (|Integer|)) (|s| (|Integer|))
          (|ans| (|List| EMR)) (|stack| (|List| EMR)) (|df1| #3=(|Integer|))
          (|f1| (EMR)) (#4=#:G235 NIL) (|fact| NIL)
          (|flist| (|Union| (|List| EMR) "failed")) (|t| (EMR)) (#5=#:G234 NIL)
          (|y| (U)) (|du| #3#) (|i| NIL) (|u| (EMR)) (|c| (|Integer|))
          (|d| #1#) (|p| (|Integer|)))
         (SEQ (LETT |u| (QCAR |f|) . #6=(|MDDFACT;sepFact1|))
              (LETT |p| (SPADCALL |u| (QREFELT $ 26)) . #6#)
              (LETT |d| (QCDR |f|) . #6#)
              (EXIT
               (COND ((EQL |d| 0) (LIST |u|))
                     (#7='T
                      (SEQ
                       (COND
                        ((SPADCALL (LETT |c| (|MDDFACT;lc| |u| $) . #6#) 1
                                   (QREFELT $ 34))
                         (LETT |u| (|MDDFACT;makeMonic| |u| $) . #6#)))
                       (LETT |du| (|MDDFACT;degree| |u| $) . #6#)
                       (EXIT
                        (COND ((EQL |d| |du|) (LIST |u|))
                              (#7#
                               (SEQ (LETT |ans| NIL . #6#)
                                    (LETT |x| (SPADCALL 1 1 (QREFELT $ 41))
                                          . #6#)
                                    (COND
                                     ((EQL |d| 1)
                                      (COND
                                       ((< |p| 1000)
                                        (EXIT
                                         (SEQ
                                          (SEQ (LETT |i| 0 . #6#) G190
                                               (COND
                                                ((NULL
                                                  (SPADCALL |du| 0
                                                            (QREFELT $ 29)))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |u|
                                                              (SPADCALL |i|
                                                                        (QREFELT
                                                                         $ 49))
                                                              (QREFELT $ 52))
                                                    (|spadConstant| $ 11)
                                                    (QREFELT $ 53))
                                                   (SEQ
                                                    (LETT |ans|
                                                          (CONS
                                                           (SPADCALL
                                                            (SPADCALL |x|
                                                                      (SPADCALL
                                                                       |i|
                                                                       (QREFELT
                                                                        $ 49))
                                                                      (QREFELT
                                                                       $ 54))
                                                            |p| (QREFELT $ 32))
                                                           |ans|)
                                                          . #6#)
                                                    (EXIT
                                                     (LETT |du| (- |du| 1)
                                                           . #6#)))))))
                                               (LETT |i| (|inc_SI| |i|) . #6#)
                                               (GO G190) G191 (EXIT NIL))
                                          (EXIT |ans|)))))))
                                    (LETT |y| |x| . #6#) (LETT |s| 0 . #6#)
                                    (LETT |ss| 1 . #6#)
                                    (LETT |stack| (LIST |u|) . #6#)
                                    (SEQ (LETT #5# NIL . #6#) G190
                                         (COND (#5# (GO G191)))
                                         (SEQ
                                          (LETT |t|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |s| (QREFELT $ 49))
                                                  |x| (QREFELT $ 51))
                                                 |p| (QREFELT $ 32))
                                                . #6#)
                                          (SEQ
                                           (LETT |flist|
                                                 (|MDDFACT;probSplit|
                                                  (|SPADfirst| |stack|) |t| |d|
                                                  $)
                                                 . #6#)
                                           (EXIT
                                            (COND
                                             ((NULL (QEQCAR |flist| 1))
                                              (SEQ
                                               (LETT |stack| (CDR |stack|)
                                                     . #6#)
                                               (EXIT
                                                (SEQ (LETT |fact| NIL . #6#)
                                                     (LETT #4# (QCDR |flist|)
                                                           . #6#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #4#)
                                                           (PROGN
                                                            (LETT |fact|
                                                                  (CAR #4#)
                                                                  . #6#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |f1|
                                                            (|MDDFACT;makeMonic|
                                                             |fact| $)
                                                            . #6#)
                                                      (LETT |df1|
                                                            (|MDDFACT;degree|
                                                             |f1| $)
                                                            . #6#)
                                                      (EXIT
                                                       (COND
                                                        ((EQL |df1| 0) NIL)
                                                        ((SPADCALL |df1| |d|
                                                                   (QREFELT $
                                                                            29))
                                                         (LETT |stack|
                                                               (CONS |f1|
                                                                     |stack|)
                                                               . #6#))
                                                        ('T
                                                         (LETT |ans|
                                                               (CONS |f1|
                                                                     |ans|)
                                                               . #6#)))))
                                                     (LETT #4# (CDR #4#) . #6#)
                                                     (GO G190) G191
                                                     (EXIT NIL))))))))
                                          (EXIT
                                           (COND
                                            ((EQL |p| 2)
                                             (SEQ (LETT |ss| (+ |ss| 1) . #6#)
                                                  (EXIT
                                                   (LETT |x|
                                                         (SPADCALL |y|
                                                                   (|MDDFACT;decode|
                                                                    |ss| |p|
                                                                    |y| $)
                                                                   (QREFELT $
                                                                            50))
                                                         . #6#))))
                                            ('T
                                             (SEQ (LETT |s| (+ |s| 1) . #6#)
                                                  (EXIT
                                                   (COND
                                                    ((EQL |s| |p|)
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ (LETT |s| 0 . #6#)
                                                            (LETT |ss|
                                                                  (+ |ss| 1)
                                                                  . #6#)
                                                            (LETT |x|
                                                                  (SPADCALL |y|
                                                                            (|MDDFACT;decode|
                                                                             |ss|
                                                                             |p|
                                                                             |y|
                                                                             $)
                                                                            (QREFELT
                                                                             $
                                                                             50))
                                                                  . #6#)
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                (EQL
                                                                 (SPADCALL |x|
                                                                           (QREFELT
                                                                            $
                                                                            16))
                                                                 1))
                                                               (PROGN
                                                                (LETT #2#
                                                                      (SEQ
                                                                       (LETT
                                                                        |ss|
                                                                        (EXPT
                                                                         |p|
                                                                         (SPADCALL
                                                                          |x|
                                                                          (QREFELT
                                                                           $
                                                                           25)))
                                                                        . #6#)
                                                                       (EXIT
                                                                        (LETT
                                                                         |x|
                                                                         (SPADCALL
                                                                          |y|
                                                                          (+
                                                                           (SPADCALL
                                                                            |x|
                                                                            (QREFELT
                                                                             $
                                                                             25))
                                                                           1)
                                                                          (QREFELT
                                                                           $
                                                                           55))
                                                                         . #6#)))
                                                                      . #6#)
                                                                (GO #2#)))))))
                                                      #2# (EXIT #2#))))))))))
                                         (LETT #5# (NULL |stack|) . #6#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (CONS
                                      (SPADCALL |c| (|SPADfirst| |ans|)
                                                (QREFELT $ 27))
                                      (CDR |ans|)))))))))))))) 

(SDEFUN |MDDFACT;probSplit|
        ((|u| EMR) (|t| EMR) (|d| |Integer|) ($ |Union| (|List| EMR) "failed"))
        (SPROG
         ((|g| (EMR)) (|f2| (EMR)) (|n| (EMR)) (|r| (|NonNegativeInteger|))
          (#1=#:G283 NIL) (#2=#:G282 NIL) (|f1| (EMR)) (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |u| (QREFELT $ 26)) . #3=(|MDDFACT;probSplit|))
          (EXIT
           (COND ((EQL |p| 2) (|MDDFACT;probSplit2| |u| |t| |d| $))
                 ('T
                  (SEQ (LETT |f1| (SPADCALL |u| |t| (QREFELT $ 36)) . #3#)
                       (LETT |r|
                             (PROG1
                                 (LETT #1#
                                       (QUOTIENT2
                                        (-
                                         (EXPT |p|
                                               (PROG1 (LETT #2# |d| . #3#)
                                                 (|check_subtype| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#)))
                                         1)
                                        2)
                                       . #3#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             . #3#)
                       (LETT |n| (|MDDFACT;exptmod| |t| |r| |u| $) . #3#)
                       (LETT |f2|
                             (SPADCALL |u|
                                       (SPADCALL |n| (|spadConstant| $ 28)
                                                 (QREFELT $ 56))
                                       (QREFELT $ 36))
                             . #3#)
                       (LETT |g| (SPADCALL |f1| |f2| (QREFELT $ 30)) . #3#)
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 57))
                           (SPADCALL |g| |u| (QREFELT $ 57)))
                          (CONS 1 "failed"))
                         ('T
                          (CONS 0
                                (LIST |f1| |f2|
                                      (SPADCALL |u| |g|
                                                (QREFELT $ 43)))))))))))))) 

(SDEFUN |MDDFACT;probSplit2|
        ((|u| EMR) (|t| EMR) (|d| |Integer|) ($ |Union| (|List| EMR) "failed"))
        (SPROG ((|f| (EMR)))
               (SEQ
                (LETT |f|
                      (SPADCALL |u| (|MDDFACT;trace| |t| |d| |u| $)
                                (QREFELT $ 36))
                      |MDDFACT;probSplit2|)
                (EXIT
                 (COND
                  ((OR (SPADCALL |f| (|spadConstant| $ 28) (QREFELT $ 57))
                       (EQL (|MDDFACT;degree| |u| $) (|MDDFACT;degree| |f| $)))
                   (CONS 1 "failed"))
                  ('T
                   (CONS 0
                         (LIST (|spadConstant| $ 28) |f|
                               (SPADCALL |u| |f| (QREFELT $ 43)))))))))) 

(SDEFUN |MDDFACT;trace| ((|t| EMR) (|d| |Integer|) (|u| EMR) ($ EMR))
        (SPROG ((|tt| (EMR)) (|p| (|Integer|)))
               (SEQ
                (LETT |p| (SPADCALL |t| (QREFELT $ 26)) . #1=(|MDDFACT;trace|))
                (LETT |d| (- |d| 1) . #1#) (LETT |tt| |t| . #1#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |d| 0 (QREFELT $ 29))) (GO G191)))
                     (SEQ
                      (LETT |tt|
                            (SPADCALL
                             (SPADCALL |tt|
                                       (LETT |t|
                                             (|MDDFACT;exptmod| |t| |p| |u| $)
                                             . #1#)
                                       (QREFELT $ 56))
                             |u| (QREFELT $ 31))
                            . #1#)
                      (EXIT (LETT |d| (- |d| 1) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |tt|)))) 

(DECLAIM (NOTINLINE |ModularDistinctDegreeFactorizer;|)) 

(DEFUN |ModularDistinctDegreeFactorizer| (#1=#:G297)
  (SPROG NIL
         (PROG (#2=#:G298)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ModularDistinctDegreeFactorizer|)
                                               '|domainEqualList|)
                    . #3=(|ModularDistinctDegreeFactorizer|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ModularDistinctDegreeFactorizer;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularDistinctDegreeFactorizer|)))))))))) 

(DEFUN |ModularDistinctDegreeFactorizer;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ModularDistinctDegreeFactorizer|))
          (LETT |dv$| (LIST '|ModularDistinctDegreeFactorizer| DV$1) . #1#)
          (LETT $ (GETREFV 58) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularDistinctDegreeFactorizer|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 22
                    (|EuclideanModularRing| (|Integer|) |#1| (|Integer|)
                                            (CONS
                                             (|function| |MDDFACT;reduction|)
                                             $)
                                            (CONS (|function| |MDDFACT;merge|)
                                                  $)
                                            (CONS
                                             (|function| |MDDFACT;exactquo|)
                                             $)))
          $))) 

(MAKEPROP '|ModularDistinctDegreeFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (0 . |positiveRemainder|) (|Mapping| 7 7) (6 . |map|)
              (12 . |Zero|) (16 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 13 '"failed")
              (20 . |extendedEuclidean|) (27 . |leadingCoefficient|) (32 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (38 . |monicDivide|) (|Boolean|) (44 . ~=) 'EMR (50 . |coerce|)
              (|NonNegativeInteger|) (55 . |degree|) (60 . |modulus|) (65 . *)
              (71 . |One|) (75 . >) (81 . *) (87 . |rem|) (93 . |reduce|)
              |MDDFACT;exptMod;UIUIU;9| (99 . ~=) (105 . |coerce|)
              (110 . |gcd|) |MDDFACT;gcd;2UIU;11| (116 . |differentiate|)
              (|List| 6) |MDDFACT;factor;UIL;12| (121 . |monomial|) (127 . -)
              (133 . |quo|) (|Record| (|:| |factor| 6) (|:| |degree| 7))
              (|List| 44) |MDDFACT;ddFact;UIL;14| |MDDFACT;linears;UIU;15|
              |MDDFACT;separateFactors;LIL;17| (139 . |coerce|) (144 . *)
              (150 . +) (156 . |elt|) (162 . =) (168 . -) (174 . ^) (180 . +)
              (186 . =))
           '#(|separateFactors| 192 |linears| 198 |gcd| 204 |factor| 211
              |exptMod| 217 |ddFact| 225)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(2 7 0 0 0 8 2 6 0 9 0 10 0 6
                                                   0 11 0 6 0 12 3 7 14 0 0 0
                                                   15 1 6 7 0 16 2 6 0 7 0 17 2
                                                   6 18 0 0 19 2 6 20 0 0 21 1
                                                   22 6 0 23 1 6 24 0 25 1 22 7
                                                   0 26 2 22 0 7 0 27 0 22 0 28
                                                   2 7 20 0 0 29 2 22 0 0 0 30
                                                   2 22 0 0 0 31 2 22 0 6 7 32
                                                   2 7 20 0 0 34 1 22 0 7 35 2
                                                   22 0 0 0 36 1 6 0 0 38 2 6 0
                                                   7 24 41 2 22 0 0 0 42 2 22 0
                                                   0 0 43 1 6 0 7 49 2 6 0 0 0
                                                   50 2 6 0 0 0 51 2 22 6 0 6
                                                   52 2 6 20 0 0 53 2 6 0 0 0
                                                   54 2 6 0 0 24 55 2 22 0 0 0
                                                   56 2 22 20 0 0 57 2 0 39 45
                                                   7 48 2 0 6 6 7 47 3 0 6 6 6
                                                   7 37 2 0 39 6 7 40 4 0 6 6 7
                                                   6 7 33 2 0 45 6 7 46)))))
           '|lookupComplete|)) 
