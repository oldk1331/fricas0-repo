
(SDEFUN |FSUPFACT;subst_mp_ni|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F)) (|ni| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|FSUPFACT;subst_mp_ni!0| $) |p| (QREFELT $ 20))
          (QREFELT $ 22))
         (SPADCALL |ni|
                   (SPADCALL
                    (SPADCALL (CONS #'|FSUPFACT;subst_mp_ni!1| $) |p|
                              (QREFELT $ 20))
                    (QREFELT $ 22))
                   (QREFELT $ 24))
         (QREFELT $ 25))) 

(SDEFUN |FSUPFACT;subst_mp_ni!1| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 23)) (QREFELT $ 17))) 

(SDEFUN |FSUPFACT;subst_mp_ni!0| ((|c| NIL) ($ NIL))
        (SPADCALL (SPADCALL |c| (QREFELT $ 16)) (QREFELT $ 17))) 

(SDEFUN |FSUPFACT;subst_f_ni| ((|c| F) (|ni| F) ($ F))
        (SPADCALL (|FSUPFACT;subst_mp_ni| (SPADCALL |c| (QREFELT $ 26)) |ni| $)
                  (|FSUPFACT;subst_mp_ni| (SPADCALL |c| (QREFELT $ 27)) |ni| $)
                  (QREFELT $ 28))) 

(SDEFUN |FSUPFACT;subst_up| ((|p| UP) (|k| |Kernel| F) (|a| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|FSUPFACT;subst_up!0| (VECTOR $ |a| |k|)) |p|
                         (QREFELT $ 33)))) 

(SDEFUN |FSUPFACT;subst_up!0| ((|c| NIL) ($$ NIL))
        (PROG (|k| |a| $)
          (LETT |k| (QREFELT $$ 2) . #1=(|FSUPFACT;subst_up|))
          (LETT |a| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| (LIST |k|) (LIST |a|) (QREFELT $ 31)))))) 

(SDEFUN |FSUPFACT;handle_imaginary|
        ((|p| UP) (|al| |List| F) ($ |Factored| UP))
        (SPROG
         ((|res1| (|Factored| UP)) (|al1| (|List| F)) (|p1| (UP)) (|nv| (F))
          (|nvr| (R)) (|ni| (|Kernel| F)) (|nif| (|Expression| R)) (|p0| (UP)))
         (SEQ
          (LETT |p0|
                (SPADCALL (SPADCALL (|spadConstant| $ 35) 2 (QREFELT $ 37))
                          (|spadConstant| $ 38) (QREFELT $ 39))
                . #1=(|FSUPFACT;handle_imaginary|))
          (LETT |nif| (SPADCALL |p0| (QREFELT $ 42)) . #1#)
          (LETT |ni| (SPADCALL |nif| (QREFELT $ 44)) . #1#)
          (LETT |nvr| (SPADCALL 0 1 (QREFELT $ 47)) . #1#)
          (LETT |nv| (SPADCALL |nvr| (QREFELT $ 48)) . #1#)
          (LETT |p1|
                (SPADCALL
                 (CONS #'|FSUPFACT;handle_imaginary!0| (VECTOR $ |nif|)) |p|
                 (QREFELT $ 33))
                . #1#)
          (LETT |al1|
                (SPADCALL
                 (CONS #'|FSUPFACT;handle_imaginary!1| (VECTOR $ |nif|)) |al|
                 (QREFELT $ 50))
                . #1#)
          (LETT |res1| (SPADCALL |p1| |al1| (QREFELT $ 52)) . #1#)
          (EXIT
           (SPADCALL
            (CONS #'|FSUPFACT;handle_imaginary!2| (VECTOR $ |nv| |ni|)) |res1|
            (QREFELT $ 54)))))) 

(SDEFUN |FSUPFACT;handle_imaginary!2| ((|pp| NIL) ($$ NIL))
        (PROG (|ni| |nv| $)
          (LETT |ni| (QREFELT $$ 2) . #1=(|FSUPFACT;handle_imaginary|))
          (LETT |nv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSUPFACT;subst_up| |pp| |ni| |nv| $))))) 

(SDEFUN |FSUPFACT;handle_imaginary!1| ((|c| NIL) ($$ NIL))
        (PROG (|nif| $)
          (LETT |nif| (QREFELT $$ 1) . #1=(|FSUPFACT;handle_imaginary|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSUPFACT;subst_f_ni| |c| |nif| $))))) 

(SDEFUN |FSUPFACT;handle_imaginary!0| ((|c| NIL) ($$ NIL))
        (PROG (|nif| $)
          (LETT |nif| (QREFELT $$ 1) . #1=(|FSUPFACT;handle_imaginary|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSUPFACT;subst_f_ni| |c| |nif| $))))) 

(SDEFUN |FSUPFACT;ffactor;UPLF;5| ((|p| UP) (|al| |List| F) ($ |Factored| UP))
        (|FSUPFACT;handle_imaginary| |p| |al| $)) 

(SDEFUN |FSUPFACT;ffactor;UPF;6| ((|p| UP) ($ |Factored| UP))
        (|FSUPFACT;handle_imaginary| |p| NIL $)) 

(SDEFUN |FSUPFACT;ffactor;UPLF;7| ((|p| UP) (|al| |List| F) ($ |Factored| UP))
        (SPADCALL |p| |al| (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;ffactor;UPF;8| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| NIL (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;ffactor;UPLF;9| ((|p| UP) (|al| |List| F) ($ |Factored| UP))
        (SPADCALL |p| |al| (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;ffactor;UPF;10| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| NIL (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;ffactor;UPLF;11| ((|p| UP) (|al| |List| F) ($ |Factored| UP))
        (SPADCALL |p| |al| (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;ffactor;UPF;12| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| NIL (QREFELT $ 52))) 

(SDEFUN |FSUPFACT;UPAN2F|
        ((|p| |SparseUnivariatePolynomial| (|AlgebraicNumber|)) ($ UP))
        (SPADCALL (ELT $ 58) |p| (QREFELT $ 62))) 

(SDEFUN |FSUPFACT;UPQ2AN|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |SparseUnivariatePolynomial| (|AlgebraicNumber|)))
        (SPADCALL (ELT $ 64) |p| (QREFELT $ 68))) 

(SDEFUN |FSUPFACT;ffactor2| ((|p| UP) ($ |Factored| UP))
        (SPROG
         ((|pq|
           (|Union|
            (|Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
            "failed")))
         (SEQ (LETT |pq| (SPADCALL |p| (QREFELT $ 70)) |FSUPFACT;ffactor2|)
              (EXIT
               (COND
                ((QEQCAR |pq| 0)
                 (SPADCALL (CONS (|function| |FSUPFACT;UPAN2F|) $) (QCDR |pq|)
                           (QREFELT $ 74)))
                ('T (|FSUPFACT;ffactor0| |p| $))))))) 

(SDEFUN |FSUPFACT;ffactor1;UPLF;16|
        ((|p| UP) (|la| |List| F) ($ |Factored| UP))
        (SPROG
         ((|ff1|
           (|Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
          (|p1| (UP)) (|pa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (#1=#:G290 NIL) (|a1u| (|Union| (|AlgebraicNumber|) "failed"))
          (|la1| (|List| (|AlgebraicNumber|))) (#2=#:G291 NIL) (|a| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |la1| NIL . #3=(|FSUPFACT;ffactor1;UPLF;16|))
                (EXIT
                 (COND ((NULL |la|) (|FSUPFACT;ffactor2| |p| $))
                       ('T
                        (SEQ
                         (SEQ (LETT |a| NIL . #3#) (LETT #2# |la| . #3#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |a1u| (SPADCALL |a| (QREFELT $ 76)) . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |a1u| 1)
                                  (PROGN
                                   (LETT #1# (|FSUPFACT;ffactor2| |p| $) . #3#)
                                   (GO #1#)))
                                 ('T
                                  (LETT |la1| (CONS (QCDR |a1u|) |la1|)
                                        . #3#)))))
                              (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |pa| (|spadConstant| $ 77) . #3#)
                         (LETT |p1| |p| . #3#)
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |p1| (|spadConstant| $ 78)
                                           (QREFELT $ 80)))
                                (GO G191)))
                              (SEQ
                               (LETT |a1u|
                                     (SPADCALL (SPADCALL |p1| (QREFELT $ 81))
                                               (QREFELT $ 76))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |a1u| 1)
                                  (PROGN
                                   (LETT #1# (|FSUPFACT;ffactor0| |p| $) . #3#)
                                   (GO #1#)))
                                 ('T
                                  (SEQ
                                   (LETT |pa|
                                         (SPADCALL |pa|
                                                   (SPADCALL (QCDR |a1u|)
                                                             (SPADCALL |p1|
                                                                       (QREFELT
                                                                        $ 82))
                                                             (QREFELT $ 83))
                                                   (QREFELT $ 84))
                                         . #3#)
                                   (EXIT
                                    (LETT |p1| (SPADCALL |p1| (QREFELT $ 85))
                                          . #3#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (LETT |ff1| (SPADCALL |pa| |la1| (QREFELT $ 88))
                               . #3#)
                         (EXIT
                          (SPADCALL (CONS (|function| |FSUPFACT;UPAN2F|) $)
                                    |ff1| (QREFELT $ 74)))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |FSUPFACT;anfactor;UPU;17|
        ((|p| UP)
         ($ |Union|
          (|Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          "failed"))
        (SPROG
         ((#1=#:G296 NIL)
          (|q|
           (|Union|
            (|:| |overq|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
            (|:| |overan| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
            (|:| |failed| (|Boolean|)))))
         (SEQ
          (LETT |q| (SPADCALL |p| (QREFELT $ 90))
                . #2=(|FSUPFACT;anfactor;UPU;17|))
          (EXIT
           (COND
            ((QEQCAR |q| 0)
             (CONS 0
                   (SPADCALL (CONS (|function| |FSUPFACT;UPQ2AN|) $)
                             (SPADCALL (CDR |q|) (QREFELT $ 93))
                             (QREFELT $ 96))))
            ((QEQCAR |q| 1)
             (CONS 0
                   (SPADCALL
                    (PROG2 (LETT #1# |q| . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|SparseUnivariatePolynomial|
                                      (|AlgebraicNumber|))
                                     #1#))
                    (QREFELT $ 97))))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |FSUPFACT;UP2ifCan;UPU;18|
        ((|p| UP)
         ($ |Union|
          (|:| |overq| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|:| |overan| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|:| |failed| (|Boolean|))))
        (SPROG
         ((#1=#:G317 NIL)
          (|ansa| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|ra| (|Union| (|AlgebraicNumber|) #2="failed"))
          (|goforq?| (|Boolean|))
          (|ansq| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|rq| (|Union| (|Fraction| (|Integer|)) #2#)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ansq| (|spadConstant| $ 98)
                  . #3=(|FSUPFACT;UP2ifCan;UPU;18|))
            (LETT |ansa| (|spadConstant| $ 77) . #3#) (LETT |goforq?| 'T . #3#)
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 78) (QREFELT $ 80)))
                   (GO G191)))
                 (SEQ
                  (COND
                   (|goforq?|
                    (SEQ
                     (LETT |rq|
                           (SPADCALL (SPADCALL |p| (QREFELT $ 81))
                                     (QREFELT $ 100))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |rq| 0)
                        (SEQ
                         (LETT |ansq|
                               (SPADCALL |ansq|
                                         (SPADCALL (QCDR |rq|)
                                                   (SPADCALL |p|
                                                             (QREFELT $ 82))
                                                   (QREFELT $ 101))
                                         (QREFELT $ 102))
                               . #3#)
                         (EXIT
                          (LETT |ansa|
                                (SPADCALL |ansa|
                                          (SPADCALL
                                           (SPADCALL (QCDR |rq|)
                                                     (QREFELT $ 64))
                                           (SPADCALL |p| (QREFELT $ 82))
                                           (QREFELT $ 83))
                                          (QREFELT $ 84))
                                . #3#))))
                       ('T
                        (SEQ (LETT |goforq?| 'NIL . #3#)
                             (LETT |ra|
                                   (SPADCALL (SPADCALL |p| (QREFELT $ 81))
                                             (QREFELT $ 76))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ra| 0)
                                (LETT |ansa|
                                      (SPADCALL |ansa|
                                                (SPADCALL (QCDR |ra|)
                                                          (SPADCALL |p|
                                                                    (QREFELT $
                                                                             82))
                                                          (QREFELT $ 83))
                                                (QREFELT $ 84))
                                      . #3#))
                               ('T
                                (PROGN
                                 (LETT #1# (CONS 2 'T) . #3#)
                                 (GO #1#)))))))))))
                   ('T
                    (SEQ
                     (LETT |ra|
                           (SPADCALL (SPADCALL |p| (QREFELT $ 81))
                                     (QREFELT $ 76))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |ra| 0)
                        (LETT |ansa|
                              (SPADCALL |ansa|
                                        (SPADCALL (QCDR |ra|)
                                                  (SPADCALL |p| (QREFELT $ 82))
                                                  (QREFELT $ 83))
                                        (QREFELT $ 84))
                              . #3#))
                       ('T (PROGN (LETT #1# (CONS 2 'T) . #3#) (GO #1#))))))))
                  (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 85)) . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (COND (|goforq?| (CONS 0 |ansq|)) ('T (CONS 1 |ansa|))))))
          #1# (EXIT #1#)))) 

(SDEFUN |FSUPFACT;UPQ2F|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ UP))
        (SPADCALL (ELT $ 103) |p| (QREFELT $ 106))) 

(SDEFUN |FSUPFACT;ffactor1;UPLF;20|
        ((|p| UP) (|la| |List| F) ($ |Factored| UP))
        (|FSUPFACT;ffactor3| |p| $)) 

(SDEFUN |FSUPFACT;ffactor3| ((|p| UP) ($ |Factored| UP))
        (SPROG
         ((|pq|
           (|Union|
            (|Factored|
             (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
            "failed")))
         (SEQ (LETT |pq| (SPADCALL |p| (QREFELT $ 108)) |FSUPFACT;ffactor3|)
              (EXIT
               (COND
                ((QEQCAR |pq| 0)
                 (SPADCALL (CONS (|function| |FSUPFACT;UPQ2F|) $) (QCDR |pq|)
                           (QREFELT $ 111)))
                ('T (|FSUPFACT;ffactor0| |p| $))))))) 

(SDEFUN |FSUPFACT;UP2ifCan;UPU;22|
        ((|p| UP)
         ($ |Union|
          (|:| |overq| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|:| |overan| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|:| |failed| (|Boolean|))))
        (SPROG
         ((#1=#:G335 NIL)
          (|ansq| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|rq| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ansq| (|spadConstant| $ 98)
                  . #2=(|FSUPFACT;UP2ifCan;UPU;22|))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 78) (QREFELT $ 80)))
                   (GO G191)))
                 (SEQ
                  (LETT |rq|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 81))
                                  (QREFELT $ 100))
                        . #2#)
                  (COND
                   ((QEQCAR |rq| 0)
                    (LETT |ansq|
                          (SPADCALL |ansq|
                                    (SPADCALL (QCDR |rq|)
                                              (SPADCALL |p| (QREFELT $ 82))
                                              (QREFELT $ 101))
                                    (QREFELT $ 102))
                          . #2#))
                   ('T (PROGN (LETT #1# (CONS 2 'T) . #2#) (GO #1#))))
                  (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 85)) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ansq|))))
          #1# (EXIT #1#)))) 

(SDEFUN |FSUPFACT;ffactor0| ((|p| UP) ($ |Factored| UP))
        (SPROG
         ((|q|
           (|Union|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|))
                                            (|Kernel| F))
            "failed"))
          (|smp| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|ep| (F)))
         (SEQ
          (LETT |smp|
                (SPADCALL
                 (LETT |ep|
                       (SPADCALL |p| (SPADCALL (QREFELT $ 13) (QREFELT $ 112))
                                 (QREFELT $ 113))
                       . #1=(|FSUPFACT;ffactor0|))
                 (QREFELT $ 26))
                . #1#)
          (LETT |q| (|FSUPFACT;P2QifCan| |smp| $) . #1#)
          (EXIT
           (COND ((QEQCAR |q| 1) (SPADCALL |p| (QREFELT $ 114)))
                 ('T
                  (SPADCALL
                   (CONS #'|FSUPFACT;ffactor0!0|
                         (VECTOR |ep| $ (QREFELT $ 13)))
                   (SPADCALL (QCDR |q|) (QREFELT $ 119)) (QREFELT $ 122)))))))) 

(SDEFUN |FSUPFACT;ffactor0!0| ((|x| NIL) ($$ NIL))
        (PROG (|dummy| $ |ep|)
          (LETT |dummy| (QREFELT $$ 2) . #1=(|FSUPFACT;ffactor0|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |ep| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|FSUPFACT;UPQ2UP| (SPADCALL |x| |dummy| (QREFELT $ 116))
             (SPADCALL (SPADCALL |ep| (QREFELT $ 27)) (QREFELT $ 22)) $))))) 

(SDEFUN |FSUPFACT;UPQ2UP|
        ((|p| |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| (|Fraction| (|Integer|))
                                          (|Kernel| F)))
         (|d| F) ($ UP))
        (SPROG NIL
               (SPADCALL (CONS #'|FSUPFACT;UPQ2UP!0| (VECTOR $ |d|)) |p|
                         (QREFELT $ 126)))) 

(SDEFUN |FSUPFACT;UPQ2UP!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| $)
          (LETT |d| (QREFELT $$ 1) . #1=(|FSUPFACT;UPQ2UP|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSUPFACT;PQ2F| |x| |d| $))))) 

(SDEFUN |FSUPFACT;PQ2F|
        ((|p| |SparseMultivariatePolynomial| (|Fraction| (|Integer|))
          (|Kernel| F))
         (|d| F) ($ F))
        (SPADCALL (SPADCALL (ELT $ 112) (ELT $ 103) |p| (QREFELT $ 129)) |d|
                  (QREFELT $ 28))) 

(SDEFUN |FSUPFACT;qfactor;UPU;26|
        ((|p| UP)
         ($ |Union|
          (|Factored| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          "failed"))
        (SPROG
         ((|q|
           (|Union|
            (|:| |overq|
                 (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
            (|:| |overan| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
            (|:| |failed| (|Boolean|)))))
         (SEQ
          (LETT |q| (SPADCALL |p| (QREFELT $ 90)) |FSUPFACT;qfactor;UPU;26|)
          (EXIT
           (COND ((QEQCAR |q| 0) (CONS 0 (SPADCALL (CDR |q|) (QREFELT $ 93))))
                 ('T (CONS 1 "failed"))))))) 

(SDEFUN |FSUPFACT;P2QifCan|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| F))
         ($ |Union|
          (|SparseMultivariatePolynomial| (|Fraction| (|Integer|))
                                          (|Kernel| F))
          "failed"))
        (SPROG
         ((#1=#:G357 NIL) (#2=#:G356 #3=(|Boolean|)) (#4=#:G358 #3#)
          (#5=#:G365 NIL) (|c| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL . #6=(|FSUPFACT;P2QifCan|))
             (SEQ (LETT |c| NIL . #6#)
                  (LETT #5# (SPADCALL |p| (QREFELT $ 131)) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (QEQCAR
                            (SPADCALL (SPADCALL |c| (QREFELT $ 48))
                                      (QREFELT $ 100))
                            0)
                           . #6#)
                     (COND (#1# (LETT #2# (COND (#2# #4#) ('T 'NIL)) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#7='T 'T)))
            (CONS 0
                  (SPADCALL (ELT $ 132) (CONS #'|FSUPFACT;P2QifCan!0| $) |p|
                            (QREFELT $ 138))))
           (#7# (CONS 1 "failed")))))) 

(SDEFUN |FSUPFACT;P2QifCan!0| ((|x| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 133))
                  (QREFELT $ 134))) 

(DECLAIM (NOTINLINE |FunctionSpaceUnivariatePolynomialFactor;|)) 

(DEFUN |FunctionSpaceUnivariatePolynomialFactor| (&REST #1=#:G366)
  (SPROG NIL
         (PROG (#2=#:G367)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceUnivariatePolynomialFactor|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceUnivariatePolynomialFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FunctionSpaceUnivariatePolynomialFactor;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceUnivariatePolynomialFactor|)))))))))) 

(DEFUN |FunctionSpaceUnivariatePolynomialFactor;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|FunctionSpaceUnivariatePolynomialFactor|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$|
                (LIST '|FunctionSpaceUnivariatePolynomialFactor| DV$1 DV$2
                      DV$3)
                . #1#)
          (LETT $ (GETREFV 139) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|RetractableTo|
                                                               (|AlgebraicNumber|)))))
                          . #1#))
          (|haddProp| |$ConstructorCache|
                      '|FunctionSpaceUnivariatePolynomialFactor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
          (COND
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (COND
             ((|domainEqual| |#2| (|Expression| |#1|))
              (COND
               ((|domainEqual| |#3| (|SparseUnivariatePolynomial| |#2|))
                (PROGN
                 (QSETREFV $ 55
                           (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPLF;5|)
                                 $))
                 (QSETREFV $ 56
                           (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;6|)
                                 $))))
               ('T
                (PROGN
                 (QSETREFV $ 55
                           (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPLF;7|)
                                 $))
                 (QSETREFV $ 56
                           (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;8|)
                                 $))))))
             ('T
              (PROGN
               (QSETREFV $ 55
                         (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPLF;9|)
                               $))
               (QSETREFV $ 56
                         (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;10|)
                               $))))))
           ('T
            (PROGN
             (QSETREFV $ 55
                       (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPLF;11|)
                             $))
             (QSETREFV $ 56
                       (CONS (|dispatchFunction| |FSUPFACT;ffactor;UPF;12|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |FSUPFACT;ffactor1;UPLF;16|)
                             $))
             (QSETREFV $ 70
                       (CONS (|dispatchFunction| |FSUPFACT;anfactor;UPU;17|)
                             $))
             (QSETREFV $ 90
                       (CONS (|dispatchFunction| |FSUPFACT;UP2ifCan;UPU;18|)
                             $))))
           ('T
            (PROGN
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |FSUPFACT;ffactor1;UPLF;20|)
                             $))
             (QSETREFV $ 90
                       (CONS (|dispatchFunction| |FSUPFACT;UP2ifCan;UPU;22|)
                             $)))))
          $))) 

(MAKEPROP '|FunctionSpaceUnivariatePolynomialFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Symbol|) (0 . |new|) (|Kernel| 7) (4 . |kernel|)
              '|dummy| (|Integer|) (|Complex| 14) (9 . |real|) (14 . |coerce|)
              (|Mapping| 6 6) (|SparseMultivariatePolynomial| 6 11)
              (19 . |map|) (|SparseMultivariatePolynomial| 6 43)
              (25 . |coerce|) (30 . |imag|) (35 . *) (41 . +) (47 . |numer|)
              (52 . |denom|) (57 . /) (|List| 43) (|List| $) (63 . |subst|)
              (|Mapping| 7 7) (70 . |map|) (76 . |One|) (80 . |One|)
              (|NonNegativeInteger|) (84 . |monomial|) (90 . |One|) (94 . +)
              (|SparseUnivariatePolynomial| $) (|Expression| 6)
              (100 . |rootOf|) (|Kernel| $) (105 . |retract|) (110 . |Zero|)
              (114 . |Zero|) (118 . |complex|) (124 . |coerce|) (|List| 7)
              (129 . |map|) (|Factored| 8) (135 . |ffactor1|) (|Mapping| 8 8)
              (141 . |map|) (147 . |ffactor|) (153 . |ffactor|)
              (|AlgebraicNumber|) (158 . |coerce|) (|Mapping| 7 57)
              (|SparseUnivariatePolynomial| 57)
              (|UnivariatePolynomialCategoryFunctions2| 57 60 7 8)
              (163 . |map|) (|Fraction| 14) (169 . |coerce|) (|Mapping| 57 63)
              (|SparseUnivariatePolynomial| 63)
              (|UnivariatePolynomialCategoryFunctions2| 63 66 57 60)
              (174 . |map|) (|Union| 72 '"failed") (180 . |anfactor|)
              (|Mapping| 8 60) (|Factored| 60) (|FactoredFunctions2| 60 8)
              (185 . |map|) (|Union| 57 '#1="failed") (191 . |retractIfCan|)
              (196 . |Zero|) (200 . |Zero|) (|Boolean|) (204 . ~=)
              (210 . |leadingCoefficient|) (215 . |degree|) (220 . |monomial|)
              (226 . +) (232 . |reductum|) (|List| 57) (|AlgFactor| 60)
              (237 . |factor|)
              (|Union| (|:| |overq| 66) (|:| |overan| 60) (|:| |failed| 79))
              (243 . |UP2ifCan|) (|Factored| 66) (|RationalFactorize| 66)
              (248 . |factor|) (|Mapping| 60 66) (|FactoredFunctions2| 66 60)
              (253 . |map|) (259 . |factor|) (264 . |Zero|) (|Union| 63 '#1#)
              (268 . |retractIfCan|) (273 . |monomial|) (279 . +)
              (285 . |coerce|) (|Mapping| 7 63)
              (|UnivariatePolynomialCategoryFunctions2| 63 66 7 8)
              (290 . |map|) (|Union| 91 '"failed") |FSUPFACT;qfactor;UPU;26|
              (|Mapping| 8 66) (|FactoredFunctions2| 66 8) (296 . |map|)
              (302 . |coerce|) (307 . |elt|) (313 . |coerce|)
              (|SparseMultivariatePolynomial| 63 11) (318 . |univariate|)
              (|Factored| 115)
              (|MRationalFactorize| (|IndexedExponents| 11) 11 14 115)
              (324 . |factor|) (|Mapping| 8 115) (|FactoredFunctions2| 115 8)
              (329 . |map|) (|Mapping| 7 115)
              (|SparseUnivariatePolynomial| 115)
              (|UnivariatePolynomialCategoryFunctions2| 115 124 7 8)
              (335 . |map|) (|Mapping| 7 11)
              (|PolynomialCategoryLifting| (|IndexedExponents| 11) 11 63 115 7)
              (341 . |map|) (|List| 6) (348 . |coefficients|) (353 . |coerce|)
              (358 . |retract|) (363 . |coerce|) (|Mapping| 115 11)
              (|Mapping| 115 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 11) 11 6 19 115)
              (368 . |map|))
           '#(|qfactor| 375 |ffactor1| 380 |ffactor| 386 |anfactor| 397
              |UP2ifCan| 402)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 138
                                                 '(0 9 0 10 1 11 0 9 12 1 15 14
                                                   0 16 1 6 0 14 17 2 19 0 18 0
                                                   20 1 7 0 21 22 1 15 14 0 23
                                                   2 7 0 0 0 24 2 7 0 0 0 25 1
                                                   7 21 0 26 1 7 21 0 27 2 7 0
                                                   0 0 28 3 7 0 0 29 30 31 2 8
                                                   0 32 0 33 0 6 0 34 0 7 0 35
                                                   2 8 0 7 36 37 0 8 0 38 2 8 0
                                                   0 0 39 1 41 0 40 42 1 41 43
                                                   0 44 0 6 0 45 0 7 0 46 2 15
                                                   0 14 14 47 1 7 0 6 48 2 49 0
                                                   32 0 50 2 0 51 8 49 52 2 51
                                                   0 53 0 54 2 0 51 8 49 55 1 0
                                                   51 8 56 1 7 0 57 58 2 61 8
                                                   59 60 62 1 57 0 63 64 2 67
                                                   60 65 66 68 1 0 69 8 70 2 73
                                                   51 71 72 74 1 7 75 0 76 0 60
                                                   0 77 0 8 0 78 2 8 79 0 0 80
                                                   1 8 7 0 81 1 8 36 0 82 2 60
                                                   0 57 36 83 2 60 0 0 0 84 1 8
                                                   0 0 85 2 87 72 60 86 88 1 0
                                                   89 8 90 1 92 91 66 93 2 95
                                                   72 94 91 96 1 87 72 60 97 0
                                                   66 0 98 1 7 99 0 100 2 66 0
                                                   63 36 101 2 66 0 0 0 102 1 7
                                                   0 63 103 2 105 8 104 66 106
                                                   2 110 51 109 91 111 1 7 0 43
                                                   112 2 8 7 0 7 113 1 51 0 8
                                                   114 2 115 40 0 11 116 1 118
                                                   117 115 119 2 121 51 120 117
                                                   122 2 125 8 123 124 126 3
                                                   128 7 127 104 115 129 1 19
                                                   130 0 131 1 115 0 11 132 1 7
                                                   63 0 133 1 115 0 63 134 3
                                                   137 115 135 136 19 138 1 0
                                                   107 8 108 2 0 51 8 49 52 1 0
                                                   51 8 56 2 0 51 8 49 55 1 1
                                                   69 8 70 1 0 89 8 90)))))
           '|lookupComplete|)) 
