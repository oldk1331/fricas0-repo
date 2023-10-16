
(SDEFUN |INTFACT;squareFree;IF;1| ((|n| I) ($ |Factored| I))
        (SPROG
         ((|y|
           #1=(|List|
               (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                         (|:| |factor| I)
                         (|:| |exponent| (|NonNegativeInteger|)))))
          (|v| (|Union| I "failed")) (|m| (I)) (|x| (|Factored| I)) (|lim| (I))
          (#2=#:G132 NIL) (#3=#:G133 NIL) (|l| #1#) (|sv| (|Factored| I))
          (|rec| NIL) (|u| (I)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 11))
              (SEQ (LETT |m| (SPADCALL |n| (QREFELT $ 12)))
                   (EXIT
                    (LETT |u|
                          (SPADCALL (|spadConstant| $ 13) (QREFELT $ 12))))))
             (#4='T
              (SEQ (LETT |m| |n|) (EXIT (LETT |u| (|spadConstant| $ 13))))))
            (COND
             ((SPADCALL |m| (|spadConstant| $ 13) (QREFELT $ 15))
              (SEQ (LETT |v| (SPADCALL |m| (QREFELT $ 18)))
                   (EXIT
                    (COND
                     ((QEQCAR |v| 0)
                      (PROGN
                       (LETT #2#
                             (SEQ
                              (SEQ (LETT |rec| NIL)
                                   (LETT #3#
                                         (LETT |l|
                                               (SPADCALL
                                                (LETT |sv|
                                                      (SPADCALL (QCDR |v|)
                                                                (QREFELT $
                                                                         19)))
                                                (QREFELT $ 23))))
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |rec| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (QSETVELT |rec| 2
                                               (SPADCALL 2 (QVELT |rec| 2)
                                                         (QREFELT $ 26)))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (SPADCALL
                                (SPADCALL |u| (SPADCALL |sv| (QREFELT $ 27))
                                          (QREFELT $ 28))
                                |l| (QREFELT $ 29)))))
                       (GO #5=#:G130))))))))
            (LETT |lim|
                  (SPADCALL (|spadConstant| $ 13)
                            (SPADCALL |m| 3 (QREFELT $ 30)) (QREFELT $ 31)))
            (EXIT
             (COND
              ((SPADCALL |lim| (SPADCALL 100000 (QREFELT $ 33)) (QREFELT $ 15))
               (SPADCALL |u|
                         (SPADCALL (SPADCALL |m| (QREFELT $ 34))
                                   (QREFELT $ 23))
                         (QREFELT $ 29)))
              (#4#
               (SEQ (LETT |x| (|INTFACT;BasicSieve| |m| |lim| $))
                    (LETT |y|
                          (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 27)))
                               (EXIT
                                (COND
                                 ((SPADCALL |m| (|spadConstant| $ 13)
                                            (QREFELT $ 35))
                                  (SPADCALL |x| (QREFELT $ 23)))
                                 (#4#
                                  (SEQ (LETT |v| (SPADCALL |m| (QREFELT $ 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |v| 0)
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCDR |v|)
                                                   2)
                                           (SPADCALL |x| (QREFELT $ 23))))
                                         (#4#
                                          (CONS (VECTOR (CONS 1 "sqfr") |m| 1)
                                                (SPADCALL |x|
                                                          (QREFELT $
                                                                   23))))))))))))
                    (EXIT (SPADCALL |u| |y| (QREFELT $ 29)))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |INTFACT;PollardSmallFactor;IU;2| ((|n| I) ($ |Union| I "failed"))
        (SPROG
         ((G (I)) (|x| (I)) (|y| (I)) (#1=#:G160 NIL) (#2=#:G159 NIL) (|i| NIL)
          (|l| (I)) (|ys| (I)) (#3=#:G158 NIL) (|r| (I)) (|k| (I)) (|q| (I))
          (#4=#:G157 NIL) (#5=#:G156 NIL) (#6=#:G155 NIL) (#7=#:G154 NIL)
          (|m| (I)) (|x0| (I)))
         (SEQ (LETT |x0| (SPADCALL |n| (QREFELT $ 36)))
              (LETT |m| (SPADCALL 100 (QREFELT $ 33))) (LETT |y| |x0|)
              (LETT |r| (|spadConstant| $ 13)) (LETT |q| (|spadConstant| $ 13))
              (LETT G (|spadConstant| $ 13))
              (SEQ (LETT #7# NIL) G190 (COND (#7# (GO G191)))
                   (SEQ (LETT |x| |y|) (LETT |ys| |y|)
                        (SEQ (LETT |i| 1)
                             (LETT #6# (SPADCALL |r| (QREFELT $ 37))) G190
                             (COND ((|greater_SI| |i| #6#) (GO G191)))
                             (SEQ
                              (LETT |y|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |y| |y| (QREFELT $ 28))
                                      (SPADCALL 5 (QREFELT $ 33))
                                      (QREFELT $ 31))
                                     |n| (QREFELT $ 38)))
                              (EXIT
                               (LETT |q|
                                     (SPADCALL
                                      (SPADCALL |q|
                                                (SPADCALL
                                                 (SPADCALL |x| |y|
                                                           (QREFELT $ 39))
                                                 (QREFELT $ 40))
                                                (QREFELT $ 28))
                                      |n| (QREFELT $ 38)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |k| (|spadConstant| $ 7))
                        (LETT G (SPADCALL |q| |n| (QREFELT $ 41)))
                        (SEQ (LETT #5# NIL) G190 (COND (#5# (GO G191)))
                             (SEQ (LETT |ys| |y|)
                                  (SEQ (LETT |i| 1)
                                       (LETT #4#
                                             (SPADCALL
                                              (SPADCALL |m|
                                                        (SPADCALL |r| |k|
                                                                  (QREFELT $
                                                                           39))
                                                        (QREFELT $ 42))
                                              (QREFELT $ 37)))
                                       G190
                                       (COND
                                        ((|greater_SI| |i| #4#) (GO G191)))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |y| |y|
                                                          (QREFELT $ 28))
                                                (SPADCALL 5 (QREFELT $ 33))
                                                (QREFELT $ 31))
                                               |n| (QREFELT $ 38)))
                                        (EXIT
                                         (LETT |q|
                                               (SPADCALL
                                                (SPADCALL |q|
                                                          (SPADCALL
                                                           (SPADCALL |x| |y|
                                                                     (QREFELT $
                                                                              39))
                                                           (QREFELT $ 40))
                                                          (QREFELT $ 28))
                                                |n| (QREFELT $ 38)))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT G (SPADCALL |q| |n| (QREFELT $ 41)))
                                  (EXIT
                                   (LETT |k|
                                         (SPADCALL |k| |m| (QREFELT $ 31)))))
                             (LETT #5#
                                   (COND ((SPADCALL |k| |r| (QREFELT $ 43)) 'T)
                                         ('T
                                          (SPADCALL G (|spadConstant| $ 13)
                                                    (QREFELT $ 15)))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |k| (SPADCALL |k| |r| (QREFELT $ 31)))
                        (EXIT (LETT |r| (SPADCALL 2 |r| (QREFELT $ 44)))))
                   (LETT #7# (SPADCALL G (|spadConstant| $ 13) (QREFELT $ 15)))
                   (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL G |n| (QREFELT $ 35))
                (SEQ (LETT |l| (SPADCALL |k| |m| (QREFELT $ 39)))
                     (LETT G (|spadConstant| $ 13))
                     (SEQ (LETT #3# NIL) G190 (COND (#3# (GO G191)))
                          (SEQ
                           (LETT |ys|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |ys| |ys| (QREFELT $ 28))
                                            (SPADCALL 5 (QREFELT $ 33))
                                            (QREFELT $ 31))
                                  |n| (QREFELT $ 38)))
                           (LETT G
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| |ys| (QREFELT $ 39))
                                            (QREFELT $ 40))
                                  |n| (QREFELT $ 41)))
                           (EXIT
                            (LETT |l|
                                  (SPADCALL |l| (|spadConstant| $ 13)
                                            (QREFELT $ 31)))))
                          (LETT #3#
                                (SPADCALL G (|spadConstant| $ 13)
                                          (QREFELT $ 15)))
                          (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (COND
                       ((SPADCALL G |n| (QREFELT $ 35))
                        (SEQ (LETT |y| |x0|) (LETT |x| |x0|)
                             (SEQ (LETT |i| 1)
                                  (LETT #2# (SPADCALL |l| (QREFELT $ 37))) G190
                                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |y|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |y| |y| (QREFELT $ 28))
                                            (SPADCALL 5 (QREFELT $ 33))
                                            (QREFELT $ 31))
                                           |n| (QREFELT $ 38)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT G
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |x| |y| (QREFELT $ 39))
                                              (QREFELT $ 40))
                                    |n| (QREFELT $ 41)))
                             (EXIT
                              (SEQ (LETT #1# NIL) G190 (COND (#1# (GO G191)))
                                   (SEQ
                                    (LETT |y|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |y| |y| (QREFELT $ 28))
                                            (SPADCALL 5 (QREFELT $ 33))
                                            (QREFELT $ 31))
                                           |n| (QREFELT $ 38)))
                                    (LETT |x|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |x| |x| (QREFELT $ 28))
                                            (SPADCALL 5 (QREFELT $ 33))
                                            (QREFELT $ 31))
                                           |n| (QREFELT $ 38)))
                                    (EXIT
                                     (LETT G
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |x| |y| (QREFELT $ 39))
                                             (QREFELT $ 40))
                                            |n| (QREFELT $ 41)))))
                                   (LETT #1#
                                         (SPADCALL G (|spadConstant| $ 13)
                                                   (QREFELT $ 15)))
                                   (GO G190) G191 (EXIT NIL))))))))))
              (EXIT
               (COND ((SPADCALL G |n| (QREFELT $ 35)) (CONS 1 "failed"))
                     ('T (CONS 0 G))))))) 

(SDEFUN |INTFACT;PollardSmallFactor20| ((|n| I) ($ |Union| I "failed"))
        (SPROG ((#1=#:G168 NIL) (|r| (|Union| I "failed")) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1) G190
                       (COND ((|greater_SI| |i| 20) (GO G191)))
                       (SEQ (LETT |r| (SPADCALL |n| (QREFELT $ 45)))
                            (EXIT
                             (COND
                              ((QEQCAR |r| 0)
                               (PROGN (LETT #1# |r|) (GO #2=#:G167))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |r|)))
                #2# (EXIT #1#)))) 

(SDEFUN |INTFACT;BasicSieve| ((|r| I) (|lim| I) ($ |Factored| I))
        (SPROG
         ((|d| (I))
          (|ls|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| I)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|n| (I)) (|m| NIL) (#1=#:G182 NIL) (#2=#:G183 NIL) (|s| NIL)
          (|l| (|List| I)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l|
                  (LIST (|spadConstant| $ 13) (SPADCALL 2 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 2 (QREFELT $ 33)) (SPADCALL 4 (QREFELT $ 33))
                        (SPADCALL 6 (QREFELT $ 33)) (SPADCALL 2 (QREFELT $ 33))
                        (SPADCALL 6 (QREFELT $ 33))))
            (SPADCALL |l| (SPADCALL |l| 3 (QREFELT $ 47)) (QREFELT $ 48))
            (LETT |d| (SPADCALL 2 (QREFELT $ 33))) (LETT |n| |r|)
            (LETT |ls| NIL)
            (EXIT
             (SEQ (LETT |s| NIL) (LETT #2# |l|) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |d| |lim| (QREFELT $ 15))
                      (PROGN
                       (LETT #1# (SPADCALL |n| |ls| (QREFELT $ 29)))
                       (GO #3=#:G181)))
                     ('T
                      (SEQ
                       (COND
                        ((SPADCALL |n| (SPADCALL |d| |d| (QREFELT $ 28))
                                   (QREFELT $ 11))
                         (SEQ
                          (COND
                           ((SPADCALL |n| (|spadConstant| $ 13) (QREFELT $ 15))
                            (LETT |ls|
                                  (CONS (VECTOR (CONS 3 "prime") |n| 1)
                                        |ls|))))
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (|spadConstant| $ 13) |ls|
                                            (QREFELT $ 29)))
                            (GO #3#))))))
                       (SEQ (LETT |m| 0) G190
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |n| |d| (QREFELT $ 38))
                                         (QREFELT $ 49)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |n| (SPADCALL |n| |d| (QREFELT $ 50)))))
                            (LETT |m| (|inc_SI| |m|)) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        ((SPADCALL |m| 0 (QREFELT $ 51))
                         (LETT |ls|
                               (CONS (VECTOR (CONS 3 "prime") |d| |m|) |ls|))))
                       (EXIT (LETT |d| (SPADCALL |d| |s| (QREFELT $ 31)))))))))
                  (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |INTFACT;BasicMethod;IF;5| ((|n| I) ($ |Factored| I))
        (SPROG ((|x| (|Factored| I)) (|u| (I)) (|m| (I)))
               (SEQ
                (COND
                 ((SPADCALL |n| (|spadConstant| $ 7) (QREFELT $ 11))
                  (SEQ (LETT |m| (SPADCALL |n| (QREFELT $ 12)))
                       (EXIT
                        (LETT |u|
                              (SPADCALL (|spadConstant| $ 13)
                                        (QREFELT $ 12))))))
                 ('T
                  (SEQ (LETT |m| |n|)
                       (EXIT (LETT |u| (|spadConstant| $ 13))))))
                (LETT |x|
                      (|INTFACT;BasicSieve| |m|
                       (SPADCALL (|spadConstant| $ 13)
                                 (SPADCALL |m| (QREFELT $ 52)) (QREFELT $ 31))
                       $))
                (EXIT
                 (SPADCALL |u| (SPADCALL |x| (QREFELT $ 23)) (QREFELT $ 29)))))) 

(SDEFUN |INTFACT;factor;IF;6| ((|m| I) ($ |Factored| I))
        (SPROG
         ((|flb|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| I)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|c| (|NonNegativeInteger|)) (|n| (I)) (|d| (|Union| I "failed"))
          (|y| (|Union| I "failed")) (|x| (I))
          (|s|
           (|Record| (|:| |base| I) (|:| |exponent| (|NonNegativeInteger|))))
          (|f| #1=(|ListMultiDictionary| I)) (|b| #1#) (|a| #1#) (|u| (I)))
         (SEQ
          (COND ((SPADCALL |m| (QREFELT $ 49)) (|spadConstant| $ 9))
                (#2='T
                 (SEQ
                  (COND
                   ((SPADCALL |m| (QREFELT $ 54))
                    (SEQ (LETT |n| (SPADCALL |m| (QREFELT $ 12)))
                         (EXIT
                          (LETT |u|
                                (SPADCALL (|spadConstant| $ 13)
                                          (QREFELT $ 12))))))
                   (#2#
                    (SEQ (LETT |n| |m|)
                         (EXIT (LETT |u| (|spadConstant| $ 13))))))
                  (LETT |b|
                        (|INTFACT;BasicSieve| |n|
                         (SPADCALL 10000 (QREFELT $ 33)) $))
                  (LETT |flb| (SPADCALL |b| (QREFELT $ 23)))
                  (LETT |n| (SPADCALL |b| (QREFELT $ 27)))
                  (EXIT
                   (COND
                    ((SPADCALL |n| (|spadConstant| $ 13) (QREFELT $ 35))
                     (SPADCALL |u| |flb| (QREFELT $ 29)))
                    (#2#
                     (SEQ (LETT |a| (SPADCALL (QREFELT $ 56)))
                          (LETT |b| (SPADCALL (QREFELT $ 56)))
                          (LETT |f| (SPADCALL (QREFELT $ 56)))
                          (SPADCALL |n| |a| (QREFELT $ 57))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |a| (QREFELT $ 58))))
                                 (GO G191)))
                               (SEQ (LETT |n| (SPADCALL |a| (QREFELT $ 59)))
                                    (LETT |c|
                                          (SPADCALL |n| |a| (QREFELT $ 60)))
                                    (SPADCALL |n| |a| (QREFELT $ 61))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |n| (QREFELT $ 63))
                                       (SPADCALL |n| |b| |c| (QREFELT $ 64)))
                                      ((SPADCALL
                                        (QCDR
                                         (LETT |s|
                                               (SPADCALL |n| (QREFELT $ 66))))
                                        1 (QREFELT $ 51))
                                       (SPADCALL (QCAR |s|) |a|
                                                 (* |c| (QCDR |s|))
                                                 (QREFELT $ 64)))
                                      ('T
                                       (SEQ
                                        (LETT |x|
                                              (SPADCALL |n| (QREFELT $ 52)))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |x| 2 (QREFELT $ 68)) |n|
                                           (QREFELT $ 11))
                                          (LETT |x|
                                                (SPADCALL |x|
                                                          (|spadConstant| $ 13)
                                                          (QREFELT $ 31)))))
                                        (LETT |y|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |x| 2 (QREFELT $ 68))
                                                |n| (QREFELT $ 39))
                                               (QREFELT $ 18)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |y| 0)
                                           (SEQ
                                            (SPADCALL
                                             (SPADCALL |x| (QCDR |y|)
                                                       (QREFELT $ 31))
                                             |a| |c| (QREFELT $ 64))
                                            (EXIT
                                             (SPADCALL
                                              (SPADCALL |x| (QCDR |y|)
                                                        (QREFELT $ 39))
                                              |a| |c| (QREFELT $ 64)))))
                                          ('T
                                           (SEQ
                                            (LETT |d|
                                                  (|INTFACT;PollardSmallFactor20|
                                                   |n| $))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |d| 0)
                                               (SEQ
                                                (SEQ (LETT |m| 0) G190
                                                     (COND
                                                      ((NULL
                                                        (SPADCALL
                                                         (SPADCALL |n|
                                                                   (QCDR |d|)
                                                                   (QREFELT $
                                                                            38))
                                                         (QREFELT $ 49)))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT |n|
                                                             (SPADCALL |n|
                                                                       (QCDR
                                                                        |d|)
                                                                       (QREFELT
                                                                        $
                                                                        50)))))
                                                     (LETT |m| (|inc_SI| |m|))
                                                     (GO G190) G191 (EXIT NIL))
                                                (SPADCALL (QCDR |d|) |a|
                                                          (* |m| |c|)
                                                          (QREFELT $ 64))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |n|
                                                             (|spadConstant| $
                                                                             13)
                                                             (QREFELT $ 15))
                                                   (SPADCALL |n| |a| |c|
                                                             (QREFELT $
                                                                      64)))))))
                                              ('T
                                               (SPADCALL |n| |f| |c|
                                                         (QREFELT $
                                                                  64))))))))))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |b| (QREFELT $ 58))))
                                 (GO G191)))
                               (SEQ (LETT |n| (SPADCALL |b| (QREFELT $ 59)))
                                    (LETT |c|
                                          (SPADCALL |n| |b| (QREFELT $ 60)))
                                    (SPADCALL |n| |b| (QREFELT $ 61))
                                    (EXIT
                                     (LETT |flb|
                                           (CONS
                                            (VECTOR (CONS 3 "prime") |n| |c|)
                                            |flb|))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (SEQ G190
                               (COND
                                ((NULL (NULL (SPADCALL |f| (QREFELT $ 58))))
                                 (GO G191)))
                               (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 59)))
                                    (LETT |c|
                                          (SPADCALL |n| |f| (QREFELT $ 60)))
                                    (SPADCALL |n| |f| (QREFELT $ 61))
                                    (EXIT
                                     (LETT |flb|
                                           (CONS
                                            (VECTOR (CONS 0 "nil") |n| |c|)
                                            |flb|))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |u| |flb| (QREFELT $ 29))))))))))))) 

(DECLAIM (NOTINLINE |IntegerFactorizationPackage;|)) 

(DEFUN |IntegerFactorizationPackage| (#1=#:G219)
  (SPROG NIL
         (PROG (#2=#:G220)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IntegerFactorizationPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IntegerFactorizationPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IntegerFactorizationPackage|)))))))))) 

(DEFUN |IntegerFactorizationPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|IntegerFactorizationPackage| DV$1))
          (LETT $ (GETREFV 69))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IntegerFactorizationPackage|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|IntegerFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              (|Factored| 6) (4 . |Zero|) (|Boolean|) (8 . <) (14 . -)
              (19 . |One|) (23 . |One|) (27 . >) (|Union| 6 '"failed")
              (|IntegerRoots| 6) (33 . |perfectSqrt|) |INTFACT;squareFree;IF;1|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 20) (|:| |factor| 6) (|:| |exponent| 25))
              (|List| 21) (38 . |factorList|) (|PositiveInteger|)
              (|NonNegativeInteger|) (43 . *) (49 . |unit|) (54 . *)
              (60 . |makeFR|) (66 . |approxNthRoot|) (72 . +) (|Integer|)
              (78 . |coerce|) |INTFACT;factor;IF;6| (83 . =) (89 . |random|)
              (94 . |convert|) (99 . |rem|) (105 . -) (111 . |abs|)
              (116 . |gcd|) (122 . |min|) (128 . >=) (134 . *)
              |INTFACT;PollardSmallFactor;IU;2| (|List| 6) (140 . |rest|)
              (146 . |concat!|) (152 . |zero?|) (157 . |quo|) (163 . >)
              (169 . |approxSqrt|) |INTFACT;BasicMethod;IF;5|
              (174 . |negative?|) (|ListMultiDictionary| 6)
              (179 . |dictionary|) (183 . |insert!|) (189 . |empty?|)
              (194 . |inspect|) (199 . |count|) (205 . |remove!|)
              (|IntegerPrimesPackage| 6) (211 . |prime?|) (216 . |insert!|)
              (|Record| (|:| |base| 6) (|:| |exponent| 25))
              (223 . |perfectNthRoot|) (228 . |base|) (232 . ^))
           '#(|squareFree| 238 |factor| 243 |PollardSmallFactor| 248
              |BasicMethod| 253)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#1|) |#1|)) T)
                                   '((|squareFree| ((|Factored| |#1|) |#1|)) T)
                                   '((|BasicMethod| ((|Factored| |#1|) |#1|))
                                     T)
                                   '((|PollardSmallFactor|
                                      ((|Union| |#1| "failed") |#1|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 68
                                            '(0 6 0 7 0 8 0 9 2 6 10 0 0 11 1 6
                                              0 0 12 0 6 0 13 0 8 0 14 2 6 10 0
                                              0 15 1 17 16 6 18 1 8 22 0 23 2
                                              25 0 24 0 26 1 8 6 0 27 2 6 0 0 0
                                              28 2 8 0 6 22 29 2 17 6 6 25 30 2
                                              6 0 0 0 31 1 6 0 32 33 2 6 10 0 0
                                              35 1 6 0 0 36 1 6 32 0 37 2 6 0 0
                                              0 38 2 6 0 0 0 39 1 6 0 0 40 2 6
                                              0 0 0 41 2 6 0 0 0 42 2 6 10 0 0
                                              43 2 6 0 24 0 44 2 46 0 0 25 47 2
                                              46 0 0 0 48 1 6 10 0 49 2 6 0 0 0
                                              50 2 25 10 0 0 51 1 17 6 6 52 1 6
                                              10 0 54 0 55 0 56 2 55 0 6 0 57 1
                                              55 10 0 58 1 55 6 0 59 2 55 25 6
                                              0 60 2 55 0 6 0 61 1 62 10 6 63 3
                                              55 0 6 0 25 64 1 17 65 6 66 0 6 0
                                              67 2 6 0 0 24 68 1 0 8 6 19 1 0 8
                                              6 34 1 0 16 6 45 1 0 8 6 53)))))
           '|lookupComplete|)) 
