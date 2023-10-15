
(SDEFUN |UPOLYC-;variables;SL;1| ((|p| S) ($ |List| (|SingletonAsOrderedSet|)))
        (COND
         ((OR (SPADCALL |p| (QREFELT $ 9))
              (ZEROP (SPADCALL |p| (QREFELT $ 11))))
          NIL)
         ('T (LIST (SPADCALL (QREFELT $ 13)))))) 

(SDEFUN |UPOLYC-;degree;SSaosNni;2|
        ((|p| S) (|v| |SingletonAsOrderedSet|) ($ |NonNegativeInteger|))
        (SPADCALL |p| (QREFELT $ 11))) 

(SDEFUN |UPOLYC-;totalDegree;SLNni;3|
        ((|p| S) (|lv| |List| (|SingletonAsOrderedSet|))
         ($ |NonNegativeInteger|))
        (COND ((NULL |lv|) 0) ('T (SPADCALL |p| (QREFELT $ 17))))) 

(SDEFUN |UPOLYC-;degree;SLL;4|
        ((|p| S) (|lv| |List| (|SingletonAsOrderedSet|))
         ($ |List| (|NonNegativeInteger|)))
        (COND ((NULL |lv|) NIL) ('T (LIST (SPADCALL |p| (QREFELT $ 11)))))) 

(SDEFUN |UPOLYC-;eval;SLLS;5|
        ((|p| S) (|lv| |List| (|SingletonAsOrderedSet|)) (|lq| |List| S) ($ S))
        (COND ((NULL |lv|) |p|)
              ((NULL (NULL (CDR |lv|)))
               (|error| "can only eval a univariate polynomial once"))
              ('T
               (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |lq|)
                         (QREFELT $ 21))))) 

(SDEFUN |UPOLYC-;eval;SSaos2S;6|
        ((|p| S) (|v| |SingletonAsOrderedSet|) (|q| S) ($ S))
        (SPADCALL |p| |q| (QREFELT $ 24))) 

(SDEFUN |UPOLYC-;eval;SLLS;7|
        ((|p| S) (|lv| |List| (|SingletonAsOrderedSet|)) (|lr| |List| R) ($ S))
        (COND ((NULL |lv|) |p|)
              ((NULL (NULL (CDR |lv|)))
               (|error| "can only eval a univariate polynomial once"))
              ('T
               (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |lr|)
                         (QREFELT $ 26))))) 

(SDEFUN |UPOLYC-;eval;SSaosRS;8|
        ((|p| S) (|v| |SingletonAsOrderedSet|) (|r| R) ($ S))
        (SPADCALL (SPADCALL |p| |r| (QREFELT $ 29)) (QREFELT $ 30))) 

(SDEFUN |UPOLYC-;eval;SLS;9| ((|p| S) (|le| |List| (|Equation| S)) ($ S))
        (COND ((NULL |le|) |p|)
              ((NULL (NULL (CDR |le|)))
               (|error| "can only eval a univariate polynomial once"))
              ('T
               (COND
                ((QEQCAR
                  (SPADCALL (SPADCALL (|SPADfirst| |le|) (QREFELT $ 33))
                            (QREFELT $ 35))
                  1)
                 |p|)
                ('T
                 (SPADCALL |p| (SPADCALL (|SPADfirst| |le|) (QREFELT $ 36))
                           (QREFELT $ 24))))))) 

(SDEFUN |UPOLYC-;mainVariable;SU;10|
        ((|p| S) ($ |Union| (|SingletonAsOrderedSet|) "failed"))
        (COND ((ZEROP (SPADCALL |p| (QREFELT $ 11))) (CONS 1 "failed"))
              ('T (CONS 0 (SPADCALL (QREFELT $ 13)))))) 

(SDEFUN |UPOLYC-;minimumDegree;SSaosNni;11|
        ((|p| S) (|v| |SingletonAsOrderedSet|) ($ |NonNegativeInteger|))
        (SPADCALL |p| (QREFELT $ 40))) 

(SDEFUN |UPOLYC-;minimumDegree;SLL;12|
        ((|p| S) (|lv| |List| (|SingletonAsOrderedSet|))
         ($ |List| (|NonNegativeInteger|)))
        (COND ((NULL |lv|) NIL) ('T (LIST (SPADCALL |p| (QREFELT $ 40)))))) 

(SDEFUN |UPOLYC-;monomial;SSaosNniS;13|
        ((|p| S) (|v| |SingletonAsOrderedSet|) (|n| |NonNegativeInteger|)
         ($ S))
        (SPROG NIL
               (SPADCALL
                (CONS #'|UPOLYC-;monomial;SSaosNniS;13!0| (VECTOR $ |n|)) |p|
                (QREFELT $ 45)))) 

(SDEFUN |UPOLYC-;monomial;SSaosNniS;13!0| ((|x1| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|UPOLYC-;monomial;SSaosNniS;13|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |n| (QREFELT $ 43)))))) 

(SDEFUN |UPOLYC-;coerce;SaosS;14| ((|v| |SingletonAsOrderedSet|) ($ S))
        (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))) 

(SDEFUN |UPOLYC-;makeSUP;SSup;15| ((|p| S) ($ |SparseUnivariatePolynomial| R))
        (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 52))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                          (SPADCALL |p| (QREFELT $ 11)) (QREFELT $ 54))
                (SPADCALL (SPADCALL |p| (QREFELT $ 55)) (QREFELT $ 56))
                (QREFELT $ 57))))) 

(SDEFUN |UPOLYC-;unmakeSUP;SupS;16|
        ((|sp| |SparseUnivariatePolynomial| R) ($ S))
        (COND ((SPADCALL |sp| (QREFELT $ 59)) (|spadConstant| $ 60))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |sp| (QREFELT $ 61))
                          (SPADCALL |sp| (QREFELT $ 62)) (QREFELT $ 49))
                (SPADCALL (SPADCALL |sp| (QREFELT $ 63)) (QREFELT $ 64))
                (QREFELT $ 65))))) 

(SDEFUN |UPOLYC-;solveLinearPolynomialEquation;LSupU;17|
        ((|lpp| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 71))) 

(SDEFUN |UPOLYC-;factorPolynomial;SupF;18|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 77))) 

(SDEFUN |UPOLYC-;factorSquareFreePolynomial;SupF;19|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 80))) 

(SDEFUN |UPOLYC-;factor;SF;20| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G215 NIL) (|w| NIL) (#2=#:G214 NIL) (|ansR| (|Factored| R)))
         (SEQ
          (COND
           ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
            (SEQ
             (LETT |ansR|
                   (SPADCALL (SPADCALL |p| (QREFELT $ 53)) (QREFELT $ 83))
                   . #3=(|UPOLYC-;factor;SF;20|))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |ansR| (QREFELT $ 85)) (QREFELT $ 30))
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |w| NIL . #3#)
                     (LETT #1# (SPADCALL |ansR| (QREFELT $ 89)) . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |w| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (VECTOR (QVELT |w| 0)
                                      (SPADCALL (QVELT |w| 1) (QREFELT $ 30))
                                      (QVELT |w| 2))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               (QREFELT $ 93)))))
           ('T
            (SPADCALL (ELT $ 64)
                      (SPADCALL (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 94))
                      (QREFELT $ 98))))))) 

(SDEFUN |UPOLYC-;vectorise;SNniV;21|
        ((|p| S) (|n| |NonNegativeInteger|) ($ |Vector| R))
        (SPROG
         ((#1=#:G216 NIL) (#2=#:G220 NIL) (|i| NIL) (|m| (|Integer|))
          (|v| (|Vector| R)))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 100))
                       . #3=(|UPOLYC-;vectorise;SNniV;21|))
                 (QREFELT $ 103))
                . #3#)
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 103)) . #3#)
               (LETT #2# (QVSIZE |v|) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |v| |i|
                             (SPADCALL |p|
                                       (PROG1 (LETT #1# (- |i| |m|) . #3#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 104))
                             1)))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |v|)))) 

(SDEFUN |UPOLYC-;unvectorise;VS;22| ((|v| |Vector| R) ($ S))
        (SPROG ((|p| (S)) (#1=#:G221 NIL) (#2=#:G225 NIL) (|i| NIL))
               (SEQ
                (LETT |p| (|spadConstant| $ 60)
                      . #3=(|UPOLYC-;unvectorise;VS;22|))
                (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |v|) . #3#) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |p|
                             (SPADCALL |p|
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 106))
                                        (PROG1 (LETT #1# (- |i| 1) . #3#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 49))
                                       (QREFELT $ 65))
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |UPOLYC-;retract;SR;23| ((|p| S) ($ R))
        (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 100))
              ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
               (SPADCALL |p| (QREFELT $ 53)))
              ('T (|error| "Polynomial is not of degree 0")))) 

(SDEFUN |UPOLYC-;retractIfCan;SU;24| ((|p| S) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| (QREFELT $ 9)) (CONS 0 (|spadConstant| $ 100)))
              ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
               (CONS 0 (SPADCALL |p| (QREFELT $ 53))))
              ('T (CONS 1 "failed")))) 

(SDEFUN |UPOLYC-;init;S;25| (($ S))
        (SPADCALL (|spadConstant| $ 111) (QREFELT $ 30))) 

(SDEFUN |UPOLYC-;nextItemInner| ((|n| S) ($ |Union| S #1="failed"))
        (SPROG
         ((|n3| #2=(|Union| R #3="failed")) (#4=#:G243 NIL)
          (|n2| (|Union| S #1#)) (|n1| (S)) (|nn| #2#))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT $ 9))
            (CONS 0
                  (SPADCALL
                   (PROG2
                       (LETT #4#
                             (SPADCALL (|spadConstant| $ 100) (QREFELT $ 114))
                             . #5=(|UPOLYC-;nextItemInner|))
                       (QCDR #4#)
                     (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                     (|Union| (QREFELT $ 7) #3#) #4#))
                   (QREFELT $ 30))))
           ((ZEROP (SPADCALL |n| (QREFELT $ 11)))
            (SEQ
             (LETT |nn|
                   (SPADCALL (SPADCALL |n| (QREFELT $ 53)) (QREFELT $ 114))
                   . #5#)
             (EXIT
              (COND ((QEQCAR |nn| 1) (CONS 1 "failed"))
                    (#6='T (CONS 0 (SPADCALL (QCDR |nn|) (QREFELT $ 30))))))))
           (#6#
            (SEQ (LETT |n1| (SPADCALL |n| (QREFELT $ 55)) . #5#)
                 (LETT |n2| (|UPOLYC-;nextItemInner| |n1| $) . #5#)
                 (EXIT
                  (COND
                   ((QEQCAR |n2| 0)
                    (CONS 0
                          (SPADCALL
                           (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                     (SPADCALL |n| (QREFELT $ 11))
                                     (QREFELT $ 49))
                           (QCDR |n2|) (QREFELT $ 65))))
                   ((< (+ 1 (SPADCALL |n1| (QREFELT $ 11)))
                       (SPADCALL |n| (QREFELT $ 11)))
                    (CONS 0
                          (SPADCALL
                           (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                     (SPADCALL |n| (QREFELT $ 11))
                                     (QREFELT $ 49))
                           (SPADCALL
                            (PROG2
                                (LETT #4#
                                      (SPADCALL (|spadConstant| $ 111)
                                                (QREFELT $ 114))
                                      . #5#)
                                (QCDR #4#)
                              (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                              (|Union| (QREFELT $ 7) #3#) #4#))
                            (+ 1 (SPADCALL |n1| (QREFELT $ 11)))
                            (QREFELT $ 49))
                           (QREFELT $ 65))))
                   (#6#
                    (SEQ
                     (LETT |n3|
                           (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                     (QREFELT $ 114))
                           . #5#)
                     (EXIT
                      (COND ((QEQCAR |n3| 1) (CONS 1 "failed"))
                            (#6#
                             (CONS 0
                                   (SPADCALL (QCDR |n3|)
                                             (SPADCALL |n| (QREFELT $ 11))
                                             (QREFELT $ 49)))))))))))))))) 

(SDEFUN |UPOLYC-;nextItem;SU;27| ((|n| S) ($ |Union| S #1="failed"))
        (SPROG ((#2=#:G256 NIL) (|n1| (|Union| S "failed")))
               (SEQ
                (LETT |n1| (|UPOLYC-;nextItemInner| |n| $)
                      . #3=(|UPOLYC-;nextItem;SU;27|))
                (EXIT
                 (COND
                  ((QEQCAR |n1| 1)
                   (CONS 0
                         (SPADCALL
                          (PROG2
                              (LETT #2#
                                    (SPADCALL (|spadConstant| $ 111)
                                              (QREFELT $ 114))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                            (|Union| (QREFELT $ 7) #1#) #2#))
                          (+ 1 (SPADCALL |n| (QREFELT $ 11))) (QREFELT $ 49))))
                  ('T |n1|)))))) 

(SDEFUN |UPOLYC-;content;SSaosS;28|
        ((|p| S) (|v| |SingletonAsOrderedSet|) ($ S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 116)) (QREFELT $ 30))) 

(SDEFUN |UPOLYC-;primeFactor| ((|p| S) (|q| S) ($ S))
        (SPROG ((|p1| (S)) (#1=#:G262 NIL))
               (SEQ
                (LETT |p1|
                      (PROG2
                          (LETT #1#
                                (SPADCALL |p|
                                          (SPADCALL |p| |q| (QREFELT $ 118))
                                          (QREFELT $ 119))
                                . #2=(|UPOLYC-;primeFactor|))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #1#))
                      . #2#)
                (EXIT
                 (COND ((SPADCALL |p1| |p| (QREFELT $ 120)) |p|)
                       ('T (|UPOLYC-;primeFactor| |p1| |q| $))))))) 

(SDEFUN |UPOLYC-;separate;2SR;30|
        ((|p| S) (|q| S) ($ |Record| (|:| |primePart| S) (|:| |commonPart| S)))
        (SPROG ((#1=#:G268 NIL) (|a| (S)))
               (SEQ
                (LETT |a| (|UPOLYC-;primeFactor| |p| |q| $)
                      . #2=(|UPOLYC-;separate;2SR;30|))
                (EXIT
                 (CONS |a|
                       (PROG2
                           (LETT #1# (SPADCALL |p| |a| (QREFELT $ 119)) . #2#)
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                         (|Union| (QREFELT $ 6) "failed")
                                         #1#))))))) 

(SDEFUN |UPOLYC-;differentiate;SM2S;31|
        ((|x| S) (|deriv| |Mapping| R R) (|x'| S) ($ S))
        (SPROG
         ((|d| (S)) (#1=#:G273 NIL) (|lc| (R)) (|dg| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (|spadConstant| $ 60)
                . #2=(|UPOLYC-;differentiate;SM2S;31|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                            (QREFELT $ 123)))
                 (GO G191)))
               (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #2#)
                    (LETT |d|
                          (SPADCALL
                           (SPADCALL |d|
                                     (SPADCALL |x'|
                                               (SPADCALL
                                                (SPADCALL |dg| |lc|
                                                          (QREFELT $ 124))
                                                (PROG1
                                                    (LETT #1# (- |dg| 1) . #2#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 49))
                                               (QREFELT $ 125))
                                     (QREFELT $ 65))
                           (SPADCALL (SPADCALL |lc| |deriv|) |dg|
                                     (QREFELT $ 49))
                           (QREFELT $ 65))
                          . #2#)
                    (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |d|
                     (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 53)) |deriv|)
                               (QREFELT $ 30))
                     (QREFELT $ 65)))))) 

(SDEFUN |UPOLYC-;ncdiff| ((|n| |NonNegativeInteger|) (|x'| S) ($ S))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G289 NIL))
               (COND ((ZEROP |n|) (|spadConstant| $ 60))
                     ((ZEROP
                       (LETT |n1|
                             (PROG1
                                 (LETT #1# (- |n| 1) . #2=(|UPOLYC-;ncdiff|))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             . #2#))
                      |x'|)
                     ('T
                      (SPADCALL
                       (SPADCALL |x'|
                                 (SPADCALL (|spadConstant| $ 48) |n1|
                                           (QREFELT $ 49))
                                 (QREFELT $ 125))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))
                        (|UPOLYC-;ncdiff| |n1| |x'| $) (QREFELT $ 125))
                       (QREFELT $ 65)))))) 

(SDEFUN |UPOLYC-;differentiate;SM2S;33|
        ((|x| S) (|deriv| |Mapping| R R) (|x'| S) ($ S))
        (SPROG ((|d| (S)) (|lc| (R)) (|dg| (|NonNegativeInteger|)))
               (SEQ
                (LETT |d| (|spadConstant| $ 60)
                      . #1=(|UPOLYC-;differentiate;SM2S;33|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #1#) 0
                         (QREFELT $ 123)))
                       (GO G191)))
                     (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #1#)
                          (LETT |d|
                                (SPADCALL
                                 (SPADCALL |d|
                                           (SPADCALL (SPADCALL |lc| |deriv|)
                                                     |dg| (QREFELT $ 49))
                                           (QREFELT $ 65))
                                 (SPADCALL |lc| (|UPOLYC-;ncdiff| |dg| |x'| $)
                                           (QREFELT $ 128))
                                 (QREFELT $ 65))
                                . #1#)
                          (EXIT
                           (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |d|
                           (SPADCALL
                            (SPADCALL (SPADCALL |x| (QREFELT $ 53)) |deriv|)
                            (QREFELT $ 30))
                           (QREFELT $ 65)))))) 

(SDEFUN |UPOLYC-;differentiate;SMS;34| ((|x| S) (|deriv| |Mapping| R R) ($ S))
        (SPADCALL |x| |deriv| (|spadConstant| $ 47) (QREFELT $ 129))) 

(SDEFUN |UPOLYC-;differentiate;2S;35| ((|x| S) ($ S))
        (SPROG ((|d| (S)) (#1=#:G299 NIL) (|dg| (|NonNegativeInteger|)))
               (SEQ
                (LETT |d| (|spadConstant| $ 60)
                      . #2=(|UPOLYC-;differentiate;2S;35|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                         (QREFELT $ 123)))
                       (GO G191)))
                     (SEQ
                      (LETT |d|
                            (SPADCALL |d|
                                      (SPADCALL
                                       (SPADCALL |dg|
                                                 (SPADCALL |x| (QREFELT $ 53))
                                                 (QREFELT $ 124))
                                       (PROG1 (LETT #1# (- |dg| 1) . #2#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       (QREFELT $ 49))
                                      (QREFELT $ 65))
                            . #2#)
                      (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |d|)))) 

(SDEFUN |UPOLYC-;differentiate;SSaosS;36|
        ((|x| S) (|v| |SingletonAsOrderedSet|) ($ S))
        (SPADCALL |x| (QREFELT $ 132))) 

(SDEFUN |UPOLYC-;elt;3F;37|
        ((|g| |Fraction| S) (|f| |Fraction| S) ($ |Fraction| S))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 135)) |f| (QREFELT $ 137))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 138)) |f| (QREFELT $ 137))
                  (QREFELT $ 139))) 

(SDEFUN |UPOLYC-;pseudoQuotient;3S;38| ((|p| S) (|q| S) ($ S))
        (SPROG ((#1=#:G331 NIL) (#2=#:G329 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (+
                       (- (SPADCALL |p| (QREFELT $ 11))
                          (SPADCALL |q| (QREFELT $ 11)))
                       1)
                      . #3=(|UPOLYC-;pseudoQuotient;3S;38|))
                (EXIT
                 (COND ((< |n| 1) (|spadConstant| $ 60))
                       ('T
                        (PROG2
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                               (PROG1 (LETT #2# |n| . #3#)
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QREFELT $ 141))
                                     |p| (QREFELT $ 128))
                                    (SPADCALL |p| |q| (QREFELT $ 142))
                                    (QREFELT $ 143))
                                   |q| (QREFELT $ 119))
                                  . #3#)
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #1#)))))))) 

(SDEFUN |UPOLYC-;pseudoDivide;2SR;39|
        ((|p| S) (|q| S)
         ($ |Record| (|:| |coef| R) (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((#1=#:G338 NIL) (|lc| (R)) (#2=#:G336 NIL) (|prem| (S))
          (|n| (|Integer|)))
         (SEQ
          (LETT |n|
                (+
                 (- (SPADCALL |p| (QREFELT $ 11))
                    (SPADCALL |q| (QREFELT $ 11)))
                 1)
                . #3=(|UPOLYC-;pseudoDivide;2SR;39|))
          (EXIT
           (COND
            ((< |n| 1)
             (VECTOR (|spadConstant| $ 48) (|spadConstant| $ 60) |p|))
            ('T
             (SEQ (LETT |prem| (SPADCALL |p| |q| (QREFELT $ 142)) . #3#)
                  (LETT |lc|
                        (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                  (PROG1 (LETT #2# |n| . #3#)
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 141))
                        . #3#)
                  (EXIT
                   (VECTOR |lc|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |lc| |p| (QREFELT $ 128))
                                       |prem| (QREFELT $ 143))
                                      |q| (QREFELT $ 119))
                                     . #3#)
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                             (|Union| (QREFELT $ 6) "failed")
                                             #1#))
                           |prem|))))))))) 

(SDEFUN |UPOLYC-;composite;FSU;40|
        ((|f| |Fraction| S) (|q| S) ($ |Union| (|Fraction| S) "failed"))
        (SPROG ((|d| #1=(|Union| S "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 135)) |q|
                                (QREFELT $ 147))
                      . #2=(|UPOLYC-;composite;FSU;40|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |f| (QREFELT $ 138)) |q|
                                         (QREFELT $ 147))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 148))))))))))))) 

(SDEFUN |UPOLYC-;composite;2SU;41| ((|p| S) (|q| S) ($ |Union| S #1="failed"))
        (SPROG
         ((#2=#:G367 NIL) (|w| #3=(|Union| S "failed")) (|u| (|Union| S #1#))
          (|v| #3#)
          (|cqr|
           (|Record| (|:| |coef| R) (|:| |quotient| S) (|:| |remainder| S))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 151)) (CONS 0 |p|))
                ('T
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |cqr| (SPADCALL |p| |q| (QREFELT $ 152))
                          . #4=(|UPOLYC-;composite;2SU;41|))
                    (COND
                     ((SPADCALL (QVELT |cqr| 2) (QREFELT $ 151))
                      (SEQ
                       (LETT |v|
                             (SPADCALL (QVELT |cqr| 2) (QVELT |cqr| 0)
                                       (QREFELT $ 153))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |v| 0)
                          (SEQ
                           (LETT |u|
                                 (SPADCALL (QVELT |cqr| 1) |q| (QREFELT $ 147))
                                 . #4#)
                           (EXIT
                            (COND
                             ((QEQCAR |u| 0)
                              (SEQ
                               (LETT |w|
                                     (SPADCALL (QCDR |u|) (QVELT |cqr| 0)
                                               (QREFELT $ 153))
                                     . #4#)
                               (EXIT
                                (COND
                                 ((QEQCAR |w| 0)
                                  (PROGN
                                   (LETT #2#
                                         (CONS 0
                                               (SPADCALL (QCDR |v|)
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|spadConstant| $
                                                                           48)
                                                           1 (QREFELT $ 49))
                                                          (QCDR |w|)
                                                          (QREFELT $ 125))
                                                         (QREFELT $ 65)))
                                         . #4#)
                                   (GO #5=#:G364))))))))))))))))
                    (EXIT (CONS 1 "failed"))))
                  #5# (EXIT #2#))))))) 

(SDEFUN |UPOLYC-;elt;S2F;42| ((|p| S) (|f| |Fraction| S) ($ |Fraction| S))
        (SPROG
         ((|ans| (|Fraction| S)) (#1=#:G372 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 155))
                (#2='T
                 (SEQ
                  (LETT |ans|
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                                   (QREFELT $ 30))
                         (QREFELT $ 156))
                        . #3=(|UPOLYC-;elt;S2F;42|))
                  (LETT |n| (SPADCALL |p| (QREFELT $ 11)) . #3#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL
                             (LETT |p| (SPADCALL |p| (QREFELT $ 55)) . #3#)
                             (QREFELT $ 9))
                            'NIL)
                           ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |ans|
                               (SPADCALL
                                (SPADCALL |ans|
                                          (SPADCALL |f|
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (SPADCALL
                                                                        |p|
                                                                        (QREFELT
                                                                         $ 11))
                                                                       . #3#))
                                                              . #3#)
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 157))
                                          (QREFELT $ 158))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                                           (QREFELT $ 30))
                                 (QREFELT $ 156))
                                (QREFELT $ 159))
                               . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((ZEROP |n|) |ans|)
                         (#2#
                          (SPADCALL |ans| (SPADCALL |f| |n| (QREFELT $ 160))
                                    (QREFELT $ 158))))))))))) 

(SDEFUN |UPOLYC-;order;2SNni;43| ((|p| S) (|q| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|ans| (|NonNegativeInteger|)) (#1=#:G387 NIL)
          (|u| (|Union| S "failed")))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 9))
             (|error| "order: arguments must be nonzero"))
            ((< (SPADCALL |q| (QREFELT $ 11)) 1)
             (|error| "order: place must be non-trivial"))
            ('T
             (SEQ (LETT |ans| 0 . #2=(|UPOLYC-;order;2SNni;43|))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (LETT |u| (SPADCALL |p| |q| (QREFELT $ 119)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN (LETT #1# |ans| . #2#) (GO #3=#:G386)))
                           ('T
                            (SEQ (LETT |p| (QCDR |u|) . #2#)
                                 (EXIT (LETT |ans| (+ |ans| 1) . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |UPOLYC-;squareFree;SF;44| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 164))) 

(SDEFUN |UPOLYC-;squareFreePart;2S;45| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 166))) 

(SDEFUN |UPOLYC-;gcdPolynomial;3Sup;46|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (COND ((SPADCALL |pp| (QREFELT $ 168)) (SPADCALL |qq| (QREFELT $ 169)))
              ((SPADCALL |qq| (QREFELT $ 168)) (SPADCALL |pp| (QREFELT $ 169)))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |pp| (QREFELT $ 170))
                           (SPADCALL |qq| (QREFELT $ 170)) (QREFELT $ 118))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pp| (QREFELT $ 171))
                            (SPADCALL |qq| (QREFELT $ 171)) (QREFELT $ 172))
                  (QREFELT $ 171))
                 (QREFELT $ 173))
                (QREFELT $ 169))))) 

(SDEFUN |UPOLYC-;squareFreePolynomial;SupF;47|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 176))) 

(SDEFUN |UPOLYC-;elt;F2R;48| ((|f| |Fraction| S) (|r| R) ($ R))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 135)) |r| (QREFELT $ 29))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 138)) |r| (QREFELT $ 29))
                  (QREFELT $ 178))) 

(SDEFUN |UPOLYC-;euclideanSize;SNni;49| ((|x| S) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |x| (QREFELT $ 9))
          (|error| "euclideanSize called on 0 in Univariate Polynomial"))
         ('T (SPADCALL |x| (QREFELT $ 11))))) 

(SDEFUN |UPOLYC-;divide;2SR;50|
        ((|x| S) (|y| S) ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((|quot| (S)) (|n| (|NonNegativeInteger|)) (#1=#:G401 NIL) (|f| (R))
          (|lc| (R)))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 9))
            (|error| "division by 0 in Univariate Polynomials"))
           ('T
            (SEQ
             (LETT |quot| (|spadConstant| $ 60) . #2=(|UPOLYC-;divide;2SR;50|))
             (LETT |lc|
                   (SPADCALL (SPADCALL |y| (QREFELT $ 53)) (QREFELT $ 181))
                   . #2#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((SPADCALL |x| (QREFELT $ 9)) 'NIL)
                           ('T
                            (>= (SPADCALL |x| (QREFELT $ 11))
                                (SPADCALL |y| (QREFELT $ 11))))))
                    (GO G191)))
                  (SEQ
                   (LETT |f|
                         (SPADCALL |lc| (SPADCALL |x| (QREFELT $ 53))
                                   (QREFELT $ 182))
                         . #2#)
                   (LETT |n|
                         (PROG1
                             (LETT #1#
                                   (- (SPADCALL |x| (QREFELT $ 11))
                                      (SPADCALL |y| (QREFELT $ 11)))
                                   . #2#)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         . #2#)
                   (LETT |quot|
                         (SPADCALL |quot| (SPADCALL |f| |n| (QREFELT $ 49))
                                   (QREFELT $ 65))
                         . #2#)
                   (EXIT
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL (SPADCALL |f| |n| (QREFELT $ 49))
                                              |y| (QREFELT $ 125))
                                    (QREFELT $ 143))
                          . #2#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (CONS |quot| |x|)))))))) 

(SDEFUN |UPOLYC-;integrate;2S;51| ((|p| S) ($ S))
        (SPROG ((|ans| (S)) (|d| (|NonNegativeInteger|)) (|l| (R)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 60)
                      . #1=(|UPOLYC-;integrate;2S;51|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 60) (QREFELT $ 185)))
                       (GO G191)))
                     (SEQ (LETT |l| (SPADCALL |p| (QREFELT $ 53)) . #1#)
                          (LETT |d| (+ 1 (SPADCALL |p| (QREFELT $ 11))) . #1#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |d| (QREFELT $ 187))
                                            (QREFELT $ 188))
                                           (SPADCALL |l| |d| (QREFELT $ 49))
                                           (QREFELT $ 189))
                                          (QREFELT $ 65))
                                . #1#)
                          (EXIT
                           (LETT |p| (SPADCALL |p| (QREFELT $ 55)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialCategory&;|)) 

(DEFUN |UnivariatePolynomialCategory&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|UnivariatePolynomialCategory&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|UnivariatePolynomialCategory&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 197) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|))
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|StepThrough|))
                                              (|HasCategory| |#2| '(|Ring|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|SemiRing|))
            (QSETREFV $ 50
                      (CONS (|dispatchFunction| |UPOLYC-;coerce;SaosS;14|)
                            $))))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV $ 75
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;solveLinearPolynomialEquation;LSupU;17|)
                        $))
             (QSETREFV $ 79
                       (CONS
                        (|dispatchFunction| |UPOLYC-;factorPolynomial;SupF;18|)
                        $))
             (QSETREFV $ 81
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;factorSquareFreePolynomial;SupF;19|)
                        $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |UPOLYC-;factor;SF;20|) $)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 112 (CONS (|dispatchFunction| |UPOLYC-;init;S;25|) $))
             NIL
             (QSETREFV $ 115
                       (CONS (|dispatchFunction| |UPOLYC-;nextItem;SU;27|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 117
                       (CONS (|dispatchFunction| |UPOLYC-;content;SSaosS;28|)
                             $))
             NIL
             (QSETREFV $ 122
                       (CONS (|dispatchFunction| |UPOLYC-;separate;2SR;30|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 127
                      (CONS
                       (|dispatchFunction| |UPOLYC-;differentiate;SM2S;31|)
                       $)))
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 127
                       (CONS
                        (|dispatchFunction| |UPOLYC-;differentiate;SM2S;33|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 7)
            (PROGN
             (QSETREFV $ 130
                       (CONS
                        (|dispatchFunction| |UPOLYC-;differentiate;SMS;34|) $))
             (QSETREFV $ 131
                       (CONS (|dispatchFunction| |UPOLYC-;differentiate;2S;35|)
                             $))
             (QSETREFV $ 133
                       (CONS
                        (|dispatchFunction| |UPOLYC-;differentiate;SSaosS;36|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 140 (CONS (|dispatchFunction| |UPOLYC-;elt;3F;37|) $))
             (QSETREFV $ 144
                       (CONS
                        (|dispatchFunction| |UPOLYC-;pseudoQuotient;3S;38|) $))
             (QSETREFV $ 146
                       (CONS (|dispatchFunction| |UPOLYC-;pseudoDivide;2SR;39|)
                             $))
             (QSETREFV $ 150
                       (CONS (|dispatchFunction| |UPOLYC-;composite;FSU;40|)
                             $))
             (QSETREFV $ 154
                       (CONS (|dispatchFunction| |UPOLYC-;composite;2SU;41|)
                             $))
             (QSETREFV $ 161
                       (CONS (|dispatchFunction| |UPOLYC-;elt;S2F;42|) $))
             (QSETREFV $ 162
                       (CONS (|dispatchFunction| |UPOLYC-;order;2SNni;43|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 165
                       (CONS (|dispatchFunction| |UPOLYC-;squareFree;SF;44|)
                             $))
             (QSETREFV $ 167
                       (CONS
                        (|dispatchFunction| |UPOLYC-;squareFreePart;2S;45|)
                        $)))))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV $ 174
                       (CONS
                        (|dispatchFunction| |UPOLYC-;gcdPolynomial;3Sup;46|)
                        $))
             (QSETREFV $ 177
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;squareFreePolynomial;SupF;47|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 179
                       (CONS (|dispatchFunction| |UPOLYC-;elt;F2R;48|) $))
             (QSETREFV $ 180
                       (CONS
                        (|dispatchFunction| |UPOLYC-;euclideanSize;SNni;49|)
                        $))
             (QSETREFV $ 184
                       (CONS (|dispatchFunction| |UPOLYC-;divide;2SR;50|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 190
                      (CONS (|dispatchFunction| |UPOLYC-;integrate;2S;51|)
                            $))))
          $))) 

(MAKEPROP '|UnivariatePolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|NonNegativeInteger|) (5 . |degree|)
              (|SingletonAsOrderedSet|) (10 . |create|) (|List| 12)
              |UPOLYC-;variables;SL;1| |UPOLYC-;degree;SSaosNni;2|
              (14 . |totalDegree|) |UPOLYC-;totalDegree;SLNni;3| (|List| 10)
              |UPOLYC-;degree;SLL;4| (19 . |eval|) (|List| $)
              |UPOLYC-;eval;SLLS;5| (26 . |elt|) |UPOLYC-;eval;SSaos2S;6|
              (32 . |eval|) (|List| 7) |UPOLYC-;eval;SLLS;7| (39 . |elt|)
              (45 . |coerce|) |UPOLYC-;eval;SSaosRS;8| (|Equation| 6)
              (50 . |lhs|) (|Union| 12 '"failed") (55 . |mainVariable|)
              (60 . |rhs|) (|List| 193) |UPOLYC-;eval;SLS;9|
              |UPOLYC-;mainVariable;SU;10| (65 . |minimumDegree|)
              |UPOLYC-;minimumDegree;SSaosNni;11|
              |UPOLYC-;minimumDegree;SLL;12| (70 . +) (|Mapping| 10 10)
              (76 . |mapExponents|) |UPOLYC-;monomial;SSaosNniS;13|
              (82 . |One|) (86 . |One|) (90 . |monomial|) (96 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (101 . |Zero|)
              (105 . |leadingCoefficient|) (110 . |monomial|)
              (116 . |reductum|) (121 . |makeSUP|) (126 . +)
              |UPOLYC-;makeSUP;SSup;15| (132 . |zero?|) (137 . |Zero|)
              (141 . |leadingCoefficient|) (146 . |degree|) (151 . |reductum|)
              (156 . |unmakeSUP|) (161 . +) |UPOLYC-;unmakeSUP;SupS;16|
              (|Union| 68 '"failed") (|List| 69)
              (|SparseUnivariatePolynomial| 6)
              (|PolynomialFactorizationByRecursion| 7 10 12 6)
              (167 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 73 '"failed") (|List| 74)
              (|SparseUnivariatePolynomial| $)
              (173 . |solveLinearPolynomialEquation|) (|Factored| 69)
              (179 . |factorByRecursion|) (|Factored| 74)
              (184 . |factorPolynomial|) (189 . |factorSquareFreeByRecursion|)
              (194 . |factorSquareFreePolynomial|) (|Factored| $)
              (199 . |factor|) (|Factored| 7) (204 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 86) (|:| |fctr| 7) (|:| |xpnt| 101))
              (|List| 87) (209 . |factorList|)
              (|Record| (|:| |flg| 86) (|:| |fctr| 6) (|:| |xpnt| 101))
              (|List| 90) (|Factored| 6) (214 . |makeFR|)
              (220 . |factorPolynomial|) (|Mapping| 6 51) (|Factored| 51)
              (|FactoredFunctions2| 51 6) (225 . |map|) (231 . |factor|)
              (236 . |Zero|) (|Integer|) (|Vector| 7) (240 . |minIndex|)
              (245 . |coefficient|) |UPOLYC-;vectorise;SNniV;21| (251 . |elt|)
              |UPOLYC-;unvectorise;VS;22| |UPOLYC-;retract;SR;23|
              (|Union| 7 '"failed") |UPOLYC-;retractIfCan;SU;24| (257 . |init|)
              (261 . |init|) (|Union| $ '"failed") (265 . |nextItem|)
              (270 . |nextItem|) (275 . |content|) (280 . |content|)
              (286 . |gcd|) (292 . |exquo|) (298 . =)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (304 . |separate|) (310 . >) (316 . *) (322 . *) (|Mapping| 7 7)
              (328 . |differentiate|) (335 . *) (341 . |differentiate|)
              (348 . |differentiate|) (354 . |differentiate|)
              (359 . |differentiate|) (364 . |differentiate|) (|Fraction| 6)
              (370 . |numer|) (|Fraction| $) (375 . |elt|) (381 . |denom|)
              (386 . /) (392 . |elt|) (398 . ^) (404 . |pseudoRemainder|)
              (410 . -) (416 . |pseudoQuotient|)
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (422 . |pseudoDivide|) (428 . |composite|) (434 . /)
              (|Union| 136 '"failed") (440 . |composite|) (446 . |ground?|)
              (451 . |pseudoDivide|) (457 . |exquo|) (463 . |composite|)
              (469 . |Zero|) (473 . |coerce|) (478 . ^) (484 . *) (490 . +)
              (496 . ^) (502 . |elt|) (508 . |order|)
              (|UnivariatePolynomialSquareFree| 7 6) (514 . |squareFree|)
              (519 . |squareFree|) (524 . |squareFreePart|)
              (529 . |squareFreePart|) (534 . |zero?|) (539 . |unitCanonical|)
              (544 . |content|) (549 . |primitivePart|)
              (554 . |subResultantGcd|) (560 . *) (566 . |gcdPolynomial|)
              (|UnivariatePolynomialSquareFree| 6 69) (572 . |squareFree|)
              (577 . |squareFreePolynomial|) (582 . /) (588 . |elt|)
              (594 . |euclideanSize|) (599 . |inv|) (604 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (610 . |divide|) (616 . ~=) (|Fraction| 101) (622 . |coerce|)
              (627 . |inv|) (632 . *) (638 . |integrate|) (|List| 192)
              (|Symbol|) (|Equation| $) (|Union| 186 '#1="failed")
              (|Union| 101 '#1#) (|OutputForm|))
           '#(|vectorise| 643 |variables| 649 |unvectorise| 654 |unmakeSUP| 659
              |totalDegree| 664 |squareFreePolynomial| 670 |squareFreePart| 675
              |squareFree| 680 |solveLinearPolynomialEquation| 685 |separate|
              691 |retractIfCan| 697 |retract| 702 |pseudoQuotient| 707
              |pseudoDivide| 713 |order| 719 |nextItem| 725 |monomial| 730
              |minimumDegree| 737 |makeSUP| 749 |mainVariable| 754 |integrate|
              759 |init| 764 |gcdPolynomial| 768 |factorSquareFreePolynomial|
              774 |factorPolynomial| 779 |factor| 784 |eval| 789
              |euclideanSize| 823 |elt| 828 |divide| 846 |differentiate| 852
              |degree| 876 |content| 888 |composite| 894 |coerce| 906)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 190
                                                 '(1 6 8 0 9 1 6 10 0 11 0 12 0
                                                   13 1 6 10 0 17 3 6 0 0 12 0
                                                   21 2 6 0 0 0 24 3 6 0 0 12 7
                                                   26 2 6 7 0 7 29 1 6 0 7 30 1
                                                   32 6 0 33 1 6 34 0 35 1 32 6
                                                   0 36 1 6 10 0 40 2 10 0 0 0
                                                   43 2 6 0 44 0 45 0 6 0 47 0
                                                   7 0 48 2 6 0 7 10 49 1 0 0
                                                   12 50 0 51 0 52 1 6 7 0 53 2
                                                   51 0 7 10 54 1 6 0 0 55 1 6
                                                   51 0 56 2 51 0 0 0 57 1 51 8
                                                   0 59 0 6 0 60 1 51 7 0 61 1
                                                   51 10 0 62 1 51 0 0 63 1 6 0
                                                   51 64 2 6 0 0 0 65 2 70 67
                                                   68 69 71 2 0 72 73 74 75 1
                                                   70 76 69 77 1 0 78 74 79 1
                                                   70 76 69 80 1 0 78 74 81 1 7
                                                   82 0 83 1 84 7 0 85 1 84 88
                                                   0 89 2 92 0 6 91 93 1 7 78
                                                   74 94 2 97 92 95 96 98 1 0
                                                   82 0 99 0 7 0 100 1 102 101
                                                   0 103 2 6 7 0 10 104 2 102 7
                                                   0 101 106 0 7 0 111 0 0 0
                                                   112 1 7 113 0 114 1 0 113 0
                                                   115 1 6 7 0 116 2 0 0 0 12
                                                   117 2 6 0 0 0 118 2 6 113 0
                                                   0 119 2 6 8 0 0 120 2 0 121
                                                   0 0 122 2 10 8 0 0 123 2 7 0
                                                   10 0 124 2 6 0 0 0 125 3 0 0
                                                   0 126 0 127 2 6 0 7 0 128 3
                                                   6 0 0 126 0 129 2 0 0 0 126
                                                   130 1 0 0 0 131 1 6 0 0 132
                                                   2 0 0 0 12 133 1 134 6 0 135
                                                   2 6 136 0 136 137 1 134 6 0
                                                   138 2 134 0 0 0 139 2 0 136
                                                   136 136 140 2 7 0 0 10 141 2
                                                   6 0 0 0 142 2 6 0 0 0 143 2
                                                   0 0 0 0 144 2 0 145 0 0 146
                                                   2 6 113 0 0 147 2 134 0 6 6
                                                   148 2 0 149 136 0 150 1 6 8
                                                   0 151 2 6 145 0 0 152 2 6
                                                   113 0 7 153 2 0 113 0 0 154
                                                   0 134 0 155 1 134 0 6 156 2
                                                   134 0 0 101 157 2 134 0 0 0
                                                   158 2 134 0 0 0 159 2 134 0
                                                   0 10 160 2 0 136 0 136 161 2
                                                   0 10 0 0 162 1 163 92 6 164
                                                   1 0 82 0 165 1 163 6 6 166 1
                                                   0 0 0 167 1 69 8 0 168 1 69
                                                   0 0 169 1 69 6 0 170 1 69 0
                                                   0 171 2 69 0 0 0 172 2 69 0
                                                   6 0 173 2 0 74 74 74 174 1
                                                   175 76 69 176 1 0 78 74 177
                                                   2 7 0 0 0 178 2 0 7 136 7
                                                   179 1 0 10 0 180 1 7 0 0 181
                                                   2 7 0 0 0 182 2 0 183 0 0
                                                   184 2 6 8 0 0 185 1 186 0
                                                   101 187 1 186 0 0 188 2 6 0
                                                   186 0 189 1 0 0 0 190 2 0
                                                   102 0 10 105 1 0 14 0 15 1 0
                                                   0 102 107 1 0 0 51 66 2 0 10
                                                   0 14 18 1 0 78 74 177 1 0 0
                                                   0 167 1 0 82 0 165 2 0 72 73
                                                   74 75 2 0 121 0 0 122 1 0
                                                   109 0 110 1 0 7 0 108 2 0 0
                                                   0 0 144 2 0 145 0 0 146 2 0
                                                   10 0 0 162 1 0 113 0 115 3 0
                                                   0 0 12 10 46 2 0 10 0 12 41
                                                   2 0 19 0 14 42 1 0 51 0 58 1
                                                   0 34 0 39 1 0 0 0 190 0 0 0
                                                   112 2 0 74 74 74 174 1 0 78
                                                   74 81 1 0 78 74 79 1 0 82 0
                                                   99 2 0 0 0 37 38 3 0 0 0 12
                                                   0 25 3 0 0 0 14 22 23 3 0 0
                                                   0 14 27 28 3 0 0 0 12 7 31 1
                                                   0 10 0 180 2 0 136 0 136 161
                                                   2 0 7 136 7 179 2 0 136 136
                                                   136 140 2 0 183 0 0 184 1 0
                                                   0 0 131 2 0 0 0 126 130 3 0
                                                   0 0 126 0 127 2 0 0 0 12 133
                                                   2 0 10 0 12 16 2 0 19 0 14
                                                   20 2 0 0 0 12 117 2 0 149
                                                   136 0 150 2 0 113 0 0 154 1
                                                   0 0 12 50)))))
           '|lookupComplete|)) 
