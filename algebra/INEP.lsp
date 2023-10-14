
(/VERSIONCHECK 2) 

(DEFUN |INEP;numeric| (|r| $)
  (COND
   ((|domainEqual| (QREFELT $ 6) (|Fraction| (|Integer|)))
    (COND
     ((|domainEqual| (QREFELT $ 7) (|Float|)) (SPADCALL |r| (QREFELT $ 11)))
     ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|))) |r|)
     ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
      (SPADCALL |r| (QREFELT $ 13)))
     ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
      (SPADCALL |r| (QREFELT $ 15)))))
   ((|domainEqual| (QREFELT $ 6) (|Complex| (|Fraction| (|Integer|))))
    (COND
     ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|)))) |r|)
     ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
      (SPADCALL (SPADCALL |r| (QREFELT $ 16)) (QREFELT $ 17)))))
   ('T (|error| "unsupported coefficient type")))) 

(DEFUN |INEP;monicize| (|f| $)
  (PROG (|a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |f| (QREFELT $ 19)) |INEP;monicize|)
          (EXIT
           (COND ((SPADCALL |a| (|spadConstant| $ 20) (QREFELT $ 23)) |f|)
                 ('T
                  (SPADCALL (SPADCALL |a| (QREFELT $ 24)) |f|
                            (QREFELT $ 25))))))))) 

(DEFUN |INEP;reduction| (|u| |p| $) (SPADCALL |u| |p| (QREFELT $ 26))) 

(DEFUN |INEP;merge| (|p| |q| $)
  (COND ((SPADCALL |p| |q| (QREFELT $ 27)) (CONS 0 |p|))
        ((SPADCALL |p| (|spadConstant| $ 30) (QREFELT $ 27)) (CONS 0 |q|))
        ((SPADCALL |q| (|spadConstant| $ 30) (QREFELT $ 27)) (CONS 0 |p|))
        ('T (CONS 1 "failed")))) 

(DEFUN |INEP;exactquo| (|u| |v| |p| $)
  (PROG (|val|)
    (RETURN
     (SEQ (LETT |val| (SPADCALL |v| |p| |u| (QREFELT $ 33)) |INEP;exactquo|)
          (EXIT
           (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |val|)))))))))) 

(DEFUN |INEP;evalvect| (|vect| |alg| $)
  (PROG (|v| |polf| |i| |w| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |vect|) . #1=(|INEP;evalvect|))
          (LETT |w| (SPADCALL |n| 1 (QREFELT $ 36)) . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (LETT |polf|
                      (SPADCALL (CONS (|function| |INEP;numeric|) $)
                                (SPADCALL |vect| |i| 1 (QREFELT $ 39))
                                (QREFELT $ 43))
                      . #1#)
                (LETT |v| (SPADCALL |polf| |alg| (QREFELT $ 44)) . #1#)
                (EXIT (SPADCALL |w| |i| 1 |v| (QREFELT $ 45))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |w|))))) 

(DEFUN |INEP;inteigen| (A |p| |fact| $)
  (PROG (|res| |soln| |i| |wk| #1=#:G188 |vec| |sln2| |j| B |alg| |ppol| |lr|
         |wf| #2=#:G187 |vecr| B1 |alpha| |pol| #3=#:G186 |ff| |lff| AM MM
         |dimA|)
    (RETURN
     (SEQ (LETT |dimA| (QVSIZE A) . #4=(|INEP;inteigen|))
          (LETT MM
                (|ModularField| (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                (|SparseUnivariatePolynomial| (QREFELT $ 6))
                                (CONS (|function| |INEP;reduction|) $)
                                (CONS (|function| |INEP;merge|) $)
                                (CONS (|function| |INEP;exactquo|) $))
                . #4#)
          (LETT AM (|Matrix| MM) . #4#)
          (LETT |lff| (SPADCALL (SPADCALL |p| |fact|) (QREFELT $ 49)) . #4#)
          (LETT |res| NIL . #4#) (LETT |lr| NIL . #4#)
          (SEQ (LETT |ff| NIL . #4#) (LETT #3# |lff| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ff| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |pol| (QCAR |ff|) . #4#)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pol| (QREFELT $ 50)) 1)
                       (SEQ
                        (LETT |alpha|
                              (SPADCALL
                               (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 51))
                                         (SPADCALL |pol| (QREFELT $ 19))
                                         (QREFELT $ 52))
                               (QREFELT $ 53))
                              . #4#)
                        (LETT B1 (SPADCALL |dimA| |dimA| (QREFELT $ 55)) . #4#)
                        (SEQ (LETT |i| 1 . #4#) G190
                             (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                             (SEQ
                              (SEQ (LETT |j| 1 . #4#) G190
                                   (COND ((|greater_SI| |j| |dimA|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL B1 |i| |j|
                                               (SPADCALL A |i| |j|
                                                         (QREFELT $ 56))
                                               (QREFELT $ 57))))
                                   (LETT |j| (|inc_SI| |j|) . #4#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT
                               (SPADCALL B1 |i| |i|
                                         (SPADCALL
                                          (SPADCALL B1 |i| |i| (QREFELT $ 56))
                                          |alpha| (QREFELT $ 58))
                                         (QREFELT $ 57))))
                             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lr| NIL . #4#)
                        (SEQ (LETT |vecr| NIL . #4#)
                             (LETT #2# (SPADCALL B1 (QREFELT $ 60)) . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |vecr| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |wf| (SPADCALL |dimA| 1 (QREFELT $ 36))
                                    . #4#)
                              (SEQ (LETT |i| 1 . #4#) G190
                                   (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |wf| |i| 1
                                               (|INEP;numeric|
                                                (SPADCALL |vecr| |i|
                                                          (QREFELT $ 62))
                                                $)
                                               (QREFELT $ 45))))
                                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT (LETT |lr| (CONS |wf| |lr|) . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (CONS
                                (CONS 0
                                      (VECTOR (|INEP;numeric| |alpha| $)
                                              (QCDR |ff|) |lr|))
                                |res|)
                               . #4#))))
                      ('T
                       (SEQ (LETT |ppol| (|INEP;monicize| |pol| $) . #4#)
                            (LETT |alg|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 20) 1
                                             (QREFELT $ 63))
                                   |ppol|
                                   (|compiledLookupCheck| '|reduce|
                                                          (LIST '$
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 6)))
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  (ELT $ 6))))
                                                          MM))
                                  . #4#)
                            (LETT B
                                  (SPADCALL |dimA| |dimA|
                                            (|compiledLookupCheck| '|zero|
                                                                   (LIST '$
                                                                         (LIST
                                                                          '|NonNegativeInteger|)
                                                                         (LIST
                                                                          '|NonNegativeInteger|))
                                                                   AM))
                                  . #4#)
                            (SEQ (LETT |i| 1 . #4#) G190
                                 (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                                 (SEQ
                                  (SEQ (LETT |j| 1 . #4#) G190
                                       (COND
                                        ((|greater_SI| |j| |dimA|) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL B |i| |j|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL A |i| |j|
                                                               (QREFELT $ 56))
                                                     (QREFELT $ 64))
                                                    |ppol|
                                                    (|compiledLookupCheck|
                                                     '|reduce|
                                                     (LIST '$
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 6)))
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             (ELT $ 6))))
                                                     MM))
                                                   (|compiledLookupCheck|
                                                    '|setelt|
                                                    (LIST (|devaluate| MM) '$
                                                          (LIST '|Integer|)
                                                          (LIST '|Integer|)
                                                          (|devaluate| MM))
                                                    AM))))
                                       (LETT |j| (|inc_SI| |j|) . #4#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL B |i| |i|
                                             (SPADCALL
                                              (SPADCALL B |i| |i|
                                                        (|compiledLookupCheck|
                                                         '|elt|
                                                         (LIST (|devaluate| MM)
                                                               '$
                                                               (LIST
                                                                '|Integer|)
                                                               (LIST
                                                                '|Integer|))
                                                         AM))
                                              |alg|
                                              (|compiledLookupCheck| '-
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     MM))
                                             (|compiledLookupCheck| '|setelt|
                                                                    (LIST
                                                                     (|devaluate|
                                                                      MM)
                                                                     '$
                                                                     (LIST
                                                                      '|Integer|)
                                                                     (LIST
                                                                      '|Integer|)
                                                                     (|devaluate|
                                                                      MM))
                                                                    AM))))
                                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |sln2|
                                  (SPADCALL B
                                            (|compiledLookupCheck| '|nullSpace|
                                                                   (LIST
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|Vector|
                                                                      (|devaluate|
                                                                       MM)))
                                                                    '$)
                                                                   AM))
                                  . #4#)
                            (LETT |soln| NIL . #4#)
                            (SEQ (LETT |vec| NIL . #4#) (LETT #1# |sln2| . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN
                                        (LETT |vec| (CAR #1#) . #4#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |wk| (SPADCALL |dimA| 1 (QREFELT $ 65))
                                        . #4#)
                                  (SEQ (LETT |i| 1 . #4#) G190
                                       (COND
                                        ((|greater_SI| |i| |dimA|) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |wk| |i| 1
                                                   (SPADCALL
                                                    (SPADCALL |vec| |i|
                                                              (|compiledLookupCheck|
                                                               '|elt|
                                                               (LIST
                                                                (|devaluate|
                                                                 MM)
                                                                '$
                                                                (LIST
                                                                 '|Integer|))
                                                               (|Vector| MM)))
                                                    (|compiledLookupCheck|
                                                     '|coerce|
                                                     (LIST
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| (ELT $ 6)))
                                                      '$)
                                                     MM))
                                                   (QREFELT $ 66))))
                                       (LETT |i| (|inc_SI| |i|) . #4#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |soln| (CONS |wk| |soln|) . #4#)))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |res|
                                   (CONS
                                    (CONS 1
                                          (VECTOR (QCAR |ff|) (QCDR |ff|)
                                                  |soln|))
                                    |res|)
                                   . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |INEP;solve1;SupParL;8| (|up| |eps| $)
  (PROG (|upi| |denom| #1=#:G190 #2=#:G189 #3=#:G191 #4=#:G195 |c|)
    (RETURN
     (SEQ
      (LETT |denom|
            (PROGN
             (LETT #1# NIL . #5=(|INEP;solve1;SupParL;8|))
             (SEQ (LETT |c| NIL . #5#)
                  (LETT #4# (SPADCALL |up| (QREFELT $ 68)) . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# (SPADCALL |c| (QREFELT $ 69)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 70)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T 1)))
            . #5#)
      (LETT |up| (SPADCALL |denom| |up| (QREFELT $ 71)) . #5#)
      (LETT |upi| (SPADCALL (ELT $ 72) |up| (QREFELT $ 77)) . #5#)
      (EXIT (SPADCALL |upi| |eps| (QREFELT $ 80))))))) 

(DEFUN |INEP;solve1;SupParL;9| (|up| |eps| $)
  (PROG (|upgi| |denom| #1=#:G197 #2=#:G196 #3=#:G198 #4=#:G202 |c|)
    (RETURN
     (SEQ
      (LETT |denom|
            (PROGN
             (LETT #1# NIL . #5=(|INEP;solve1;SupParL;9|))
             (SEQ (LETT |c| NIL . #5#)
                  (LETT #4# (SPADCALL |up| (QREFELT $ 68)) . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL
                            (SPADCALL (SPADCALL |c| (QREFELT $ 82))
                                      (QREFELT $ 69))
                            (SPADCALL (SPADCALL |c| (QREFELT $ 83))
                                      (QREFELT $ 69))
                            (QREFELT $ 70))
                           . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 70)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T 1)))
            . #5#)
      (LETT |up| (SPADCALL |denom| |up| (QREFELT $ 71)) . #5#)
      (LETT |upgi|
            (SPADCALL (CONS #'|INEP;solve1;SupParL;9!0| $) |up| (QREFELT $ 90))
            . #5#)
      (EXIT (SPADCALL |upgi| |eps| (QREFELT $ 92))))))) 

(DEFUN |INEP;solve1;SupParL;9!0| (|c1| $)
  (SPADCALL (SPADCALL (SPADCALL |c1| (QREFELT $ 82)) (QREFELT $ 72))
            (SPADCALL (SPADCALL |c1| (QREFELT $ 83)) (QREFELT $ 72))
            (QREFELT $ 85))) 

(DEFUN |INEP;innerEigenvectors;MParML;10| (A |eps| |fact| $)
  (PROG (|sln| |nsl| #1=#:G217 |ep| #2=#:G216 #3=#:G215 |alg| |lmult| |lvect|
         |lval| |leva| #4=#:G214 |lev| |n| |sln1| |pol|)
    (RETURN
     (SEQ
      (LETT |pol| (SPADCALL A (QREFELT $ 93))
            . #5=(|INEP;innerEigenvectors;MParML;10|))
      (LETT |sln1| (|INEP;inteigen| A |pol| |fact| $) . #5#)
      (LETT |n| (QVSIZE A) . #5#) (LETT |sln| NIL . #5#)
      (SEQ (LETT |lev| NIL . #5#) (LETT #4# |sln1| . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |lev| (CAR #4#) . #5#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((QEQCAR |lev| 0) (LETT |sln| (CONS (QCDR |lev|) |sln|) . #5#))
              ('T
               (SEQ (LETT |leva| (QCDR |lev|) . #5#)
                    (LETT |lval|
                          (SPADCALL (QVELT |leva| 0) |eps| (QREFELT $ 81))
                          . #5#)
                    (LETT |lvect| (QVELT |leva| 2) . #5#)
                    (LETT |lmult| (QVELT |leva| 1) . #5#)
                    (EXIT
                     (SEQ (LETT |alg| NIL . #5#) (LETT #3# |lval| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |alg| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |nsl|
                                 (VECTOR |alg| |lmult|
                                         (PROGN
                                          (LETT #2# NIL . #5#)
                                          (SEQ (LETT |ep| NIL . #5#)
                                               (LETT #1# |lvect| . #5#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |ep| (CAR #1#)
                                                            . #5#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (|INEP;evalvect| |ep|
                                                         |alg| $)
                                                        #2#)
                                                       . #5#)))
                                               (LETT #1# (CDR #1#) . #5#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#)))))
                                 . #5#)
                           (EXIT (LETT |sln| (CONS |nsl| |sln|) . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT NIL))))))))
           (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |sln|))))) 

(DEFUN |INEP;charpol;MSup;11| (A $)
  (PROG (|j| |i| B |dimA| #1=#:G218)
    (RETURN
     (SEQ
      (LETT |dimA|
            (PROG1 (LETT #1# (QVSIZE A) . #2=(|INEP;charpol;MSup;11|))
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
            . #2#)
      (EXIT
       (COND
        ((SPADCALL |dimA| (SPADCALL A (QREFELT $ 98)) (QREFELT $ 99))
         (|error| " The matrix is not square"))
        ('T
         (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 65)) . #2#)
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #2#) G190
                         (COND ((|greater_SI| |j| |dimA|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL A |i| |j| (QREFELT $ 56))
                                      (QREFELT $ 64))
                                     (QREFELT $ 66))))
                         (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 39))
                                         (SPADCALL (|spadConstant| $ 20) 1
                                                   (QREFELT $ 63))
                                         (QREFELT $ 100))
                               (QREFELT $ 66))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL B (QREFELT $ 101))))))))))) 

(DECLAIM (NOTINLINE |InnerNumericEigenPackage;|)) 

(DEFUN |InnerNumericEigenPackage| (&REST #1=#:G225)
  (PROG ()
    (RETURN
     (PROG (#2=#:G226)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerNumericEigenPackage|)
                                           '|domainEqualList|)
                . #3=(|InnerNumericEigenPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerNumericEigenPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InnerNumericEigenPackage|))))))))))) 

(DEFUN |InnerNumericEigenPackage;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerNumericEigenPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|InnerNumericEigenPackage| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 102) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerNumericEigenPackage|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|domainEqual| |#1| (|Fraction| (|Integer|)))
        (QSETREFV $ 81 (CONS (|dispatchFunction| |INEP;solve1;SupParL;8|) $)))
       ((|domainEqual| |#1| (|Complex| (|Fraction| (|Integer|))))
        (QSETREFV $ 81 (CONS (|dispatchFunction| |INEP;solve1;SupParL;9|) $)))
       ('T (|error| "unsupported matrix type")))
      $)))) 

(MAKEPROP '|InnerNumericEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Float|) (|Fraction| 37) (0 . |convert|)
              (|Complex| 9) (5 . |coerce|) (|Complex| 10) (10 . |coerce|)
              (15 . |convert|) (20 . |convert|)
              (|SparseUnivariatePolynomial| 6) (25 . |leadingCoefficient|)
              (30 . |One|) (34 . |One|) (|Boolean|) (38 . =) (44 . |inv|)
              (49 . *) (55 . |rem|) (61 . =) (67 . |Zero|) (71 . |Zero|)
              (75 . |Zero|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 31 '"failed") (79 . |extendedEuclidean|)
              (|NonNegativeInteger|) (|Matrix| 7) (86 . |zero|) (|Integer|)
              (|Matrix| 18) (92 . |elt|) (|SparseUnivariatePolynomial| 7)
              (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 18 7 40) (99 . |map|)
              (105 . |elt|) (111 . |setelt|)
              (|Record| (|:| |factor| 18) (|:| |exponent| 37)) (|List| 46)
              (|Factored| 18) (119 . |factors|) (124 . |degree|)
              (129 . |coefficient|) (135 . /) (141 . -) (|Matrix| 6)
              (146 . |zero|) (152 . |elt|) (159 . |setelt|) (167 . -)
              (|List| 61) (173 . |nullSpace|) (|Vector| 6) (178 . |elt|)
              (184 . |monomial|) (190 . |coerce|) (195 . |zero|)
              (201 . |setelt|) (|List| 6) (209 . |coefficients|)
              (214 . |denom|) (219 . |lcm|) (225 . *) (231 . |numer|)
              (|SparseUnivariatePolynomial| 37) (|Mapping| 37 10)
              (|SparseUnivariatePolynomial| 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 75 37 73)
              (236 . |map|) (|List| 7) (|InnerNumericFloatSolvePackage| 37 7 8)
              (242 . |innerSolve1|) (248 . |solve1|) (254 . |real|)
              (259 . |imag|) (|Complex| 37) (264 . |complex|)
              (|SparseUnivariatePolynomial| 84) (|Mapping| 84 14)
              (|SparseUnivariatePolynomial| 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 88 84 86)
              (270 . |map|) (|InnerNumericFloatSolvePackage| 84 7 8)
              (276 . |innerSolve1|) |INEP;charpol;MSup;11|
              (|Record| (|:| |outval| 7) (|:| |outmult| 37)
                        (|:| |outvect| (|List| 35)))
              (|List| 94) (|Mapping| 48 18) |INEP;innerEigenvectors;MParML;10|
              (282 . |ncols|) (287 . ~=) (293 . -) (299 . |determinant|))
           '#(|solve1| 304 |innerEigenvectors| 310 |charpol| 317) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 101
                                                 '(1 10 9 0 11 1 12 0 10 13 1
                                                   14 0 10 15 1 14 12 0 16 1 12
                                                   12 0 17 1 18 6 0 19 0 6 0 20
                                                   0 7 0 21 2 6 22 0 0 23 1 6 0
                                                   0 24 2 18 0 6 0 25 2 18 0 0
                                                   0 26 2 18 22 0 0 27 0 6 0 28
                                                   0 7 0 29 0 18 0 30 3 18 32 0
                                                   0 0 33 2 35 0 34 34 36 3 38
                                                   18 0 37 37 39 2 42 40 41 18
                                                   43 2 40 7 0 7 44 4 35 7 0 37
                                                   37 7 45 1 48 47 0 49 1 18 34
                                                   0 50 2 18 6 0 34 51 2 6 0 0
                                                   0 52 1 6 0 0 53 2 54 0 34 34
                                                   55 3 54 6 0 37 37 56 4 54 6
                                                   0 37 37 6 57 2 6 0 0 0 58 1
                                                   54 59 0 60 2 61 6 0 37 62 2
                                                   18 0 6 34 63 1 18 0 6 64 2
                                                   38 0 34 34 65 4 38 18 0 37
                                                   37 18 66 1 18 67 0 68 1 10
                                                   37 0 69 2 37 0 0 0 70 2 18 0
                                                   37 0 71 1 10 37 0 72 2 76 73
                                                   74 75 77 2 79 78 73 8 80 2 0
                                                   78 18 8 81 1 14 10 0 82 1 14
                                                   10 0 83 2 84 0 37 37 85 2 89
                                                   86 87 88 90 2 91 78 86 8 92
                                                   1 54 34 0 98 2 34 22 0 0 99
                                                   2 18 0 0 0 100 1 38 18 0 101
                                                   2 0 78 18 8 81 3 0 95 54 8
                                                   96 97 1 0 18 54 93)))))
           '|lookupComplete|)) 
