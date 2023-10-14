
(SDEFUN |POLYCAT-;eval;SLS;1| ((|p| S) (|l| |List| (|Equation| S)) ($ S))
        (SPROG
         ((#1=#:G148 NIL) (|e| NIL) (#2=#:G147 NIL) (|lvar| (|List| |VarSet|))
          (#3=#:G146 NIL) (#4=#:G145 NIL) (#5=#:G143 NIL) (#6=#:G144 NIL))
         (SEQ
          (COND ((NULL |l|) |p|)
                ('T
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL . #7=(|POLYCAT-;eval;SLS;1|))
                         (LETT #6# |l| . #7#) G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |e| (CAR #6#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((QEQCAR
                              (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                        (QREFELT $ 13))
                              1)
                             (PROGN
                              (LETT #5#
                                    (|error|
                                     "cannot find a variable to evaluate")
                                    . #7#)
                              (GO #8=#:G137))))))
                         (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
                   #8# (EXIT #5#))
                  (LETT |lvar|
                        (PROGN
                         (LETT #4# NIL . #7#)
                         (SEQ (LETT |e| NIL . #7#) (LETT #3# |l| . #7#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |e| (CAR #3#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL (SPADCALL |e| (QREFELT $ 11))
                                                 (QREFELT $ 14))
                                       #4#)
                                      . #7#)))
                              (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #7#)
                  (EXIT
                   (SPADCALL |p| |lvar|
                             (PROGN
                              (LETT #2# NIL . #7#)
                              (SEQ (LETT |e| NIL . #7#) (LETT #1# |l| . #7#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |e| (CAR #1#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |e| (QREFELT $ 15))
                                                 #2#)
                                           . #7#)))
                                   (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 18))))))))) 

(SDEFUN |POLYCAT-;isPlus;SU;2| ((|p| S) ($ |Union| (|List| S) "failed"))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL
                  (CDR
                   (LETT |l| (SPADCALL |p| (QREFELT $ 21))
                         |POLYCAT-;isPlus;SU;2|)))
                 (CONS 1 "failed"))
                ('T (CONS 0 |l|))))) 

(SDEFUN |POLYCAT-;isTimes;SU;3| ((|p| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((|r| (R)) (|l| (|List| S)) (#1=#:G167 NIL) (|v| NIL) (#2=#:G166 NIL)
          (|lv| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR
             (NULL
              (LETT |lv| (SPADCALL |p| (QREFELT $ 24))
                    . #3=(|POLYCAT-;isTimes;SU;3|)))
             (NULL (SPADCALL |p| (QREFELT $ 26))))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |l|
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (SPADCALL (|spadConstant| $ 27) |v|
                                            (SPADCALL |p| |v| (QREFELT $ 30))
                                            (QREFELT $ 31))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #3#)
             (LETT |r| (SPADCALL |p| (QREFELT $ 32)) . #3#)
             (EXIT
              (COND
               ((SPADCALL |r| (|spadConstant| $ 28) (QREFELT $ 33))
                (COND ((NULL (CDR |lv|)) (CONS 1 "failed"))
                      (#4='T (CONS 0 |l|))))
               (#4# (CONS 0 (CONS (SPADCALL |r| (QREFELT $ 34)) |l|))))))))))) 

(SDEFUN |POLYCAT-;isExpt;SU;4|
        ((|p| S)
         ($ |Union|
          (|Record| (|:| |var| |VarSet|)
                    (|:| |exponent| (|NonNegativeInteger|)))
          "failed"))
        (SPROG ((|d| (|NonNegativeInteger|)) (|u| (|Union| |VarSet| "failed")))
               (SEQ
                (LETT |u| (SPADCALL |p| (QREFELT $ 36))
                      . #1=(|POLYCAT-;isExpt;SU;4|))
                (EXIT
                 (COND
                  ((OR (QEQCAR |u| 1)
                       (NULL
                        (SPADCALL |p|
                                  (SPADCALL (|spadConstant| $ 27) (QCDR |u|)
                                            (LETT |d|
                                                  (SPADCALL |p| (QCDR |u|)
                                                            (QREFELT $ 30))
                                                  . #1#)
                                            (QREFELT $ 31))
                                  (QREFELT $ 37))))
                   (CONS 1 "failed"))
                  ('T (CONS 0 (CONS (QCDR |u|) |d|)))))))) 

(SDEFUN |POLYCAT-;coefficient;SVarSetNniS;5|
        ((|p| S) (|v| |VarSet|) (|n| |NonNegativeInteger|) ($ S))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 42)) |n| (QREFELT $ 44))) 

(SDEFUN |POLYCAT-;coefficient;SLLS;6|
        ((|p| S) (|lv| |List| |VarSet|) (|ln| |List| (|NonNegativeInteger|))
         ($ S))
        (COND
         ((NULL |lv|)
          (COND ((NULL |ln|) |p|)
                (#1='T (|error| "mismatched lists in coefficient"))))
         ((NULL |ln|) (|error| "mismatched lists in coefficient"))
         (#1#
          (SPADCALL
           (SPADCALL (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT $ 42))
                     (|SPADfirst| |ln|) (QREFELT $ 44))
           (CDR |lv|) (CDR |ln|) (QREFELT $ 47))))) 

(SDEFUN |POLYCAT-;retract;SVarSet;7| ((|p| S) ($ |VarSet|))
        (SPROG ((|q| (|VarSet|)) (#1=#:G188 NIL))
               (SEQ
                (LETT |q|
                      (PROG2
                          (LETT #1# (SPADCALL |p| (QREFELT $ 36))
                                . #2=(|POLYCAT-;retract;SVarSet;7|))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 9)
                                        (|Union| (QREFELT $ 9) "failed") #1#))
                      . #2#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |q| (QREFELT $ 49)) |p| (QREFELT $ 37))
                   |q|)
                  ('T (|error| "Polynomial is not a single variable"))))))) 

(SDEFUN |POLYCAT-;retractIfCan;SU;8| ((|p| S) ($ |Union| |VarSet| "failed"))
        (SPROG ((#1=#:G198 NIL) (|q| (|Union| |VarSet| "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |q| (SPADCALL |p| (QREFELT $ 36))
                         . #2=(|POLYCAT-;retractIfCan;SU;8|))
                   (EXIT
                    (COND
                     ((QEQCAR |q| 0)
                      (COND
                       ((SPADCALL (SPADCALL (QCDR |q|) (QREFELT $ 49)) |p|
                                  (QREFELT $ 37))
                        (PROGN (LETT #1# |q| . #2#) (GO #3=#:G196))))))))
                  (EXIT (CONS 1 "failed"))))
                #3# (EXIT #1#)))) 

(SDEFUN |POLYCAT-;totalDegree;SNni;9| ((|p| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|u| (|SparseUnivariatePolynomial| S)) (|d| (|NonNegativeInteger|))
          (#1=#:G200 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 52)) 0)
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL |p|
                                  (PROG2
                                      (LETT #1# (SPADCALL |p| (QREFELT $ 36))
                                            . #2=(|POLYCAT-;totalDegree;SNni;9|))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             "failed")
                                                    #1#))
                                  (QREFELT $ 42))
                        . #2#)
                  (LETT |d| 0 . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |u| (|spadConstant| $ 55) (QREFELT $ 56)))
                         (GO G191)))
                       (SEQ
                        (LETT |d|
                              (MAX |d|
                                   (+ (SPADCALL |u| (QREFELT $ 57))
                                      (SPADCALL (SPADCALL |u| (QREFELT $ 58))
                                                (QREFELT $ 59))))
                              . #2#)
                        (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 60)) . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |d|))))))) 

(SDEFUN |POLYCAT-;totalDegreeSorted;SLNni;10|
        ((|p| S) (|lv| |List| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG
         ((|u| (|SparseUnivariatePolynomial| S))
          (|d| #1=(|NonNegativeInteger|)) (|w| #1#) (|v0| (|VarSet|))
          (|v| (|VarSet|)) (#2=#:G208 NIL))
         (SEQ
          (COND ((OR (SPADCALL |p| (QREFELT $ 52)) (NULL |lv|)) 0)
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL |p|
                                  (LETT |v|
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |p| (QREFELT $ 36))
                                                  . #3=(|POLYCAT-;totalDegreeSorted;SLNni;10|))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9)
                                                           "failed")
                                                          #2#))
                                        . #3#)
                                  (QREFELT $ 42))
                        . #3#)
                  (LETT |d| 0 . #3#) (LETT |w| 0 . #3#)
                  (LETT |v0| (|SPADfirst| |lv|) . #3#)
                  (LETT |lv| (CDR |lv|) . #3#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |lv|) 'NIL)
                                ('T (SPADCALL |v| |v0| (QREFELT $ 62)))))
                         (GO G191)))
                       (SEQ (LETT |v0| (|SPADfirst| |lv|) . #3#)
                            (EXIT (LETT |lv| (CDR |lv|) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND
                   ((SPADCALL |v0| |v| (QREFELT $ 63)) (LETT |w| 1 . #3#)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |u| (|spadConstant| $ 55) (QREFELT $ 56)))
                         (GO G191)))
                       (SEQ
                        (LETT |d|
                              (MAX |d|
                                   (+ (* |w| (SPADCALL |u| (QREFELT $ 57)))
                                      (SPADCALL (SPADCALL |u| (QREFELT $ 58))
                                                |lv| (QREFELT $ 64))))
                              . #3#)
                        (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 60)) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |d|))))))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11|
        ((|p| S) (|lv| |List| |VarSet|) ($ |NonNegativeInteger|))
        (SPROG ((|lv1| (|List| |VarSet|)))
               (SEQ
                (LETT |lv1|
                      (SPADCALL (CONS #'|POLYCAT-;totalDegree;SLNni;11!0| $)
                                |lv| (QREFELT $ 67))
                      |POLYCAT-;totalDegree;SLNni;11|)
                (EXIT (SPADCALL |p| |lv1| (QREFELT $ 64)))))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11!0| ((|v1| NIL) (|v2| NIL) ($ NIL))
        (SPADCALL |v2| |v1| (QREFELT $ 62))) 

(SDEFUN |POLYCAT-;resultant;2SVarSetS;12|
        ((|p1| S) (|p2| S) (|mvar| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 42))
                  (SPADCALL |p2| |mvar| (QREFELT $ 42)) (QREFELT $ 69))) 

(SDEFUN |POLYCAT-;discriminant;SVarSetS;13| ((|p| S) (|var| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p| |var| (QREFELT $ 42)) (QREFELT $ 71))) 

(SDEFUN |POLYCAT-;allMonoms| ((|l| |List| S) ($ |List| S))
        (SPROG ((#1=#:G229 NIL) (|p| NIL) (#2=#:G228 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|POLYCAT-;allMonoms|))
                   (SEQ (LETT |p| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 73)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 75))
                 (QREFELT $ 76))))) 

(SDEFUN |POLYCAT-;P2R|
        ((|p| S) (|b| |List| E) (|n| |NonNegativeInteger|) ($ |Vector| R))
        (SPROG
         ((#1=#:G233 NIL) (|i| NIL) (#2=#:G234 NIL) (|bj| NIL)
          (|w| (|Vector| R)))
         (SEQ
          (LETT |w| (MAKEARR1 |n| (|spadConstant| $ 54)) . #3=(|POLYCAT-;P2R|))
          (SEQ (LETT |bj| NIL . #3#) (LETT #2# |b| . #3#)
               (LETT |i| (SPADCALL |w| (QREFELT $ 79)) . #3#)
               (LETT #1# (QVSIZE |w|) . #3#) G190
               (COND
                ((OR (> |i| #1#) (ATOM #2#)
                     (PROGN (LETT |bj| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |w| |i| (SPADCALL |p| |bj| (QREFELT $ 80)) 1)))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |w|)))) 

(SDEFUN |POLYCAT-;eq2R| ((|l| |List| S) (|b| |List| E) ($ |Matrix| R))
        (SPROG
         ((#1=#:G241 NIL) (|p| NIL) (#2=#:G240 NIL) (#3=#:G239 NIL) (|bj| NIL)
          (#4=#:G238 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL . #5=(|POLYCAT-;eq2R|))
            (SEQ (LETT |bj| NIL . #5#) (LETT #3# |b| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |bj| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |p| NIL . #5#) (LETT #1# |l| . #5#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL |p| |bj| (QREFELT $ 80))
                                         #2#)
                                        . #5#)))
                                (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #5#)))
                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 83))))) 

(SDEFUN |POLYCAT-;reducedSystem;MM;17| ((|m| |Matrix| S) ($ |Matrix| R))
        (SPROG
         ((|l| (|List| (|List| S))) (|mm| (|Matrix| R)) (|d| (|List| E))
          (#1=#:G255 NIL) (|bj| NIL) (#2=#:G254 NIL) (|b| (|List| S))
          (#3=#:G253 NIL) (|r| NIL) (#4=#:G252 NIL))
         (SEQ
          (LETT |l| (SPADCALL |m| (QREFELT $ 86))
                . #5=(|POLYCAT-;reducedSystem;MM;17|))
          (LETT |b|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #4# NIL . #5#)
                   (SEQ (LETT |r| NIL . #5#) (LETT #3# |l| . #5#) G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |r| (CAR #3#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #4# (CONS (|POLYCAT-;allMonoms| |r| $) #4#)
                                . #5#)))
                        (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  (QREFELT $ 75))
                 (QREFELT $ 76))
                . #5#)
          (EXIT
           (COND
            ((NULL |b|) (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 54)))
            ('T
             (SEQ
              (LETT |d|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |bj| (QREFELT $ 87)) #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $) . #5#)
              (LETT |l| (CDR |l|) . #5#)
              (SEQ G190
                   (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (LETT |mm|
                          (SPADCALL |mm|
                                    (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $)
                                    (QREFELT $ 88))
                          . #5#)
                    (EXIT (LETT |l| (CDR |l|) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |mm|)))))))) 

(SDEFUN |POLYCAT-;reducedSystem;MVR;18|
        ((|m| |Matrix| S) (|v| |Vector| S)
         ($ |Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R))))
        (SPROG
         ((|r| (|List| S)) (|l| (|List| (|List| S))) (|w| (|Vector| R))
          (|mm| (|Matrix| R)) (|n| (|NonNegativeInteger|)) (|d| (|List| E))
          (#1=#:G271 NIL) (|bj| NIL) (#2=#:G270 NIL) (|b| (|List| S))
          (#3=#:G269 NIL) (|s| NIL) (#4=#:G268 NIL))
         (SEQ
          (LETT |l| (SPADCALL |m| (QREFELT $ 86))
                . #5=(|POLYCAT-;reducedSystem;MVR;18|))
          (LETT |r| (SPADCALL |v| (QREFELT $ 92)) . #5#)
          (LETT |b|
                (SPADCALL
                 (SPADCALL (|POLYCAT-;allMonoms| |r| $)
                           (SPADCALL
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |s| NIL . #5#) (LETT #3# |l| . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS (|POLYCAT-;allMonoms| |s| $)
                                                #4#)
                                          . #5#)))
                                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                  (EXIT (NREVERSE #4#))))
                            (QREFELT $ 75))
                           (QREFELT $ 93))
                 (QREFELT $ 76))
                . #5#)
          (EXIT
           (COND
            ((NULL |b|)
             (CONS (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| $ 54))
                   (MAKEARR1 0 (|spadConstant| $ 54))))
            ('T
             (SEQ
              (LETT |d|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |bj| NIL . #5#) (LETT #1# |b| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |bj| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |bj| (QREFELT $ 87)) #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (LETT |n| (LENGTH |d|) . #5#)
              (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $) . #5#)
              (LETT |w| (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| $) . #5#)
              (LETT |l| (CDR |l|) . #5#) (LETT |r| (CDR |r|) . #5#)
              (SEQ G190
                   (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (LETT |mm|
                          (SPADCALL |mm|
                                    (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| $)
                                    (QREFELT $ 88))
                          . #5#)
                    (LETT |w|
                          (SPADCALL |w|
                                    (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n|
                                     $)
                                    (QREFELT $ 94))
                          . #5#)
                    (LETT |l| (CDR |l|) . #5#)
                    (EXIT (LETT |r| (CDR |r|) . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |mm| |w|))))))))) 

(SDEFUN |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|
        ((|lpp| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 101))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;20|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 107))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;21|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 107))) 

(SDEFUN |POLYCAT-;factor;SF;22| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 112))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;23|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (ELT $ 115) (QREFELT $ 118))) 

(SDEFUN |POLYCAT-;factor;SF;24| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (ELT $ 115) (QREFELT $ 119))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;25|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (ELT $ 115) (QREFELT $ 118))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;26|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL |pp| |qq| (QREFELT $ 121))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;27|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 123))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;28|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 124))) 

(SDEFUN |POLYCAT-;factor;SF;29| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G313 NIL) (|ww| NIL) (#2=#:G312 NIL)
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|up| (|SparseUnivariatePolynomial| S)) (#3=#:G311 NIL) (|w| NIL)
          (#4=#:G310 NIL) (|ansR| (|Factored| R))
          (|v| (|Union| |VarSet| "failed")))
         (SEQ
          (LETT |v| (SPADCALL |p| (QREFELT $ 36))
                . #5=(|POLYCAT-;factor;SF;29|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ
              (LETT |ansR|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 125))
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ansR| (QREFELT $ 127)) (QREFELT $ 34))
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |w| NIL . #5#)
                      (LETT #3# (SPADCALL |ansR| (QREFELT $ 131)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (VECTOR (QVELT |w| 0)
                                       (SPADCALL (QVELT |w| 1) (QREFELT $ 34))
                                       (QVELT |w| 2))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 134)))))
            ('T
             (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 42)) . #5#)
                  (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 123)) . #5#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 135)) (QCDR |v|)
                              (QREFELT $ 136))
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |ww| NIL . #5#)
                          (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 139)) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |ww| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR (QVELT |ww| 0)
                                           (SPADCALL (QVELT |ww| 1) (QCDR |v|)
                                                     (QREFELT $ 136))
                                           (QVELT |ww| 2))
                                   #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 134)))))))))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;30|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (SPADCALL |pp| |qq| (QREFELT $ 121))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;31|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 123))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;32|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 124))) 

(SDEFUN |POLYCAT-;factor;SF;33| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G337 NIL) (|ww| NIL) (#2=#:G336 NIL)
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (|up| (|SparseUnivariatePolynomial| S)) (#3=#:G335 NIL) (|w| NIL)
          (#4=#:G334 NIL) (|ansR| (|Factored| R))
          (|v| (|Union| |VarSet| "failed")))
         (SEQ
          (LETT |v| (SPADCALL |p| (QREFELT $ 36))
                . #5=(|POLYCAT-;factor;SF;33|))
          (EXIT
           (COND
            ((QEQCAR |v| 1)
             (SEQ
              (LETT |ansR|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 125))
                    . #5#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ansR| (QREFELT $ 127)) (QREFELT $ 34))
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |w| NIL . #5#)
                      (LETT #3# (SPADCALL |ansR| (QREFELT $ 131)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (VECTOR (QVELT |w| 0)
                                       (SPADCALL (QVELT |w| 1) (QREFELT $ 34))
                                       (QVELT |w| 2))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (QREFELT $ 134)))))
            ('T
             (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT $ 42)) . #5#)
                  (LETT |ansSUP| (SPADCALL |up| (QREFELT $ 123)) . #5#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansSUP| (QREFELT $ 135)) (QCDR |v|)
                              (QREFELT $ 136))
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |ww| NIL . #5#)
                          (LETT #1# (SPADCALL |ansSUP| (QREFELT $ 139)) . #5#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |ww| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (VECTOR (QVELT |ww| 0)
                                           (SPADCALL (QVELT |ww| 1) (QCDR |v|)
                                                     (QREFELT $ 136))
                                           (QVELT |ww| 2))
                                   #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 134)))))))))) 

(SDEFUN |POLYCAT-;conditionP;MU;34|
        ((|mat| |Matrix| S) ($ |Union| (|Vector| S) #1="failed"))
        (SPROG
         ((#2=#:G360 NIL) (#3=#:G359 (S)) (#4=#:G361 (S))
          (|i| (|NonNegativeInteger|)) (#5=#:G380 NIL) (|m| NIL)
          (#6=#:G377 NIL) (#7=#:G379 NIL) (|mons| #8=(|List| S))
          (#9=#:G378 NIL) (|ans| (|Union| (|Vector| R) #1#))
          (|monslist| (|List| (|List| S))) (|llR| (|List| (|List| R)))
          (#10=#:G375 NIL) (|u| NIL) (#11=#:G376 NIL) (|v| NIL)
          (#12=#:G374 NIL) (|redmons| (|List| S))
          (|deg1| (|List| (|NonNegativeInteger|))) (#13=#:G348 NIL)
          (#14=#:G366 NIL) (|nd| (|Union| (|Integer|) "failed"))
          (#15=#:G373 NIL) (|d| NIL) (#16=#:G372 NIL)
          (|degs| (|List| (|NonNegativeInteger|))) (|vars| (|List| |VarSet|))
          (#17=#:G371 NIL) (#18=#:G343 NIL) (#19=#:G342 #8#) (#20=#:G344 #8#)
          (#21=#:G370 NIL) (#22=#:G369 NIL) (|l| NIL) (|ch| (|Integer|))
          (#23=#:G368 NIL) (|z| NIL) (#24=#:G367 NIL)
          (|ll| (|List| (|List| S))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ll|
                  (SPADCALL (SPADCALL |mat| (QREFELT $ 140)) (QREFELT $ 86))
                  . #25=(|POLYCAT-;conditionP;MU;34|))
            (LETT |llR|
                  (PROGN
                   (LETT #24# NIL . #25#)
                   (SEQ (LETT |z| NIL . #25#)
                        (LETT #23# (|SPADfirst| |ll|) . #25#) G190
                        (COND
                         ((OR (ATOM #23#)
                              (PROGN (LETT |z| (CAR #23#) . #25#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #24# (CONS NIL #24#) . #25#)))
                        (LETT #23# (CDR #23#) . #25#) (GO G190) G191
                        (EXIT (NREVERSE #24#))))
                  . #25#)
            (LETT |monslist| NIL . #25#)
            (LETT |ch| (SPADCALL (QREFELT $ 141)) . #25#)
            (SEQ (LETT |l| NIL . #25#) (LETT #22# |ll| . #25#) G190
                 (COND
                  ((OR (ATOM #22#) (PROGN (LETT |l| (CAR #22#) . #25#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |mons|
                        (PROGN
                         (LETT #18# NIL . #25#)
                         (SEQ (LETT |u| NIL . #25#) (LETT #21# |l| . #25#) G190
                              (COND
                               ((OR (ATOM #21#)
                                    (PROGN (LETT |u| (CAR #21#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #20# (SPADCALL |u| (QREFELT $ 73))
                                       . #25#)
                                 (COND
                                  (#18#
                                   (LETT #19#
                                         (SPADCALL #19# #20# (QREFELT $ 142))
                                         . #25#))
                                  ('T
                                   (PROGN
                                    (LETT #19# #20# . #25#)
                                    (LETT #18# 'T . #25#)))))))
                              (LETT #21# (CDR #21#) . #25#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#18# #19#) ('T (|IdentityError| '|setUnion|))))
                        . #25#)
                  (LETT |redmons| NIL . #25#)
                  (SEQ (LETT |m| NIL . #25#) (LETT #17# |mons| . #25#) G190
                       (COND
                        ((OR (ATOM #17#)
                             (PROGN (LETT |m| (CAR #17#) . #25#) NIL))
                         (GO G191)))
                       (SEQ (LETT |vars| (SPADCALL |m| (QREFELT $ 24)) . #25#)
                            (LETT |degs| (SPADCALL |m| |vars| (QREFELT $ 143))
                                  . #25#)
                            (LETT |deg1|
                                  (PROGN
                                   (LETT #16# NIL . #25#)
                                   (SEQ (LETT |d| NIL . #25#)
                                        (LETT #15# |degs| . #25#) G190
                                        (COND
                                         ((OR (ATOM #15#)
                                              (PROGN
                                               (LETT |d| (CAR #15#) . #25#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #16#
                                                (CONS
                                                 (SEQ
                                                  (LETT |nd|
                                                        (SPADCALL |d| |ch|
                                                                  (QREFELT $
                                                                           145))
                                                        . #25#)
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |nd| 1)
                                                     (PROGN
                                                      (LETT #14#
                                                            (CONS 1 "failed")
                                                            . #25#)
                                                      (GO #26=#:G365)))
                                                    ('T
                                                     (PROG1
                                                         (LETT #13# (QCDR |nd|)
                                                               . #25#)
                                                       (|check_subtype2|
                                                        (>= #13# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #13#))))))
                                                 #16#)
                                                . #25#)))
                                        (LETT #15# (CDR #15#) . #25#) (GO G190)
                                        G191 (EXIT (NREVERSE #16#))))
                                  . #25#)
                            (LETT |redmons|
                                  (CONS
                                   (SPADCALL (|spadConstant| $ 27) |vars|
                                             |deg1| (QREFELT $ 146))
                                   |redmons|)
                                  . #25#)
                            (EXIT
                             (LETT |llR|
                                   (PROGN
                                    (LETT #12# NIL . #25#)
                                    (SEQ (LETT |v| NIL . #25#)
                                         (LETT #11# |llR| . #25#)
                                         (LETT |u| NIL . #25#)
                                         (LETT #10# |l| . #25#) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |u| (CAR #10#) . #25#)
                                                NIL)
                                               (ATOM #11#)
                                               (PROGN
                                                (LETT |v| (CAR #11#) . #25#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #12#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |u| |vars| |degs|
                                                              (QREFELT $ 47))
                                                    (QREFELT $ 147))
                                                   |v|)
                                                  #12#)
                                                 . #25#)))
                                         (LETT #10#
                                               (PROG1 (CDR #10#)
                                                 (LETT #11# (CDR #11#) . #25#))
                                               . #25#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #12#))))
                                   . #25#)))
                       (LETT #17# (CDR #17#) . #25#) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |monslist| (CONS |redmons| |monslist|) . #25#)))
                 (LETT #22# (CDR #22#) . #25#) (GO G190) G191 (EXIT NIL))
            (LETT |ans|
                  (SPADCALL
                   (SPADCALL (SPADCALL |llR| (QREFELT $ 83)) (QREFELT $ 148))
                   (QREFELT $ 150))
                  . #25#)
            (EXIT
             (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |i| 0 . #25#)
                         (EXIT
                          (CONS 0
                                (PROGN
                                 (LETT #9# (GETREFV (SIZE |monslist|)) . #25#)
                                 (SEQ (LETT |mons| NIL . #25#)
                                      (LETT #7# |monslist| . #25#)
                                      (LETT #6# 0 . #25#) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN
                                             (LETT |mons| (CAR #7#) . #25#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #9# #6#
                                                (PROGN
                                                 (LETT #2# NIL . #25#)
                                                 (SEQ (LETT |m| NIL . #25#)
                                                      (LETT #5# |mons| . #25#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #5#)
                                                            (PROGN
                                                             (LETT |m|
                                                                   (CAR #5#)
                                                                   . #25#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4#
                                                               (SPADCALL |m|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QCDR
                                                                            |ans|)
                                                                           (LETT
                                                                            |i|
                                                                            (+
                                                                             |i|
                                                                             1)
                                                                            . #25#)
                                                                           (QREFELT
                                                                            $
                                                                            151))
                                                                          (QREFELT
                                                                           $
                                                                           34))
                                                                         (QREFELT
                                                                          $
                                                                          152))
                                                               . #25#)
                                                         (COND
                                                          (#2#
                                                           (LETT #3#
                                                                 (SPADCALL #3#
                                                                           #4#
                                                                           (QREFELT
                                                                            $
                                                                            153))
                                                                 . #25#))
                                                          ('T
                                                           (PROGN
                                                            (LETT #3# #4#
                                                                  . #25#)
                                                            (LETT #2# 'T
                                                                  . #25#)))))))
                                                      (LETT #5# (CDR #5#)
                                                            . #25#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#2# #3#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        53)))))))
                                      (LETT #6#
                                            (PROG1 (|inc_SI| #6#)
                                              (LETT #7# (CDR #7#) . #25#))
                                            . #25#)
                                      (GO G190) G191 (EXIT NIL))
                                 #9#)))))))))
          #26# (EXIT #14#)))) 

(SDEFUN |POLYCAT-;charthRoot;SU;35| ((|p| S) ($ |Union| S "failed"))
        (SPROG
         ((|ch| (|NonNegativeInteger|)) (|ans| (|Union| R "failed"))
          (|vars| (|List| |VarSet|)))
         (SEQ
          (LETT |vars| (SPADCALL |p| (QREFELT $ 24))
                . #1=(|POLYCAT-;charthRoot;SU;35|))
          (EXIT
           (COND
            ((NULL |vars|)
             (SEQ
              (LETT |ans|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 147)) (QREFELT $ 155))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     (#2='T
                      (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 34))))))))
            (#2#
             (SEQ (LETT |ch| (SPADCALL (QREFELT $ 141)) . #1#)
                  (EXIT (|POLYCAT-;charthRootlv| |p| |vars| |ch| $))))))))) 

(SDEFUN |POLYCAT-;charthRootlv|
        ((|p| S) (|vars| |List| |VarSet|) (|ch| |NonNegativeInteger|)
         ($ |Union| S #1="failed"))
        (SPROG
         ((#2=#:G410 NIL) (|ansx| (|Union| S #1#)) (|ans| (S)) (#3=#:G402 NIL)
          (|d| (|NonNegativeInteger|)) (|cp| (S))
          (|dd| (|Union| (|Integer|) "failed")) (|v| (|VarSet|)))
         (SEQ
          (EXIT
           (COND
            ((NULL |vars|)
             (SEQ
              (LETT |ans|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 147)) (QREFELT $ 155))
                    . #4=(|POLYCAT-;charthRootlv|))
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     (#5='T
                      (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT $ 34))))))))
            (#5#
             (SEQ (LETT |v| (|SPADfirst| |vars|) . #4#)
                  (LETT |vars| (CDR |vars|) . #4#)
                  (LETT |d| (SPADCALL |p| |v| (QREFELT $ 30)) . #4#)
                  (LETT |ans| (|spadConstant| $ 53) . #4#)
                  (SEQ G190
                       (COND
                        ((NULL (SPADCALL |d| 0 (QREFELT $ 157))) (GO G191)))
                       (SEQ
                        (LETT |dd| (SPADCALL |d| |ch| (QREFELT $ 145)) . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |dd| 1)
                           (PROGN
                            (LETT #2# (CONS 1 "failed") . #4#)
                            (GO #6=#:G409)))
                          ('T
                           (SEQ
                            (LETT |cp| (SPADCALL |p| |v| |d| (QREFELT $ 158))
                                  . #4#)
                            (LETT |p|
                                  (SPADCALL |p|
                                            (SPADCALL |cp| |v| |d|
                                                      (QREFELT $ 31))
                                            (QREFELT $ 159))
                                  . #4#)
                            (LETT |ansx|
                                  (|POLYCAT-;charthRootlv| |cp| |vars| |ch| $)
                                  . #4#)
                            (EXIT
                             (COND
                              ((QEQCAR |ansx| 1)
                               (PROGN
                                (LETT #2# (CONS 1 "failed") . #4#)
                                (GO #6#)))
                              ('T
                               (SEQ
                                (LETT |d| (SPADCALL |p| |v| (QREFELT $ 30))
                                      . #4#)
                                (EXIT
                                 (LETT |ans|
                                       (SPADCALL |ans|
                                                 (SPADCALL (QCDR |ansx|) |v|
                                                           (PROG1
                                                               (LETT #3#
                                                                     (QCDR
                                                                      |dd|)
                                                                     . #4#)
                                                             (|check_subtype2|
                                                              (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                                           (QREFELT $ 31))
                                                 (QREFELT $ 153))
                                       . #4#)))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |ansx| (|POLYCAT-;charthRootlv| |p| |vars| |ch| $)
                        . #4#)
                  (EXIT
                   (COND
                    ((QEQCAR |ansx| 1)
                     (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #6#)))
                    (#5#
                     (PROGN
                      (LETT #2#
                            (CONS 0
                                  (SPADCALL |ans| (QCDR |ansx|)
                                            (QREFELT $ 153)))
                            . #4#)
                      (GO #6#)))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |POLYCAT-;monicDivide;2SVarSetR;37|
        ((|p1| S) (|p2| S) (|mvar| |VarSet|)
         ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((|result|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| S))
                     (|:| |remainder| (|SparseUnivariatePolynomial| S)))))
         (SEQ
          (LETT |result|
                (SPADCALL (SPADCALL |p1| |mvar| (QREFELT $ 42))
                          (SPADCALL |p2| |mvar| (QREFELT $ 42))
                          (QREFELT $ 161))
                |POLYCAT-;monicDivide;2SVarSetR;37|)
          (EXIT
           (CONS (SPADCALL (QCAR |result|) |mvar| (QREFELT $ 136))
                 (SPADCALL (QCDR |result|) |mvar| (QREFELT $ 136))))))) 

(SDEFUN |POLYCAT-;squareFree;SF;38| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 164))) 

(SDEFUN |POLYCAT-;squareFree;SF;39| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 167))) 

(SDEFUN |POLYCAT-;squareFree;SF;40| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 167))) 

(SDEFUN |POLYCAT-;squareFreePart;2S;41| ((|p| S) ($ S))
        (SPROG
         ((#1=#:G420 NIL) (#2=#:G419 (S)) (#3=#:G421 (S)) (#4=#:G423 NIL)
          (|f| NIL) (|s| (|Factored| S)))
         (SEQ
          (SPADCALL
           (SPADCALL
            (LETT |s| (SPADCALL |p| (QREFELT $ 168))
                  . #5=(|POLYCAT-;squareFreePart;2S;41|))
            (QREFELT $ 169))
           (PROGN
            (LETT #1# NIL . #5#)
            (SEQ (LETT |f| NIL . #5#)
                 (LETT #4# (SPADCALL |s| (QREFELT $ 172)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3# (QCAR |f|) . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 152)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 27))))
           (QREFELT $ 152))))) 

(SDEFUN |POLYCAT-;content;SVarSetS;42| ((|p| S) (|v| |VarSet|) ($ S))
        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 42)) (QREFELT $ 174))) 

(SDEFUN |POLYCAT-;primitivePart;2S;43| ((|p| S) ($ S))
        (SPROG ((#1=#:G426 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 176)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p| (SPADCALL |p| (QREFELT $ 177))
                                            (QREFELT $ 178))
                                  |POLYCAT-;primitivePart;2S;43|)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (QREFELT $ 180))
                       1))))) 

(SDEFUN |POLYCAT-;primitivePart;SVarSetS;44| ((|p| S) (|v| |VarSet|) ($ S))
        (SPROG ((#1=#:G432 NIL))
               (COND ((SPADCALL |p| (QREFELT $ 176)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p|
                                            (SPADCALL |p| |v| (QREFELT $ 182))
                                            (QREFELT $ 183))
                                  |POLYCAT-;primitivePart;SVarSetS;44|)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#))
                        (QREFELT $ 180))
                       1))))) 

(SDEFUN |POLYCAT-;smaller?;2SB;45| ((|p| S) (|q| S) ($ |Boolean|))
        (SPROG ((|dq| (E)) (|dp| (E)))
               (SEQ
                (LETT |dp| (SPADCALL |p| (QREFELT $ 87))
                      . #1=(|POLYCAT-;smaller?;2SB;45|))
                (LETT |dq| (SPADCALL |q| (QREFELT $ 87)) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |dp| |dq| (QREFELT $ 185))
                   (SPADCALL (|spadConstant| $ 54)
                             (SPADCALL |q| (QREFELT $ 32)) (QREFELT $ 188)))
                  ((SPADCALL |dq| |dp| (QREFELT $ 185))
                   (SPADCALL (SPADCALL |p| (QREFELT $ 32))
                             (|spadConstant| $ 54) (QREFELT $ 188)))
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL |p| |q| (QREFELT $ 159))
                              (QREFELT $ 32))
                    (|spadConstant| $ 54) (QREFELT $ 188)))))))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;46|
        ((|p| S) (|pat| |Pattern| (|Integer|))
         (|l| |PatternMatchResult| (|Integer|) S)
         ($ |PatternMatchResult| (|Integer|) S))
        (SPADCALL |p| |pat| |l| (QREFELT $ 193))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;47|
        ((|p| S) (|pat| |Pattern| (|Float|))
         (|l| |PatternMatchResult| (|Float|) S)
         ($ |PatternMatchResult| (|Float|) S))
        (SPADCALL |p| |pat| |l| (QREFELT $ 199))) 

(SDEFUN |POLYCAT-;convert;SP;48| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (ELT $ 202) (ELT $ 203) |x| (QREFELT $ 207))) 

(SDEFUN |POLYCAT-;convert;SP;49| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (ELT $ 209) (ELT $ 210) |x| (QREFELT $ 214))) 

(SDEFUN |POLYCAT-;convert;SIf;50| ((|p| S) ($ |InputForm|))
        (SPADCALL (ELT $ 217) (ELT $ 218) |p| (QREFELT $ 222))) 

(DECLAIM (NOTINLINE |PolynomialCategory&;|)) 

(DEFUN |PolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialCategory&|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|PolynomialCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 232) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))))
                    . #1#))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|CommutativeRing|))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |POLYCAT-;resultant;2SVarSetS;12|)
                         $))
         (QSETREFV $ 72
                   (CONS
                    (|dispatchFunction| |POLYCAT-;discriminant;SVarSetS;13|)
                    $)))))))
    (COND
     ((|HasCategory| |#2| '(|IntegralDomain|))
      (PROGN
       (QSETREFV $ 90
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MM;17|) $))
       (QSETREFV $ 97
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MVR;18|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 104
                 (CONS
                  (|dispatchFunction|
                   |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|)
                  $))
       (COND
        ((|HasCategory| |#2| '(|FiniteFieldCategory|))
         (PROGN
          (QSETREFV $ 109
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;20|)
                     $))
          (QSETREFV $ 110
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;21|)
                     $))
          (QSETREFV $ 114
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;22|) $))))
        ((|HasCategory| |#2| '(|CharacteristicZero|))
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (PROGN
            (QSETREFV $ 109
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;23|)
                       $))
            (QSETREFV $ 114
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;24|) $))
            (QSETREFV $ 110
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;25|)
                       $))))
          ('T
           (PROGN
            (QSETREFV $ 122
                      (CONS
                       (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;26|)
                       $))
            (QSETREFV $ 109
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;27|)
                       $))
            (QSETREFV $ 110
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;28|)
                       $))
            (QSETREFV $ 114
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;29|)
                            $))))))
        ('T
         (PROGN
          (QSETREFV $ 122
                    (CONS (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;30|)
                          $))
          (QSETREFV $ 109
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;31|)
                     $))
          (QSETREFV $ 110
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;32|)
                     $))
          (QSETREFV $ 114
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;33|) $)))))
       (COND
        ((|HasCategory| |#2| '(|CharacteristicNonZero|))
         (PROGN
          (QSETREFV $ 154
                    (CONS (|dispatchFunction| |POLYCAT-;conditionP;MU;34|)
                          $))))))))
    (COND
     ((|HasCategory| |#2| '(|CharacteristicNonZero|))
      (PROGN
       (QSETREFV $ 156
                 (CONS (|dispatchFunction| |POLYCAT-;charthRoot;SU;35|) $)))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (COND
        ((|HasCategory| |#2| '(|EuclideanDomain|))
         (COND
          ((|HasCategory| |#2| '(|CharacteristicZero|))
           (QSETREFV $ 165
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;38|)
                           $)))
          ('T
           (QSETREFV $ 165
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;39|)
                           $)))))
        ('T
         (QSETREFV $ 165
                   (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;40|) $))))
       (QSETREFV $ 173
                 (CONS (|dispatchFunction| |POLYCAT-;squareFreePart;2S;41|) $))
       (QSETREFV $ 175
                 (CONS (|dispatchFunction| |POLYCAT-;content;SVarSetS;42|) $))
       (QSETREFV $ 181
                 (CONS (|dispatchFunction| |POLYCAT-;primitivePart;2S;43|) $))
       (QSETREFV $ 184
                 (CONS
                  (|dispatchFunction| |POLYCAT-;primitivePart;SVarSetS;44|)
                  $)))))
    (COND
     ((|HasCategory| |#2| '(|Comparable|))
      (PROGN
       (QSETREFV $ 189
                 (CONS (|dispatchFunction| |POLYCAT-;smaller?;2SB;45|) $))
       (COND
        ((|testBitVector| |pv$| 7)
         (COND
          ((|testBitVector| |pv$| 6)
           (QSETREFV $ 195
                     (CONS
                      (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;46|)
                      $))))))
       (COND
        ((|testBitVector| |pv$| 5)
         (COND
          ((|testBitVector| |pv$| 4)
           (QSETREFV $ 201
                     (CONS
                      (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;47|)
                      $)))))))))
    (COND
     ((|testBitVector| |pv$| 11)
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV $ 208
                  (CONS (|dispatchFunction| |POLYCAT-;convert;SP;48|) $))))))
    (COND
     ((|testBitVector| |pv$| 9)
      (COND
       ((|testBitVector| |pv$| 8)
        (QSETREFV $ 215
                  (CONS (|dispatchFunction| |POLYCAT-;convert;SP;49|) $))))))
    (COND
     ((|testBitVector| |pv$| 13)
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 223
                  (CONS (|dispatchFunction| |POLYCAT-;convert;SIf;50|) $))))))
    $))) 

(MAKEPROP '|PolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Equation| 6) (0 . |lhs|)
              (|Union| 9 '#1="failed") (5 . |retractIfCan|) (10 . |retract|)
              (15 . |rhs|) (|List| 9) (|List| $) (20 . |eval|) (|List| 225)
              |POLYCAT-;eval;SLS;1| (27 . |monomials|) (|Union| 17 '"failed")
              |POLYCAT-;isPlus;SU;2| (32 . |variables|) (|Boolean|)
              (37 . |monomial?|) (42 . |One|) (46 . |One|)
              (|NonNegativeInteger|) (50 . |degree|) (56 . |monomial|)
              (63 . |leadingCoefficient|) (68 . =) (74 . |coerce|)
              |POLYCAT-;isTimes;SU;3| (79 . |mainVariable|) (84 . =)
              (|Record| (|:| |var| 9) (|:| |exponent| 29))
              (|Union| 38 '"failed") |POLYCAT-;isExpt;SU;4|
              (|SparseUnivariatePolynomial| $) (90 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (96 . |coefficient|)
              |POLYCAT-;coefficient;SVarSetNniS;5| (|List| 29)
              (102 . |coefficient|) |POLYCAT-;coefficient;SLLS;6|
              (109 . |coerce|) |POLYCAT-;retract;SVarSet;7|
              |POLYCAT-;retractIfCan;SU;8| (114 . |ground?|) (119 . |Zero|)
              (123 . |Zero|) (127 . |Zero|) (131 . ~=) (137 . |degree|)
              (142 . |leadingCoefficient|) (147 . |totalDegree|)
              (152 . |reductum|) |POLYCAT-;totalDegree;SNni;9| (157 . <)
              (163 . =) (169 . |totalDegreeSorted|)
              |POLYCAT-;totalDegreeSorted;SLNni;10| (|Mapping| 25 9 9)
              (175 . |sort|) |POLYCAT-;totalDegree;SLNni;11|
              (181 . |resultant|) (187 . |resultant|) (194 . |discriminant|)
              (199 . |discriminant|) (205 . |primitiveMonomials|) (|List| 6)
              (210 . |concat|) (215 . |removeDuplicates!|) (|Integer|)
              (|Vector| 7) (220 . |minIndex|) (225 . |coefficient|)
              (|List| 224) (|Matrix| 7) (231 . |matrix|) (|List| 74)
              (|Matrix| 6) (236 . |listOfLists|) (241 . |degree|)
              (246 . |vertConcat|) (|Matrix| $) (252 . |reducedSystem|)
              (|Vector| 6) (257 . |entries|) (262 . |concat|) (268 . |concat|)
              (|Record| (|:| |mat| 82) (|:| |vec| 78)) (|Vector| $)
              (274 . |reducedSystem|) (|Union| 99 '"failed") (|List| 43)
              (|PolynomialFactorizationByRecursion| 7 8 9 6)
              (280 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 103 '#2="failed") (|List| 41)
              (286 . |solveLinearPolynomialEquation|) (|Factored| 43)
              (|MultFiniteFactorize| 9 8 7 6) (292 . |factor|) (|Factored| 41)
              (297 . |factorPolynomial|) (302 . |factorSquareFreePolynomial|)
              (|Factored| 6) (307 . |factor|) (|Factored| $) (312 . |factor|)
              (317 . |factorPolynomial|)
              (|Mapping| (|Factored| (|SparseUnivariatePolynomial| 7))
                         (|SparseUnivariatePolynomial| 7))
              (|InnerMultFact| 9 8 7 6) (322 . |factor|) (328 . |factor|)
              (|GeneralPolynomialGcdPackage| 8 9 7 6) (334 . |gcdPolynomial|)
              (340 . |gcdPolynomial|) (346 . |factorByRecursion|)
              (351 . |factorSquareFreeByRecursion|) (356 . |factor|)
              (|Factored| 7) (361 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 128) (|:| |fctr| 7) (|:| |xpnt| 77))
              (|List| 129) (366 . |factorList|)
              (|Record| (|:| |flg| 128) (|:| |fctr| 6) (|:| |xpnt| 77))
              (|List| 132) (371 . |makeFR|) (377 . |unit|)
              (382 . |multivariate|)
              (|Record| (|:| |flg| 128) (|:| |fctr| 43) (|:| |xpnt| 77))
              (|List| 137) (388 . |factorList|) (393 . |transpose|)
              (398 . |characteristic|) (402 . |setUnion|) (408 . |degree|)
              (|Union| $ '"failed") (414 . |exquo|) (420 . |monomial|)
              (427 . |ground|) (432 . |transpose|) (|Union| 96 '#2#)
              (437 . |conditionP|) (442 . |elt|) (448 . *) (454 . +)
              (460 . |conditionP|) (465 . |charthRoot|) (470 . |charthRoot|)
              (475 . >) (481 . |coefficient|) (488 . -)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (494 . |monicDivide|) |POLYCAT-;monicDivide;2SVarSetR;37|
              (|MultivariateSquareFree| 8 9 7 6) (500 . |squareFree|)
              (505 . |squareFree|) (|PolynomialSquareFree| 9 8 7 6)
              (510 . |squareFree|) (515 . |squareFree|) (520 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 77)) (|List| 170)
              (525 . |factors|) (530 . |squareFreePart|) (535 . |content|)
              (540 . |content|) (546 . |zero?|) (551 . |content|)
              (556 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (562 . |unitNormal|) (567 . |primitivePart|) (572 . |content|)
              (578 . |exquo|) (584 . |primitivePart|) (590 . <) (596 . |Zero|)
              (600 . |Zero|) (604 . |smaller?|) (610 . |smaller?|)
              (|PatternMatchResult| 77 6) (|Pattern| 77)
              (|PatternMatchPolynomialCategory| 77 8 9 7 6)
              (616 . |patternMatch|) (|PatternMatchResult| 77 $)
              (623 . |patternMatch|) (|PatternMatchResult| (|Float|) 6)
              (|Pattern| (|Float|))
              (|PatternMatchPolynomialCategory| (|Float|) 8 9 7 6)
              (630 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (637 . |patternMatch|) (644 . |convert|) (649 . |convert|)
              (|Mapping| 191 9) (|Mapping| 191 7)
              (|PolynomialCategoryLifting| 8 9 7 6 191) (654 . |map|)
              (661 . |convert|) (666 . |convert|) (671 . |convert|)
              (|Mapping| 197 9) (|Mapping| 197 7)
              (|PolynomialCategoryLifting| 8 9 7 6 197) (676 . |map|)
              (683 . |convert|) (|InputForm|) (688 . |convert|)
              (693 . |convert|) (|Mapping| 216 9) (|Mapping| 216 7)
              (|PolynomialCategoryLifting| 8 9 7 6 216) (698 . |map|)
              (705 . |convert|) (|List| 7) (|Equation| $) (|Fraction| 77)
              (|Union| 77 '#1#) (|Union| 7 '#1#) (|Union| 226 '#1#)
              (|Matrix| 77)
              (|Record| (|:| |mat| 230) (|:| |vec| (|Vector| 77))))
           '#(|totalDegreeSorted| 710 |totalDegree| 716 |squareFreePart| 727
              |squareFree| 732 |solveLinearPolynomialEquation| 737 |smaller?|
              743 |retractIfCan| 749 |retract| 754 |resultant| 759
              |reducedSystem| 766 |primitivePart| 777 |patternMatch| 788
              |monicDivide| 802 |isTimes| 809 |isPlus| 814 |isExpt| 819
              |gcdPolynomial| 824 |factorSquareFreePolynomial| 830
              |factorPolynomial| 835 |factor| 840 |eval| 845 |discriminant| 851
              |convert| 857 |content| 872 |conditionP| 878 |coefficient| 883
              |charthRoot| 897)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 223
                                                 '(1 10 6 0 11 1 6 12 0 13 1 6
                                                   9 0 14 1 10 6 0 15 3 6 0 0
                                                   16 17 18 1 6 17 0 21 1 6 16
                                                   0 24 1 6 25 0 26 0 6 0 27 0
                                                   7 0 28 2 6 29 0 9 30 3 6 0 0
                                                   9 29 31 1 6 7 0 32 2 7 25 0
                                                   0 33 1 6 0 7 34 1 6 12 0 36
                                                   2 6 25 0 0 37 2 6 41 0 9 42
                                                   2 43 6 0 29 44 3 6 0 0 16 46
                                                   47 1 6 0 9 49 1 6 25 0 52 0
                                                   6 0 53 0 7 0 54 0 43 0 55 2
                                                   43 25 0 0 56 1 43 29 0 57 1
                                                   43 6 0 58 1 6 29 0 59 1 43 0
                                                   0 60 2 9 25 0 0 62 2 9 25 0
                                                   0 63 2 6 29 0 16 64 2 16 0
                                                   66 0 67 2 43 6 0 0 69 3 0 0
                                                   0 0 9 70 1 43 6 0 71 2 0 0 0
                                                   9 72 1 6 17 0 73 1 74 0 17
                                                   75 1 74 0 0 76 1 78 77 0 79
                                                   2 6 7 0 8 80 1 82 0 81 83 1
                                                   85 84 0 86 1 6 8 0 87 2 82 0
                                                   0 0 88 1 0 82 89 90 1 91 74
                                                   0 92 2 74 0 0 0 93 2 78 0 0
                                                   0 94 2 0 95 89 96 97 2 100
                                                   98 99 43 101 2 0 102 103 41
                                                   104 1 106 105 43 107 1 0 108
                                                   41 109 1 0 108 41 110 1 106
                                                   111 6 112 1 0 113 0 114 1 7
                                                   108 41 115 2 117 105 43 116
                                                   118 2 117 111 6 116 119 2
                                                   120 43 43 43 121 2 0 41 41
                                                   41 122 1 100 105 43 123 1
                                                   100 105 43 124 1 7 113 0 125
                                                   1 126 7 0 127 1 126 130 0
                                                   131 2 111 0 6 133 134 1 105
                                                   43 0 135 2 6 0 41 9 136 1
                                                   105 138 0 139 1 85 0 0 140 0
                                                   6 29 141 2 74 0 0 0 142 2 6
                                                   46 0 16 143 2 77 144 0 0 145
                                                   3 6 0 0 16 46 146 1 6 7 0
                                                   147 1 82 0 0 148 1 7 149 89
                                                   150 2 78 7 0 77 151 2 6 0 0
                                                   0 152 2 6 0 0 0 153 1 0 149
                                                   89 154 1 7 144 0 155 1 0 144
                                                   0 156 2 29 25 0 0 157 3 6 0
                                                   0 9 29 158 2 6 0 0 0 159 2
                                                   43 160 0 0 161 1 163 111 6
                                                   164 1 0 113 0 165 1 166 111
                                                   6 167 1 6 113 0 168 1 111 6
                                                   0 169 1 111 171 0 172 1 0 0
                                                   0 173 1 43 6 0 174 2 0 0 0 9
                                                   175 1 6 25 0 176 1 6 7 0 177
                                                   2 6 144 0 7 178 1 6 179 0
                                                   180 1 0 0 0 181 2 6 0 0 9
                                                   182 2 6 144 0 0 183 2 0 0 0
                                                   9 184 2 8 25 0 0 185 0 8 0
                                                   186 0 111 0 187 2 7 25 0 0
                                                   188 2 0 25 0 0 189 3 192 190
                                                   6 191 190 193 3 0 194 0 191
                                                   194 195 3 198 196 6 197 196
                                                   199 3 0 200 0 197 200 201 1
                                                   9 191 0 202 1 7 191 0 203 3
                                                   206 191 204 205 6 207 1 0
                                                   191 0 208 1 9 197 0 209 1 7
                                                   197 0 210 3 213 197 211 212
                                                   6 214 1 0 197 0 215 1 9 216
                                                   0 217 1 7 216 0 218 3 221
                                                   216 219 220 6 222 1 0 216 0
                                                   223 2 0 29 0 16 65 2 0 29 0
                                                   16 68 1 0 29 0 61 1 0 0 0
                                                   173 1 0 113 0 165 2 0 102
                                                   103 41 104 2 0 25 0 0 189 1
                                                   0 12 0 51 1 0 9 0 50 3 0 0 0
                                                   0 9 70 2 0 95 89 96 97 1 0
                                                   82 89 90 2 0 0 0 9 184 1 0 0
                                                   0 181 3 0 194 0 191 194 195
                                                   3 0 200 0 197 200 201 3 0
                                                   160 0 0 9 162 1 0 22 0 35 1
                                                   0 22 0 23 1 0 39 0 40 2 0 41
                                                   41 41 122 1 0 108 41 110 1 0
                                                   108 41 109 1 0 113 0 114 2 0
                                                   0 0 19 20 2 0 0 0 9 72 1 0
                                                   216 0 223 1 0 197 0 215 1 0
                                                   191 0 208 2 0 0 0 9 175 1 0
                                                   149 89 154 3 0 0 0 16 46 48
                                                   3 0 0 0 9 29 45 1 0 144 0
                                                   156)))))
           '|lookupComplete|)) 
