
(SDEFUN |GENPGCD;gcdPolynomial;3Sup;1|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|v2| #1=(|List| OV)) (|v| #1#) (#2=#:G178 NIL)
          (|g| (|SparseUnivariatePolynomial| P)) (|v1| #1#)
          (|h| #3=(|SparseUnivariatePolynomial| P)) (|pp2| #3#) (|pp1| #3#)
          (|vp2| #4=(|List| OV)) (|vp1| #4#)
          (|#G11| (|SparseUnivariatePolynomial| P))
          (|#G10| (|SparseUnivariatePolynomial| P))
          (|cg| (|SparseUnivariatePolynomial| P)) (#5=#:G146 NIL)
          (|c2| #6=(|SparseUnivariatePolynomial| P)) (|c1| #6#)
          (|#G9| (|SparseUnivariatePolynomial| P))
          (|#G8| (|SparseUnivariatePolynomial| P)))
         (SEQ
          (EXIT
           (COND ((SPADCALL |p1| (QREFELT $ 12)) |p2|)
                 ((SPADCALL |p2| (QREFELT $ 12)) |p1|)
                 ((EQL 0 (SPADCALL |p1| (QREFELT $ 18)))
                  (|GENPGCD;gcdTrivial| |p1| |p2| $))
                 ((EQL 0 (SPADCALL |p2| (QREFELT $ 18)))
                  (|GENPGCD;gcdTrivial| |p2| |p1| $))
                 (#7='T
                  (SEQ
                   (COND
                    ((< (SPADCALL |p1| (QREFELT $ 18))
                        (SPADCALL |p2| (QREFELT $ 18)))
                     (PROGN
                      (LETT |#G8| |p2| . #8=(|GENPGCD;gcdPolynomial;3Sup;1|))
                      (LETT |#G9| |p1| . #8#)
                      (LETT |p1| |#G8| . #8#)
                      (LETT |p2| |#G9| . #8#))))
                   (EXIT
                    (COND
                     ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0)
                      (QVELT (SPADCALL |p2| (QREFELT $ 22)) 1))
                     (#7#
                      (SEQ (LETT |c1| (|GENPGCD;monomContentSup| |p1| $) . #8#)
                           (LETT |c2| (|GENPGCD;monomContentSup| |p2| $) . #8#)
                           (LETT |p1|
                                 (PROG2
                                     (LETT #5#
                                           (SPADCALL |p1| |c1| (QREFELT $ 20))
                                           . #8#)
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    #9="failed")
                                                   #5#))
                                 . #8#)
                           (LETT |p2|
                                 (PROG2
                                     (LETT #5#
                                           (SPADCALL |p2| |c2| (QREFELT $ 20))
                                           . #8#)
                                     (QCDR #5#)
                                   (|check_union2| (QEQCAR #5# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT $ 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 9))
                                                    #9#)
                                                   #5#))
                                 . #8#)
                           (LETT |cg| (|GENPGCD;gcd_monomial| |c1| |c2| $)
                                 . #8#)
                           (COND
                            ((< (SPADCALL |p1| (QREFELT $ 18))
                                (SPADCALL |p2| (QREFELT $ 18)))
                             (PROGN
                              (LETT |#G10| |p2| . #8#)
                              (LETT |#G11| |p1| . #8#)
                              (LETT |p1| |#G10| . #8#)
                              (LETT |p2| |#G11| . #8#))))
                           (EXIT
                            (COND
                             ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0)
                              (SPADCALL
                               (QVELT (SPADCALL |p2| (QREFELT $ 22)) 1) |cg|
                               (QREFELT $ 23)))
                             (#7#
                              (SEQ
                               (LETT |vp1| (|GENPGCD;variables| |p1| $) . #8#)
                               (LETT |vp2| (|GENPGCD;variables| |p2| $) . #8#)
                               (LETT |v1| (SPADCALL |vp1| |vp2| (QREFELT $ 25))
                                     . #8#)
                               (LETT |v2| (SPADCALL |vp2| |vp1| (QREFELT $ 25))
                                     . #8#)
                               (COND
                                ((NULL |v1|)
                                 (COND
                                  ((NULL |v2|)
                                   (EXIT
                                    (SPADCALL
                                     (|GENPGCD;gcdSameVariables| |p1| |p2| 'T
                                      'T |vp1| $)
                                     |cg| (QREFELT $ 23)))))))
                               (LETT |v| (SPADCALL |vp1| |v1| (QREFELT $ 25))
                                     . #8#)
                               (LETT |pp1| (|GENPGCD;flatten| |p1| |v1| $)
                                     . #8#)
                               (LETT |pp2| (|GENPGCD;flatten| |p2| |v2| $)
                                     . #8#)
                               (LETT |g|
                                     (|GENPGCD;gcdSameVariables| |pp1| |pp2|
                                      (NULL |v1|) (NULL |v2|) |v| $)
                                     . #8#)
                               (EXIT
                                (COND
                                 ((SPADCALL |g| (|spadConstant| $ 28)
                                            (QREFELT $ 29))
                                  |cg|)
                                 (#7#
                                  (SEQ
                                   (COND
                                    ((OR (NULL |v1|)
                                         (NULL
                                          (QEQCAR
                                           (SPADCALL |p1| |g| (QREFELT $ 20))
                                           1)))
                                     (COND
                                      ((OR (NULL |v2|)
                                           (NULL
                                            (QEQCAR
                                             (SPADCALL |p2| |g| (QREFELT $ 20))
                                             1)))
                                       (EXIT
                                        (SPADCALL |g| |cg| (QREFELT $ 23)))))))
                                   (LETT |v| (|GENPGCD;variables| |g| $) . #8#)
                                   (LETT |v1|
                                         (SPADCALL |vp1| |v| (QREFELT $ 25))
                                         . #8#)
                                   (LETT |v2|
                                         (SPADCALL |vp2| |v| (QREFELT $ 25))
                                         . #8#)
                                   (LETT |h|
                                         (COND
                                          ((NULL |v1|)
                                           (|GENPGCD;flatten| |p2| |v2| $))
                                          ((NULL |v2|)
                                           (|GENPGCD;flatten| |p1| |v1| $))
                                          (#7#
                                           (SPADCALL
                                            (|GENPGCD;flatten| |p1| |v1| $)
                                            (|GENPGCD;flatten| |p2| |v2| $)
                                            (QREFELT $ 30))))
                                         . #8#)
                                   (LETT |g|
                                         (|GENPGCD;gcdSameVariables| |h| |g|
                                          NIL 'T |v| $)
                                         . #8#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |g| (|spadConstant| $ 28)
                                                (QREFELT $ 29))
                                      |cg|)
                                     (#7#
                                      (SEQ
                                       (COND
                                        ((OR (NULL |v1|)
                                             (NULL
                                              (QEQCAR
                                               (SPADCALL |p1| |g|
                                                         (QREFELT $ 20))
                                               1)))
                                         (COND
                                          ((OR (NULL |v2|)
                                               (NULL
                                                (QEQCAR
                                                 (SPADCALL |p2| |g|
                                                           (QREFELT $ 20))
                                                 1)))
                                           (EXIT
                                            (SPADCALL |g| |cg|
                                                      (QREFELT $ 23)))))))
                                       (LETT |v| (|GENPGCD;variables| |g| $)
                                             . #8#)
                                       (LETT |v1|
                                             (SPADCALL |vp1| |v|
                                                       (QREFELT $ 25))
                                             . #8#)
                                       (COND
                                        ((NULL |v1|)
                                         (SEQ
                                          (LETT |g|
                                                (|GENPGCD;recursivelyGCDCoefficients|
                                                 |g| |v| |p1| |v1| $)
                                                . #8#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |g|
                                                       (|spadConstant| $ 28)
                                                       (QREFELT $ 29))
                                             (PROGN
                                              (LETT #2# |cg| . #8#)
                                              (GO #10=#:G177)))
                                            (#7#
                                             (LETT |v|
                                                   (|GENPGCD;variables| |g| $)
                                                   . #8#)))))))
                                       (LETT |v2|
                                             (SPADCALL |vp2| |v|
                                                       (QREFELT $ 25))
                                             . #8#)
                                       (EXIT
                                        (SPADCALL
                                         (|GENPGCD;recursivelyGCDCoefficients|
                                          |g| |v| |p2| |v2| $)
                                         |cg|
                                         (QREFELT $ 23)))))))))))))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |GENPGCD;randomR;R;2| (($ R))
        (SPROG ((|v| (|Union| R "failed")))
               (SEQ
                (LETT |v| (SPADCALL (QREFELT $ 33) (QREFELT $ 34))
                      |GENPGCD;randomR;R;2|)
                (EXIT
                 (COND
                  ((QEQCAR |v| 0)
                   (SEQ (SETELT $ 33 (QCDR |v|)) (EXIT (QCDR |v|))))
                  ('T
                   (SEQ
                    (SAY
                     "Taking next stepthrough range in GeneralPolynomialGcdPackage")
                    (SETELT $ 33 (|spadConstant| $ 32))
                    (EXIT (QREFELT $ 33))))))))) 

(SDEFUN |GENPGCD;randomR;R;3| (($ R)) (SPADCALL (RANDOM 100) (QREFELT $ 37))) 

(SDEFUN |GENPGCD;gcdSameVariables|
        ((|p1| . #1=(|SparseUnivariatePolynomial| P))
         (|p2| . #2=(|SparseUnivariatePolynomial| P))
         (|prim1| . #3=(|Boolean|)) (|prim2| . #4=(|Boolean|)) (|lv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#5=#:G227 NIL) (#6=#:G228 NIL)
          (|ans| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|uu| (|SparseUnivariatePolynomial| R)) (|r| (R))
          (|count| #7=(|NonNegativeInteger|))
          (|up2| #8=(|SparseUnivariatePolynomial| R)) (#9=#:G209 NIL)
          (|up1| #8#) (#10=#:G194 NIL) (|dv| #11=(|NonNegativeInteger|))
          (|v| #12=(|SparseUnivariatePolynomial| R)) (|good_cnt| #7#)
          (|du| #11#) (|u| #12#) (|lr| (|List| R)) (#13=#:G232 NIL) (|vv| NIL)
          (#14=#:G231 NIL) (#15=#:G230 NIL) (#16=#:G229 NIL) (|gcdLC| (P))
          (|#G21| #3#) (|#G20| #4#) (|#G19| #1#) (|#G18| #2#))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |lv|) 0)
             (SPADCALL (ELT $ 38)
                       (SPADCALL (SPADCALL (ELT $ 39) |p1| (QREFELT $ 43))
                                 (SPADCALL (ELT $ 39) |p2| (QREFELT $ 43))
                                 (QREFELT $ 45))
                       (QREFELT $ 48)))
            (#17='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |p1| (QREFELT $ 18))
                          (SPADCALL |p2| (QREFELT $ 18)) (QREFELT $ 49))
                (SEQ
                 (PROGN
                  (LETT |#G18| |p2| . #18=(|GENPGCD;gcdSameVariables|))
                  (LETT |#G19| |p1| . #18#)
                  (LETT |p1| |#G18| . #18#)
                  (LETT |p2| |#G19| . #18#))
                 (EXIT
                  (PROGN
                   (LETT |#G20| |prim2| . #18#)
                   (LETT |#G21| |prim1| . #18#)
                   (LETT |prim1| |#G20| . #18#)
                   (LETT |prim2| |#G21| . #18#))))))
              (EXIT
               (COND
                ((EQL (SPADCALL |p1| (QREFELT $ 18)) 1)
                 (SEQ
                  (COND
                   ((NULL |prim1|)
                    (LETT |p1|
                          (PROG2
                              (LETT #10#
                                    (SPADCALL |p1|
                                              (SPADCALL |p1| (QREFELT $ 50))
                                              (QREFELT $ 51))
                                    . #18#)
                              (QCDR #10#)
                            (|check_union2| (QEQCAR #10# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 9))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT $ 9))
                                             #19="failed")
                                            #10#))
                          . #18#)))
                  (EXIT
                   (COND ((QEQCAR (SPADCALL |p2| |p1| (QREFELT $ 20)) 0) |p1|)
                         (#17# (|spadConstant| $ 28))))))
                (#17#
                 (SEQ
                  (LETT |gcdLC|
                        (SPADCALL (SPADCALL |p1| (QREFELT $ 52))
                                  (SPADCALL |p2| (QREFELT $ 52))
                                  (QREFELT $ 53))
                        . #18#)
                  (LETT |lr|
                        (PROGN
                         (LETT #16# NIL . #18#)
                         (SEQ (LETT |vv| NIL . #18#) (LETT #15# |lv| . #18#)
                              G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |vv| (CAR #15#) . #18#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16#
                                      (CONS (SPADCALL (QREFELT $ 35)) #16#)
                                      . #18#)))
                              (LETT #15# (CDR #15#) . #18#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #18#)
                  (LETT |count| 0 . #18#) (LETT |good_cnt| 0 . #18#)
                  (SEQ G190 (COND ((NULL (< |count| 10)) (GO G191)))
                       (SEQ
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |gcdLC| |lv| |lr| (QREFELT $ 55))
                                   (QREFELT $ 56))
                                  (< |count| 10))
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ
                              (LETT |lr|
                                    (PROGN
                                     (LETT #14# NIL . #18#)
                                     (SEQ (LETT |vv| NIL . #18#)
                                          (LETT #13# |lv| . #18#) G190
                                          (COND
                                           ((OR (ATOM #13#)
                                                (PROGN
                                                 (LETT |vv| (CAR #13#) . #18#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #14#
                                                  (CONS
                                                   (SPADCALL (QREFELT $ 35))
                                                   #14#)
                                                  . #18#)))
                                          (LETT #13# (CDR #13#) . #18#)
                                          (GO G190) G191
                                          (EXIT (NREVERSE #14#))))
                                    . #18#)
                              (EXIT (LETT |count| (+ |count| 1) . #18#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((EQL |count| 10)
                           (|error| "too many evaluations in GCD code"))
                          ('T
                           (SEQ
                            (LETT |up1|
                                  (SPADCALL
                                   (CONS #'|GENPGCD;gcdSameVariables!0|
                                         (VECTOR $ |lr| |lv|))
                                   |p1| (QREFELT $ 43))
                                  . #18#)
                            (LETT |up2|
                                  (SPADCALL
                                   (CONS #'|GENPGCD;gcdSameVariables!1|
                                         (VECTOR $ |lr| |lv|))
                                   |p2| (QREFELT $ 43))
                                  . #18#)
                            (LETT |u| (SPADCALL |up1| |up2| (QREFELT $ 45))
                                  . #18#)
                            (LETT |du| (SPADCALL |u| (QREFELT $ 57)) . #18#)
                            (EXIT
                             (COND
                              ((EQL |du| 0)
                               (PROGN
                                (LETT #6# (|spadConstant| $ 28) . #18#)
                                (GO #20=#:G226)))
                              ((EQL |good_cnt| 0)
                               (SEQ (LETT |good_cnt| 1 . #18#)
                                    (LETT |v| |u| . #18#)
                                    (EXIT (LETT |dv| |du| . #18#))))
                              ((< |dv| |du|) "iterate")
                              ((< |du| |dv|)
                               (SEQ (LETT |good_cnt| 1 . #18#)
                                    (LETT |v| |u| . #18#)
                                    (EXIT (LETT |dv| |du| . #18#))))
                              ('T
                               (COND
                                ((EQL |du| (SPADCALL |p1| (QREFELT $ 18)))
                                 (SEQ
                                  (COND
                                   ((NULL |prim1|)
                                    (SEQ
                                     (LETT |p1|
                                           (PROG2
                                               (LETT #10#
                                                     (SPADCALL |p1|
                                                               (SPADCALL |p1|
                                                                         (QREFELT
                                                                          $
                                                                          50))
                                                               (QREFELT $ 51))
                                                     . #18#)
                                               (QCDR #10#)
                                             (|check_union2| (QEQCAR #10# 0)
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 9))
                                                             (|Union|
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 9))
                                                              #19#)
                                                             #10#))
                                           . #18#)
                                     (EXIT (LETT |prim1| 'T . #18#)))))
                                  (EXIT
                                   (COND
                                    ((QEQCAR
                                      (SPADCALL |p2| |p1| (QREFELT $ 20)) 0)
                                     (PROGN (LETT #6# |p2| . #18#) (GO #20#)))
                                    ('T "next")))))
                                ('T
                                 (SEQ
                                  (LETT |up1|
                                        (PROG2
                                            (LETT #9#
                                                  (SPADCALL |up1| |u|
                                                            (QREFELT $ 58))
                                                  . #18#)
                                            (QCDR #9#)
                                          (|check_union2| (QEQCAR #9# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 8))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #21="failed")
                                                          #9#))
                                        . #18#)
                                  (EXIT
                                   (COND
                                    ((EQL
                                      (SPADCALL
                                       (SPADCALL |u| |up1| (QREFELT $ 59))
                                       (QREFELT $ 57))
                                      0)
                                     (SEQ
                                      (LETT |ans|
                                            (|GENPGCD;lift| |u| |p1| |up1|
                                             |gcdLC| |lv| |lr| $)
                                            . #18#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |ans| 0)
                                         (PROGN
                                          (LETT #6# (QCDR |ans|) . #18#)
                                          (GO #20#)))
                                        ('T "next")))))
                                    ('T
                                     (SEQ
                                      (LETT |up2|
                                            (PROG2
                                                (LETT #9#
                                                      (SPADCALL |up2| |u|
                                                                (QREFELT $ 58))
                                                      . #18#)
                                                (QCDR #9#)
                                              (|check_union2| (QEQCAR #9# 0)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 8))
                                                              (|Union|
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 8))
                                                               #21#)
                                                              #9#))
                                            . #18#)
                                      (EXIT
                                       (COND
                                        ((EQL
                                          (SPADCALL
                                           (SPADCALL |u| |up2| (QREFELT $ 59))
                                           (QREFELT $ 57))
                                          0)
                                         (SEQ
                                          (LETT |ans|
                                                (|GENPGCD;lift| |u| |p2| |up2|
                                                 |gcdLC| |lv| |lr| $)
                                                . #18#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |ans| 0)
                                             (PROGN
                                              (LETT #6# (QCDR |ans|) . #18#)
                                              (GO #20#)))
                                            ('T "next")))))
                                        ('T
                                         (SEQ (LETT |count| 0 . #18#)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL (< |count| 10))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ
                                                      (LETT |r|
                                                            (SPADCALL
                                                             (QREFELT $ 35))
                                                            . #18#)
                                                      (LETT |uu|
                                                            (SPADCALL |up1|
                                                                      (SPADCALL
                                                                       |r|
                                                                       |up2|
                                                                       (QREFELT
                                                                        $ 60))
                                                                      (QREFELT
                                                                       $ 61))
                                                            . #18#)
                                                      (EXIT
                                                       (COND
                                                        ((EQL
                                                          (SPADCALL
                                                           (SPADCALL |u| |uu|
                                                                     (QREFELT $
                                                                              59))
                                                           (QREFELT $ 57))
                                                          0)
                                                         (PROGN
                                                          (LETT #5#
                                                                (SEQ
                                                                 (LETT |ans|
                                                                       (|GENPGCD;lift|
                                                                        |u|
                                                                        (SPADCALL
                                                                         |p1|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            38))
                                                                          |p2|
                                                                          (QREFELT
                                                                           $
                                                                           62))
                                                                         (QREFELT
                                                                          $
                                                                          63))
                                                                        |uu|
                                                                        |gcdLC|
                                                                        |lv|
                                                                        |lr| $)
                                                                       . #18#)
                                                                 (EXIT
                                                                  (COND
                                                                   ((QEQCAR
                                                                     |ans| 0)
                                                                    (PROGN
                                                                     (LETT #6#
                                                                           (QCDR
                                                                            |ans|)
                                                                           . #18#)
                                                                     (GO
                                                                      #20#)))
                                                                   ('T
                                                                    "next"))))
                                                                . #18#)
                                                          (GO #22=#:G214)))))))
                                                    #22# (EXIT #5#))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))
                                              (EXIT
                                               (|error|
                                                "too many evaluations in GCD code")))))))))))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((>= |count| 10)
                     (|error| "too many evaluations in GCD code"))))))))))))
          #20# (EXIT #6#)))) 

(SDEFUN |GENPGCD;gcdSameVariables!1| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 55))
                      (QREFELT $ 39)))))) 

(SDEFUN |GENPGCD;gcdSameVariables!0| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 55))
                      (QREFELT $ 39)))))) 

(SDEFUN |GENPGCD;fix_lc|
        ((|u| |SparseUnivariatePolynomial| R) (|lc| P) (|elc| R)
         ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((|u2| (|SparseUnivariatePolynomial| R))
          (|u1u| (|Union| (|SparseUnivariatePolynomial| R) "failed"))
          (|u1| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (LETT |u1| (SPADCALL |elc| |u| (QREFELT $ 60))
                . #1=(|GENPGCD;fix_lc|))
          (LETT |u1u|
                (SPADCALL |u1| (SPADCALL |u| (QREFELT $ 64)) (QREFELT $ 65))
                . #1#)
          (EXIT
           (COND ((QEQCAR |u1u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |u2| (SPADCALL (QCDR |u1u|) (QREFELT $ 66)) . #1#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (SPADCALL |lc| (SPADCALL |u| (QREFELT $ 57))
                                         (QREFELT $ 67))
                               (SPADCALL (ELT $ 38) |u2| (QREFELT $ 48))
                               (QREFELT $ 63))))))))))) 

(SDEFUN |GENPGCD;lift|
        ((|gR| |SparseUnivariatePolynomial| R)
         (|p| |SparseUnivariatePolynomial| P)
         (|cfR| |SparseUnivariatePolynomial| R) (|gcdLC| P) (|lv| |List| OV)
         (|lr| |List| R) ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((#1=#:G262 NIL) (#2=#:G263 NIL) (|pn| (P))
          (|cf| #3=(|SparseUnivariatePolynomial| P))
          (|g| (|SparseUnivariatePolynomial| P))
          (|step| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#4=#:G261 NIL)
          (|Ecart| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#5=#:G265 NIL) (|n| NIL) (|origFactors| (|List| #3#)) (|prime| (P))
          (|d| #6=(|NonNegativeInteger|)) (#7=#:G244 NIL) (#8=#:G243 #6#)
          (#9=#:G245 #6#) (#10=#:G264 NIL) (|c| NIL)
          (|thisp| (|SparseUnivariatePolynomial| P)) (|r| (R)) (|v| (OV))
          (|cfu| #11=(|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|elcp| (R)) (|lcp| (P)) (|gu| #11#) (|egcdLC| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |egcdLC|
                  (SPADCALL (SPADCALL |gcdLC| |lv| |lr| (QREFELT $ 55))
                            (QREFELT $ 39))
                  . #12=(|GENPGCD;lift|))
            (LETT |gu| (|GENPGCD;fix_lc| |gR| |gcdLC| |egcdLC| $) . #12#)
            (EXIT
             (COND ((QEQCAR |gu| 1) (CONS 1 "failed"))
                   (#13='T
                    (SEQ (LETT |g| (QCDR |gu|) . #12#)
                         (LETT |lcp| (SPADCALL |p| (QREFELT $ 52)) . #12#)
                         (LETT |elcp|
                               (SPADCALL
                                (SPADCALL |lcp| |lv| |lr| (QREFELT $ 55))
                                (QREFELT $ 39))
                               . #12#)
                         (LETT |cfu| (|GENPGCD;fix_lc| |cfR| |lcp| |elcp| $)
                               . #12#)
                         (EXIT
                          (COND ((QEQCAR |cfu| 1) (CONS 1 "failed"))
                                (#13#
                                 (SEQ (LETT |cf| (QCDR |cfu|) . #12#)
                                      (LETT |p|
                                            (SPADCALL |gcdLC| |p|
                                                      (QREFELT $ 62))
                                            . #12#)
                                      (SEQ G190
                                           (COND
                                            ((NULL
                                              (SPADCALL |lv| NIL
                                                        (QREFELT $ 68)))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ
                                              (LETT |v| (|SPADfirst| |lv|)
                                                    . #12#)
                                              (LETT |r| (|SPADfirst| |lr|)
                                                    . #12#)
                                              (LETT |lv| (CDR |lv|) . #12#)
                                              (LETT |lr| (CDR |lr|) . #12#)
                                              (LETT |thisp|
                                                    (SPADCALL
                                                     (CONS #'|GENPGCD;lift!0|
                                                           (VECTOR $ |lr|
                                                                   |lv|))
                                                     |p| (QREFELT $ 70))
                                                    . #12#)
                                              (LETT |d|
                                                    (PROGN
                                                     (LETT #7# NIL . #12#)
                                                     (SEQ (LETT |c| NIL . #12#)
                                                          (LETT #10#
                                                                (SPADCALL |p|
                                                                          (QREFELT
                                                                           $
                                                                           72))
                                                                . #12#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #10#)
                                                                (PROGN
                                                                 (LETT |c|
                                                                       (CAR
                                                                        #10#)
                                                                       . #12#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #9#
                                                                   (SPADCALL
                                                                    |c| |v|
                                                                    (QREFELT $
                                                                             73))
                                                                   . #12#)
                                                             (COND
                                                              (#7#
                                                               (LETT #8#
                                                                     (MAX #8#
                                                                          #9#)
                                                                     . #12#))
                                                              ('T
                                                               (PROGN
                                                                (LETT #8# #9#
                                                                      . #12#)
                                                                (LETT #7# 'T
                                                                      . #12#)))))))
                                                          (LETT #10# (CDR #10#)
                                                                . #12#)
                                                          (GO G190) G191
                                                          (EXIT NIL))
                                                     (COND (#7# #8#)
                                                           ('T
                                                            (|IdentityError|
                                                             '|max|))))
                                                    . #12#)
                                              (LETT |prime|
                                                    (SPADCALL
                                                     (SPADCALL |v|
                                                               (QREFELT $ 74))
                                                     (SPADCALL |r|
                                                               (QREFELT $ 38))
                                                     (QREFELT $ 75))
                                                    . #12#)
                                              (LETT |pn| |prime| . #12#)
                                              (LETT |origFactors|
                                                    (LIST |g| |cf|) . #12#)
                                              (SEQ
                                               (EXIT
                                                (SEQ (LETT |n| 1 . #12#)
                                                     (LETT #5# |d| . #12#) G190
                                                     (COND
                                                      ((|greater_SI| |n| #5#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |Ecart|
                                                            (SPADCALL
                                                             (SPADCALL |thisp|
                                                                       (SPADCALL
                                                                        |g|
                                                                        |cf|
                                                                        (QREFELT
                                                                         $ 23))
                                                                       (QREFELT
                                                                        $ 30))
                                                             |pn|
                                                             (QREFELT $ 51))
                                                            . #12#)
                                                      (EXIT
                                                       (COND
                                                        ((QEQCAR |Ecart| 1)
                                                         (|error|
                                                          "failed lifting in hensel in Complex Polynomial GCD"))
                                                        ((SPADCALL
                                                          (QCDR |Ecart|)
                                                          (QREFELT $ 12))
                                                         (PROGN
                                                          (LETT #4# |$NoValue|
                                                                . #12#)
                                                          (GO #14=#:G254)))
                                                        ('T
                                                         (SEQ
                                                          (LETT |step|
                                                                (SPADCALL
                                                                 |origFactors|
                                                                 (SPADCALL
                                                                  (CONS
                                                                   #'|GENPGCD;lift!1|
                                                                   (VECTOR $
                                                                           |r|
                                                                           |v|))
                                                                  (QCDR
                                                                   |Ecart|)
                                                                  (QREFELT $
                                                                           70))
                                                                 (QREFELT $
                                                                          79))
                                                                . #12#)
                                                          (EXIT
                                                           (COND
                                                            ((QEQCAR |step| 1)
                                                             (PROGN
                                                              (LETT #2#
                                                                    (CONS 1
                                                                          "failed")
                                                                    . #12#)
                                                              (GO #15=#:G260)))
                                                            ('T
                                                             (SEQ
                                                              (LETT |g|
                                                                    (SPADCALL
                                                                     |g|
                                                                     (SPADCALL
                                                                      |pn|
                                                                      (|SPADfirst|
                                                                       (QCDR
                                                                        |step|))
                                                                      (QREFELT
                                                                       $ 62))
                                                                     (QREFELT $
                                                                              63))
                                                                    . #12#)
                                                              (LETT |cf|
                                                                    (SPADCALL
                                                                     |cf|
                                                                     (SPADCALL
                                                                      |pn|
                                                                      (SPADCALL
                                                                       (QCDR
                                                                        |step|)
                                                                       (QREFELT
                                                                        $ 81))
                                                                      (QREFELT
                                                                       $ 62))
                                                                     (QREFELT $
                                                                              63))
                                                                    . #12#)
                                                              (EXIT
                                                               (LETT |pn|
                                                                     (SPADCALL
                                                                      |pn|
                                                                      |prime|
                                                                      (QREFELT
                                                                       $ 82))
                                                                     . #12#)))))))))))
                                                     (LETT |n| (|inc_SI| |n|)
                                                           . #12#)
                                                     (GO G190) G191
                                                     (EXIT NIL)))
                                               #14# (EXIT #4#))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |thisp|
                                                           (SPADCALL |g| |cf|
                                                                     (QREFELT $
                                                                              23))
                                                           (QREFELT $ 83))
                                                 (PROGN
                                                  (LETT #1#
                                                        (PROGN
                                                         (LETT #2#
                                                               (CONS 1
                                                                     "failed")
                                                               . #12#)
                                                         (GO #15#))
                                                        . #12#)
                                                  (GO #16=#:G255)))))))
                                            #16# (EXIT #1#))
                                           NIL (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |gcdLC|
                                                   (|spadConstant| $ 27)
                                                   (QREFELT $ 84))
                                         (CONS 0 |g|))
                                        (#13#
                                         (SPADCALL |g|
                                                   (SPADCALL |g|
                                                             (QREFELT $ 50))
                                                   (QREFELT $ 51)))))))))))))))
          #15# (EXIT #2#)))) 

(SDEFUN |GENPGCD;lift!1| ((|x| NIL) ($$ NIL))
        (PROG (|v| |r| $)
          (LETT |v| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
          (LETT |r| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |v| |r| (QREFELT $ 76)))))) 

(SDEFUN |GENPGCD;lift!0| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 55)))))) 

(SDEFUN |GENPGCD;recursivelyGCDCoefficients|
        ((|g| . #1=(|SparseUnivariatePolynomial| P)) (|v| . #2=(|List| OV))
         (|p| |SparseUnivariatePolynomial| P) (|pv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#3=#:G276 NIL) (|oldv| #2#) (#4=#:G277 NIL) (|oldg| #1#)
          (|p1| (|SparseUnivariatePolynomial| P)) (#5=#:G279 NIL) (|i| NIL)
          (|d| #6=(|NonNegativeInteger|)) (#7=#:G267 NIL) (#8=#:G266 #6#)
          (#9=#:G268 #6#) (#10=#:G278 NIL) (|u| NIL) (|mv| (OV)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mv| (|SPADfirst| |pv|)
                  . #11=(|GENPGCD;recursivelyGCDCoefficients|))
            (LETT |pv| (CDR |pv|) . #11#)
            (LETT |d|
                  (PROGN
                   (LETT #7# NIL . #11#)
                   (SEQ (LETT |u| NIL . #11#)
                        (LETT #10# (SPADCALL |p| (QREFELT $ 72)) . #11#) G190
                        (COND
                         ((OR (ATOM #10#)
                              (PROGN (LETT |u| (CAR #10#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #9# (SPADCALL |u| |mv| (QREFELT $ 73)) . #11#)
                           (COND (#7# (LETT #8# (MAX #8# #9#) . #11#))
                                 ('T
                                  (PROGN
                                   (LETT #8# #9# . #11#)
                                   (LETT #7# 'T . #11#)))))))
                        (LETT #10# (CDR #10#) . #11#) (GO G190) G191
                        (EXIT NIL))
                   (COND (#7# #8#) ('T (|IdentityError| '|max|))))
                  . #11#)
            (SEQ (LETT |i| 0 . #11#) (LETT #5# |d| . #11#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (LETT |p1|
                        (SPADCALL
                         (CONS #'|GENPGCD;recursivelyGCDCoefficients!0|
                               (VECTOR $ |i| |mv|))
                         |p| (QREFELT $ 70))
                        . #11#)
                  (LETT |oldg| |g| . #11#)
                  (COND
                   ((SPADCALL |pv| NIL (QREFELT $ 86))
                    (LETT |g|
                          (|GENPGCD;gcdSameVariables| |g| |p1| 'T NIL |v| $)
                          . #11#))
                   ('T
                    (LETT |g|
                          (|GENPGCD;recursivelyGCDCoefficients| |g| |v| |p1|
                           |pv| $)
                          . #11#)))
                  (EXIT
                   (COND
                    ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 29))
                     (PROGN
                      (LETT #4# (|spadConstant| $ 28) . #11#)
                      (GO #12=#:G275)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |g| |oldg| (QREFELT $ 83))
                         (PROGN
                          (LETT #3#
                                (SEQ (LETT |oldv| |v| . #11#)
                                     (LETT |v| (|GENPGCD;variables| |g| $)
                                           . #11#)
                                     (EXIT
                                      (LETT |pv|
                                            (SPADCALL |pv|
                                                      (SPADCALL |v| |oldv|
                                                                (QREFELT $ 25))
                                                      (QREFELT $ 87))
                                            . #11#)))
                                . #11#)
                          (GO #13=#:G271)))))
                      #13# (EXIT #3#))))))
                 (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
            (EXIT |g|)))
          #12# (EXIT #4#)))) 

(SDEFUN |GENPGCD;recursivelyGCDCoefficients!0| ((|x| NIL) ($$ NIL))
        (PROG (|mv| |i| $)
          (LETT |mv| (QREFELT $$ 2)
                . #1=(|GENPGCD;recursivelyGCDCoefficients|))
          (LETT |i| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |mv| |i| (QREFELT $ 85)))))) 

(SDEFUN |GENPGCD;flatten|
        ((|p1| |SparseUnivariatePolynomial| P) (|lv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|lr| (|List| R)) (#1=#:G290 NIL) (|vv| NIL) (#2=#:G289 NIL)
          (|ans| (|SparseUnivariatePolynomial| P))
          (|dg| (|NonNegativeInteger|)) (#3=#:G288 NIL) (#4=#:G287 NIL))
         (SEQ
          (COND ((EQL (LENGTH |lv|) 0) |p1|)
                ('T
                 (SEQ
                  (LETT |lr|
                        (PROGN
                         (LETT #4# NIL . #5=(|GENPGCD;flatten|))
                         (SEQ (LETT |vv| NIL . #5#) (LETT #3# |lv| . #5#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |vv| (CAR #3#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4# (CONS (SPADCALL (QREFELT $ 35)) #4#)
                                      . #5#)))
                              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                              (EXIT (NREVERSE #4#))))
                        . #5#)
                  (LETT |dg| (SPADCALL |p1| (QREFELT $ 18)) . #5#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |dg|
                                    (SPADCALL
                                     (LETT |ans|
                                           (SPADCALL
                                            (CONS #'|GENPGCD;flatten!0|
                                                  (VECTOR $ |lr| |lv|))
                                            |p1| (QREFELT $ 70))
                                           . #5#)
                                     (QREFELT $ 18))
                                    (QREFELT $ 88)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |lr|
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |vv| NIL . #5#)
                                     (LETT #1# |lv| . #5#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |vv| (CAR #1#) . #5#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS (SPADCALL (QREFELT $ 35))
                                                   #2#)
                                             . #5#)))
                                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               . #5#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |GENPGCD;flatten!0| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;flatten|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 55)))))) 

(SDEFUN |GENPGCD;variables|
        ((|p1| |SparseUnivariatePolynomial| P) ($ |List| OV))
        (SPROG
         ((#1=#:G292 NIL) (#2=#:G291 #3=(|List| OV)) (#4=#:G293 #3#)
          (#5=#:G295 NIL) (|u| NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL . #6=(|GENPGCD;variables|))
            (SEQ (LETT |u| NIL . #6#)
                 (LETT #5# (SPADCALL |p1| (QREFELT $ 72)) . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4# (SPADCALL |u| (QREFELT $ 89)) . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 90)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|IdentityError| '|concat|))))
           (QREFELT $ 91))))) 

(SDEFUN |GENPGCD;gcdTrivial|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|un?| (|Boolean|)) (|cp1| (P)))
               (SEQ
                (LETT |cp1| (SPADCALL |p1| (QREFELT $ 52))
                      . #1=(|GENPGCD;gcdTrivial|))
                (EXIT
                 (COND
                  ((SPADCALL |cp1| (|spadConstant| $ 27) (QREFELT $ 84))
                   (|spadConstant| $ 28))
                  ((EQL (SPADCALL |p2| (QREFELT $ 18)) 0)
                   (SPADCALL
                    (SPADCALL |cp1| (SPADCALL |p2| (QREFELT $ 52))
                              (QREFELT $ 53))
                    (QREFELT $ 92)))
                  (#2='T
                   (SEQ (LETT |un?| (SPADCALL |cp1| (QREFELT $ 93)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (NULL
                                 (OR (SPADCALL |p2| (QREFELT $ 12)) |un?|)))
                               (GO G191)))
                             (SEQ
                              (LETT |cp1|
                                    (SPADCALL (SPADCALL |p2| (QREFELT $ 52))
                                              |cp1| (QREFELT $ 53))
                                    . #1#)
                              (LETT |un?| (SPADCALL |cp1| (QREFELT $ 93))
                                    . #1#)
                              (EXIT
                               (LETT |p2| (SPADCALL |p2| (QREFELT $ 94))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND (|un?| (|spadConstant| $ 28))
                               (#2# (SPADCALL |cp1| (QREFELT $ 92)))))))))))) 

(SDEFUN |GENPGCD;gcd_monomial|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL (SPADCALL |p1| (QREFELT $ 52))
                   (SPADCALL |p2| (QREFELT $ 52)) (QREFELT $ 53))
         (MIN (SPADCALL |p1| (QREFELT $ 18)) (SPADCALL |p2| (QREFELT $ 18)))
         (QREFELT $ 67))) 

(SDEFUN |GENPGCD;monomContentSup|
        ((|u| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |u| (QREFELT $ 18)) 0) (|spadConstant| $ 28))
                 ('T
                  (SEQ
                   (LETT |md| (SPADCALL |u| (QREFELT $ 95))
                         |GENPGCD;monomContentSup|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (CONS (|function| |GENPGCD;better|) $)
                                (SPADCALL |u| (QREFELT $ 72)) (QREFELT $ 97))
                      (QREFELT $ 99))
                     (SPADCALL (|spadConstant| $ 27) |md| (QREFELT $ 67))
                     (QREFELT $ 62))))))))) 

(SDEFUN |GENPGCD;better| ((|p1| P) (|p2| P) ($ |Boolean|))
        (SPROG ((#1=#:G342 NIL))
               (COND ((SPADCALL |p1| (QREFELT $ 100)) 'T)
                     ((SPADCALL |p2| (QREFELT $ 100)) NIL)
                     ('T
                      (<
                       (SPADCALL |p1|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p1| (QREFELT $ 102))
                                           . #2=(|GENPGCD;better|))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #3="failed")
                                                   #1#))
                                 (QREFELT $ 73))
                       (SPADCALL |p2|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p2| (QREFELT $ 102))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #3#)
                                                   #1#))
                                 (QREFELT $ 73))))))) 

(DECLAIM (NOTINLINE |GeneralPolynomialGcdPackage;|)) 

(DEFUN |GeneralPolynomialGcdPackage| (&REST #1=#:G347)
  (SPROG NIL
         (PROG (#2=#:G348)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralPolynomialGcdPackage|)
                                               '|domainEqualList|)
                    . #3=(|GeneralPolynomialGcdPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralPolynomialGcdPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralPolynomialGcdPackage|)))))))))) 

(DEFUN |GeneralPolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|GeneralPolynomialGcdPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|GeneralPolynomialGcdPackage| DV$1 DV$2 DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 103) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|GeneralPolynomialGcdPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#3| '(|StepThrough|))
      (PROGN
       (QSETREFV $ 33 (|spadConstant| $ 32))
       (QSETREFV $ 35 (CONS (|dispatchFunction| |GENPGCD;randomR;R;2|) $))))
     ('T (QSETREFV $ 35 (CONS (|dispatchFunction| |GENPGCD;randomR;R;3|) $))))
    $))) 

(MAKEPROP '|GeneralPolynomialGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|)
              (|SparseUnivariatePolynomial| 9) (0 . |zero?|) (5 . |Zero|)
              (9 . |Zero|) (13 . |Zero|) (17 . |Zero|) (|NonNegativeInteger|)
              (21 . |degree|) (|Union| $ '"failed") (26 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (32 . |unitNormal|) (37 . *) (|List| 7) (43 . |setDifference|)
              (49 . |One|) (53 . |One|) (57 . |One|) (61 . =) (67 . -)
              |GENPGCD;gcdPolynomial;3Sup;1| (73 . |init|) '|randomCount|
              (77 . |nextItem|) (82 . |randomR|) (|Integer|) (86 . |coerce|)
              (91 . |coerce|) (96 . |ground|) (|SparseUnivariatePolynomial| 8)
              (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 8 40)
              (101 . |map|) (|SparseUnivariatePolynomial| $)
              (107 . |gcdPolynomial|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 40 9 11)
              (113 . |map|) (119 . >) (125 . |content|) (130 . |exquo|)
              (136 . |leadingCoefficient|) (141 . |gcd|) (|List| 8)
              (147 . |eval|) (154 . |zero?|) (159 . |degree|) (164 . |exquo|)
              (170 . |gcd|) (176 . *) (182 . +) (188 . *) (194 . +)
              (200 . |leadingCoefficient|) (205 . |exquo|) (211 . |reductum|)
              (216 . |monomial|) (222 . ~=) (|Mapping| 9 9) (228 . |map|)
              (|List| 9) (234 . |coefficients|) (239 . |degree|)
              (245 . |coerce|) (250 . -) (256 . |eval|) (|Union| 78 '"failed")
              (|List| 44) (263 . |solveLinearPolynomialEquation|) (|List| 11)
              (269 . |second|) (274 . *) (280 . ~=) (286 . =)
              (292 . |coefficient|) (299 . =) (305 . |setUnion|) (311 . ~=)
              (317 . |variables|) (322 . |concat|) (328 . |removeDuplicates|)
              (333 . |coerce|) (338 . |unit?|) (343 . |reductum|)
              (348 . |minimumDegree|) (|Mapping| 10 9 9) (353 . |sort|)
              (|List| $) (359 . |gcd|) (364 . |ground?|) (|Union| 7 '"failed")
              (369 . |mainVariable|))
           '#(|randomR| 374 |gcdPolynomial| 378) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 102
                                                 '(1 11 10 0 12 0 6 0 13 0 8 0
                                                   14 0 9 0 15 0 11 0 16 1 11
                                                   17 0 18 2 11 19 0 0 20 1 11
                                                   21 0 22 2 11 0 0 0 23 2 24 0
                                                   0 0 25 0 8 0 26 0 9 0 27 0
                                                   11 0 28 2 11 10 0 0 29 2 11
                                                   0 0 0 30 0 8 0 32 1 8 19 0
                                                   34 0 0 8 35 1 8 0 36 37 1 9
                                                   0 8 38 1 9 8 0 39 2 42 40 41
                                                   11 43 2 8 44 44 44 45 2 47
                                                   11 46 40 48 2 17 10 0 0 49 1
                                                   11 9 0 50 2 11 19 0 9 51 1
                                                   11 9 0 52 2 9 0 0 0 53 3 9 0
                                                   0 24 54 55 1 9 10 0 56 1 40
                                                   17 0 57 2 40 19 0 0 58 2 40
                                                   0 0 0 59 2 40 0 8 0 60 2 40
                                                   0 0 0 61 2 11 0 9 0 62 2 11
                                                   0 0 0 63 1 40 8 0 64 2 40 19
                                                   0 8 65 1 40 0 0 66 2 11 0 9
                                                   17 67 2 24 10 0 0 68 2 11 0
                                                   69 0 70 1 11 71 0 72 2 9 17
                                                   0 7 73 1 9 0 7 74 2 9 0 0 0
                                                   75 3 9 0 0 7 8 76 2 9 77 78
                                                   44 79 1 80 11 0 81 2 9 0 0 0
                                                   82 2 11 10 0 0 83 2 9 10 0 0
                                                   84 3 9 0 0 7 17 85 2 24 10 0
                                                   0 86 2 24 0 0 0 87 2 17 10 0
                                                   0 88 1 9 24 0 89 2 24 0 0 0
                                                   90 1 24 0 0 91 1 11 0 9 92 1
                                                   9 10 0 93 1 11 0 0 94 1 11
                                                   17 0 95 2 71 0 96 0 97 1 9 0
                                                   98 99 1 9 10 0 100 1 9 101 0
                                                   102 0 0 8 35 2 0 11 11 11
                                                   31)))))
           '|lookupComplete|)) 
