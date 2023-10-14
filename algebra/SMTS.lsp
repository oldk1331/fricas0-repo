
(SDEFUN |SMTS;extend;$Nni$;1| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| (+ |n| 1) (QREFELT $ 13))) 

(SDEFUN |SMTS;complete;2$;2| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 16))) 

(SDEFUN |SMTS;evalstream|
        ((|s| $) (|lv| |List| |Var|) (|lsmp| |List| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SPADCALL (|spadConstant| $ 20) (ELT $ 21)
                         (SPADCALL
                          (CONS #'|SMTS;evalstream!0| (VECTOR $ |lsmp| |lv|))
                          |s| (QREFELT $ 27))
                         (QREFELT $ 30)))) 

(SDEFUN |SMTS;evalstream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |lsmp| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|SMTS;evalstream|))
          (LETT |lsmp| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |lv| |lsmp| (QREFELT $ 24)))))) 

(SDEFUN |SMTS;addvariable| ((|v| |Var|) (|s| |InnerTaylorSeries| |Coef|) ($ $))
        (SPROG ((|ints| (|Stream| (|NonNegativeInteger|))))
               (SEQ
                (LETT |ints| (SPADCALL 0 (QREFELT $ 33)) |SMTS;addvariable|)
                (EXIT
                 (SPADCALL (CONS #'|SMTS;addvariable!0| (VECTOR |v| $)) |ints|
                           |s| (QREFELT $ 40)))))) 

(SDEFUN |SMTS;addvariable!0| ((|n1| NIL) (|c2| NIL) ($$ NIL))
        (PROG ($ |v|)
          (LETT $ (QREFELT $$ 1) . #1=(|SMTS;addvariable|))
          (LETT |v| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c2| (QREFELT $ 34)) |v| |n1|
                      (QREFELT $ 35)))))) 

(SDEFUN |SMTS;coefficient;$NniSMP;5|
        ((|x| $) (|n| |NonNegativeInteger|) ($ SMP))
        (SPROG ((#1=#:G143 NIL) (|u| (|Rep|)))
               (SEQ (LETT |u| |x| . #2=(|SMTS;coefficient;$NniSMP;5|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |u| (QREFELT $ 42)) 'NIL)
                                  ('T (SPADCALL |n| 0 (QREFELT $ 43)))))
                           (GO G191)))
                         (SEQ (LETT |u| (SPADCALL |u| (QREFELT $ 44)) . #2#)
                              (EXIT
                               (LETT |n|
                                     (PROG1 (LETT #1# (- |n| 1) . #2#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((OR (SPADCALL |u| (QREFELT $ 42))
                          (SPADCALL |n| 0 (QREFELT $ 45)))
                      (EXIT (|spadConstant| $ 20))))
                    (EXIT (SPADCALL |u| (QREFELT $ 46)))))) 

(SDEFUN |SMTS;coefficient;$LL$;6|
        ((|s| $) (|lv| |List| |Var|) (|ln| |List| (|NonNegativeInteger|))
         ($ $))
        (SPROG NIL
               (SPADCALL
                (CONS #'|SMTS;coefficient;$LL$;6!0| (VECTOR $ |ln| |lv|))
                (SPADCALL |s| (SPADCALL (ELT $ 50) |ln| (QREFELT $ 52))
                          (QREFELT $ 53))
                (QREFELT $ 54)))) 

(SDEFUN |SMTS;coefficient;$LL$;6!0| ((|z1| NIL) ($$ NIL))
        (PROG (|lv| |ln| $)
          (LETT |lv| (QREFELT $$ 2) . #1=(|SMTS;coefficient;$LL$;6|))
          (LETT |ln| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |lv| |ln| (QREFELT $ 49)))))) 

(SDEFUN |SMTS;coefficient;$IeCoef;7|
        ((|s| $) (|m| |IndexedExponents| |Var|) ($ |Coef|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|mon| (|IndexedExponents| |Var|)))
         (SEQ
          (LETT |n|
                (SPADCALL (LETT |mon| |m| . #1=(|SMTS;coefficient;$IeCoef;7|))
                          (QREFELT $ 57))
                . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL
                     (LETT |mon| (SPADCALL |mon| (QREFELT $ 58)) . #1#)
                     (QREFELT $ 59))
                    'NIL)
                   ('T 'T)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |n| (+ |n| (SPADCALL |mon| (QREFELT $ 57))) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |s| |n| (QREFELT $ 47)) |m| (QREFELT $ 60)))))) 

(SDEFUN |SMTS;coerce;Coef$;8| ((|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 34)) 0 (QREFELT $ 62))) 

(SDEFUN |SMTS;*;SMP2$;9| ((|smp| SMP) (|p| $) ($ $))
        (SPADCALL |smp| |p| (QREFELT $ 64))) 

(SDEFUN |SMTS;*;Coef2$;10| ((|r| |Coef|) (|p| $) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 34)) |p| (QREFELT $ 64))) 

(SDEFUN |SMTS;*;$Coef$;11| ((|p| $) (|r| |Coef|) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 34)) |p| (QREFELT $ 64))) 

(SDEFUN |SMTS;mts| ((|p| SMP) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|v| (|Var|))
          (|uv| (|Union| |Var| "failed")))
         (SEQ (LETT |uv| (SPADCALL |p| (QREFELT $ 69)) . #1=(|SMTS;mts|))
              (EXIT
               (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 62)))
                     ('T
                      (SEQ (LETT |v| (QCDR |uv|) . #1#)
                           (LETT |s| (|spadConstant| $ 18) . #1#)
                           (LETT |up| (SPADCALL |p| |v| (QREFELT $ 71)) . #1#)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((SPADCALL |up| (QREFELT $ 73)) 'NIL)
                                         ('T 'T)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |s|
                                       (SPADCALL |s|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|spadConstant| $ 10) |v|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 74))
                                                   (QREFELT $ 75))
                                                  (|SMTS;mts|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 76))
                                                   $)
                                                  (QREFELT $ 77))
                                                 (QREFELT $ 78))
                                       . #1#)
                                 (EXIT
                                  (LETT |up| (SPADCALL |up| (QREFELT $ 79))
                                        . #1#)))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |s|)))))))) 

(SDEFUN |SMTS;coerce;SMP$;13| ((|p| SMP) ($ $)) (|SMTS;mts| |p| $)) 

(SDEFUN |SMTS;coerce;Var$;14| ((|v| |Var|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 81)) (QREFELT $ 80))) 

(SDEFUN |SMTS;monomial;$VarNni$;15|
        ((|r| $) (|v| |Var|) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |r|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 83) |v| |n| (QREFELT $ 35)) |n|
                   (QREFELT $ 62))
                  (QREFELT $ 77))) 

(SDEFUN |SMTS;substvar| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|s| ($)) (|c| (SMP))
          (|v| (|Var|)) (|uv| (|Union| |Var| "failed")))
         (SEQ
          (COND ((NULL |vl|) (SPADCALL |p| 0 (QREFELT $ 62)))
                (#1='T
                 (SEQ
                  (LETT |uv| (SPADCALL |p| (QREFELT $ 69))
                        . #2=(|SMTS;substvar|))
                  (EXIT
                   (COND ((QEQCAR |uv| 1) (SPADCALL |p| 0 (QREFELT $ 62)))
                         (#1#
                          (SEQ (LETT |v| (QCDR |uv|) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |v| (|SPADfirst| |vl|)
                                            (QREFELT $ 84))
                                  (SEQ (LETT |s| (|spadConstant| $ 18) . #2#)
                                       (LETT |up|
                                             (SPADCALL |p| |v| (QREFELT $ 71))
                                             . #2#)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (COND
                                                ((SPADCALL |up| (QREFELT $ 73))
                                                 'NIL)
                                                ('T 'T)))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |c|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 76))
                                                   . #2#)
                                             (LETT |s|
                                                   (SPADCALL |s|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |q|
                                                                         (QREFELT
                                                                          $
                                                                          86))
                                                               (SPADCALL |up|
                                                                         (QREFELT
                                                                          $
                                                                          74))
                                                               (QREFELT $ 87))
                                                              (|SMTS;substvar|
                                                               |c| (CDR |vl|)
                                                               (SPADCALL |q|
                                                                         (QREFELT
                                                                          $
                                                                          88))
                                                               $)
                                                              (QREFELT $ 77))
                                                             (QREFELT $ 78))
                                                   . #2#)
                                             (EXIT
                                              (LETT |up|
                                                    (SPADCALL |up|
                                                              (QREFELT $ 79))
                                                    . #2#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT |s|)))
                                 (#1#
                                  (|SMTS;substvar| |p| (CDR |vl|)
                                   (SPADCALL |q| (QREFELT $ 88)) $)))))))))))))) 

(SDEFUN |SMTS;sortmfirst| ((|p| SMP) (|vl| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| $)) (#1=#:G193 NIL) (|i| NIL) (#2=#:G192 NIL)
          (|nlv| (|List| |Var|)))
         (SEQ
          (LETT |nlv| (SPADCALL (ELT $ 89) |vl| (QREFELT $ 91))
                . #3=(|SMTS;sortmfirst|))
          (LETT |nq|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| NIL . #3#) (LETT #1# |nlv| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |q| (SPADCALL |i| |vl| (QREFELT $ 92))
                                         (QREFELT $ 93))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (|SMTS;substvar| |p| |nlv| |nq| $))))) 

(SDEFUN |SMTS;csubst;LLM;18|
        ((|vl| |List| |Var|) (|q| |List| (|Stream| SMP))
         ($ |Mapping| (|Stream| SMP) SMP))
        (SPROG NIL (CONS #'|SMTS;csubst;LLM;18!0| (VECTOR $ |q| |vl|)))) 

(SDEFUN |SMTS;csubst;LLM;18!0| ((|p1| NIL) ($$ NIL))
        (PROG (|vl| |q| $)
          (LETT |vl| (QREFELT $$ 2) . #1=(|SMTS;csubst;LLM;18|))
          (LETT |q| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;sortmfirst| |p1| |vl| |q| $))))) 

(SDEFUN |SMTS;restCheck| ((|s| |Stream| SMP) ($ |Stream| SMP))
        (COND ((SPADCALL |s| (QREFELT $ 42)) |s|)
              ((NULL (SPADCALL (SPADCALL |s| (QREFELT $ 46)) (QREFELT $ 97)))
               (|error| "eval: constant coefficient should be 0"))
              ('T (SPADCALL |s| (QREFELT $ 98))))) 

(SDEFUN |SMTS;eval;$LL$;20| ((|s| $) (|v| |List| |Var|) (|q| |List| $) ($ $))
        (SPROG
         ((|nq| (|List| (|Stream| SMP))) (#1=#:G208 NIL) (|i| NIL)
          (#2=#:G207 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |v|) (SPADCALL |q| (QREFELT $ 99))
                      (QREFELT $ 45))
            (|error|
             "eval: number of variables should equal number of values"))
           ('T
            (SEQ
             (LETT |nq|
                   (PROGN
                    (LETT #2# NIL . #3=(|SMTS;eval;$LL$;20|))
                    (SEQ (LETT |i| NIL . #3#) (LETT #1# |q| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|SMTS;restCheck| |i| $) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #3#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |v| |nq| (QREFELT $ 96)) |s|
                         (QREFELT $ 102))
               (QREFELT $ 103))))))))) 

(SDEFUN |SMTS;substmts| ((|v| |Var|) (|p| SMP) (|q| $) ($ $))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| ($)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |up| (SPADCALL |p| |v| (QREFELT $ 71)) . #1=(|SMTS;substmts|))
          (LETT |ss| (|spadConstant| $ 18) . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |up| (QREFELT $ 73)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 74)) . #1#)
                    (LETT |c| (SPADCALL |up| (QREFELT $ 76)) . #1#)
                    (LETT |ss|
                          (SPADCALL |ss|
                                    (SPADCALL |c|
                                              (SPADCALL |q| |d| (QREFELT $ 87))
                                              (QREFELT $ 65))
                                    (QREFELT $ 78))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 79)) . #1#)))
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
                          (QREFELT $ 102))
                (QREFELT $ 103)))) 

(SDEFUN |SMTS;comp1!0| ((|p1| NIL) ($$ NIL))
        (PROG (|v| |t| $)
          (LETT |v| (QREFELT $$ 2) . #1=(|SMTS;comp1|))
          (LETT |t| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;subststream| |v| |p1| |t| $))))) 

(SDEFUN |SMTS;comp|
        ((|v| |Var|) (|s| |Stream| SMP) (|t| |Stream| SMP) ($ |Stream| SMP))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SMTS;comp!0| (VECTOR |v| |t| $ |s|))
                          (QREFELT $ 109))))) 

(SDEFUN |SMTS;comp!0| (($$ NIL))
        (PROG (|s| $ |t| |v|)
          (LETT |s| (QREFELT $$ 3) . #1=(|SMTS;comp|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |t| (QREFELT $$ 1) . #1#)
          (LETT |v| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|f| NIL) (|r| NIL))
                   (SEQ
                    (COND ((SPADCALL |s| (QREFELT $ 42)) |s|)
                          ('T
                           (SEQ (LETT |f| (SPADCALL |s| (QREFELT $ 46)) NIL)
                                (LETT |r| (SPADCALL |s| (QREFELT $ 98)) NIL)
                                (EXIT
                                 (COND ((SPADCALL |r| (QREFELT $ 42)) |s|)
                                       ((SPADCALL |t| (QREFELT $ 42))
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL (QREFELT $ 105))
                                                   $)
                                                  (QREFELT $ 107)))
                                       ((NULL
                                         (SPADCALL
                                          (SPADCALL |t| (QREFELT $ 46))
                                          (QREFELT $ 97)))
                                        (|error|
                                         "eval: constant coefficient should be zero"))
                                       ('T
                                        (SPADCALL |f|
                                                  (|SMTS;comp1| |v| |r|
                                                   (SPADCALL |t|
                                                             (QREFELT $ 98))
                                                   $)
                                                  (QREFELT $ 107)))))))))))))) 

(SDEFUN |SMTS;eval;$Var2$;25| ((|s| $) (|v| |Var|) (|t| $) ($ $))
        (|SMTS;comp| |v| |s| |t| $)) 

(SDEFUN |SMTS;differentiate;$Var$;26| ((|s| $) (|v| |Var|) ($ $))
        (SPROG NIL
               (COND ((SPADCALL |s| (QREFELT $ 42)) (|spadConstant| $ 18))
                     ('T
                      (SPADCALL
                       (CONS #'|SMTS;differentiate;$Var$;26!0| (VECTOR $ |v|))
                       (SPADCALL |s| (QREFELT $ 44)) (QREFELT $ 54)))))) 

(SDEFUN |SMTS;differentiate;$Var$;26!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|SMTS;differentiate;$Var$;26|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |v| (QREFELT $ 111)))))) 

(PUT '|SMTS;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SMTS;stream| ((|x| $) ($ |Rep|)) |x|) 

(SDEFUN |SMTS;^;$F$;28| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |r| (|SMTS;stream| |x| $) (QREFELT $ 114))) 

(SDEFUN |SMTS;*;F2$;29| ((|r| |Fraction| (|Integer|)) (|x| $) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;F2$;29!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 117)))) 

(SDEFUN |SMTS;*;F2$;29!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;*;F2$;29|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |r| |z1| (QREFELT $ 116)))))) 

(SDEFUN |SMTS;*;$F$;30| ((|x| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;*;$F$;30!0| (VECTOR $ |r|))
                         (|SMTS;stream| |x| $) (QREFELT $ 117)))) 

(SDEFUN |SMTS;*;$F$;30!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;*;$F$;30|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 119)))))) 

(SDEFUN |SMTS;exp;2$;31| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 122))) 

(SDEFUN |SMTS;log;2$;32| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 124))) 

(SDEFUN |SMTS;sin;2$;33| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 126))) 

(SDEFUN |SMTS;cos;2$;34| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 128))) 

(SDEFUN |SMTS;tan;2$;35| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 130))) 

(SDEFUN |SMTS;cot;2$;36| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 132))) 

(SDEFUN |SMTS;sec;2$;37| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 134))) 

(SDEFUN |SMTS;csc;2$;38| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 136))) 

(SDEFUN |SMTS;asin;2$;39| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 138))) 

(SDEFUN |SMTS;acos;2$;40| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 140))) 

(SDEFUN |SMTS;atan;2$;41| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 142))) 

(SDEFUN |SMTS;acot;2$;42| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 144))) 

(SDEFUN |SMTS;asec;2$;43| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 146))) 

(SDEFUN |SMTS;acsc;2$;44| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 148))) 

(SDEFUN |SMTS;sinh;2$;45| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 150))) 

(SDEFUN |SMTS;cosh;2$;46| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 152))) 

(SDEFUN |SMTS;tanh;2$;47| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 154))) 

(SDEFUN |SMTS;coth;2$;48| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 156))) 

(SDEFUN |SMTS;sech;2$;49| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 158))) 

(SDEFUN |SMTS;csch;2$;50| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 160))) 

(SDEFUN |SMTS;asinh;2$;51| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 162))) 

(SDEFUN |SMTS;acosh;2$;52| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 164))) 

(SDEFUN |SMTS;atanh;2$;53| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 166))) 

(SDEFUN |SMTS;acoth;2$;54| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 168))) 

(SDEFUN |SMTS;asech;2$;55| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 170))) 

(SDEFUN |SMTS;acsch;2$;56| ((|x| $) ($ $))
        (SPADCALL (|SMTS;stream| |x| $) (QREFELT $ 172))) 

(SDEFUN |SMTS;intsmp| ((|v| |Var|) (|p| SMP) ($ SMP))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| SMP)) (|ss| (SMP)) (|c| (SMP))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |up| (SPADCALL |p| |v| (QREFELT $ 71)) . #1=(|SMTS;intsmp|))
          (LETT |ss| (|spadConstant| $ 20) . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |up| (QREFELT $ 73)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |d| (SPADCALL |up| (QREFELT $ 74)) . #1#)
                    (LETT |c| (SPADCALL |up| (QREFELT $ 76)) . #1#)
                    (LETT |ss|
                          (SPADCALL |ss|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (+ |d| 1) (QREFELT $ 174))
                                      (QREFELT $ 175))
                                     (SPADCALL |c| |v| (+ |d| 1)
                                               (QREFELT $ 35))
                                     (QREFELT $ 116))
                                    (QREFELT $ 21))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 79)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |ss|)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;58|
        ((|f| |Mapping| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 34))
                         (SPADCALL
                          (CONS #'|SMTS;fintegrate;MVarCoef$;58!1|
                                (VECTOR |f| |v| $))
                          (QREFELT $ 176))
                         (QREFELT $ 106)))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;58!1| (($$ NIL))
        (PROG ($ |v| |f|)
          (LETT $ (QREFELT $$ 2) . #1=(|SMTS;fintegrate;MVarCoef$;58|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL
                    (CONS #'|SMTS;fintegrate;MVarCoef$;58!0| (VECTOR $ |v|))
                    (SPADCALL |f|) (QREFELT $ 54))))))) 

(SDEFUN |SMTS;fintegrate;MVarCoef$;58!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;integrate;$VarCoef$;59| ((|s| $) (|v| |Var|) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (SPADCALL |r| (QREFELT $ 34))
                         (SPADCALL
                          (CONS #'|SMTS;integrate;$VarCoef$;59!0|
                                (VECTOR $ |v|))
                          |s| (QREFELT $ 54))
                         (QREFELT $ 106)))) 

(SDEFUN |SMTS;integrate;$VarCoef$;59!0| ((|z1| NIL) ($$ NIL))
        (PROG (|v| $)
          (LETT |v| (QREFELT $$ 1) . #1=(|SMTS;integrate;$VarCoef$;59|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|SMTS;intsmp| |v| |z1| $))))) 

(SDEFUN |SMTS;tout| ((|p| SMP) ($ |OutputForm|))
        (SPROG ((|pe| (|OutputForm|)))
               (SEQ (LETT |pe| (SPADCALL |p| (QREFELT $ 180)) |SMTS;tout|)
                    (EXIT
                     (COND ((SPADCALL |p| (QREFELT $ 181)) |pe|)
                           ('T (SPADCALL |pe| (QREFELT $ 182)))))))) 

(PUT '|SMTS;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |SMTS;showAll?| (($ |Boolean|)) 'T) 

(SDEFUN |SMTS;coerce;$Of;62| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|uu| ($)) (|n| NIL)
          (|count| (|NonNegativeInteger|)))
         (SEQ (LETT |uu| |s| . #1=(|SMTS;coerce;$Of;62|))
              (EXIT
               (COND
                ((SPADCALL |uu| (QREFELT $ 42))
                 (SPADCALL (|spadConstant| $ 20) (QREFELT $ 180)))
                (#2='T
                 (SEQ (LETT |count| |$streamCount| . #1#) (LETT |l| NIL . #1#)
                      (SEQ (LETT |n| 0 . #1#) G190
                           (COND
                            ((OR (|greater_SI| |n| |count|)
                                 (NULL
                                  (COND ((SPADCALL |uu| (QREFELT $ 42)) 'NIL)
                                        ('T 'T))))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (SPADCALL |uu| (QREFELT $ 46))
                                        (|spadConstant| $ 20) (QREFELT $ 183))
                              (LETT |l|
                                    (CONS
                                     (|SMTS;tout|
                                      (SPADCALL |uu| (QREFELT $ 46)) $)
                                     |l|)
                                    . #1#)))
                            (EXIT
                             (LETT |uu| (SPADCALL |uu| (QREFELT $ 44)) . #1#)))
                           (LETT |n| (|inc_SI| |n|) . #1#) (GO G190) G191
                           (EXIT NIL))
                      (COND
                       ((|SMTS;showAll?| $)
                        (SEQ (LETT |n| |n| . #1#) G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL |uu| (QREFELT $ 184))
                                  (COND
                                   ((SPADCALL |uu|
                                              (SPADCALL |uu| (QREFELT $ 44))
                                              (QREFELT $ 185))
                                    'NIL)
                                   ('T 'T)))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ
                              (COND
                               ((SPADCALL (SPADCALL |uu| (QREFELT $ 46))
                                          (|spadConstant| $ 20)
                                          (QREFELT $ 183))
                                (LETT |l|
                                      (CONS
                                       (|SMTS;tout|
                                        (SPADCALL |uu| (QREFELT $ 46)) $)
                                       |l|)
                                      . #1#)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT $ 44))
                                     . #1#)))
                             (LETT |n| (+ |n| 1) . #1#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |l|
                            (COND ((SPADCALL |uu| (QREFELT $ 186)) |l|)
                                  (#2#
                                   (SEQ
                                    (COND
                                     ((SPADCALL |uu|
                                                (SPADCALL |uu| (QREFELT $ 44))
                                                (QREFELT $ 185))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |uu| (QREFELT $ 46))
                                         (|spadConstant| $ 20) (QREFELT $ 187))
                                        (EXIT |l|)))))
                                    (EXIT
                                     (CONS
                                      (SPADCALL "O"
                                                (LIST
                                                 (SPADCALL |n|
                                                           (QREFELT $ 188)))
                                                (QREFELT $ 189))
                                      |l|)))))
                            . #1#)
                      (EXIT
                       (COND
                        ((NULL |l|)
                         (SPADCALL (|spadConstant| $ 20) (QREFELT $ 180)))
                        (#2#
                         (SPADCALL (ELT $ 190) (NREVERSE |l|)
                                   (QREFELT $ 193)))))))))))) 

(SDEFUN |SMTS;/;$Coef$;63| ((|p| $) (|r| |Coef|) ($ $))
        (SPROG NIL
               (SPADCALL (CONS #'|SMTS;/;$Coef$;63!0| (VECTOR $ |r|))
                         (|SMTS;stream| |p| $) (QREFELT $ 117)))) 

(SDEFUN |SMTS;/;$Coef$;63!0| ((|z1| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1) . #1=(|SMTS;/;$Coef$;63|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z1| |r| (QREFELT $ 195)))))) 

(DECLAIM (NOTINLINE |SparseMultivariateTaylorSeries;|)) 

(DEFUN |SparseMultivariateTaylorSeries| (&REST #1=#:G401)
  (SPROG NIL
         (PROG (#2=#:G402)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|SparseMultivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateTaylorSeries;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateTaylorSeries|)))))))))) 

(DEFUN |SparseMultivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G400 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseMultivariateTaylorSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT |dv$| (LIST '|SparseMultivariateTaylorSeries| DV$1 DV$2 DV$3) . #2#)
    (LETT $ (GETREFV 208) . #2#)
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
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|Field|))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateTaylorSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #1# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 128))
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 256))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Stream| |#3|))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 115 (CONS (|dispatchFunction| |SMTS;^;$F$;28|) $))
       (QSETREFV $ 118 (CONS (|dispatchFunction| |SMTS;*;F2$;29|) $))
       (QSETREFV $ 120 (CONS (|dispatchFunction| |SMTS;*;$F$;30|) $))
       (QSETREFV $ 123 (CONS (|dispatchFunction| |SMTS;exp;2$;31|) $))
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SMTS;log;2$;32|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SMTS;sin;2$;33|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SMTS;cos;2$;34|) $))
       (QSETREFV $ 131 (CONS (|dispatchFunction| |SMTS;tan;2$;35|) $))
       (QSETREFV $ 133 (CONS (|dispatchFunction| |SMTS;cot;2$;36|) $))
       (QSETREFV $ 135 (CONS (|dispatchFunction| |SMTS;sec;2$;37|) $))
       (QSETREFV $ 137 (CONS (|dispatchFunction| |SMTS;csc;2$;38|) $))
       (QSETREFV $ 139 (CONS (|dispatchFunction| |SMTS;asin;2$;39|) $))
       (QSETREFV $ 141 (CONS (|dispatchFunction| |SMTS;acos;2$;40|) $))
       (QSETREFV $ 143 (CONS (|dispatchFunction| |SMTS;atan;2$;41|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |SMTS;acot;2$;42|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |SMTS;asec;2$;43|) $))
       (QSETREFV $ 149 (CONS (|dispatchFunction| |SMTS;acsc;2$;44|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |SMTS;sinh;2$;45|) $))
       (QSETREFV $ 153 (CONS (|dispatchFunction| |SMTS;cosh;2$;46|) $))
       (QSETREFV $ 155 (CONS (|dispatchFunction| |SMTS;tanh;2$;47|) $))
       (QSETREFV $ 157 (CONS (|dispatchFunction| |SMTS;coth;2$;48|) $))
       (QSETREFV $ 159 (CONS (|dispatchFunction| |SMTS;sech;2$;49|) $))
       (QSETREFV $ 161 (CONS (|dispatchFunction| |SMTS;csch;2$;50|) $))
       (QSETREFV $ 163 (CONS (|dispatchFunction| |SMTS;asinh;2$;51|) $))
       (QSETREFV $ 165 (CONS (|dispatchFunction| |SMTS;acosh;2$;52|) $))
       (QSETREFV $ 167 (CONS (|dispatchFunction| |SMTS;atanh;2$;53|) $))
       (QSETREFV $ 169 (CONS (|dispatchFunction| |SMTS;acoth;2$;54|) $))
       (QSETREFV $ 171 (CONS (|dispatchFunction| |SMTS;asech;2$;55|) $))
       (QSETREFV $ 173 (CONS (|dispatchFunction| |SMTS;acsch;2$;56|) $))
       (QSETREFV $ 177
                 (CONS (|dispatchFunction| |SMTS;fintegrate;MVarCoef$;58|) $))
       (QSETREFV $ 178
                 (CONS (|dispatchFunction| |SMTS;integrate;$VarCoef$;59|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 196 (CONS (|dispatchFunction| |SMTS;/;$Coef$;63|) $)))))
    $))) 

(MAKEPROP '|SparseMultivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerTaylorSeries| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |One|) (4 . |One|)
              (|Integer|) (8 . |extend|) (|NonNegativeInteger|)
              |SMTS;extend;$Nni$;1| (14 . |complete|) |SMTS;complete;2$;2|
              (19 . |Zero|) (23 . |Zero|) (27 . |Zero|) (31 . +) (|List| 7)
              (|List| $) (37 . |eval|) (|Mapping| 8 8) (|Stream| 8)
              (44 . |map|) (|Mapping| 8 8 8) (|StreamFunctions2| 8 8)
              (50 . |scan|) (|Stream| 12) (|StreamTaylorSeriesOperations| 8)
              (57 . |integers|) (62 . |coerce|) (67 . |monomial|)
              (|Mapping| 8 14 6) (|Stream| 14) (|Stream| 6)
              (|StreamFunctions3| 14 6 8) (74 . |map|) (|Boolean|)
              (81 . |empty?|) (86 . >) (92 . |rst|) (97 . ~=) (103 . |frst|)
              |SMTS;coefficient;$NniSMP;5| (|List| 14) (108 . |coefficient|)
              (115 . +) (|Mapping| 14 14 14) (121 . |reduce|) (127 . |rest|)
              (133 . |map|) |SMTS;coefficient;$LL$;6| (|IndexedExponents| 7)
              (139 . |leadingCoefficient|) (144 . |reductum|) (149 . |zero?|)
              (154 . |coefficient|) |SMTS;coefficient;$IeCoef;7|
              (160 . |monom|) |SMTS;coerce;Coef$;8| (166 . *) |SMTS;*;SMP2$;9|
              |SMTS;*;Coef2$;10| |SMTS;*;$Coef$;11| (|Union| 7 '"failed")
              (172 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (177 . |univariate|) (|SparseUnivariatePolynomial| 8)
              (183 . |zero?|) (188 . |degree|) |SMTS;monomial;$VarNni$;15|
              (193 . |leadingCoefficient|) (198 . *) (204 . +)
              (210 . |reductum|) |SMTS;coerce;SMP$;13| (215 . |coerce|)
              |SMTS;coerce;Var$;14| (220 . |One|) (224 . =) (|List| $$)
              (230 . |first|) (235 . ^) (241 . |rest|) (246 . >)
              (|Mapping| 41 7 7) (252 . |sort|) (258 . |position|)
              (264 . |elt|) (|Mapping| 26 8) (|List| 26) |SMTS;csubst;LLM;18|
              (270 . |zero?|) (275 . |rst|) (280 . |#|) (|Stream| 26)
              (|StreamFunctions2| 8 26) (285 . |map|) (291 . |addiag|)
              |SMTS;eval;$LL$;20| (296 . |empty|) (300 . |concat|)
              (306 . |concat|) (|Mapping| $) (312 . |delay|)
              |SMTS;eval;$Var2$;25| (317 . |differentiate|)
              |SMTS;differentiate;$Var$;26| (|Fraction| 12) (323 . |powern|)
              (329 . ^) (335 . *) (341 . |map|) (347 . *) (353 . *) (359 . *)
              (|StreamTranscendentalFunctions| 8) (365 . |exp|) (370 . |exp|)
              (375 . |log|) (380 . |log|) (385 . |sin|) (390 . |sin|)
              (395 . |cos|) (400 . |cos|) (405 . |tan|) (410 . |tan|)
              (415 . |cot|) (420 . |cot|) (425 . |sec|) (430 . |sec|)
              (435 . |csc|) (440 . |csc|) (445 . |asin|) (450 . |asin|)
              (455 . |acos|) (460 . |acos|) (465 . |atan|) (470 . |atan|)
              (475 . |acot|) (480 . |acot|) (485 . |asec|) (490 . |asec|)
              (495 . |acsc|) (500 . |acsc|) (505 . |sinh|) (510 . |sinh|)
              (515 . |cosh|) (520 . |cosh|) (525 . |tanh|) (530 . |tanh|)
              (535 . |coth|) (540 . |coth|) (545 . |sech|) (550 . |sech|)
              (555 . |csch|) (560 . |csch|) (565 . |asinh|) (570 . |asinh|)
              (575 . |acosh|) (580 . |acosh|) (585 . |atanh|) (590 . |atanh|)
              (595 . |acoth|) (600 . |acoth|) (605 . |asech|) (610 . |asech|)
              (615 . |acsch|) (620 . |acsch|) (625 . |coerce|) (630 . |inv|)
              (635 . |delay|) (640 . |fintegrate|) (647 . |integrate|)
              (|OutputForm|) (654 . |coerce|) (659 . |monomial?|)
              (664 . |paren|) (669 . ~=) (675 . |explicitEntries?|)
              (680 . |eq?|) (686 . |explicitlyEmpty?|) (691 . =)
              (697 . |coerce|) (702 . |prefix|) (708 . +)
              (|Mapping| 179 179 179) (|List| 179) (714 . |reduce|)
              |SMTS;coerce;$Of;62| (720 . /) (726 . /) (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Polynomial| 6) (|Equation| $) (|List| 200) (|Mapping| 6 6)
              (|List| 56) (|PositiveInteger|) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 732 |zero?| 738 |variables| 743 |unitNormal| 748
              |unitCanonical| 753 |unit?| 758 |tanh| 763 |tan| 768
              |subtractIfCan| 773 |sqrt| 779 |sinh| 784 |sin| 789 |sech| 794
              |sec| 799 |sample| 804 |reductum| 808 |recip| 813 |polynomial|
              818 |pole?| 831 |pi| 836 |order| 840 |opposite?| 853 |one?| 859
              |nthRoot| 864 |monomial?| 870 |monomial| 875 |map| 909 |log| 915
              |leadingMonomial| 920 |leadingCoefficient| 925 |latex| 930
              |integrate| 935 |hashUpdate!| 948 |hash| 954 |fintegrate| 959
              |extend| 966 |exquo| 972 |exp| 978 |eval| 983 |differentiate|
              1023 |degree| 1049 |csubst| 1054 |csch| 1060 |csc| 1065 |coth|
              1070 |cot| 1075 |cosh| 1080 |cos| 1085 |complete| 1090 |coerce|
              1095 |coefficient| 1130 |charthRoot| 1156 |characteristic| 1161
              |atanh| 1165 |atan| 1170 |associates?| 1175 |asinh| 1181 |asin|
              1186 |asech| 1191 |asec| 1196 |annihilate?| 1201 |acsch| 1207
              |acsc| 1212 |acoth| 1217 |acot| 1222 |acosh| 1227 |acos| 1232 ^
              1237 |Zero| 1261 |One| 1265 D 1269 = 1295 / 1301 - 1307 + 1318 *
              1324)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 2 1 2 5 0 1 6 2 2 3 4 5 0 0 1 6 0 0 0 0
                                  1 1 6 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 1
                                  1 1 1 6 2))
            (CONS
             '#(|MultivariateTaylorSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |PartialDifferentialRing&| |Module&| NIL |Module&|
                |EntireRing&| NIL NIL |Module&| |Ring&| NIL NIL NIL |Rng&| NIL
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |Evalable&|
                |SetCategory&| |TranscendentalFunctionCategory&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL |BasicType&| NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL NIL)
             (CONS
              '#((|MultivariateTaylorSeriesCategory| 6 7)
                 (|PowerSeriesCategory| 6 (|IndexedExponents| 7) 7)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|Algebra| 113) (|Algebra| $$)
                 (|Algebra| 6) (|PartialDifferentialRing| 7) (|Module| 113)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 113 113)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 113) (|RightModule| 113)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|Evalable| $$) (|SetCategory|)
                 (|TranscendentalFunctionCategory|) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 179)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 207
                                  '(0 0 0 10 0 6 0 11 2 9 0 0 12 13 1 9 0 0 16
                                    0 0 0 18 0 6 0 19 0 8 0 20 2 8 0 0 0 21 3 8
                                    0 0 22 23 24 2 26 0 25 0 27 3 29 26 8 28 26
                                    30 1 32 31 12 33 1 8 0 6 34 3 8 0 0 7 14 35
                                    3 39 26 36 37 38 40 1 9 41 0 42 2 14 41 0 0
                                    43 1 9 0 0 44 2 14 41 0 0 45 1 9 8 0 46 3 8
                                    0 0 22 48 49 2 14 0 0 0 50 2 48 14 51 0 52
                                    2 9 0 0 14 53 2 9 0 25 0 54 1 56 14 0 57 1
                                    56 0 0 58 1 56 41 0 59 2 8 6 0 56 60 2 32
                                    26 8 12 62 2 32 26 8 26 64 1 8 68 0 69 2 8
                                    70 0 7 71 1 72 41 0 73 1 72 14 0 74 1 72 8
                                    0 76 2 0 0 0 0 77 2 0 0 0 0 78 1 72 0 0 79
                                    1 8 0 7 81 0 8 0 83 2 7 41 0 0 84 1 85 2 0
                                    86 2 0 0 0 14 87 1 85 0 0 88 2 7 41 0 0 89
                                    2 22 0 90 0 91 2 22 12 7 0 92 2 85 2 0 12
                                    93 1 8 41 0 97 1 26 0 0 98 1 85 14 0 99 2
                                    101 100 94 26 102 1 32 26 100 103 0 26 0
                                    105 2 9 0 8 0 106 2 26 0 8 0 107 1 26 0 108
                                    109 2 8 0 0 7 111 2 32 26 113 26 114 2 0 0
                                    0 113 115 2 8 0 113 0 116 2 29 26 25 26 117
                                    2 0 0 113 0 118 2 8 0 0 113 119 2 0 0 0 113
                                    120 1 121 26 26 122 1 0 0 0 123 1 121 26 26
                                    124 1 0 0 0 125 1 121 26 26 126 1 0 0 0 127
                                    1 121 26 26 128 1 0 0 0 129 1 121 26 26 130
                                    1 0 0 0 131 1 121 26 26 132 1 0 0 0 133 1
                                    121 26 26 134 1 0 0 0 135 1 121 26 26 136 1
                                    0 0 0 137 1 121 26 26 138 1 0 0 0 139 1 121
                                    26 26 140 1 0 0 0 141 1 121 26 26 142 1 0 0
                                    0 143 1 121 26 26 144 1 0 0 0 145 1 121 26
                                    26 146 1 0 0 0 147 1 121 26 26 148 1 0 0 0
                                    149 1 121 26 26 150 1 0 0 0 151 1 121 26 26
                                    152 1 0 0 0 153 1 121 26 26 154 1 0 0 0 155
                                    1 121 26 26 156 1 0 0 0 157 1 121 26 26 158
                                    1 0 0 0 159 1 121 26 26 160 1 0 0 0 161 1
                                    121 26 26 162 1 0 0 0 163 1 121 26 26 164 1
                                    0 0 0 165 1 121 26 26 166 1 0 0 0 167 1 121
                                    26 26 168 1 0 0 0 169 1 121 26 26 170 1 0 0
                                    0 171 1 121 26 26 172 1 0 0 0 173 1 113 0
                                    12 174 1 113 0 0 175 1 9 0 108 176 3 0 0
                                    108 7 6 177 3 0 0 0 7 6 178 1 8 179 0 180 1
                                    8 41 0 181 1 179 0 0 182 2 8 41 0 0 183 1 9
                                    41 0 184 2 9 41 0 0 185 1 9 41 0 186 2 8 41
                                    0 0 187 1 14 179 0 188 2 179 0 0 23 189 2
                                    179 0 0 0 190 2 192 179 191 0 193 2 8 0 0 6
                                    195 2 0 0 0 6 196 2 0 41 0 0 1 1 0 41 0 1 1
                                    0 22 0 1 1 9 198 0 1 1 9 0 0 1 1 9 41 0 1 1
                                    1 0 0 155 1 1 0 0 131 2 0 197 0 0 1 1 1 0 0
                                    1 1 1 0 0 151 1 1 0 0 127 1 1 0 0 159 1 1 0
                                    0 135 0 0 0 1 1 0 0 0 1 1 0 197 0 1 3 0 199
                                    0 14 14 1 2 0 199 0 14 1 1 0 41 0 1 0 1 0 1
                                    3 0 14 0 7 14 1 2 0 14 0 7 1 2 0 41 0 0 1 1
                                    0 41 0 1 2 1 0 0 12 1 1 0 41 0 1 3 0 0 0 7
                                    14 75 3 0 0 0 22 48 1 2 0 0 6 56 1 3 0 0 0
                                    22 203 1 3 0 0 0 7 56 1 2 0 0 202 0 1 1 1 0
                                    0 125 1 0 0 0 1 1 0 6 0 1 1 0 206 0 1 3 1 0
                                    0 7 6 178 2 1 0 0 7 1 2 0 205 205 0 1 1 0
                                    207 0 1 3 1 0 108 7 6 177 2 0 0 0 14 15 2 9
                                    197 0 0 1 1 1 0 0 123 3 0 0 0 23 23 1 2 0 0
                                    0 200 1 3 0 0 0 0 0 1 3 0 0 0 22 23 104 2 0
                                    0 0 201 1 3 0 0 0 7 0 110 3 0 0 0 22 48 1 3
                                    0 0 0 7 14 1 2 0 0 0 7 112 2 0 0 0 22 1 1 0
                                    56 0 1 2 0 94 22 95 96 1 1 0 0 161 1 1 0 0
                                    137 1 1 0 0 157 1 1 0 0 133 1 1 0 0 153 1 1
                                    0 0 129 1 0 0 0 17 1 8 0 6 63 1 9 0 0 1 1 1
                                    0 113 1 1 0 0 8 80 1 0 0 7 82 1 0 0 12 1 1
                                    0 179 0 194 2 0 8 0 14 47 3 0 0 0 22 48 55
                                    3 0 0 0 7 14 1 2 0 6 0 56 61 1 3 197 0 1 0
                                    0 14 1 1 1 0 0 167 1 1 0 0 143 2 9 41 0 0 1
                                    1 1 0 0 163 1 1 0 0 139 1 1 0 0 171 1 1 0 0
                                    147 2 0 41 0 0 1 1 1 0 0 173 1 1 0 0 149 1
                                    1 0 0 169 1 1 0 0 145 1 1 0 0 165 1 1 0 0
                                    141 2 1 0 0 113 115 2 1 0 0 0 1 2 0 0 0 14
                                    87 2 0 0 0 204 1 0 0 0 18 0 0 0 10 3 0 0 0
                                    22 48 1 2 0 0 0 22 1 3 0 0 0 7 14 1 2 0 0 0
                                    7 1 2 0 41 0 0 1 2 7 0 0 6 196 2 0 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 78 2 1 0 113 0 118 2 1
                                    0 0 113 120 2 0 0 8 0 65 2 0 0 0 6 67 2 0 0
                                    6 0 66 2 0 0 0 0 77 2 0 0 12 0 1 2 0 0 14 0
                                    1 2 0 0 204 0 1)))))
           '|lookupComplete|)) 
