
(/VERSIONCHECK 2) 

(DEFUN |EP;reduction| (|u| |p| $) (SPADCALL |u| |p| (QREFELT $ 10))) 

(DEFUN |EP;merge| (|p| |q| $)
  (COND ((SPADCALL |p| |q| (QREFELT $ 12)) (CONS 0 |p|))
        ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 12)) (CONS 0 |q|))
        ((SPADCALL |q| (|spadConstant| $ 14) (QREFELT $ 12)) (CONS 0 |p|))
        ('T (CONS 1 "failed")))) 

(DEFUN |EP;exactquo| (|u| |v| |p| $)
  (PROG (|val|)
    (RETURN
     (SEQ (LETT |val| (SPADCALL |v| |p| |u| (QREFELT $ 17)) |EP;exactquo|)
          (EXIT
           (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |val|)))))))))) 

(DEFUN |EP;fft| (|t| |x| $)
  (PROG (|cf| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |t| (QREFELT $ 19)) . #1=(|EP;fft|))
          (LETT |cf|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 23) |x| |n| (QREFELT $ 25))
                 (QREFELT $ 27))
                . #1#)
          (EXIT
           (SPADCALL |cf| (SPADCALL |t| (QREFELT $ 28)) (QREFELT $ 29))))))) 

(DEFUN |EP;tff| (|p| |x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL |p| (QREFELT $ 19)) 0) (SPADCALL |p| (QREFELT $ 28)))
       ('T
        (SEQ (LETT |r| (|spadConstant| $ 30) . #1=(|EP;tff|))
             (SEQ G190
                  (COND
                   ((NULL (SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 31)))
                    (GO G191)))
                  (SEQ
                   (LETT |r| (SPADCALL |r| (|EP;fft| |p| |x| $) (QREFELT $ 32))
                         . #1#)
                   (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 33)) . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT |r|)))))))) 

(DEFUN |EP;genEigForm| (|eigen| A $)
  (PROG (|g| |k| |alpha|)
    (RETURN
     (SEQ (LETT |alpha| (QVELT |eigen| 0) . #1=(|EP;genEigForm|))
          (LETT |k| (QVELT |eigen| 1) . #1#)
          (LETT |g| (LENGTH (QVELT |eigen| 2)) . #1#)
          (EXIT
           (COND ((EQL |k| |g|) (CONS |alpha| (QVELT |eigen| 2)))
                 ('T
                  (CONS |alpha|
                        (SPADCALL |alpha| A |k| |g| (QREFELT $ 37)))))))))) 

(DEFUN |EP;charpol| (A |x| $)
  (PROG (|j| |i| B |dimA| #1=#:G156)
    (RETURN
     (SEQ
      (LETT |dimA|
            (PROG1 (LETT #1# (QVSIZE A) . #2=(|EP;charpol|))
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
            . #2#)
      (EXIT
       (COND
        ((SPADCALL |dimA| (SPADCALL A (QREFELT $ 38)) (QREFELT $ 39))
         (|error| " The matrix is not square"))
        ('T
         (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 40)) . #2#)
              (SEQ (LETT |i| 1 . #2#) G190
                   (COND ((|greater_SI| |i| |dimA|) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #2#) G190
                         (COND ((|greater_SI| |j| |dimA|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL A |i| |j| (QREFELT $ 42))
                                     (QREFELT $ 43))))
                         (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 42))
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 23) |x| 1
                                                    (QREFELT $ 25))
                                          (QREFELT $ 27))
                                         (QREFELT $ 44))
                               (QREFELT $ 43))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL B (QREFELT $ 45))))))))))) 

(DEFUN |EP;characteristicPolynomial;MP;8| (A $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (QREFELT $ 46)) |EP;characteristicPolynomial;MP;8|)
      (EXIT (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 47))))))) 

(DEFUN |EP;characteristicPolynomial;MSP;9| (A |x| $)
  (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 47))) 

(DEFUN |EP;eigenvalues;ML;10| (A $)
  (PROG (#1=#:G182 |ls| #2=#:G181 #3=#:G180 |lr| #4=#:G179 |lsym| |lrat| |alg|
         #5=#:G178 |eq| |pol| |x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL (QREFELT $ 46)) . #6=(|EP;eigenvalues;ML;10|))
          (LETT |pol| (|EP;charpol| A |x| $) . #6#) (LETT |lrat| NIL . #6#)
          (LETT |lsym| NIL . #6#)
          (SEQ (LETT |eq| NIL . #6#)
               (LETT #5# (SPADCALL |pol| |x| (QREFELT $ 52)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |alg|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 54)) (QREFELT $ 47))
                      . #6#)
                (EXIT
                 (COND
                  ((EQL (SPADCALL |alg| |x| (QREFELT $ 55)) 1)
                   (LETT |lrat| (CONS (SPADCALL |eq| (QREFELT $ 56)) |lrat|)
                         . #6#))
                  ('T
                   (LETT |lsym|
                         (CONS (SPADCALL |x| |alg| (QREFELT $ 58)) |lsym|)
                         . #6#)))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (APPEND
            (PROGN
             (LETT #4# NIL . #6#)
             (SEQ (LETT |lr| NIL . #6#) (LETT #3# |lrat| . #6#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |lr| (CAR #3#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS (CONS 0 |lr|) #4#) . #6#)))
                  (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (PROGN
             (LETT #2# NIL . #6#)
             (SEQ (LETT |ls| NIL . #6#) (LETT #1# |lsym| . #6#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ls| (CAR #1#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (CONS 1 |ls|) #2#) . #6#)))
                  (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |EP;eigenvector;UML;11| (|alpha| A $)
  (COND ((QEQCAR |alpha| 0) (|EP;intRatEig| (QCDR |alpha|) A 1 $))
        ('T (|EP;intAlgEig| (QCDR |alpha|) A 1 $)))) 

(DEFUN |EP;intRatEig| (|alpha| A |m| $)
  (PROG (#1=#:G194 |v| #2=#:G193 |j| |i| B |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE A) . #3=(|EP;intRatEig|))
          (LETT B (SPADCALL |n| |n| (QREFELT $ 40)) . #3#)
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #3#) G190
                     (COND ((|greater_SI| |j| |n|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL B |i| |j| (SPADCALL A |i| |j| (QREFELT $ 42))
                                 (QREFELT $ 43))))
                     (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL B |i| |i|
                           (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 42))
                                     |alpha| (QREFELT $ 44))
                           (QREFELT $ 43))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |v| NIL . #3#)
                 (LETT #1#
                       (SPADCALL (SPADCALL B |m| (QREFELT $ 62))
                                 (QREFELT $ 64))
                       . #3#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 66)) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |EP;intAlgEig| (|alpha| A |m| $)
  (PROG (|sol| |i| |w| #1=#:G218 |vec| |j| B |alg| |pol| |x| AM MM |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE A) . #2=(|EP;intAlgEig|))
          (LETT MM
                (|ModularField|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|Polynomial| (QREFELT $ 6))))
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|Polynomial| (QREFELT $ 6))))
                 (CONS (|function| |EP;reduction|) $)
                 (CONS (|function| |EP;merge|) $)
                 (CONS (|function| |EP;exactquo|) $))
                . #2#)
          (LETT AM (|Matrix| MM) . #2#)
          (LETT |x| (SPADCALL |alpha| (QREFELT $ 67)) . #2#)
          (LETT |pol|
                (SPADCALL
                 (SPADCALL (ELT $ 27)
                           (SPADCALL (SPADCALL |alpha| (QREFELT $ 68)) |x|
                                     (QREFELT $ 70))
                           (QREFELT $ 73))
                 (QREFELT $ 74))
                . #2#)
          (LETT |alg|
                (SPADCALL (SPADCALL (|spadConstant| $ 75) 1 (QREFELT $ 76))
                          |pol|
                          (|compiledLookupCheck| '|reduce|
                                                 (LIST '$
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|Polynomial|
                                                               (|devaluate|
                                                                (ELT $ 6)))))
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST '|Fraction|
                                                              (LIST
                                                               '|Polynomial|
                                                               (|devaluate|
                                                                (ELT $ 6))))))
                                                 MM))
                . #2#)
          (LETT B
                (SPADCALL |n| |n|
                          (|compiledLookupCheck| '|zero|
                                                 (LIST '$
                                                       (LIST
                                                        '|NonNegativeInteger|)
                                                       (LIST
                                                        '|NonNegativeInteger|))
                                                 AM))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 1 . #2#) G190
                     (COND ((|greater_SI| |j| |n|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL B |i| |j|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL A |i| |j| (QREFELT $ 42))
                                            (QREFELT $ 77))
                                  |pol|
                                  (|compiledLookupCheck| '|reduce|
                                                         (LIST '$
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        6)))))
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        6))))))
                                                         MM))
                                 (|compiledLookupCheck| '|setelt|
                                                        (LIST (|devaluate| MM)
                                                              '$
                                                              (LIST '|Integer|)
                                                              (LIST '|Integer|)
                                                              (|devaluate| MM))
                                                        AM))))
                     (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL B |i| |i|
                           (SPADCALL
                            (SPADCALL B |i| |i|
                                      (|compiledLookupCheck| '|elt|
                                                             (LIST
                                                              (|devaluate| MM)
                                                              '$
                                                              (LIST '|Integer|)
                                                              (LIST
                                                               '|Integer|))
                                                             AM))
                            |alg|
                            (|compiledLookupCheck| '- (LIST '$ '$ '$) MM))
                           (|compiledLookupCheck| '|setelt|
                                                  (LIST (|devaluate| MM) '$
                                                        (LIST '|Integer|)
                                                        (LIST '|Integer|)
                                                        (|devaluate| MM))
                                                  AM))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |sol| NIL . #2#)
          (SEQ (LETT |vec| NIL . #2#)
               (LETT #1#
                     (SPADCALL
                      (SPADCALL B |m|
                                (|compiledLookupCheck| '^
                                                       (LIST '$ '$
                                                             (LIST
                                                              '|NonNegativeInteger|))
                                                       AM))
                      (|compiledLookupCheck| '|nullSpace|
                                             (LIST
                                              (LIST '|List|
                                                    (LIST '|Vector|
                                                          (|devaluate| MM)))
                                              '$)
                                             AM))
                     . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |vec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |w| (SPADCALL |n| 1 (QREFELT $ 40)) . #2#)
                    (SEQ (LETT |i| 1 . #2#) G190
                         (COND ((|greater_SI| |i| |n|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |w| |i| 1
                                     (|EP;tff|
                                      (SPADCALL
                                       (SPADCALL |vec| |i|
                                                 (|compiledLookupCheck| '|elt|
                                                                        (LIST
                                                                         (|devaluate|
                                                                          MM)
                                                                         '$
                                                                         (LIST
                                                                          '|Integer|))
                                                                        (|Vector|
                                                                         MM)))
                                       (|compiledLookupCheck| '|coerce|
                                                              (LIST
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (LIST
                                                                 '|Fraction|
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $
                                                                        6)))))
                                                               '$)
                                                              MM))
                                      |x| $)
                                     (QREFELT $ 43))))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |sol| (CONS |w| |sol|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |sol|))))) 

(DEFUN |EP;generalizedEigenvector;UM2NniL;14| (|alpha| A |k| |g| $)
  (PROG (#1=#:G223 #2=#:G222)
    (RETURN
     (COND
      ((QEQCAR |alpha| 0)
       (|EP;intRatEig| (QCDR |alpha|) A
        (PROG1
            (LETT #2# (- (+ 1 |k|) |g|)
                  . #3=(|EP;generalizedEigenvector;UM2NniL;14|))
          (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
        $))
      ('T
       (|EP;intAlgEig| (QCDR |alpha|) A
        (PROG1 (LETT #1# (- (+ 1 |k|) |g|) . #3#)
          (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
        $)))))) 

(DEFUN |EP;generalizedEigenvector;RML;15| (|eigen| A $)
  (SPADCALL (QVELT |eigen| 0) A (QVELT |eigen| 1) (LENGTH (QVELT |eigen| 2))
            (QREFELT $ 37))) 

(DEFUN |EP;generalizedEigenvectors;ML;16| (A $)
  (PROG (#1=#:G238 |leg| #2=#:G237 |leig| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE A) . #3=(|EP;generalizedEigenvectors;ML;16|))
          (LETT |leig| (SPADCALL A (QREFELT $ 81)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |leg| NIL . #3#) (LETT #1# |leig| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |leg| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|EP;genEigForm| |leg| A $) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |EP;eigenvectors;ML;17| (A $)
  (PROG (|algSol| #1=#:G253 |alpha| |ratSol| #2=#:G251 |vec| |pol| #3=#:G259
         |fact| |lff| AM MM |p| |x| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE A) . #4=(|EP;eigenvectors;ML;17|))
          (LETT |x| (SPADCALL (QREFELT $ 46)) . #4#)
          (LETT |p| (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 47)) . #4#)
          (LETT MM
                (|ModularField|
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|Polynomial| (QREFELT $ 6))))
                 (|SparseUnivariatePolynomial|
                  (|Fraction| (|Polynomial| (QREFELT $ 6))))
                 (CONS (|function| |EP;reduction|) $)
                 (CONS (|function| |EP;merge|) $)
                 (CONS (|function| |EP;exactquo|) $))
                . #4#)
          (LETT AM (|Matrix| MM) . #4#) (LETT |ratSol| NIL . #4#)
          (LETT |algSol| NIL . #4#)
          (LETT |lff| (SPADCALL (SPADCALL |p| (QREFELT $ 86)) (QREFELT $ 89))
                . #4#)
          (SEQ (LETT |fact| NIL . #4#) (LETT #3# |lff| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |fact| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |pol| (QCAR |fact|) . #4#)
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |pol| |x| (QREFELT $ 55)) 1)
                       (SEQ
                        (LETT |vec|
                              (SPADCALL
                               (SPADCALL (SPADCALL |pol| |x| 0 (QREFELT $ 90))
                                         (SPADCALL |pol| |x|
                                                   (SPADCALL |pol| |x|
                                                             (QREFELT $ 55))
                                                   (QREFELT $ 90))
                                         (QREFELT $ 91))
                               (QREFELT $ 92))
                              . #4#)
                        (EXIT
                         (LETT |ratSol|
                               (CONS
                                (VECTOR (CONS 0 |vec|)
                                        (PROG1 (LETT #2# (QCDR |fact|) . #4#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        (|EP;intRatEig| |vec| A 1 $))
                                |ratSol|)
                               . #4#))))
                      ('T
                       (SEQ
                        (LETT |alpha| (SPADCALL |x| |pol| (QREFELT $ 58))
                              . #4#)
                        (EXIT
                         (LETT |algSol|
                               (CONS
                                (VECTOR (CONS 1 |alpha|)
                                        (PROG1 (LETT #1# (QCDR |fact|) . #4#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (|EP;intAlgEig| |alpha| A 1 $))
                                |algSol|)
                               . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (APPEND |ratSol| |algSol|)))))) 

(DECLAIM (NOTINLINE |EigenPackage;|)) 

(DEFUN |EigenPackage| (#1=#:G260)
  (PROG ()
    (RETURN
     (PROG (#2=#:G261)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|EigenPackage|)
                                           '|domainEqualList|)
                . #3=(|EigenPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|EigenPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|EigenPackage|))))))))))) 

(DEFUN |EigenPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EigenPackage|))
      (LETT |dv$| (LIST '|EigenPackage| DV$1) . #1#)
      (LETT $ (GETREFV 93) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|EigenPackage| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|GeneralizedMultivariateFactorize| (|Symbol|)
                                                    (|IndexedExponents|
                                                     (|Symbol|))
                                                    |#1| |#1|
                                                    (|Polynomial| |#1|)))
      (QSETREFV $ 8
                (|UnivariatePolynomialCategoryFunctions2| (|Polynomial| |#1|)
                                                          (|SparseUnivariatePolynomial|
                                                           (|Polynomial| |#1|))
                                                          (|Fraction|
                                                           (|Polynomial| |#1|))
                                                          (|SparseUnivariatePolynomial|
                                                           (|Fraction|
                                                            (|Polynomial|
                                                             |#1|)))))
      $)))) 

(MAKEPROP '|EigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'MF 'UPCF2
              (|SparseUnivariatePolynomial| 26) (0 . |rem|) (|Boolean|) (6 . =)
              (12 . |Zero|) (16 . |Zero|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 15 '"failed")
              (20 . |extendedEuclidean|) (|NonNegativeInteger|) (27 . |degree|)
              (32 . |One|) (36 . |One|) (|Polynomial| 6) (40 . |One|)
              (|Symbol|) (44 . |monomial|) (|Fraction| 22) (51 . |coerce|)
              (56 . |leadingCoefficient|) (61 . *) (67 . |Zero|) (71 . ~=)
              (77 . +) (83 . |reductum|) (|List| 36) (|Union| 26 57)
              (|Matrix| 26) |EP;generalizedEigenvector;UM2NniL;14|
              (88 . |ncols|) (93 . ~=) (99 . |zero|) (|Integer|) (105 . |elt|)
              (112 . |setelt|) (120 . -) (126 . |determinant|) (131 . |new|)
              (135 . |numer|) |EP;characteristicPolynomial;MP;8|
              |EP;characteristicPolynomial;MSP;9| (|List| 53)
              (|SystemSolvePackage| 6) (140 . |solve|) (|Equation| 26)
              (146 . |lhs|) (151 . |degree|) (157 . |rhs|) (|SuchThat| 24 22)
              (162 . |construct|) (|List| 35) |EP;eigenvalues;ML;10|
              |EP;eigenvector;UML;11| (168 . ^) (|List| 65) (174 . |nullSpace|)
              (|Vector| 26) (179 . |coerce|) (184 . |lhs|) (189 . |rhs|)
              (|SparseUnivariatePolynomial| $) (194 . |univariate|)
              (|Mapping| 26 22) (|SparseUnivariatePolynomial| 22) (200 . |map|)
              (206 . |unitCanonical|) (211 . |One|) (215 . |monomial|)
              (221 . |coerce|)
              (|Record| (|:| |eigval| 35) (|:| |eigmult| 18) (|:| |eigvec| 34))
              |EP;generalizedEigenvector;RML;15| (|List| 78)
              |EP;eigenvectors;ML;17|
              (|Record| (|:| |eigval| 35) (|:| |geneigvec| 34)) (|List| 82)
              |EP;generalizedEigenvectors;ML;16| (|Factored| 22)
              (226 . |factor|) (|Record| (|:| |factor| 22) (|:| |exponent| 41))
              (|List| 87) (231 . |factors|) (236 . |coefficient|) (243 . /)
              (249 . -))
           '#(|generalizedEigenvectors| 254 |generalizedEigenvector| 259
              |eigenvectors| 273 |eigenvector| 278 |eigenvalues| 284
              |characteristicPolynomial| 289)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 92
                                                 '(2 9 0 0 0 10 2 9 11 0 0 12 0
                                                   6 0 13 0 9 0 14 3 9 16 0 0 0
                                                   17 1 9 18 0 19 0 6 0 20 0 9
                                                   0 21 0 22 0 23 3 22 0 0 24
                                                   18 25 1 26 0 22 27 1 9 26 0
                                                   28 2 26 0 0 0 29 0 26 0 30 2
                                                   9 11 0 0 31 2 26 0 0 0 32 1
                                                   9 0 0 33 1 36 18 0 38 2 18
                                                   11 0 0 39 2 36 0 18 18 40 3
                                                   36 26 0 41 41 42 4 36 26 0
                                                   41 41 26 43 2 26 0 0 0 44 1
                                                   36 26 0 45 0 24 0 46 1 26 22
                                                   0 47 2 51 50 26 24 52 1 53
                                                   26 0 54 2 22 18 0 24 55 1 53
                                                   26 0 56 2 57 0 24 22 58 2 36
                                                   0 0 18 62 1 36 63 0 64 1 36
                                                   0 65 66 1 57 24 0 67 1 57 22
                                                   0 68 2 22 69 0 24 70 2 8 9
                                                   71 72 73 1 9 0 0 74 0 26 0
                                                   75 2 9 0 26 18 76 1 9 0 26
                                                   77 1 7 85 22 86 1 85 88 0 89
                                                   3 22 0 0 24 18 90 2 26 0 22
                                                   22 91 1 26 0 0 92 1 0 83 36
                                                   84 2 0 34 78 36 79 4 0 34 35
                                                   36 18 18 37 1 0 80 36 81 2 0
                                                   34 35 36 61 1 0 59 36 60 1 0
                                                   22 36 48 2 0 22 36 24
                                                   49)))))
           '|lookupComplete|)) 
