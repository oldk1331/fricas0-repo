
(SDEFUN |SMITH;test1|
        ((|sm| M) (|b| |Col|) (|m1| . #1=(|NonNegativeInteger|))
         ($ |Union| (|NonNegativeInteger|) "failed"))
        (SPROG ((|km| #1#) (#2=#:G116 NIL) (#3=#:G120 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |km| |m1| . #4=(|SMITH;test1|))
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL
                               (SPADCALL |sm| |km| |km| (QREFELT $ 11))
                               (QREFELT $ 13)))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |b| |km| (QREFELT $ 14))
                                         (QREFELT $ 13)))
                              (PROGN
                               (LETT #3# (CONS 1 "failed") . #4#)
                               (GO #3#))))
                            (EXIT
                             (LETT |km|
                                   (PROG1 (LETT #2# (- |km| 1) . #4#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   . #4#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS 0 |km|))))
                #3# (EXIT #3#)))) 

(SDEFUN |SMITH;test2|
        ((|sm| M) (|b| |Col|) (|n1| |NonNegativeInteger|)
         (|dk| |NonNegativeInteger|) ($ |Union| |Col| "failed"))
        (SPROG
         ((#1=#:G131 NIL) (|c| (|Union| R "failed")) (|k| NIL) (|sol| (|Col|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |sol| (SPADCALL |n1| (|spadConstant| $ 16) (QREFELT $ 18))
                  . #2=(|SMITH;test2|))
            (SEQ (LETT |k| 1 . #2#) G190
                 (COND ((|greater_SI| |k| |dk|) (GO G191)))
                 (SEQ
                  (SEQ
                   (LETT |c|
                         (SPADCALL (SPADCALL |b| |k| (QREFELT $ 14))
                                   (SPADCALL |sm| |k| |k| (QREFELT $ 11))
                                   (QREFELT $ 20))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |c| 1)
                      (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#))))))
                  (EXIT (SPADCALL |sol| |k| (QCDR |c|) (QREFELT $ 21))))
                 (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |sol|))))
          #1# (EXIT #1#)))) 

(SDEFUN |SMITH;isDiagonal?| ((|m| M) ($ |Boolean|))
        (SPROG
         ((#1=#:G136 NIL) (|j| NIL) (|i| NIL) (|n1| (|NonNegativeInteger|))
          (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m1| (SPADCALL |m| (QREFELT $ 22))
                  . #2=(|SMITH;isDiagonal?|))
            (LETT |n1| (SPADCALL |m| (QREFELT $ 23)) . #2#)
            (SEQ (LETT |i| 1 . #2#) G190
                 (COND ((|greater_SI| |i| |m1|) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| 1 . #2#) G190
                        (COND ((|greater_SI| |j| |n1|) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |j| |i| (QREFELT $ 24))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT $ 11))
                                         (QREFELT $ 13)))
                              (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
                        (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #1# (EXIT #1#)))) 

(SDEFUN |SMITH;elRow1| ((|m| M) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec| (SPADCALL |m| |i| (QREFELT $ 25)) |SMITH;elRow1|)
                (SPADCALL |m| |i| (SPADCALL |m| |j| (QREFELT $ 25))
                          (QREFELT $ 26))
                (SPADCALL |m| |j| |vec| (QREFELT $ 26)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2| ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elRow2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 25))
                                (QREFELT $ 29))
                      . #1=(|SMITH;elRow2|))
                (LETT |vec|
                      (SPADCALL (ELT $ 30) (SPADCALL |m| |i| (QREFELT $ 25))
                                |vec| (QREFELT $ 32))
                      . #1#)
                (SPADCALL |m| |i| |vec| (QREFELT $ 26)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SMITH;elRow2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 27)))))) 

(SDEFUN |SMITH;elColumn2|
        ((|m| M) (|a| R) (|i| |Integer|) (|j| |Integer|) ($ M))
        (SPROG ((|vec| (|Col|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elColumn2!0| (VECTOR $ |a|))
                                (SPADCALL |m| |j| (QREFELT $ 33))
                                (QREFELT $ 34))
                      . #1=(|SMITH;elColumn2|))
                (LETT |vec|
                      (SPADCALL (ELT $ 30) (SPADCALL |m| |i| (QREFELT $ 33))
                                |vec| (QREFELT $ 35))
                      . #1#)
                (SPADCALL |m| |i| |vec| (QREFELT $ 36)) (EXIT |m|)))) 

(SDEFUN |SMITH;elColumn2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| $)
          (LETT |a| (QREFELT $$ 1) . #1=(|SMITH;elColumn2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT $ 27)))))) 

(SDEFUN |SMITH;ijDivide|
        ((|sf| |Record| (|:| |Smith| M) (|:| |leftEqMat| M)
          (|:| |rightEqMat| M))
         (|i| |Integer|) (|j| |Integer|)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((|rMat| (M)) (|lMat| (M)) (|mjj| (R)) (#1=#:G153 NIL) (|mii| (R))
          (|d| (R))
          (|extGcd|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|m| (M)))
         (SEQ (LETT |m| (QVELT |sf| 0) . #2=(|SMITH;ijDivide|))
              (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 11)) . #2#)
              (LETT |mjj| (SPADCALL |m| |j| |j| (QREFELT $ 11)) . #2#)
              (LETT |extGcd| (SPADCALL |mii| |mjj| (QREFELT $ 38)) . #2#)
              (LETT |d| (QVELT |extGcd| 2) . #2#)
              (LETT |mii|
                    (PROG2 (LETT #1# (SPADCALL |mii| |d| (QREFELT $ 20)) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                    . #2#)
              (LETT |mjj|
                    (PROG2 (LETT #1# (SPADCALL |mjj| |d| (QREFELT $ 20)) . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                    . #2#)
              (LETT |lMat|
                    (|SMITH;elRow2| (QVELT |sf| 1) (QVELT |extGcd| 0) |j| |i|
                     $)
                    . #2#)
              (LETT |lMat| (|SMITH;elRow1| |lMat| |i| |j| $) . #2#)
              (LETT |lMat|
                    (|SMITH;elRow2| |lMat| (SPADCALL |mii| (QREFELT $ 39)) |j|
                     |i| $)
                    . #2#)
              (SPADCALL |m| |j| |j|
                        (SPADCALL (SPADCALL |m| |i| |i| (QREFELT $ 11)) |mjj|
                                  (QREFELT $ 27))
                        (QREFELT $ 40))
              (SPADCALL |m| |i| |i| |d| (QREFELT $ 40))
              (LETT |rMat|
                    (|SMITH;elColumn2| (QVELT |sf| 2) (QVELT |extGcd| 1) |i|
                     |j| $)
                    . #2#)
              (LETT |rMat|
                    (|SMITH;elColumn2| |rMat| (SPADCALL |mjj| (QREFELT $ 39))
                     |j| |i| $)
                    . #2#)
              (SPADCALL |rMat| |j|
                        (SPADCALL (CONS #'|SMITH;ijDivide!0| $)
                                  (SPADCALL |rMat| |j| (QREFELT $ 33))
                                  (QREFELT $ 34))
                        (QREFELT $ 36))
              (EXIT (VECTOR |m| |lMat| |rMat|))))) 

(SDEFUN |SMITH;ijDivide!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL (|spadConstant| $ 42) |x| (QREFELT $ 43))
                  (QREFELT $ 39))) 

(SDEFUN |SMITH;lastStep|
        ((|sf| |Record| (|:| |Smith| M) (|:| |leftEqMat| M)
          (|:| |rightEqMat| M))
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((#1=#:G165 NIL) (|j| NIL) (|mii| (R)) (|i| NIL)
          (|m1| (|NonNegativeInteger|)) (|m| (M)))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (QVELT |sf| 0) . #2=(|SMITH;lastStep|))
                (LETT |m1|
                      (MIN (SPADCALL |m| (QREFELT $ 22))
                           (SPADCALL |m| (QREFELT $ 23)))
                      . #2#)
                (SEQ (LETT |i| 1 . #2#) G190
                     (COND
                      ((OR (|greater_SI| |i| |m1|)
                           (NULL
                            (SPADCALL
                             (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT $ 11))
                                   . #2#)
                             (|spadConstant| $ 16) (QREFELT $ 44))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1) . #2#) G190
                            (COND ((> |j| |m1|) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((QEQCAR
                                 (SPADCALL
                                  (SPADCALL |m| |j| |j| (QREFELT $ 11)) |mii|
                                  (QREFELT $ 20))
                                 1)
                                (PROGN
                                 (LETT #1#
                                       (|SMITH;lastStep|
                                        (|SMITH;ijDivide| |sf| |i| |j| $) $)
                                       . #2#)
                                 (GO #1#))))))
                            (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |sf|)))
          #1# (EXIT #1#)))) 

(SDEFUN |SMITH;findEqMat|
        ((|m| M) (|t| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (SPROG
         ((#1=#:G196 NIL) (|u1| (|Matrix| (|Fraction| R))) (#2=#:G178 NIL)
          (#3=#:G188 NIL) (#4=#:G187 (R)) (#5=#:G189 (R)) (#6=#:G201 NIL)
          (|k| NIL) (|j0| (|NonNegativeInteger|)) (|tjj| (R))
          (|j| (|NonNegativeInteger|)) (|i| NIL) (|t11| (R)) (|mm| (M))
          (|t1| (M)) (|u| (M)) (|mmh| (M)) (#7=#:G200 NIL) (#8=#:G171 NIL)
          (#9=#:G170 #10=(|Boolean|)) (#11=#:G172 #10#) (#12=#:G168 NIL)
          (#13=#:G167 #10#) (#14=#:G169 #10#) (|n1| (|NonNegativeInteger|))
          (|m1| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |m1| (SPADCALL |m| (QREFELT $ 22)) . #15=(|SMITH;findEqMat|))
            (LETT |n1| (SPADCALL |m| (QREFELT $ 23)) . #15#)
            (EXIT
             (COND
              ((PROGN
                (LETT #12# NIL . #15#)
                (SEQ (LETT |j| 1 . #15#) G190
                     (COND ((|greater_SI| |j| |n1|) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #14#
                              (SPADCALL (SPADCALL |t| |m1| |j| (QREFELT $ 11))
                                        (QREFELT $ 13))
                              . #15#)
                        (COND
                         (#12# (LETT #13# (COND (#13# #14#) ('T 'NIL)) . #15#))
                         ('T
                          (PROGN
                           (LETT #13# #14# . #15#)
                           (LETT #12# 'T . #15#)))))))
                     (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                     (EXIT NIL))
                (COND (#12# #13#) (#16='T 'T)))
               (SEQ
                (COND
                 ((PROGN
                   (LETT #8# NIL . #15#)
                   (SEQ (LETT |j| 1 . #15#) G190
                        (COND ((|greater_SI| |j| |n1|) (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #11#
                                 (SPADCALL (SPADCALL |t| 1 |j| (QREFELT $ 11))
                                           (QREFELT $ 13))
                                 . #15#)
                           (COND
                            (#8# (LETT #9# (COND (#9# #11#) ('T 'NIL)) . #15#))
                            ('T
                             (PROGN
                              (LETT #9# #11# . #15#)
                              (LETT #8# 'T . #15#)))))))
                        (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#8# #9#) (#16# 'T)))
                  (PROGN
                   (LETT #7#
                         (CONS |m|
                               (SPADCALL |m1| (|spadConstant| $ 15)
                                         (QREFELT $ 45)))
                         . #15#)
                   (GO #7#))))
                (LETT |mm|
                      (SPADCALL |m|
                                (SPADCALL |m1| (|spadConstant| $ 15)
                                          (QREFELT $ 45))
                                (QREFELT $ 46))
                      . #15#)
                (LETT |mmh| (SPADCALL |mm| (QREFELT $ 47)) . #15#)
                (EXIT
                 (CONS (SPADCALL |mmh| 1 |m1| 1 |n1| (QREFELT $ 48))
                       (SPADCALL |mmh| 1 |m1| (+ |n1| 1) (+ |n1| |m1|)
                                 (QREFELT $ 48))))))
              (#16#
               (SEQ (LETT |u| (SPADCALL |m1| |m1| (QREFELT $ 49)) . #15#)
                    (LETT |j| 1 . #15#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |t| 1 |j| (QREFELT $ 11))
                                      (|spadConstant| $ 16) (QREFELT $ 50)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |j| (+ |j| 1) . #15#))) NIL (GO G190)
                         G191 (EXIT NIL))
                    (LETT |t1| (SPADCALL |t| (QREFELT $ 51)) . #15#)
                    (LETT |mm| (SPADCALL |m| (QREFELT $ 51)) . #15#)
                    (COND
                     ((SPADCALL |j| 1 (QREFELT $ 52))
                      (SEQ
                       (LETT |t1| (SPADCALL |t| 1 |m1| |j| |n1| (QREFELT $ 48))
                             . #15#)
                       (EXIT
                        (LETT |mm|
                              (SPADCALL |m| 1 |m1| |j| |n1| (QREFELT $ 48))
                              . #15#)))))
                    (LETT |t11| (SPADCALL |t1| 1 1 (QREFELT $ 11)) . #15#)
                    (SEQ (LETT |i| 1 . #15#) G190
                         (COND ((|greater_SI| |i| |m1|) (GO G191)))
                         (SEQ
                          (SPADCALL |u| |i| 1
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL
                                               (SPADCALL |mm| |i| 1
                                                         (QREFELT $ 11))
                                               |t11| (QREFELT $ 20))
                                              . #15#)
                                        (QCDR #2#)
                                      (|check_union| (QEQCAR #2# 0)
                                                     (QREFELT $ 6) #2#))
                                    (QREFELT $ 40))
                          (EXIT
                           (SEQ (LETT |j| 2 . #15#) G190
                                (COND ((|greater_SI| |j| |m1|) (GO G191)))
                                (SEQ (LETT |j0| |j| . #15#)
                                     (SEQ G190
                                          (COND
                                           ((NULL
                                             (SPADCALL
                                              (LETT |tjj|
                                                    (SPADCALL |t1| |j| |j0|
                                                              (QREFELT $ 11))
                                                    . #15#)
                                              (QREFELT $ 13)))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |j0| (+ |j0| 1) . #15#)))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL |u| |i| |j|
                                                (PROG2
                                                    (LETT #2#
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |mm| |i|
                                                                      |j0|
                                                                      (QREFELT
                                                                       $ 11))
                                                            (PROGN
                                                             (LETT #3# NIL
                                                                   . #15#)
                                                             (SEQ
                                                              (LETT |k| 1
                                                                    . #15#)
                                                              (LETT #6#
                                                                    (- |j| 1)
                                                                    . #15#)
                                                              G190
                                                              (COND
                                                               ((|greater_SI|
                                                                 |k| #6#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #5#
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |u|
                                                                         |i|
                                                                         |k|
                                                                         (QREFELT
                                                                          $
                                                                          11))
                                                                        (SPADCALL
                                                                         |t1|
                                                                         |k|
                                                                         |j0|
                                                                         (QREFELT
                                                                          $
                                                                          11))
                                                                        (QREFELT
                                                                         $ 27))
                                                                       . #15#)
                                                                 (COND
                                                                  (#3#
                                                                   (LETT #4#
                                                                         (SPADCALL
                                                                          #4#
                                                                          #5#
                                                                          (QREFELT
                                                                           $
                                                                           30))
                                                                         . #15#))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #4#
                                                                          #5#
                                                                          . #15#)
                                                                    (LETT #3#
                                                                          'T
                                                                          . #15#)))))))
                                                              (LETT |k|
                                                                    (|inc_SI|
                                                                     |k|)
                                                                    . #15#)
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#3# #4#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     $ 16))))
                                                            (QREFELT $ 53))
                                                           |tjj|
                                                           (QREFELT $ 20))
                                                          . #15#)
                                                    (QCDR #2#)
                                                  (|check_union| (QEQCAR #2# 0)
                                                                 (QREFELT $ 6)
                                                                 #2#))
                                                (QREFELT $ 40))))
                                (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |u1| (SPADCALL (ELT $ 55) |u| (QREFELT $ 59)) . #15#)
                    (EXIT
                     (CONS |t|
                           (SPADCALL (ELT $ 60)
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |u1| (QREFELT $ 61))
                                               . #15#)
                                         (QCDR #1#)
                                       (|check_union| (QEQCAR #1# 0)
                                                      (|Matrix|
                                                       (|Fraction|
                                                        (QREFELT $ 6)))
                                                      #1#))
                                     (QREFELT $ 64))))))))))
          #7# (EXIT #7#)))) 

(SDEFUN |SMITH;hermite;2M;10| ((|m| M) ($ M)) (SPADCALL |m| (QREFELT $ 47))) 

(SDEFUN |SMITH;completeHermite;MR;11|
        ((|m| M) ($ |Record| (|:| |Hermite| M) (|:| |eqMat| M)))
        (|SMITH;findEqMat| |m| (SPADCALL |m| (QREFELT $ 47)) $)) 

(SDEFUN |SMITH;smith;2M;12| ((|m| M) ($ M))
        (QVELT (SPADCALL |m| (QREFELT $ 69)) 0)) 

(SDEFUN |SMITH;completeSmith;MR;13|
        ((|m| M)
         ($ |Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
        (SPROG
         ((|cm2|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
          (|m1| (M)) (|rightm| (M))
          (|cm1| (|Record| (|:| |Hermite| M) (|:| |eqMat| M)))
          (|nr| (|NonNegativeInteger|)) (|leftm| (M)))
         (SEQ
          (LETT |cm1| (SPADCALL |m| (QREFELT $ 67))
                . #1=(|SMITH;completeSmith;MR;13|))
          (LETT |leftm| (QCDR |cm1|) . #1#) (LETT |m1| (QCAR |cm1|) . #1#)
          (EXIT
           (COND
            ((|SMITH;isDiagonal?| |m1| $)
             (|SMITH;lastStep|
              (VECTOR |m1| |leftm|
                      (SPADCALL (SPADCALL |m| (QREFELT $ 23))
                                (|spadConstant| $ 15) (QREFELT $ 45)))
              $))
            (#2='T
             (SEQ (LETT |nr| (SPADCALL |m| (QREFELT $ 22)) . #1#)
                  (LETT |cm1|
                        (SPADCALL (SPADCALL |m1| (QREFELT $ 71))
                                  (QREFELT $ 67))
                        . #1#)
                  (LETT |rightm| (SPADCALL (QCDR |cm1|) (QREFELT $ 71)) . #1#)
                  (LETT |m1| (QCAR |cm1|) . #1#)
                  (EXIT
                   (COND
                    ((|SMITH;isDiagonal?| |m1| $)
                     (SEQ
                      (LETT |cm2|
                            (|SMITH;lastStep| (VECTOR |m1| |leftm| |rightm|) $)
                            . #1#)
                      (EXIT
                       (COND
                        ((EQL
                          (SPADCALL (LETT |m| (QVELT |cm2| 0) . #1#)
                                    (QREFELT $ 22))
                          |nr|)
                         |cm2|)
                        (#2#
                         (VECTOR (SPADCALL |m| (QREFELT $ 71)) (QVELT |cm2| 1)
                                 (QVELT |cm2| 2)))))))
                    (#2#
                     (SEQ (LETT |cm2| (SPADCALL |m1| (QREFELT $ 69)) . #1#)
                          (LETT |cm2|
                                (|SMITH;lastStep|
                                 (VECTOR (QVELT |cm2| 0)
                                         (SPADCALL
                                          (SPADCALL (QVELT |cm2| 2)
                                                    (QREFELT $ 71))
                                          |leftm| (QREFELT $ 72))
                                         (SPADCALL |rightm|
                                                   (SPADCALL (QVELT |cm2| 1)
                                                             (QREFELT $ 71))
                                                   (QREFELT $ 72)))
                                 $)
                                . #1#)
                          (EXIT
                           (COND
                            ((EQL
                              (SPADCALL (LETT |m| (QVELT |cm2| 0) . #1#)
                                        (QREFELT $ 22))
                              |nr|)
                             |cm2|)
                            (#2#
                             (VECTOR (SPADCALL |m| (QREFELT $ 71))
                                     (QVELT |cm2| 1)
                                     (QVELT |cm2| 2)))))))))))))))) 

(SDEFUN |SMITH;diophantineSystem;MColR;14|
        ((|m| M) (|b| |Col|)
         ($ |Record| (|:| |particular| (|Union| |Col| "failed"))
          (|:| |basis| (|List| |Col|))))
        (SPROG
         ((|lsol| (|List| |Col|)) (|i| NIL) (#1=#:G225 NIL) (|sol| (|Col|))
          (|rm| (M)) (|t2| (|Union| |Col| "failed"))
          (|n1| (|NonNegativeInteger|)) (|dk| (|NonNegativeInteger|))
          (|t1| (|Union| (|NonNegativeInteger|) "failed")) (|b1| (|Col|))
          (|lm| (M)) (|m1| (|NonNegativeInteger|)) (|sm| (M))
          (|sf|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M)
                     (|:| |rightEqMat| M))))
         (SEQ
          (LETT |sf| (SPADCALL |m| (QREFELT $ 69))
                . #2=(|SMITH;diophantineSystem;MColR;14|))
          (LETT |sm| (QVELT |sf| 0) . #2#)
          (LETT |m1| (SPADCALL |sm| (QREFELT $ 22)) . #2#)
          (LETT |lm| (QVELT |sf| 1) . #2#)
          (LETT |b1| (SPADCALL |lm| |b| (QREFELT $ 73)) . #2#)
          (LETT |t1| (|SMITH;test1| |sm| |b1| |m1| $) . #2#)
          (EXIT
           (COND ((QEQCAR |t1| 1) (CONS (CONS 1 "failed") NIL))
                 (#3='T
                  (SEQ (LETT |dk| (QCDR |t1|) . #2#)
                       (LETT |n1| (SPADCALL |sm| (QREFELT $ 23)) . #2#)
                       (LETT |t2| (|SMITH;test2| |sm| |b1| |n1| |dk| $) . #2#)
                       (EXIT
                        (COND ((QEQCAR |t2| 1) (CONS (CONS 1 "failed") NIL))
                              (#3#
                               (SEQ (LETT |rm| (QVELT |sf| 2) . #2#)
                                    (LETT |sol|
                                          (SPADCALL |rm| (QCDR |t2|)
                                                    (QREFELT $ 73))
                                          . #2#)
                                    (EXIT
                                     (COND
                                      ((EQL |dk| |n1|)
                                       (CONS (CONS 0 |sol|)
                                             (SPADCALL
                                              (SPADCALL |n1|
                                                        (|spadConstant| $ 16)
                                                        (QREFELT $ 18))
                                              (QREFELT $ 75))))
                                      (#3#
                                       (SEQ
                                        (LETT |lsol|
                                              (PROGN
                                               (LETT #1# NIL . #2#)
                                               (SEQ (LETT |i| (+ |dk| 1) . #2#)
                                                    G190
                                                    (COND
                                                     ((> |i| |n1|) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #1#
                                                            (CONS
                                                             (SPADCALL |rm| |i|
                                                                       (QREFELT
                                                                        $ 33))
                                                             #1#)
                                                            . #2#)))
                                                    (LETT |i| (+ |i| 1) . #2#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #1#))))
                                              . #2#)
                                        (EXIT
                                         (CONS (CONS 0 |sol|)
                                               |lsol|))))))))))))))))) 

(DECLAIM (NOTINLINE |SmithNormalForm;|)) 

(DEFUN |SmithNormalForm| (&REST #1=#:G226)
  (SPROG NIL
         (PROG (#2=#:G227)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SmithNormalForm|)
                                               '|domainEqualList|)
                    . #3=(|SmithNormalForm|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SmithNormalForm;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SmithNormalForm|)))))))))) 

(DEFUN |SmithNormalForm;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|SmithNormalForm|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|SmithNormalForm| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 79) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|SmithNormalForm|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|SmithNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |elt|) (|Boolean|)
              (7 . |zero?|) (12 . |elt|) (18 . |One|) (22 . |Zero|)
              (|NonNegativeInteger|) (26 . |new|) (|Union| $ '"failed")
              (32 . |exquo|) (38 . |setelt|) (45 . |nrows|) (50 . |ncols|)
              (55 . ~=) (61 . |row|) (67 . |setRow!|) (74 . *) (|Mapping| 6 6)
              (80 . |map|) (86 . +) (|Mapping| 6 6 6) (92 . |map|)
              (99 . |column|) (105 . |map|) (111 . |map|) (118 . |setColumn!|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (125 . |extendedEuclidean|) (131 . -) (136 . |setelt|)
              (|PositiveInteger|) (144 . |One|) (148 . *) (154 . ~=)
              (160 . |scalarMatrix|) (166 . |horizConcat|) (172 . |rowEchelon|)
              (177 . |subMatrix|) (186 . |zero|) (192 . =) (198 . |copy|)
              (203 . >) (209 . -) (|Fraction| 6) (215 . |coerce|) (|Matrix| 54)
              (|Mapping| 54 6)
              (|MatrixCategoryFunctions2| 6 7 8 9 54 (|Vector| 54)
                                          (|Vector| 54) 56)
              (220 . |map|) (226 . |retract|) (231 . |inverse|)
              (|Mapping| 6 54)
              (|MatrixCategoryFunctions2| 54 (|Vector| 54) (|Vector| 54) 56 6 7
                                          8 9)
              (236 . |map|) |SMITH;hermite;2M;10|
              (|Record| (|:| |Hermite| 9) (|:| |eqMat| 9))
              |SMITH;completeHermite;MR;11|
              (|Record| (|:| |Smith| 9) (|:| |leftEqMat| 9)
                        (|:| |rightEqMat| 9))
              |SMITH;completeSmith;MR;13| |SMITH;smith;2M;12|
              (242 . |transpose|) (247 . *) (253 . *) (|List| 8) (259 . |list|)
              (|Union| 8 '"failed")
              (|Record| (|:| |particular| 76) (|:| |basis| 74))
              |SMITH;diophantineSystem;MColR;14|)
           '#(|smith| 264 |hermite| 269 |diophantineSystem| 274 |completeSmith|
              280 |completeHermite| 285)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 78
                                                 '(3 9 6 0 10 10 11 1 6 12 0 13
                                                   2 8 6 0 10 14 0 6 0 15 0 6 0
                                                   16 2 8 0 17 6 18 2 6 19 0 0
                                                   20 3 8 6 0 10 6 21 1 9 17 0
                                                   22 1 9 17 0 23 2 17 12 0 0
                                                   24 2 9 7 0 10 25 3 9 0 0 10
                                                   7 26 2 6 0 0 0 27 2 7 0 28 0
                                                   29 2 6 0 0 0 30 3 7 0 31 0 0
                                                   32 2 9 8 0 10 33 2 8 0 28 0
                                                   34 3 8 0 31 0 0 35 3 9 0 0
                                                   10 8 36 2 6 37 0 0 38 1 6 0
                                                   0 39 4 9 6 0 10 10 6 40 0 41
                                                   0 42 2 6 0 41 0 43 2 6 12 0
                                                   0 44 2 9 0 17 6 45 2 9 0 0 0
                                                   46 1 9 0 0 47 5 9 0 0 10 10
                                                   10 10 48 2 9 0 17 17 49 2 6
                                                   12 0 0 50 1 9 0 0 51 2 17 12
                                                   0 0 52 2 6 0 0 0 53 1 54 0 6
                                                   55 2 58 56 57 9 59 1 54 6 0
                                                   60 1 56 19 0 61 2 63 9 62 56
                                                   64 1 9 0 0 71 2 9 0 0 0 72 2
                                                   9 8 0 8 73 1 74 0 8 75 1 0 9
                                                   9 70 1 0 9 9 65 2 0 77 9 8
                                                   78 1 0 68 9 69 1 0 66 9
                                                   67)))))
           '|lookupComplete|)) 
