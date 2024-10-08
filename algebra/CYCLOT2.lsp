
(SDEFUN |CYCLOT2;filter_prods|
        ((|p| #1=(|Integer|)) (|pl| (|List| (|Integer|)))
         (|ev_odd| (|Boolean|)) (|mp| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| #1#)) (#2=#:G46 NIL) (|c| (|Integer|)) (#3=#:G47 NIL)
          (|pr| NIL))
         (SEQ (LETT |res| (COND (|ev_odd| (LIST (- |p|))) ('T (LIST |p|))))
              (SEQ (LETT |pr| NIL) (LETT #3# |pl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |pr| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |c| (- (* |p| |pr|)))
                          (EXIT
                           (COND
                            ((> (ABS |c|) |mp|)
                             (PROGN (LETT #2# |$NoValue|) (GO #4=#:G41)))
                            ('T (LETT |res| (CONS |c| |res|)))))))
                    #4# (EXIT #2#))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;recursive_check2|
        ((|p| (|Integer|)) (|pa| (|PrimitiveArray| (|Integer|)))
         (|mp| (|Integer|)) (|m| (|Integer|)) (|res| (|Integer|))
         (|rl| (|List| (|Integer|))) (|ev_odd| (|Boolean|))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((#1=#:G67 NIL) (|i| NIL) (#2=#:G66 NIL) (#3=#:G65 NIL)
          (|pl1| (|List| (|Integer|))) (|mu| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((NULL (SPADCALL |p| (QREFELT % 8))) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |res| (* |res| |p|)) (LETT |rl| (CONS |p| |rl|))
                      (LETT |mu| (SPADCALL |m| (- |p| 1) (QREFELT % 12)))
                      (EXIT
                       (COND ((QEQCAR |mu| 1) (CONS 1 "failed"))
                             (#4='T
                              (SEQ (LETT |m| (QCDR |mu|))
                                   (EXIT
                                    (COND ((< |m| (+ |p| 1)) (CONS 1 "failed"))
                                          (#4#
                                           (SEQ (LETT |mp| (MIN |mp| |m|))
                                                (LETT |pl1|
                                                      (|CYCLOT2;filter_prods|
                                                       |p| |pl| |ev_odd| |mp|
                                                       %))
                                                (SEQ (LETT #3# |pl1|) G190
                                                     (COND
                                                      ((OR (ATOM #3#)
                                                           (PROGN
                                                            (LETT |p|
                                                                  (CAR #3#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (COND
                                                        ((> |p| 0)
                                                         (SEQ (LETT |i| |p|)
                                                              (LETT #2# |mp|)
                                                              G190
                                                              (COND
                                                               ((> |i| #2#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (QSETAREF1 |pa|
                                                                           |i|
                                                                           (+
                                                                            (QAREF1
                                                                             |pa|
                                                                             |i|)
                                                                            (QAREF1
                                                                             |pa|
                                                                             (-
                                                                              |i|
                                                                              |p|))))))
                                                              (LETT |i|
                                                                    (+ |i| 1))
                                                              (GO G190) G191
                                                              (EXIT NIL)))
                                                        ('T
                                                         (SEQ (LETT |i| |mp|)
                                                              (LETT #1#
                                                                    (- |p|))
                                                              G190
                                                              (COND
                                                               ((< |i| #1#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (QSETAREF1 |pa|
                                                                           |i|
                                                                           (-
                                                                            (QAREF1
                                                                             |pa|
                                                                             |i|)
                                                                            (QAREF1
                                                                             |pa|
                                                                             (+
                                                                              |i|
                                                                              |p|))))))
                                                              (LETT |i|
                                                                    (+ |i| -1))
                                                              (GO G190) G191
                                                              (EXIT NIL))))))
                                                     (LETT #3# (CDR #3#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |pl|
                                                      (SPADCALL |pl1| |pl|
                                                                (QREFELT %
                                                                         15)))
                                                (EXIT
                                                 (COND
                                                  (|ev_odd|
                                                   (|CYCLOT2;recursive_check_even|
                                                    |pa| |mp| |m| |res| |rl|
                                                    |pl| %))
                                                  (#4#
                                                   (|CYCLOT2;recursive_check_odd|
                                                    |pa| |mp| |m| |res| |rl|
                                                    |pl| %)))))))))))))))))) 

(SDEFUN |CYCLOT2;recursive_check_even|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (|res| (|Integer|)) (|rl| (|List| (|Integer|)))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG ((|i| (|PositiveInteger|)))
               (SEQ (LETT |i| 3)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((< |i| |mp|) (EQL (QAREF1 |pa| |i|) 0))
                                  ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |i| |mp|)
                       (SEQ
                        (COND
                         ((EQL (QAREF1 |pa| |i|) 0)
                          (COND
                           ((SPADCALL (+ |m| 1) (QREFELT % 8))
                            (EXIT
                             (CONS 0
                                   (CONS (* |res| (+ |m| 1))
                                         (CONS (+ |m| 1) |rl|))))))))
                        (EXIT (CONS 1 "failed"))))
                      ((NULL (EQL (QAREF1 |pa| |i|) 1)) (CONS 1 "failed"))
                      ('T
                       (|CYCLOT2;recursive_check2| |i| |pa| |mp| |m| |res| |rl|
                        'T |pl| %))))))) 

(SDEFUN |CYCLOT2;recursive_check_odd|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (|res| (|Integer|)) (|rl| (|List| (|Integer|)))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG ((|i| (|PositiveInteger|)))
               (SEQ (LETT |i| 3)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((< |i| |mp|) (EQL (QAREF1 |pa| |i|) 1))
                                  ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |i| |mp|)
                       (SEQ
                        (COND
                         ((EQL (QAREF1 |pa| |i|) 1)
                          (COND
                           ((SPADCALL (+ |m| 1) (QREFELT % 8))
                            (EXIT
                             (CONS 0
                                   (CONS (* |res| (+ |m| 1))
                                         (CONS (+ |m| 1) |rl|))))))))
                        (EXIT (CONS 1 "failed"))))
                      ((NULL (EQL (QAREF1 |pa| |i|) 0)) (CONS 1 "failed"))
                      ('T
                       (|CYCLOT2;recursive_check2| |i| |pa| |mp| |m| |res| |rl|
                        NIL |pl| %))))))) 

(SDEFUN |CYCLOT2;maybe_cyclotomic2?|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((#1=#:G96 NIL) (|i| NIL) (|res| (|PositiveInteger|))
          (|two_fac| (|Boolean|)))
         (SEQ
          (LETT |two_fac|
                (COND
                 ((EQL (QAREF1 |pa| 1) 1)
                  (COND ((EQL (QAREF1 |pa| 2) 0) 'T)
                        ((EQL (QAREF1 |pa| 1) -1) (EQL (QAREF1 |pa| 2) 1))
                        (#2='T NIL)))
                 ((EQL (QAREF1 |pa| 1) -1) (EQL (QAREF1 |pa| 2) 1)) (#2# NIL)))
          (LETT |res| (COND (|two_fac| 2) (#2# 1)))
          (EXIT
           (COND ((EQL |m| 2) (CONS 0 (LIST (* |res| 3) 3)))
                 (#2#
                  (SEQ
                   (COND
                    (|two_fac|
                     (SEQ (LETT |i| 1) (LETT #1# |mp|) G190
                          (COND ((> |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT (QSETAREF1 |pa| |i| (- (QAREF1 |pa| |i|)))))
                          (LETT |i| (+ |i| 2)) (GO G190) G191 (EXIT NIL))))
                   (EXIT
                    (COND
                     ((EQL (QAREF1 |pa| 2) 1)
                      (|CYCLOT2;recursive_check_odd| |pa| |mp| |m| |res| NIL
                       NIL %))
                     ((EQL (QAREF1 |pa| 2) 0)
                      (|CYCLOT2;recursive_check_even| |pa| |mp| |m| |res| NIL
                       NIL %))
                     (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |CYCLOT2;maybe_cyclotomic?|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|))) (|m1| (|Integer|))
         (|m2| (|Integer|)) (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((|m| (|Integer|)) (#1=#:G105 NIL) (#2=#:G106 NIL) (|i| NIL)
          (|pa| (|PrimitiveArray| (|Integer|))) (#3=#:G97 NIL)
          (|mp| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |mp| (MIN (+ (SPADCALL |m2| (QREFELT % 17)) 3) |m2|))
                (LETT |pa|
                      (MAKEARR1
                       (PROG1 (LETT #3# (+ |mp| 1))
                         (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #3#))
                       0))
                (LETT |m| (* |m1| |m2|))
                (SEQ (LETT |i| 0) (LETT #2# |mp|) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((< (SPADCALL |p| (QREFELT % 20)) |m|)
                         (LETT |m| (- |m| |m1|)))
                        ((> (SPADCALL |p| (QREFELT % 20)) |m|)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #4=#:G104)))
                        ('T
                         (SEQ
                          (QSETAREF1 |pa| |i| (SPADCALL |p| (QREFELT % 21)))
                          (LETT |p| (SPADCALL |p| (QREFELT % 22)))
                          (EXIT (LETT |m| (- |m| |m1|))))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (|CYCLOT2;maybe_cyclotomic2?| |pa| |mp| |m2| %))))
          #4# (EXIT #1#)))) 

(SDEFUN |CYCLOT2;cyclotomic?;SupU;7|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
         (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|m| (|Integer|)) (|tcf| (|Integer|)) (#2=#:G144 NIL) (#3=#:G146 NIL)
          (|i| NIL) (#4=#:G145 NIL) (|two_fac| (|Integer|))
          (|pa| (|PrimitiveArray| (|Integer|))) (#5=#:G117 NIL)
          (|mm| #6=(|Integer|)) (#7=#:G108 NIL) (|mm1| (|Integer|))
          (|fl| (|List| (|Integer|))) (|r1| (|Integer|))
          (|rl| (|List| (|Integer|)))
          (|r1u| (|Union| (|List| (|Integer|)) "failed")) (|c0| (|Integer|))
          (|m2| (|Integer|)) (|m2u| (|Union| (|Integer|) "failed")) (|m1| #6#)
          (|p1| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (SPADCALL |p| (QREFELT % 21)) 1)) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |m| (SPADCALL |p| (QREFELT % 20)))
                  (LETT |p1| (SPADCALL |p| (QREFELT % 22)))
                  (EXIT
                   (COND
                    ((EQL |m| 1)
                     (SEQ (LETT |c0| (SPADCALL |p1| (QREFELT % 21)))
                          (EXIT
                           (COND ((EQL |c0| -1) (CONS 0 1))
                                 ((EQL |c0| 1) (CONS 0 2))
                                 (#8='T (CONS 1 "failed"))))))
                    ((ODDP |m|) (CONS 1 "failed"))
                    (#8#
                     (SEQ (LETT |m1| (- |m| (SPADCALL |p1| (QREFELT % 20))))
                          (LETT |m2u| (SPADCALL |m| |m1| (QREFELT % 12)))
                          (EXIT
                           (COND ((QEQCAR |m2u| 1) (CONS 1 "failed"))
                                 (#8#
                                  (SEQ (LETT |m2| (QCDR |m2u|))
                                       (LETT |r1u|
                                             (COND
                                              ((EQL |m2| 1)
                                               (SEQ
                                                (LETT |c0|
                                                      (SPADCALL |p1|
                                                                (QREFELT %
                                                                         21)))
                                                (EXIT
                                                 (COND
                                                  ((EQL |c0| 1)
                                                   (CONS 0 (LIST 2)))
                                                  (#8#
                                                   (PROGN
                                                    (LETT #2#
                                                          (CONS 1 "failed"))
                                                    (GO #9=#:G143)))))))
                                              (#8#
                                               (|CYCLOT2;maybe_cyclotomic?| |p|
                                                |m1| |m2| %))))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |r1u| 1) (CONS 1 "failed"))
                                         (#8#
                                          (SEQ (LETT |rl| (QCDR |r1u|))
                                               (LETT |r1| (|SPADfirst| |rl|))
                                               (LETT |fl| (CDR |rl|))
                                               (LETT |mm| |m1|)
                                               (SEQ G190
                                                    (COND
                                                     ((NULL (> |mm| 1))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |mm1|
                                                           (GCD |r1| |mm|))
                                                     (EXIT
                                                      (COND
                                                       ((EQL |mm1| 1)
                                                        (PROGN
                                                         (LETT #2#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (LETT |mm|
                                                              (PROG2
                                                                  (LETT #7#
                                                                        (SPADCALL
                                                                         |mm|
                                                                         |mm1|
                                                                         (QREFELT
                                                                          %
                                                                          12)))
                                                                  (QCDR #7#)
                                                                (|check_union2|
                                                                 (QEQCAR #7# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #1#)
                                                                 #7#)))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL))
                                               (COND
                                                ((EQL |m2| 1)
                                                 (COND
                                                  ((NULL |fl|)
                                                   (EXIT
                                                    (CONS 0 (* |r1| |m1|)))))))
                                               (LETT |mm| (QUOTIENT2 |m2| 2))
                                               (LETT |pa|
                                                     (MAKEARR1
                                                      (PROG1
                                                          (LETT #5# (+ |mm| 1))
                                                        (|check_subtype2|
                                                         (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                                      0))
                                               (|CYCLOT2;cyclotomic_SPS2| |mm|
                                                (LENGTH |fl|) |pa| |fl| 1 %)
                                               (LETT |two_fac|
                                                     (COND ((ODDP |r1|) 1)
                                                           (#8# -1)))
                                               (LETT |tcf| 1)
                                               (SEQ (LETT |i| 0)
                                                    (LETT #4# |mm|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((<
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            20))
                                                         |m|)
                                                        (COND
                                                         ((NULL
                                                           (EQL
                                                            (QAREF1 |pa| |i|)
                                                            0))
                                                          (PROGN
                                                           (LETT #2#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #9#)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |tcf|
                                                                 (* |two_fac|
                                                                    |tcf|))
                                                           (EXIT
                                                            (LETT |m|
                                                                  (- |m|
                                                                     |m1|)))))))
                                                       ((OR
                                                         (>
                                                          (SPADCALL |p|
                                                                    (QREFELT %
                                                                             20))
                                                          |m|)
                                                         (NULL
                                                          (EQL
                                                           (* |tcf|
                                                              (QAREF1 |pa|
                                                                      |i|))
                                                           (SPADCALL |p|
                                                                     (QREFELT %
                                                                              21)))))
                                                        (PROGN
                                                         (LETT #2#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |tcf|
                                                               (* |two_fac|
                                                                  |tcf|))
                                                         (LETT |p|
                                                               (SPADCALL |p|
                                                                         (QREFELT
                                                                          %
                                                                          22)))
                                                         (EXIT
                                                          (LETT |m|
                                                                (- |m|
                                                                   |m1|))))))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (SEQ (LETT |i| (+ |mm| 1))
                                                    (LETT #3# |m2|) G190
                                                    (COND
                                                     ((> |i| #3#) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((<
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            20))
                                                         |m|)
                                                        (COND
                                                         ((NULL
                                                           (EQL
                                                            (QAREF1 |pa|
                                                                    (- |m2|
                                                                       |i|))
                                                            0))
                                                          (PROGN
                                                           (LETT #2#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #9#)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |tcf|
                                                                 (* |two_fac|
                                                                    |tcf|))
                                                           (EXIT
                                                            (LETT |m|
                                                                  (- |m|
                                                                     |m1|)))))))
                                                       ((OR
                                                         (>
                                                          (SPADCALL |p|
                                                                    (QREFELT %
                                                                             20))
                                                          |m|)
                                                         (NULL
                                                          (EQL
                                                           (* |tcf|
                                                              (QAREF1 |pa|
                                                                      (- |m2|
                                                                         |i|)))
                                                           (SPADCALL |p|
                                                                     (QREFELT %
                                                                              21)))))
                                                        (PROGN
                                                         (LETT #2#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |tcf|
                                                               (* |two_fac|
                                                                  |tcf|))
                                                         (LETT |p|
                                                               (SPADCALL |p|
                                                                         (QREFELT
                                                                          %
                                                                          22)))
                                                         (EXIT
                                                          (LETT |m|
                                                                (- |m|
                                                                   |m1|))))))))
                                                    (LETT |i| (+ |i| 1))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (CONS 0
                                                      (* |r1|
                                                         |m1|)))))))))))))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |CYCLOT2;expand_prods|
        ((|fl| (|List| (|Integer|))) (|k| (|Integer|))
         (% #1=(|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|Integer|))) (#2=#:G152 NIL) (|pr1| NIL) (|plk| #1#)
          (|pk| (|Integer|)))
         (SEQ
          (COND ((EQL |k| 1) (CONS -1 |fl|))
                ('T
                 (SEQ (LETT |pk| (|SPADfirst| |fl|)) (LETT |fl| (CDR |fl|))
                      (LETT |plk| (|CYCLOT2;expand_prods| |fl| (- |k| 1) %))
                      (LETT |res| NIL)
                      (SEQ (LETT |pr1| NIL) (LETT #2# |plk|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |pr1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |res| (CONS (- |pr1|) |res|))
                                (EXIT
                                 (LETT |res| (CONS (* |pk| |pr1|) |res|))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(SDEFUN |CYCLOT2;cyclotomic_SPS2|
        ((|m| (|Integer|)) (|k| (|Integer|))
         (|pa| (|PrimitiveArray| (|Integer|))) (|fl| (|List| (|Integer|)))
         (|do_inv| (|Integer|)) (% (|Void|)))
        (SPROG
         ((#1=#:G175 NIL) (|i| NIL) (#2=#:G174 NIL) (|p| (|Integer|))
          (#3=#:G173 NIL) (|pl| (|List| (|Integer|))) (|mk| (|Integer|))
          (|pk| (|Integer|)) (#4=#:G172 NIL) (#5=#:G171 NIL))
         (SEQ
          (COND
           ((EQL |k| 1)
            (COND
             ((EQL |do_inv| -1)
              (SEQ (QSETAREF1 |pa| 0 1)
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #5# |m|) G190
                         (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pa| |i| 0)))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT NIL)))))
             (#6='T
              (SEQ (LETT |i| 0) (LETT #4# |m|) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ (EXIT (QSETAREF1 |pa| |i| 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
           (#6#
            (SEQ (LETT |pk| (|SPADfirst| |fl|)) (LETT |fl| (CDR |fl|))
                 (LETT |mk| (QUOTIENT2 |m| |pk|))
                 (|CYCLOT2;cyclotomic_SPS2| |mk| (- |k| 1) |pa| |fl| |do_inv|
                  %)
                 (SEQ (LETT |i| |mk|) G190 (COND ((< |i| 1) (GO G191)))
                      (SEQ (QSETAREF1 |pa| (* |pk| |i|) (QAREF1 |pa| |i|))
                           (EXIT (QSETAREF1 |pa| |i| 0)))
                      (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                 (LETT |pl| (|CYCLOT2;expand_prods| |fl| (- |k| 1) %))
                 (EXIT
                  (SEQ (LETT #3# |pl|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |p| (* |do_inv| |p|))
                            (EXIT
                             (COND
                              ((> |p| 0)
                               (SEQ (LETT |i| |p|) (LETT #2# |m|) G190
                                    (COND ((> |i| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF1 |pa| |i|
                                                 (+ (QAREF1 |pa| |i|)
                                                    (QAREF1 |pa|
                                                            (- |i| |p|))))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL)))
                              ('T
                               (SEQ (LETT |i| |m|) (LETT #1# (- |p|)) G190
                                    (COND ((< |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF1 |pa| |i|
                                                 (- (QAREF1 |pa| |i|)
                                                    (QAREF1 |pa|
                                                            (+ |i| |p|))))))
                                    (LETT |i| (+ |i| -1)) (GO G190) G191
                                    (EXIT NIL))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))))))) 

(SDEFUN |CYCLOT2;gen_poly|
        ((|m| (|Integer|)) (|m2| (|Integer|))
         (|pa| (|PrimitiveArray| (|Integer|))) (|two_fac| (|Integer|))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|tcf| (|Integer|))
          (|res| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G180 NIL)
          (#2=#:G186 NIL) (|i| NIL) (#3=#:G185 NIL))
         (SEQ (LETT |tcf| 1) (LETT |res| (|spadConstant| % 25))
              (SEQ (LETT |i| 0) (LETT #3# |m2|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL (* |tcf| (QAREF1 |pa| |i|)) |i|
                                              (QREFELT % 26))
                                    (QREFELT % 27)))
                    (EXIT (LETT |tcf| (* |two_fac| |tcf|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (+ |m2| 1)) (LETT #2# |m|) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL
                                     (* |tcf| (QAREF1 |pa| (- |m| |i|)))
                                     (PROG1 (LETT #1# |i|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT % 26))
                                    (QREFELT % 27)))
                    (EXIT (LETT |tcf| (* |two_fac| |tcf|))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;cyclotomic_SPS1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|))) (|two_fac| (|Integer|))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|pa| (|PrimitiveArray| (|Integer|))) (#1=#:G187 NIL)
          (|m2| (|Integer|)))
         (SEQ (LETT |m2| (QUOTIENT2 |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #1# (+ |m2| 1))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     0))
              (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl|) |pa| |fl| 1 %)
              (EXIT (|CYCLOT2;gen_poly| |m| |m2| |pa| |two_fac| %))))) 

(SDEFUN |CYCLOT2;cyclotomic_array;IPa;12|
        ((|n| (|Integer|)) (% (|PrimitiveArray| (|Integer|))))
        (SPROG
         ((|fl1| (|List| (|Integer|))) (|pa| (|PrimitiveArray| (|Integer|)))
          (#1=#:G195 NIL) (|m2| (|Integer|)) (|m| (|Integer|))
          (|f1| #2=(|Integer|)) (#3=#:G198 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #2#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((< |n| 3) (|error| "cyclotomic_array: n must be >= 3"))
                ('T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 29))
                                  (QREFELT % 33)))
                  (LETT |m| 1) (LETT |fl1| NIL)
                  (SEQ (LETT |fac| NIL) (LETT #3# |fl|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (EXIT
                             (COND
                              ((> (QVELT |fac| 2) 1)
                               (|error|
                                "cyclotomic_array: n must be squarefree"))
                              ((EQL |f1| 2)
                               (|error| "cyclotomic_array: n must be odd"))
                              ('T
                               (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                    (EXIT (LETT |m| (* (- |f1| 1) |m|))))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (LETT |m2| (QUOTIENT2 |m| 2))
                  (LETT |pa|
                        (MAKEARR1
                         (PROG1 (LETT #1# (+ |m2| 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         0))
                  (LETT |fl1| (REVERSE (SPADCALL |fl1| (QREFELT % 34))))
                  (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl1|) |pa| |fl1| 1
                   %)
                  (EXIT |pa|))))))) 

(SDEFUN |CYCLOT2;cyclotomic;ISup;13|
        ((|n| (|Integer|)) (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((#1=#:G209 NIL) (|n2| (|Integer|)) (#2=#:G206 NIL)
          (|r1| (|SparseUnivariatePolynomial| (|Integer|))) (|m1| (|Integer|))
          (|fl1| (|List| (|Integer|))) (|two_fac| (|Integer|))
          (|n1| (|Integer|)) (|f1| #3=(|Integer|)) (#4=#:G212 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((<= |n| 0) (|error| "cyclotomic: n must be positive"))
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 26)) (|spadConstant| % 37)
                           (QREFELT % 38)))
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 26)) (|spadConstant| % 37)
                           (QREFELT % 27)))
                (#5='T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 29))
                                  (QREFELT % 33)))
                  (LETT |n1| 1) (LETT |m1| 1) (LETT |fl1| NIL)
                  (LETT |two_fac| 1)
                  (SEQ (LETT |fac| NIL) (LETT #4# |fl|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |fac| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (LETT |n1| (* |f1| |n1|))
                            (EXIT
                             (COND ((EQL |f1| 2) (LETT |two_fac| -1))
                                   ('T
                                    (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                         (EXIT
                                          (LETT |m1| (* (- |f1| 1) |m1|))))))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (LETT |r1|
                        (COND
                         ((NULL |fl1|)
                          (SPADCALL (SPADCALL 1 1 (QREFELT % 26))
                                    (|spadConstant| % 37) (QREFELT % 27)))
                         (#5#
                          (|CYCLOT2;cyclotomic_SPS1| |m1|
                           (REVERSE (SPADCALL |fl1| (QREFELT % 34))) |two_fac|
                           %))))
                  (LETT |n2|
                        (PROG2 (LETT #2# (SPADCALL |n| |n1| (QREFELT % 12)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                          (|Union| (|Integer|) "failed") #2#)))
                  (EXIT
                   (COND
                    ((> |n2| 1)
                     (SPADCALL |r1|
                               (PROG1 (LETT #1# |n2|)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT % 39)))
                    (#5# |r1|))))))))) 

(SDEFUN |CYCLOT2;inverse_cyclotomic_SPS1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|)))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G217 NIL)
          (#2=#:G222 NIL) (|i| NIL) (#3=#:G221 NIL)
          (|pa| (|PrimitiveArray| (|Integer|))) (#4=#:G213 NIL)
          (|m2| (|Integer|)))
         (SEQ (LETT |m2| (QUOTIENT2 |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #4# (+ |m2| 1))
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     0))
              (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl|) |pa| |fl| -1 %)
              (LETT |res| (|spadConstant| % 25))
              (SEQ (LETT |i| 0) (LETT #3# |m2|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL (- (QAREF1 |pa| |i|)) |i|
                                               (QREFELT % 26))
                                     (QREFELT % 27)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (- |m| |m2|)) (LETT #2# |m|) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL (QAREF1 |pa| (- |m| |i|))
                                               (PROG1 (LETT #1# |i|)
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#))
                                               (QREFELT % 26))
                                     (QREFELT % 27)))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;inverse_cyclotomic;ISup;15|
        ((|n| (|Integer|)) (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((#1=#:G231 NIL) (|n2| (|Integer|)) (#2=#:G228 NIL)
          (|r1| (|SparseUnivariatePolynomial| (|Integer|))) (|m1| (|Integer|))
          (|fl1| (|List| (|Integer|))) (|n1| (|Integer|)) (|f1| #3=(|Integer|))
          (#4=#:G234 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #3#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((<= |n| 0) (|error| "inverse_cyclotomic: n must be positive"))
                ((EQL |n| 1) (|spadConstant| % 37))
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 26)) (|spadConstant| % 37)
                           (QREFELT % 38)))
                (#5='T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 29))
                                  (QREFELT % 33)))
                  (LETT |n1| 1) (LETT |m1| 1) (LETT |fl1| NIL)
                  (SEQ (LETT |fac| NIL) (LETT #4# |fl|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |fac| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (LETT |n1| (* |f1| |n1|))
                            (LETT |fl1| (CONS |f1| |fl1|))
                            (EXIT (LETT |m1| (* (- |f1| 1) |m1|))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (LETT |r1|
                        (|CYCLOT2;inverse_cyclotomic_SPS1| (- |n1| |m1|)
                         (REVERSE (SPADCALL |fl1| (QREFELT % 34))) %))
                  (LETT |n2|
                        (PROG2 (LETT #2# (SPADCALL |n| |n1| (QREFELT % 12)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                          (|Union| (|Integer|) "failed") #2#)))
                  (EXIT
                   (COND
                    ((> |n2| 1)
                     (SPADCALL |r1|
                               (PROG1 (LETT #1# |n2|)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT % 39)))
                    (#5# |r1|))))))))) 

(SDEFUN |CYCLOT2;mult_lst1|
        ((|f1| (|Integer|)) (|e| (|Integer|)) (|res| (|List| (|Integer|)))
         (|nres| (|List| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG
         ((|fp| (|Integer|)) (#1=#:G244 NIL) (|i| NIL) (#2=#:G243 NIL)
          (|m| NIL))
         (SEQ
          (SEQ (LETT |m| NIL) (LETT #2# |res|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |fp| 1)
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #1# |e|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ (LETT |fp| (* |f1| |fp|))
                               (EXIT (LETT |nres| (CONS (* |fp| |m|) |nres|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT |nres|)))) 

(SDEFUN |CYCLOT2;mult_lst|
        ((|fli| (|List| (|Integer|)))
         (|fl|
          (|List|
           (|Record| (|:| |factor| #1=(|Integer|))
                     (|:| |exponent| #2=(|NonNegativeInteger|)))))
         (|co| (|Boolean|)) (|two_fac| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|Integer|))) (#3=#:G255 NIL) (#4=#:G256 NIL)
          (|f1| #1#) (|e| #2#) (#5=#:G257 NIL) (|fac| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (LIST 1))
                (SEQ (LETT |fac| NIL) (LETT #5# |fl|) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |fac| (CAR #5#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |e| (QCDR |fac|)) (LETT |f1| (QCAR |fac|))
                            (COND
                             ((EQL |f1| 2)
                              (COND
                               (|co|
                                (EXIT
                                 (PROGN
                                  (LETT #4#
                                        (|CYCLOT2;mult_lst1| (EXPT 2 |e|) 1
                                         |res| NIL %))
                                  (GO #6=#:G254)))))))
                            (COND
                             ((EQL |f1| 2)
                              (COND
                               ((EQL |two_fac| -1)
                                (COND
                                 ((> |e| 1)
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|CYCLOT2;mult_lst1| 2 (- |e| 1)
                                           |res| |res| %))
                                    (GO #6#)))))))))
                            (EXIT
                             (COND
                              ((OR (NULL |fli|) (< (|SPADfirst| |fli|) |f1|))
                               (PROGN (LETT #3# |$NoValue|) (GO #7=#:G246)))
                              ((< |f1| (|SPADfirst| |fli|))
                               (|error| "wrong order of factors"))
                              ('T
                               (SEQ (LETT |fli| (CDR |fli|))
                                    (EXIT
                                     (COND
                                      ((EQL |e| 1)
                                       (PROGN (LETT #3# |$NoValue|) (GO #7#)))
                                      ('T
                                       (LETT |res|
                                             (|CYCLOT2;mult_lst1| |f1|
                                              (- |e| 1) |res| |res|
                                              %)))))))))))
                      #7# (EXIT #3#))
                     (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #4#)))) 

(SDEFUN |CYCLOT2;gen_lists|
        ((|fl| (|List| (|Integer|))) (% (|List| (|List| (|Integer|)))))
        (SPROG
         ((|res| #1=(|List| (|List| (|Integer|)))) (|nres| #1#) (#2=#:G266 NIL)
          (|l1| NIL) (#3=#:G265 NIL) (|f1| NIL))
         (SEQ (LETT |res| (LIST NIL))
              (SEQ (LETT |f1| NIL) (LETT #3# |fl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |f1| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nres| |res|)
                        (SEQ (LETT |l1| NIL) (LETT #2# |res|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |l1| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |nres| (CONS (CONS |f1| |l1|) |nres|))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| |nres|)))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;add_mults|
        ((|p1| (|SparseUnivariatePolynomial| (|Integer|)))
         (|res| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|co| (|Boolean|)) (|two_fac| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|pi| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G270 NIL)
          (#2=#:G275 NIL) (|mi| NIL) (|ml| (|List| (|Integer|))))
         (SEQ (LETT |ml| (|CYCLOT2;mult_lst| |fl| |fl0| |co| |two_fac| %))
              (SEQ (LETT |mi| NIL) (LETT #2# |ml|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mi| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pi|
                          (SPADCALL |p1|
                                    (PROG1 (LETT #1# |mi|)
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                    (QREFELT % 39)))
                    (EXIT (LETT |res| (CONS |pi| |res|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;add_factors|
        ((|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|two_fac| (|Integer|)) (|co| (|Boolean|))
         (|pa| (|PrimitiveArray| (|Integer|)))
         (|res| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|p1| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G298 NIL)
          (|i| NIL) (|k| (|NonNegativeInteger|)) (|m2| (|Integer|))
          (|m| (|Integer|)) (#2=#:G297 NIL) (|f1| NIL) (#3=#:G296 NIL)
          (|fac|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |m| 1)
              (EXIT
               (COND
                ((NULL |fl|)
                 (COND
                  (|co|
                   (SEQ (LETT |fac| (SPADCALL |fl0| (QREFELT % 44)))
                        (LETT |nn|
                              (COND
                               ((EQL (QCAR |fac|) 2) (EXPT 2 (QCDR |fac|)))
                               (#4='T 1)))
                        (LETT |p1|
                              (SPADCALL (SPADCALL 1 |nn| (QREFELT % 26))
                                        (|spadConstant| % 37) (QREFELT % 27)))
                        (EXIT (CONS |p1| |res|))))
                  (#4#
                   (SEQ
                    (LETT |p1|
                          (SPADCALL (SPADCALL 1 1 (QREFELT % 26))
                                    (SPADCALL |two_fac| (QREFELT % 45))
                                    (QREFELT % 38)))
                    (LETT |res| (CONS |p1| |res|))
                    (EXIT
                     (COND
                      ((EQL |two_fac| -1)
                       (SEQ (LETT |fac| (SPADCALL |fl0| (QREFELT % 44)))
                            (COND
                             ((NULL (EQL (QCAR |fac|) 2))
                              (EXIT (|error| "impossible factor"))))
                            (SEQ (LETT |i| 2) (LETT #3# (QCDR |fac|)) G190
                                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |p1| (SPADCALL |p1| 2 (QREFELT % 39)))
                                  (EXIT (LETT |res| (CONS |p1| |res|))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |p1|
                                  (SPADCALL (SPADCALL 1 1 (QREFELT % 26))
                                            (|spadConstant| % 37)
                                            (QREFELT % 38)))
                            (EXIT (CONS |p1| |res|))))
                      (#4# |res|)))))))
                (#4#
                 (SEQ
                  (SEQ (LETT |f1| NIL) (LETT #2# |fl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT |m| (* (- |f1| 1) |m|))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |m2| (QUOTIENT2 |m| 2)) (LETT |k| (LENGTH |fl|))
                  (SEQ (LETT |i| 0) (LETT #1# |m2|) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (QSETAREF1 |pa| |i| 0)))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (|CYCLOT2;cyclotomic_SPS2| |m2| |k| |pa| |fl| 1 %)
                  (EXIT
                   (COND
                    (|co|
                     (SEQ (LETT |p1| (|CYCLOT2;gen_poly| |m| |m2| |pa| -1 %))
                          (EXIT
                           (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co| -1
                            %))))
                    (#4#
                     (SEQ (LETT |p1| (|CYCLOT2;gen_poly| |m| |m2| |pa| 1 %))
                          (LETT |res|
                                (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co|
                                 1 %))
                          (EXIT
                           (COND
                            ((EQL |two_fac| -1)
                             (SEQ
                              (LETT |p1|
                                    (|CYCLOT2;gen_poly| |m| |m2| |pa| -1 %))
                              (EXIT
                               (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co|
                                -1 %))))
                            (#4# |res|)))))))))))))) 

(SDEFUN |CYCLOT2;cyclo_decomposition1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|two_fac| (|Integer|)) (|co| (|Boolean|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|res| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (#1=#:G305 NIL) (|fl1| NIL) (|ll| (|List| (|List| (|Integer|))))
          (|pa| (|PrimitiveArray| (|Integer|))) (#2=#:G300 NIL)
          (|m2| (|Integer|)))
         (SEQ (LETT |m2| (QUOTIENT2 |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #2# (+ |m2| 1))
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     0))
              (LETT |ll| (|CYCLOT2;gen_lists| (REVERSE |fl|) %))
              (LETT |res| NIL)
              (SEQ (LETT |fl1| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |fl1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|CYCLOT2;add_factors| |fl1| |fl0| |two_fac| |co|
                            |pa| |res| %))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;cyclo_decomposition|
        ((|n| (|Integer|)) (|co| (|Boolean|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|m1| #1=(|Integer|)) (|fl1| (|List| (|Integer|))) (|two_fac| #1#)
          (|f1| #2=(|Integer|)) (#3=#:G314 NIL) (|fac| NIL)
          (|fl|
           (|List|
            (|Record| (|:| |factor| #2#)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |fl| (SPADCALL (SPADCALL |n| (QREFELT % 29)) (QREFELT % 46)))
          (LETT |fl1| NIL) (LETT |m1| 1) (LETT |two_fac| 1)
          (SEQ (LETT |fac| NIL) (LETT #3# |fl|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |f1| (QCAR |fac|))
                    (EXIT
                     (COND ((EQL |f1| 2) (LETT |two_fac| -1))
                           ('T
                            (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                 (EXIT (LETT |m1| (* (- |f1| 1) |m1|))))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|CYCLOT2;cyclo_decomposition1| |m1| |fl1| (REVERSE |fl|) |two_fac|
            |co| %))))) 

(SDEFUN |CYCLOT2;cyclotomic_decomposition;IL;23|
        ((|n| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (COND
         ((<= |n| 0) (|error| "cyclotomic_decomposition: n must be positive"))
         ((EQL |n| 1)
          (LIST
           (SPADCALL (SPADCALL 1 1 (QREFELT % 26)) (|spadConstant| % 37)
                     (QREFELT % 38))))
         ('T (|CYCLOT2;cyclo_decomposition| |n| NIL %)))) 

(SDEFUN |CYCLOT2;cocyclotomic_decomposition;IL;24|
        ((|n| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (COND
         ((<= |n| 0)
          (|error| "cocyclotomic_decomposition: n must be positive"))
         ((EQL |n| 1)
          (LIST
           (SPADCALL (SPADCALL 1 1 (QREFELT % 26)) (|spadConstant| % 37)
                     (QREFELT % 27))))
         ('T (|CYCLOT2;cyclo_decomposition| |n| 'T %)))) 

(DECLAIM (NOTINLINE |CyclotomicUtilities;|)) 

(DEFUN |CyclotomicUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G318)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CyclotomicUtilities|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CyclotomicUtilities|
                             (LIST
                              (CONS NIL (CONS 1 (|CyclotomicUtilities;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CyclotomicUtilities|)))))))))) 

(DEFUN |CyclotomicUtilities;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CyclotomicUtilities|))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CyclotomicUtilities| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|CyclotomicUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Integer|) (0 . |prime?|)
              (|Factored| 7) (5 . |One|) (|Union| % '"failed") (9 . |exquo|)
              (15 . |Zero|) (|List| 7) (19 . |append|) (|IntegerRoots| 7)
              (25 . |approxSqrt|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (30 . |degree|)
              (35 . |leadingCoefficient|) (40 . |reductum|)
              (|Union| 7 '#1="failed") |CYCLOT2;cyclotomic?;SupU;7|
              (45 . |Zero|) (49 . |monomial|) (55 . +)
              (|IntegerFactorizationPackage| 7) (61 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 30) (|:| |factor| 7) (|:| |exponent| 18))
              (|List| 31) (66 . |factorList|) (71 . |sort|)
              (|PrimitiveArray| 7) |CYCLOT2;cyclotomic_array;IPa;12|
              (76 . |One|) (80 . -) (86 . |multiplyExponents|)
              |CYCLOT2;cyclotomic;ISup;13| |CYCLOT2;inverse_cyclotomic;ISup;15|
              (|Record| (|:| |factor| 7) (|:| |exponent| 18)) (|List| 42)
              (92 . |last|) (97 . |coerce|) (102 . |factors|) (|List| 19)
              |CYCLOT2;cyclotomic_decomposition;IL;23|
              |CYCLOT2;cocyclotomic_decomposition;IL;24|)
           '#(|inverse_cyclotomic| 107 |cyclotomic_decomposition| 112
              |cyclotomic_array| 117 |cyclotomic?| 122 |cyclotomic| 127
              |cocyclotomic_decomposition| 132)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|cyclotomic|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|cyclotomic_array|
                                 ((|PrimitiveArray| (|Integer|)) (|Integer|)))
                                T)
                              '((|inverse_cyclotomic|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|cyclotomic?|
                                 ((|Union| (|Integer|) #1#)
                                  (|SparseUnivariatePolynomial| (|Integer|))))
                                T)
                              '((|cyclotomic_decomposition|
                                 ((|List|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cocyclotomic_decomposition|
                                 ((|List|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 49
                                            '(1 7 6 0 8 0 9 0 10 2 7 11 0 0 12
                                              0 9 0 13 2 14 0 0 0 15 1 16 7 7
                                              17 1 19 18 0 20 1 19 7 0 21 1 19
                                              0 0 22 0 19 0 25 2 19 0 7 18 26 2
                                              19 0 0 0 27 1 28 9 7 29 1 9 32 0
                                              33 1 14 0 0 34 0 19 0 37 2 19 0 0
                                              0 38 2 19 0 0 18 39 1 43 42 0 44
                                              1 19 0 7 45 1 9 43 0 46 1 0 19 7
                                              41 1 0 47 7 48 1 0 35 7 36 1 0 23
                                              19 24 1 0 19 7 40 1 0 47 7
                                              49)))))
           '|lookupComplete|)) 
