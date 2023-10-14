
(SDEFUN |GROEBSOL;testPower|
        ((|uf| |SparseUnivariatePolynomial|
          (|DistributedMultivariatePolynomial| |lv| F))
         (|x| |OrderedVariableList| |lv|)
         (|lpol| |List| (|DistributedMultivariatePolynomial| |lv| F))
         ($ |Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
        (SPROG
         ((|g| (|DistributedMultivariatePolynomial| |lv| F))
          (|linp|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|lc| (|DistributedMultivariatePolynomial| |lv| F)) (#1=#:G122 NIL)
          (|trailp| (|DistributedMultivariatePolynomial| |lv| F))
          (|gg| (|DistributedMultivariatePolynomial| |lv| F))
          (|testquo|
           (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (#2=#:G124 NIL) (|df| (|NonNegativeInteger|)))
         (SEQ
          (LETT |df| (SPADCALL |uf| (QREFELT $ 12))
                . #3=(|GROEBSOL;testPower|))
          (LETT |trailp|
                (SPADCALL |uf|
                          (PROG1 (LETT #2# (- |df| 1) . #3#)
                            (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                             #2#))
                          (QREFELT $ 16))
                . #3#)
          (LETT |testquo|
                (SPADCALL |trailp| (SPADCALL |df| (QREFELT $ 18))
                          (QREFELT $ 20))
                . #3#)
          (EXIT
           (COND ((QEQCAR |testquo| 1) (CONS 1 "failed"))
                 (#4='T
                  (SEQ (LETT |trailp| (QCDR |testquo|) . #3#)
                       (LETT |gg|
                             (SPADCALL
                              (LETT |lc| (SPADCALL |uf| (QREFELT $ 21)) . #3#)
                              |trailp| (QREFELT $ 22))
                             . #3#)
                       (LETT |trailp|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL |trailp| |gg| (QREFELT $ 23))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|DistributedMultivariatePolynomial|
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              #1#))
                             . #3#)
                       (LETT |lc|
                             (PROG2
                                 (LETT #1# (SPADCALL |lc| |gg| (QREFELT $ 23))
                                       . #3#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0)
                                              (|DistributedMultivariatePolynomial|
                                               (QREFELT $ 6) (QREFELT $ 7))
                                              #1#))
                             . #3#)
                       (LETT |linp|
                             (SPADCALL (SPADCALL |lc| 1 (QREFELT $ 24))
                                       (SPADCALL |trailp| 0 (QREFELT $ 24))
                                       (QREFELT $ 25))
                             . #3#)
                       (LETT |g|
                             (SPADCALL
                              (SPADCALL |uf|
                                        (SPADCALL |linp| |df| (QREFELT $ 26))
                                        (QREFELT $ 27))
                              |x| (QREFELT $ 30))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |g| |lpol| (QREFELT $ 33))
                                    (|spadConstant| $ 34) (QREFELT $ 36))
                          (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (SPADCALL |linp| |x| (QREFELT $ 30))))))))))))) 

(SDEFUN |GROEBSOL;testGenPos|
        ((|lpol| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
          "failed"))
        (SPROG
         ((#1=#:G141 NIL) (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|newlpol| (|List| #2=(|DistributedMultivariatePolynomial| |lv| F)))
          (|g| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|fi|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|x| (|OrderedVariableList| |lv|)) (#3=#:G142 NIL) (|f| #2#)
          (|rlpol| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |rlpol| (REVERSE |lpol|) . #4=(|GROEBSOL;testGenPos|))
                (LETT |f| (|SPADfirst| |rlpol|) . #4#)
                (EXIT
                 (COND ((EQL (LENGTH |lvar|) 1) (CONS 0 (LIST |f|)))
                       ('T
                        (SEQ (LETT |rlvar| (CDR (REVERSE |lvar|)) . #4#)
                             (LETT |newlpol| (LIST |f|) . #4#)
                             (SEQ (LETT |f| NIL . #4#)
                                  (LETT #3# (CDR |rlpol|) . #4#) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |x| (|SPADfirst| |rlvar|) . #4#)
                                       (LETT |fi|
                                             (SPADCALL |f| |x| (QREFELT $ 37))
                                             . #4#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR
                                           (SPADCALL
                                            (SPADCALL |fi| (QREFELT $ 21))
                                            (QREFELT $ 39))
                                           1)
                                          (SEQ
                                           (SEQ
                                            (LETT |g|
                                                  (|GROEBSOL;testPower| |fi|
                                                   |x| |newlpol| $)
                                                  . #4#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |g| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #4#)
                                                (GO #1#))))))
                                           (LETT |newlpol|
                                                 (CONS
                                                  (SPADCALL (QCDR |g|)
                                                            |newlpol|
                                                            (QREFELT $ 33))
                                                  |newlpol|)
                                                 . #4#)
                                           (EXIT
                                            (LETT |rlvar| (CDR |rlvar|)
                                                  . #4#))))
                                         ((SPADCALL
                                           (SPADCALL |f| |newlpol|
                                                     (QREFELT $ 33))
                                           (|spadConstant| $ 34)
                                           (QREFELT $ 36))
                                          (PROGN
                                           (LETT #1# (CONS 1 "failed") . #4#)
                                           (GO #1#))))))
                                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |newlpol|))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |GROEBSOL;genPos|
        ((|lp| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Record|
          (|:| |polys|
               (|List|
                (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|:| |lpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |coord| (|List| (|Integer|)))
          (|:| |univp|
               (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((#1=#:G129 NIL) (|testfail| (|Boolean|))
          (|gb1|
           (|Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
                    "failed"))
          (|gbt| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|gb|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#2=#:G161 NIL) (|p| NIL) (#3=#:G160 NIL)
          (|val| #4=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#5=#:G147 NIL) (#6=#:G146 #4#) (#7=#:G148 #4#) (#8=#:G158 NIL)
          (|vv| NIL) (#9=#:G159 NIL) (|rv| NIL)
          (|ranvals| (|List| (|Integer|))) (#10=#:G157 NIL) (#11=#:G156 NIL)
          (|count| NIL) (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|x| (|OrderedVariableList| |lv|))
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#12=#:G155 NIL) (|f| NIL) (#13=#:G154 NIL))
         (SEQ (LETT |rlvar| (REVERSE |lvar|) . #14=(|GROEBSOL;genPos|))
              (LETT |lnp|
                    (PROGN
                     (LETT #13# NIL . #14#)
                     (SEQ (LETT |f| NIL . #14#) (LETT #12# |lp| . #14#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |f| (CAR #12#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |f| (QREFELT $ 42)) #13#)
                                  . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (LETT |x| (|SPADfirst| |rlvar|) . #14#)
              (LETT |rlvar| (CDR |rlvar|) . #14#) (LETT |testfail| 'T . #14#)
              (SEQ (LETT |count| 1 . #14#) G190
                   (COND ((NULL |testfail|) (GO G191)))
                   (SEQ
                    (LETT |ranvals|
                          (PROGN
                           (LETT #11# NIL . #14#)
                           (SEQ (LETT |vv| NIL . #14#)
                                (LETT #10# |rlvar| . #14#) G190
                                (COND
                                 ((OR (ATOM #10#)
                                      (PROGN
                                       (LETT |vv| (CAR #10#) . #14#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11#
                                        (CONS
                                         (+ 1
                                            (RANDOM
                                             (* |count| (LENGTH |lvar|))))
                                         #11#)
                                        . #14#)))
                                (LETT #10# (CDR #10#) . #14#) (GO G190) G191
                                (EXIT (NREVERSE #11#))))
                          . #14#)
                    (LETT |val|
                          (PROGN
                           (LETT #5# NIL . #14#)
                           (SEQ (LETT |rv| NIL . #14#)
                                (LETT #9# |ranvals| . #14#)
                                (LETT |vv| NIL . #14#)
                                (LETT #8# |rlvar| . #14#) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |vv| (CAR #8#) . #14#) NIL)
                                      (ATOM #9#)
                                      (PROGN (LETT |rv| (CAR #9#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7#
                                         (SPADCALL |rv|
                                                   (SPADCALL |vv|
                                                             (QREFELT $ 43))
                                                   (QREFELT $ 44))
                                         . #14#)
                                   (COND
                                    (#5#
                                     (LETT #6#
                                           (SPADCALL #6# #7# (QREFELT $ 45))
                                           . #14#))
                                    ('T
                                     (PROGN
                                      (LETT #6# #7# . #14#)
                                      (LETT #5# 'T . #14#)))))))
                                (LETT #8#
                                      (PROG1 (CDR #8#)
                                        (LETT #9# (CDR #9#) . #14#))
                                      . #14#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#5# #6#) ('T (|spadConstant| $ 46))))
                          . #14#)
                    (LETT |val|
                          (SPADCALL |val| (SPADCALL |x| (QREFELT $ 43))
                                    (QREFELT $ 45))
                          . #14#)
                    (LETT |gb|
                          (PROGN
                           (LETT #3# NIL . #14#)
                           (SEQ (LETT |p| NIL . #14#) (LETT #2# |lnp| . #14#)
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |p| (CAR #2#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |p| |x| (QREFELT $ 47))
                                          |val| (QREFELT $ 49))
                                         #3#)
                                        . #14#)))
                                (LETT #2# (CDR #2#) . #14#) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          . #14#)
                    (LETT |gb| (SPADCALL |gb| (QREFELT $ 52)) . #14#)
                    (LETT |gbt| (SPADCALL |gb| (QREFELT $ 54)) . #14#)
                    (LETT |gb1| (|GROEBSOL;testGenPos| |gbt| |lvar| $) . #14#)
                    (EXIT
                     (COND ((QEQCAR |gb1| 1) "try again")
                           ('T (LETT |testfail| 'NIL . #14#)))))
                   (LETT |count| (|inc_SI| |count|) . #14#) (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (VECTOR |gb| |gbt| |ranvals|
                       (SPADCALL
                        (SPADCALL
                         (PROG2 (LETT #1# |gb1| . #14#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|List|
                                           (|DistributedMultivariatePolynomial|
                                            (QREFELT $ 6) (QREFELT $ 7)))
                                          #1#))
                         (QREFELT $ 55))
                        (QREFELT $ 42))))))) 

(SDEFUN |GROEBSOL;genericPosition;LLR;4|
        ((|lp| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Record|
          (|:| |dpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|:| |coords| (|List| (|Integer|)))))
        (SPROG
         ((|nans|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
         (SEQ
          (LETT |nans| (|GROEBSOL;genPos| |lp| |lvar| $)
                |GROEBSOL;genericPosition;LLR;4|)
          (EXIT (CONS (QVELT |nans| 1) (QVELT |nans| 2)))))) 

(SDEFUN |GROEBSOL;select|
        ((|lup| |List|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         ($
          . #1=(|List|
                (|List|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((#2=#:G167 NIL) (#3=#:G166 #1#) (#4=#:G168 #1#) (#5=#:G173 NIL)
          (|lsel| NIL) (#6=#:G172 NIL) (#7=#:G171 NIL) (|f| NIL))
         (SEQ
          (COND
           ((SPADCALL |lup| NIL (QREFELT $ 60)) (SPADCALL NIL (QREFELT $ 61)))
           (#8='T
            (PROGN
             (LETT #2# NIL . #9=(|GROEBSOL;select|))
             (SEQ (LETT |f| NIL . #9#) (LETT #7# (|SPADfirst| |lup|) . #9#)
                  G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL . #9#)
                            (SEQ (LETT |lsel| NIL . #9#)
                                 (LETT #5# (|GROEBSOL;select| (CDR |lup|) $)
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |lsel| (CAR #5#) . #9#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (CONS |f| |lsel|) #6#)
                                         . #9#)))
                                 (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #9#)
                     (COND (#2# (LETT #3# (APPEND #3# #4#) . #9#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #9#)
                             (LETT #2# 'T . #9#)))))))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8# NIL)))))))) 

(SDEFUN |GROEBSOL;findCompon|
        ((|leq| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((#1=#:G198 NIL) (|ll| NIL) (#2=#:G197 NIL)
          (|ans|
           (|List| #3=(|List| (|DistributedMultivariatePolynomial| |lv| F))))
          (#4=#:G196 NIL) (|p| NIL) (#5=#:G195 NIL) (#6=#:G194 NIL) (|lp| NIL)
          (#7=#:G193 NIL)
          (|val| #8=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#9=#:G179 NIL) (#10=#:G178 #8#) (#11=#:G180 #8#) (#12=#:G191 NIL)
          (|vv| NIL) (#13=#:G192 NIL) (|rv| NIL)
          (|rlvar| (|List| (|OrderedVariableList| |lv|)))
          (|x| (|OrderedVariableList| |lv|)) (|ranvals| (|List| (|Integer|)))
          (|result|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|tlfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#14=#:G190 NIL) (|tfact| NIL)
          (|lfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#15=#:G189 NIL) (|ff| NIL) (#16=#:G188 NIL)
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|lgp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|gp|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|teq| #3#))
         (SEQ
          (LETT |teq| (SPADCALL |leq| (QREFELT $ 54))
                . #17=(|GROEBSOL;findCompon|))
          (EXIT
           (COND ((EQL (LENGTH |teq|) (LENGTH |lvar|)) (LIST |teq|))
                 (#18='T
                  (SEQ (LETT |gp| (|GROEBSOL;genPos| |teq| |lvar| $) . #17#)
                       (LETT |lgp| (QVELT |gp| 0) . #17#)
                       (LETT |g| (QVELT |gp| 3) . #17#)
                       (LETT |fg| (SPADCALL |g| (QREFELT $ 64)) . #17#)
                       (LETT |lfact|
                             (PROGN
                              (LETT #16# NIL . #17#)
                              (SEQ (LETT |ff| NIL . #17#)
                                   (LETT #15# (SPADCALL |fg| (QREFELT $ 67))
                                         . #17#)
                                   G190
                                   (COND
                                    ((OR (ATOM #15#)
                                         (PROGN
                                          (LETT |ff| (CAR #15#) . #17#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #16# (CONS (QCAR |ff|) #16#)
                                           . #17#)))
                                   (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                                   (EXIT (NREVERSE #16#))))
                             . #17#)
                       (LETT |result| NIL . #17#)
                       (EXIT
                        (COND ((EQL (LENGTH |lfact|) 1) (LIST |teq|))
                              (#18#
                               (SEQ
                                (SEQ (LETT |tfact| NIL . #17#)
                                     (LETT #14# |lfact| . #17#) G190
                                     (COND
                                      ((OR (ATOM #14#)
                                           (PROGN
                                            (LETT |tfact| (CAR #14#) . #17#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |tlfact| (CONS |tfact| |lgp|)
                                            . #17#)
                                      (EXIT
                                       (LETT |result| (CONS |tlfact| |result|)
                                             . #17#)))
                                     (LETT #14# (CDR #14#) . #17#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |ranvals| (QVELT |gp| 2) . #17#)
                                (LETT |rlvar| (REVERSE |lvar|) . #17#)
                                (LETT |x| (|SPADfirst| |rlvar|) . #17#)
                                (LETT |rlvar| (CDR |rlvar|) . #17#)
                                (LETT |val|
                                      (PROGN
                                       (LETT #9# NIL . #17#)
                                       (SEQ (LETT |rv| NIL . #17#)
                                            (LETT #13# |ranvals| . #17#)
                                            (LETT |vv| NIL . #17#)
                                            (LETT #12# |rlvar| . #17#) G190
                                            (COND
                                             ((OR (ATOM #12#)
                                                  (PROGN
                                                   (LETT |vv| (CAR #12#)
                                                         . #17#)
                                                   NIL)
                                                  (ATOM #13#)
                                                  (PROGN
                                                   (LETT |rv| (CAR #13#)
                                                         . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (PROGN
                                               (LETT #11#
                                                     (SPADCALL |rv|
                                                               (SPADCALL |vv|
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                               (QREFELT $ 44))
                                                     . #17#)
                                               (COND
                                                (#9#
                                                 (LETT #10#
                                                       (SPADCALL #10# #11#
                                                                 (QREFELT $
                                                                          45))
                                                       . #17#))
                                                ('T
                                                 (PROGN
                                                  (LETT #10# #11# . #17#)
                                                  (LETT #9# 'T . #17#)))))))
                                            (LETT #12#
                                                  (PROG1 (CDR #12#)
                                                    (LETT #13# (CDR #13#)
                                                          . #17#))
                                                  . #17#)
                                            (GO G190) G191 (EXIT NIL))
                                       (COND (#9# #10#)
                                             (#18# (|spadConstant| $ 46))))
                                      . #17#)
                                (LETT |val|
                                      (SPADCALL (SPADCALL |x| (QREFELT $ 43))
                                                |val| (QREFELT $ 68))
                                      . #17#)
                                (LETT |ans|
                                      (PROGN
                                       (LETT #7# NIL . #17#)
                                       (SEQ (LETT |lp| NIL . #17#)
                                            (LETT #6# |result| . #17#) G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |lp| (CAR #6#) . #17#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (PROGN
                                                        (LETT #5# NIL . #17#)
                                                        (SEQ
                                                         (LETT |p| NIL . #17#)
                                                         (LETT #4# |lp| . #17#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #4#)
                                                               (PROGN
                                                                (LETT |p|
                                                                      (CAR #4#)
                                                                      . #17#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #5#
                                                                 (CONS
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |p| |x|
                                                                    (QREFELT $
                                                                             47))
                                                                   |val|
                                                                   (QREFELT $
                                                                            49))
                                                                  #5#)
                                                                 . #17#)))
                                                         (LETT #4# (CDR #4#)
                                                               . #17#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #5#))))
                                                       (QREFELT $ 52))
                                                      (QREFELT $ 54))
                                                     #7#)
                                                    . #17#)))
                                            (LETT #6# (CDR #6#) . #17#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      . #17#)
                                (EXIT
                                 (PROGN
                                  (LETT #2# NIL . #17#)
                                  (SEQ (LETT |ll| NIL . #17#)
                                       (LETT #1# |ans| . #17#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ll| (CAR #1#) . #17#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((SPADCALL |ll|
                                                     (LIST
                                                      (|spadConstant| $ 69))
                                                     (QREFELT $ 70))
                                           (LETT #2# (CONS |ll| #2#)
                                                 . #17#)))))
                                       (LETT #1# (CDR #1#) . #17#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#)))))))))))))))) 

(SDEFUN |GROEBSOL;zeroDim?|
        ((|lp| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| . #1=(|List| (|OrderedVariableList| |lv|))) ($ |Boolean|))
        (SPROG
         ((|lvint1| #1#) (|x| (|OrderedVariableList| |lv|)) (#2=#:G201 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#3=#:G209 NIL) (|f| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lp|) 'NIL)
                (#4='T
                 (SEQ (LETT |n| (LENGTH |lvar|) . #5=(|GROEBSOL;zeroDim?|))
                      (EXIT
                       (COND ((< (LENGTH |lp|) |n|) 'NIL)
                             (#4#
                              (SEQ (LETT |lvint1| |lvar| . #5#)
                                   (SEQ (LETT |f| NIL . #5#)
                                        (LETT #3# |lp| . #5#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |f| (CAR #3#) . #5#)
                                               NIL)
                                              (NULL
                                               (COND ((NULL |lvint1|) 'NIL)
                                                     ('T 'T))))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |g|
                                               (SPADCALL |f|
                                                         (SPADCALL |f|
                                                                   (QREFELT $
                                                                            71))
                                                         (QREFELT $ 68))
                                               . #5#)
                                         (LETT |x|
                                               (PROG2
                                                   (LETT #2#
                                                         (SPADCALL |g|
                                                                   (QREFELT $
                                                                            72))
                                                         . #5#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|OrderedVariableList|
                                                                 (QREFELT $ 6))
                                                                #2#))
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |g| |x| (QREFELT $ 47))
                                              (QREFELT $ 73))
                                             (QREFELT $ 74))
                                            (LETT |lvint1|
                                                  (SPADCALL |x| |lvint1|
                                                            (QREFELT $ 75))
                                                  . #5#)))))
                                        (LETT #3# (CDR #3#) . #5#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT (NULL |lvint1|)))))))))))) 

(SDEFUN |GROEBSOL;groebSolve;LLL;8|
        ((|leq| |List| (|DistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((|result|
           (|List| (|List| (|DistributedMultivariatePolynomial| |lv| F))))
          (|tfact|
           #1=(|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#2=#:G230 NIL)
          (|lfact|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (#3=#:G229 NIL) (|ff| NIL) (#4=#:G228 NIL) (#5=#:G227 NIL)
          (|llf| NIL) (#6=#:G226 NIL) (#7=#:G215 NIL)
          (|llfact|
           (|List|
            (|Factored|
             (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#8=#:G225 NIL) (|x| NIL)
          (|lup|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|basis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|leq1| #1#)
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#9=#:G224 NIL) (|f| NIL) (#10=#:G223 NIL))
         (SEQ
          (LETT |lnp|
                (PROGN
                 (LETT #10# NIL . #11=(|GROEBSOL;groebSolve;LLL;8|))
                 (SEQ (LETT |f| NIL . #11#) (LETT #9# |leq| . #11#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |f| (QREFELT $ 42)) #10#)
                              . #11#)))
                      (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #11#)
          (LETT |leq1| (SPADCALL |lnp| (QREFELT $ 52)) . #11#)
          (COND
           ((EQL (LENGTH |leq1|) 1)
            (COND
             ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 76)
                        (QREFELT $ 77))
              (EXIT (SPADCALL NIL (QREFELT $ 79)))))))
          (COND
           ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $))
            (EXIT
             (|error| "system does not have a finite number of solutions"))))
          (LETT |basis| (SPADCALL |leq1| (QREFELT $ 80)) . #11#)
          (LETT |lup| NIL . #11#) (LETT |llfact| NIL . #11#)
          (SEQ
           (EXIT
            (SEQ (LETT |x| NIL . #11#) (LETT #8# |lvar| . #11#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |x| (CAR #8#) . #11#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |g| (SPADCALL |leq1| |basis| |x| (QREFELT $ 81))
                        . #11#)
                  (LETT |fg| (SPADCALL |g| (QREFELT $ 64)) . #11#)
                  (LETT |llfact| (CONS |fg| |llfact|) . #11#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |g| |x| (QREFELT $ 82)) (LENGTH |basis|))
                     (PROGN (LETT #7# |$NoValue| . #11#) (GO #7#))))))
                 (LETT #8# (CDR #8#) . #11#) (GO G190) G191 (EXIT NIL)))
           #7# (EXIT #7#))
          (LETT |result| NIL . #11#)
          (LETT |lfact|
                (|GROEBSOL;select|
                 (PROGN
                  (LETT #6# NIL . #11#)
                  (SEQ (LETT |llf| NIL . #11#) (LETT #5# |llfact| . #11#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |llf| (CAR #5#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (PROGN
                                 (LETT #4# NIL . #11#)
                                 (SEQ (LETT |ff| NIL . #11#)
                                      (LETT #3# (SPADCALL |llf| (QREFELT $ 67))
                                            . #11#)
                                      G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |ff| (CAR #3#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4# (CONS (QCAR |ff|) #4#)
                                              . #11#)))
                                      (LETT #3# (CDR #3#) . #11#) (GO G190)
                                      G191 (EXIT (NREVERSE #4#))))
                                #6#)
                               . #11#)))
                       (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 $)
                . #11#)
          (SEQ (LETT |tfact| NIL . #11#) (LETT #2# |lfact| . #11#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |tfact| (CAR #2#) . #11#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |tfact|
                      (SPADCALL (SPADCALL |tfact| |leq1| (QREFELT $ 83))
                                (QREFELT $ 52))
                      . #11#)
                (EXIT
                 (COND
                  ((SPADCALL |tfact| (LIST (|spadConstant| $ 76))
                             (QREFELT $ 84))
                   "next value")
                  ('T
                   (LETT |result|
                         (SPADCALL |result|
                                   (|GROEBSOL;findCompon| |tfact| |lvar| $)
                                   (QREFELT $ 85))
                         . #11#)))))
               (LETT #2# (CDR #2#) . #11#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(SDEFUN |GROEBSOL;testDim;LLU;9|
        ((|leq| |List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (|lvar| |List| (|OrderedVariableList| |lv|))
         ($ |Union|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          "failed"))
        (SPROG
         ((|leq1|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (LETT |leq1| (SPADCALL |leq| (QREFELT $ 52))
                |GROEBSOL;testDim;LLU;9|)
          (COND
           ((EQL (LENGTH |leq1|) 1)
            (COND
             ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| $ 76)
                        (QREFELT $ 77))
              (EXIT (CONS 0 NIL))))))
          (COND
           ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| $))
            (EXIT (CONS 1 "failed"))))
          (EXIT (CONS 0 |leq1|))))) 

(DECLAIM (NOTINLINE |GroebnerSolve;|)) 

(DEFUN |GroebnerSolve| (&REST #1=#:G242)
  (SPROG NIL
         (PROG (#2=#:G243)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GroebnerSolve|)
                                               '|domainEqualList|)
                    . #3=(|GroebnerSolve|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GroebnerSolve;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GroebnerSolve|)))))))))) 

(DEFUN |GroebnerSolve;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GroebnerSolve|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|GroebnerSolve| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 89) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GroebnerSolve|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (LENGTH |#1|))
          $))) 

(MAKEPROP '|GroebnerSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nv| (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 15) (0 . |degree|) (5 . |One|)
              (9 . |One|) (|DistributedMultivariatePolynomial| 6 7)
              (13 . |coefficient|) (|Integer|) (19 . |coerce|)
              (|Union| $ '"failed") (24 . |exquo|) (30 . |leadingCoefficient|)
              (35 . |gcd|) (41 . |exquo|) (47 . |monomial|) (53 . +) (59 . ^)
              (65 . -) (|SparseUnivariatePolynomial| $)
              (|OrderedVariableList| 6) (71 . |multivariate|) (|List| 15)
              (|GroebnerInternalPackage| 7
                                         (|DirectProduct|
                                          (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                         29 15)
              (77 . |redPol|) (83 . |Zero|) (|Boolean|) (87 . ~=)
              (93 . |univariate|) (|Union| 29 '"failed") (99 . |mainVariable|)
              (|HomogeneousDistributedMultivariatePolynomial| 6 7)
              (|PolToPol| 6 7) (104 . |dmpToHdmp|) (109 . |coerce|) (114 . *)
              (120 . +) (126 . |Zero|) (130 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (136 . |elt|) (|List| 40)
              (|GroebnerPackage| 7
                                 (|HomogeneousDirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT $ 6))) 10)
                                 29 40)
              (142 . |groebner|) (|LinGroebnerPackage| 6 7) (147 . |totolex|)
              (152 . |last|)
              (|Record| (|:| |dpolys| 31) (|:| |coords| (|List| 17)))
              (|List| 29) |GROEBSOL;genericPosition;LLR;4| (|List| 50)
              (157 . =) (163 . |list|) (|Factored| 40)
              (|GeneralizedMultivariateFactorize| 29
                                                  (|HomogeneousDirectProduct|
                                                   (NRTEVAL
                                                    (LENGTH (QREFELT $ 6)))
                                                   10)
                                                  8 7 40)
              (168 . |factor|) (|Record| (|:| |factor| 40) (|:| |exponent| 17))
              (|List| 65) (173 . |factors|) (178 . -) (184 . |One|) (188 . ~=)
              (194 . |reductum|) (199 . |mainVariable|)
              (204 . |leadingCoefficient|) (209 . |ground?|) (214 . |remove|)
              (220 . |One|) (224 . =) (|List| 31) (230 . |list|)
              (235 . |computeBasis|) (240 . |minPol|) (247 . |degree|)
              (253 . |concat|) (259 . =) (265 . |concat|)
              |GROEBSOL;groebSolve;LLL;8| (|Union| 50 '"failed")
              |GROEBSOL;testDim;LLU;9|)
           '#(|testDim| 271 |groebSolve| 277 |genericPosition| 283) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 88
                                                 '(1 11 10 0 12 0 7 0 13 0 8 0
                                                   14 2 11 15 0 10 16 1 7 0 17
                                                   18 2 15 19 0 7 20 1 11 15 0
                                                   21 2 15 0 0 0 22 2 15 19 0 0
                                                   23 2 11 0 15 10 24 2 11 0 0
                                                   0 25 2 11 0 0 10 26 2 11 0 0
                                                   0 27 2 15 0 28 29 30 2 32 15
                                                   15 31 33 0 15 0 34 2 15 35 0
                                                   0 36 2 15 28 0 29 37 1 15 38
                                                   0 39 1 41 40 15 42 1 40 0 29
                                                   43 2 40 0 17 0 44 2 40 0 0 0
                                                   45 0 40 0 46 2 40 28 0 29 47
                                                   2 48 40 0 40 49 1 51 50 50
                                                   52 1 53 31 50 54 1 31 15 0
                                                   55 2 59 35 0 0 60 1 59 0 50
                                                   61 1 63 62 40 64 1 62 66 0
                                                   67 2 40 0 0 0 68 0 15 0 69 2
                                                   31 35 0 0 70 1 40 0 0 71 1
                                                   40 38 0 72 1 48 40 0 73 1 40
                                                   35 0 74 2 57 0 29 0 75 0 40
                                                   0 76 2 40 35 0 0 77 1 78 0
                                                   31 79 1 53 50 50 80 3 53 40
                                                   50 50 29 81 2 40 10 0 29 82
                                                   2 50 0 0 0 83 2 50 35 0 0 84
                                                   2 78 0 0 0 85 2 0 87 50 57
                                                   88 2 0 78 31 57 86 2 0 56 31
                                                   57 58)))))
           '|lookupComplete|)) 
