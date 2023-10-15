
(SDEFUN |GENPGCD;gcdPolynomial;3Sup;1|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|v2| #1=(|List| OV)) (|v| #1#) (#2=#:G177 NIL)
          (|g| (|SparseUnivariatePolynomial| P)) (|v1| #1#)
          (|pp2| #3=(|SparseUnivariatePolynomial| P)) (|pp1| #3#)
          (|vp2| #4=(|List| OV)) (|vp1| #4#)
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
                                ((EQL (LENGTH |v1|) 0)
                                 (COND
                                  ((EQL (LENGTH |v2|) 0)
                                   (EXIT
                                    (SPADCALL
                                     (|GENPGCD;gcdSameVariables| |p1| |p2|
                                      |vp1| $)
                                     |cg| (QREFELT $ 23)))))))
                               (LETT |v| (SPADCALL |vp1| |v1| (QREFELT $ 25))
                                     . #8#)
                               (LETT |pp1| (|GENPGCD;flatten| |p1| |v1| $)
                                     . #8#)
                               (LETT |pp2| (|GENPGCD;flatten| |p2| |v2| $)
                                     . #8#)
                               (LETT |g|
                                     (|GENPGCD;gcdSameVariables| |pp1| |pp2|
                                      |v| $)
                                     . #8#)
                               (EXIT
                                (COND
                                 ((SPADCALL |g| (|spadConstant| $ 28)
                                            (QREFELT $ 29))
                                  |cg|)
                                 (#7#
                                  (SEQ
                                   (COND
                                    ((OR (EQL (LENGTH |v1|) 0)
                                         (NULL
                                          (QEQCAR
                                           (SPADCALL |p1| |g| (QREFELT $ 20))
                                           1)))
                                     (COND
                                      ((OR (EQL (LENGTH |v2|) 0)
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
                                   (COND
                                    ((EQL (LENGTH |v1|) 0)
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (|GENPGCD;flatten| |p2| |v2| $) |v|
                                            $)
                                           . #8#))
                                    ((EQL (LENGTH |v2|) 0)
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (|GENPGCD;flatten| |p1| |v1| $) |v|
                                            $)
                                           . #8#))
                                    (#7#
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (SPADCALL
                                             (|GENPGCD;flatten| |p1| |v1| $)
                                             (|GENPGCD;flatten| |p2| |v2| $)
                                             (QREFELT $ 30))
                                            |v| $)
                                           . #8#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |g| (|spadConstant| $ 28)
                                                (QREFELT $ 29))
                                      |cg|)
                                     (#7#
                                      (SEQ
                                       (COND
                                        ((OR (EQL (LENGTH |v1|) 0)
                                             (NULL
                                              (QEQCAR
                                               (SPADCALL |p1| |g|
                                                         (QREFELT $ 20))
                                               1)))
                                         (COND
                                          ((OR (EQL (LENGTH |v2|) 0)
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
                                        ((SPADCALL (LENGTH |v1|) 0
                                                   (QREFELT $ 31))
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
                                              (GO #10=#:G176)))
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
                (LETT |v| (SPADCALL (QREFELT $ 34) (QREFELT $ 35))
                      |GENPGCD;randomR;R;2|)
                (EXIT
                 (COND
                  ((QEQCAR |v| 0)
                   (SEQ (SETELT $ 34 (QCDR |v|)) (EXIT (QCDR |v|))))
                  ('T
                   (SEQ
                    (SAY
                     "Taking next stepthrough range in GeneralPolynomialGcdPackage")
                    (SETELT $ 34 (|spadConstant| $ 33))
                    (EXIT (QREFELT $ 34))))))))) 

(SDEFUN |GENPGCD;randomR;R;3| (($ R)) (SPADCALL (RANDOM 100) (QREFELT $ 38))) 

(SDEFUN |GENPGCD;gcdSameVariables|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P) (|lv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G230 NIL) (#2=#:G231 NIL)
          (|ans| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (|uu| (|SparseUnivariatePolynomial| R)) (|r| (R))
          (|count| (|NonNegativeInteger|))
          (|up2| #3=(|SparseUnivariatePolynomial| R)) (#4=#:G211 NIL)
          (|up1| #3#) (|lr| (|List| R))
          (|u| #5=(|SparseUnivariatePolynomial| R)) (|v| #5#) (|vp2| #3#)
          (|vp1| #3#) (|lrr| (|List| R)) (#6=#:G239 NIL) (|vv| NIL)
          (#7=#:G238 NIL) (#8=#:G237 NIL) (#9=#:G236 NIL) (#10=#:G235 NIL)
          (#11=#:G234 NIL) (#12=#:G233 NIL) (#13=#:G232 NIL) (|gcdLC| (P)))
         (SEQ
          (EXIT
           (COND
            ((EQL (LENGTH |lv|) 0)
             (SPADCALL (ELT $ 39)
                       (SPADCALL (SPADCALL (ELT $ 40) |p1| (QREFELT $ 44))
                                 (SPADCALL (ELT $ 40) |p2| (QREFELT $ 44))
                                 (QREFELT $ 46))
                       (QREFELT $ 49)))
            ((EQL (SPADCALL |p2| (QREFELT $ 18)) 1)
             (COND ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0) |p2|)
                   (#14='T (|spadConstant| $ 28))))
            (#14#
             (SEQ
              (LETT |gcdLC|
                    (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                              (SPADCALL |p2| (QREFELT $ 50)) (QREFELT $ 51))
                    . #15=(|GENPGCD;gcdSameVariables|))
              (LETT |lr|
                    (PROGN
                     (LETT #13# NIL . #15#)
                     (SEQ (LETT |vv| NIL . #15#) (LETT #12# |lv| . #15#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |vv| (CAR #12#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13# (CONS (SPADCALL (QREFELT $ 36)) #13#)
                                  . #15#)))
                          (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #15#)
              (LETT |count| 0 . #15#)
              (SEQ G190 (COND ((NULL (< |count| 10)) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL
                               (SPADCALL |gcdLC| |lv| |lr| (QREFELT $ 53))
                               (QREFELT $ 54))
                              (< |count| 10))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ
                          (LETT |lr|
                                (PROGN
                                 (LETT #11# NIL . #15#)
                                 (SEQ (LETT |vv| NIL . #15#)
                                      (LETT #10# |lv| . #15#) G190
                                      (COND
                                       ((OR (ATOM #10#)
                                            (PROGN
                                             (LETT |vv| (CAR #10#) . #15#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11#
                                              (CONS (SPADCALL (QREFELT $ 36))
                                                    #11#)
                                              . #15#)))
                                      (LETT #10# (CDR #10#) . #15#) (GO G190)
                                      G191 (EXIT (NREVERSE #11#))))
                                . #15#)
                          (EXIT (LETT |count| (+ |count| 1) . #15#)))
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
                               |p1| (QREFELT $ 44))
                              . #15#)
                        (LETT |up2|
                              (SPADCALL
                               (CONS #'|GENPGCD;gcdSameVariables!1|
                                     (VECTOR $ |lr| |lv|))
                               |p2| (QREFELT $ 44))
                              . #15#)
                        (LETT |u| (SPADCALL |up1| |up2| (QREFELT $ 46)) . #15#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |u| (QREFELT $ 55)) 0)
                           (PROGN
                            (LETT #2# (|spadConstant| $ 28) . #15#)
                            (GO #16=#:G229)))
                          ('T
                           (SEQ
                            (LETT |lrr|
                                  (PROGN
                                   (LETT #9# NIL . #15#)
                                   (SEQ (LETT |vv| NIL . #15#)
                                        (LETT #8# |lv| . #15#) G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN
                                               (LETT |vv| (CAR #8#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #9#
                                                (CONS (SPADCALL (QREFELT $ 36))
                                                      #9#)
                                                . #15#)))
                                        (LETT #8# (CDR #8#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #9#))))
                                  . #15#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |gcdLC| |lv| |lrr|
                                                 (QREFELT $ 53))
                                       (QREFELT $ 54))
                                      (< |count| 10))
                                     ('T NIL)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lrr|
                                        (PROGN
                                         (LETT #7# NIL . #15#)
                                         (SEQ (LETT |vv| NIL . #15#)
                                              (LETT #6# |lv| . #15#) G190
                                              (COND
                                               ((OR (ATOM #6#)
                                                    (PROGN
                                                     (LETT |vv| (CAR #6#)
                                                           . #15#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #7#
                                                      (CONS
                                                       (SPADCALL
                                                        (QREFELT $ 36))
                                                       #7#)
                                                      . #15#)))
                                              (LETT #6# (CDR #6#) . #15#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #7#))))
                                        . #15#)
                                  (EXIT (LETT |count| (+ |count| 1) . #15#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((EQL |count| 10)
                               (|error| "too many evaluations in GCD code"))
                              ('T
                               (SEQ
                                (LETT |vp1|
                                      (SPADCALL
                                       (CONS #'|GENPGCD;gcdSameVariables!2|
                                             (VECTOR $ |lrr| |lv|))
                                       |p1| (QREFELT $ 44))
                                      . #15#)
                                (LETT |vp2|
                                      (SPADCALL
                                       (CONS #'|GENPGCD;gcdSameVariables!3|
                                             (VECTOR $ |lrr| |lv|))
                                       |p2| (QREFELT $ 44))
                                      . #15#)
                                (LETT |v| (SPADCALL |vp1| |vp2| (QREFELT $ 46))
                                      . #15#)
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL |v| (QREFELT $ 55)) 0)
                                   (PROGN
                                    (LETT #2# (|spadConstant| $ 28) . #15#)
                                    (GO #16#)))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((< (SPADCALL |v| (QREFELT $ 55))
                                         (SPADCALL |u| (QREFELT $ 55)))
                                      (SEQ (LETT |u| |v| . #15#)
                                           (LETT |up1| |vp1| . #15#)
                                           (LETT |up2| |vp2| . #15#)
                                           (EXIT (LETT |lr| |lrr| . #15#)))))
                                    (LETT |up1|
                                          (PROG2
                                              (LETT #4#
                                                    (SPADCALL |up1| |u|
                                                              (QREFELT $ 56))
                                                    . #15#)
                                              (QCDR #4#)
                                            (|check_union2| (QEQCAR #4# 0)
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT $ 8))
                                                            (|Union|
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT $ 8))
                                                             #17="failed")
                                                            #4#))
                                          . #15#)
                                    (EXIT
                                     (COND
                                      ((EQL
                                        (SPADCALL
                                         (SPADCALL |u| |up1| (QREFELT $ 57))
                                         (QREFELT $ 55))
                                        0)
                                       (SEQ
                                        (LETT |ans|
                                              (|GENPGCD;lift| |u| |p1| |up1|
                                               |lv| |lr| $)
                                              . #15#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |ans| 0)
                                           (PROGN
                                            (LETT #2# (QCDR |ans|) . #15#)
                                            (GO #16#)))
                                          ('T "next")))))
                                      ('T
                                       (SEQ
                                        (LETT |up2|
                                              (PROG2
                                                  (LETT #4#
                                                        (SPADCALL |up2| |u|
                                                                  (QREFELT $
                                                                           56))
                                                        . #15#)
                                                  (QCDR #4#)
                                                (|check_union2| (QEQCAR #4# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT $ 8))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT $
                                                                           8))
                                                                 #17#)
                                                                #4#))
                                              . #15#)
                                        (EXIT
                                         (COND
                                          ((EQL
                                            (SPADCALL
                                             (SPADCALL |u| |up2|
                                                       (QREFELT $ 57))
                                             (QREFELT $ 55))
                                            0)
                                           (SEQ
                                            (LETT |ans|
                                                  (|GENPGCD;lift| |u| |p2|
                                                   |up2| |lv| |lr| $)
                                                  . #15#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |ans| 0)
                                               (PROGN
                                                (LETT #2# (QCDR |ans|) . #15#)
                                                (GO #16#)))
                                              ('T "next")))))
                                          ('T
                                           (SEQ (LETT |count| 0 . #15#)
                                                (SEQ G190
                                                     (COND
                                                      ((NULL (< |count| 10))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (SEQ
                                                        (LETT |r|
                                                              (SPADCALL
                                                               (QREFELT $ 36))
                                                              . #15#)
                                                        (LETT |uu|
                                                              (SPADCALL |up1|
                                                                        (SPADCALL
                                                                         |r|
                                                                         |up2|
                                                                         (QREFELT
                                                                          $
                                                                          58))
                                                                        (QREFELT
                                                                         $ 59))
                                                              . #15#)
                                                        (EXIT
                                                         (COND
                                                          ((EQL
                                                            (SPADCALL
                                                             (SPADCALL |u| |uu|
                                                                       (QREFELT
                                                                        $ 57))
                                                             (QREFELT $ 55))
                                                            0)
                                                           (PROGN
                                                            (LETT #1#
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
                                                                              39))
                                                                            |p2|
                                                                            (QREFELT
                                                                             $
                                                                             60))
                                                                           (QREFELT
                                                                            $
                                                                            61))
                                                                          |uu|
                                                                          |lv|
                                                                          |lr|
                                                                          $)
                                                                         . #15#)
                                                                   (EXIT
                                                                    (COND
                                                                     ((QEQCAR
                                                                       |ans| 0)
                                                                      (PROGN
                                                                       (LETT
                                                                        #2#
                                                                        (QCDR
                                                                         |ans|)
                                                                        . #15#)
                                                                       (GO
                                                                        #16#)))
                                                                     ('T
                                                                      "next"))))
                                                                  . #15#)
                                                            (GO
                                                             #18=#:G216)))))))
                                                      #18# (EXIT #1#))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL))
                                                (EXIT
                                                 (|error|
                                                  "too many evaluations in GCD code")))))))))))))))))))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((>= |count| 10)
                 (|error| "too many evaluations in GCD code"))))))))
          #16# (EXIT #2#)))) 

(SDEFUN |GENPGCD;gcdSameVariables!3| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lrr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lrr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lrr| (QREFELT $ 53))
                      (QREFELT $ 40)))))) 

(SDEFUN |GENPGCD;gcdSameVariables!2| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lrr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lrr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lrr| (QREFELT $ 53))
                      (QREFELT $ 40)))))) 

(SDEFUN |GENPGCD;gcdSameVariables!1| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 53))
                      (QREFELT $ 40)))))) 

(SDEFUN |GENPGCD;gcdSameVariables!0| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 53))
                      (QREFELT $ 40)))))) 

(SDEFUN |GENPGCD;lift|
        ((|gR| |SparseUnivariatePolynomial| R)
         (|p| |SparseUnivariatePolynomial| P)
         (|cfR| |SparseUnivariatePolynomial| R) (|lv| |List| OV)
         (|lr| |List| R) ($ |Union| (|SparseUnivariatePolynomial| P) "failed"))
        (SPROG
         ((#1=#:G261 NIL) (#2=#:G262 NIL) (|pn| (P))
          (|cf| #3=(|SparseUnivariatePolynomial| P)) (|g| #3#)
          (|step| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#4=#:G260 NIL)
          (|Ecart| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#5=#:G264 NIL) (|n| NIL) (|origFactors| (|List| #3#)) (|prime| (P))
          (|d| #6=(|NonNegativeInteger|)) (#7=#:G245 NIL) (#8=#:G244 #6#)
          (#9=#:G246 #6#) (#10=#:G263 NIL) (|c| NIL)
          (|thisp| (|SparseUnivariatePolynomial| P)) (|r| (R)) (|v| (OV))
          (|lcp| (P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lcp| (SPADCALL |p| (QREFELT $ 50)) . #11=(|GENPGCD;lift|))
            (LETT |g|
                  (SPADCALL
                   (SPADCALL |lcp| (SPADCALL |gR| (QREFELT $ 55))
                             (QREFELT $ 62))
                   (SPADCALL (ELT $ 39) (SPADCALL |gR| (QREFELT $ 63))
                             (QREFELT $ 49))
                   (QREFELT $ 61))
                  . #11#)
            (LETT |cf|
                  (SPADCALL
                   (SPADCALL |lcp| (SPADCALL |cfR| (QREFELT $ 55))
                             (QREFELT $ 62))
                   (SPADCALL (ELT $ 39) (SPADCALL |cfR| (QREFELT $ 63))
                             (QREFELT $ 49))
                   (QREFELT $ 61))
                  . #11#)
            (LETT |p| (SPADCALL |lcp| |p| (QREFELT $ 60)) . #11#)
            (SEQ G190
                 (COND ((NULL (SPADCALL |lv| NIL (QREFELT $ 64))) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |v| (|SPADfirst| |lv|) . #11#)
                        (LETT |r| (|SPADfirst| |lr|) . #11#)
                        (LETT |lv| (CDR |lv|) . #11#)
                        (LETT |lr| (CDR |lr|) . #11#)
                        (LETT |thisp|
                              (SPADCALL
                               (CONS #'|GENPGCD;lift!0| (VECTOR $ |lr| |lv|))
                               |p| (QREFELT $ 66))
                              . #11#)
                        (LETT |d|
                              (PROGN
                               (LETT #7# NIL . #11#)
                               (SEQ (LETT |c| NIL . #11#)
                                    (LETT #10# (SPADCALL |p| (QREFELT $ 68))
                                          . #11#)
                                    G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN
                                           (LETT |c| (CAR #10#) . #11#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #9#
                                             (SPADCALL |c| |v| (QREFELT $ 69))
                                             . #11#)
                                       (COND
                                        (#7# (LETT #8# (MAX #8# #9#) . #11#))
                                        ('T
                                         (PROGN
                                          (LETT #8# #9# . #11#)
                                          (LETT #7# 'T . #11#)))))))
                                    (LETT #10# (CDR #10#) . #11#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#7# #8#) ('T (|IdentityError| '|max|))))
                              . #11#)
                        (LETT |prime|
                              (SPADCALL (SPADCALL |v| (QREFELT $ 70))
                                        (SPADCALL |r| (QREFELT $ 39))
                                        (QREFELT $ 71))
                              . #11#)
                        (LETT |pn| |prime| . #11#)
                        (LETT |origFactors| (LIST |g| |cf|) . #11#)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |n| 1 . #11#) (LETT #5# |d| . #11#) G190
                               (COND ((|greater_SI| |n| #5#) (GO G191)))
                               (SEQ
                                (LETT |Ecart|
                                      (SPADCALL
                                       (SPADCALL |thisp|
                                                 (SPADCALL |g| |cf|
                                                           (QREFELT $ 23))
                                                 (QREFELT $ 30))
                                       |pn| (QREFELT $ 72))
                                      . #11#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |Ecart| 1)
                                   (|error|
                                    "failed lifting in hensel in Complex Polynomial GCD"))
                                  ((SPADCALL (QCDR |Ecart|) (QREFELT $ 12))
                                   (PROGN
                                    (LETT #4# |$NoValue| . #11#)
                                    (GO #12=#:G255)))
                                  ('T
                                   (SEQ
                                    (LETT |step|
                                          (SPADCALL |origFactors|
                                                    (SPADCALL
                                                     (CONS #'|GENPGCD;lift!1|
                                                           (VECTOR $ |r| |v|))
                                                     (QCDR |Ecart|)
                                                     (QREFELT $ 66))
                                                    (QREFELT $ 76))
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |step| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #11#)
                                        (GO #13=#:G259)))
                                      ('T
                                       (SEQ
                                        (LETT |g|
                                              (SPADCALL |g|
                                                        (SPADCALL |pn|
                                                                  (|SPADfirst|
                                                                   (QCDR
                                                                    |step|))
                                                                  (QREFELT $
                                                                           60))
                                                        (QREFELT $ 61))
                                              . #11#)
                                        (LETT |cf|
                                              (SPADCALL |cf|
                                                        (SPADCALL |pn|
                                                                  (SPADCALL
                                                                   (QCDR
                                                                    |step|)
                                                                   (QREFELT $
                                                                            78))
                                                                  (QREFELT $
                                                                           60))
                                                        (QREFELT $ 61))
                                              . #11#)
                                        (EXIT
                                         (LETT |pn|
                                               (SPADCALL |pn| |prime|
                                                         (QREFELT $ 79))
                                               . #11#)))))))))))
                               (LETT |n| (|inc_SI| |n|) . #11#) (GO G190) G191
                               (EXIT NIL)))
                         #12# (EXIT #4#))
                        (EXIT
                         (COND
                          ((SPADCALL |thisp| (SPADCALL |g| |cf| (QREFELT $ 23))
                                     (QREFELT $ 80))
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed") . #11#)
                                   (GO #13#))
                                  . #11#)
                            (GO #14=#:G256)))))))
                  #14# (EXIT #1#))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |g|))))
          #13# (EXIT #2#)))) 

(SDEFUN |GENPGCD;lift!1| ((|x| NIL) ($$ NIL))
        (PROG (|v| |r| $)
          (LETT |v| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
          (LETT |r| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |v| |r| (QREFELT $ 73)))))) 

(SDEFUN |GENPGCD;lift!0| ((|x| NIL) ($$ NIL))
        (PROG (|lv| |lr| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
          (LETT |lr| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 53)))))) 

(SDEFUN |GENPGCD;recursivelyGCDCoefficients|
        ((|g| . #1=(|SparseUnivariatePolynomial| P)) (|v| . #2=(|List| OV))
         (|p| |SparseUnivariatePolynomial| P) (|pv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#3=#:G275 NIL) (|oldv| #2#) (#4=#:G276 NIL) (|oldg| #1#)
          (|p1| (|SparseUnivariatePolynomial| P)) (#5=#:G278 NIL) (|i| NIL)
          (|d| #6=(|NonNegativeInteger|)) (#7=#:G266 NIL) (#8=#:G265 #6#)
          (#9=#:G267 #6#) (#10=#:G277 NIL) (|u| NIL) (|mv| (OV)))
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
                        (LETT #10# (SPADCALL |p| (QREFELT $ 68)) . #11#) G190
                        (COND
                         ((OR (ATOM #10#)
                              (PROGN (LETT |u| (CAR #10#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #9# (SPADCALL |u| |mv| (QREFELT $ 69)) . #11#)
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
                         |p| (QREFELT $ 66))
                        . #11#)
                  (LETT |oldg| |g| . #11#)
                  (COND
                   ((SPADCALL |pv| NIL (QREFELT $ 82))
                    (LETT |g| (|GENPGCD;gcdSameVariables| |g| |p1| |v| $)
                          . #11#))
                   ('T
                    (LETT |g|
                          (|GENPGCD;recursivelyGCDCoefficients| |p| |v| |p1|
                           |pv| $)
                          . #11#)))
                  (EXIT
                   (COND
                    ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 29))
                     (PROGN
                      (LETT #4# (|spadConstant| $ 28) . #11#)
                      (GO #12=#:G274)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |g| |oldg| (QREFELT $ 80))
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
                                                      (QREFELT $ 83))
                                            . #11#)))
                                . #11#)
                          (GO #13=#:G270)))))
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
          (RETURN (PROGN (SPADCALL |x| |mv| |i| (QREFELT $ 81)))))) 

(SDEFUN |GENPGCD;flatten|
        ((|p1| |SparseUnivariatePolynomial| P) (|lv| |List| OV)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((|lr| (|List| R)) (#1=#:G289 NIL) (|vv| NIL) (#2=#:G288 NIL)
          (|ans| (|SparseUnivariatePolynomial| P))
          (|dg| (|NonNegativeInteger|)) (#3=#:G287 NIL) (#4=#:G286 NIL))
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
                                (LETT #4# (CONS (SPADCALL (QREFELT $ 36)) #4#)
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
                                            |p1| (QREFELT $ 66))
                                           . #5#)
                                     (QREFELT $ 18))
                                    (QREFELT $ 31)))
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
                                             (CONS (SPADCALL (QREFELT $ 36))
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
          (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 53)))))) 

(SDEFUN |GENPGCD;variables|
        ((|p1| |SparseUnivariatePolynomial| P) ($ |List| OV))
        (SPROG
         ((#1=#:G291 NIL) (#2=#:G290 #3=(|List| OV)) (#4=#:G292 #3#)
          (#5=#:G294 NIL) (|u| NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL . #6=(|GENPGCD;variables|))
            (SEQ (LETT |u| NIL . #6#)
                 (LETT #5# (SPADCALL |p1| (QREFELT $ 68)) . #6#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4# (SPADCALL |u| (QREFELT $ 84)) . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 85)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|IdentityError| '|concat|))))
           (QREFELT $ 86))))) 

(SDEFUN |GENPGCD;gcdTrivial|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|un?| (|Boolean|)) (|cp1| (P)))
               (SEQ
                (LETT |cp1| (SPADCALL |p1| (QREFELT $ 50))
                      . #1=(|GENPGCD;gcdTrivial|))
                (EXIT
                 (COND
                  ((SPADCALL |cp1| (|spadConstant| $ 27) (QREFELT $ 87))
                   (|spadConstant| $ 28))
                  ((EQL (SPADCALL |p2| (QREFELT $ 18)) 0)
                   (SPADCALL
                    (SPADCALL |cp1| (SPADCALL |p2| (QREFELT $ 50))
                              (QREFELT $ 51))
                    (QREFELT $ 88)))
                  (#2='T
                   (SEQ (LETT |un?| (SPADCALL |cp1| (QREFELT $ 89)) . #1#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (NULL
                                 (OR (SPADCALL |p2| (QREFELT $ 12)) |un?|)))
                               (GO G191)))
                             (SEQ
                              (LETT |cp1|
                                    (SPADCALL (SPADCALL |p2| (QREFELT $ 50))
                                              |cp1| (QREFELT $ 51))
                                    . #1#)
                              (LETT |un?| (SPADCALL |cp1| (QREFELT $ 89))
                                    . #1#)
                              (EXIT
                               (LETT |p2| (SPADCALL |p2| (QREFELT $ 90))
                                     . #1#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND (|un?| (|spadConstant| $ 28))
                               (#2# (SPADCALL |cp1| (QREFELT $ 88)))))))))))) 

(SDEFUN |GENPGCD;gcd_monomial|
        ((|p1| |SparseUnivariatePolynomial| P)
         (|p2| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPADCALL
         (SPADCALL (SPADCALL |p1| (QREFELT $ 50))
                   (SPADCALL |p2| (QREFELT $ 50)) (QREFELT $ 51))
         (MIN (SPADCALL |p1| (QREFELT $ 18)) (SPADCALL |p2| (QREFELT $ 18)))
         (QREFELT $ 62))) 

(SDEFUN |GENPGCD;monomContentSup|
        ((|u| |SparseUnivariatePolynomial| P)
         ($ |SparseUnivariatePolynomial| P))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |u| (QREFELT $ 18)) 0) (|spadConstant| $ 28))
                 ('T
                  (SEQ
                   (LETT |md| (SPADCALL |u| (QREFELT $ 91))
                         |GENPGCD;monomContentSup|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (CONS (|function| |GENPGCD;better|) $)
                                (SPADCALL |u| (QREFELT $ 68)) (QREFELT $ 93))
                      (QREFELT $ 95))
                     (SPADCALL (|spadConstant| $ 27) |md| (QREFELT $ 62))
                     (QREFELT $ 60))))))))) 

(SDEFUN |GENPGCD;better| ((|p1| P) (|p2| P) ($ |Boolean|))
        (SPROG ((#1=#:G341 NIL))
               (COND ((SPADCALL |p1| (QREFELT $ 96)) 'T)
                     ((SPADCALL |p2| (QREFELT $ 96)) NIL)
                     ('T
                      (<
                       (SPADCALL |p1|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p1| (QREFELT $ 98))
                                           . #2=(|GENPGCD;better|))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #3="failed")
                                                   #1#))
                                 (QREFELT $ 69))
                       (SPADCALL |p2|
                                 (PROG2
                                     (LETT #1# (SPADCALL |p2| (QREFELT $ 98))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #3#)
                                                   #1#))
                                 (QREFELT $ 69))))))) 

(DECLAIM (NOTINLINE |GeneralPolynomialGcdPackage;|)) 

(DEFUN |GeneralPolynomialGcdPackage| (&REST #1=#:G346)
  (SPROG NIL
         (PROG (#2=#:G347)
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
    (LETT $ (GETREFV 99) . #1#)
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
       (QSETREFV $ 34 (|spadConstant| $ 33))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |GENPGCD;randomR;R;2|) $))))
     ('T (QSETREFV $ 36 (CONS (|dispatchFunction| |GENPGCD;randomR;R;3|) $))))
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
              (73 . ~=) |GENPGCD;gcdPolynomial;3Sup;1| (79 . |init|)
              '|randomCount| (83 . |nextItem|) (88 . |randomR|) (|Integer|)
              (92 . |coerce|) (97 . |coerce|) (102 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 8 41)
              (107 . |map|) (|SparseUnivariatePolynomial| $)
              (113 . |gcdPolynomial|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 41 9 11)
              (119 . |map|) (125 . |leadingCoefficient|) (130 . |gcd|)
              (|List| 8) (136 . |eval|) (143 . |zero?|) (148 . |degree|)
              (153 . |exquo|) (159 . |gcd|) (165 . *) (171 . +) (177 . *)
              (183 . +) (189 . |monomial|) (195 . |reductum|) (200 . ~=)
              (|Mapping| 9 9) (206 . |map|) (|List| 9) (212 . |coefficients|)
              (217 . |degree|) (223 . |coerce|) (228 . -) (234 . |exquo|)
              (240 . |eval|) (|Union| 75 '"failed") (|List| 45)
              (247 . |solveLinearPolynomialEquation|) (|List| 11)
              (253 . |second|) (258 . *) (264 . ~=) (270 . |coefficient|)
              (277 . =) (283 . |setUnion|) (289 . |variables|) (294 . |concat|)
              (300 . |removeDuplicates|) (305 . =) (311 . |coerce|)
              (316 . |unit?|) (321 . |reductum|) (326 . |minimumDegree|)
              (|Mapping| 10 9 9) (331 . |sort|) (|List| $) (337 . |gcd|)
              (342 . |ground?|) (|Union| 7 '"failed") (347 . |mainVariable|))
           '#(|randomR| 352 |gcdPolynomial| 356) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 98
                                                 '(1 11 10 0 12 0 6 0 13 0 8 0
                                                   14 0 9 0 15 0 11 0 16 1 11
                                                   17 0 18 2 11 19 0 0 20 1 11
                                                   21 0 22 2 11 0 0 0 23 2 24 0
                                                   0 0 25 0 8 0 26 0 9 0 27 0
                                                   11 0 28 2 11 10 0 0 29 2 11
                                                   0 0 0 30 2 17 10 0 0 31 0 8
                                                   0 33 1 8 19 0 35 0 0 8 36 1
                                                   8 0 37 38 1 9 0 8 39 1 9 8 0
                                                   40 2 43 41 42 11 44 2 8 45
                                                   45 45 46 2 48 11 47 41 49 1
                                                   11 9 0 50 2 9 0 0 0 51 3 9 0
                                                   0 24 52 53 1 9 10 0 54 1 41
                                                   17 0 55 2 41 19 0 0 56 2 41
                                                   0 0 0 57 2 41 0 8 0 58 2 41
                                                   0 0 0 59 2 11 0 9 0 60 2 11
                                                   0 0 0 61 2 11 0 9 17 62 1 41
                                                   0 0 63 2 24 10 0 0 64 2 11 0
                                                   65 0 66 1 11 67 0 68 2 9 17
                                                   0 7 69 1 9 0 7 70 2 9 0 0 0
                                                   71 2 11 19 0 9 72 3 9 0 0 7
                                                   8 73 2 9 74 75 45 76 1 77 11
                                                   0 78 2 9 0 0 0 79 2 11 10 0
                                                   0 80 3 9 0 0 7 17 81 2 24 10
                                                   0 0 82 2 24 0 0 0 83 1 9 24
                                                   0 84 2 24 0 0 0 85 1 24 0 0
                                                   86 2 9 10 0 0 87 1 11 0 9 88
                                                   1 9 10 0 89 1 11 0 0 90 1 11
                                                   17 0 91 2 67 0 92 0 93 1 9 0
                                                   94 95 1 9 10 0 96 1 9 97 0
                                                   98 0 0 8 36 2 0 11 11 11
                                                   32)))))
           '|lookupComplete|)) 
