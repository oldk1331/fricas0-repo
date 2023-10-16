
(SDEFUN |INEP;numeric| ((|r| K) ($ F))
        (COND
         ((|domainEqual| (QREFELT $ 6) (|Fraction| (|Integer|)))
          (COND
           ((|domainEqual| (QREFELT $ 7) (|Float|))
            (SPADCALL |r| (QREFELT $ 11)))
           ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|))) |r|)
           ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
            (SPADCALL |r| (QREFELT $ 13)))
           ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
            (SPADCALL |r| (QREFELT $ 15)))))
         ((|domainEqual| (QREFELT $ 6) (|Complex| (|Fraction| (|Integer|))))
          (COND
           ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
            |r|)
           ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
            (SPADCALL (SPADCALL |r| (QREFELT $ 16)) (QREFELT $ 17)))))
         ('T (|error| "unsupported coefficient type")))) 

(SDEFUN |INEP;monicize|
        ((|f| |SparseUnivariatePolynomial| K)
         ($ |SparseUnivariatePolynomial| K))
        (SPROG ((|a| (K)))
               (SEQ (LETT |a| (SPADCALL |f| (QREFELT $ 19)) |INEP;monicize|)
                    (EXIT
                     (COND
                      ((SPADCALL |a| (|spadConstant| $ 20) (QREFELT $ 23)) |f|)
                      ('T
                       (SPADCALL (SPADCALL |a| (QREFELT $ 24)) |f|
                                 (QREFELT $ 25)))))))) 

(SDEFUN |INEP;reduction|
        ((|u| |SparseUnivariatePolynomial| K)
         (|p| |SparseUnivariatePolynomial| K)
         ($ |SparseUnivariatePolynomial| K))
        (SPADCALL |u| |p| (QREFELT $ 26))) 

(SDEFUN |INEP;merge|
        ((|p| |SparseUnivariatePolynomial| K)
         (|q| |SparseUnivariatePolynomial| K)
         ($ |Union| (|SparseUnivariatePolynomial| K) "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 27)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 30) (QREFELT $ 27))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 30) (QREFELT $ 27))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |INEP;exactquo|
        ((|u| |SparseUnivariatePolynomial| K)
         (|v| |SparseUnivariatePolynomial| K)
         (|p| |SparseUnivariatePolynomial| K)
         ($ |Union| (|SparseUnivariatePolynomial| K) "failed"))
        (SPROG
         ((|val|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| K))
                      (|:| |coef2| (|SparseUnivariatePolynomial| K)))
            "failed")))
         (SEQ
          (LETT |val| (SPADCALL |v| |p| |u| (QREFELT $ 33)) |INEP;exactquo|)
          (EXIT
           (COND ((QEQCAR |val| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (QCAR (QCDR |val|))))))))) 

(SDEFUN |INEP;evalvect|
        ((|vect| |Matrix| (|SparseUnivariatePolynomial| K)) (|alg| F)
         ($ |Matrix| F))
        (SPROG
         ((|v| (F)) (|polf| (|SparseUnivariatePolynomial| F)) (#1=#:G125 NIL)
          (|i| NIL) (|w| (|Matrix| F)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |vect|) . #2=(|INEP;evalvect|))
              (LETT |w| (SPADCALL |n| 1 (QREFELT $ 36)) . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |polf|
                          (SPADCALL (CONS (|function| |INEP;numeric|) $)
                                    (SPADCALL |vect| |i| 1 (QREFELT $ 39))
                                    (QREFELT $ 43))
                          . #2#)
                    (LETT |v| (SPADCALL |polf| |alg| (QREFELT $ 44)) . #2#)
                    (EXIT (SPADCALL |w| |i| 1 |v| (QREFELT $ 45))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |INEP;inteigen|
        ((A |Matrix| K) (|p| |SparseUnivariatePolynomial| K)
         (|fact| |Mapping| (|Factored| (|SparseUnivariatePolynomial| K))
          (|SparseUnivariatePolynomial| K))
         ($ |List|
          (|Union|
           (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                     (|:| |outvect| (|List| (|Matrix| F))))
           (|Record| (|:| |algpol| (|SparseUnivariatePolynomial| K))
                     (|:| |almult| (|Integer|))
                     (|:| |poleigen|
                          (|List|
                           (|Matrix| (|SparseUnivariatePolynomial| K))))))))
        (SPROG
         ((|res|
           (|List|
            (|Union|
             (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                       (|:| |outvect| (|List| (|Matrix| F))))
             (|Record| (|:| |algpol| (|SparseUnivariatePolynomial| K))
                       (|:| |almult| (|Integer|))
                       (|:| |poleigen|
                            (|List|
                             (|Matrix| (|SparseUnivariatePolynomial| K))))))))
          (|soln| (|List| (|Matrix| (|SparseUnivariatePolynomial| K))))
          (#1=#:G172 NIL) (|i| NIL)
          (|wk| (|Matrix| (|SparseUnivariatePolynomial| K))) (#2=#:G171 NIL)
          (|vec| NIL) (|sln2| (|List| (|Vector| MM))) (#3=#:G170 NIL) (|j| NIL)
          (#4=#:G169 NIL) (B (AM)) (|alg| (MM))
          (|ppol| (|SparseUnivariatePolynomial| K))
          (|lr| (|List| (|Matrix| F))) (#5=#:G168 NIL) (|wf| (|Matrix| F))
          (#6=#:G167 NIL) (|vecr| NIL) (#7=#:G166 NIL) (#8=#:G165 NIL)
          (B1 (|Matrix| K)) (|alpha| (K))
          (|pol| #9=(|SparseUnivariatePolynomial| K)) (#10=#:G164 NIL)
          (|ff| NIL)
          (|lff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #9#)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (AM
           (|Join| (|MatrixCategory| MM (|Vector| MM) (|Vector| MM))
                   (CATEGORY |domain|
                    (SIGNATURE |diagonalMatrix| ($ (|Vector| MM)))
                    (IF (|has| MM (|ConvertibleTo| (|InputForm|)))
                        (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                        |noBranch|)
                    (IF (|has| MM (|IntegralDomain|))
                        (SIGNATURE |invertIfCan| ((|Union| $ "failed") $))
                        |noBranch|))))
          (MM
           (|Join| (|Field|)
                   (CATEGORY |domain|
                    (SIGNATURE |modulus|
                     (#11=(|SparseUnivariatePolynomial| K) $))
                    (SIGNATURE |coerce|
                     (#12=(|SparseUnivariatePolynomial| K) $))
                    (SIGNATURE |reduce| ($ #12# #11#))
                    (SIGNATURE |exQuo| ((|Union| $ "failed") $ $)))))
          (|dimA| (|NonNegativeInteger|)))
         (SEQ (LETT |dimA| (ANROWS A) . #13=(|INEP;inteigen|))
              (LETT MM
                    (|ModularField|
                     (|SparseUnivariatePolynomial| (QREFELT $ 6))
                     (|SparseUnivariatePolynomial| (QREFELT $ 6))
                     (CONS (|function| |INEP;reduction|) $)
                     (CONS (|function| |INEP;merge|) $)
                     (CONS (|function| |INEP;exactquo|) $))
                    . #13#)
              (LETT AM (|Matrix| MM) . #13#)
              (LETT |lff| (SPADCALL (SPADCALL |p| |fact|) (QREFELT $ 50))
                    . #13#)
              (LETT |res| NIL . #13#) (LETT |lr| NIL . #13#)
              (SEQ (LETT |ff| NIL . #13#) (LETT #10# |lff| . #13#) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |ff| (CAR #10#) . #13#) NIL))
                     (GO G191)))
                   (SEQ (LETT |pol| (QVELT |ff| 1) . #13#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |pol| (QREFELT $ 51)) 1)
                           (SEQ
                            (LETT |alpha|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |pol| 0 (QREFELT $ 52))
                                             (SPADCALL |pol| (QREFELT $ 19))
                                             (QREFELT $ 53))
                                   (QREFELT $ 54))
                                  . #13#)
                            (LETT B1 (SPADCALL |dimA| |dimA| (QREFELT $ 56))
                                  . #13#)
                            (SEQ (LETT |i| 1 . #13#) (LETT #8# |dimA| . #13#)
                                 G190 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (SEQ (LETT |j| 1 . #13#)
                                       (LETT #7# |dimA| . #13#) G190
                                       (COND
                                        ((|greater_SI| |j| #7#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL B1 |i| |j|
                                                   (SPADCALL A |i| |j|
                                                             (QREFELT $ 57))
                                                   (QREFELT $ 58))))
                                       (LETT |j| (|inc_SI| |j|) . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL B1 |i| |i|
                                             (SPADCALL
                                              (SPADCALL B1 |i| |i|
                                                        (QREFELT $ 57))
                                              |alpha| (QREFELT $ 59))
                                             (QREFELT $ 58))))
                                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                 G191 (EXIT NIL))
                            (LETT |lr| NIL . #13#)
                            (SEQ (LETT |vecr| NIL . #13#)
                                 (LETT #6# (SPADCALL B1 (QREFELT $ 61)) . #13#)
                                 G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN
                                        (LETT |vecr| (CAR #6#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |wf| (SPADCALL |dimA| 1 (QREFELT $ 36))
                                        . #13#)
                                  (SEQ (LETT |i| 1 . #13#)
                                       (LETT #5# |dimA| . #13#) G190
                                       (COND
                                        ((|greater_SI| |i| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |wf| |i| 1
                                                   (|INEP;numeric|
                                                    (SPADCALL |vecr| |i|
                                                              (QREFELT $ 63))
                                                    $)
                                                   (QREFELT $ 45))))
                                       (LETT |i| (|inc_SI| |i|) . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (LETT |lr| (CONS |wf| |lr|) . #13#)))
                                 (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |res|
                                   (CONS
                                    (CONS 0
                                          (VECTOR (|INEP;numeric| |alpha| $)
                                                  (QVELT |ff| 2) |lr|))
                                    |res|)
                                   . #13#))))
                          ('T
                           (SEQ (LETT |ppol| (|INEP;monicize| |pol| $) . #13#)
                                (LETT |alg|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 20) 1
                                                 (QREFELT $ 64))
                                       |ppol|
                                       (|compiledLookupCheck| '|reduce|
                                                              (LIST '$
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           6)))
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      (ELT $
                                                                           6))))
                                                              MM))
                                      . #13#)
                                (LETT B
                                      (SPADCALL |dimA| |dimA|
                                                (|compiledLookupCheck| '|zero|
                                                                       (LIST '$
                                                                             (LIST
                                                                              '|NonNegativeInteger|)
                                                                             (LIST
                                                                              '|NonNegativeInteger|))
                                                                       AM))
                                      . #13#)
                                (SEQ (LETT |i| 1 . #13#)
                                     (LETT #4# |dimA| . #13#) G190
                                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                                     (SEQ
                                      (SEQ (LETT |j| 1 . #13#)
                                           (LETT #3# |dimA| . #13#) G190
                                           (COND
                                            ((|greater_SI| |j| #3#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL B |i| |j|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL A |i| |j|
                                                                   (QREFELT $
                                                                            57))
                                                         (QREFELT $ 65))
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
                                                        '|setelt!|
                                                        (LIST (|devaluate| MM)
                                                              '$
                                                              (LIST '|Integer|)
                                                              (LIST '|Integer|)
                                                              (|devaluate| MM))
                                                        AM))))
                                           (LETT |j| (|inc_SI| |j|) . #13#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL B |i| |i|
                                                 (SPADCALL
                                                  (SPADCALL B |i| |i|
                                                            (|compiledLookupCheck|
                                                             '|elt|
                                                             (LIST
                                                              (|devaluate| MM)
                                                              '$
                                                              (LIST '|Integer|)
                                                              (LIST
                                                               '|Integer|))
                                                             AM))
                                                  |alg|
                                                  (|compiledLookupCheck| '-
                                                                         (LIST
                                                                          '$ '$
                                                                          '$)
                                                                         MM))
                                                 (|compiledLookupCheck|
                                                  '|setelt!|
                                                  (LIST (|devaluate| MM) '$
                                                        (LIST '|Integer|)
                                                        (LIST '|Integer|)
                                                        (|devaluate| MM))
                                                  AM))))
                                     (LETT |i| (|inc_SI| |i|) . #13#) (GO G190)
                                     G191 (EXIT NIL))
                                (LETT |sln2|
                                      (SPADCALL B
                                                (|compiledLookupCheck|
                                                 '|nullSpace|
                                                 (LIST
                                                  (LIST '|List|
                                                        (LIST '|Vector|
                                                              (|devaluate|
                                                               MM)))
                                                  '$)
                                                 AM))
                                      . #13#)
                                (LETT |soln| NIL . #13#)
                                (SEQ (LETT |vec| NIL . #13#)
                                     (LETT #2# |sln2| . #13#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |vec| (CAR #2#) . #13#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |wk|
                                            (SPADCALL |dimA| 1 (QREFELT $ 66))
                                            . #13#)
                                      (SEQ (LETT |i| 1 . #13#)
                                           (LETT #1# |dimA| . #13#) G190
                                           (COND
                                            ((|greater_SI| |i| #1#) (GO G191)))
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
                                                                   (|Vector|
                                                                    MM)))
                                                        (|compiledLookupCheck|
                                                         '|coerce|
                                                         (LIST
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate|
                                                            (ELT $ 6)))
                                                          '$)
                                                         MM))
                                                       (QREFELT $ 67))))
                                           (LETT |i| (|inc_SI| |i|) . #13#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (LETT |soln| (CONS |wk| |soln|)
                                             . #13#)))
                                     (LETT #2# (CDR #2#) . #13#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (LETT |res|
                                       (CONS
                                        (CONS 1
                                              (VECTOR (QVELT |ff| 1)
                                                      (QVELT |ff| 2) |soln|))
                                        |res|)
                                       . #13#)))))))
                   (LETT #10# (CDR #10#) . #13#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INEP;solve1;SupParL;8|
        ((|up| |SparseUnivariatePolynomial| K) (|eps| |Par|) ($ |List| F))
        (SPROG
         ((|upi| (|SparseUnivariatePolynomial| (|Integer|)))
          (|denom| #1=(|Integer|)) (#2=#:G174 NIL) (#3=#:G173 #1#)
          (#4=#:G175 #1#) (#5=#:G179 NIL) (|c| NIL))
         (SEQ
          (LETT |denom|
                (PROGN
                 (LETT #2# NIL . #6=(|INEP;solve1;SupParL;8|))
                 (SEQ (LETT |c| NIL . #6#)
                      (LETT #5# (SPADCALL |up| (QREFELT $ 69)) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL |c| (QREFELT $ 70)) . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 71)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T 1)))
                . #6#)
          (LETT |up| (SPADCALL |denom| |up| (QREFELT $ 72)) . #6#)
          (LETT |upi| (SPADCALL (ELT $ 73) |up| (QREFELT $ 78)) . #6#)
          (EXIT (SPADCALL |upi| |eps| (QREFELT $ 81)))))) 

(SDEFUN |INEP;solve1;SupParL;9|
        ((|up| |SparseUnivariatePolynomial| K) (|eps| |Par|) ($ |List| F))
        (SPROG
         ((|upgi| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (|denom| #1=(|Integer|)) (#2=#:G181 NIL) (#3=#:G180 #1#)
          (#4=#:G182 #1#) (#5=#:G186 NIL) (|c| NIL))
         (SEQ
          (LETT |denom|
                (PROGN
                 (LETT #2# NIL . #6=(|INEP;solve1;SupParL;9|))
                 (SEQ (LETT |c| NIL . #6#)
                      (LETT #5# (SPADCALL |up| (QREFELT $ 69)) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL
                                (SPADCALL (SPADCALL |c| (QREFELT $ 83))
                                          (QREFELT $ 70))
                                (SPADCALL (SPADCALL |c| (QREFELT $ 84))
                                          (QREFELT $ 70))
                                (QREFELT $ 71))
                               . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 71)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T 1)))
                . #6#)
          (LETT |up| (SPADCALL |denom| |up| (QREFELT $ 72)) . #6#)
          (LETT |upgi|
                (SPADCALL (CONS #'|INEP;solve1;SupParL;9!0| $) |up|
                          (QREFELT $ 91))
                . #6#)
          (EXIT (SPADCALL |upgi| |eps| (QREFELT $ 93)))))) 

(SDEFUN |INEP;solve1;SupParL;9!0| ((|c1| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |c1| (QREFELT $ 83)) (QREFELT $ 73))
                  (SPADCALL (SPADCALL |c1| (QREFELT $ 84)) (QREFELT $ 73))
                  (QREFELT $ 86))) 

(SDEFUN |INEP;innerEigenvectors;MParML;10|
        ((A |Matrix| K) (|eps| |Par|)
         (|fact| |Mapping| (|Factored| (|SparseUnivariatePolynomial| K))
          (|SparseUnivariatePolynomial| K))
         ($ |List|
          (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                    (|:| |outvect| (|List| (|Matrix| F))))))
        (SPROG
         ((|sln|
           (|List|
            (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                      (|:| |outvect| (|List| (|Matrix| F))))))
          (|nsl|
           (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                     (|:| |outvect| (|List| (|Matrix| F)))))
          (#1=#:G201 NIL) (|ep| NIL) (#2=#:G200 NIL) (#3=#:G199 NIL)
          (|alg| NIL) (|lmult| (|Integer|))
          (|lvect| (|List| (|Matrix| (|SparseUnivariatePolynomial| K))))
          (|lval| (|List| F))
          (|leva|
           (|Record| (|:| |algpol| (|SparseUnivariatePolynomial| K))
                     (|:| |almult| (|Integer|))
                     (|:| |poleigen|
                          (|List|
                           (|Matrix| (|SparseUnivariatePolynomial| K))))))
          (#4=#:G198 NIL) (|lev| NIL) (|n| (|NonNegativeInteger|))
          (|sln1|
           (|List|
            (|Union|
             (|Record| (|:| |outval| F) (|:| |outmult| (|Integer|))
                       (|:| |outvect| (|List| (|Matrix| F))))
             (|Record| (|:| |algpol| (|SparseUnivariatePolynomial| K))
                       (|:| |almult| (|Integer|))
                       (|:| |poleigen|
                            (|List|
                             (|Matrix| (|SparseUnivariatePolynomial| K))))))))
          (|pol| (|SparseUnivariatePolynomial| K)))
         (SEQ
          (LETT |pol| (SPADCALL A (QREFELT $ 94))
                . #5=(|INEP;innerEigenvectors;MParML;10|))
          (LETT |sln1| (|INEP;inteigen| A |pol| |fact| $) . #5#)
          (LETT |n| (ANROWS A) . #5#) (LETT |sln| NIL . #5#)
          (SEQ (LETT |lev| NIL . #5#) (LETT #4# |sln1| . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |lev| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((QEQCAR |lev| 0)
                   (LETT |sln| (CONS (QCDR |lev|) |sln|) . #5#))
                  ('T
                   (SEQ (LETT |leva| (QCDR |lev|) . #5#)
                        (LETT |lval|
                              (SPADCALL (QVELT |leva| 0) |eps| (QREFELT $ 82))
                              . #5#)
                        (LETT |lvect| (QVELT |leva| 2) . #5#)
                        (LETT |lmult| (QVELT |leva| 1) . #5#)
                        (EXIT
                         (SEQ (LETT |alg| NIL . #5#) (LETT #3# |lval| . #5#)
                              G190
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
                                                   (LETT #1# |lvect| . #5#)
                                                   G190
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
                                                            (|INEP;evalvect|
                                                             |ep| |alg| $)
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
          (EXIT |sln|)))) 

(SDEFUN |INEP;charpol;MSup;11|
        ((A |Matrix| K) ($ |SparseUnivariatePolynomial| K))
        (SPROG
         ((#1=#:G209 NIL) (|j| NIL) (#2=#:G208 NIL) (|i| NIL)
          (B (|Matrix| (|SparseUnivariatePolynomial| K)))
          (|dimA| (|NonNegativeInteger|)))
         (SEQ (LETT |dimA| (ANROWS A) . #3=(|INEP;charpol;MSup;11|))
              (EXIT
               (COND
                ((SPADCALL |dimA| (ANCOLS A) (QREFELT $ 99))
                 (|error| " The matrix is not square"))
                ('T
                 (SEQ (LETT B (SPADCALL |dimA| |dimA| (QREFELT $ 66)) . #3#)
                      (SEQ (LETT |i| 1 . #3#) (LETT #2# |dimA| . #3#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (SEQ (LETT |j| 1 . #3#) (LETT #1# |dimA| . #3#)
                                 G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL B |i| |j|
                                             (SPADCALL
                                              (SPADCALL A |i| |j|
                                                        (QREFELT $ 57))
                                              (QREFELT $ 65))
                                             (QREFELT $ 67))))
                                 (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (SPADCALL B |i| |i|
                                       (SPADCALL
                                        (SPADCALL B |i| |i| (QREFELT $ 39))
                                        (SPADCALL (|spadConstant| $ 20) 1
                                                  (QREFELT $ 64))
                                        (QREFELT $ 100))
                                       (QREFELT $ 67))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (SPADCALL B (QREFELT $ 101)))))))))) 

(DECLAIM (NOTINLINE |InnerNumericEigenPackage;|)) 

(DEFUN |InnerNumericEigenPackage| (&REST #1=#:G210)
  (SPROG NIL
         (PROG (#2=#:G211)
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
                  (HREM |$ConstructorCache|
                        '|InnerNumericEigenPackage|)))))))))) 

(DEFUN |InnerNumericEigenPackage;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
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
            (QSETREFV $ 82
                      (CONS (|dispatchFunction| |INEP;solve1;SupParL;8|) $)))
           ((|domainEqual| |#1| (|Complex| (|Fraction| (|Integer|))))
            (QSETREFV $ 82
                      (CONS (|dispatchFunction| |INEP;solve1;SupParL;9|) $)))
           ('T (|error| "unsupported matrix type")))
          $))) 

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
              (105 . |elt|) (111 . |setelt!|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 46) (|:| |factor| 18) (|:| |exponent| 34))
              (|List| 47) (|Factored| 18) (119 . |factorList|) (124 . |degree|)
              (129 . |coefficient|) (135 . /) (141 . -) (|Matrix| 6)
              (146 . |zero|) (152 . |elt|) (159 . |setelt!|) (167 . -)
              (|List| 62) (173 . |nullSpace|) (|Vector| 6) (178 . |elt|)
              (184 . |monomial|) (190 . |coerce|) (195 . |zero|)
              (201 . |setelt!|) (|List| 6) (209 . |coefficients|)
              (214 . |denom|) (219 . |lcm|) (225 . *) (231 . |numer|)
              (|SparseUnivariatePolynomial| 37) (|Mapping| 37 10)
              (|SparseUnivariatePolynomial| 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 76 37 74)
              (236 . |map|) (|List| 7) (|InnerNumericFloatSolvePackage| 37 7 8)
              (242 . |innerSolve1|) (248 . |solve1|) (254 . |real|)
              (259 . |imag|) (|Complex| 37) (264 . |complex|)
              (|SparseUnivariatePolynomial| 85) (|Mapping| 85 14)
              (|SparseUnivariatePolynomial| 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 89 85 87)
              (270 . |map|) (|InnerNumericFloatSolvePackage| 85 7 8)
              (276 . |innerSolve1|) |INEP;charpol;MSup;11|
              (|Record| (|:| |outval| 7) (|:| |outmult| 37)
                        (|:| |outvect| (|List| 35)))
              (|List| 95) (|Mapping| 49 18) |INEP;innerEigenvectors;MParML;10|
              (282 . ~=) (288 . -) (294 . |determinant|))
           '#(|solve1| 299 |innerEigenvectors| 305 |charpol| 312) 'NIL
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
                                                   37 7 45 1 49 48 0 50 1 18 34
                                                   0 51 2 18 6 0 34 52 2 6 0 0
                                                   0 53 1 6 0 0 54 2 55 0 34 34
                                                   56 3 55 6 0 37 37 57 4 55 6
                                                   0 37 37 6 58 2 6 0 0 0 59 1
                                                   55 60 0 61 2 62 6 0 37 63 2
                                                   18 0 6 34 64 1 18 0 6 65 2
                                                   38 0 34 34 66 4 38 18 0 37
                                                   37 18 67 1 18 68 0 69 1 10
                                                   37 0 70 2 37 0 0 0 71 2 18 0
                                                   37 0 72 1 10 37 0 73 2 77 74
                                                   75 76 78 2 80 79 74 8 81 2 0
                                                   79 18 8 82 1 14 10 0 83 1 14
                                                   10 0 84 2 85 0 37 37 86 2 90
                                                   87 88 89 91 2 92 79 87 8 93
                                                   2 34 22 0 0 99 2 18 0 0 0
                                                   100 1 38 18 0 101 2 0 79 18
                                                   8 82 3 0 96 55 8 97 98 1 0
                                                   18 55 94)))))
           '|lookupComplete|)) 
