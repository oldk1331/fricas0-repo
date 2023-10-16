
(PUT '|SMTS;coefficients;$S;1| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SMTS;coefficients;$S;1| ((|s| $) ($ |Stream| SMP)) |s|) 

(PUT '|SMTS;series;S$;2| '|SPADreplace| '(XLAM (|st|) |st|)) 

(SDEFUN |SMTS;series;S$;2| ((|st| |Stream| SMP) ($ $)) |st|) 

(SDEFUN |SMTS;extend;$Nni$;3| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| (+ |n| 1) (QREFELT $ 16))) 

(SDEFUN |SMTS;complete;2$;4| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 19))) 

(SDEFUN |SMTS;evalstream|
        ((|s| $) (|lv| |List| |Var|) (|lsmp| |List| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SPADCALL (|spadConstant| $ 23) (ELT $ 24)
                         (SPADCALL
                          (CONS #'|SMTS;evalstream!0| (VECTOR $ |lsmp| |lv|))
                          |s| (QREFELT $ 29))
                         (QREFELT $ 32)))) 

(SDEFUN |SMTS;evalstream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |lsmp| $)
          (LETT |lv| (QREFELT $$ 2))
          (LETT |lsmp| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |lv| |lsmp| (QREFELT $ 27)))))) 

(SDEFUN |SMTS;addvariable| ((|v| |Var|) (|s| |InnerTaylorSeries| |Coef|) ($ $))
        (SPROG ((|ints| (|Stream| (|NonNegativeInteger|))))
               (SEQ (LETT |ints| (SPADCALL 0 (QREFELT $ 35)))
                    (EXIT
                     (SPADCALL (CONS #'|SMTS;addvariable!0| (VECTOR |v| $))
                               |ints| |s| (QREFELT $ 42)))))) 

(SDEFUN |SMTS;addvariable!0| ((|n1| NIL) (|c2| NIL) ($$ NIL))
        (PROG ($ |v|)
          (LETT $ (QREFELT $$ 1))
          (LETT |v| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c2| (QREFELT $ 36)) |v| |n1|
                      (QREFELT $ 37)))))) 

(SDEFUN |SMTS;coefficient;$NniSMP;7|
        ((|x| $) (|n| |NonNegativeInteger|) ($ SMP))
        (SPROG ((#1=#:G147 NIL) (|u| (|Rep|)))
               (SEQ (LETT |u| |x|)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |u| (QREFELT $ 44)) NIL)
                                  ('T (SPADCALL |n| 0 (QREFELT $ 45)))))
                           (GO G191)))
                         (SEQ (LETT |u| (SPADCALL |u| (QREFELT $ 46)))
                              (EXIT
                               (LETT |n|
                                     (PROG1 (LETT #1# (- |n| 1))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((OR (SPADCALL |u| (QREFELT $ 44))
                          (SPADCALL |n| 0 (QREFELT $ 47)))
                      (EXIT (|spadConstant| $ 23))))
                    (EXIT (SPADCALL |u| (QREFELT $ 48)))))) 

(SDEFUN |SMTS;coefficient;$LL$;8|
        ((|s| $) (|lv| |List| |Var|) (|ln| |List| (|NonNegativeInteger|))
         ($ $))
        (SPROG NIL
               (SPADCALL
                (CONS #'|SMTS;coefficient;$LL$;8!0| (VECTOR $ |ln| |lv|))
                (SPADCALL |s| (SPADCALL (ELT $ 52) |ln| (QREFELT $ 54))
                          (QREFELT $ 55))
                (QREFELT $ 56)))) 

(SDEFUN |SMTS;coefficient;$LL$;8!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |ln| $)
          (LETT |lv| (QREFELT $$ 2))
          (LETT |ln| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |lv| |ln| (QREFELT $ 51)))))) 

(SDEFUN |SMTS;coefficient;$IeCoef;9|
        ((|s| $) (|m| |IndexedExponents| |Var|) ($ |Coef|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|mon| (|IndexedExponents| |Var|)))
         (SEQ (LETT |n| (SPADCALL (LETT |mon| |m|) (QREFELT $ 59)))
              (SEQ G190
                   (COND
                    ((NULL
                      (NULL
                       (SPADCALL (LETT |mon| (SPADCALL |mon| (QREFELT $ 60)))
                                 (QREFELT $ 61))))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |n| (+ |n| (SPADCALL |mon| (QREFELT $ 59))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |s| |n| (QREFELT $ 49)) |m|
                         (QREFELT $ 62)))))) 

(SDEFUN |SMTS;coerce;Coef$;10| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) 0 (QREFELT $ 64))) 

(SDEFUN |SMTS;*;SMP2$;11| ((|smp| SMP) (|p| $) ($ $))
        (SPADCALL |smp| |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;*;Coef2$;12| ((|r| |Coef|) (|p| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;*;$Coef$;13| ((|p| $) (|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 36)) |p| (QREFELT $ 66))) 

(SDEFUN |SMTS;mts| ((|p| SMP) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|v| (|Var|))
          (|uv| (|Union| |Var| "failed")))
         (SEQ (LETT |uv| (SPADCALL |p| (QREFELT $ 71)))
              (EXIT
               (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 64)))
                     ('T
                      (SEQ (LETT |v| (QCDR |uv|))
                           (LETT |s| (|spadConstant| $ 21))
                           (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)))
                           (SEQ G190
                                (COND
                                 ((NULL (NULL (SPADCALL |up| (QREFELT $ 75))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |s|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 13) |v|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 76))
                                                   (QREFELT $ 77))
                                                  (|SMTS;mts|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 78))
                                                   $)
                                                  (QREFELT $ 79))
                                                 (QREFELT $ 80)))
                                 (EXIT
                                  (LETT |up| (SPADCALL |up| (QREFELT $ 81)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |s|)))))))) 

(SDEFUN |SMTS;coerce;SMP$;15| ((|p| SMP) ($ $)) (|SMTS;mts| |p| $)) 

(SDEFUN |SMTS;coerce;Var$;16| ((|v| |Var|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 83)) (QREFELT $ 82))) 

(SDEFUN |SMTS;monomial;$VarNni$;17|
        ((|r| $) (|v| |Var|) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |r|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 85) |v| |n| (QREFELT $ 37)) |n|
                   (QREFELT $ 64))
                  (QREFELT $ 79))) 

(SDEFUN |SMTS;monomial;$LL$;18|
        ((|r| $) (|lv| |List| |Var|) (|ln| |List| (|NonNegativeInteger|))
         ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL (ELT $ 52) |ln| 0 (QREFELT $ 86)))
                    (EXIT
                     (SPADCALL |r|
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 85) |lv| |ln|
                                          (QREFELT $ 87))
                                |n| (QREFELT $ 64))
                               (QREFELT $ 79)))))) 

(SDEFUN |SMTS;monomial;CoefIe$;19|
        ((|r| |Coef|) (|d| |IndexedExponents| |Var|) ($ $))
        (SPROG ((|mp| (SMP)))
               (SEQ (LETT |mp| (SPADCALL |r| |d| (QREFELT $ 89)))
                    (EXIT
                     (SPADCALL |mp| (SPADCALL |mp| (QREFELT $ 90))
                               (QREFELT $ 64)))))) 

(SDEFUN |SMTS;substvar| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|c| (SMP))
          (|v| (|Var|)) (|uv| (|Union| |Var| "failed")))
         (SEQ
          (COND ((NULL |vl|) (SPADCALL |p| 0 (QREFELT $ 64)))
                (#1='T
                 (SEQ (LETT |uv| (SPADCALL |p| (QREFELT $ 71)))
                      (EXIT
                       (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 64)))
                             (#1#
                              (SEQ (LETT |v| (QCDR |uv|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |v| (|SPADfirst| |vl|)
                                                (QREFELT $ 92))
                                      (SEQ (LETT |s| (|spadConstant| $ 21))
                                           (LETT |up|
                                                 (SPADCALL |p| |v|
                                                           (QREFELT $ 73)))
                                           (SEQ G190
                                                (COND
                                                 ((NULL
                                                   (NULL
                                                    (SPADCALL |up|
                                                              (QREFELT $ 75))))
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |c|
                                                       (SPADCALL |up|
                                                                 (QREFELT $
                                                                          78)))
                                                 (LETT |s|
                                                       (SPADCALL |s|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |q|
                                                                    (QREFELT $
                                                                             94))
                                                                   (SPADCALL
                                                                    |up|
                                                                    (QREFELT $
                                                                             76))
                                                                   (QREFELT $
                                                                            95))
                                                                  (|SMTS;substvar|
                                                                   |c|
                                                                   (CDR |vl|)
                                                                   (SPADCALL
                                                                    |q|
                                                                    (QREFELT $
                                                                             96))
                                                                   $)
                                                                  (QREFELT $
                                                                           79))
                                                                 (QREFELT $
                                                                          80)))
                                                 (EXIT
                                                  (LETT |up|
                                                        (SPADCALL |up|
                                                                  (QREFELT $
                                                                           81)))))
                                                NIL (GO G190) G191 (EXIT NIL))
                                           (EXIT |s|)))
                                     (#1#
                                      (|SMTS;substvar| |p| (CDR |vl|)
                                       (SPADCALL |q| (QREFELT $ 96))
                                       $)))))))))))))) 

(SDEFUN |SMTS;sortmfirst| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| $)) (#1=#:G208 NIL) (|i| NIL) (#2=#:G207 NIL)
          (|nlv| (|List| |Var|)))
         (SEQ (LETT |nlv| (SPADCALL (ELT $ 97) |vl| (QREFELT $ 99)))
              (LETT |nq|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| NIL) (LETT #1# |nlv|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |q|
                                             (SPADCALL |i| |vl|
                                                       (QREFELT $ 100))
                                             (QREFELT $ 101))
                                   #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (|SMTS;substvar| |p| |nlv| |nq| $))))) 

(SDEFUN |SMTS;csubst;LLM;22|
        ((|vl| |List| |Var|) (|q| |List| (|Stream| SMP))
         ($ |Mapping| (|Stream| SMP) SMP))
        (SPROG NIL (CONS #'|SMTS;csubst;LLM;22!0| (VECTOR $ |q| |vl|)))) 

(SDEFUN |SMTS;csubst;LLM;22!0| ((|p1| NIL) ($$ NIL))
        (PROG (|vl| |q| $)
          (LETT |vl| (QREFELT $$ 2))
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SMTS;sortmfirst| |p1| |vl| |q| $))))) 

(SDEFUN |SMTS;restCheck| ((|s| |Stream| SMP) ($ |Stream| SMP))
        (COND ((SPADCALL |s| (QREFELT $ 44)) |s|)
              ((NULL (SPADCALL (SPADCALL |s| (QREFELT $ 48)) (QREFELT $ 105)))
               (|error| "eval: constant coefficient should be 0"))
              ('T (SPADCALL |s| (QREFELT $ 106))))) 

(SDEFUN |SMTS;eval;$LL$;24| ((|s| $) (|v| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| (|Stream| SMP))) (#1=#:G223 NIL) (|i| NIL)
          (#2=#:G222 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |v|) (SPADCALL |q| (QREFELT $ 107))
                      (QREFELT $ 47))
            (|error|
             "eval: number of variables should equal number of values"))
           ('T
            (SEQ
             (LETT |nq|
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |i| NIL) (LETT #1# |q|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|SMTS;restCheck| |i| $) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |v| |nq| (QREFELT $ 104)) |s|
                         (QREFELT $ 110))
               (QREFELT $ 111))))))))) 

(SDEFUN |SMTS;substmts| ((|v| |Var|) (|p| SMP) (|q| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| ($)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)))
              (LETT |ss| (|spadConstant| $ 21))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |up| (QREFELT $ 75)))) (GO G191)))
                   (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 76)))
                        (LETT |c| (SPADCALL |up| (QREFELT $ 78)))
                        (LETT |ss|
                              (SPADCALL |ss|
                                        (SPADCALL |c|
                                                  (SPADCALL |q| |d|
                                                            (QREFELT $ 95))
                                                  (QREFELT $ 67))
                                        (QREFELT $ 80)))
                        (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 81)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ss|)))) 

(SDEFUN |SMTS;subststream|
        ((|v| |Var|) (|p| SMP) (|q| |Stream| SMP) ($ |Stream| SMP))
        (|SMTS;substmts| |v| |p| |q| $)) 

(SDEFUN |SMTS;comp1|
        ((|v| |Var|) (|r| |Stream| SMP) (|t| |Stream| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|SMTS;comp1!0| (VECTOR $ |t| |v|)) |r|
                          (QREFELT $ 110))
                (QREFELT $ 111)))) 

(SDEFUN |SMTS;comp1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|v| |t| $)
          (LETT |v| (QREFELT $$ 2))
          (LETT |t| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SMTS;subststream| |v| |p1| |t| $))))) 

(SDEFUN |SMTS;comp|
        ((|v| |Var|) (|s| |Stream| SMP) (|t| |Stream| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SMTS;comp!0| (VECTOR |v| |t| $ |s|))
                          (QREFELT $ 117))))) 

(SDEFUN |SMTS;comp!0| (($$ NIL))
        (PROG (|s| $ |t| |v|)
          (LETT |s| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |t| (QREFELT $$ 1))
          (LETT |v| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f| NIL) (|r| NIL))
                   (SEQ
                    (COND ((SPADCALL |s| (QREFELT $ 44)) |s|)
                          ('T
                           (SEQ (LETT |f| (SPADCALL |s| (QREFELT $ 48)))
                                (LETT |r| (SPADCALL |s| (QREFELT $ 106)))
                                (EXIT
                                 (COND ((SPADCALL |r| (QREFELT $ 44)) |s|)
                                       ((SPADCALL |t| (QREFELT $ 44))
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL (QREFELT $ 113))
                                                   $)
                                                  (QREFELT $ 115)))
                                       ((NULL
                                         (SPADCALL
                                          (SPADCALL |t| (QREFELT $ 48))
                                          (QREFELT $ 105)))
                                        (|error|
                                         "eval: constant coefficient should be zero"))
                                       ('T
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL |t|
                                                             (QREFELT $ 106))
                                                   $)
                                                  (QREFELT $ 115)))))))))))))) 

(SDEFUN |SMTS;eval;$Var2$;29| ((|s| $) (|v| |Var|) (|t| $) ($ $))
        (|SMTS;comp| |v| |s| |t| $)) 

(SDEFUN |SMTS;differentiate;$Var$;30| ((|s| $) (|v| |Var|) ($ $))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT $ 44)) (|spadConstant| $ 21))
                     ('T
                      (SPADCALL
                       (CONS #'|SMTS;differentiate;$Var$;30!0| (VECTOR $ |v|))
                       (SPADCALL |s| (QREFELT $ 46)) (QREFELT $ 56)))))) 

(SDEFUN |SMTS;differentiate;$Var$;30!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 119)))))) 

(PUT '|SMTS;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SMTS;stream| ((|x| $) ($ |Rep|)) |x|) 

(SDEFUN |SMTS;^;$F$;32| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |r| (|SMTS;stream| |x| $) (QREFELT $ 122))) 

(SDEFUN |SMTS;*;F2$;33| ((|r| |Fraction| (|Integer|)) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;F2$;33!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 125)))) 

(SDEFUN |SMTS;*;F2$;33!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r| |z1| (QREFELT $ 124)))))) 

(SDEFUN |SMTS;*;$F$;34| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;$F$;34!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 125)))) 

(SDEFUN |SMTS;*;$F$;34!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 127)))))) 

(SDEFUN |SMTS;exp;2$;35| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 130))) 

(SDEFUN |SMTS;log;2$;36| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 132))) 

(SDEFUN |SMTS;sin;2$;37| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 134))) 

(SDEFUN |SMTS;cos;2$;38| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 136))) 

(SDEFUN |SMTS;tan;2$;39| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 138))) 

(SDEFUN |SMTS;cot;2$;40| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 140))) 

(SDEFUN |SMTS;sec;2$;41| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 142))) 

(SDEFUN |SMTS;csc;2$;42| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 144))) 

(SDEFUN |SMTS;asin;2$;43| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 146))) 

(SDEFUN |SMTS;acos;2$;44| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 148))) 

(SDEFUN |SMTS;atan;2$;45| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 150))) 

(SDEFUN |SMTS;acot;2$;46| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 152))) 

(SDEFUN |SMTS;asec;2$;47| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 154))) 

(SDEFUN |SMTS;acsc;2$;48| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 156))) 

(SDEFUN |SMTS;sinh;2$;49| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 158))) 

(SDEFUN |SMTS;cosh;2$;50| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 160))) 

(SDEFUN |SMTS;tanh;2$;51| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 162))) 

(SDEFUN |SMTS;coth;2$;52| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 164))) 

(SDEFUN |SMTS;sech;2$;53| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 166))) 

(SDEFUN |SMTS;csch;2$;54| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 168))) 

(SDEFUN |SMTS;asinh;2$;55| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 170))) 

(SDEFUN |SMTS;acosh;2$;56| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 172))) 

(SDEFUN |SMTS;atanh;2$;57| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 174))) 

(SDEFUN |SMTS;acoth;2$;58| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 176))) 

(SDEFUN |SMTS;asech;2$;59| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 178))) 

(SDEFUN |SMTS;acsch;2$;60| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 180))) 

(SDEFUN |SMTS;intsmp| ((|v| |Var|) (|p| SMP) ($ SMP))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| (SMP)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |up| (SPADCALL |p| |v| (QREFELT $ 73)))
              (LETT |ss| (|spadConstant| $ 23))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |up| (QREFELT $ 75)))) (GO G191)))
                   (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 76)))
                        (LETT |c| (SPADCALL |up| (QREFELT $ 78)))
                        (LETT |ss|
                              (SPADCALL |ss|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (+ |d| 1) (QREFELT $ 182))
                                          (QREFELT $ 183))
                                         (SPADCALL |c| |v| (+ |d| 1)
                                                   (QREFELT $ 37))
                                         (QREFELT $ 124))
                                        (QREFELT $ 24)))
                        (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 81)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ss|)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;62|
        ((|f| |Mapping| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 36))
                         (SPADCALL
                          (CONS #'|SMTS;fintegrate;MVarCoef$;62!1|
                                (VECTOR |f| |v| $))
                          (QREFELT $ 184))
                         (QREFELT $ 114)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;62!1| (($$ NIL))
        (PROG ($ |v| |f|)
          (LETT $ (QREFELT $$ 2))
          (LETT |v| (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|SMTS;fintegrate;MVarCoef$;62!0| (VECTOR $ |v|))
                    (SPADCALL |f|) (QREFELT $ 56))))))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;62!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;integrate;$VarCoef$;63| ((|s| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 36))
                         (SPADCALL
                          (CONS #'|SMTS;integrate;$VarCoef$;63!0|
                                (VECTOR $ |v|))
                          |s| (QREFELT $ 56))
                         (QREFELT $ 114)))) 

(SDEFUN |SMTS;integrate;$VarCoef$;63!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;integrate;$Var$;64| ((|s| $) (|v| |Var|) ($ $))
        (SPADCALL |s| |v| (|spadConstant| $ 22) (QREFELT $ 186))) 

(SDEFUN |SMTS;tout| ((|p| SMP) ($ |OutputForm|))
        (SPROG ((|pe| (|OutputForm|)))
               (SEQ (LETT |pe| (SPADCALL |p| (QREFELT $ 189)))
                    (EXIT
                     (COND ((SPADCALL |p| (QREFELT $ 190)) |pe|)
                           ('T (SPADCALL |pe| (QREFELT $ 191)))))))) 

(PUT '|SMTS;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |SMTS;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |SMTS;coerce;$Of;67| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu| ($)) (|uu1| ($)) (|n| NIL)
          (#1=#:G365 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |uu| |s|)
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 44))
                 (SPADCALL (|spadConstant| $ 23) (QREFELT $ 189)))
                (#2='T
                 (SEQ (LETT |count| |$streamCount|) (LETT |l| NIL)
                      (SEQ (LETT |n| 0) (LETT #1# |count|) G190
                           (COND
                            ((OR (|greater_SI| |n| #1#)
                                 (NULL (NULL (SPADCALL |uu| (QREFELT $ 44)))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                        (|spadConstant| $ 23) (QREFELT $ 192))
                              (LETT |l|
                                    (CONS
                                     (|SMTS;tout|
                                      (SPADCALL |uu| (QREFELT $ 48)) $)
                                     |l|))))
                            (EXIT (LETT |uu| (SPADCALL |uu| (QREFELT $ 46)))))
                           (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                      (COND
                       ((|SMTS;showAll?| $)
                        (SEQ (LETT |uu1| |uu|)
                             (EXIT
                              (SEQ (LETT |n| |n|) G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |uu| (QREFELT $ 193))
                                        (NULL
                                         (SPADCALL |uu1|
                                                   (SPADCALL |uu|
                                                             (QREFELT $ 46))
                                                   (QREFELT $ 194))))
                                       ('T NIL)))
                                     (GO G191)))
                                   (SEQ
                                    (COND
                                     ((SPADCALL (SPADCALL |uu| (QREFELT $ 48))
                                                (|spadConstant| $ 23)
                                                (QREFELT $ 192))
                                      (LETT |l|
                                            (CONS
                                             (|SMTS;tout|
                                              (SPADCALL |uu| (QREFELT $ 48)) $)
                                             |l|))))
                                    (COND
                                     ((ODDP |n|)
                                      (LETT |uu1|
                                            (SPADCALL |uu1| (QREFELT $ 46)))))
                                    (EXIT
                                     (LETT |uu|
                                           (SPADCALL |uu| (QREFELT $ 46)))))
                                   (LETT |n| (+ |n| 1)) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 195)) |l|)
                                  (#2#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 46))
                                                (QREFELT $ 194))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 48))
                                         (|spadConstant| $ 23) (QREFELT $ 196))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL (SPADCALL 'O (QREFELT $ 198))
                                                (LIST
                                                 (SPADCALL |n|
                                                           (QREFELT $ 199)))
                                                (QREFELT $ 200))
                                      |l|))))))
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 23) (QREFELT $ 189)))
                        (#2#
                         (SPADCALL (ELT $ 201) (NREVERSE |l|)
                                   (QREFELT $ 204)))))))))))) 

(SDEFUN |SMTS;/;$Coef$;68| ((|p| $) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;/;$Coef$;68!0| (VECTOR $ |r|))
                         (|SMTS;stream| |p| $) (QREFELT $ 125)))) 

(SDEFUN |SMTS;/;$Coef$;68!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 206)))))) 

(DECLAIM (NOTINLINE |SparseMultivariateTaylorSeries;|)) 

(DEFUN |SparseMultivariateTaylorSeries| (&REST #1=#:G376)
  (SPROG NIL
         (PROG (#2=#:G377)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariateTaylorSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateTaylorSeries;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateTaylorSeries|)))))))))) 

(DEFUN |SparseMultivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G375 NIL) (|pv$| NIL) (#2=#:G374 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|SparseMultivariateTaylorSeries| DV$1 DV$2 DV$3))
    (LETT $ (GETREFV 218))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateTaylorSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 128))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 256))
    (AND
     (OR (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #1#)
     (|augmentPredVector| $ 512))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Stream| |#3|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 123 (CONS (|dispatchFunction| |SMTS;^;$F$;32|) $))
       (QSETREFV $ 126 (CONS (|dispatchFunction| |SMTS;*;F2$;33|) $))
       (QSETREFV $ 128 (CONS (|dispatchFunction| |SMTS;*;$F$;34|) $))
       (QSETREFV $ 131 (CONS (|dispatchFunction| |SMTS;exp;2$;35|) $))
       (QSETREFV $ 133 (CONS (|dispatchFunction| |SMTS;log;2$;36|) $))
       (QSETREFV $ 135 (CONS (|dispatchFunction| |SMTS;sin;2$;37|) $))
       (QSETREFV $ 137 (CONS (|dispatchFunction| |SMTS;cos;2$;38|) $))
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMTS;tan;2$;39|) $))
       (QSETREFV $ 141 (CONS (|dispatchFunction| |SMTS;cot;2$;40|) $))
       (QSETREFV $ 143 (CONS (|dispatchFunction| |SMTS;sec;2$;41|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |SMTS;csc;2$;42|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |SMTS;asin;2$;43|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |SMTS;acos;2$;44|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |SMTS;atan;2$;45|) $))
       (QSETREFV $ 153 (CONS (|dispatchFunction| |SMTS;acot;2$;46|) $))
       (QSETREFV $ 155 (CONS (|dispatchFunction| |SMTS;asec;2$;47|) $))
       (QSETREFV $ 157 (CONS (|dispatchFunction| |SMTS;acsc;2$;48|) $))
       (QSETREFV $ 159 (CONS (|dispatchFunction| |SMTS;sinh;2$;49|) $))
       (QSETREFV $ 161 (CONS (|dispatchFunction| |SMTS;cosh;2$;50|) $))
       (QSETREFV $ 163 (CONS (|dispatchFunction| |SMTS;tanh;2$;51|) $))
       (QSETREFV $ 165 (CONS (|dispatchFunction| |SMTS;coth;2$;52|) $))
       (QSETREFV $ 167 (CONS (|dispatchFunction| |SMTS;sech;2$;53|) $))
       (QSETREFV $ 169 (CONS (|dispatchFunction| |SMTS;csch;2$;54|) $))
       (QSETREFV $ 171 (CONS (|dispatchFunction| |SMTS;asinh;2$;55|) $))
       (QSETREFV $ 173 (CONS (|dispatchFunction| |SMTS;acosh;2$;56|) $))
       (QSETREFV $ 175 (CONS (|dispatchFunction| |SMTS;atanh;2$;57|) $))
       (QSETREFV $ 177 (CONS (|dispatchFunction| |SMTS;acoth;2$;58|) $))
       (QSETREFV $ 179 (CONS (|dispatchFunction| |SMTS;asech;2$;59|) $))
       (QSETREFV $ 181 (CONS (|dispatchFunction| |SMTS;acsch;2$;60|) $))
       (QSETREFV $ 185
                 (CONS (|dispatchFunction| |SMTS;fintegrate;MVarCoef$;62|) $))
       (QSETREFV $ 186
                 (CONS (|dispatchFunction| |SMTS;integrate;$VarCoef$;63|) $))
       (QSETREFV $ 187
                 (CONS (|dispatchFunction| |SMTS;integrate;$Var$;64|) $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 207 (CONS (|dispatchFunction| |SMTS;/;$Coef$;68|) $)))))
    $))) 

(MAKEPROP '|SparseMultivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerTaylorSeries| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Stream| 8)
              |SMTS;coefficients;$S;1| |SMTS;series;S$;2| (0 . |One|)
              (4 . |One|) (|Integer|) (8 . |extend|) (|NonNegativeInteger|)
              |SMTS;extend;$Nni$;3| (14 . |complete|) |SMTS;complete;2$;4|
              (19 . |Zero|) (23 . |Zero|) (27 . |Zero|) (31 . +) (|List| 7)
              (|List| $) (37 . |eval|) (|Mapping| 8 8) (44 . |map|)
              (|Mapping| 8 8 8) (|StreamFunctions2| 8 8) (50 . |scan|)
              (|Stream| 15) (|StreamTaylorSeriesOperations| 8)
              (57 . |integers|) (62 . |coerce|) (67 . |monomial|)
              (|Mapping| 8 17 6) (|Stream| 17) (|Stream| 6)
              (|StreamFunctions3| 17 6 8) (74 . |map|) (|Boolean|)
              (81 . |empty?|) (86 . >) (92 . |rst|) (97 . ~=) (103 . |frst|)
              |SMTS;coefficient;$NniSMP;7| (|List| 17) (108 . |coefficient|)
              (115 . +) (|Mapping| 17 17 17) (121 . |reduce|) (127 . |rest|)
              (133 . |map|) |SMTS;coefficient;$LL$;8| (|IndexedExponents| 7)
              (139 . |leadingCoefficient|) (144 . |reductum|) (149 . |zero?|)
              (154 . |coefficient|) |SMTS;coefficient;$IeCoef;9|
              (160 . |monom|) |SMTS;coerce;Coef$;10| (166 . *)
              |SMTS;*;SMP2$;11| |SMTS;*;Coef2$;12| |SMTS;*;$Coef$;13|
              (|Union| 7 '"failed") (172 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (177 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (183 . |zero?|) (188 . |degree|)
              |SMTS;monomial;$VarNni$;17| (193 . |leadingCoefficient|)
              (198 . *) (204 . +) (210 . |reductum|) |SMTS;coerce;SMP$;15|
              (215 . |coerce|) |SMTS;coerce;Var$;16| (220 . |One|)
              (224 . |reduce|) (231 . |monomial|) |SMTS;monomial;$LL$;18|
              (238 . |monomial|) (244 . |totalDegree|)
              |SMTS;monomial;CoefIe$;19| (249 . =) (|List| $$) (255 . |first|)
              (260 . ^) (266 . |rest|) (271 . >) (|Mapping| 43 7 7)
              (277 . |sort|) (283 . |position|) (289 . |elt|) (|Mapping| 10 8)
              (|List| 10) |SMTS;csubst;LLM;22| (295 . |zero?|) (300 . |rst|)
              (305 . |#|) (|Stream| 10) (|StreamFunctions2| 8 10) (310 . |map|)
              (316 . |addiag|) |SMTS;eval;$LL$;24| (321 . |empty|)
              (325 . |concat|) (331 . |concat|) (|Mapping| $) (337 . |delay|)
              |SMTS;eval;$Var2$;29| (342 . |differentiate|)
              |SMTS;differentiate;$Var$;30| (|Fraction| 15) (348 . |powern|)
              (354 . ^) (360 . *) (366 . |map|) (372 . *) (378 . *) (384 . *)
              (|StreamTranscendentalFunctions| 8) (390 . |exp|) (395 . |exp|)
              (400 . |log|) (405 . |log|) (410 . |sin|) (415 . |sin|)
              (420 . |cos|) (425 . |cos|) (430 . |tan|) (435 . |tan|)
              (440 . |cot|) (445 . |cot|) (450 . |sec|) (455 . |sec|)
              (460 . |csc|) (465 . |csc|) (470 . |asin|) (475 . |asin|)
              (480 . |acos|) (485 . |acos|) (490 . |atan|) (495 . |atan|)
              (500 . |acot|) (505 . |acot|) (510 . |asec|) (515 . |asec|)
              (520 . |acsc|) (525 . |acsc|) (530 . |sinh|) (535 . |sinh|)
              (540 . |cosh|) (545 . |cosh|) (550 . |tanh|) (555 . |tanh|)
              (560 . |coth|) (565 . |coth|) (570 . |sech|) (575 . |sech|)
              (580 . |csch|) (585 . |csch|) (590 . |asinh|) (595 . |asinh|)
              (600 . |acosh|) (605 . |acosh|) (610 . |atanh|) (615 . |atanh|)
              (620 . |acoth|) (625 . |acoth|) (630 . |asech|) (635 . |asech|)
              (640 . |acsch|) (645 . |acsch|) (650 . |coerce|) (655 . |inv|)
              (660 . |delay|) (665 . |fintegrate|) (672 . |integrate|)
              (679 . |integrate|) (|OutputForm|) (685 . |coerce|)
              (690 . |monomial?|) (695 . |paren|) (700 . ~=)
              (706 . |explicitEntries?|) (711 . |eq?|)
              (717 . |explicitlyEmpty?|) (722 . =) (|Symbol|) (728 . |coerce|)
              (733 . |coerce|) (738 . |prefix|) (744 . +)
              (|Mapping| 188 188 188) (|List| 188) (750 . |reduce|)
              |SMTS;coerce;$Of;67| (756 . /) (762 . /)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Union| $ '"failed") (|Polynomial| 6) (|Equation| $)
              (|List| 211) (|Mapping| 6 6) (|PositiveInteger|) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 768 |zero?| 774 |unitNormal| 779 |unitCanonical| 784 |unit?|
              789 |tanh| 794 |tan| 799 |subtractIfCan| 804 |sqrt| 810 |sinh|
              815 |sin| 820 |series| 825 |sech| 830 |sec| 835 |sample| 840
              |rightRecip| 844 |rightPower| 849 |reductum| 861 |recip| 866
              |polynomial| 871 |pole?| 884 |pi| 889 |order| 893 |opposite?| 906
              |one?| 912 |nthRoot| 917 |monomial?| 923 |monomial| 928 |map| 948
              |log| 954 |leftRecip| 959 |leftPower| 964 |leadingMonomial| 976
              |leadingCoefficient| 981 |latex| 986 |integrate| 991
              |hashUpdate!| 1004 |hash| 1010 |fintegrate| 1015 |extend| 1022
              |exquo| 1028 |exp| 1034 |eval| 1039 |differentiate| 1079 |degree|
              1105 |csubst| 1110 |csch| 1116 |csc| 1121 |coth| 1126 |cot| 1131
              |cosh| 1136 |cos| 1141 |complete| 1146 |commutator| 1151 |coerce|
              1157 |coefficients| 1192 |coefficient| 1197 |charthRoot| 1223
              |characteristic| 1228 |atanh| 1232 |atan| 1237 |associator| 1242
              |associates?| 1249 |asinh| 1255 |asin| 1260 |asech| 1265 |asec|
              1270 |antiCommutator| 1275 |annihilate?| 1281 |acsch| 1287 |acsc|
              1292 |acoth| 1297 |acot| 1302 |acosh| 1307 |acos| 1312 ^ 1317
              |Zero| 1341 |One| 1345 D 1349 = 1375 / 1381 - 1387 + 1398 * 1404)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 6 0 1 6 2 3 4 5 0 0 0 0 1 6 5 0 0 0 1
                                  0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 6 0 0
                                  0 0 0 0 1 1 1 1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |PartialDifferentialRing&|
                |Algebra&| |Algebra&| |EntireRing&| NIL NIL |Algebra&| NIL
                |Rng&| NIL NIL |Module&| |Module&| |Module&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |Evalable&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 7)
                 (|PowerSeriesCategory| 6 (|IndexedExponents| 7) 7)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 7) (|Algebra| 121) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|SemiRing|) (|SemiRng|) (|Module| 121) (|Module| $$)
                 (|Module| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 121 121) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 121) (|RightModule| 121)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|CommutativeStar|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 7 $$)
                 (|VariablesCommuteWithCoefficients|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 188)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|))
              (|makeByteWordVec2| 217
                                  '(0 0 0 13 0 6 0 14 2 9 0 0 15 16 1 9 0 0 19
                                    0 0 0 21 0 6 0 22 0 8 0 23 2 8 0 0 0 24 3 8
                                    0 0 25 26 27 2 10 0 28 0 29 3 31 10 8 30 10
                                    32 1 34 33 15 35 1 8 0 6 36 3 8 0 0 7 17 37
                                    3 41 10 38 39 40 42 1 9 43 0 44 2 17 43 0 0
                                    45 1 9 0 0 46 2 17 43 0 0 47 1 9 8 0 48 3 8
                                    0 0 25 50 51 2 17 0 0 0 52 2 50 17 53 0 54
                                    2 9 0 0 17 55 2 9 0 28 0 56 1 58 17 0 59 1
                                    58 0 0 60 1 58 43 0 61 2 8 6 0 58 62 2 34
                                    10 8 15 64 2 34 10 8 10 66 1 8 70 0 71 2 8
                                    72 0 7 73 1 74 43 0 75 1 74 17 0 76 1 74 8
                                    0 78 2 0 0 0 0 79 2 0 0 0 0 80 1 74 0 0 81
                                    1 8 0 7 83 0 8 0 85 3 50 17 53 0 17 86 3 8
                                    0 0 25 50 87 2 8 0 6 58 89 1 8 17 0 90 2 7
                                    43 0 0 92 1 93 2 0 94 2 0 0 0 17 95 1 93 0
                                    0 96 2 7 43 0 0 97 2 25 0 98 0 99 2 25 15 7
                                    0 100 2 93 2 0 15 101 1 8 43 0 105 1 10 0 0
                                    106 1 93 17 0 107 2 109 108 102 10 110 1 34
                                    10 108 111 0 10 0 113 2 9 0 8 0 114 2 10 0
                                    8 0 115 1 10 0 116 117 2 8 0 0 7 119 2 34
                                    10 121 10 122 2 0 0 0 121 123 2 8 0 121 0
                                    124 2 31 10 28 10 125 2 0 0 121 0 126 2 8 0
                                    0 121 127 2 0 0 0 121 128 1 129 10 10 130 1
                                    0 0 0 131 1 129 10 10 132 1 0 0 0 133 1 129
                                    10 10 134 1 0 0 0 135 1 129 10 10 136 1 0 0
                                    0 137 1 129 10 10 138 1 0 0 0 139 1 129 10
                                    10 140 1 0 0 0 141 1 129 10 10 142 1 0 0 0
                                    143 1 129 10 10 144 1 0 0 0 145 1 129 10 10
                                    146 1 0 0 0 147 1 129 10 10 148 1 0 0 0 149
                                    1 129 10 10 150 1 0 0 0 151 1 129 10 10 152
                                    1 0 0 0 153 1 129 10 10 154 1 0 0 0 155 1
                                    129 10 10 156 1 0 0 0 157 1 129 10 10 158 1
                                    0 0 0 159 1 129 10 10 160 1 0 0 0 161 1 129
                                    10 10 162 1 0 0 0 163 1 129 10 10 164 1 0 0
                                    0 165 1 129 10 10 166 1 0 0 0 167 1 129 10
                                    10 168 1 0 0 0 169 1 129 10 10 170 1 0 0 0
                                    171 1 129 10 10 172 1 0 0 0 173 1 129 10 10
                                    174 1 0 0 0 175 1 129 10 10 176 1 0 0 0 177
                                    1 129 10 10 178 1 0 0 0 179 1 129 10 10 180
                                    1 0 0 0 181 1 121 0 15 182 1 121 0 0 183 1
                                    9 0 116 184 3 0 0 116 7 6 185 3 0 0 0 7 6
                                    186 2 0 0 0 7 187 1 8 188 0 189 1 8 43 0
                                    190 1 188 0 0 191 2 8 43 0 0 192 1 9 43 0
                                    193 2 9 43 0 0 194 1 9 43 0 195 2 8 43 0 0
                                    196 1 197 188 0 198 1 17 188 0 199 2 188 0
                                    0 26 200 2 188 0 0 0 201 2 203 188 202 0
                                    204 2 8 0 0 6 206 2 0 0 0 6 207 2 0 43 0 0
                                    1 1 0 43 0 1 1 9 208 0 1 1 9 0 0 1 1 9 43 0
                                    1 1 1 0 0 163 1 1 0 0 139 2 0 209 0 0 1 1 1
                                    0 0 1 1 1 0 0 159 1 1 0 0 135 1 0 0 10 12 1
                                    1 0 0 167 1 1 0 0 143 0 0 0 1 1 0 209 0 1 2
                                    0 0 0 17 1 2 0 0 0 214 1 1 0 0 0 1 1 0 209
                                    0 1 2 0 210 0 17 1 3 0 210 0 17 17 1 1 0 43
                                    0 1 0 1 0 1 2 0 17 0 7 1 3 0 17 0 7 17 1 2
                                    0 43 0 0 1 1 0 43 0 1 2 1 0 0 15 1 1 0 43 0
                                    1 3 0 0 0 7 17 77 3 0 0 0 25 50 88 2 0 0 6
                                    58 91 2 0 0 213 0 1 1 1 0 0 133 1 0 209 0 1
                                    2 0 0 0 17 1 2 0 0 0 214 1 1 0 0 0 1 1 0 6
                                    0 1 1 0 216 0 1 3 1 0 0 7 6 186 2 1 0 0 7
                                    187 2 0 215 215 0 1 1 0 217 0 1 3 1 0 116 7
                                    6 185 2 0 0 0 17 18 2 9 209 0 0 1 1 1 0 0
                                    131 3 0 0 0 26 26 1 2 0 0 0 211 1 3 0 0 0 0
                                    0 1 3 0 0 0 25 26 112 2 0 0 0 212 1 3 0 0 0
                                    7 0 118 3 0 0 0 7 17 1 3 0 0 0 25 50 1 2 0
                                    0 0 7 120 2 0 0 0 25 1 1 0 58 0 1 2 0 102
                                    25 103 104 1 1 0 0 169 1 1 0 0 145 1 1 0 0
                                    165 1 1 0 0 141 1 1 0 0 161 1 1 0 0 137 1 0
                                    0 0 20 2 0 0 0 0 1 1 8 0 6 65 1 10 0 0 1 1
                                    1 0 121 1 1 0 0 8 82 1 0 0 7 84 1 0 0 15 1
                                    1 0 188 0 205 1 0 10 0 11 2 0 8 0 17 49 3 0
                                    0 0 25 50 57 3 0 0 0 7 17 1 2 0 6 0 58 63 1
                                    3 209 0 1 0 0 17 1 1 1 0 0 175 1 1 0 0 151
                                    3 0 0 0 0 0 1 2 9 43 0 0 1 1 1 0 0 171 1 1
                                    0 0 147 1 1 0 0 179 1 1 0 0 155 2 0 0 0 0 1
                                    2 0 43 0 0 1 1 1 0 0 181 1 1 0 0 157 1 1 0
                                    0 177 1 1 0 0 153 1 1 0 0 173 1 1 0 0 149 2
                                    1 0 0 121 123 2 1 0 0 0 1 2 0 0 0 17 95 2 0
                                    0 0 214 1 0 0 0 21 0 0 0 13 3 0 0 0 7 17 1
                                    3 0 0 0 25 50 1 2 0 0 0 7 1 2 0 0 0 25 1 2
                                    0 43 0 0 1 2 7 0 0 6 207 2 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 80 2 1 0 0 121 128 2 1 0 121
                                    0 126 2 0 0 8 0 67 2 0 0 0 6 69 2 0 0 6 0
                                    68 2 0 0 17 0 1 2 0 0 15 0 1 2 0 0 0 0 79 2
                                    0 0 214 0 1)))))
           '|lookupComplete|)) 
