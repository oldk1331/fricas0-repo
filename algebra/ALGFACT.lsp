
(SDEFUN |ALGFACT;allk|
        ((|l| |List| (|AlgebraicNumber|))
         ($ |List| (|Kernel| (|AlgebraicNumber|))))
        (SPROG ((#1=#:G113 NIL) (|x| NIL) (#2=#:G112 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|ALGFACT;allk|))
                   (SEQ (LETT |x| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 9)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 12))
                 (QREFELT $ 13))))) 

(SDEFUN |ALGFACT;liftpoly|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|))) ($ UP))
        (SPADCALL (ELT $ 15) |p| (QREFELT $ 19))) 

(SDEFUN |ALGFACT;downpoly|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
        (SPADCALL (ELT $ 20) |p| (QREFELT $ 23))) 

(SDEFUN |ALGFACT;ifactor|
        ((|p| |SparseUnivariatePolynomial| (|AlgebraicNumber|))
         (|l| |List| (|Kernel| (|AlgebraicNumber|)))
         ($ |Factored| (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
        (|ALGFACT;fact| |p| |l| $)) 

(SDEFUN |ALGFACT;factor;UPF;5| ((|p| UP) ($ |Factored| UP))
        (|ALGFACT;fact| |p| (|ALGFACT;allk| (SPADCALL |p| (QREFELT $ 25)) $) $)) 

(SDEFUN |ALGFACT;factor;UPLF;6|
        ((|p| UP) (|l| |List| (|AlgebraicNumber|)) ($ |Factored| UP))
        (|ALGFACT;fact| |p|
         (|ALGFACT;allk|
          (SPADCALL (SPADCALL |l| (SPADCALL |p| (QREFELT $ 25)) (QREFELT $ 28))
                    (QREFELT $ 29))
          $)
         $)) 

(SDEFUN |ALGFACT;split;UPF;7| ((|p| UP) ($ |Factored| UP))
        (SPROG
         ((#1=#:G121 NIL) (#2=#:G120 #3=(|Factored| UP)) (#4=#:G122 #3#)
          (#5=#:G125 NIL) (|fc| NIL) (|fp| (|Factored| UP)))
         (SEQ
          (LETT |fp| (SPADCALL |p| (QREFELT $ 27))
                . #6=(|ALGFACT;split;UPF;7|))
          (EXIT
           (SPADCALL (SPADCALL |fp| (QREFELT $ 31))
                     (PROGN
                      (LETT #1# NIL . #6#)
                      (SEQ (LETT |fc| NIL . #6#)
                           (LETT #5# (SPADCALL |fp| (QREFELT $ 35)) . #6#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |fc| (CAR #5#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #4#
                                    (|ALGFACT;extend| (QVELT |fc| 1)
                                     (QVELT |fc| 2) $)
                                    . #6#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #4# (QREFELT $ 36))
                                      . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                           (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#1# #2#) ('T (|spadConstant| $ 37))))
                     (QREFELT $ 38)))))) 

(SDEFUN |ALGFACT;extend|
        ((|p| UP) (|n| |NonNegativeInteger|) ($ |Factored| UP))
        (SPROG ((#1=#:G127 NIL) (|q| (UP)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |p| (QREFELT $ 41)) 1)
                  (SPADCALL |p| |n| (QREFELT $ 42)))
                 ('T
                  (SEQ
                   (LETT |q|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 44) 1 (QREFELT $ 45))
                          (SPADCALL (SPADCALL |p| (QREFELT $ 47))
                                    (QREFELT $ 48))
                          (QREFELT $ 49))
                         . #2=(|ALGFACT;extend|))
                   (EXIT
                    (SPADCALL (SPADCALL |q| |n| (QREFELT $ 42))
                              (SPADCALL
                               (SPADCALL
                                (PROG2
                                    (LETT #1# (SPADCALL |p| |q| (QREFELT $ 51))
                                          . #2#)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                                  (|Union| (QREFELT $ 6)
                                                           "failed")
                                                  #1#))
                                (QREFELT $ 39))
                               |n| (QREFELT $ 52))
                              (QREFELT $ 36))))))))) 

(SDEFUN |ALGFACT;doublyTransitive?;UPB;9| ((|p| UP) ($ |Boolean|))
        (SPROG ((#1=#:G133 NIL))
               (COND
                ((|ALGFACT;irred?| |p| $)
                 (|ALGFACT;irred?|
                  (PROG2
                      (LETT #1#
                            (SPADCALL |p|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 44) 1
                                                 (QREFELT $ 45))
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 47))
                                                 (QREFELT $ 48))
                                       (QREFELT $ 49))
                                      (QREFELT $ 51))
                            |ALGFACT;doublyTransitive?;UPB;9|)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 6)
                                    (|Union| (QREFELT $ 6) "failed") #1#))
                  $))
                ('T NIL)))) 

(SDEFUN |ALGFACT;irred?| ((|p| UP) ($ |Boolean|))
        (SPROG
         ((|fp|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |fp| (SPADCALL (SPADCALL |p| (QREFELT $ 27)) (QREFELT $ 35))
                |ALGFACT;irred?|)
          (EXIT
           (COND
            ((SPADCALL |fp| 1 (QREFELT $ 55))
             (EQL (QVELT (|SPADfirst| |fp|) 2) 1))
            ('T NIL)))))) 

(SDEFUN |ALGFACT;fact|
        ((|p| UP) (|l| |List| #1=(|Kernel| (|AlgebraicNumber|)))
         ($ |Factored| UP))
        (SPROG
         ((#2=#:G156 NIL) (#3=#:G155 #4=(|Factored| UP)) (#5=#:G157 #4#)
          (#6=#:G165 NIL) (|fc| NIL) (|newalpha| (|AlgebraicNumber|))
          (|fr| (|Factored| |ups|))
          (|ups|
           (|Join| (|UnivariatePolynomialCategory| |sae|)
                   (CATEGORY |domain|
                    (SIGNATURE |outputForm|
                     ((|OutputForm|) $ (|OutputForm|))))))
          (|sae|
           (|Join|
            (|MonogenicAlgebra| #7=(|AlgebraicNumber|)
                                (|SparseUnivariatePolynomial|
                                 (|AlgebraicNumber|)))
            (CATEGORY |package|
             (IF (|has| #7# (|Field|))
                 (IF (|has| #7# (|PolynomialFactorizationExplicit|))
                     (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                     |noBranch|)
                 |noBranch|))))
          (|newl| (|List| (|Kernel| (|AlgebraicNumber|))))
          (|q| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
          (|alpha| #1#) (#8=#:G146 NIL) (#9=#:G145 #1#) (#10=#:G147 #1#)
          (#11=#:G164 NIL) (#12=#:G104 NIL) (#13=#:G142 NIL) (#14=#:G141 #4#)
          (#15=#:G143 #4#) (#16=#:G163 NIL) (|dc| NIL)
          (|dr|
           (|Factored|
            (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))))
         (SEQ
          (COND
           ((EQL (SPADCALL |p| (QREFELT $ 41)) 1)
            (SPADCALL |p| 1 (QREFELT $ 42)))
           ((NULL |l|)
            (SEQ
             (LETT |dr| (SPADCALL (|ALGFACT;downpoly| |p| $) (QREFELT $ 58))
                   . #17=(|ALGFACT;fact|))
             (EXIT
              (SPADCALL (|ALGFACT;liftpoly| (SPADCALL |dr| (QREFELT $ 59)) $)
                        (PROGN
                         (LETT #13# NIL . #17#)
                         (SEQ (LETT |dc| NIL . #17#)
                              (LETT #16# (SPADCALL |dr| (QREFELT $ 62)) . #17#)
                              G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |dc| (CAR #16#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #15#
                                       (SPADCALL
                                        (|ALGFACT;liftpoly| (QVELT |dc| 1) $)
                                        (QVELT |dc| 2) (QREFELT $ 42))
                                       . #17#)
                                 (COND
                                  (#13#
                                   (LETT #14#
                                         (SPADCALL #14# #15# (QREFELT $ 36))
                                         . #17#))
                                  ('T
                                   (PROGN
                                    (LETT #14# #15# . #17#)
                                    (LETT #13# 'T . #17#)))))))
                              (LETT #16# (CDR #16#) . #17#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#13# #14#) (#18='T (|spadConstant| $ 37))))
                        (QREFELT $ 38)))))
           (#18#
            (SEQ
             (LETT |q|
                   (SPADCALL
                    (LETT |alpha|
                          (PROGN
                           (LETT #8# NIL . #17#)
                           (SEQ (LETT #12# NIL . #17#) (LETT #11# |l| . #17#)
                                G190
                                (COND
                                 ((OR (ATOM #11#)
                                      (PROGN
                                       (LETT #12# (CAR #11#) . #17#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #10# #12# . #17#)
                                   (COND
                                    (#8#
                                     (LETT #9#
                                           (SPADCALL #9# #10# (QREFELT $ 64))
                                           . #17#))
                                    ('T
                                     (PROGN
                                      (LETT #9# #10# . #17#)
                                      (LETT #8# 'T . #17#)))))))
                                (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#8# #9#) (#18# (|IdentityError| '|max|))))
                          . #17#)
                    (QREFELT $ 66))
                   . #17#)
             (LETT |newl|
                   (SPADCALL (CONS #'|ALGFACT;fact!0| (VECTOR $ |alpha|)) |l|
                             (QREFELT $ 69))
                   . #17#)
             (LETT |sae|
                   (|SimpleAlgebraicExtension| (|AlgebraicNumber|)
                                               (|SparseUnivariatePolynomial|
                                                (|AlgebraicNumber|))
                                               |q|)
                   . #17#)
             (LETT |ups| (|SparseUnivariatePolynomial| |sae|) . #17#)
             (LETT |fr|
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|ALGFACT;fact!1| (VECTOR |sae| $ |q| |alpha|)) |p|
                     (|compiledLookupCheck| '|map|
                                            (LIST (|devaluate| |ups|)
                                                  (LIST '|Mapping|
                                                        (|devaluate| |sae|)
                                                        (LIST
                                                         '|AlgebraicNumber|))
                                                  (|devaluate| (ELT $ 6)))
                                            (|UnivariatePolynomialCategoryFunctions2|
                                             (|AlgebraicNumber|) (ELT $ 6)
                                             |sae| |ups|)))
                    (CONS #'|ALGFACT;fact!2| (VECTOR $ |newl|))
                    (|compiledLookupCheck| '|factor|
                                           (LIST
                                            (LIST '|Factored|
                                                  (|devaluate| |ups|))
                                            (|devaluate| |ups|)
                                            (LIST '|Mapping|
                                                  (LIST '|Factored|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (LIST
                                                          '|AlgebraicNumber|)))
                                                  (LIST
                                                   '|SparseUnivariatePolynomial|
                                                   (LIST '|AlgebraicNumber|))))
                                           (|InnerAlgFactor|
                                            (|AlgebraicNumber|)
                                            (|SparseUnivariatePolynomial|
                                             (|AlgebraicNumber|))
                                            |sae| |ups|)))
                   . #17#)
             (LETT |newalpha| (SPADCALL |alpha| (QREFELT $ 73)) . #17#)
             (EXIT
              (SPADCALL
               (SPADCALL (CONS #'|ALGFACT;fact!3| (VECTOR $ |newalpha| |sae|))
                         (SPADCALL |fr|
                                   (|compiledLookupCheck| '|unit|
                                                          (LIST
                                                           (|devaluate| |ups|)
                                                           '$)
                                                          (|Factored| |ups|)))
                         (|compiledLookupCheck| '|map|
                                                (LIST (|devaluate| (ELT $ 6))
                                                      (LIST '|Mapping|
                                                            (LIST
                                                             '|AlgebraicNumber|)
                                                            (|devaluate|
                                                             |sae|))
                                                      (|devaluate| |ups|))
                                                (|UnivariatePolynomialCategoryFunctions2|
                                                 |sae| |ups|
                                                 (|AlgebraicNumber|)
                                                 (ELT $ 6))))
               (PROGN
                (LETT #2# NIL . #17#)
                (SEQ (LETT |fc| NIL . #17#)
                     (LETT #6#
                           (SPADCALL |fr|
                                     (|compiledLookupCheck| '|factorList|
                                                            (LIST
                                                             (LIST '|List|
                                                                   (LIST
                                                                    '|Record|
                                                                    (LIST '|:|
                                                                          '|flag|
                                                                          (LIST
                                                                           '|Union|
                                                                           '"nil"
                                                                           '"sqfr"
                                                                           '"irred"
                                                                           '"prime"))
                                                                    (LIST '|:|
                                                                          '|factor|
                                                                          (|devaluate|
                                                                           |ups|))
                                                                    (LIST '|:|
                                                                          '|exponent|
                                                                          (LIST
                                                                           '|NonNegativeInteger|))))
                                                             '$)
                                                            (|Factored|
                                                             |ups|)))
                           . #17#)
                     G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |fc| (CAR #6#) . #17#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #5#
                              (SPADCALL
                               (SPADCALL
                                (CONS #'|ALGFACT;fact!4|
                                      (VECTOR $ |newalpha| |sae|))
                                (QVELT |fc| 1)
                                (|compiledLookupCheck| '|map|
                                                       (LIST
                                                        (|devaluate| (ELT $ 6))
                                                        (LIST '|Mapping|
                                                              (LIST
                                                               '|AlgebraicNumber|)
                                                              (|devaluate|
                                                               |sae|))
                                                        (|devaluate| |ups|))
                                                       (|UnivariatePolynomialCategoryFunctions2|
                                                        |sae| |ups|
                                                        (|AlgebraicNumber|)
                                                        (ELT $ 6))))
                               (QVELT |fc| 2) (QREFELT $ 42))
                              . #17#)
                        (COND
                         (#2#
                          (LETT #3# (SPADCALL #3# #5# (QREFELT $ 36)) . #17#))
                         ('T
                          (PROGN
                           (LETT #3# #5# . #17#)
                           (LETT #2# 'T . #17#)))))))
                     (LETT #6# (CDR #6#) . #17#) (GO G190) G191 (EXIT NIL))
                (COND (#2# #3#) (#18# (|spadConstant| $ 37))))
               (QREFELT $ 38))))))))) 

(SDEFUN |ALGFACT;fact!4| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| $)
          (LETT |sae| (QREFELT $$ 2) . #1=(|ALGFACT;fact|))
          (LETT |newalpha| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '$)
                                              |sae|))
             |newalpha| (QREFELT $ 74)))))) 

(SDEFUN |ALGFACT;fact!3| ((|x| NIL) ($$ NIL))
        (PROG (|sae| |newalpha| $)
          (LETT |sae| (QREFELT $$ 2) . #1=(|ALGFACT;fact|))
          (LETT |newalpha| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL |x|
                       (|compiledLookupCheck| '|lift|
                                              (LIST
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (LIST '|AlgebraicNumber|))
                                               '$)
                                              |sae|))
             |newalpha| (QREFELT $ 74)))))) 

(SDEFUN |ALGFACT;fact!2| ((|x| NIL) ($$ NIL))
        (PROG (|newl| $)
          (LETT |newl| (QREFELT $$ 1) . #1=(|ALGFACT;fact|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|ALGFACT;ifactor| |x| |newl| $))))) 

(SDEFUN |ALGFACT;fact!1| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| |q| $ |sae|)
          (LETT |alpha| (QREFELT $$ 3) . #1=(|ALGFACT;fact|))
          (LETT |q| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |sae| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |alpha| |q| (QREFELT $ 72))
                      (|compiledLookupCheck| '|reduce|
                                             (LIST '$
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (LIST '|AlgebraicNumber|)))
                                             |sae|)))))) 

(SDEFUN |ALGFACT;fact!0| ((|x| NIL) ($$ NIL))
        (PROG (|alpha| $)
          (LETT |alpha| (QREFELT $$ 1) . #1=(|ALGFACT;fact|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |alpha| |x| (QREFELT $ 67)))))) 

(DECLAIM (NOTINLINE |AlgFactor;|)) 

(DEFUN |AlgFactor| (#1=#:G166)
  (SPROG NIL
         (PROG (#2=#:G167)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|AlgFactor|)
                                               '|domainEqualList|)
                    . #3=(|AlgFactor|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|AlgFactor;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|AlgFactor|)))))))))) 

(DEFUN |AlgFactor;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgFactor|))
          (LETT |dv$| (LIST '|AlgFactor| DV$1) . #1#)
          (LETT $ (GETREFV 75) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|AlgFactor| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|AlgFactor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 65)
              (|AlgebraicNumber|) (0 . |tower|) (|List| $) (|List| 63)
              (5 . |concat|) (10 . |removeDuplicates|) (|Fraction| (|Integer|))
              (15 . |coerce|) (|Mapping| 8 14)
              (|SparseUnivariatePolynomial| 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 17 8 6) (20 . |map|)
              (26 . |retract|) (|Mapping| 14 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 6 14 17) (31 . |map|)
              (|List| 8) (37 . |coefficients|) (|Factored| 6)
              |ALGFACT;factor;UPF;5| (42 . |concat|) (48 . |removeDuplicates|)
              |ALGFACT;factor;UPLF;6| (53 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 32) (|:| |factor| 6) (|:| |exponent| 40))
              (|List| 33) (58 . |factorList|) (63 . *) (69 . |One|) (73 . *)
              |ALGFACT;split;UPF;7| (|NonNegativeInteger|) (79 . |degree|)
              (84 . |primeFactor|) (90 . |One|) (94 . |One|) (98 . |monomial|)
              (|SparseUnivariatePolynomial| $) (104 . |zeroOf|)
              (109 . |coerce|) (114 . -) (|Union| $ '"failed") (120 . |exquo|)
              (126 . ^) (|Boolean|) |ALGFACT;doublyTransitive?;UPB;9|
              (132 . |size?|) (|Factored| 17) (|RationalFactorize| 17)
              (138 . |factor|) (143 . |unit|)
              (|Record| (|:| |flag| 32) (|:| |factor| 17) (|:| |exponent| 40))
              (|List| 60) (148 . |factorList|) (|Kernel| 8) (153 . |max|)
              (|Kernel| $) (159 . |minPoly|) (164 . =) (|Mapping| 53 63)
              (170 . |remove|) (|SparseUnivariatePolynomial| 8)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 63) 63
                                                     (|Integer|)
                                                     (|SparseMultivariatePolynomial|
                                                      (|Integer|) 63)
                                                     8)
              (176 . |univariate|) (183 . |coerce|) (188 . |elt|))
           '#(|split| 194 |factor| 199 |doublyTransitive?| 210) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 74
                                                 '(1 8 7 0 9 1 11 0 10 12 1 11
                                                   0 0 13 1 8 0 14 15 2 18 6 16
                                                   17 19 1 8 14 0 20 2 22 17 21
                                                   6 23 1 6 24 0 25 2 24 0 0 0
                                                   28 1 24 0 0 29 1 26 6 0 31 1
                                                   26 34 0 35 2 26 0 0 0 36 0
                                                   26 0 37 2 26 0 6 0 38 1 6 40
                                                   0 41 2 26 0 6 40 42 0 6 0 43
                                                   0 8 0 44 2 6 0 8 40 45 1 8 0
                                                   46 47 1 6 0 8 48 2 6 0 0 0
                                                   49 2 6 50 0 0 51 2 26 0 0 40
                                                   52 2 34 53 0 40 55 1 57 56
                                                   17 58 1 56 17 0 59 1 56 61 0
                                                   62 2 63 0 0 0 64 1 8 46 65
                                                   66 2 63 53 0 0 67 2 11 0 68
                                                   0 69 3 71 70 8 63 70 72 1 8
                                                   0 65 73 2 70 8 0 8 74 1 0 26
                                                   6 39 1 0 26 6 27 2 0 26 6 24
                                                   30 1 0 53 6 54)))))
           '|lookupComplete|)) 
