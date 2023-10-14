
(DEFUN |GENPGCD;gcdPolynomial;3Sup;1| (|p1| |p2| $)
  (PROG (|v2| |v| #1=#:G175 |g| |v1| |pp2| |pp1| |vp2| |vp1| #2=#:G145 |c2|
         |c1| |#G9| |#G8|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |p1| (QREFELT $ 12)) |p2|)
             ((SPADCALL |p2| (QREFELT $ 12)) |p1|)
             ((EQL 0 (SPADCALL |p1| (QREFELT $ 18)))
              (|GENPGCD;gcdTrivial| |p1| |p2| $))
             ((EQL 0 (SPADCALL |p2| (QREFELT $ 18)))
              (|GENPGCD;gcdTrivial| |p2| |p1| $))
             (#3='T
              (SEQ
               (COND
                ((< (SPADCALL |p1| (QREFELT $ 18))
                    (SPADCALL |p2| (QREFELT $ 18)))
                 (PROGN
                  (LETT |#G8| |p2| . #4=(|GENPGCD;gcdPolynomial;3Sup;1|))
                  (LETT |#G9| |p1| . #4#)
                  (LETT |p1| |#G8| . #4#)
                  (LETT |p2| |#G9| . #4#))))
               (EXIT
                (COND
                 ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0)
                  (QVELT (SPADCALL |p2| (QREFELT $ 22)) 1))
                 (#3#
                  (SEQ (LETT |c1| (|GENPGCD;monomContentSup| |p1| $) . #4#)
                       (LETT |c2| (|GENPGCD;monomContentSup| |p2| $) . #4#)
                       (LETT |p1|
                             (PROG2
                                 (LETT #2# (SPADCALL |p1| |c1| (QREFELT $ 20))
                                       . #4#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              #2#))
                             . #4#)
                       (LETT |p2|
                             (PROG2
                                 (LETT #2# (SPADCALL |p2| |c2| (QREFELT $ 20))
                                       . #4#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 9))
                                              #2#))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0)
                          (SPADCALL (QVELT (SPADCALL |p2| (QREFELT $ 22)) 1)
                                    (SPADCALL |c1| |c2| (QREFELT $ 23))
                                    (QREFELT $ 24)))
                         (#3#
                          (SEQ (LETT |vp1| (|GENPGCD;variables| |p1| $) . #4#)
                               (LETT |vp2| (|GENPGCD;variables| |p2| $) . #4#)
                               (LETT |v1| (SPADCALL |vp1| |vp2| (QREFELT $ 26))
                                     . #4#)
                               (LETT |v2| (SPADCALL |vp2| |vp1| (QREFELT $ 26))
                                     . #4#)
                               (COND
                                ((EQL (LENGTH |v1|) 0)
                                 (COND
                                  ((EQL (LENGTH |v2|) 0)
                                   (EXIT
                                    (SPADCALL
                                     (|GENPGCD;gcdSameVariables| |p1| |p2|
                                      |vp1| $)
                                     (SPADCALL |c1| |c2| (QREFELT $ 23))
                                     (QREFELT $ 24)))))))
                               (LETT |v| (SPADCALL |vp1| |v1| (QREFELT $ 26))
                                     . #4#)
                               (LETT |pp1| (|GENPGCD;flatten| |p1| |v1| $)
                                     . #4#)
                               (LETT |pp2| (|GENPGCD;flatten| |p2| |v2| $)
                                     . #4#)
                               (LETT |g|
                                     (|GENPGCD;gcdSameVariables| |pp1| |pp2|
                                      |v| $)
                                     . #4#)
                               (EXIT
                                (COND
                                 ((SPADCALL |g| (|spadConstant| $ 29)
                                            (QREFELT $ 30))
                                  (SPADCALL |c1| |c2| (QREFELT $ 23)))
                                 (#3#
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
                                        (SPADCALL |g|
                                                  (SPADCALL |c1| |c2|
                                                            (QREFELT $ 23))
                                                  (QREFELT $ 24)))))))
                                   (LETT |v| (|GENPGCD;variables| |g| $) . #4#)
                                   (LETT |v1|
                                         (SPADCALL |vp1| |v| (QREFELT $ 26))
                                         . #4#)
                                   (LETT |v2|
                                         (SPADCALL |vp2| |v| (QREFELT $ 26))
                                         . #4#)
                                   (COND
                                    ((EQL (LENGTH |v1|) 0)
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (|GENPGCD;flatten| |p2| |v2| $) |v|
                                            $)
                                           . #4#))
                                    ((EQL (LENGTH |v2|) 0)
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (|GENPGCD;flatten| |p1| |v1| $) |v|
                                            $)
                                           . #4#))
                                    (#3#
                                     (LETT |g|
                                           (|GENPGCD;gcdSameVariables| |g|
                                            (SPADCALL
                                             (|GENPGCD;flatten| |p1| |v1| $)
                                             (|GENPGCD;flatten| |p2| |v2| $)
                                             (QREFELT $ 31))
                                            |v| $)
                                           . #4#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |g| (|spadConstant| $ 29)
                                                (QREFELT $ 30))
                                      (SPADCALL |c1| |c2| (QREFELT $ 23)))
                                     (#3#
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
                                            (SPADCALL |g|
                                                      (SPADCALL |c1| |c2|
                                                                (QREFELT $ 23))
                                                      (QREFELT $ 24)))))))
                                       (LETT |v| (|GENPGCD;variables| |g| $)
                                             . #4#)
                                       (LETT |v1|
                                             (SPADCALL |vp1| |v|
                                                       (QREFELT $ 26))
                                             . #4#)
                                       (COND
                                        ((SPADCALL (LENGTH |v1|) 0
                                                   (QREFELT $ 32))
                                         (SEQ
                                          (LETT |g|
                                                (|GENPGCD;recursivelyGCDCoefficients|
                                                 |g| |v| |p1| |v1| $)
                                                . #4#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |g|
                                                       (|spadConstant| $ 29)
                                                       (QREFELT $ 30))
                                             (PROGN
                                              (LETT #1#
                                                    (SPADCALL |c1| |c2|
                                                              (QREFELT $ 23))
                                                    . #4#)
                                              (GO #1#)))
                                            (#3#
                                             (LETT |v|
                                                   (|GENPGCD;variables| |g| $)
                                                   . #4#)))))))
                                       (LETT |v2|
                                             (SPADCALL |vp2| |v|
                                                       (QREFELT $ 26))
                                             . #4#)
                                       (EXIT
                                        (SPADCALL
                                         (|GENPGCD;recursivelyGCDCoefficients|
                                          |g| |v| |p2| |v2| $)
                                         (SPADCALL |c1| |c2| (QREFELT $ 23))
                                         (QREFELT $ 24)))))))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |GENPGCD;randomR;R;2| ($)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (QREFELT $ 35) (QREFELT $ 36)) |GENPGCD;randomR;R;2|)
      (EXIT
       (COND ((QEQCAR |v| 0) (SEQ (SETELT $ 35 (QCDR |v|)) (EXIT (QCDR |v|))))
             ('T
              (SEQ
               (SAY
                "Taking next stepthrough range in GeneralPolynomialGcdPackage")
               (SETELT $ 35 (|spadConstant| $ 34)) (EXIT (QREFELT $ 35)))))))))) 

(DEFUN |GENPGCD;randomR;R;3| ($) (SPADCALL (RANDOM 100) (QREFELT $ 39))) 

(DEFUN |GENPGCD;gcdSameVariables| (|p1| |p2| |lv| $)
  (PROG (#1=#:G214 #2=#:G227 |ans| |uu| |r| |count| |up2| #3=#:G209 |up1| |lr|
         |u| |v| |vp2| |vp1| |lrr| #4=#:G235 |vv| #5=#:G234 #6=#:G233 #7=#:G232
         #8=#:G231 #9=#:G230 #10=#:G229 #11=#:G228 |gcdLC|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (LENGTH |lv|) 0)
         (SPADCALL (ELT $ 40)
                   (SPADCALL (SPADCALL (ELT $ 41) |p1| (QREFELT $ 45))
                             (SPADCALL (ELT $ 41) |p2| (QREFELT $ 45))
                             (QREFELT $ 47))
                   (QREFELT $ 50)))
        ((EQL (SPADCALL |p2| (QREFELT $ 18)) 1)
         (COND ((QEQCAR (SPADCALL |p1| |p2| (QREFELT $ 20)) 0) |p2|)
               (#12='T (|spadConstant| $ 29))))
        (#12#
         (SEQ
          (LETT |gcdLC|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 51))
                          (SPADCALL |p2| (QREFELT $ 51)) (QREFELT $ 52))
                . #13=(|GENPGCD;gcdSameVariables|))
          (LETT |lr|
                (PROGN
                 (LETT #11# NIL . #13#)
                 (SEQ (LETT |vv| NIL . #13#) (LETT #10# |lv| . #13#) G190
                      (COND
                       ((OR (ATOM #10#)
                            (PROGN (LETT |vv| (CAR #10#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11# (CONS (SPADCALL (QREFELT $ 37)) #11#)
                              . #13#)))
                      (LETT #10# (CDR #10#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                . #13#)
          (LETT |count| 0 . #13#)
          (SEQ G190 (COND ((NULL (< |count| 10)) (GO G191)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((SPADCALL (SPADCALL |gcdLC| |lv| |lr| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          (< |count| 10))
                         ('T 'NIL)))
                       (GO G191)))
                     (SEQ
                      (LETT |lr|
                            (PROGN
                             (LETT #9# NIL . #13#)
                             (SEQ (LETT |vv| NIL . #13#) (LETT #8# |lv| . #13#)
                                  G190
                                  (COND
                                   ((OR (ATOM #8#)
                                        (PROGN
                                         (LETT |vv| (CAR #8#) . #13#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #9#
                                          (CONS (SPADCALL (QREFELT $ 37)) #9#)
                                          . #13#)))
                                  (LETT #8# (CDR #8#) . #13#) (GO G190) G191
                                  (EXIT (NREVERSE #9#))))
                            . #13#)
                      (EXIT (LETT |count| (+ |count| 1) . #13#)))
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
                           |p1| (QREFELT $ 45))
                          . #13#)
                    (LETT |up2|
                          (SPADCALL
                           (CONS #'|GENPGCD;gcdSameVariables!1|
                                 (VECTOR $ |lr| |lv|))
                           |p2| (QREFELT $ 45))
                          . #13#)
                    (LETT |u| (SPADCALL |up1| |up2| (QREFELT $ 47)) . #13#)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |u| (QREFELT $ 56)) 0)
                       (PROGN
                        (LETT #2# (|spadConstant| $ 29) . #13#)
                        (GO #2#)))
                      ('T
                       (SEQ
                        (LETT |lrr|
                              (PROGN
                               (LETT #7# NIL . #13#)
                               (SEQ (LETT |vv| NIL . #13#)
                                    (LETT #6# |lv| . #13#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |vv| (CAR #6#) . #13#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #7#
                                            (CONS (SPADCALL (QREFELT $ 37))
                                                  #7#)
                                            . #13#)))
                                    (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                                    (EXIT (NREVERSE #7#))))
                              . #13#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |gcdLC| |lv| |lrr| (QREFELT $ 54))
                                   (QREFELT $ 55))
                                  (< |count| 10))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ
                              (LETT |lrr|
                                    (PROGN
                                     (LETT #5# NIL . #13#)
                                     (SEQ (LETT |vv| NIL . #13#)
                                          (LETT #4# |lv| . #13#) G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |vv| (CAR #4#) . #13#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #5#
                                                  (CONS
                                                   (SPADCALL (QREFELT $ 37))
                                                   #5#)
                                                  . #13#)))
                                          (LETT #4# (CDR #4#) . #13#) (GO G190)
                                          G191 (EXIT (NREVERSE #5#))))
                                    . #13#)
                              (EXIT (LETT |count| (+ |count| 1) . #13#)))
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
                                   |p1| (QREFELT $ 45))
                                  . #13#)
                            (LETT |vp2|
                                  (SPADCALL
                                   (CONS #'|GENPGCD;gcdSameVariables!3|
                                         (VECTOR $ |lrr| |lv|))
                                   |p2| (QREFELT $ 45))
                                  . #13#)
                            (LETT |v| (SPADCALL |vp1| |vp2| (QREFELT $ 47))
                                  . #13#)
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |v| (QREFELT $ 56)) 0)
                               (PROGN
                                (LETT #2# (|spadConstant| $ 29) . #13#)
                                (GO #2#)))
                              ('T
                               (SEQ
                                (COND
                                 ((< (SPADCALL |v| (QREFELT $ 56))
                                     (SPADCALL |u| (QREFELT $ 56)))
                                  (SEQ (LETT |u| |v| . #13#)
                                       (LETT |up1| |vp1| . #13#)
                                       (LETT |up2| |vp2| . #13#)
                                       (EXIT (LETT |lr| |lrr| . #13#)))))
                                (LETT |up1|
                                      (PROG2
                                          (LETT #3#
                                                (SPADCALL |up1| |u|
                                                          (QREFELT $ 57))
                                                . #13#)
                                          (QCDR #3#)
                                        (|check_union| (QEQCAR #3# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 8))
                                                       #3#))
                                      . #13#)
                                (EXIT
                                 (COND
                                  ((EQL
                                    (SPADCALL
                                     (SPADCALL |u| |up1| (QREFELT $ 58))
                                     (QREFELT $ 56))
                                    0)
                                   (SEQ
                                    (LETT |ans|
                                          (|GENPGCD;lift| |u| |p1| |up1| |lv|
                                           |lr| $)
                                          . #13#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ans| 0)
                                       (PROGN
                                        (LETT #2# (QCDR |ans|) . #13#)
                                        (GO #2#)))
                                      ('T "next")))))
                                  ('T
                                   (SEQ
                                    (LETT |up2|
                                          (PROG2
                                              (LETT #3#
                                                    (SPADCALL |up2| |u|
                                                              (QREFELT $ 57))
                                                    . #13#)
                                              (QCDR #3#)
                                            (|check_union| (QEQCAR #3# 0)
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 8))
                                                           #3#))
                                          . #13#)
                                    (EXIT
                                     (COND
                                      ((EQL
                                        (SPADCALL
                                         (SPADCALL |u| |up2| (QREFELT $ 58))
                                         (QREFELT $ 56))
                                        0)
                                       (SEQ
                                        (LETT |ans|
                                              (|GENPGCD;lift| |u| |p2| |up2|
                                               |lv| |lr| $)
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |ans| 0)
                                           (PROGN
                                            (LETT #2# (QCDR |ans|) . #13#)
                                            (GO #2#)))
                                          ('T "next")))))
                                      ('T
                                       (SEQ (LETT |count| 0 . #13#)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL (< |count| 10))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |r|
                                                          (SPADCALL
                                                           (QREFELT $ 37))
                                                          . #13#)
                                                    (LETT |uu|
                                                          (SPADCALL |up1|
                                                                    (SPADCALL
                                                                     |r| |up2|
                                                                     (QREFELT $
                                                                              59))
                                                                    (QREFELT $
                                                                             60))
                                                          . #13#)
                                                    (EXIT
                                                     (COND
                                                      ((EQL
                                                        (SPADCALL
                                                         (SPADCALL |u| |uu|
                                                                   (QREFELT $
                                                                            58))
                                                         (QREFELT $ 56))
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
                                                                          40))
                                                                        |p2|
                                                                        (QREFELT
                                                                         $ 61))
                                                                       (QREFELT
                                                                        $ 62))
                                                                      |uu| |lv|
                                                                      |lr| $)
                                                                     . #13#)
                                                               (EXIT
                                                                (COND
                                                                 ((QEQCAR |ans|
                                                                          0)
                                                                  (PROGN
                                                                   (LETT #2#
                                                                         (QCDR
                                                                          |ans|)
                                                                         . #13#)
                                                                   (GO #2#)))
                                                                 ('T "next"))))
                                                              . #13#)
                                                        (GO #1#)))))))
                                                  #1# (EXIT #1#))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (|error|
                                              "too many evaluations in GCD code")))))))))))))))))))))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((>= |count| 10)
             (|error| "too many evaluations in GCD code"))))))))
      #2# (EXIT #2#))))) 

(DEFUN |GENPGCD;gcdSameVariables!3| (|x| $$)
  (PROG (|lv| |lrr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
    (LETT |lrr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x| |lv| |lrr| (QREFELT $ 54)) (QREFELT $ 41)))))) 

(DEFUN |GENPGCD;gcdSameVariables!2| (|x| $$)
  (PROG (|lv| |lrr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
    (LETT |lrr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x| |lv| |lrr| (QREFELT $ 54)) (QREFELT $ 41)))))) 

(DEFUN |GENPGCD;gcdSameVariables!1| (|x| $$)
  (PROG (|lv| |lr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
    (LETT |lr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 54)) (QREFELT $ 41)))))) 

(DEFUN |GENPGCD;gcdSameVariables!0| (|x| $$)
  (PROG (|lv| |lr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;gcdSameVariables|))
    (LETT |lr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |x| |lv| |lr| (QREFELT $ 54)) (QREFELT $ 41)))))) 

(DEFUN |GENPGCD;lift| (|gR| |p| |cfR| |lv| |lr| $)
  (PROG (#1=#:G252 #2=#:G255 |pn| |cf| |g| |step| #3=#:G251 |Ecart| |n|
         |origFactors| |prime| |d| #4=#:G241 #5=#:G240 #6=#:G242 #7=#:G256 |c|
         |thisp| |r| |v| |lcp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |lcp| (SPADCALL |p| (QREFELT $ 51)) . #8=(|GENPGCD;lift|))
            (LETT |g|
                  (SPADCALL
                   (SPADCALL |lcp| (SPADCALL |gR| (QREFELT $ 56))
                             (QREFELT $ 63))
                   (SPADCALL (ELT $ 40) (SPADCALL |gR| (QREFELT $ 64))
                             (QREFELT $ 50))
                   (QREFELT $ 62))
                  . #8#)
            (LETT |cf|
                  (SPADCALL
                   (SPADCALL |lcp| (SPADCALL |cfR| (QREFELT $ 56))
                             (QREFELT $ 63))
                   (SPADCALL (ELT $ 40) (SPADCALL |cfR| (QREFELT $ 64))
                             (QREFELT $ 50))
                   (QREFELT $ 62))
                  . #8#)
            (LETT |p| (SPADCALL |lcp| |p| (QREFELT $ 61)) . #8#)
            (SEQ G190
                 (COND ((NULL (SPADCALL |lv| NIL (QREFELT $ 65))) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |v| (|SPADfirst| |lv|) . #8#)
                        (LETT |r| (|SPADfirst| |lr|) . #8#)
                        (LETT |lv| (CDR |lv|) . #8#)
                        (LETT |lr| (CDR |lr|) . #8#)
                        (LETT |thisp|
                              (SPADCALL
                               (CONS #'|GENPGCD;lift!0| (VECTOR $ |lr| |lv|))
                               |p| (QREFELT $ 67))
                              . #8#)
                        (LETT |d|
                              (PROGN
                               (LETT #4# NIL . #8#)
                               (SEQ (LETT |c| NIL . #8#)
                                    (LETT #7# (SPADCALL |p| (QREFELT $ 69))
                                          . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #7#)
                                          (PROGN
                                           (LETT |c| (CAR #7#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #6#
                                             (SPADCALL |c| |v| (QREFELT $ 70))
                                             . #8#)
                                       (COND
                                        (#4# (LETT #5# (MAX #5# #6#) . #8#))
                                        ('T
                                         (PROGN
                                          (LETT #5# #6# . #8#)
                                          (LETT #4# 'T . #8#)))))))
                                    (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#4# #5#) ('T (|IdentityError| '|max|))))
                              . #8#)
                        (LETT |prime|
                              (SPADCALL (SPADCALL |v| (QREFELT $ 71))
                                        (SPADCALL |r| (QREFELT $ 40))
                                        (QREFELT $ 72))
                              . #8#)
                        (LETT |pn| |prime| . #8#)
                        (LETT |origFactors| (LIST |g| |cf|) . #8#)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |n| 1 . #8#) G190
                               (COND ((|greater_SI| |n| |d|) (GO G191)))
                               (SEQ
                                (LETT |Ecart|
                                      (SPADCALL
                                       (SPADCALL |thisp|
                                                 (SPADCALL |g| |cf|
                                                           (QREFELT $ 24))
                                                 (QREFELT $ 31))
                                       |pn| (QREFELT $ 73))
                                      . #8#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |Ecart| 1)
                                   (|error|
                                    "failed lifting in hensel in Complex Polynomial GCD"))
                                  ((SPADCALL (QCDR |Ecart|) (QREFELT $ 12))
                                   (PROGN
                                    (LETT #3# |$NoValue| . #8#)
                                    (GO #3#)))
                                  ('T
                                   (SEQ
                                    (LETT |step|
                                          (SPADCALL |origFactors|
                                                    (SPADCALL
                                                     (CONS #'|GENPGCD;lift!1|
                                                           (VECTOR $ |r| |v|))
                                                     (QCDR |Ecart|)
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 77))
                                          . #8#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |step| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #8#)
                                        (GO #2#)))
                                      ('T
                                       (SEQ
                                        (LETT |g|
                                              (SPADCALL |g|
                                                        (SPADCALL |pn|
                                                                  (|SPADfirst|
                                                                   (QCDR
                                                                    |step|))
                                                                  (QREFELT $
                                                                           61))
                                                        (QREFELT $ 62))
                                              . #8#)
                                        (LETT |cf|
                                              (SPADCALL |cf|
                                                        (SPADCALL |pn|
                                                                  (SPADCALL
                                                                   (QCDR
                                                                    |step|)
                                                                   (QREFELT $
                                                                            79))
                                                                  (QREFELT $
                                                                           61))
                                                        (QREFELT $ 62))
                                              . #8#)
                                        (EXIT
                                         (LETT |pn|
                                               (SPADCALL |pn| |prime|
                                                         (QREFELT $ 80))
                                               . #8#)))))))))))
                               (LETT |n| (|inc_SI| |n|) . #8#) (GO G190) G191
                               (EXIT NIL)))
                         #3# (EXIT #3#))
                        (EXIT
                         (COND
                          ((SPADCALL |thisp| (SPADCALL |g| |cf| (QREFELT $ 24))
                                     (QREFELT $ 81))
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed") . #8#)
                                   (GO #2#))
                                  . #8#)
                            (GO #1#)))))))
                  #1# (EXIT #1#))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |g|))))
      #2# (EXIT #2#))))) 

(DEFUN |GENPGCD;lift!1| (|x| $$)
  (PROG (|v| |r| $)
    (LETT |v| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
    (LETT |r| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |v| |r| (QREFELT $ 74)))))) 

(DEFUN |GENPGCD;lift!0| (|x| $$)
  (PROG (|lv| |lr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;lift|))
    (LETT |lr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 54)))))) 

(DEFUN |GENPGCD;recursivelyGCDCoefficients| (|g| |v| |p| |pv| $)
  (PROG (#1=#:G262 |oldv| #2=#:G266 |oldg| |p1| |i| |d| #3=#:G258 #4=#:G257
         #5=#:G259 #6=#:G267 |u| |mv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mv| (|SPADfirst| |pv|)
              . #7=(|GENPGCD;recursivelyGCDCoefficients|))
        (LETT |pv| (CDR |pv|) . #7#)
        (LETT |d|
              (PROGN
               (LETT #3# NIL . #7#)
               (SEQ (LETT |u| NIL . #7#)
                    (LETT #6# (SPADCALL |p| (QREFELT $ 69)) . #7#) G190
                    (COND
                     ((OR (ATOM #6#) (PROGN (LETT |u| (CAR #6#) . #7#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #5# (SPADCALL |u| |mv| (QREFELT $ 70)) . #7#)
                       (COND (#3# (LETT #4# (MAX #4# #5#) . #7#))
                             ('T
                              (PROGN
                               (LETT #4# #5# . #7#)
                               (LETT #3# 'T . #7#)))))))
                    (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
               (COND (#3# #4#) ('T (|IdentityError| '|max|))))
              . #7#)
        (SEQ (LETT |i| 0 . #7#) G190 (COND ((|greater_SI| |i| |d|) (GO G191)))
             (SEQ
              (LETT |p1|
                    (SPADCALL
                     (CONS #'|GENPGCD;recursivelyGCDCoefficients!0|
                           (VECTOR $ |i| |mv|))
                     |p| (QREFELT $ 67))
                    . #7#)
              (LETT |oldg| |g| . #7#)
              (COND
               ((SPADCALL |pv| NIL (QREFELT $ 83))
                (LETT |g| (|GENPGCD;gcdSameVariables| |g| |p1| |v| $) . #7#))
               ('T
                (LETT |g|
                      (|GENPGCD;recursivelyGCDCoefficients| |p| |v| |p1| |pv|
                       $)
                      . #7#)))
              (EXIT
               (COND
                ((SPADCALL |g| (|spadConstant| $ 29) (QREFELT $ 30))
                 (PROGN (LETT #2# (|spadConstant| $ 29) . #7#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |g| |oldg| (QREFELT $ 81))
                     (PROGN
                      (LETT #1#
                            (SEQ (LETT |oldv| |v| . #7#)
                                 (LETT |v| (|GENPGCD;variables| |g| $) . #7#)
                                 (EXIT
                                  (LETT |pv|
                                        (SPADCALL |pv|
                                                  (SPADCALL |v| |oldv|
                                                            (QREFELT $ 26))
                                                  (QREFELT $ 84))
                                        . #7#)))
                            . #7#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT |g|)))
      #2# (EXIT #2#))))) 

(DEFUN |GENPGCD;recursivelyGCDCoefficients!0| (|x| $$)
  (PROG (|mv| |i| $)
    (LETT |mv| (QREFELT $$ 2) . #1=(|GENPGCD;recursivelyGCDCoefficients|))
    (LETT |i| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |mv| |i| (QREFELT $ 82)))))) 

(DEFUN |GENPGCD;flatten| (|p1| |lv| $)
  (PROG (|lr| #1=#:G278 |vv| #2=#:G277 |ans| |dg| #3=#:G276 #4=#:G275)
    (RETURN
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
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 37)) #4#)
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
                                        |p1| (QREFELT $ 67))
                                       . #5#)
                                 (QREFELT $ 18))
                                (QREFELT $ 32)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lr|
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |vv| NIL . #5#) (LETT #1# |lv| . #5#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |vv| (CAR #1#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS (SPADCALL (QREFELT $ 37)) #2#)
                                         . #5#)))
                                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           . #5#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))))))) 

(DEFUN |GENPGCD;flatten!0| (|x| $$)
  (PROG (|lv| |lr| $)
    (LETT |lv| (QREFELT $$ 2) . #1=(|GENPGCD;flatten|))
    (LETT |lr| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |lv| |lr| (QREFELT $ 54)))))) 

(DEFUN |GENPGCD;variables| (|p1| $)
  (PROG (#1=#:G280 #2=#:G279 #3=#:G281 #4=#:G283 |u|)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #1# NIL . #5=(|GENPGCD;variables|))
        (SEQ (LETT |u| NIL . #5#)
             (LETT #4# (SPADCALL |p1| (QREFELT $ 69)) . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (SPADCALL |u| (QREFELT $ 85)) . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 86)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|IdentityError| '|concat|))))
       (QREFELT $ 87)))))) 

(DEFUN |GENPGCD;gcdTrivial| (|p1| |p2| $)
  (PROG (|un?| |cp1|)
    (RETURN
     (SEQ
      (LETT |cp1| (SPADCALL |p1| (QREFELT $ 51)) . #1=(|GENPGCD;gcdTrivial|))
      (EXIT
       (COND
        ((SPADCALL |cp1| (|spadConstant| $ 28) (QREFELT $ 88))
         (|spadConstant| $ 29))
        ((EQL (SPADCALL |p2| (QREFELT $ 18)) 0)
         (SPADCALL
          (SPADCALL |cp1| (SPADCALL |p2| (QREFELT $ 51)) (QREFELT $ 52))
          (QREFELT $ 89)))
        (#2='T
         (SEQ (LETT |un?| (SPADCALL |cp1| (QREFELT $ 90)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((OR (SPADCALL |p2| (QREFELT $ 12)) |un?|) 'NIL)
                            ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |cp1|
                          (SPADCALL (SPADCALL |p2| (QREFELT $ 51)) |cp1|
                                    (QREFELT $ 52))
                          . #1#)
                    (LETT |un?| (SPADCALL |cp1| (QREFELT $ 90)) . #1#)
                    (EXIT (LETT |p2| (SPADCALL |p2| (QREFELT $ 91)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|un?| (|spadConstant| $ 29))
                     (#2# (SPADCALL |cp1| (QREFELT $ 89))))))))))))) 

(DEFUN |GENPGCD;monomContentSup| (|u| $)
  (PROG (|md|)
    (RETURN
     (SEQ
      (COND ((EQL (SPADCALL |u| (QREFELT $ 18)) 0) (|spadConstant| $ 29))
            ('T
             (SEQ
              (LETT |md| (SPADCALL |u| (QREFELT $ 92))
                    |GENPGCD;monomContentSup|)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (CONS (|function| |GENPGCD;better|) $)
                           (SPADCALL |u| (QREFELT $ 69)) (QREFELT $ 94))
                 (QREFELT $ 96))
                (SPADCALL (|spadConstant| $ 28) |md| (QREFELT $ 63))
                (QREFELT $ 61)))))))))) 

(DEFUN |GENPGCD;better| (|p1| |p2| $)
  (PROG (#1=#:G307)
    (RETURN
     (COND ((SPADCALL |p1| (QREFELT $ 97)) 'T)
           ((SPADCALL |p2| (QREFELT $ 97)) 'NIL)
           ('T
            (<
             (SPADCALL |p1|
                       (PROG2
                           (LETT #1# (SPADCALL |p1| (QREFELT $ 99))
                                 . #2=(|GENPGCD;better|))
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 70))
             (SPADCALL |p2|
                       (PROG2 (LETT #1# (SPADCALL |p2| (QREFELT $ 99)) . #2#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                       (QREFELT $ 70)))))))) 

(DECLAIM (NOTINLINE |GeneralPolynomialGcdPackage;|)) 

(DEFUN |GeneralPolynomialGcdPackage| (&REST #1=#:G312)
  (PROG ()
    (RETURN
     (PROG (#2=#:G313)
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
              (PROG1 (APPLY (|function| |GeneralPolynomialGcdPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GeneralPolynomialGcdPackage|))))))))))) 

(DEFUN |GeneralPolynomialGcdPackage;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|GeneralPolynomialGcdPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|GeneralPolynomialGcdPackage| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 100) . #1#)
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
         (QSETREFV $ 35 (|spadConstant| $ 34))
         (QSETREFV $ 37 (CONS (|dispatchFunction| |GENPGCD;randomR;R;2|) $))))
       ('T
        (QSETREFV $ 37 (CONS (|dispatchFunction| |GENPGCD;randomR;R;3|) $))))
      $)))) 

(MAKEPROP '|GeneralPolynomialGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|)
              (|SparseUnivariatePolynomial| 9) (0 . |zero?|) (5 . |Zero|)
              (9 . |Zero|) (13 . |Zero|) (17 . |Zero|) (|NonNegativeInteger|)
              (21 . |degree|) (|Union| $ '"failed") (26 . |exquo|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (32 . |unitNormal|) (37 . |gcd|) (43 . *) (|List| 7)
              (49 . |setDifference|) (55 . |One|) (59 . |One|) (63 . |One|)
              (67 . =) (73 . -) (79 . ~=) |GENPGCD;gcdPolynomial;3Sup;1|
              (85 . |init|) '|randomCount| (89 . |nextItem|) (94 . |randomR|)
              (|Integer|) (98 . |coerce|) (103 . |coerce|) (108 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 8 42)
              (113 . |map|) (|SparseUnivariatePolynomial| $)
              (119 . |gcdPolynomial|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 42 9 11)
              (125 . |map|) (131 . |leadingCoefficient|) (136 . |gcd|)
              (|List| 8) (142 . |eval|) (149 . |zero?|) (154 . |degree|)
              (159 . |exquo|) (165 . |gcd|) (171 . *) (177 . +) (183 . *)
              (189 . +) (195 . |monomial|) (201 . |reductum|) (206 . ~=)
              (|Mapping| 9 9) (212 . |map|) (|List| 9) (218 . |coefficients|)
              (223 . |degree|) (229 . |coerce|) (234 . -) (240 . |exquo|)
              (246 . |eval|) (|Union| 76 '"failed") (|List| 46)
              (253 . |solveLinearPolynomialEquation|) (|List| 11)
              (259 . |second|) (264 . *) (270 . ~=) (276 . |coefficient|)
              (283 . =) (289 . |setUnion|) (295 . |variables|) (300 . |concat|)
              (306 . |removeDuplicates|) (311 . =) (317 . |coerce|)
              (322 . |unit?|) (327 . |reductum|) (332 . |minimumDegree|)
              (|Mapping| 10 9 9) (337 . |sort|) (|List| $) (343 . |gcd|)
              (348 . |ground?|) (|Union| 7 '"failed") (353 . |mainVariable|))
           '#(|randomR| 358 |gcdPolynomial| 362) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 99
                                                 '(1 11 10 0 12 0 6 0 13 0 8 0
                                                   14 0 9 0 15 0 11 0 16 1 11
                                                   17 0 18 2 11 19 0 0 20 1 11
                                                   21 0 22 2 11 0 0 0 23 2 11 0
                                                   0 0 24 2 25 0 0 0 26 0 8 0
                                                   27 0 9 0 28 0 11 0 29 2 11
                                                   10 0 0 30 2 11 0 0 0 31 2 17
                                                   10 0 0 32 0 8 0 34 1 8 19 0
                                                   36 0 0 8 37 1 8 0 38 39 1 9
                                                   0 8 40 1 9 8 0 41 2 44 42 43
                                                   11 45 2 8 46 46 46 47 2 49
                                                   11 48 42 50 1 11 9 0 51 2 9
                                                   0 0 0 52 3 9 0 0 25 53 54 1
                                                   9 10 0 55 1 42 17 0 56 2 42
                                                   19 0 0 57 2 42 0 0 0 58 2 42
                                                   0 8 0 59 2 42 0 0 0 60 2 11
                                                   0 9 0 61 2 11 0 0 0 62 2 11
                                                   0 9 17 63 1 42 0 0 64 2 25
                                                   10 0 0 65 2 11 0 66 0 67 1
                                                   11 68 0 69 2 9 17 0 7 70 1 9
                                                   0 7 71 2 9 0 0 0 72 2 11 19
                                                   0 9 73 3 9 0 0 7 8 74 2 9 75
                                                   76 46 77 1 78 11 0 79 2 9 0
                                                   0 0 80 2 11 10 0 0 81 3 9 0
                                                   0 7 17 82 2 25 10 0 0 83 2
                                                   25 0 0 0 84 1 9 25 0 85 2 25
                                                   0 0 0 86 1 25 0 0 87 2 9 10
                                                   0 0 88 1 11 0 9 89 1 9 10 0
                                                   90 1 11 0 0 91 1 11 17 0 92
                                                   2 68 0 93 0 94 1 9 0 95 96 1
                                                   9 10 0 97 1 9 98 0 99 0 0 8
                                                   37 2 0 11 11 11 33)))))
           '|lookupComplete|)) 
