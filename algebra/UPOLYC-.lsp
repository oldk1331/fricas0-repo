
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

(SDEFUN |UPOLYC-;karatsubaDivide;SNniR;17|
        ((|p| S) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                  (QREFELT $ 68))) 

(SDEFUN |UPOLYC-;shiftRight;SNniS;18|
        ((|p| S) (|n| |NonNegativeInteger|) ($ S))
        (QCAR
         (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                   (QREFELT $ 68)))) 

(SDEFUN |UPOLYC-;shiftLeft;SNniS;19| ((|p| S) (|n| |NonNegativeInteger|) ($ S))
        (SPADCALL |p| (SPADCALL (|spadConstant| $ 48) |n| (QREFELT $ 49))
                  (QREFELT $ 71))) 

(SDEFUN |UPOLYC-;solveLinearPolynomialEquation;LSupU;20|
        ((|lpp| |List| (|SparseUnivariatePolynomial| S))
         (|pp| |SparseUnivariatePolynomial| S)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| S)) "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 77))) 

(SDEFUN |UPOLYC-;factorPolynomial;SupF;21|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 83))) 

(SDEFUN |UPOLYC-;factorSquareFreePolynomial;SupF;22|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 86))) 

(SDEFUN |UPOLYC-;factor;SF;23| ((|p| S) ($ |Factored| S))
        (SPROG
         ((#1=#:G220 NIL) (|w| NIL) (#2=#:G219 NIL) (|ansR| (|Factored| R)))
         (SEQ
          (COND
           ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
            (SEQ
             (LETT |ansR|
                   (SPADCALL (SPADCALL |p| (QREFELT $ 53)) (QREFELT $ 89))
                   . #3=(|UPOLYC-;factor;SF;23|))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |ansR| (QREFELT $ 91)) (QREFELT $ 30))
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |w| NIL . #3#)
                     (LETT #1# (SPADCALL |ansR| (QREFELT $ 95)) . #3#) G190
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
               (QREFELT $ 99)))))
           ('T
            (SPADCALL (ELT $ 64)
                      (SPADCALL (SPADCALL |p| (QREFELT $ 56)) (QREFELT $ 100))
                      (QREFELT $ 104))))))) 

(SDEFUN |UPOLYC-;vectorise;SNniV;24|
        ((|p| S) (|n| |NonNegativeInteger|) ($ |Vector| R))
        (SPROG
         ((#1=#:G221 NIL) (#2=#:G225 NIL) (|i| NIL) (|m| (|Integer|))
          (|v| (|Vector| R)))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 106))
                       . #3=(|UPOLYC-;vectorise;SNniV;24|))
                 (QREFELT $ 109))
                . #3#)
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 109)) . #3#)
               (LETT #2# (QVSIZE |v|) . #3#) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1O |v| |i|
                             (SPADCALL |p|
                                       (PROG1 (LETT #1# (- |i| |m|) . #3#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (QREFELT $ 110))
                             1)))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |v|)))) 

(SDEFUN |UPOLYC-;unvectorise;VS;25| ((|v| |Vector| R) ($ S))
        (SPROG ((|p| (S)) (#1=#:G226 NIL) (#2=#:G230 NIL) (|i| NIL))
               (SEQ
                (LETT |p| (|spadConstant| $ 60)
                      . #3=(|UPOLYC-;unvectorise;VS;25|))
                (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |v|) . #3#) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |p|
                             (SPADCALL |p|
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 112))
                                        (PROG1 (LETT #1# (- |i| 1) . #3#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 49))
                                       (QREFELT $ 65))
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |UPOLYC-;retract;SR;26| ((|p| S) ($ R))
        (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 106))
              ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
               (SPADCALL |p| (QREFELT $ 53)))
              ('T (|error| "Polynomial is not of degree 0")))) 

(SDEFUN |UPOLYC-;retractIfCan;SU;27| ((|p| S) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| (QREFELT $ 9)) (CONS 0 (|spadConstant| $ 106)))
              ((ZEROP (SPADCALL |p| (QREFELT $ 11)))
               (CONS 0 (SPADCALL |p| (QREFELT $ 53))))
              ('T (CONS 1 "failed")))) 

(SDEFUN |UPOLYC-;init;S;28| (($ S))
        (SPADCALL (|spadConstant| $ 117) (QREFELT $ 30))) 

(SDEFUN |UPOLYC-;nextItemInner| ((|n| S) ($ |Union| S #1="failed"))
        (SPROG
         ((|n3| #2=(|Union| R "failed")) (#3=#:G248 NIL) (|n2| (|Union| S #1#))
          (|n1| (S)) (|nn| #2#))
         (SEQ
          (COND
           ((SPADCALL |n| (QREFELT $ 9))
            (CONS 0
                  (SPADCALL
                   (PROG2
                       (LETT #3#
                             (SPADCALL (|spadConstant| $ 106) (QREFELT $ 120))
                             . #4=(|UPOLYC-;nextItemInner|))
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                   (QREFELT $ 30))))
           ((ZEROP (SPADCALL |n| (QREFELT $ 11)))
            (SEQ
             (LETT |nn|
                   (SPADCALL (SPADCALL |n| (QREFELT $ 53)) (QREFELT $ 120))
                   . #4#)
             (EXIT
              (COND ((QEQCAR |nn| 1) (CONS 1 "failed"))
                    (#5='T (CONS 0 (SPADCALL (QCDR |nn|) (QREFELT $ 30))))))))
           (#5#
            (SEQ (LETT |n1| (SPADCALL |n| (QREFELT $ 55)) . #4#)
                 (LETT |n2| (|UPOLYC-;nextItemInner| |n1| $) . #4#)
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
                                (LETT #3#
                                      (SPADCALL (|spadConstant| $ 117)
                                                (QREFELT $ 120))
                                      . #4#)
                                (QCDR #3#)
                              (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                            (+ 1 (SPADCALL |n1| (QREFELT $ 11)))
                            (QREFELT $ 49))
                           (QREFELT $ 65))))
                   (#5#
                    (SEQ
                     (LETT |n3|
                           (SPADCALL (SPADCALL |n| (QREFELT $ 53))
                                     (QREFELT $ 120))
                           . #4#)
                     (EXIT
                      (COND ((QEQCAR |n3| 1) (CONS 1 "failed"))
                            (#5#
                             (CONS 0
                                   (SPADCALL (QCDR |n3|)
                                             (SPADCALL |n| (QREFELT $ 11))
                                             (QREFELT $ 49)))))))))))))))) 

(SDEFUN |UPOLYC-;nextItem;SU;30| ((|n| S) ($ |Union| S "failed"))
        (SPROG ((#1=#:G261 NIL) (|n1| (|Union| S "failed")))
               (SEQ
                (LETT |n1| (|UPOLYC-;nextItemInner| |n| $)
                      . #2=(|UPOLYC-;nextItem;SU;30|))
                (EXIT
                 (COND
                  ((QEQCAR |n1| 1)
                   (CONS 0
                         (SPADCALL
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (|spadConstant| $ 117)
                                              (QREFELT $ 120))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                          (+ 1 (SPADCALL |n| (QREFELT $ 11))) (QREFELT $ 49))))
                  ('T |n1|)))))) 

(SDEFUN |UPOLYC-;content;SSaosS;31|
        ((|p| S) (|v| |SingletonAsOrderedSet|) ($ S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 122)) (QREFELT $ 30))) 

(SDEFUN |UPOLYC-;primeFactor| ((|p| S) (|q| S) ($ S))
        (SPROG ((|p1| (S)) (#1=#:G267 NIL))
               (SEQ
                (LETT |p1|
                      (PROG2
                          (LETT #1#
                                (SPADCALL |p|
                                          (SPADCALL |p| |q| (QREFELT $ 124))
                                          (QREFELT $ 125))
                                . #2=(|UPOLYC-;primeFactor|))
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                      . #2#)
                (EXIT
                 (COND ((SPADCALL |p1| |p| (QREFELT $ 126)) |p|)
                       ('T (|UPOLYC-;primeFactor| |p1| |q| $))))))) 

(SDEFUN |UPOLYC-;separate;2SR;33|
        ((|p| S) (|q| S) ($ |Record| (|:| |primePart| S) (|:| |commonPart| S)))
        (SPROG ((#1=#:G273 NIL) (|a| (S)))
               (SEQ
                (LETT |a| (|UPOLYC-;primeFactor| |p| |q| $)
                      . #2=(|UPOLYC-;separate;2SR;33|))
                (EXIT
                 (CONS |a|
                       (PROG2
                           (LETT #1# (SPADCALL |p| |a| (QREFELT $ 125)) . #2#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))))) 

(SDEFUN |UPOLYC-;differentiate;SM2S;34|
        ((|x| S) (|deriv| |Mapping| R R) (|x'| S) ($ S))
        (SPROG
         ((|d| (S)) (#1=#:G278 NIL) (|lc| (R)) (|dg| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (|spadConstant| $ 60)
                . #2=(|UPOLYC-;differentiate;SM2S;34|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                            (QREFELT $ 129)))
                 (GO G191)))
               (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #2#)
                    (LETT |d|
                          (SPADCALL
                           (SPADCALL |d|
                                     (SPADCALL |x'|
                                               (SPADCALL
                                                (SPADCALL |dg| |lc|
                                                          (QREFELT $ 130))
                                                (PROG1
                                                    (LETT #1# (- |dg| 1) . #2#)
                                                  (|check_subtype| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #1#))
                                                (QREFELT $ 49))
                                               (QREFELT $ 71))
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
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G294 NIL))
               (COND ((ZEROP |n|) (|spadConstant| $ 60))
                     ((ZEROP
                       (LETT |n1|
                             (PROG1
                                 (LETT #1# (- |n| 1) . #2=(|UPOLYC-;ncdiff|))
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             . #2#))
                      |x'|)
                     ('T
                      (SPADCALL
                       (SPADCALL |x'|
                                 (SPADCALL (|spadConstant| $ 48) |n1|
                                           (QREFELT $ 49))
                                 (QREFELT $ 71))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 49))
                        (|UPOLYC-;ncdiff| |n1| |x'| $) (QREFELT $ 71))
                       (QREFELT $ 65)))))) 

(SDEFUN |UPOLYC-;differentiate;SM2S;36|
        ((|x| S) (|deriv| |Mapping| R R) (|x'| S) ($ S))
        (SPROG ((|d| (S)) (|lc| (R)) (|dg| (|NonNegativeInteger|)))
               (SEQ
                (LETT |d| (|spadConstant| $ 60)
                      . #1=(|UPOLYC-;differentiate;SM2S;36|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #1#) 0
                         (QREFELT $ 129)))
                       (GO G191)))
                     (SEQ (LETT |lc| (SPADCALL |x| (QREFELT $ 53)) . #1#)
                          (LETT |d|
                                (SPADCALL
                                 (SPADCALL |d|
                                           (SPADCALL (SPADCALL |lc| |deriv|)
                                                     |dg| (QREFELT $ 49))
                                           (QREFELT $ 65))
                                 (SPADCALL |lc| (|UPOLYC-;ncdiff| |dg| |x'| $)
                                           (QREFELT $ 133))
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

(SDEFUN |UPOLYC-;differentiate;SMS;37| ((|x| S) (|deriv| |Mapping| R R) ($ S))
        (SPADCALL |x| |deriv| (|spadConstant| $ 47) (QREFELT $ 134))) 

(SDEFUN |UPOLYC-;differentiate;2S;38| ((|x| S) ($ S))
        (SPROG ((|d| (S)) (#1=#:G305 NIL) (|dg| (|NonNegativeInteger|)))
               (SEQ
                (LETT |d| (|spadConstant| $ 60)
                      . #2=(|UPOLYC-;differentiate;2S;38|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |dg| (SPADCALL |x| (QREFELT $ 11)) . #2#) 0
                         (QREFELT $ 129)))
                       (GO G191)))
                     (SEQ
                      (LETT |d|
                            (SPADCALL |d|
                                      (SPADCALL
                                       (SPADCALL |dg|
                                                 (SPADCALL |x| (QREFELT $ 53))
                                                 (QREFELT $ 130))
                                       (PROG1 (LETT #1# (- |dg| 1) . #2#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (QREFELT $ 49))
                                      (QREFELT $ 65))
                            . #2#)
                      (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 55)) . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |d|)))) 

(SDEFUN |UPOLYC-;differentiate;SSaosS;39|
        ((|x| S) (|v| |SingletonAsOrderedSet|) ($ S))
        (SPADCALL |x| (QREFELT $ 137))) 

(SDEFUN |UPOLYC-;elt;3F;40|
        ((|g| |Fraction| S) (|f| |Fraction| S) ($ |Fraction| S))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 140)) |f| (QREFELT $ 142))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 143)) |f| (QREFELT $ 142))
                  (QREFELT $ 144))) 

(SDEFUN |UPOLYC-;pseudoQuotient;3S;41| ((|p| S) (|q| S) ($ S))
        (SPROG ((#1=#:G353 NIL) (#2=#:G351 NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n|
                      (+
                       (- (SPADCALL |p| (QREFELT $ 11))
                          (SPADCALL |q| (QREFELT $ 11)))
                       1)
                      . #3=(|UPOLYC-;pseudoQuotient;3S;41|))
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
                                                 (|check_subtype| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#))
                                               (QREFELT $ 146))
                                     |p| (QREFELT $ 133))
                                    (SPADCALL |p| |q| (QREFELT $ 147))
                                    (QREFELT $ 148))
                                   |q| (QREFELT $ 125))
                                  . #3#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                         #1#)))))))) 

(SDEFUN |UPOLYC-;pseudoDivide;2SR;42|
        ((|p| S) (|q| S)
         ($ |Record| (|:| |coef| R) (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((#1=#:G361 NIL) (|lc| (R)) (#2=#:G359 NIL) (|prem| (S))
          (|n| (|Integer|)))
         (SEQ
          (LETT |n|
                (+
                 (- (SPADCALL |p| (QREFELT $ 11))
                    (SPADCALL |q| (QREFELT $ 11)))
                 1)
                . #3=(|UPOLYC-;pseudoDivide;2SR;42|))
          (EXIT
           (COND
            ((< |n| 1)
             (VECTOR (|spadConstant| $ 48) (|spadConstant| $ 60) |p|))
            ('T
             (SEQ (LETT |prem| (SPADCALL |p| |q| (QREFELT $ 147)) . #3#)
                  (LETT |lc|
                        (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                  (PROG1 (LETT #2# |n| . #3#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  (QREFELT $ 146))
                        . #3#)
                  (EXIT
                   (VECTOR |lc|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |lc| |p| (QREFELT $ 133))
                                       |prem| (QREFELT $ 148))
                                      |q| (QREFELT $ 125))
                                     . #3#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                           |prem|))))))))) 

(SDEFUN |UPOLYC-;composite;FSU;43|
        ((|f| |Fraction| S) (|q| S) ($ |Union| (|Fraction| S) "failed"))
        (SPROG ((|d| #1=(|Union| S "failed")) (|n| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 140)) |q|
                                (QREFELT $ 152))
                      . #2=(|UPOLYC-;composite;FSU;43|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |f| (QREFELT $ 143)) |q|
                                         (QREFELT $ 152))
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 153))))))))))))) 

(SDEFUN |UPOLYC-;composite;2SU;44| ((|p| S) (|q| S) ($ |Union| S #1="failed"))
        (SPROG
         ((#2=#:G390 NIL) (|w| #3=(|Union| S "failed")) (|u| (|Union| S #1#))
          (|v| #3#)
          (|cqr|
           (|Record| (|:| |coef| R) (|:| |quotient| S) (|:| |remainder| S))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 156)) (CONS 0 |p|))
                ('T
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |cqr| (SPADCALL |p| |q| (QREFELT $ 157))
                          . #4=(|UPOLYC-;composite;2SU;44|))
                    (COND
                     ((SPADCALL (QVELT |cqr| 2) (QREFELT $ 156))
                      (SEQ
                       (LETT |v|
                             (SPADCALL (QVELT |cqr| 2) (QVELT |cqr| 0)
                                       (QREFELT $ 158))
                             . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |v| 0)
                          (SEQ
                           (LETT |u|
                                 (SPADCALL (QVELT |cqr| 1) |q| (QREFELT $ 152))
                                 . #4#)
                           (EXIT
                            (COND
                             ((QEQCAR |u| 0)
                              (SEQ
                               (LETT |w|
                                     (SPADCALL (QCDR |u|) (QVELT |cqr| 0)
                                               (QREFELT $ 158))
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
                                                          (QREFELT $ 71))
                                                         (QREFELT $ 65)))
                                         . #4#)
                                   (GO #5=#:G387))))))))))))))))
                    (EXIT (CONS 1 "failed"))))
                  #5# (EXIT #2#))))))) 

(SDEFUN |UPOLYC-;elt;S2F;45| ((|p| S) (|f| |Fraction| S) ($ |Fraction| S))
        (SPROG
         ((|ans| (|Fraction| S)) (#1=#:G395 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 9)) (|spadConstant| $ 160))
                (#2='T
                 (SEQ
                  (LETT |ans|
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                                   (QREFELT $ 30))
                         (QREFELT $ 161))
                        . #3=(|UPOLYC-;elt;S2F;45|))
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
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 162))
                                          (QREFELT $ 163))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 53))
                                           (QREFELT $ 30))
                                 (QREFELT $ 161))
                                (QREFELT $ 164))
                               . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((ZEROP |n|) |ans|)
                         (#2#
                          (SPADCALL |ans| (SPADCALL |f| |n| (QREFELT $ 165))
                                    (QREFELT $ 163))))))))))) 

(SDEFUN |UPOLYC-;order;2SNni;46| ((|p| S) (|q| S) ($ |NonNegativeInteger|))
        (SPROG
         ((|ans| (|NonNegativeInteger|)) (#1=#:G410 NIL)
          (|u| (|Union| S "failed")))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |p| (QREFELT $ 9))
             (|error| "order: arguments must be nonzero"))
            ((< (SPADCALL |q| (QREFELT $ 11)) 1)
             (|error| "order: place must be non-trivial"))
            ('T
             (SEQ (LETT |ans| 0 . #2=(|UPOLYC-;order;2SNni;46|))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (LETT |u| (SPADCALL |p| |q| (QREFELT $ 125)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN (LETT #1# |ans| . #2#) (GO #3=#:G409)))
                           ('T
                            (SEQ (LETT |p| (QCDR |u|) . #2#)
                                 (EXIT (LETT |ans| (+ |ans| 1) . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |UPOLYC-;squareFree;SF;47| ((|p| S) ($ |Factored| S))
        (SPADCALL |p| (QREFELT $ 169))) 

(SDEFUN |UPOLYC-;squareFreePart;2S;48| ((|p| S) ($ S))
        (SPADCALL |p| (QREFELT $ 171))) 

(SDEFUN |UPOLYC-;gcdPolynomial;3Sup;49|
        ((|pp| |SparseUnivariatePolynomial| S)
         (|qq| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| S))
        (COND ((SPADCALL |pp| (QREFELT $ 173)) (SPADCALL |qq| (QREFELT $ 174)))
              ((SPADCALL |qq| (QREFELT $ 173)) (SPADCALL |pp| (QREFELT $ 174)))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |pp| (QREFELT $ 175))
                           (SPADCALL |qq| (QREFELT $ 175)) (QREFELT $ 124))
                 (SPADCALL
                  (SPADCALL (SPADCALL |pp| (QREFELT $ 176))
                            (SPADCALL |qq| (QREFELT $ 176)) (QREFELT $ 177))
                  (QREFELT $ 176))
                 (QREFELT $ 178))
                (QREFELT $ 174))))) 

(SDEFUN |UPOLYC-;squareFreePolynomial;SupF;50|
        ((|pp| |SparseUnivariatePolynomial| S)
         ($ |Factored| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| (QREFELT $ 181))) 

(SDEFUN |UPOLYC-;elt;F2R;51| ((|f| |Fraction| S) (|r| R) ($ R))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 140)) |r| (QREFELT $ 29))
                  (SPADCALL (SPADCALL |f| (QREFELT $ 143)) |r| (QREFELT $ 29))
                  (QREFELT $ 183))) 

(SDEFUN |UPOLYC-;euclideanSize;SNni;52| ((|x| S) ($ |NonNegativeInteger|))
        (COND
         ((SPADCALL |x| (QREFELT $ 9))
          (|error| "euclideanSize called on 0 in Univariate Polynomial"))
         ('T (SPADCALL |x| (QREFELT $ 11))))) 

(SDEFUN |UPOLYC-;divide;2SR;53|
        ((|x| S) (|y| S) ($ |Record| (|:| |quotient| S) (|:| |remainder| S)))
        (SPROG
         ((|quot| (S)) (|n| (|NonNegativeInteger|)) (#1=#:G424 NIL) (|f| (R))
          (|lc| (R)))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 9))
            (|error| "division by 0 in Univariate Polynomials"))
           ('T
            (SEQ
             (LETT |quot| (|spadConstant| $ 60) . #2=(|UPOLYC-;divide;2SR;53|))
             (LETT |lc|
                   (SPADCALL (SPADCALL |y| (QREFELT $ 53)) (QREFELT $ 186))
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
                                   (QREFELT $ 187))
                         . #2#)
                   (LETT |n|
                         (PROG1
                             (LETT #1#
                                   (- (SPADCALL |x| (QREFELT $ 11))
                                      (SPADCALL |y| (QREFELT $ 11)))
                                   . #2#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         . #2#)
                   (LETT |quot|
                         (SPADCALL |quot| (SPADCALL |f| |n| (QREFELT $ 49))
                                   (QREFELT $ 65))
                         . #2#)
                   (EXIT
                    (LETT |x|
                          (SPADCALL |x|
                                    (SPADCALL (SPADCALL |f| |n| (QREFELT $ 49))
                                              |y| (QREFELT $ 71))
                                    (QREFELT $ 148))
                          . #2#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (CONS |quot| |x|)))))))) 

(SDEFUN |UPOLYC-;integrate;2S;54| ((|p| S) ($ S))
        (SPROG ((|ans| (S)) (|d| (|NonNegativeInteger|)) (|l| (R)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 60)
                      . #1=(|UPOLYC-;integrate;2S;54|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |p| (|spadConstant| $ 60) (QREFELT $ 189)))
                       (GO G191)))
                     (SEQ (LETT |l| (SPADCALL |p| (QREFELT $ 53)) . #1#)
                          (LETT |d| (+ 1 (SPADCALL |p| (QREFELT $ 11))) . #1#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |d| (QREFELT $ 191))
                                            (QREFELT $ 192))
                                           (SPADCALL |l| |d| (QREFELT $ 49))
                                           (QREFELT $ 193))
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
          (LETT $ (GETREFV 201) . #1#)
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
                                                             '(|StepThrough|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV $ 81
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;solveLinearPolynomialEquation;LSupU;20|)
                        $))
             (QSETREFV $ 85
                       (CONS
                        (|dispatchFunction| |UPOLYC-;factorPolynomial;SupF;21|)
                        $))
             (QSETREFV $ 87
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;factorSquareFreePolynomial;SupF;22|)
                        $))
             (QSETREFV $ 105
                       (CONS (|dispatchFunction| |UPOLYC-;factor;SF;23|) $)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 118 (CONS (|dispatchFunction| |UPOLYC-;init;S;28|) $))
             NIL
             (QSETREFV $ 121
                       (CONS (|dispatchFunction| |UPOLYC-;nextItem;SU;30|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 123
                       (CONS (|dispatchFunction| |UPOLYC-;content;SSaosS;31|)
                             $))
             NIL
             (QSETREFV $ 128
                       (CONS (|dispatchFunction| |UPOLYC-;separate;2SR;33|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV $ 132
                      (CONS
                       (|dispatchFunction| |UPOLYC-;differentiate;SM2S;34|)
                       $)))
           ('T
            (PROGN
             (QSETREFV $ 132
                       (CONS
                        (|dispatchFunction| |UPOLYC-;differentiate;SM2S;36|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV $ 145 (CONS (|dispatchFunction| |UPOLYC-;elt;3F;40|) $))
             (QSETREFV $ 149
                       (CONS
                        (|dispatchFunction| |UPOLYC-;pseudoQuotient;3S;41|) $))
             (QSETREFV $ 151
                       (CONS (|dispatchFunction| |UPOLYC-;pseudoDivide;2SR;42|)
                             $))
             (QSETREFV $ 155
                       (CONS (|dispatchFunction| |UPOLYC-;composite;FSU;43|)
                             $))
             (QSETREFV $ 159
                       (CONS (|dispatchFunction| |UPOLYC-;composite;2SU;44|)
                             $))
             (QSETREFV $ 166
                       (CONS (|dispatchFunction| |UPOLYC-;elt;S2F;45|) $))
             (QSETREFV $ 167
                       (CONS (|dispatchFunction| |UPOLYC-;order;2SNni;46|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 170
                       (CONS (|dispatchFunction| |UPOLYC-;squareFree;SF;47|)
                             $))
             (QSETREFV $ 172
                       (CONS
                        (|dispatchFunction| |UPOLYC-;squareFreePart;2S;48|)
                        $)))))
          (COND
           ((|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
            (PROGN
             (QSETREFV $ 179
                       (CONS
                        (|dispatchFunction| |UPOLYC-;gcdPolynomial;3Sup;49|)
                        $))
             (QSETREFV $ 182
                       (CONS
                        (|dispatchFunction|
                         |UPOLYC-;squareFreePolynomial;SupF;50|)
                        $)))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 184
                       (CONS (|dispatchFunction| |UPOLYC-;elt;F2R;51|) $))
             (QSETREFV $ 185
                       (CONS
                        (|dispatchFunction| |UPOLYC-;euclideanSize;SNni;52|)
                        $))
             (QSETREFV $ 188
                       (CONS (|dispatchFunction| |UPOLYC-;divide;2SR;53|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV $ 194
                      (CONS (|dispatchFunction| |UPOLYC-;integrate;2S;54|)
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
              (60 . |rhs|) (|List| 197) |UPOLYC-;eval;SLS;9|
              |UPOLYC-;mainVariable;SU;10| (65 . |minimumDegree|)
              |UPOLYC-;minimumDegree;SSaosNni;11|
              |UPOLYC-;minimumDegree;SLL;12| (70 . +) (|Mapping| 10 10)
              (76 . |mapExponents|) |UPOLYC-;monomial;SSaosNniS;13|
              (82 . |One|) (86 . |One|) (90 . |monomial|)
              |UPOLYC-;coerce;SaosS;14| (|SparseUnivariatePolynomial| 7)
              (96 . |Zero|) (100 . |leadingCoefficient|) (105 . |monomial|)
              (111 . |reductum|) (116 . |makeSUP|) (121 . +)
              |UPOLYC-;makeSUP;SSup;15| (127 . |zero?|) (132 . |Zero|)
              (136 . |leadingCoefficient|) (141 . |degree|) (146 . |reductum|)
              (151 . |unmakeSUP|) (156 . +) |UPOLYC-;unmakeSUP;SupS;16|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (162 . |monicDivide|) |UPOLYC-;karatsubaDivide;SNniR;17|
              |UPOLYC-;shiftRight;SNniS;18| (168 . *)
              |UPOLYC-;shiftLeft;SNniS;19| (|Union| 74 '"failed") (|List| 75)
              (|SparseUnivariatePolynomial| 6)
              (|PolynomialFactorizationByRecursionUnivariate| 7 6)
              (174 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 79 '"failed") (|List| 80)
              (|SparseUnivariatePolynomial| $)
              (180 . |solveLinearPolynomialEquation|) (|Factored| 75)
              (186 . |factorByRecursion|) (|Factored| 80)
              (191 . |factorPolynomial|) (196 . |factorSquareFreeByRecursion|)
              (201 . |factorSquareFreePolynomial|) (|Factored| $)
              (206 . |factor|) (|Factored| 7) (211 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 92) (|:| |fctr| 7) (|:| |xpnt| 107))
              (|List| 93) (216 . |factorList|)
              (|Record| (|:| |flg| 92) (|:| |fctr| 6) (|:| |xpnt| 107))
              (|List| 96) (|Factored| 6) (221 . |makeFR|)
              (227 . |factorPolynomial|) (|Mapping| 6 51) (|Factored| 51)
              (|FactoredFunctions2| 51 6) (232 . |map|) (238 . |factor|)
              (243 . |Zero|) (|Integer|) (|Vector| 7) (247 . |minIndex|)
              (252 . |coefficient|) |UPOLYC-;vectorise;SNniV;24| (258 . |elt|)
              |UPOLYC-;unvectorise;VS;25| |UPOLYC-;retract;SR;26|
              (|Union| 7 '"failed") |UPOLYC-;retractIfCan;SU;27| (264 . |init|)
              (268 . |init|) (|Union| $ '"failed") (272 . |nextItem|)
              (277 . |nextItem|) (282 . |content|) (287 . |content|)
              (293 . |gcd|) (299 . |exquo|) (305 . =)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (311 . |separate|) (317 . >) (323 . *) (|Mapping| 7 7)
              (329 . |differentiate|) (336 . *) (342 . |differentiate|)
              |UPOLYC-;differentiate;SMS;37| |UPOLYC-;differentiate;2S;38|
              (349 . |differentiate|) |UPOLYC-;differentiate;SSaosS;39|
              (|Fraction| 6) (354 . |numer|) (|Fraction| $) (359 . |elt|)
              (365 . |denom|) (370 . /) (376 . |elt|) (382 . ^)
              (388 . |pseudoRemainder|) (394 . -) (400 . |pseudoQuotient|)
              (|Record| (|:| |coef| 7) (|:| |quotient| $) (|:| |remainder| $))
              (406 . |pseudoDivide|) (412 . |composite|) (418 . /)
              (|Union| 141 '"failed") (424 . |composite|) (430 . |ground?|)
              (435 . |pseudoDivide|) (441 . |exquo|) (447 . |composite|)
              (453 . |Zero|) (457 . |coerce|) (462 . ^) (468 . *) (474 . +)
              (480 . ^) (486 . |elt|) (492 . |order|)
              (|UnivariatePolynomialSquareFree| 7 6) (498 . |squareFree|)
              (503 . |squareFree|) (508 . |squareFreePart|)
              (513 . |squareFreePart|) (518 . |zero?|) (523 . |unitCanonical|)
              (528 . |content|) (533 . |primitivePart|)
              (538 . |subResultantGcd|) (544 . *) (550 . |gcdPolynomial|)
              (|UnivariatePolynomialSquareFree| 6 75) (556 . |squareFree|)
              (561 . |squareFreePolynomial|) (566 . /) (572 . |elt|)
              (578 . |euclideanSize|) (583 . |inv|) (588 . *) (594 . |divide|)
              (600 . ~=) (|Fraction| 107) (606 . |coerce|) (611 . |inv|)
              (616 . *) (622 . |integrate|) (|List| 196) (|Symbol|)
              (|Equation| $) (|Union| 107 '#1="failed") (|Union| 190 '#1#)
              (|OutputForm|))
           '#(|vectorise| 627 |variables| 633 |unvectorise| 638 |unmakeSUP| 643
              |totalDegree| 648 |squareFreePolynomial| 654 |squareFreePart| 659
              |squareFree| 664 |solveLinearPolynomialEquation| 669 |shiftRight|
              675 |shiftLeft| 681 |separate| 687 |retractIfCan| 693 |retract|
              698 |pseudoQuotient| 703 |pseudoDivide| 709 |order| 715
              |nextItem| 721 |monomial| 726 |minimumDegree| 733 |makeSUP| 745
              |mainVariable| 750 |karatsubaDivide| 755 |integrate| 761 |init|
              766 |gcdPolynomial| 770 |factorSquareFreePolynomial| 776
              |factorPolynomial| 781 |factor| 786 |eval| 791 |euclideanSize|
              825 |elt| 830 |divide| 848 |differentiate| 854 |degree| 878
              |content| 890 |composite| 896 |coerce| 908)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 194
                                                 '(1 6 8 0 9 1 6 10 0 11 0 12 0
                                                   13 1 6 10 0 17 3 6 0 0 12 0
                                                   21 2 6 0 0 0 24 3 6 0 0 12 7
                                                   26 2 6 7 0 7 29 1 6 0 7 30 1
                                                   32 6 0 33 1 6 34 0 35 1 32 6
                                                   0 36 1 6 10 0 40 2 10 0 0 0
                                                   43 2 6 0 44 0 45 0 6 0 47 0
                                                   7 0 48 2 6 0 7 10 49 0 51 0
                                                   52 1 6 7 0 53 2 51 0 7 10 54
                                                   1 6 0 0 55 1 6 51 0 56 2 51
                                                   0 0 0 57 1 51 8 0 59 0 6 0
                                                   60 1 51 7 0 61 1 51 10 0 62
                                                   1 51 0 0 63 1 6 0 51 64 2 6
                                                   0 0 0 65 2 6 67 0 0 68 2 6 0
                                                   0 0 71 2 76 73 74 75 77 2 0
                                                   78 79 80 81 1 76 82 75 83 1
                                                   0 84 80 85 1 76 82 75 86 1 0
                                                   84 80 87 1 7 88 0 89 1 90 7
                                                   0 91 1 90 94 0 95 2 98 0 6
                                                   97 99 1 7 84 80 100 2 103 98
                                                   101 102 104 1 0 88 0 105 0 7
                                                   0 106 1 108 107 0 109 2 6 7
                                                   0 10 110 2 108 7 0 107 112 0
                                                   7 0 117 0 0 0 118 1 7 119 0
                                                   120 1 0 119 0 121 1 6 7 0
                                                   122 2 0 0 0 12 123 2 6 0 0 0
                                                   124 2 6 119 0 0 125 2 6 8 0
                                                   0 126 2 0 127 0 0 128 2 10 8
                                                   0 0 129 2 7 0 10 0 130 3 0 0
                                                   0 131 0 132 2 6 0 7 0 133 3
                                                   6 0 0 131 0 134 1 6 0 0 137
                                                   1 139 6 0 140 2 6 141 0 141
                                                   142 1 139 6 0 143 2 139 0 0
                                                   0 144 2 0 141 141 141 145 2
                                                   7 0 0 10 146 2 6 0 0 0 147 2
                                                   6 0 0 0 148 2 0 0 0 0 149 2
                                                   0 150 0 0 151 2 6 119 0 0
                                                   152 2 139 0 6 6 153 2 0 154
                                                   141 0 155 1 6 8 0 156 2 6
                                                   150 0 0 157 2 6 119 0 7 158
                                                   2 0 119 0 0 159 0 139 0 160
                                                   1 139 0 6 161 2 139 0 0 107
                                                   162 2 139 0 0 0 163 2 139 0
                                                   0 0 164 2 139 0 0 10 165 2 0
                                                   141 0 141 166 2 0 10 0 0 167
                                                   1 168 98 6 169 1 0 88 0 170
                                                   1 168 6 6 171 1 0 0 0 172 1
                                                   75 8 0 173 1 75 0 0 174 1 75
                                                   6 0 175 1 75 0 0 176 2 75 0
                                                   0 0 177 2 75 0 6 0 178 2 0
                                                   80 80 80 179 1 180 82 75 181
                                                   1 0 84 80 182 2 7 0 0 0 183
                                                   2 0 7 141 7 184 1 0 10 0 185
                                                   1 7 0 0 186 2 7 0 0 0 187 2
                                                   0 67 0 0 188 2 6 8 0 0 189 1
                                                   190 0 107 191 1 190 0 0 192
                                                   2 6 0 190 0 193 1 0 0 0 194
                                                   2 0 108 0 10 111 1 0 14 0 15
                                                   1 0 0 108 113 1 0 0 51 66 2
                                                   0 10 0 14 18 1 0 84 80 182 1
                                                   0 0 0 172 1 0 88 0 170 2 0
                                                   78 79 80 81 2 0 0 0 10 70 2
                                                   0 0 0 10 72 2 0 127 0 0 128
                                                   1 0 115 0 116 1 0 7 0 114 2
                                                   0 0 0 0 149 2 0 150 0 0 151
                                                   2 0 10 0 0 167 1 0 119 0 121
                                                   3 0 0 0 12 10 46 2 0 19 0 14
                                                   42 2 0 10 0 12 41 1 0 51 0
                                                   58 1 0 34 0 39 2 0 67 0 10
                                                   69 1 0 0 0 194 0 0 0 118 2 0
                                                   80 80 80 179 1 0 84 80 87 1
                                                   0 84 80 85 1 0 88 0 105 3 0
                                                   0 0 14 22 23 3 0 0 0 14 27
                                                   28 3 0 0 0 12 0 25 3 0 0 0
                                                   12 7 31 2 0 0 0 37 38 1 0 10
                                                   0 185 2 0 141 0 141 166 2 0
                                                   7 141 7 184 2 0 141 141 141
                                                   145 2 0 67 0 0 188 3 0 0 0
                                                   131 0 132 2 0 0 0 131 135 1
                                                   0 0 0 136 2 0 0 0 12 138 2 0
                                                   10 0 12 16 2 0 19 0 14 20 2
                                                   0 0 0 12 123 2 0 154 141 0
                                                   155 2 0 119 0 0 159 1 0 0 12
                                                   50)))))
           '|lookupComplete|)) 
