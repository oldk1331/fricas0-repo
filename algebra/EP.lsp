
(SDEFUN |EP;reduction|
        ((|u| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|p| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         ($ |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
        (SPADCALL |u| |p| (QREFELT $ 10))) 

(SDEFUN |EP;merge|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|q| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         ($ |Union|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
          "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 12)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 12))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 14) (QREFELT $ 12))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |EP;exactquo|
        ((|u| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|v| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|p| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         ($ |Union|
          (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
          "failed"))
        (SPROG
         ((|val|
           (|Union|
            (|Record|
             (|:| |coef1|
                  (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
             (|:| |coef2|
                  (|SparseUnivariatePolynomial|
                   (|Fraction| (|Polynomial| R)))))
            "failed")))
         (SEQ (LETT |val| (SPADCALL |v| |p| |u| (QREFELT $ 17)) |EP;exactquo|)
              (EXIT
               (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (QCAR (QCDR |val|))))))))) 

(SDEFUN |EP;fft|
        ((|t| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|x| |Symbol|) ($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((|cf| (|Fraction| (|Polynomial| R))) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (SPADCALL |t| (QREFELT $ 19)) . #1=(|EP;fft|))
              (LETT |cf|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 23) |x| |n| (QREFELT $ 25))
                     (QREFELT $ 27))
                    . #1#)
              (EXIT
               (SPADCALL |cf| (SPADCALL |t| (QREFELT $ 28)) (QREFELT $ 29)))))) 

(SDEFUN |EP;tff|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R)))
         (|x| |Symbol|) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((|r| (|Fraction| (|Polynomial| R))))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT $ 19)) 0)
                  (SPADCALL |p| (QREFELT $ 28)))
                 ('T
                  (SEQ (LETT |r| (|spadConstant| $ 30) . #1=(|EP;tff|))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |p| (|spadConstant| $ 14)
                                         (QREFELT $ 31)))
                              (GO G191)))
                            (SEQ
                             (LETT |r|
                                   (SPADCALL |r| (|EP;fft| |p| |x| $)
                                             (QREFELT $ 32))
                                   . #1#)
                             (EXIT
                              (LETT |p| (SPADCALL |p| (QREFELT $ 33)) . #1#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |r|))))))) 

(SDEFUN |EP;genEigForm|
        ((|eigen| |Record|
          (|:| |eigval|
               #1=(|Union| (|Fraction| (|Polynomial| R))
                           (|SuchThat| (|Symbol|) (|Polynomial| R))))
          (|:| |eigmult| #2=(|NonNegativeInteger|))
          (|:| |eigvec| (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))
         (A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |Record|
          (|:| |eigval|
               (|Union| (|Fraction| (|Polynomial| R))
                        (|SuchThat| (|Symbol|) (|Polynomial| R))))
          (|:| |geneigvec| (|List| (|Matrix| (|Fraction| (|Polynomial| R)))))))
        (SPROG ((|g| (|NonNegativeInteger|)) (|k| #2#) (|alpha| #1#))
               (SEQ (LETT |alpha| (QVELT |eigen| 0) . #3=(|EP;genEigForm|))
                    (LETT |k| (QVELT |eigen| 1) . #3#)
                    (LETT |g| (LENGTH (QVELT |eigen| 2)) . #3#)
                    (EXIT
                     (COND ((EQL |k| |g|) (CONS |alpha| (QVELT |eigen| 2)))
                           ('T
                            (CONS |alpha|
                                  (SPADCALL |alpha| A |k| |g|
                                            (QREFELT $ 37))))))))) 

(SDEFUN |EP;charpol|
        ((A |Matrix| (|Fraction| (|Polynomial| R))) (|x| |Symbol|)
         ($ |Fraction| (|Polynomial| R)))
        (SPROG
         ((#1=#:G141 NIL) (|j| NIL) (#2=#:G140 NIL) (|i| NIL)
          (B (|Matrix| (|Fraction| (|Polynomial| R))))
          (|dimA| (|PositiveInteger|)) (#3=#:G133 NIL))
         (SEQ
          (LETT |dimA|
                (PROG1 (LETT #3# (ANROWS A) . #4=(|EP;charpol|))
                  (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #3#))
                . #4#)
          (EXIT
           (COND
            ((SPADCALL |dimA| (ANCOLS A) (QREFELT $ 38))
             (|error| " The matrix is not square"))
            ('T
             (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 39)) . #4#)
                  (SEQ (LETT |i| 1 . #4#) (LETT #2# |dimA| . #4#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (SEQ (LETT |j| 1 . #4#) (LETT #1# |dimA| . #4#) G190
                             (COND ((|greater_SI| |j| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL B |i| |j|
                                         (SPADCALL A |i| |j| (QREFELT $ 41))
                                         (QREFELT $ 42))))
                             (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL B |i| |i|
                                   (SPADCALL
                                    (SPADCALL B |i| |i| (QREFELT $ 41))
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 23) |x| 1
                                               (QREFELT $ 25))
                                     (QREFELT $ 27))
                                    (QREFELT $ 43))
                                   (QREFELT $ 42))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (SPADCALL B (QREFELT $ 44)))))))))) 

(SDEFUN |EP;characteristicPolynomial;MP;8|
        ((A |Matrix| (|Fraction| (|Polynomial| R))) ($ |Polynomial| R))
        (SPROG ((|x| (|Symbol|)))
               (SEQ
                (LETT |x| (SPADCALL (QREFELT $ 45))
                      |EP;characteristicPolynomial;MP;8|)
                (EXIT (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 46)))))) 

(SDEFUN |EP;characteristicPolynomial;MSP;9|
        ((A |Matrix| (|Fraction| (|Polynomial| R))) (|x| |Symbol|)
         ($ |Polynomial| R))
        (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 46))) 

(SDEFUN |EP;eigenvalues;ML;10|
        ((A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |List|
          (|Union| (|Fraction| (|Polynomial| R))
                   (|SuchThat| (|Symbol|) (|Polynomial| R)))))
        (SPROG
         ((#1=#:G161 NIL) (|ls| NIL) (#2=#:G160 NIL) (#3=#:G159 NIL) (|lr| NIL)
          (#4=#:G158 NIL)
          (|lsym| (|List| (|SuchThat| (|Symbol|) (|Polynomial| R))))
          (|lrat| (|List| (|Fraction| (|Polynomial| R))))
          (|alg| (|Polynomial| R)) (#5=#:G157 NIL) (|eq| NIL)
          (|pol| (|Fraction| (|Polynomial| R))) (|x| (|Symbol|)))
         (SEQ
          (LETT |x| (SPADCALL (QREFELT $ 45)) . #6=(|EP;eigenvalues;ML;10|))
          (LETT |pol| (|EP;charpol| A |x| $) . #6#) (LETT |lrat| NIL . #6#)
          (LETT |lsym| NIL . #6#)
          (SEQ (LETT |eq| NIL . #6#)
               (LETT #5# (SPADCALL |pol| |x| (QREFELT $ 51)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |alg|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 53)) (QREFELT $ 46))
                      . #6#)
                (EXIT
                 (COND
                  ((EQL (SPADCALL |alg| |x| (QREFELT $ 54)) 1)
                   (LETT |lrat| (CONS (SPADCALL |eq| (QREFELT $ 55)) |lrat|)
                         . #6#))
                  ('T
                   (LETT |lsym|
                         (CONS (SPADCALL |x| |alg| (QREFELT $ 57)) |lsym|)
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
                  (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |EP;eigenvector;UML;11|
        ((|alpha| |Union| (|Fraction| (|Polynomial| R))
          (|SuchThat| (|Symbol|) (|Polynomial| R)))
         (A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (COND ((QEQCAR |alpha| 0) (|EP;intRatEig| (QCDR |alpha|) A 1 $))
              ('T (|EP;intAlgEig| (QCDR |alpha|) A 1 $)))) 

(SDEFUN |EP;intRatEig|
        ((|alpha| |Fraction| (|Polynomial| R))
         (A |Matrix| (|Fraction| (|Polynomial| R))) (|m| |NonNegativeInteger|)
         ($ |List| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((#1=#:G175 NIL) (|v| NIL) (#2=#:G174 NIL) (#3=#:G173 NIL) (|j| NIL)
          (#4=#:G172 NIL) (|i| NIL)
          (B (|Matrix| (|Fraction| (|Polynomial| R))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #5=(|EP;intRatEig|))
              (LETT B (SPADCALL |n| |n| (QREFELT $ 39)) . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #4# |n| . #5#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #5#) (LETT #3# |n| . #5#) G190
                         (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL A |i| |j| (QREFELT $ 41))
                                     (QREFELT $ 42))))
                         (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 41))
                                         |alpha| (QREFELT $ 43))
                               (QREFELT $ 42))))
                   (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #5#)
                (SEQ (LETT |v| NIL . #5#)
                     (LETT #1#
                           (SPADCALL (SPADCALL B |m| (QREFELT $ 61))
                                     (QREFELT $ 63))
                           . #5#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 65)) #2#)
                             . #5#)))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |EP;intAlgEig|
        ((|alpha| |SuchThat| (|Symbol|) (|Polynomial| R))
         (A |Matrix| (|Fraction| (|Polynomial| R))) (|m| |NonNegativeInteger|)
         ($ |List| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (SPROG
         ((|sol| (|List| (|Matrix| (|Fraction| (|Polynomial| R)))))
          (#1=#:G202 NIL) (|i| NIL)
          (|w| (|Matrix| (|Fraction| (|Polynomial| R)))) (#2=#:G201 NIL)
          (|vec| NIL) (#3=#:G200 NIL) (|j| NIL) (#4=#:G199 NIL) (B (AM))
          (|alg| (MM))
          (|pol| (|SparseUnivariatePolynomial| (|Fraction| (|Polynomial| R))))
          (|x| (|Symbol|))
          (AM
           (|Join| (|MatrixCategory| MM (|Vector| MM) (|Vector| MM))
                   (CATEGORY |domain|
                    (SIGNATURE |diagonalMatrix| ($ (|Vector| MM)))
                    (IF (|has| MM (|ConvertibleTo| (|InputForm|)))
                        (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                        |noBranch|)
                    (IF (|has| MM (|Field|))
                        (SIGNATURE |inverse| ((|Union| $ "failed") $))
                        |noBranch|))))
          (MM
           (|Join| (|Field|)
                   (CATEGORY |domain|
                    (SIGNATURE |modulus|
                     (#5=(|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| R)))
                      $))
                    (SIGNATURE |coerce|
                     (#6=(|SparseUnivariatePolynomial|
                          (|Fraction| (|Polynomial| R)))
                      $))
                    (SIGNATURE |reduce| ($ #6# #5#))
                    (SIGNATURE |exQuo| ((|Union| $ "failed") $ $)))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #7=(|EP;intAlgEig|))
              (LETT MM
                    (|ModularField|
                     (|SparseUnivariatePolynomial|
                      (|Fraction| (|Polynomial| (QREFELT $ 6))))
                     (|SparseUnivariatePolynomial|
                      (|Fraction| (|Polynomial| (QREFELT $ 6))))
                     (CONS (|function| |EP;reduction|) $)
                     (CONS (|function| |EP;merge|) $)
                     (CONS (|function| |EP;exactquo|) $))
                    . #7#)
              (LETT AM (|Matrix| MM) . #7#)
              (LETT |x| (SPADCALL |alpha| (QREFELT $ 66)) . #7#)
              (LETT |pol|
                    (SPADCALL
                     (SPADCALL (ELT $ 27)
                               (SPADCALL (SPADCALL |alpha| (QREFELT $ 67)) |x|
                                         (QREFELT $ 69))
                               (QREFELT $ 72))
                     (QREFELT $ 73))
                    . #7#)
              (LETT |alg|
                    (SPADCALL (SPADCALL (|spadConstant| $ 74) 1 (QREFELT $ 75))
                              |pol|
                              (|compiledLookupCheck| '|reduce|
                                                     (LIST '$
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Polynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         6)))))
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Polynomial|
                                                                   (|devaluate|
                                                                    (ELT $
                                                                         6))))))
                                                     MM))
                    . #7#)
              (LETT B
                    (SPADCALL |n| |n|
                              (|compiledLookupCheck| '|zero|
                                                     (LIST '$
                                                           (LIST
                                                            '|NonNegativeInteger|)
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                     AM))
                    . #7#)
              (SEQ (LETT |i| 1 . #7#) (LETT #4# |n| . #7#) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #7#) (LETT #3# |n| . #7#) G190
                         (COND ((|greater_SI| |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL A |i| |j| (QREFELT $ 41))
                                       (QREFELT $ 76))
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
                                     (|compiledLookupCheck| '|setelt!|
                                                            (LIST
                                                             (|devaluate| MM)
                                                             '$
                                                             (LIST '|Integer|)
                                                             (LIST '|Integer|)
                                                             (|devaluate| MM))
                                                            AM))))
                         (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL
                                (SPADCALL B |i| |i|
                                          (|compiledLookupCheck| '|elt|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   MM)
                                                                  '$
                                                                  (LIST
                                                                   '|Integer|)
                                                                  (LIST
                                                                   '|Integer|))
                                                                 AM))
                                |alg|
                                (|compiledLookupCheck| '- (LIST '$ '$ '$) MM))
                               (|compiledLookupCheck| '|setelt!|
                                                      (LIST (|devaluate| MM) '$
                                                            (LIST '|Integer|)
                                                            (LIST '|Integer|)
                                                            (|devaluate| MM))
                                                      AM))))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |sol| NIL . #7#)
              (SEQ (LETT |vec| NIL . #7#)
                   (LETT #2#
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
                                                              (|devaluate|
                                                               MM)))
                                                  '$)
                                                 AM))
                         . #7#)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |vec| (CAR #2#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |w| (SPADCALL |n| 1 (QREFELT $ 39)) . #7#)
                        (SEQ (LETT |i| 1 . #7#) (LETT #1# |n| . #7#) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |w| |i| 1
                                         (|EP;tff|
                                          (SPADCALL
                                           (SPADCALL |vec| |i|
                                                     (|compiledLookupCheck|
                                                      '|elt|
                                                      (LIST (|devaluate| MM) '$
                                                            (LIST '|Integer|))
                                                      (|Vector| MM)))
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
                                         (QREFELT $ 42))))
                             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (LETT |sol| (CONS |w| |sol|) . #7#)))
                   (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |sol|)))) 

(SDEFUN |EP;generalizedEigenvector;UM2NniL;14|
        ((|alpha| |Union| (|Fraction| (|Polynomial| R))
          (|SuchThat| (|Symbol|) (|Polynomial| R)))
         (A |Matrix| (|Fraction| (|Polynomial| R))) (|k| |NonNegativeInteger|)
         (|g| |NonNegativeInteger|)
         ($ |List| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (SPROG ((#1=#:G207 NIL) (#2=#:G206 NIL))
               (COND
                ((QEQCAR |alpha| 0)
                 (|EP;intRatEig| (QCDR |alpha|) A
                  (PROG1
                      (LETT #2# (- (+ 1 |k|) |g|)
                            . #3=(|EP;generalizedEigenvector;UM2NniL;14|))
                    (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #2#))
                  $))
                ('T
                 (|EP;intAlgEig| (QCDR |alpha|) A
                  (PROG1 (LETT #1# (- (+ 1 |k|) |g|) . #3#)
                    (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #1#))
                  $))))) 

(SDEFUN |EP;generalizedEigenvector;RML;15|
        ((|eigen| |Record|
          (|:| |eigval|
               (|Union| (|Fraction| (|Polynomial| R))
                        (|SuchThat| (|Symbol|) (|Polynomial| R))))
          (|:| |eigmult| (|NonNegativeInteger|))
          (|:| |eigvec| (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))
         (A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Matrix| (|Fraction| (|Polynomial| R)))))
        (SPADCALL (QVELT |eigen| 0) A (QVELT |eigen| 1)
                  (LENGTH (QVELT |eigen| 2)) (QREFELT $ 37))) 

(SDEFUN |EP;generalizedEigenvectors;ML;16|
        ((A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |List|
          (|Record|
           (|:| |eigval|
                (|Union| (|Fraction| (|Polynomial| R))
                         (|SuchThat| (|Symbol|) (|Polynomial| R))))
           (|:| |geneigvec|
                (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))))
        (SPROG
         ((#1=#:G222 NIL) (|leg| NIL) (#2=#:G221 NIL)
          (|leig|
           (|List|
            (|Record|
             (|:| |eigval|
                  (|Union| (|Fraction| (|Polynomial| R))
                           (|SuchThat| (|Symbol|) (|Polynomial| R))))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #3=(|EP;generalizedEigenvectors;ML;16|))
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
                       (LETT #2# (CONS (|EP;genEigForm| |leg| A $) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |EP;eigenvectors;ML;17|
        ((A |Matrix| (|Fraction| (|Polynomial| R)))
         ($ |List|
          (|Record|
           (|:| |eigval|
                (|Union| (|Fraction| (|Polynomial| R))
                         (|SuchThat| (|Symbol|) (|Polynomial| R))))
           (|:| |eigmult| (|NonNegativeInteger|))
           (|:| |eigvec| (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))))
        (SPROG
         ((|algSol|
           #1=(|List|
               (|Record|
                (|:| |eigval|
                     (|Union| (|Fraction| (|Polynomial| R))
                              (|SuchThat| (|Symbol|) (|Polynomial| R))))
                (|:| |eigmult| (|NonNegativeInteger|))
                (|:| |eigvec|
                     (|List| (|Matrix| (|Fraction| (|Polynomial| R))))))))
          (#2=#:G230 NIL) (|alpha| (|SuchThat| (|Symbol|) (|Polynomial| R)))
          (|ratSol| #1#) (#3=#:G228 NIL) (|vec| (|Fraction| (|Polynomial| R)))
          (|pol| #4=(|Polynomial| R)) (#5=#:G236 NIL) (|fact| NIL)
          (|lff|
           (|List| (|Record| (|:| |factor| #4#) (|:| |exponent| (|Integer|)))))
          (|p| (|Polynomial| R)) (|x| (|Symbol|)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #6=(|EP;eigenvectors;ML;17|))
              (LETT |x| (SPADCALL (QREFELT $ 45)) . #6#)
              (LETT |p| (SPADCALL (|EP;charpol| A |x| $) (QREFELT $ 46)) . #6#)
              (LETT |ratSol| NIL . #6#) (LETT |algSol| NIL . #6#)
              (LETT |lff|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 86)) (QREFELT $ 89))
                    . #6#)
              (SEQ (LETT |fact| NIL . #6#) (LETT #5# |lff| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |fact| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pol| (QCAR |fact|) . #6#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |pol| |x| (QREFELT $ 54)) 1)
                           (SEQ
                            (LETT |vec|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |pol| |x| 0 (QREFELT $ 90))
                                    (SPADCALL |pol| |x|
                                              (SPADCALL |pol| |x|
                                                        (QREFELT $ 54))
                                              (QREFELT $ 90))
                                    (QREFELT $ 91))
                                   (QREFELT $ 92))
                                  . #6#)
                            (EXIT
                             (LETT |ratSol|
                                   (CONS
                                    (VECTOR (CONS 0 |vec|)
                                            (PROG1
                                                (LETT #3# (QCDR |fact|) . #6#)
                                              (|check_subtype2| (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                            (|EP;intRatEig| |vec| A 1 $))
                                    |ratSol|)
                                   . #6#))))
                          ('T
                           (SEQ
                            (LETT |alpha| (SPADCALL |x| |pol| (QREFELT $ 57))
                                  . #6#)
                            (EXIT
                             (LETT |algSol|
                                   (CONS
                                    (VECTOR (CONS 1 |alpha|)
                                            (PROG1
                                                (LETT #2# (QCDR |fact|) . #6#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (|EP;intAlgEig| |alpha| A 1 $))
                                    |algSol|)
                                   . #6#)))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (APPEND |ratSol| |algSol|))))) 

(DECLAIM (NOTINLINE |EigenPackage;|)) 

(DEFUN |EigenPackage| (#1=#:G237)
  (SPROG NIL
         (PROG (#2=#:G238)
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
                 ((NOT #2#) (HREM |$ConstructorCache| '|EigenPackage|)))))))))) 

(DEFUN |EigenPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|EigenPackage|))
          (LETT |dv$| (LIST '|EigenPackage| DV$1) . #1#)
          (LETT $ (GETREFV 93) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|EigenPackage| (LIST DV$1)
                      (CONS 1 $))
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
                    (|UnivariatePolynomialCategoryFunctions2|
                     (|Polynomial| |#1|)
                     (|SparseUnivariatePolynomial| (|Polynomial| |#1|))
                     (|Fraction| (|Polynomial| |#1|))
                     (|SparseUnivariatePolynomial|
                      (|Fraction| (|Polynomial| |#1|)))))
          $))) 

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
              (77 . +) (83 . |reductum|) (|List| 36) (|Union| 26 56)
              (|Matrix| 26) |EP;generalizedEigenvector;UM2NniL;14| (88 . ~=)
              (94 . |zero|) (|Integer|) (100 . |elt|) (107 . |setelt!|)
              (115 . -) (121 . |determinant|) (126 . |new|) (130 . |numer|)
              |EP;characteristicPolynomial;MP;8|
              |EP;characteristicPolynomial;MSP;9| (|List| 52)
              (|SystemSolvePackage| 6) (135 . |solve|) (|Equation| 26)
              (141 . |lhs|) (146 . |degree|) (152 . |rhs|) (|SuchThat| 24 22)
              (157 . |construct|) (|List| 35) |EP;eigenvalues;ML;10|
              |EP;eigenvector;UML;11| (163 . ^) (|List| 64) (169 . |nullSpace|)
              (|Vector| 26) (174 . |coerce|) (179 . |lhs|) (184 . |rhs|)
              (|SparseUnivariatePolynomial| $) (189 . |univariate|)
              (|Mapping| 26 22) (|SparseUnivariatePolynomial| 22) (195 . |map|)
              (201 . |unitCanonical|) (206 . |One|) (210 . |monomial|)
              (216 . |coerce|) (221 . |One|)
              (|Record| (|:| |eigval| 35) (|:| |eigmult| 18) (|:| |eigvec| 34))
              |EP;generalizedEigenvector;RML;15| (|List| 78)
              |EP;eigenvectors;ML;17|
              (|Record| (|:| |eigval| 35) (|:| |geneigvec| 34)) (|List| 82)
              |EP;generalizedEigenvectors;ML;16| (|Factored| 22)
              (225 . |factor|) (|Record| (|:| |factor| 22) (|:| |exponent| 40))
              (|List| 87) (230 . |factors|) (235 . |coefficient|) (242 . /)
              (248 . -))
           '#(|generalizedEigenvectors| 253 |generalizedEigenvector| 258
              |eigenvectors| 272 |eigenvector| 277 |eigenvalues| 283
              |characteristicPolynomial| 288)
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
                                                   9 0 0 33 2 18 11 0 0 38 2 36
                                                   0 18 18 39 3 36 26 0 40 40
                                                   41 4 36 26 0 40 40 26 42 2
                                                   26 0 0 0 43 1 36 26 0 44 0
                                                   24 0 45 1 26 22 0 46 2 50 49
                                                   26 24 51 1 52 26 0 53 2 22
                                                   18 0 24 54 1 52 26 0 55 2 56
                                                   0 24 22 57 2 36 0 0 18 61 1
                                                   36 62 0 63 1 36 0 64 65 1 56
                                                   24 0 66 1 56 22 0 67 2 22 68
                                                   0 24 69 2 8 9 70 71 72 1 9 0
                                                   0 73 0 26 0 74 2 9 0 26 18
                                                   75 1 9 0 26 76 0 71 0 77 1 7
                                                   85 22 86 1 85 88 0 89 3 22 0
                                                   0 24 18 90 2 26 0 22 22 91 1
                                                   26 0 0 92 1 0 83 36 84 2 0
                                                   34 78 36 79 4 0 34 35 36 18
                                                   18 37 1 0 80 36 81 2 0 34 35
                                                   36 60 1 0 58 36 59 1 0 22 36
                                                   47 2 0 22 36 24 48)))))
           '|lookupComplete|)) 
