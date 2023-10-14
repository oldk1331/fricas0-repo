
(/VERSIONCHECK 2) 

(DEFUN |INTPAF;UPUP2F1| (|p| |t| |cf| |kx| |k| $)
  (|INTPAF;UPUP2F0| (SPADCALL |p| |t| |cf| (QREFELT $ 18)) |kx| |k| $)) 

(DEFUN |INTPAF;UPUP2F0| (|p| |kx| |k| $)
  (SPADCALL |p| |kx| (SPADCALL |k| (QREFELT $ 20)) (QREFELT $ 22))) 

(DEFUN |INTPAF;chv| (|f| |n| |a| |b| $)
  (SPADCALL (|INTPAF;chv0| |f| |n| |a| |b| $) (QREFELT $ 14) (QREFELT $ 24))) 

(DEFUN |INTPAF;RF2UPUP| (|f| |modulus| $)
  (PROG (|bc| #1=#:G196)
    (RETURN
     (SEQ
      (LETT |bc|
            (PROG2
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (CONS #'|INTPAF;RF2UPUP!0| $)
                                 (SPADCALL |f| (QREFELT $ 28)) (QREFELT $ 31))
                       |modulus| (|spadConstant| $ 33) (QREFELT $ 36))
                      . #2=(|INTPAF;RF2UPUP|))
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|Record|
                              (|:| |coef1|
                                   (|SparseUnivariatePolynomial|
                                    (|Fraction|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 7)))))
                              (|:| |coef2|
                                   (|SparseUnivariatePolynomial|
                                    (|Fraction|
                                     (|SparseUnivariatePolynomial|
                                      (QREFELT $ 7))))))
                             #1#))
            . #2#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL (CONS #'|INTPAF;RF2UPUP!1| $) (SPADCALL |f| (QREFELT $ 37))
                   (QREFELT $ 31))
         (QCAR |bc|) (QREFELT $ 38))
        |modulus| (QREFELT $ 39))))))) 

(DEFUN |INTPAF;RF2UPUP!1| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |INTPAF;RF2UPUP!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |INTPAF;linearInXIfCan| (|x| |y| $)
  (PROG (|xx| |p| |b| |a| |d| #1=#:G222 |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a|
              (LETT |b| (|spadConstant| $ 40) . #2=(|INTPAF;linearInXIfCan|))
              . #2#)
        (LETT |p|
              (SPADCALL
               (SPADCALL (SPADCALL |y| (QREFELT $ 42)) |x| (QREFELT $ 43))
               (QREFELT $ 45))
              . #2#)
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL
                   (LETT |q|
                         (SPADCALL (SPADCALL |p| (QREFELT $ 51))
                                   (QREFELT $ 37))
                         . #2#)
                   (QREFELT $ 53))
                  1 (QREFELT $ 54))
                 (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                ('T
                 (SEQ
                  (LETT |a|
                        (SPADCALL |a|
                                  (SPADCALL (SPADCALL |q| 1 (QREFELT $ 56))
                                            (LETT |d|
                                                  (SPADCALL |p| (QREFELT $ 57))
                                                  . #2#)
                                            (QREFELT $ 58))
                                  (QREFELT $ 59))
                        . #2#)
                  (LETT |b|
                        (SPADCALL |b|
                                  (SPADCALL (SPADCALL |q| 0 (QREFELT $ 56)) |d|
                                            (QREFELT $ 58))
                                  (QREFELT $ 60))
                        . #2#)
                  (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (LETT |xx| (SPADCALL |b| |a| (QREFELT $ 62)) . #2#)
        (EXIT
         (CONS 0
               (CONS
                (SPADCALL |xx| (SPADCALL (QREFELT $ 14) (QREFELT $ 20))
                          (QREFELT $ 64))
                (SPADCALL |xx| (ELT $ 65) (QREFELT $ 67)))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPAF;prootintegrate| (|f| |x| |y| $)
  (PROG (#1=#:G229 |r| |rf| |ff| |modulus| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |modulus|
              (SPADCALL
               (LETT |p| (SPADCALL |y| (QREFELT $ 42))
                     . #2=(|INTPAF;prootintegrate|))
               |x| (QREFELT $ 43))
              . #2#)
        (LETT |rf|
              (SPADCALL
               (LETT |ff| (SPADCALL |f| |x| |y| |p| (QREFELT $ 68)) . #2#)
               (QREFELT $ 61))
              . #2#)
        (SEQ (LETT |r| (SPADCALL |rf| (QREFELT $ 70)) . #2#)
             (EXIT
              (COND
               ((QEQCAR |r| 0)
                (COND
                 ((SPADCALL |rf| (|spadConstant| $ 48) (QREFELT $ 50))
                  (PROGN
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL
                           (CONS #'|INTPAF;prootintegrate!0| (VECTOR $ |x|))
                           (SPADCALL (QCDR |r|) (QREFELT $ 73)) (QREFELT $ 77))
                          (|INTPAF;prootintegrate1|
                           (SPADCALL |ff| (QREFELT $ 78)) |x| |y| |modulus| $)
                          (QREFELT $ 79))
                         . #2#)
                   (GO #1#))))))))
        (EXIT (|INTPAF;prootintegrate1| |ff| |x| |y| |modulus| $))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPAF;prootintegrate!0| (|f1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTPAF;prootintegrate|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |f1| (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 64)))))) 

(DEFUN |INTPAF;prootintegrate1| (|ff| |x| |y| |modulus| $)
  (PROG (|curve| #1=#:G251 |m| |u| |qprime| |q| |r| #2=#:G234 |cv| |vz| |vu|
         |newf| |ku| |kz| |newalg| |chv| |uu|)
    (RETURN
     (SEQ
      (LETT |r|
            (PROG2
                (LETT #2# (SPADCALL |modulus| (QREFELT $ 82))
                      . #3=(|INTPAF;prootintegrate1|))
                (QCDR #2#)
              (|check_union| (QEQCAR #2# 0)
                             (|Record|
                              (|:| |radicand|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))))
                              (|:| |deg| (|NonNegativeInteger|)))
                             #2#))
            . #3#)
      (LETT |uu| (|INTPAF;changeVarIfCan| |ff| (QCAR |r|) (QCDR |r|) $) . #3#)
      (EXIT
       (COND
        ((QEQCAR |uu| 0)
         (SEQ (LETT |chv| (QCDR |uu|) . #3#)
              (LETT |newalg|
                    (SPADCALL
                     (SPADCALL (QVELT |chv| 1)
                               (SPADCALL (QREFELT $ 14) (QREFELT $ 20))
                               (QREFELT $ 83))
                     (QVELT |chv| 4) (QREFELT $ 85))
                    . #3#)
              (LETT |kz|
                    (SPADCALL (SPADCALL |newalg| (QREFELT $ 87))
                              (QREFELT $ 89))
                    . #3#)
              (LETT |newf|
                    (SPADCALL (QVELT |chv| 0) (LETT |ku| (QREFELT $ 14) . #3#)
                              |newalg| (QREFELT $ 22))
                    . #3#)
              (LETT |vu|
                    (SPADCALL (QVELT |chv| 2) (SPADCALL |x| (QREFELT $ 20))
                              (QREFELT $ 83))
                    . #3#)
              (LETT |vz|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (QVELT |chv| 3) (SPADCALL |x| (QREFELT $ 20))
                                (QREFELT $ 64))
                      (SPADCALL |y| (QREFELT $ 20)) (QREFELT $ 90))
                     (SPADCALL (SPADCALL |newalg| (QREFELT $ 91))
                               (QREFELT $ 92))
                     (QREFELT $ 90))
                    . #3#)
              (EXIT
               (SPADCALL
                (CONS #'|INTPAF;prootintegrate1!0|
                      (VECTOR $ |vz| |vu| |kz| |ku|))
                (SPADCALL |newf| |ku| |kz| (QREFELT $ 96)) (QREFELT $ 99)))))
        ('T
         (SEQ
          (EXIT
           (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #3#)
                (LETT |r|
                      (PROG2
                          (LETT #2# (SPADCALL (QVELT |cv| 1) (QREFELT $ 82))
                                . #3#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0)
                                       (|Record|
                                        (|:| |radicand|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))))
                                        (|:| |deg| (|NonNegativeInteger|)))
                                       #2#))
                      . #3#)
                (LETT |qprime|
                      (SPADCALL
                       (SPADCALL
                        (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 102)) . #3#)
                        (QREFELT $ 65))
                       (QREFELT $ 27))
                      . #3#)
                (COND
                 ((NULL (SPADCALL |qprime| (QREFELT $ 103)))
                  (SEQ
                   (LETT |u|
                         (|INTPAF;chvarIfCan| (QVELT |cv| 0)
                          (|spadConstant| $ 104) |q|
                          (SPADCALL |qprime| (QREFELT $ 105)) $)
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (PROGN
                       (LETT #1#
                             (SEQ
                              (LETT |m|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 104)
                                               (QCDR |r|) (QREFELT $ 106))
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 27))
                                               (QREFELT $ 107))
                                     (QREFELT $ 108))
                                    . #3#)
                              (EXIT
                               (SPADCALL
                                (CONS #'|INTPAF;prootintegrate1!1|
                                      (VECTOR |y| |x| |cv| $ |m|))
                                (|INTPAF;rationalInt| (QCDR |u|) (QCDR |r|)
                                 (SPADCALL (|spadConstant| $ 55) 1
                                           (QREFELT $ 58))
                                 $)
                                (QREFELT $ 77))))
                             . #3#)
                       (GO #1#))))))))
                (LETT |curve|
                      (|RadicalFunctionField| (QREFELT $ 7)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))
                                              (|SparseUnivariatePolynomial|
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))))
                                              (SPADCALL |q| (QREFELT $ 27))
                                              (QCDR |r|))
                      . #3#)
                (EXIT
                 (|INTPAF;algaddx|
                  (SPADCALL
                   (CONS #'|INTPAF;prootintegrate1!2|
                         (VECTOR |y| |x| |cv| |curve| $))
                   (SPADCALL
                    (SPADCALL (QVELT |cv| 0)
                              (|compiledLookupCheck| '|reduce|
                                                     (LIST '$
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7))))))
                                                     |curve|))
                    (ELT $ 65)
                    (|compiledLookupCheck| '|palgintegrate|
                                           (LIST
                                            (LIST '|IntegrationResult|
                                                  (|devaluate| |curve|))
                                            (|devaluate| |curve|)
                                            (LIST '|Mapping|
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (|devaluate| (ELT $ 7)))
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (|devaluate| (ELT $ 7)))))
                                           (|AlgebraicIntegrate| (ELT $ 6)
                                                                 (ELT $ 7)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (ELT $ 7))
                                                                 (|SparseUnivariatePolynomial|
                                                                  (|Fraction|
                                                                   (|SparseUnivariatePolynomial|
                                                                    (ELT $
                                                                         7))))
                                                                 |curve|)))
                   (|compiledLookupCheck| '|map|
                                          (LIST
                                           (LIST '|IntegrationResult|
                                                 (|devaluate| (ELT $ 7)))
                                           (LIST '|Mapping|
                                                 (|devaluate| (ELT $ 7))
                                                 (|devaluate| |curve|))
                                           (LIST '|IntegrationResult|
                                                 (|devaluate| |curve|)))
                                          (|IntegrationResultFunctions2|
                                           |curve| (ELT $ 7))))
                  (SPADCALL |x| (QREFELT $ 20)) $))))
          #1# (EXIT #1#))))))))) 

(DEFUN |INTPAF;prootintegrate1!2| (|x1| $$)
  (PROG ($ |curve| |cv| |x| |y|)
    (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
    (LETT |curve| (QREFELT $$ 3) . #1#)
    (LETT |cv| (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|INTPAF;UPUP2F1|
       (SPADCALL |x1|
                 (|compiledLookupCheck| '|lift|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (LIST '|Fraction|
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate|
                                                       (ELT $ 7)))))
                                         '$)
                                        |curve|))
       (QVELT |cv| 2) (QVELT |cv| 3) |x| |y| $))))) 

(DEFUN |INTPAF;prootintegrate1!1| (|x1| $$)
  (PROG (|m| $ |cv| |x| |y|)
    (LETT |m| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |cv| (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|INTPAF;UPUP2F1| (|INTPAF;RF2UPUP| |x1| |m| $) (QVELT |cv| 2)
       (QVELT |cv| 3) |x| |y| $))))) 

(DEFUN |INTPAF;prootintegrate1!0| (|x1| $$)
  (PROG (|ku| |kz| |vu| |vz| $)
    (LETT |ku| (QREFELT $$ 4) . #1=(|INTPAF;prootintegrate1|))
    (LETT |kz| (QREFELT $$ 3) . #1#)
    (LETT |vu| (QREFELT $$ 2) . #1#)
    (LETT |vz| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x1| (LIST |ku| |kz|) (LIST |vu| |vz|) (QREFELT $ 95)))))) 

(DEFUN |INTPAF;rationalInt| (|f| |n| |g| $)
  (PROG (#1=#:G262 |a|)
    (RETURN
     (SEQ
      (COND
       ((NULL (EQL (SPADCALL |g| (QREFELT $ 53)) 1))
        (|error| "rationalInt: radicand must be linear"))
       ('T
        (SEQ
         (LETT |a| (SPADCALL |g| (QREFELT $ 109)) . #2=(|INTPAF;rationalInt|))
         (EXIT
          (SPADCALL
           (SPADCALL
            (SPADCALL |n|
                      (SPADCALL (SPADCALL |a| (QREFELT $ 110))
                                (PROG1 (LETT #1# (- |n| 1) . #2#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 58))
                      (QREFELT $ 111))
            (|INTPAF;chv| |f| |n| |a|
             (SPADCALL (SPADCALL |g| (QREFELT $ 112)) (QREFELT $ 109)) $)
            (QREFELT $ 113))
           (QREFELT $ 73)))))))))) 

(DEFUN |INTPAF;chv0| (|f| |n| |a| |b| $)
  (PROG (|d|)
    (RETURN
     (SEQ (LETT |d| (SPADCALL (QREFELT $ 14) (QREFELT $ 20)) |INTPAF;chv0|)
          (EXIT
           (SPADCALL
            (SPADCALL |f|
                      (SPADCALL (SPADCALL |d| (QREFELT $ 26)) (QREFELT $ 27))
                      (QREFELT $ 114))
            (SPADCALL
             (SPADCALL (SPADCALL |d| |n| (QREFELT $ 115)) |b| (QREFELT $ 116))
             |a| (QREFELT $ 117))
            (QREFELT $ 64))))))) 

(DEFUN |INTPAF;candidates| (|p| $)
  (PROG (|l| |u| |xi| #1=#:G276 |i|)
    (RETURN
     (SEQ (LETT |l| NIL . #2=(|INTPAF;candidates|))
          (EXIT
           (COND ((SPADCALL |p| (QREFELT $ 118)) |l|)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| 2 . #2#)
                        (LETT #1# (SPADCALL |p| (QREFELT $ 53)) . #2#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (LETT |u|
                               (SPADCALL |p|
                                         (LETT |xi|
                                               (SPADCALL (|spadConstant| $ 55)
                                                         |i| (QREFELT $ 58))
                                               . #2#)
                                         (QREFELT $ 120))
                               . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 0)
                            (LETT |l| (CONS (CONS (QCDR |u|) |xi|) |l|)
                                  . #2#)))))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (CONS
                     (CONS (SPADCALL (|spadConstant| $ 55) 1 (QREFELT $ 58))
                           |p|)
                     |l|)))))))))) 

(DEFUN |INTPAF;changeVarIfCan| (|p| |radi| |n| $)
  (PROG (#1=#:G287 #2=#:G289 |u| #3=#:G290 |cnd| |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec| (SPADCALL |radi| |n| (QREFELT $ 122))
              . #4=(|INTPAF;changeVarIfCan|))
        (SEQ
         (EXIT
          (SEQ (LETT |cnd| NIL . #4#)
               (LETT #3# (|INTPAF;candidates| (QVELT |rec| 2) $) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |cnd| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |u|
                      (|INTPAF;chvarIfCan| |p| (QVELT |rec| 1) (QCDR |cnd|)
                       (SPADCALL
                        (SPADCALL (SPADCALL (QCDR |cnd|) (QREFELT $ 65))
                                  (QREFELT $ 27))
                        (QREFELT $ 105))
                       $)
                      . #4#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2#
                                 (CONS 0
                                       (VECTOR (QCDR |u|) (QCAR |cnd|)
                                               (QCDR |cnd|) (QVELT |rec| 1)
                                               (QVELT |rec| 0)))
                                 . #4#)
                           (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |INTPAF;chvarIfCan| (|p| |d| |u| |u1| $)
  (PROG (|ans| #1=#:G301 |v|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| (|spadConstant| $ 48) . #2=(|INTPAF;chvarIfCan|))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 50)))
                   (GO G191)))
                 (SEQ
                  (LETT |v|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |u1| (SPADCALL |p| (QREFELT $ 51))
                                    (QREFELT $ 123))
                          (SPADCALL |d| (SPADCALL |p| (QREFELT $ 57))
                                    (QREFELT $ 124))
                          (QREFELT $ 125))
                         |u| (QREFELT $ 127))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |v| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                    ('T
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL (QCDR |v|)
                                                (SPADCALL |p| (QREFELT $ 57))
                                                (QREFELT $ 106))
                                      (QREFELT $ 128))
                            . #2#)
                      (EXIT
                       (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPAF;algaddx| (|i| |xx| $)
  (PROG (#1=#:G308 |ne| #2=#:G307)
    (RETURN
     (SEQ
      (COND ((SPADCALL |i| (QREFELT $ 129)) |i|)
            ('T
             (SPADCALL (SPADCALL |i| (QREFELT $ 130))
                       (SPADCALL |i| (QREFELT $ 133))
                       (PROGN
                        (LETT #2# NIL . #3=(|INTPAF;algaddx|))
                        (SEQ (LETT |ne| NIL . #3#)
                             (LETT #1# (SPADCALL |i| (QREFELT $ 136)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ne| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (QCAR |ne|)
                                                  (SPADCALL |xx| 2
                                                            (QREFELT $ 138))
                                                  (QREFELT $ 117))
                                        (QREFELT $ 139))
                                       |xx|)
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 140)))))))) 

(DEFUN |INTPAF;prootRDE| (|nfp| |f| |g| |x| |k| |rde| $)
  (PROG (#1=#:G328 |rc| |curve| #2=#:G331 |u| #3=#:G321 |ug| |gg| |uf| |ff|
         |dqdx| |q| |rec| |r| #4=#:G314 |modulus| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |modulus|
              (SPADCALL
               (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                     . #5=(|INTPAF;prootRDE|))
               |x| (QREFELT $ 43))
              . #5#)
        (LETT |r|
              (PROG2 (LETT #4# (SPADCALL |modulus| (QREFELT $ 82)) . #5#)
                  (QCDR #4#)
                (|check_union| (QEQCAR #4# 0)
                               (|Record|
                                (|:| |radicand|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))))
                                (|:| |deg| (|NonNegativeInteger|)))
                               #4#))
              . #5#)
        (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122)) . #5#)
        (LETT |dqdx|
              (SPADCALL
               (SPADCALL
                (SPADCALL (LETT |q| (QVELT |rec| 2) . #5#) (QREFELT $ 65))
                (QREFELT $ 27))
               (QREFELT $ 105))
              . #5#)
        (SEQ
         (LETT |uf|
               (|INTPAF;chvarIfCan|
                (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) . #5#)
                (QVELT |rec| 1) |q| (|spadConstant| $ 104) $)
               . #5#)
         (EXIT
          (COND
           ((QEQCAR |uf| 0)
            (SEQ
             (LETT |ug|
                   (|INTPAF;chvarIfCan|
                    (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #5#)
                    (QVELT |rec| 1) |q| |dqdx| $)
                   . #5#)
             (EXIT
              (COND
               ((QEQCAR |ug| 0)
                (PROGN
                 (LETT #2#
                       (SEQ
                        (LETT |u|
                              (SPADCALL
                               (|INTPAF;chv0| (QCDR |uf|) (QVELT |rec| 0)
                                (|spadConstant| $ 55) (|spadConstant| $ 47) $)
                               (SPADCALL
                                (SPADCALL (QVELT |rec| 0)
                                          (SPADCALL
                                           (SPADCALL (QREFELT $ 14)
                                                     (QREFELT $ 20))
                                           (* (QVELT |rec| 0)
                                              (- (QVELT |rec| 0) 1))
                                           (QREFELT $ 141))
                                          (QREFELT $ 142))
                                (|INTPAF;chv0| (QCDR |ug|) (QVELT |rec| 0)
                                 (|spadConstant| $ 55) (|spadConstant| $ 47) $)
                                (QREFELT $ 90))
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL (QREFELT $ 14)
                                                   (QREFELT $ 144))
                                         . #5#)
                                   (QCDR #3#)
                                 (|check_union| (QEQCAR #3# 0) (|Symbol|) #3#))
                               |rde|)
                              . #5#)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                               (#6='T
                                (CONS 0
                                      (SPADCALL (QCDR |u|) (QREFELT $ 14)
                                                (SPADCALL |k| (QREFELT $ 20))
                                                (QREFELT $ 145)))))))
                       . #5#)
                 (GO #2#))))))))))
        (EXIT
         (COND
          ((SPADCALL (QVELT |rec| 1) (|spadConstant| $ 104) (QREFELT $ 146))
           (SEQ
            (LETT |curve|
                  (|RadicalFunctionField| (QREFELT $ 7)
                                          (|SparseUnivariatePolynomial|
                                           (QREFELT $ 7))
                                          (|SparseUnivariatePolynomial|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                          (SPADCALL |q| (QREFELT $ 27))
                                          (QVELT |rec| 0))
                  . #5#)
            (LETT |rc|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (|compiledLookupCheck| 'D (LIST '$)
                                            (|LinearOrdinaryDifferentialOperator1|
                                             |curve|)))
                    (SPADCALL
                     (SPADCALL (SPADCALL |nfp| |x| |k| |p| (QREFELT $ 68))
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '$
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                      |curve|))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST '$ (|devaluate| |curve|))
                                            (|LinearOrdinaryDifferentialOperator1|
                                             |curve|)))
                    (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                           (|LinearOrdinaryDifferentialOperator1|
                                            |curve|)))
                   (SPADCALL (SPADCALL |g| |x| |k| |p| (QREFELT $ 68))
                             (|compiledLookupCheck| '|reduce|
                                                    (LIST '$
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (LIST '|Fraction|
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        7))))))
                                                    |curve|))
                   (|compiledLookupCheck| '|algDsolve|
                                          (LIST
                                           (LIST '|Record|
                                                 (LIST '|:| '|particular|
                                                       (LIST '|Union|
                                                             (|devaluate|
                                                              |curve|)
                                                             '"failed"))
                                                 (LIST '|:| '|basis|
                                                       (LIST '|List|
                                                             (|devaluate|
                                                              |curve|))))
                                           (LIST
                                            '|LinearOrdinaryDifferentialOperator1|
                                            (|devaluate| |curve|))
                                           (|devaluate| |curve|))
                                          (|PureAlgebraicLODE| (ELT $ 7)
                                                               (|SparseUnivariatePolynomial|
                                                                (ELT $ 7))
                                                               (|SparseUnivariatePolynomial|
                                                                (|Fraction|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (ELT $ 7))))
                                                               |curve|)))
                  . #5#)
            (EXIT
             (COND ((QEQCAR (QCAR |rc|) 1) (CONS 1 "failed"))
                   (#6#
                    (CONS 0
                          (|INTPAF;UPUP2F0|
                           (SPADCALL
                            (PROG2 (LETT #1# (QCAR |rc|) . #5#)
                                (QCDR #1#)
                              (|check_union| (QEQCAR #1# 0) |curve| #1#))
                            (|compiledLookupCheck| '|lift|
                                                   (LIST
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (LIST '|Fraction|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 7)))))
                                                    '$)
                                                   |curve|))
                           |x| |k| $)))))))
          (#6# (|INTPAF;palgRDE1| |nfp| |g| |x| |k| $))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTPAF;prootlimint| (|f| |x| |k| |lu| $)
  (PROG (|ui| |curve| |dqdx| |q| |r| #1=#:G339 |cv| |m| |l| |v| |uu| #2=#:G376
         |u| |n| #3=#:G357 |uf| |ff| |rec| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |modulus|
            (SPADCALL
             (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                   . #4=(|INTPAF;prootlimint|))
             |x| (QREFELT $ 43))
            . #4#)
      (LETT |r|
            (PROG2 (LETT #1# (SPADCALL |modulus| (QREFELT $ 82)) . #4#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0)
                             (|Record|
                              (|:| |radicand|
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial|
                                     (QREFELT $ 7))))
                              (|:| |deg| (|NonNegativeInteger|)))
                             #1#))
            . #4#)
      (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122)) . #4#)
      (LETT |dqdx|
            (SPADCALL
             (SPADCALL
              (SPADCALL (LETT |q| (QVELT |rec| 2) . #4#) (QREFELT $ 65))
              (QREFELT $ 27))
             (QREFELT $ 105))
            . #4#)
      (LETT |uf|
            (|INTPAF;chvarIfCan|
             (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) . #4#)
             (QVELT |rec| 1) |q| |dqdx| $)
            . #4#)
      (EXIT
       (COND
        ((QEQCAR |uf| 0)
         (SEQ (LETT |l| NIL . #4#)
              (LETT |n|
                    (SPADCALL (QVELT |rec| 0)
                              (SPADCALL (|spadConstant| $ 55)
                                        (PROG1
                                            (LETT #3# (- (QVELT |rec| 0) 1)
                                                  . #4#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        (QREFELT $ 58))
                              (QREFELT $ 147))
                    . #4#)
              (SEQ (LETT |u| NIL . #4#) (LETT #2# |lu| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |v|
                          (|INTPAF;chvarIfCan|
                           (LETT |uu| (SPADCALL |u| |x| |k| |p| (QREFELT $ 68))
                                 . #4#)
                           (QVELT |rec| 1) |q| |dqdx| $)
                          . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |v| 0)
                       (LETT |l|
                             (CONS
                              (SPADCALL |n|
                                        (|INTPAF;chv| (QCDR |v|)
                                         (QVELT |rec| 0) (|spadConstant| $ 55)
                                         (|spadConstant| $ 47) $)
                                        (QREFELT $ 113))
                              |l|)
                             . #4#))
                      ('T
                       (|error| #5="failed - cannot handle that integrand")))))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 104) (QVELT |rec| 0)
                               (QREFELT $ 106))
                     (SPADCALL (SPADCALL |q| (QREFELT $ 27)) (QREFELT $ 107))
                     (QREFELT $ 108))
                    . #4#)
              (EXIT
               (SPADCALL (CONS #'|INTPAF;prootlimint!0| (VECTOR |k| |x| $ |m|))
                         (SPADCALL
                          (SPADCALL |n|
                                    (|INTPAF;chv| (QCDR |uf|) (QVELT |rec| 0)
                                     (|spadConstant| $ 55)
                                     (|spadConstant| $ 47) $)
                                    (QREFELT $ 113))
                          (NREVERSE |l|) (QREFELT $ 152))
                         (QREFELT $ 156)))))
        (#6='T
         (SEQ (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #4#)
              (LETT |r|
                    (PROG2
                        (LETT #1# (SPADCALL (QVELT |cv| 1) (QREFELT $ 82))
                              . #4#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|Record|
                                      (|:| |radicand|
                                           (|Fraction|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))))
                                      (|:| |deg| (|NonNegativeInteger|)))
                                     #1#))
                    . #4#)
              (LETT |dqdx|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (LETT |q| (SPADCALL (QCAR |r|) (QREFELT $ 102)) . #4#)
                       (QREFELT $ 65))
                      (QREFELT $ 27))
                     (QREFELT $ 105))
                    . #4#)
              (LETT |curve|
                    (|RadicalFunctionField| (QREFELT $ 7)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT $ 7))
                                            (|SparseUnivariatePolynomial|
                                             (|Fraction|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT $ 7))))
                                            (SPADCALL |q| (QREFELT $ 27))
                                            (QCDR |r|))
                    . #4#)
              (LETT |ui|
                    (SPADCALL
                     (SPADCALL (QVELT |cv| 0)
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '$
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                      |curve|))
                     (ELT $ 65)
                     (|compiledLookupCheck| '|palginfieldint|
                                            (LIST
                                             (LIST '|Union|
                                                   (|devaluate| |curve|)
                                                   '"failed")
                                             (|devaluate| |curve|)
                                             (LIST '|Mapping|
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| (ELT $ 7)))
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| (ELT $ 7)))))
                                            (|AlgebraicIntegrate| (ELT $ 6)
                                                                  (ELT $ 7)
                                                                  (|SparseUnivariatePolynomial|
                                                                   (ELT $ 7))
                                                                  (|SparseUnivariatePolynomial|
                                                                   (|Fraction|
                                                                    (|SparseUnivariatePolynomial|
                                                                     (ELT $
                                                                          7))))
                                                                  |curve|)))
                    . #4#)
              (EXIT
               (COND
                ((QEQCAR |ui| 1)
                 (COND ((NULL |lu|) (CONS 1 "failed")) (#6# (|error| #5#))))
                (#6#
                 (CONS 0
                       (CONS
                        (|INTPAF;UPUP2F1|
                         (SPADCALL (QCDR |ui|)
                                   (|compiledLookupCheck| '|lift|
                                                          (LIST
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7)))))
                                                           '$)
                                                          |curve|))
                         (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                        NIL))))))))))))) 

(DEFUN |INTPAF;prootlimint!0| (|x1| $$)
  (PROG (|m| $ |x| |k|)
    (LETT |m| (QREFELT $$ 3) . #1=(|INTPAF;prootlimint|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|INTPAF;UPUP2F0| (|INTPAF;RF2UPUP| |x1| |m| $) |x| |k| $))))) 

(DEFUN |INTPAF;prootextint| (|f| |x| |k| |g| $)
  (PROG (|uc| |ur| |u| |curve| |r| #1=#:G383 |g1| |cv| #2=#:G417 |n| #3=#:G401
         |m| |ug| |gg| |uf| |ff| |dqdx| |q| |rec| |modulus| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |modulus|
              (SPADCALL
               (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                     . #4=(|INTPAF;prootextint|))
               |x| (QREFELT $ 43))
              . #4#)
        (LETT |r|
              (PROG2 (LETT #1# (SPADCALL |modulus| (QREFELT $ 82)) . #4#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0)
                               (|Record|
                                (|:| |radicand|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))))
                                (|:| |deg| (|NonNegativeInteger|)))
                               #1#))
              . #4#)
        (LETT |rec| (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 122)) . #4#)
        (LETT |dqdx|
              (SPADCALL
               (SPADCALL
                (SPADCALL (LETT |q| (QVELT |rec| 2) . #4#) (QREFELT $ 65))
                (QREFELT $ 27))
               (QREFELT $ 105))
              . #4#)
        (SEQ
         (LETT |uf|
               (|INTPAF;chvarIfCan|
                (LETT |ff| (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) . #4#)
                (QVELT |rec| 1) |q| |dqdx| $)
               . #4#)
         (EXIT
          (COND
           ((QEQCAR |uf| 0)
            (SEQ
             (LETT |ug|
                   (|INTPAF;chvarIfCan|
                    (LETT |gg| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #4#)
                    (QVELT |rec| 1) |q| |dqdx| $)
                   . #4#)
             (EXIT
              (COND
               ((QEQCAR |ug| 0)
                (PROGN
                 (LETT #2#
                       (SEQ
                        (LETT |m|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 104) (QVELT |rec| 0)
                                         (QREFELT $ 106))
                               (SPADCALL (SPADCALL |q| (QREFELT $ 27))
                                         (QREFELT $ 107))
                               (QREFELT $ 108))
                              . #4#)
                        (LETT |n|
                              (SPADCALL (QVELT |rec| 0)
                                        (SPADCALL (|spadConstant| $ 55)
                                                  (PROG1
                                                      (LETT #3#
                                                            (- (QVELT |rec| 0)
                                                               1)
                                                            . #4#)
                                                    (|check_subtype| (>= #3# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #3#))
                                                  (QREFELT $ 58))
                                        (QREFELT $ 147))
                              . #4#)
                        (EXIT
                         (SPADCALL
                          (CONS #'|INTPAF;prootextint!0|
                                (VECTOR |k| |x| $ |m|))
                          (SPADCALL
                           (SPADCALL |n|
                                     (|INTPAF;chv| (QCDR |uf|) (QVELT |rec| 0)
                                      (|spadConstant| $ 55)
                                      (|spadConstant| $ 47) $)
                                     (QREFELT $ 113))
                           (SPADCALL |n|
                                     (|INTPAF;chv| (QCDR |ug|) (QVELT |rec| 0)
                                      (|spadConstant| $ 55)
                                      (|spadConstant| $ 47) $)
                                     (QREFELT $ 113))
                           (QREFELT $ 159))
                          (QREFELT $ 162))))
                       . #4#)
                 (GO #2#))))))))))
        (LETT |cv| (SPADCALL |ff| |modulus| (QREFELT $ 101)) . #4#)
        (LETT |g1| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #4#)
        (LETT |r|
              (PROG2 (LETT #1# (SPADCALL (QVELT |cv| 1) (QREFELT $ 82)) . #4#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0)
                               (|Record|
                                (|:| |radicand|
                                     (|Fraction|
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))))
                                (|:| |deg| (|NonNegativeInteger|)))
                               #1#))
              . #4#)
        (LETT |curve|
              (|RadicalFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      (SPADCALL |q| (QREFELT $ 27)) (QCDR |r|))
              . #4#)
        (LETT |u|
              (SPADCALL
               (SPADCALL (QVELT |cv| 0)
                         (|compiledLookupCheck| '|reduce|
                                                (LIST '$
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate|
                                                               (ELT $ 7))))))
                                                |curve|))
               (ELT $ 65) |g1| (QVELT |cv| 2) (QVELT |cv| 3)
               (|compiledLookupCheck| '|palgextintegrate|
                                      (LIST
                                       (LIST '|Union|
                                             (LIST '|Record|
                                                   (LIST '|:| '|ratpart|
                                                         (|devaluate| |curve|))
                                                   (LIST '|:| '|coeff|
                                                         (|devaluate|
                                                          (ELT $ 7))))
                                             '"failed")
                                       (|devaluate| |curve|)
                                       (LIST '|Mapping|
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7)))
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7))))
                                       (LIST '|SparseUnivariatePolynomial|
                                             (LIST '|Fraction|
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| (ELT $ 7)))))
                                       (LIST '|Fraction|
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7))))
                                       (LIST '|Fraction|
                                             (LIST
                                              '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7)))))
                                      (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT $ 7))
                                                            (|SparseUnivariatePolynomial|
                                                             (|Fraction|
                                                              (|SparseUnivariatePolynomial|
                                                               (ELT $ 7))))
                                                            |curve|)))
              . #4#)
        (EXIT
         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
               ('T
                (SEQ (LETT |ur| (QCAR (QCDR |u|)) . #4#)
                     (LETT |uc| (QCDR (QCDR |u|)) . #4#)
                     (EXIT
                      (CONS 0
                            (CONS
                             (|INTPAF;UPUP2F1|
                              (SPADCALL |ur|
                                        (|compiledLookupCheck| '|lift|
                                                               (LIST
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (LIST
                                                                  '|Fraction|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         7)))))
                                                                '$)
                                                               |curve|))
                              (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                             |uc|)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |INTPAF;prootextint!0| (|x1| $$)
  (PROG (|m| $ |x| |k|)
    (LETT |m| (QREFELT $$ 3) . #1=(|INTPAF;prootextint|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (|INTPAF;UPUP2F0| (|INTPAF;RF2UPUP| |x1| |m| $) |x| |k| $))))) 

(DEFUN |INTPAF;palgRDE1| (|nfp| |g| |x| |y| $)
  (PROG (#1=#:G423)
    (RETURN
     (QCAR
      (|INTPAF;palgLODE1| (LIST |nfp| (|spadConstant| $ 55)) |g| |x| |y|
       (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 144)) |INTPAF;palgRDE1|)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
       $))))) 

(DEFUN |INTPAF;palgLODE1| (|eq| |g| |kx| |y| |x| $)
  (PROG (#1=#:G451 |h| #2=#:G450 |rec| #3=#:G437 |bas| #4=#:G449 #5=#:G448
         |neq| #6=#:G447 |f| |i| |curve| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |modulus|
            (SPADCALL
             (LETT |p| (SPADCALL |y| (QREFELT $ 42)) . #7=(|INTPAF;palgLODE1|))
             |kx| (QREFELT $ 43))
            . #7#)
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      |modulus|)
            . #7#)
      (LETT |neq|
            (SPADCALL
             (|compiledLookupCheck| '|Zero| (LIST '$)
                                    (|LinearOrdinaryDifferentialOperator1|
                                     |curve|)))
            . #7#)
      (SEQ (LETT |i| 0 . #7#) (LETT |f| NIL . #7#) (LETT #6# |eq| . #7#) G190
           (COND
            ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #7#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |neq|
                   (SPADCALL |neq|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |f| |kx| |y| |p| (QREFELT $ 68))
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '$
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                      |curve|))
                              |i|
                              (|compiledLookupCheck| '|monomial|
                                                     (LIST '$
                                                           (|devaluate|
                                                            |curve|)
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     (|LinearOrdinaryDifferentialOperator1|
                                                      |curve|)))
                             (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                    (|LinearOrdinaryDifferentialOperator1|
                                                     |curve|)))
                   . #7#)))
           (LETT #6# (PROG1 (CDR #6#) (LETT |i| (|inc_SI| |i|) . #7#)) . #7#)
           (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((NULL
          (SPADCALL |y|
                    (SPADCALL |kx|
                              (SPADCALL (SPADCALL |g| (QREFELT $ 163)) |x|
                                        (QREFELT $ 166))
                              (QREFELT $ 167))
                    (QREFELT $ 167)))
         (SEQ
          (LETT |rec|
                (SPADCALL |neq|
                          (SPADCALL (SPADCALL |g| |kx| |y| |p| (QREFELT $ 68))
                                    (|compiledLookupCheck| '|reduce|
                                                           (LIST '$
                                                                 (LIST
                                                                  '|SparseUnivariatePolynomial|
                                                                  (LIST
                                                                   '|Fraction|
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (|devaluate|
                                                                     (ELT $
                                                                          7))))))
                                                           |curve|))
                          (|compiledLookupCheck| '|algDsolve|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:|
                                                              '|particular|
                                                              (LIST '|Union|
                                                                    (|devaluate|
                                                                     |curve|)
                                                                    '#8="failed"))
                                                        (LIST '|:| '|basis|
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |curve|))))
                                                  (LIST
                                                   '|LinearOrdinaryDifferentialOperator1|
                                                   (|devaluate| |curve|))
                                                  (|devaluate| |curve|))
                                                 (|PureAlgebraicLODE| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SparseUnivariatePolynomial|
                                                                       (|Fraction|
                                                                        (|SparseUnivariatePolynomial|
                                                                         (ELT $
                                                                              7))))
                                                                      |curve|)))
                . #7#)
          (LETT |bas|
                (PROGN
                 (LETT #5# NIL . #7#)
                 (SEQ (LETT |h| NIL . #7#) (LETT #4# (QCDR |rec|) . #7#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (|INTPAF;UPUP2F0|
                                (SPADCALL |h|
                                          (|compiledLookupCheck| '|lift|
                                                                 (LIST
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (LIST
                                                                    '|Fraction|
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           7)))))
                                                                  '$)
                                                                 |curve|))
                                |kx| |y| $)
                               #5#)
                              . #7#)))
                      (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #7#)
          (EXIT
           (COND ((QEQCAR (QCAR |rec|) 1) (CONS (CONS 1 "failed") |bas|))
                 (#9='T
                  (CONS
                   (CONS 0
                         (|INTPAF;UPUP2F0|
                          (SPADCALL
                           (PROG2 (LETT #3# (QCAR |rec|) . #7#)
                               (QCDR #3#)
                             (|check_union| (QEQCAR #3# 0) |curve| #3#))
                           (|compiledLookupCheck| '|lift|
                                                  (LIST
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (LIST '|Fraction|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate|
                                                            (ELT $ 7)))))
                                                   '$)
                                                  |curve|))
                          |kx| |y| $))
                   |bas|))))))
        (#9#
         (SEQ
          (LETT |rec|
                (SPADCALL |neq|
                          (SPADCALL
                           (|compiledLookupCheck| '|Zero| (LIST '$) |curve|))
                          (|compiledLookupCheck| '|algDsolve|
                                                 (LIST
                                                  (LIST '|Record|
                                                        (LIST '|:|
                                                              '|particular|
                                                              (LIST '|Union|
                                                                    (|devaluate|
                                                                     |curve|)
                                                                    '#8#))
                                                        (LIST '|:| '|basis|
                                                              (LIST '|List|
                                                                    (|devaluate|
                                                                     |curve|))))
                                                  (LIST
                                                   '|LinearOrdinaryDifferentialOperator1|
                                                   (|devaluate| |curve|))
                                                  (|devaluate| |curve|))
                                                 (|PureAlgebraicLODE| (ELT $ 7)
                                                                      (|SparseUnivariatePolynomial|
                                                                       (ELT $
                                                                            7))
                                                                      (|SparseUnivariatePolynomial|
                                                                       (|Fraction|
                                                                        (|SparseUnivariatePolynomial|
                                                                         (ELT $
                                                                              7))))
                                                                      |curve|)))
                . #7#)
          (EXIT
           (CONS (CONS 1 "failed")
                 (PROGN
                  (LETT #2# NIL . #7#)
                  (SEQ (LETT |h| NIL . #7#) (LETT #1# (QCDR |rec|) . #7#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|INTPAF;UPUP2F0|
                                 (SPADCALL |h|
                                           (|compiledLookupCheck| '|lift|
                                                                  (LIST
                                                                   (LIST
                                                                    '|SparseUnivariatePolynomial|
                                                                    (LIST
                                                                     '|Fraction|
                                                                     (LIST
                                                                      '|SparseUnivariatePolynomial|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))))
                                                                   '$)
                                                                  |curve|))
                                 |kx| |y| $)
                                #2#)
                               . #7#)))
                       (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))))))))))) 

(DEFUN |INTPAF;palgintegrate| (|f| |x| |k| $)
  (PROG (|curve| |cv| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |modulus|
            (SPADCALL
             (LETT |p| (SPADCALL |k| (QREFELT $ 42))
                   . #1=(|INTPAF;palgintegrate|))
             |x| (QREFELT $ 43))
            . #1#)
      (LETT |cv|
            (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                      (QREFELT $ 101))
            . #1#)
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      (QVELT |cv| 1))
            . #1#)
      (SPADCALL (QVELT |cv| 4)
                (|compiledLookupCheck| '|knownInfBasis|
                                       (LIST (LIST '|Void|)
                                             (LIST '|NonNegativeInteger|))
                                       |curve|))
      (EXIT
       (|INTPAF;algaddx|
        (SPADCALL
         (CONS #'|INTPAF;palgintegrate!0| (VECTOR |k| |x| |cv| |curve| $))
         (SPADCALL
          (SPADCALL (QVELT |cv| 0)
                    (|compiledLookupCheck| '|reduce|
                                           (LIST '$
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (LIST '|Fraction|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT $ 7))))))
                                           |curve|))
          (ELT $ 65)
          (|compiledLookupCheck| '|palgintegrate|
                                 (LIST
                                  (LIST '|IntegrationResult|
                                        (|devaluate| |curve|))
                                  (|devaluate| |curve|)
                                  (LIST '|Mapping|
                                        (LIST '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7)))
                                        (LIST '|SparseUnivariatePolynomial|
                                              (|devaluate| (ELT $ 7)))))
                                 (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                       (|SparseUnivariatePolynomial|
                                                        (ELT $ 7))
                                                       (|SparseUnivariatePolynomial|
                                                        (|Fraction|
                                                         (|SparseUnivariatePolynomial|
                                                          (ELT $ 7))))
                                                       |curve|)))
         (|compiledLookupCheck| '|map|
                                (LIST
                                 (LIST '|IntegrationResult|
                                       (|devaluate| (ELT $ 7)))
                                 (LIST '|Mapping| (|devaluate| (ELT $ 7))
                                       (|devaluate| |curve|))
                                 (LIST '|IntegrationResult|
                                       (|devaluate| |curve|)))
                                (|IntegrationResultFunctions2| |curve|
                                                               (ELT $ 7))))
        (SPADCALL |x| (QREFELT $ 20)) $)))))) 

(DEFUN |INTPAF;palgintegrate!0| (|x1| $$)
  (PROG ($ |curve| |cv| |x| |k|)
    (LETT $ (QREFELT $$ 4) . #1=(|INTPAF;palgintegrate|))
    (LETT |curve| (QREFELT $$ 3) . #1#)
    (LETT |cv| (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |k| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|INTPAF;UPUP2F1|
       (SPADCALL |x1|
                 (|compiledLookupCheck| '|lift|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (LIST '|Fraction|
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate|
                                                       (ELT $ 7)))))
                                         '$)
                                        |curve|))
       (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $))))) 

(DEFUN |INTPAF;palglim| (|f| |x| |k| |lu| $)
  (PROG (|u| |curve| |cv| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |modulus|
            (SPADCALL
             (LETT |p| (SPADCALL |k| (QREFELT $ 42)) . #1=(|INTPAF;palglim|))
             |x| (QREFELT $ 43))
            . #1#)
      (LETT |cv|
            (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                      (QREFELT $ 101))
            . #1#)
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      (QVELT |cv| 1))
            . #1#)
      (SPADCALL (QVELT |cv| 4)
                (|compiledLookupCheck| '|knownInfBasis|
                                       (LIST (LIST '|Void|)
                                             (LIST '|NonNegativeInteger|))
                                       |curve|))
      (LETT |u|
            (SPADCALL
             (SPADCALL (QVELT |cv| 0)
                       (|compiledLookupCheck| '|reduce|
                                              (LIST '$
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (LIST '|Fraction|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 7))))))
                                              |curve|))
             (ELT $ 65)
             (|compiledLookupCheck| '|palginfieldint|
                                    (LIST
                                     (LIST '|Union| (|devaluate| |curve|)
                                           '"failed")
                                     (|devaluate| |curve|)
                                     (LIST '|Mapping|
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7)))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7)))))
                                    (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                          (|SparseUnivariatePolynomial|
                                                           (ELT $ 7))
                                                          (|SparseUnivariatePolynomial|
                                                           (|Fraction|
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT $ 7))))
                                                          |curve|)))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (|error| "failed - cannot handle that integrand"))
             ('T
              (CONS 0
                    (CONS
                     (|INTPAF;UPUP2F1|
                      (SPADCALL (QCDR |u|)
                                (|compiledLookupCheck| '|lift|
                                                       (LIST
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST '|Fraction|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 (ELT $ 7)))))
                                                        '$)
                                                       |curve|))
                      (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                     NIL))))))))) 

(DEFUN |INTPAF;palgext| (|f| |x| |k| |g| $)
  (PROG (|uc| |ur| |u| |curve| |g1| |cv| |modulus| |p|)
    (RETURN
     (SEQ
      (LETT |modulus|
            (SPADCALL
             (LETT |p| (SPADCALL |k| (QREFELT $ 42)) . #1=(|INTPAF;palgext|))
             |x| (QREFELT $ 43))
            . #1#)
      (LETT |cv|
            (SPADCALL (SPADCALL |f| |x| |k| |p| (QREFELT $ 68)) |modulus|
                      (QREFELT $ 101))
            . #1#)
      (LETT |g1| (SPADCALL |g| |x| |k| |p| (QREFELT $ 68)) . #1#)
      (LETT |curve|
            (|AlgebraicFunctionField| (QREFELT $ 7)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT $ 7))
                                      (|SparseUnivariatePolynomial|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT $ 7))))
                                      (QVELT |cv| 1))
            . #1#)
      (SPADCALL (QVELT |cv| 4)
                (|compiledLookupCheck| '|knownInfBasis|
                                       (LIST (LIST '|Void|)
                                             (LIST '|NonNegativeInteger|))
                                       |curve|))
      (LETT |u|
            (SPADCALL
             (SPADCALL (QVELT |cv| 0)
                       (|compiledLookupCheck| '|reduce|
                                              (LIST '$
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (LIST '|Fraction|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 7))))))
                                              |curve|))
             (ELT $ 65) |g1| (QVELT |cv| 2) (QVELT |cv| 3)
             (|compiledLookupCheck| '|palgextintegrate|
                                    (LIST
                                     (LIST '|Union|
                                           (LIST '|Record|
                                                 (LIST '|:| '|ratpart|
                                                       (|devaluate| |curve|))
                                                 (LIST '|:| '|coeff|
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                           '"failed")
                                     (|devaluate| |curve|)
                                     (LIST '|Mapping|
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7)))
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7))))
                                     (LIST '|SparseUnivariatePolynomial|
                                           (LIST '|Fraction|
                                                 (LIST
                                                  '|SparseUnivariatePolynomial|
                                                  (|devaluate| (ELT $ 7)))))
                                     (LIST '|Fraction|
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7))))
                                     (LIST '|Fraction|
                                           (LIST '|SparseUnivariatePolynomial|
                                                 (|devaluate| (ELT $ 7)))))
                                    (|AlgebraicIntegrate| (ELT $ 6) (ELT $ 7)
                                                          (|SparseUnivariatePolynomial|
                                                           (ELT $ 7))
                                                          (|SparseUnivariatePolynomial|
                                                           (|Fraction|
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT $ 7))))
                                                          |curve|)))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |ur| (QCAR (QCDR |u|)) . #1#)
                   (LETT |uc| (QCDR (QCDR |u|)) . #1#)
                   (EXIT
                    (CONS 0
                          (CONS
                           (|INTPAF;UPUP2F1|
                            (SPADCALL |ur|
                                      (|compiledLookupCheck| '|lift|
                                                             (LIST
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (LIST
                                                                '|Fraction|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 7)))))
                                                              '$)
                                                             |curve|))
                            (QVELT |cv| 2) (QVELT |cv| 3) |x| |k| $)
                           |uc|))))))))))) 

(DEFUN |INTPAF;palgint;F2KIr;22| (|f| |x| |y| $)
  (PROG (|u| |v|)
    (RETURN
     (SEQ
      (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
            . #1=(|INTPAF;palgint;F2KIr;22|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL |y| '|nthRoot| (QREFELT $ 168))
                   (|INTPAF;prootintegrate| |f| |x| |y| $))
                  ((SPADCALL |y| '|rootOf| (QREFELT $ 168))
                   (|INTPAF;palgintegrate| |f| |x| |y| $))
                  (#2='T (|error| "failed - cannot handle that integrand"))))
                (#2#
                 (SPADCALL |f| |x| |y| (QCAR (QCDR |u|)) (QCDR (QCDR |u|))
                           (QREFELT $ 169)))))))
        (#2#
         (SPADCALL |f| |x| |y| (QREFELT $ 14) (QCAR (QCDR |v|))
                   (QCDR (QCDR |v|)) (QREFELT $ 170))))))))) 

(DEFUN |INTPAF;palgextint;F2KFU;23| (|f| |x| |y| |g| $)
  (PROG (|u| |v|)
    (RETURN
     (SEQ
      (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
            . #1=(|INTPAF;palgextint;F2KFU;23|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL |y| '|nthRoot| (QREFELT $ 168))
                   (|INTPAF;prootextint| |f| |x| |y| |g| $))
                  ((SPADCALL |y| '|rootOf| (QREFELT $ 168))
                   (|INTPAF;palgext| |f| |x| |y| |g| $))
                  (#2='T (|error| "failed - cannot handle that integrand"))))
                (#2#
                 (SPADCALL |f| |x| |y| |g| (QCAR (QCDR |u|)) (QCDR (QCDR |u|))
                           (QREFELT $ 171)))))))
        (#2#
         (SPADCALL |f| |x| |y| |g| (QREFELT $ 14) (QCAR (QCDR |v|))
                   (QCDR (QCDR |v|)) (QREFELT $ 172))))))))) 

(DEFUN |INTPAF;palglimint;F2KLU;24| (|f| |x| |y| |lu| $)
  (PROG (|u| |v|)
    (RETURN
     (SEQ
      (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
            . #1=(|INTPAF;palglimint;F2KLU;24|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL |y| '|nthRoot| (QREFELT $ 168))
                   (|INTPAF;prootlimint| |f| |x| |y| |lu| $))
                  ((SPADCALL |y| '|rootOf| (QREFELT $ 168))
                   (|INTPAF;palglim| |f| |x| |y| |lu| $))
                  (#2='T (|error| "failed - cannot handle that integrand"))))
                (#2#
                 (SPADCALL |f| |x| |y| |lu| (QCAR (QCDR |u|)) (QCDR (QCDR |u|))
                           (QREFELT $ 175)))))))
        (#2#
         (SPADCALL |f| |x| |y| |lu| (QREFELT $ 14) (QCAR (QCDR |v|))
                   (QCDR (QCDR |v|)) (QREFELT $ 176))))))))) 

(DEFUN |INTPAF;palgRDE;3F2KMU;25| (|nfp| |f| |g| |x| |y| |rde| $)
  (PROG (|u| |v|)
    (RETURN
     (SEQ
      (LETT |v| (|INTPAF;linearInXIfCan| |x| |y| $)
            . #1=(|INTPAF;palgRDE;3F2KMU;25|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (LETT |u| (|INTPAF;quadIfCan| |x| |y| $) . #1#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL |y| '|nthRoot| (QREFELT $ 168))
                   (|INTPAF;prootRDE| |nfp| |f| |g| |x| |y| |rde| $))
                  (#2='T (|INTPAF;palgRDE1| |nfp| |g| |x| |y| $))))
                (#2#
                 (SPADCALL |f| |g| |x| |y| |rde| (QCAR (QCDR |u|))
                           (QCDR (QCDR |u|)) (QREFELT $ 180)))))))
        (#2#
         (SPADCALL |f| |g| |x| |y| |rde| (QREFELT $ 14) (QCAR (QCDR |v|))
                   (QCDR (QCDR |v|)) (QREFELT $ 181))))))))) 

(DEFUN |INTPAF;quadIfCan| (|x| |y| $)
  (PROG (|radi| |d| |ff| |p|)
    (RETURN
     (SEQ
      (COND
       ((EQL
         (SPADCALL
          (LETT |p| (SPADCALL |y| (QREFELT $ 42)) . #1=(|INTPAF;quadIfCan|))
          (QREFELT $ 53))
         2)
        (COND
         ((SPADCALL (SPADCALL |p| 1 (QREFELT $ 56)) (QREFELT $ 183))
          (EXIT
           (SEQ
            (LETT |d|
                  (SPADCALL
                   (LETT |ff|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| 0 (QREFELT $ 56))
                                     (SPADCALL |p| 2 (QREFELT $ 56))
                                     (QREFELT $ 117))
                           (QREFELT $ 139))
                          |x| (QREFELT $ 24))
                         . #1#)
                   (QREFELT $ 28))
                  . #1#)
            (EXIT
             (COND
              ((EQL
                (SPADCALL
                 (LETT |radi|
                       (SPADCALL |d| (SPADCALL |ff| (QREFELT $ 37))
                                 (QREFELT $ 184))
                       . #1#)
                 (QREFELT $ 53))
                2)
               (CONS 0
                     (CONS
                      (SPADCALL |d| (SPADCALL |x| (QREFELT $ 20))
                                (QREFELT $ 83))
                      |radi|)))
              ('T (CONS 1 "failed"))))))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |INTPAF;palgLODE;LF2KSR;27| (|eq| |g| |kx| |y| |x| $)
  (PROG (#1=#:G576 |i| #2=#:G575 |u| |v|)
    (RETURN
     (SEQ
      (LETT |v| (|INTPAF;linearInXIfCan| |kx| |y| $)
            . #3=(|INTPAF;palgLODE;LF2KSR;27|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SEQ (LETT |u| (|INTPAF;quadIfCan| |kx| |y| $) . #3#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (|INTPAF;palgLODE1|
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |i| 0 . #3#)
                        (LETT #1# (SPADCALL |eq| (QREFELT $ 185)) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS (SPADCALL |eq| |i| (QREFELT $ 186)) #2#)
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  |g| |kx| |y| |x| $))
                (#4='T
                 (SPADCALL |eq| |g| |kx| |y| (QCAR (QCDR |u|))
                           (QCDR (QCDR |u|)) (QREFELT $ 188)))))))
        (#4#
         (SPADCALL |eq| |g| |kx| |y| (QREFELT $ 14) (QCAR (QCDR |v|))
                   (QCDR (QCDR |v|)) (QREFELT $ 189))))))))) 

(DEFUN |PureAlgebraicIntegration| (&REST #1=#:G577)
  (PROG ()
    (RETURN
     (PROG (#2=#:G578)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PureAlgebraicIntegration|)
                                           '|domainEqualList|)
                . #3=(|PureAlgebraicIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PureAlgebraicIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PureAlgebraicIntegration|))))))))))) 

(DEFUN |PureAlgebraicIntegration;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PureAlgebraicIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PureAlgebraicIntegration| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 191) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         (LIST
                                                          '|LinearOrdinaryDifferentialOperatorCategory|
                                                          (|devaluate|
                                                           |#2|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|PureAlgebraicIntegration|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      (QSETREFV $ 14 (SPADCALL (QREFELT $ 11) (QREFELT $ 13)))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 190
                  (CONS (|dispatchFunction| |INTPAF;palgLODE;LF2KSR;27|) $))))
      $)))) 

(MAKEPROP '|PureAlgebraicIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) '|dummy| (|Kernel| 7)
              (4 . |kernel|) '|dumk| (|SparseUnivariatePolynomial| 16)
              (|Fraction| 25) (|ChangeOfVariable| 7 25 15) (9 . |eval|)
              (|Kernel| $) (16 . |coerce|) (|GenusZeroIntegration| 6 7 8)
              (21 . |multivariate|) (|Fraction| 41) (28 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (34 . |coerce|) (39 . |coerce|)
              (44 . |denom|) (|Mapping| 16 7)
              (|SparseUnivariatePolynomialFunctions2| 7 16) (49 . |map|)
              (55 . |One|) (59 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 34 '"failed")
              (63 . |extendedEuclidean|) (70 . |numer|) (75 . *) (81 . |rem|)
              (87 . |Zero|) (|SparseUnivariatePolynomial| $) (91 . |minPoly|)
              (96 . |lift|) (|UnivariatePolynomialCommonDenominator| 25 16 15)
              (102 . |clearDenominator|) (107 . |Zero|) (111 . |Zero|)
              (115 . |Zero|) (|Boolean|) (119 . ~=)
              (125 . |leadingCoefficient|) (|NonNegativeInteger|)
              (130 . |degree|) (135 . >) (141 . |One|) (145 . |coefficient|)
              (151 . |degree|) (156 . |monomial|) (162 . +) (168 . -)
              (174 . |reductum|) (179 . /) (|Fraction| $) (185 . |elt|)
              (191 . |differentiate|) (|Mapping| 25 25) (196 . |differentiate|)
              (202 . |univariate|) (|Union| 16 '"failed")
              (210 . |retractIfCan|) (|IntegrationResult| 16)
              (|RationalIntegration| 7 25) (215 . |integrate|)
              (|IntegrationResult| 7) (|Mapping| 7 16)
              (|IntegrationResultFunctions2| 16 7) (220 . |map|)
              (226 . |leadingMonomial|) (231 . +)
              (|Record| (|:| |radicand| 16) (|:| |deg| 52))
              (|Union| 80 '"failed") (237 . |radPoly|) (242 . |elt|)
              (|Integer|) (248 . |nthRoot|)
              (|SparseMultivariatePolynomial| 6 19) (254 . |numer|)
              (|SparseMultivariatePolynomial| 6 12) (259 . |retract|) (264 . *)
              (270 . |denom|) (275 . |coerce|) (|List| 19) (|List| $)
              (280 . |eval|) |INTPAF;palgint;F2KIr;22| (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (287 . |map|)
              (|Record| (|:| |func| 15) (|:| |poly| 15) (|:| |c1| 16)
                        (|:| |c2| 16) (|:| |deg| 52))
              (293 . |chvar|) (299 . |retract|) (304 . |zero?|) (309 . |One|)
              (313 . |inv|) (318 . |monomial|) (324 . |coerce|) (329 . -)
              (335 . |leadingCoefficient|) (340 . |inv|) (345 . *)
              (351 . |reductum|) (356 . *) (362 . |elt|) (368 . ^) (374 . -)
              (380 . /) (386 . |ground?|) (|Union| $ '"failed")
              (391 . |composite|)
              (|Record| (|:| |exponent| 52) (|:| |coef| 16)
                        (|:| |radicand| 25))
              (397 . |rootPoly|) (403 . *) (409 . ^) (415 . /)
              (|Union| 63 '"failed") (421 . |composite|) (427 . +)
              (433 . |elem?|) (438 . |ratpart|)
              (|Record| (|:| |scalar| (|Fraction| 84)) (|:| |coeff| 25)
                        (|:| |logand| 25))
              (|List| 131) (443 . |logpart|)
              (|Record| (|:| |integrand| 7) (|:| |intvar| 7)) (|List| 134)
              (448 . |notelem|) (|PositiveInteger|) (453 . ^) (459 . -)
              (464 . |mkAnswer|) (471 . ^) (477 . *) (|Union| 9 '"failed")
              (483 . |symbolIfCan|) (488 . |eval|) (495 . =) (501 . *)
              (|Record| (|:| |coeff| 16) (|:| |logand| 16))
              (|Record| (|:| |mainpart| 16) (|:| |limitedlogs| (|List| 148)))
              (|Union| 149 '"failed") (|List| 16) (507 . |limitedint|)
              (|Record| (|:| |coeff| 7) (|:| |logand| 7))
              (|Record| (|:| |mainpart| 7) (|:| |limitedlogs| (|List| 153)))
              (|Union| 154 '"failed") (513 . |map|)
              (|Record| (|:| |ratpart| 16) (|:| |coeff| 16))
              (|Union| 157 '"failed") (519 . |extendedint|)
              (|Record| (|:| |ratpart| 7) (|:| |coeff| 7))
              (|Union| 160 '"failed") (525 . |map|) (531 . |kernels|)
              (|List| 12) (|IntegrationTools| 6 7) (536 . |varselect|)
              (542 . |remove!|) (548 . |is?|) (554 . |palgint0|)
              (563 . |palgint0|) (573 . |palgextint0|) (583 . |palgextint0|)
              |INTPAF;palgextint;F2KFU;23| (|List| 7) (594 . |palglimint0|)
              (604 . |palglimint0|) |INTPAF;palglimint;F2KLU;24|
              (|Union| 7 '"failed") (|Mapping| 178 7 7 9) (615 . |palgRDE0|)
              (626 . |palgRDE0|) |INTPAF;palgRDE;3F2KMU;25| (638 . |zero?|)
              (643 . *) (649 . |degree|) (654 . |coefficient|)
              (|Record| (|:| |particular| 178) (|:| |basis| 174))
              (660 . |palgLODE0|) (670 . |palgLODE0|) (681 . |palgLODE|))
           '#(|palglimint| 690 |palgint| 698 |palgextint| 705 |palgRDE| 713
              |palgLODE| 723)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 190
                                                 '(0 9 0 10 1 12 0 9 13 3 17 15
                                                   15 16 16 18 1 7 0 19 20 3 21
                                                   7 15 12 7 22 2 7 23 0 19 24
                                                   1 25 0 7 26 1 16 0 25 27 1
                                                   16 25 0 28 2 30 15 29 25 31
                                                   0 6 0 32 0 15 0 33 3 15 35 0
                                                   0 0 36 1 16 25 0 37 2 15 0 0
                                                   0 38 2 15 0 0 0 39 0 25 0 40
                                                   1 7 41 19 42 2 21 15 25 12
                                                   43 1 44 15 15 45 0 6 0 46 0
                                                   7 0 47 0 15 0 48 2 15 49 0 0
                                                   50 1 15 16 0 51 1 25 52 0 53
                                                   2 52 49 0 0 54 0 7 0 55 2 25
                                                   7 0 52 56 1 15 52 0 57 2 25
                                                   0 7 52 58 2 25 0 0 0 59 2 25
                                                   0 0 0 60 1 15 0 0 61 2 16 0
                                                   25 25 62 2 25 7 63 7 64 1 25
                                                   0 0 65 2 16 0 0 66 67 4 21
                                                   15 7 12 12 25 68 1 15 69 0
                                                   70 1 72 71 16 73 2 76 74 75
                                                   71 77 1 15 0 0 78 2 74 0 0 0
                                                   79 1 17 81 15 82 2 25 7 0 7
                                                   83 2 7 0 0 84 85 1 7 86 0 87
                                                   1 88 12 0 89 2 7 0 0 0 90 1
                                                   7 86 0 91 1 7 0 86 92 3 7 0
                                                   0 93 94 95 2 98 74 97 74 99
                                                   2 17 100 15 15 101 1 16 25 0
                                                   102 1 16 49 0 103 0 16 0 104
                                                   1 16 0 0 105 2 15 0 16 52
                                                   106 1 15 0 16 107 2 15 0 0 0
                                                   108 1 25 7 0 109 1 7 0 0 110
                                                   2 25 0 52 0 111 1 25 0 0 112
                                                   2 16 0 25 0 113 2 15 16 0 16
                                                   114 2 7 0 0 52 115 2 7 0 0 0
                                                   116 2 7 0 0 0 117 1 25 49 0
                                                   118 2 25 119 0 0 120 2 17
                                                   121 16 52 122 2 16 0 0 0 123
                                                   2 16 0 0 84 124 2 16 0 0 0
                                                   125 2 25 126 63 0 127 2 15 0
                                                   0 0 128 1 74 49 0 129 1 74 7
                                                   0 130 1 74 132 0 133 1 74
                                                   135 0 136 2 7 0 0 137 138 1
                                                   7 0 0 139 3 74 0 7 132 135
                                                   140 2 7 0 0 84 141 2 7 0 52
                                                   0 142 1 12 143 0 144 3 7 0 0
                                                   19 0 145 2 16 49 0 0 146 2
                                                   25 0 84 0 147 2 72 150 16
                                                   151 152 2 76 155 75 150 156
                                                   2 72 158 16 16 159 2 76 161
                                                   75 158 162 1 7 93 0 163 2
                                                   165 164 164 9 166 2 164 0 12
                                                   0 167 2 12 49 0 9 168 5 21
                                                   74 7 12 12 7 25 169 6 21 74
                                                   7 12 12 12 7 16 170 6 21 161
                                                   7 12 12 7 7 25 171 7 21 161
                                                   7 12 12 7 12 7 16 172 6 21
                                                   155 7 12 12 174 7 25 175 7
                                                   21 155 7 12 12 174 12 7 16
                                                   176 7 21 178 7 7 12 12 179 7
                                                   25 180 8 21 178 7 7 12 12
                                                   179 12 7 16 181 1 7 49 0 183
                                                   2 25 0 0 0 184 1 8 52 0 185
                                                   2 8 7 0 52 186 6 21 187 8 7
                                                   12 12 7 25 188 7 21 187 8 7
                                                   12 12 12 7 16 189 5 0 187 8
                                                   7 12 12 9 190 4 0 155 7 12
                                                   12 174 177 3 0 74 7 12 12 96
                                                   4 0 161 7 12 12 7 173 6 0
                                                   178 7 7 7 12 12 179 182 5 1
                                                   187 8 7 12 12 9 190)))))
           '|lookupComplete|)) 
